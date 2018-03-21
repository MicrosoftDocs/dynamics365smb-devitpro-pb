---
title: "Control Addin Object"
description: "Description of the control addin object type."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Control Add-In Object
The control add-in object allows you to add custom functionality to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. A control add-in is a custom control, or visual element, for displaying and modifying data on pages. Control add-ins can exchange data with the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] server on various data types and can respond to user interaction to raise events that execute additional AL code.

## Control add-in properties
In the control add-in definition, you must set the `Scripts` property to include scripts in the control add-in. The scripts could be local files in the package or references to external files using the HTTP or the HTTPS protocol. With the `StartupScript` property, you can call a special script that runs when the page you have implemented the control add-in on, is loaded. These settings initialize the control add-in.

With the `Images` and `StyleSheet` properties, you can specify additional styling to the control add-in. The layout properties are set to define the size of the control add-in. It is recommended to apply some size to the add-in using these properties. The properties `VerticalStretch` and `HorizontalStretch` determine how the control add-in behaves in the client when the window it is displayed in is resized. The default value is false which means that the control add-in is not resized vertically, or horizontally. The value `true` means that the control add-in is resized vertically, or horizontally. The values set by the `RequestedHeight` and `RequestedWidth` properties determine the minimum resize value of the control add-in. Read more about the sizing of control add-ins in the next section.

### Sizing of the control add-in
To control that the sizing of the control add-in is always optimal, even on smaller display targets, such as the phone, some settings are available when you write the control add-in. The settings make sure that resizing of the control add-in works on all client types.

|Property       |Value type|Description|
|---------------|----------|-----------|
|`VerticalShrink`|Boolean|Specifies that the control add-in can be made smaller vertically. This setting is optional.|
|`HorizontalShrink`|Boolean|Specifies that the control add-in can be made smaller horizontally. This setting is optional.|
|`MinimumHeight`|Integer|Specifies the minimum height that the control add-in can be shrunk to. This setting only applies if the `VerticalShrink` setting is specified.|
|`MinimumWidth`|Integer|Specifies the minimum width that the control add-in can be shrunk to. This setting only applies if the `HorizontalShrink` setting is specified.|
|`MaximumHeight`|Integer|Specifies the maximum height that the control add-in can be stretched to. This setting only applies if the `VerticalStretch` setting is specified.|
|`MaximumWidth`|Integer|Specifies the maximum width that the control add-in can be stretched to. This setting only applies if the `HorizontalStretch` setting is specified.|
|`VerticalStretch`|Boolean|Specifies that the control add-in can be made larger vertically. This setting is optional.|
|`HorizontalStretch`|Boolean|Specifies that the control add-in can be made larger horizontally. This setting is optional.|
|`RequestedHeight`|Integer|Specifies the initial height of the control add-in.|
|`RequestedWidth`|Integer|Specifies the initial width of the control add-in.|

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
                var Data : JsonArray;
                begin

                    // The control add-in methods can be invoked via a reference to the usercontrol.

                    CurrPage.ControlName.LoadData(Data);
                end;                  
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
