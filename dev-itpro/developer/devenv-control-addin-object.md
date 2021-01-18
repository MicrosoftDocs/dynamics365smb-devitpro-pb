---
title: "Control Addin Object"
description: "Description of the control addin object type."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
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

The control add-in object allows you to add custom functionality to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. A control add-in is a custom control, or visual element, for displaying and modifying data within an iframe or a page. For example, a control add-in can display the content of a webpage, visualize data as a chart or on a map, or host a custom web application. Control add-ins can exchange data with the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] server on various data types and respond to user interaction to raise events that execute additional AL code.

## Control add-in properties
In the control add-in definition, you must set the `Scripts` property to include scripts in the control add-in. The scripts could be local files in the package or references to external files using the HTTP or the HTTPS protocol. With the `StartupScript` property, you can call a special script that runs when the page you've implemented the control add-in on, is loaded. These settings initialize the control add-in. With the `Images` and `StyleSheet` properties, you can specify additional styling to the control add-in. For more information about some of the control add-in properties, see:
- [Images](properties/devenv-images-property.md)
- [Scripts](properties/devenv-scripts-property.md)
- [StartupScript](properties/devenv-startupscript-property.md)
- [StyleSheets](properties/devenv-stylesheets-property.md)
- [RecreateScript](properties/devenv-recreatescript-property.md)
- [RefreshScript](properties/devenv-refreshscript-property.md)




<!--The layout properties are set to define the size of the control add-in. It is recommended to apply some size to the add-in using these properties. The properties `VerticalStretch` and `HorizontalStretch` determine how the control add-in behaves in the client when the window it is displayed in is resized. The default value is false which means that the control add-in is not resized vertically, or horizontally. The value `true` means that the control add-in is resized vertically, or horizontally. The values set by the `RequestedHeight` and `RequestedWidth` properties determine the minimum resize value of the control add-in. Read more about the sizing of control add-ins in the next section.
-->

## Sizing of the control add-in

Control add-ins can either have fixed dimensions or dynamically adapt to the available space on the screen. By controlling the sizing of an add-in, you ensure the add-in and the surrounding content on the page remain optimal on smaller display targets such as the phone or when users resize the browser. The following properties are available for you to specify how the sizing of the control add-in should behave.
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


## Control add-in considerations and limitations

Designing control add-ins that provide the best possible experience can require some additional planning, design, and implementation. The following considerations and limitations will help you design add-ins that look and feel seamlessly integrated with both [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] online and on-premises. 

- Respond to touch events so that mobile users or users on devices supporting touch input can also use the add-in.
- Design content that is responsive and can flow, resize, or reorganize naturally based on the available space.
- Consider the accessibility needs of users, for example by implementing keyboard access and support for screen readers.
- Use the Style guidelines to apply a choice of colors, typefaces, and font sizes that match that of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For more information, see [Control Add-in Style Guide](devenv-control-addin-style.md).
- Provide language translation and other localizations that match the current user language in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].
- In extensions for Business Central online, don't reference font files in stylesheets, because the fonts won't display in client. Instead, do one of the following:

  - Reference the font files from some other source such as a public or private CDN.
  - Base64 encode the fonts and include the encoded fonts in the CSS file.

## Control add-in syntax example
The following control add-in syntax shows how to implement small customizations of the layout and functionality of a page.

```
// The controladdin type declares the new add-in.
controladdin SampleAddIn
{
    // The Scripts property can reference both external and local scripts.
    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.2/knockout-debug.js',
                'main.js';
    // The StartupScript is a special script that the web client calls once the page is loaded.
    StartupScript = 'startup.js';

    // Specifies the StyleSheets that are included in the control add-in.
    StyleSheets = 'skin.css';

    // Specifies the Images that are included in the control add-in.
    Images = 'image.png';

    // The procedure declarations specify what JavaScript methods could be called from AL.
    // In main.js code, there should be a global function CallJavaScript(i,s,d,c) {Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CallBack', [i, s, d, c]);}
    procedure CallJavaScript(i: integer; s: text; d: decimal; c: char);

    // The event declarations specify what callbacks could be raised from JavaScript by using the webclient API:
    // Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CallBack', [42, 'some text', 5.8, 'c'])
    event Callback(i: integer; s: text; d: decimal; c: char);
}
```

The `controladdin` object is then invoked as a `usercontrol` on a page called **PageWithAddIn**. 

```
page 50130 PageWithAddIn
{
    layout
    {
        area(Content)
        {
             // The control add-in can be placed on the page using usercontrol keyword.
            usercontrol(ControlName; SampleAddIn)
            {

                ApplicationArea = All;

                 // The control add-in events can be handled by defining a trigger with a corresponding name.
                trigger Callback(i: integer; s: text; d: decimal; c: char)
                begin
                    Message('Got from js: %1, %2, %3, %4', i, s, d, c);
                end;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(CallJavaScript)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    
                    // The control add-in methods can be invoked via a reference to the usercontrol.
                    CurrPage.ControlName.CallJavaScript(5, 'text', 6.3, 'c');
                end;
            }
        }
    }
}
```

## Loading static resources using AJAX requests

You can design a control add-in to load static resources from the add-in package by using AJAX requests. For example, the control add-in could load HTML content and inject it into add-in's HTML structure. In this case, you must use the `withCrendentials` property set to `true` in the AJAX request. Otherwise, the request won't contain the necessary context and important cookies required by the [!INCLUDE[prod_short](includes/prod_short.md)] service, and it may fail in production. This concept is illustrated in the following examples.

Wrong:

```javascript
$.get(url).done(function(response) { } );
```

Correct:

```javascript
$.ajax({
     url: url,
     xhrFields: {
          withCredentials: true
    }
)).done(function(data) {
    $("#controlAddIn).text(data);
});
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
