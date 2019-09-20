---
title: "Control Addin Object"
description: "Description of the control addin object type."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Control Add-In Object

 

The control add-in object allows you to add custom functionality to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. A control add-in is a custom control, or visual element, for displaying and modifying data within an iframe or a page. For example, a control add-in can display the content of a webpage, visualize data as a chart or on a map, or host a custom web application. Control add-ins can exchange data with the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] server on various data types and can respond to user interaction to raise events that execute additional AL code.

## Control add-in properties
In the control add-in definition, you must set the `Scripts` property to include scripts in the control add-in. The scripts could be local files in the package or references to external files using the HTTP or the HTTPS protocol. With the `StartupScript` property, you can call a special script that runs when the page you have implemented the control add-in on, is loaded. These settings initialize the control add-in. With the `Images` and `StyleSheet` properties, you can specify additional styling to the control add-in. For more information about some of the control add-in properties, see:
- [Images](properties/devenv-images-property.md)
- [Scripts](properties/devenv-scripts-property.md)
- [StartupScript](properties/devenv-startupscript-property.md)
- [StyleSheets](properties/devenv-stylesheets-property.md)
- [RecreateScript](properties/devenv-recreatescript-property.md)
- [RefreshScript](properties/devenv-refreshscript-property.md)




<!--The layout properties are set to define the size of the control add-in. It is recommended to apply some size to the add-in using these properties. The properties `VerticalStretch` and `HorizontalStretch` determine how the control add-in behaves in the client when the window it is displayed in is resized. The default value is false which means that the control add-in is not resized vertically, or horizontally. The value `true` means that the control add-in is resized vertically, or horizontally. The values set by the `RequestedHeight` and `RequestedWidth` properties determine the minimum resize value of the control add-in. Read more about the sizing of control add-ins in the next section.
-->

## Sizing of the control add-in
Control add-ins can either have fixed dimensions or dynamically adapt to the available space on the screen. By controlling the sizing of an add-in, you can ensure that the add-in and the surrounding content on the page remain optimal on smaller display targets such as the phone or when users resize the browser. The following properties are available for you to specify how the sizing of the control add-in should behave.
<!--To control that the sizing of the control add-in is always optimal, even on smaller display targets, such as the phone, some settings are available when you write the control add-in. The settings make sure that resizing of the control add-in works on all client types. The properties that allow you to obtain this are the following: 


- [VerticalShrink](properties/devenv-verticalshrink-property.md)
- [HorizontalShrink](properties/devenv-horizontalshrink-property.md)
- [MinimumHeight](properties/devenv-minimumheight-property.md)
- [MinimumWidth](properties/devenv-minimumwidth-property.md)
- [MaximumHeight](properties/devenv-maximumheight-property.md)
- [MaximumWidth](properties/devenv-maximumwidth-property.md)
- [VerticalStretch](properties/devenv-verticalstretch-property.md)
- [HorizontalStretch](properties/devenv-horizontalstretch-property.md)
- [RequestedHeight](properties/devenv-requestedheight-property.md)
- [RequestedWidth](properties/devenv-requestedwidth-property.md)
- [Scripts](properties/devenv-scripts-property.md)
- [StyleSheets](properties/devenv-stylesheets-property.md)
- [Images](properties/devenv-images-property.md)
- [StartupScript](properties/devenv-startupscript-property.md)
- [RecreateScript](properties/devenv-recreatescript-property.md)
- [RefreshScript](properties/devenv-refreshscript-property.md)
-->

- [HorizontalShrink](properties/devenv-horizontalshrink-property.md)
- [HorizontalStretch](properties/devenv-horizontalstretch-property.md)
- [MinimumHeight](properties/devenv-minimumheight-property.md)
- [MinimumWidth](properties/devenv-minimumwidth-property.md)
- [MaximumHeight](properties/devenv-maximumheight-property.md)
- [MaximumWidth](properties/devenv-maximumwidth-property.md)
- [RequestedHeight](properties/devenv-requestedheight-property.md)
- [RequestedWidth](properties/devenv-requestedwidth-property.md)
- [VerticalShrink](properties/devenv-verticalshrink-property.md)
- [VerticalStretch](properties/devenv-verticalstretch-property.md)


