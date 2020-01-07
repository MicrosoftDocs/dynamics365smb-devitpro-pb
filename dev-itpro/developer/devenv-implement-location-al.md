---
title: "Implementing Location in AL"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---
# Implementing Location in AL
This example illustrates how you can retrieve location information. The example implements a **GetLocation** action on the `Customer Card` page that returns the GPS coordinates of the current customers address. It does not save this information to the database. Scenarios in which this functionality could be useful would be displaying a map that shows where your customer is located based on the GPS coordinates. Or, functionality to plan the next round of customer visits based on the addresses of your customers.  

> [!IMPORTANT]  
>  The location information is only available on devices that run the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] and have GPS capabilities. This means that location information is not available from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or from a browser.  

The following example requires that you add the path of the folder containing the `"Microsoft.Dynamics.Nav.ClientExtensions"` assembly on the **Al: Assembly Probing Paths** setting on the **User Settings** or **Workspace Settings** so the compiler can access it. For more information, see [Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md).

```
pageextension 50101 CustomerCardExtension extends "Customer Card"
{
    actions
    {
        addafter("&Customer")
        {
            action(GetLocation)
            {
                Visible = LocationAvailable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Camera;

                trigger OnAction()
                begin
                    LocationProvider.RequestLocationAsync();
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        if LocationProvider.IsAvailable() then
            LocationProvider := LocationProvider.Create();
        LocationAvailable := true;
    end;

    trigger LocationProvider::LocationChanged(Location: DotNet Location)
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
        LocationProvider: DotNet LocationProvider;
        LocationAvailable: Boolean;
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
    }
}

``` 

You can now test the modified `Customer Card` page in the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] from either a tablet or a phone with GPS capabilities.  

## See Also  
 [LocationOptions Overview](devenv-location-options.md)   
 [Implementing the Camera in AL](devenv-implement-camera-al.md)    
 [Developing for the Business Central Universal App](devenv-developing-for-the-business-central-universal-app.md)   
 [Differences and Limitations When Developing Pages for the Business Central Universal App](devenv-differences-and-limitations-developing-pages-business-central-universal-app.md)
