---
title: "Manifest Overview"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 939606f2-3092-4f14-9faf-c99a3499a58d
caps.latest.revision: 17
---
# Manifest Overview
For a control add-in to work on all display targets there has to be a manifest. The manifest contains a declarative description of the control add-in and is written in XML. The manifest is added together with any resource files in a .zip file and registered with the control add-in resources in the **Client Add-in** page. This topic explains the structure of a manifest by using an example of the manifest for the Bing Maps control add-in. For more information about the implementation of the Bing Maps control add-in, see [Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md).  

## Example of a Manifest  
 The syntax of a manifest file is illustrated in the following example. All elements inside the `<manifest>` element are optional.
 
 <!-- Inside the `<Manifest>` element, the `<ScriptUrls>` element references other JavaScripts from the manifest. In this case the `<ScriptUrls>` element points to online map controls. The `<StyleSheetUrls>` element contains references to style sheets from external web sites.
 Inside the `<Resources>` element, all of the resources such as the script, style sheet, and images that are required to display the Bing Maps control add-in are listed.  

 The `<Script>` element contains the actual initialization code for the control add-in. The code must be written inside a `<![CDATA[.]]>` element to be parsed as code. The `Microsoft.Dynamics.NAV.InvokeExtensibilityMethod` is described in more detail in the reference documentation. For more information, see [InvokeExtensibilityMethod Method](InvokeExtensibilityMethod-Method.md).  

 The `<RefreshScript>` element is used for refreshing the control add-in when the user refreshes the page using F5 or if the [RefreshOnActivate](RefreshOnActivate-Property.md) is called from code.

 Inside the `<Manifest>` element, at the end of the script, the `<RequestedHeight>` and the `<RequestedWidth>` elements are set to definite sizes. It is recommended to apply some size to the add-in using these elements. The properties `<VerticalStretch>` and `<HorizontalStretch>` determine how the control add-in behaves in the client when the window it is displayed in is resized. The default value is **false** which means that the control add-in is not resized vertically, or horizontally. The value **true** means that the control add-in is resized vertically, or horizontally. The values in `<RequestedHeight>` and `<RequestedWidth>` determine the minimum resize value of the control add-in.  -->

```  
<?xml version="1.0" encoding="utf-8"?>  
<Manifest>  
    <Resources>  
        <Image>PushpinBlue.png</Image>  
        <Image>PushpinGreen.png</Image>  
        <Image>PushpinRed.png</Image>  
        <Script>Script.js</Script>  
        <StyleSheet>StyleSheet.css</StyleSheet>  
    </Resources>  

    <ScriptUrls>  
        <ScriptUrl>https://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.3</ScriptUrl>  
    </ScriptUrls>  

    <StyleSheetUrls>
        <StyleSheetUrl>https://www.microsoft.com/stylesheets/colors.css</StyleSheetUrl>
    </StyleSheetUrls>

    <Script>  
        <![CDATA[  
            InitializeMap('controlAddIn');  
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', null);  
        ]]>  
    </Script>  

    <RefreshScript>
        <![CDATA[
             Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Refresh', null);
        ]]>
    </RefreshScript>

    <RecreateScript>
        <![CDATA[
             Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Recreate', null);
        ]]>
    </RecreateScript>

    <RequestedHeight>300</RequestedHeight>  
    <RequestedWidth>700</RequestedWidth>  

    <MinimumHeight>200</MinimumHeight>  
    <MinimumWidth>400</MinimumWidth>  

    <MaximumHeight>800</MaximumHeight>  
    <MaximumWidth>1000</MaximumWidth>  

    <VerticalStretch>true</VerticalStretch>  
    <HorizontalStretch>true</HorizontalStretch>  

    <VerticalShrink>true</VerticalShrink>  
    <HorizontalShrink>true</HorizontalShrink> 

    <AllowCaption>false</AllowCaption>
</Manifest>  

```  

