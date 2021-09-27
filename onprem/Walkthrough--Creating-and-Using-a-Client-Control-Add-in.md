---
title: "Walkthrough: Creating and Using a Client Control Add-in"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 758fd34e-e77d-4d35-bea9-7dcef8f7ea40
ms.author: jswmer
caps.latest.revision: 27
---
# Walkthrough: Creating and Using a Client Control Add-in
This walkthrough demonstrates how to create a [!INCLUDE[navnow](includes/navnow_md.md)] control add-in and use it on a [!INCLUDE[navnow](includes/navnow_md.md)] page. A client control add-in enables you to add custom functionality to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)] by creating a control add-in that can run on both client platforms.  

> [!IMPORTANT]  
>  This walkthrough addresses the [!INCLUDE[navnow](includes/navnow_md.md)] implementation of extensibility. This makes it possible to write control add-ins for all display targets. For information about how to write control add-ins specifically for [!INCLUDE[nav_windows](includes/nav_windows_md.md)], see [Extending the Windows Client Using Control Add-ins](Extending-the-Windows-Client-Using-Control-Add-ins.md).  

In a typical business scenario, developers create control add-ins using Microsoft Visual Studio Express, or Visual Studio. Implementers of [!INCLUDE[navnow](includes/navnow_md.md)] solutions then use the control add-ins on [!INCLUDE[navnow](includes/navnow_md.md)] client pages, such as the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)], or the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].  

## Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnow](includes/navnow_md.md)] with a developer license. For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

-   [!INCLUDE[demolong](includes/demolong_md.md)].  

-   Microsoft Visual Studio Express or Microsoft Visual Studio.  

-   Microsoft .NET Strong Name Utility \(sn.exe\). This is included with Windows SDKs.  

-   Experience using Visual Studio.

