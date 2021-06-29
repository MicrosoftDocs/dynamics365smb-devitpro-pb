---
title: "Implementing Location in AL"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: blrobl
---

# Implementing Location in AL
You can access the location information of a device from the [!INCLUDE[webclient](includes/webclient.md)] in the browser and from the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]. This functionality could be useful in scenarios such as calculating routes from the current location or planning the next round of customer visits based on their addresses.

You can also add access to location information to a specific page from the [!INCLUDE[d365_dev_short_md](includes/d365_dev_short_md.md)].
For a [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] existing implementation of this, see the `Show On Map` link on the `Customer Card`, which displays a map that shows where your customer is located based on the GPS coordinates and gives directions to reach its location. 

> [!IMPORTANT]  
> Location information is only available on devices that are able to obtain location coordinates, such as using GPS capabilities. 

## Example
This example illustrates how to implement the location capability on a page in AL. The example implements a **GetLocation** action on a page that returns the coordinates of the current customer's address, but does not save this information to the database. 

The example also shows how to specify options for the location functionality such as setting a timeout or enabling high accuracy. For more information about the different options that can be set for location, see [LocationOptions Overview](devenv-location-options.md). 

> [!NOTE]
> To enable the location functionality, it is required that you add the path of the folder containing the `"Microsoft.Dynamics.Nav.ClientExtensions"` assembly on the **Al: Assembly Probing Paths** setting on the **User Settings** or **Workspace Settings** so the compiler can access it. For more information, see [Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md).

The following code will create two variables; the `LocationAvailable` variable is a **Boolean** that checks whether the current device has location capabilities. The `Location` variable is a **DotNet** type that gets instantiated by adding code to the `OnOpenPage` trigger. Then, it will add an action to the page that lets the user retrieve the location information. Finally, the trigger `Location::LocationChanged` is defined to handle the incoming location information.  


```AL
page 50101 "Card with Location Capability"
{

    Caption = 'Card Page';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Test Table";

    layout
    {
        area(content)
        {
            //...
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetLocation)
            {
                Visible = LocationAvailable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Map;

                trigger OnAction()
                begin
                    LocationOptions := LocationOptions.LocationOptions;
                    LocationOptions.EnableHighAccuracy();
                    Location.RequestLocationAsync();
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        if Location.IsAvailable() then begin
            Location := Location.Create();
            LocationAvailable := true;
        end;
    end;

    trigger Location::LocationChanged(Location: DotNet Location)
    begin
        // Location.Status can be: 
        //      0 = Available 
        //      1 = NoData (no data could be obtained)
        //      2 = TimedOut (location information not obtained in due time)
        //      3 = NotAvailable (for example user denied app access to location)
        if Location.Status = 0 then
            Message('Your position: %1 %2', Location.Coordinate.Latitude, Location.Coordinate.Longitude)
        else
            Message('Position not available');
    end;

    var
        [RunOnClient]
        [WithEvents]
        Location: DotNet LocationProvider;
        LocationAvailable: Boolean;
        LocationOptions: DotNet UT_LocationOptions;
}

dotnet
{
    assembly("Microsoft.Dynamics.Nav.ClientExtensions")
    {

        type("Microsoft.Dynamics.Nav.Client.Capabilities.LocationProvider"; LocationProvider)
        {

        }

        type("Microsoft.Dynamics.Nav.Client.Capabilities.Location"; Location)
        {

        }

        type("Microsoft.Dynamics.Nav.Client.Capabilities.LocationOptions"; UT_LocationOptions)
        {

        }
    }
}
``` 

For information about troubleshooting access to location information, see [Troubleshooting: Camera and Location](/dynamics365/business-central/ui-troubleshooting-camera-location).

## See Also  
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
 [LocationOptions Overview](devenv-location-options.md)   
 [Troubleshooting: Camera and Location](/dynamics365/business-central/ui-troubleshooting-camera-location)  
 [Implementing the Camera in AL](devenv-implement-camera-al.md)    
 [RunOnClient property](./properties/devenv-properties.md)  
 [WithEvents property](./properties/devenv-properties.md)  
 <!--
 [Developing for the Business Central Mobile App](devenv-developing-for-the-business-central-mobile-app.md)   
 [Differences and Limitations When Developing Pages for the Business Central Mobile App](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md)-->