## Control add-in considerations
Designing control add-ins that provide the best possible experience can require some additional planning, design, and implementation. The following considerations will help you design add-ins that look and feel seamlessly integrated with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].
- Respond to touch events so that mobile users or those on devices supporting touch input can also use the add-in.
- Design content that is responsive and is able to flow, resize, or reorganize naturally based on the available space.
- Consider the accessibility needs of users, for example by implementing keyboard access and support for screen readers.
- Use the Style guidelines to apply a choice of colors, typefaces, and font sizes that match that of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For more information, see [Control Add-in Style Guide](devenv-control-addin-style.md).
- Provide language translation and other localizations that match the current user language in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].


## Control add-in syntax example
The following control add-in example syntax defines a chart that can show how customers are represented per country on a map. The control add-in is implemented as a `usercontrol` on a page called **CustomersMapPage**.

```
// The controladdin type declares the new add-in.

controladdin CustomersPerCountryChart
{
    // The Scripts property can reference both external and local scripts.
    Scripts = 'https://code.jquery.com/jquery-2.1.0.min.js',
              'js/main.js';

    // The StartupScript is a special script that the webclient calls once the page is loaded.
    StartupScript = 'js/chart.js';

    // Images and StyleSheets can be referenced in a similar fashion.

    // The layout properties define how control add-in are displayed on the page.
    VerticalShrink = true;

    // The procedure declarations specify what JavaScript methods could be called from AL.
    // In JavaScript code, there should be a global function LoadData(data) {}
    procedure LoadData(Data : JsonArray);

    // The event declarations specify what callbacks could be raised from JavaScript by using the webclient API:
    // Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CountryClicked', [{country: 'M}])
    event CountryClicked(Country: JsonObject);
}

page 50100 CustomersMapPage
{
    layout
    {
        area(Content)
        {
            // The control add-in can be placed on the page using usercontrol keyword.

            usercontrol(ControlName; CustomersPerCountryChart)
            {
                // The control add-in events can be handled by defining a trigger with a corresponding name.

                trigger CountryClicked(Country : JsonObject)
                var 
                    Data : JsonArray;
                begin
                    // The control add-in methods can be invoked via a reference to the usercontrol.

                    Data := CustomersPerCountryToJson();
                    CurrPage.ControlName.LoadData(Data);
                end;
            }
        }
    }

    // Coverts the CustomerPerCountryQuery query into a JsonArray data type.
    local procedure CustomersPerCountryToJson() Result: JsonArray
    var
        CustomersQuery: query CustomersPerCountryQuery;
        JObject: JsonObject;
    begin
        CustomersQuery.Open();
        while CustomersQuery.Read() do begin
            JObject := QueryRecordToJson(CustomersQuery);
            Result.Add(JObject);
        end;
    end;
    
    // Converts a CustomersPerCountryQuery row into a JsonObject data type.
    local procedure QueryRecordToJson(var Q: Query CustomersPerCountryQuery) Result: JsonObject
    begin
        Result.Add('code', Q.CountryRegionCode);
        Result.Add('value', Q.CustomerCount);
    end;
}

// The query retrieves the different country/region codes that appear in the Customer table and their number of occurrences.
query 50101 CustomersPerCountryQuery
{
    elements
    {
        dataitem(Customer; Customer)
        {
            column(CountryRegionCode; "Country/Region Code") { }
            column(CustomerCount)
            {
                Method = Count;
            }
        }
    }
}

```

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Asynchronous Considerations for Control Add-ins](devenv-control-addin-asynchronous-considerations.md)  
[InvokeExtensibility Method](methods/devenv-invokeextensibility-method.md)  
[GetImageResource Method](methods/devenv-getimageresource-method.md)  
[GetEnvironment Method](methods/devenv-getenvironment-method.md)  
[Pages Overview](devenv-pages-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Customization Object](devenv-page-customization-object.md)