- Bing Maps account and key. For information, see the following:

    [Creating a Bing Maps Account](https://msdn.microsoft.com/library/gg650598.aspx)
    
    [Getting a Bing Maps Key](https://msdn.microsoft.com/library/ff428642.aspx)

-   (Optional) Create three image files that can be used for pushpins that mark certain locations on the map. This walkthrough uses three pushpin images, which ar called PushpinBlue.png, PushpinGreen.png, and PushpinRed.png. You can create you own images from scratch or from the images in the following table.

    |PushpinBlue.png|PushpinGreen.png|PushpinRed.png|
    |:------:|:------:|:----:|
    |![Pushpin Blue](media/PushpinBlue.png "Pushpin Blue")  |![Pushpin Green](media/PushpinGreen.png "Pushpin Green")|![Pushpin Blue](media/PushpinRed.png "Pushpin Red")|

-   (Optional) Create a style sheet, for example Style.css, that can be used for styling the map in the client.


## Story  
 Simon is a software developer working for [!INCLUDE[demoname](includes/demoname_md.md)] He has been told that the users of the [!INCLUDE[nav_web](includes/nav_web_md.md)] want to see Bing Maps displayed on the Web client. He wants to use the client extensibility framework to test how to do this on a separate page first.  

## Creating a Control Add-in With Visual Studio  
 [!INCLUDE[navnow](includes/navnow_md.md)] includes the Microsoft.Dynamics.Framework.UI.Extensibility.dll assembly that defines the model for creating [!INCLUDE[navnow](includes/navnow_md.md)] control add-ins. The [!INCLUDE[navnow](includes/navnow_md.md)] API provides the binding mechanism between the [!INCLUDE[navnow](includes/navnow_md.md)] control add-in and the [!INCLUDE[navnow](includes/navnow_md.md)] framework.  

### To create the control add-in  

1.  In Visual Studio, on the **File** menu, choose **New**, and then choose **Project**.  

2.  Under **Installed**, choose **Visual C\#**, and then choose **Class Library** (.NET Framework).  

3.  In the **Solution Name** text box, enter the name of your solution. For example, you can enter **BingMapsControlAddIn** and then choose the **OK** button.  

4.  Add a reference to the assembly `Microsoft.Dynamics.Framework.UI.Extensibility.dll`. 

    1.  In Solution Explorer, right-click your project, and then choose **Add > Reference**.  

    2.  In the **Add Reference** window, choose **Browse**, navigate to the location of the `Microsoft.Dynamics.Framework.UI.Extensibility.dll` assembly on your computer, and then choose the **OK** button. By default, the path of the assembly is [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client.  

    3.  Open the Class1.cs file and add the following **using** directive.  

        ```  
        using Microsoft.Dynamics.Framework.UI.Extensibility;  
        ```  

8.  In the BingMapsControlAddIn namespace, add the following code to declare a new interface named **BingMapsControlAddIn**.  

    ```  
    {  
        [ControlAddInExport("BingMapsControl")]  
        public interface IBingMapsControlAddIn  
        {  
            [ApplicationVisible]
            event ApplicationEventHandler ControlAddInReady;

            [ApplicationVisible]
            void LoadMap(double latitude, double longitude);

            [ApplicationVisible]
            void ShowPushpin(string title, string imageName);
        }  
    }  

    ```  

You will use the name `BingMapsControl` later in the walkthrough when you register the control add-in in [!INCLUDE[navnow](includes/navnow_md.md)].  

The assembly must now be signed to be used with [!INCLUDE[navnow](includes/navnow_md.md)]. The next steps will discuss how to sign the assembly.  

### To sign the assembly  

1.  In Visual Studio, on the **Project** menu, choose **BingMapsControlAddIn** properties.  

2.  In the **Properties** window, choose **Signing**, and then select the **Sign the assembly** check box.  

3.  In the **Choose a strong name key file** drop-down list, select **\<New...\>**.  

4.  In the **Key file name** text box, enter **BingMapsControlAddIn**, and then clear the **Protect my key file with a password** check box.  

5.  Choose the **OK** button.  

6.  In Solution Explorer, notice the BingMapsControlAddIn.snk file that is added in Solution Explorer.  

7.  On the **Build** menu, choose **Build \<Your Solution>** to build the project. Verify that the build succeeds.  

## Copying the Control Add-in Assembly to the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]  
After you build the control add-in, you copy the output assembly file to the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].

### To copy the control add-in assembly to [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]  

1.  In the control add-in project’s output folder, locate and copy the control add-in assembly file \(.dll\) file, for example BingMapsControlAddIn.dll.

    The .dll is located in the *bin\Debug*folder. By default, the full folder path is *C:\\Documents\\MyDocuments\\Visual Studio\\Projects\\\[Your Addin Project\]\\\[Your Class Library\]\\bin\\Debug*.  
 
2.  On the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], paste the assembly in the **Add-ins** folder.  

     By default, this folder is *[!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins*.  

## Creating the Manifest File  
After you create an interface in Visual Studio that exposes a number of properties for the BingMapsControlAddIn, you must create a manifest file. A manifest file is written in XML and contains information such as where to look for resource files, references to external JavaScripts, and the size of the control add-in. For more information, see [Manifest Overview](Manifest-Overview.md). In the next steps, you will create a manifest file that loads a BingMaps control and register this manifest in the **Client Add-in** page.  

### To create the manifest file  

1.  Copy this sample manifest and paste it into any text editor.  

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
            <ScriptUrl>https://www.bing.com/api/maps/mapcontrol</ScriptUrl>
        </ScriptUrls>
    
        <Script>
            <![CDATA[Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', null);]]>
        </Script>
    
        <RequestedHeight>500</RequestedHeight>
        <RequestedWidth>500</RequestedWidth>
        <VerticalStretch>true</VerticalStretch>
        <HorizontalStretch>true</HorizontalStretch>
    </Manifest>
    ```  

    >[!NOTE]
    > If you do not have images or a style sheet, leave the `<image>` and `<StyleSheet>` elements blank.
2.  Save the manifest to a file in same folder that the assembly is saved in (the **Add-ins** folder).  

     Name the manifest **Manifest** and make sure to add the .xml extension to the file, so that the file name will now be **Manifest.xml**.  

The next step is to create a JavaScript file containing code that calls C/AL in [!INCLUDE[navnow](includes/navnow_md.md)].  

## Creating a JavaScript File  
 Now you must create a JavaScript file to hold all of the code that calls C/AL in [!INCLUDE[navnow](includes/navnow_md.md)].  

#### To create the JavaScript file  

1.  Copy this sample script and paste it into any text editor.  

    ```  
    var map = null;

    function LoadMap(latitude, longiture) {
        map = new Microsoft.Maps.Map("#controlAddIn", {
            credentials: "Enter your Bing Maps key here",
            center: new Microsoft.Maps.Location(latitude, longiture),
            mapTypeId: Microsoft.Maps.MapTypeId.aerial,
            zoom: 18
        }); 
    }

    function ShowPushpin(title, imageName) {
        map.entities.clear();

        if (title !== "") {
            var point = map.getCenter();
            var imageUrl = Microsoft.Dynamics.NAV.GetImageResource(imageName);
            var pushpin = new Microsoft.Maps.Pushpin(point, {
                icon: imageUrl,
                title: title
            });

            map.entities.push(pushpin);
        }
    }
    ```  

2.  Save and name the script **Script** and make sure to add the .js extension to the file, so that the file name will now be **Script.js**. You can save this file anywhere you like.  

The next step is to create a .zip file containing the manifest and resource files and register this file with the control add-in in [!INCLUDE[navnow](includes/navnow_md.md)].  

## Creating a Resource .Zip File  
Before registering the control add-in in [!INCLUDE[navnow](includes/navnow_md.md)], you must create one single file containing the manifest and any resource files. This single file is a .zip file and it will be registered in the **Client Add-in** page. The .zip file must contain a certain structure for it to be recognized by the **Client Add-in** page. In the next steps, you will create the right structure and a .zip file.  

#### To create a resource .zip file  

1.  On your computer, in a folder of your own choice, create the following folders: **Image**, **Script**, and **StyleSheet**. 

    >[!NOTE]
    > If you do not have images or a style sheet, then you do not need the **Image** and **StyleSheet** folders.  

2.  Locate the **Manifest.xml** file that you created in the previous steps, and copy this to the same folder structure. Then locate the **Script.js** file that you created in the previous steps, and copy this to the **Script** folder. Your folder should now look like this:  

     ![Folder structure before creating the .zip file.](media/ControlAddInSingleFileFolderStructure.png "ControlAddInSingleFileFolderStructure")  

3.  Place images, scripts, and stylesheets in the right folders.  

4.  In Windows Explorer select all of the folders and the manifest file, right-click, and then choose **Send to…**, and then choose **Compressed \(zipped\) folder**.  

5.  Name the .zip file **BingMapsControlAddIn**.  

## Registering the Control Add-in in [!INCLUDE[navnow](includes/navnow_md.md)]  
 To register a control add-in, you include it in the **Control Add-ins** page in [!INCLUDE[navnow](includes/navnow_md.md)]. To include a control add-in in the page, you must provide the following information:  

-   Control Add-in name.  

     The control add-in name is determined by the `Microsoft.Dynamics.Framework.UI.Extensibility.ControlAddInExport` attribute value of control add-in class definition that you specified when you created the control add-in. The name in this walkthrough is `BingMapsControl`.  

-   Public key token.  

     This is a 16-character key that is given to the assembly when it is signed and built in Visual Studio. You can determine the public key token by running the Microsoft .NET Strong name Utility \(sn.exe\) on the assembly. You must run the utility from the Visual Studio command prompt. The sn.exe utility is available with Visual Studio.  

-   Resource.  

     On the **Control Add-in** page, the **Resource** field is a BLOB data type and the content of the field cannot be viewed from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  

     When this field is filled in, [!INCLUDE[navnow](includes/navnow_md.md)] identifies the registered control add-in as a type of control add-in that works on all display targets.  

#### To determine the public key token for the control add-in  

1.  To determine the public key token, you use the you can run the Strong Name tool \(sn.exe\) on the control add-in assembly.

    -   Depending on the Microsoft Visual Studio version you have, you can run this from the Visual Studio Developer Command Prompt. To do this, choose **Start**, choose **All Programs**, choose **Microsoft Visual Studio**, choose **Visual Studio Tools**, and then choose **Developer Command Prompt** to open the command prompt.  
    
    -   Otherwise, you can open a command prompt from the Windows **Start** menu, and then navigate to the location of the sn.exe file. The location will depend on your operating system and the installed Microsoft .NET Framework SDK. For example, *C:\\Program Files\\Microsoft SDKs\\Windows\\v7.0\\Bin* or *C:\\Utils\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.6.1 Tools\\x64*. The easiest way is to seacrh your computer for this file. 

2.  At a command prompt, change to the directory that contains the assembly that you copied. For example, [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\Add-ins.  

3.  Type the following command:

    ```
    sn –T <assembly>
    ```  

    Replace `<assembly>` with the assembly name, such as BingMapsControlAddIn.dll.  

4.  Press Enter and note the public token key that is displayed.  

#### To include the control add-in in the Control Add-in page  

1.  Open [!INCLUDE[navnow](includes/navnow_md.md)].  

2.  In the **Search** box, enter **Control Add-ins** and then choose the related link.  

3.  In the **Control Add-ins** window, choose **New**, and then in the **Control Add-in Name** column, enter the control add-in name. In the **Public Key Token** column, enter the public key token that you obtained earlier.  

 With the **Control Add-in** window still open, you will now import the .zip file for the **BingMapsControlAddIn** add-in.  

#### To include the .zip file in the Control Add-in page  

1.  Choose **Import**.  

2.  In the **Import Control Add-in Resource** window, locate the BingMapsControlAddIn.zip file that you saved earlier, and then choose **Open**.  

3.  Choose the **OK** button to close the **Control Add-in** page.  

## Creating a Page to Display the Control Add-in  
You have set up the prerequisites for using a control add-in from a page. Now you need a way to display the BingMapsControlAddIn control. In this section, you will create a new page called **Bing Maps** that contains two fields to control the coordinates of the map and one field that contains the map control. This involves the following tasks:  

-   Creating a new page called Bing Maps.  

-   Setting variables and properties.  

-   Adding C/AL triggers.  

#### To create the Bing Maps page  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], in Object Designer, choose **Page**, and then choose **New**.  

2.  In the **New Page** dialog, choose **Create blank page** and then choose the **OK** button.  

3.  In Page Designer, on the first line, in the **Name** column, enter **Control1**, and go to the next line.  

4.  In the **Type** column, choose **Group**, and in the **Caption** column, enter **Coordinates**.  

5.  On a new line, in the **Type** column, choose **Field**. In the **Name** column, enter **LatitudeControl**, and in the **Caption** column, enter **Latitude**.  

6.  On a new line, in the **Type** column, choose **Field**. In the **Name** column, enter **LongitudeControl**, and in the **Caption** column, enter **Longitude**.  

7.  On a new line, choose **Group**, and in the **Caption** column, enter **Map**.  

8.  On a new line, under the **Map** group, for the **Type** column set to **Field**, in the **Name** column, enter **BingMapsControl**.  

     Your page design should now look like this.  

     ![The page design for the Bing Maps control.](media/ControlAddInPageDesignForBingMapsControl.png "ControlAddInPageDesignForBingMapsControl")  

9. Save and compile the page. Name the page **Bing Maps**.  

 Now you have created a page skeleton. The next step is to add code and call the control add-in from a control on the page.  

##### To add variables and properties  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], in Object Designer, choose **Page**, and then choose the **Bing Maps** page. 

2.  On the **Tools** menu, choose **View**, and then **C/AL Globals**.  

3.  On the **Variables** tab, enter **Latitude** in the **Name** column, and set the **DataType** to **Decimal**.  

4.  Create a new variable. Enter **Longitude** in the **Name** column, and set the **DataType** to **Decimal**.  

5.  Create a new variable. Enter **MiniMap** in the **Name** column, and set the **DataType** to **Boolean**.  

6.  Close the **C/AL Globals** window.  

7.  In Page Designer, on **LatitudeControl**, set **SourceExpr** to **Latitude** in the C/AL Symbol Menu.  

8.  On **LongitudeControl**, set **SourceExpr** to **Longitude** in the C/AL Symbol Menu.  

9. Select the **BingMapsControl** field, and then on the **View** menu, choose **Properties**.  

10. In the **Properties** window, locate the **ControlAddIn** property and choose the Up Arrow. Select the **BingMapsControl** control add-in from the **Client Add-in** window.

11. Choose the **OK** button to close the **Client Add-In** window. The public key token is inserted into the **Value** field.
    The field value should look similar to this: `BingMapsControl;PublicKeyToken=daf55d6ceedb18d5`.
    
12. Close the **Properties** window.  

##### To add C/AL triggers  

1.  With the **Bing Maps** page open in Object Designer, on the **View** menu, choose **C/AL Code**.  

2.  In the **Page Bing Maps – C/AL Editor** window, locate the `BingMapControl::ControlAddInReady()` trigger, and add the following line of code.  

    ```  
    CurrPage.BingMapControl.LoadMap(Latitude, Longitude);  
    ```  

3. Finally, locate the `OnInit()` trigger, and add the following line of code.  

    ```  
    Latitude := 40.689467;  
    Longitude :=  74.044444;  
    ```  

4.  Save and compile the Bing Maps page.  

 After you have saved and compiled the **Bing Maps** page, you can run the page directly from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to verify that it works on the [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [Opening a Page in the Microsoft Dynamics NAV Web Client by Using a URL](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md).  

## Next Steps  
 Now you have created a Client Control Add-in that runs on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)], and the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)]. A next step could be to implement a control add-in on an existing page or on the Role Center to display a Bing Map of where customers are located.  

## See Also  
 [Extending Microsoft Dynamics NAV Using Control Add-ins](Extending-Microsoft-Dynamics-NAV-Using-Control-Add-ins.md)   
 [Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md)