### Manifest elements overview
|  Element   |  Description  |
|--------|---------------|
|`<Resources>`|Contains all of the resources such as the script, style sheet, and images that are required to display the Bing Maps control add-in. Each resource is included in a child element, such as `<script>`, `<stylesheet>`, and `<image>`. |
|`<ScriptUrls>`| Includes references to other JavaScripts from the manifest. In this case the `<ScriptUrls>` element points to online map controls.|
| `<StyleSheetUrls>`| Contains references to style sheets from external web sites.|
|`<Script>`|Contains the actual initialization code for the control add-in. The code must be written inside a `<![CDATA[.]]>` element to be parsed as code. The `Microsoft.Dynamics.NAV.InvokeExtensibilityMethod` is described in more detail in the reference documentation. For more information, see [InvokeExtensibilityMethod Method](InvokeExtensibilityMethod-Method.md).  |
| `<RefreshScript>`| Used for refreshing the control add-in when the user refreshes the page by using F5 or if the [RefreshOnActivate](RefreshOnActivate-Property.md) is property is set on the page.|
| `<RecreateScript>`| Used for reloading the control add-in script in following instances:<ul><li>In a FastTab, when the user selects **Show More** or **Show Less**. Applies to the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] only.</li><li>In Designer, when the user switches the display target. Applies to the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] only.</li></ul>If this element is not defined, then the `<Script>` elememt is used. This element only pertains to the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)].|
|`<RequestedHeight>` and `<RequestedWidth>`|Determine the minimum resize value of the control add-in. These are set to definite sizes. It is recommended to apply some size to the add-in using these elements.|
| `<VerticalStretch>` and `<HorizontalStretch>`| Determine how the control add-in behaves in the client when the window it is displayed in is resized. The default value is **false** which means that the control add-in is not resized vertically, or horizontally. The value **true** means that the control add-in is resized vertically, or horizontally. |
|`<VerticalShrink>` and `<HorizontalShrink>`  | Specifies that the control add-in can be made smaller vertically and horizontally. |
|`<AllowCaption>`|Specifies whether to display the caption that is specified by the [CaptionML Property](CaptionML-Property.md) of the page field control that the control add-in uses.<br /><br />Set to `true` to display the caption; `false` to not display the caption, in which case the control add-in will use all the available space. `false` is the default setting.<br /><br />The caption will only display if the [ShowCaption property](ShowCaption-Property.md) of the field control is set to `Yes` (`true`).|

## Script Code in a Separate File  
 Code that is called from C/AL code must be put in a separate file under the *\\Script* folder. The code below is called from the manifest file and initializes and loads the map.  

```  
var map = null;  

    function InitializeMap(controlId) {  
        map = new VEMap(controlId);  
        map.HideScalebar();  
        map.onLoadMap = function () {  
            Microsoft.Dynamics.NAV.InvokeExtensiblityMethod('MapLoaded', null);  
        };  
    }  

    function LoadMap(latitude, longiture) {  
        var mapOptions = new VEMapOptions();  
        mapOptions.DashboardColor = "black";  
        mapOptions.EnableSearchLogo = false;  

        map.LoadMap(  
            new VELatLong(latitude, longiture), // Center  
            1,                                  // Zoom level 1-19  
            VEMapStyle.Birdseye,                // Map style  
            false,                              // Fixed map  
            VEMapMode.Mode2D,                   // Map mode  
            true,                               // Map mode switch  
            0,                                  // Tile buffer  
            mapOptions                          // Options  
        );  
    }          

    function ShowMiniMap(show) {  
        if (show)  
            map.ShowMiniMap();  
        else  
            map.HideMiniMap();  
    }  

    function ShowPushpin(title, imageName) {  
        map.Clear();   

        if (title != '') {  
            var point = map.GetCenter();  
            var pushpin = map.AddPushpin(point);  
            pushpin.SetTitle(title);  
        }  
    }  
```  

## Control Add-in HTML Element  
 When the control add-in is loaded into the Web browser one HTML element is provided for the control add-in to host its content. This HTML element is a DIV element and it is always named `controlAddIn`.  

```  
<div id='controlAddIn'>  
    control add-in script code can add content here...  
</div>  
```  

 The following is an example of the script code for a control add-in  

```  
function initializeControlAddIn() {  
    var controlAddIn = document.getElementById('controlAddIn');  
    controlAddIn.innerHTML = "Hello World";  
}  

```  

### Sizing the Control Add-in  
 To control that the sizing of the control add-in always is optimal, even on smaller display targets, such as the phone, some settings are available when you write the manifest code. The settings make sure that resizing of the control add-in works on all client types.  

 `VerticalShrink` specifies that the control add-in can be made smaller vertically. This setting is optional.  

```  
bool VerticalShrink()  
```  

 `HorizontalShrink` specifies that the control add-in can be made smaller horizontally. This setting is optional.  

```  
bool HorizontalShrink()  
```  

 `MinimumHeight` specifies the minimum height that the control add-in can be shrunk to. This setting only applies if the `VerticalShrink` setting is specified.  

```  
int MinimumHeight()  
```  

 `MinimumWidth` specifies the minimum width that the control add-in can be shrunk to. This setting only applies if the `HorizontalShrink` setting is specified.  

```  
int MinimumWidth()  
```  

 `MaximumHeight` specifies the maximum height that the control add-in can be stretched to. This setting only applies if the `VerticalStretch` setting is specified.  

```  
int MaximumHeight()  
```  

 `MaximumWidth` specifies the maximum width that the control add-in can be stretched to. This setting only applies if the `HorizontalStretch` setting is specified.  

```  
int MaximumWidth()  
```  

 `VerticalStretch` specifies that the control add-in can be made larger vertically. This setting is optional.  

```  
bool VerticalStretch()  
```  

 `HorizontalStretch` specifies that the control add-in can be made larger horizontally. This setting is optional.  

```  
bool HorizontalStretch()   
```  

 `RequestedHeight` specifies the initial height of the control add-in.  

```  
int RequestedHeight()  
```  

 `RequestedWidth` specifies the initial width of the control add-in.  

```  
int RequestedWidth()  
```  

### Resource Files  
 The resource files can be described in the manifest file with or without a relative path; [!INCLUDE[navnow](includes/navnow_md.md)] supports both.  

 In the following example the files are described by using their file name only:  

```  
<Resources>  
    <Image>Blue.png</Image>  
    <Script>Script.js</Script>  
    <StyleSheet>StyleSheet.css</StyleSheet>  
</Resources>  

```  

 To support the example earlier in this section, the resource files must be located in subfolders in the control add-in .zip file by using the following names:  

|Resource File Type|Resource Name|Subfolder Name|  
|------------------------|-------------------|--------------------|  
|Image file|Blue.png|Image/Blue.png|  
|Script file|Script.js|Script/Script.js|  
|Style sheet file|StyleSheet.css|StyleSheet/StyleSheet.css|  

 In the next example the resource files are described using a relative path in the manifest file:  

```  
<Resources>  
    <Image>Images/Pushpins/Blue.png</Image>  
    <Script>Scripts/Script.js</Script>  
    <StyleSheet>StyleSheets/StyleSheet.css</StyleSheet>  
</Resources>  

```  

 To support this example, the resource files must be located in subfolders with the name of the relative path in the control add-in .zip file:  

|Resource File Type|Resource Name|Subfolder Name|  
|------------------------|-------------------|--------------------|  
|Image file|Images/Pushpins/Blue.png|Images/Pushpins/Blue.png|  
|Script file|Scripts/Script.css|Scripts/Script.css|  
|Style sheet file|StyleSheets/StyleSheet.css|StyleSheets/StyleSheet.css|  

## See Also  
 [Extending Microsoft Dynamics NAV Using Control Add-ins](Extending-Microsoft-Dynamics-NAV-Using-Control-Add-ins.md)   
 [Extending the Windows Client Using Control Add-ins](Extending-the-Windows-Client-Using-Control-Add-ins.md)   
 [Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md)   
 [Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md)
