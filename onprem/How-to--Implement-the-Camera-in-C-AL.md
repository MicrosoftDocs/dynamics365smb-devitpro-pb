---
title: "How to: Implement the Camera in C/AL"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 71993c75-c4b9-42f3-9458-7594f8684df2
caps.latest.revision: 24
manager: edupont
---
# How to: Implement the Camera in C/AL
This example illustrates how you can add access to camera to a specific page from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. Adding a camera option to the Item card, for example, lets you take a picture of a specific item and store it with the item. The example implements three actions; **Take Picture**, **Take Picture High Quality**, and **Take Picture Low Quality** on the Customer Card page, but does not include code that saves the picture to the database. For a [!INCLUDE[navnow](includes/navnow_md.md)] implementation of this, see **Incoming Documents**, for example on the Accounting Manager profile, when you use the Dynamics NAV app on a phone.  
  
> [!IMPORTANT]  
>  The camera access is only available on devices that run the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] and have a camera. This means that camera access is not available from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or from a browser.  
  
 With the following steps, you will create two variables; the `CameraAvailable` variable is a Boolean that checks whether the current device has a camera. The `Camera` variable is a DotNet type that gets instantiated by adding code to the `OnOpenPage` trigger. Then, you will add actions to the Customer Card page that lets the user start the camera and write the code that is run on these actions. And finally, you will add a new trigger `Camera::PictureAvailable` to handle the incoming picture.  
  
### To implement the camera in C/AL  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer** to open the Object Designer window.  
  
2.  In **Object Designer**, choose **Pages**, select the **Customer Card** \(page 21\) and choose the **Design** button.  
  
3.  From the Page Designer window, on the **View** menu, choose **C/AL Globals**.  
  
4.  Create the following two variables:  
  
    |Variable name|DataType|SubType|  
    |-------------------|--------------|-------------|  
    |Camera|DotNet|Microsoft.Dynamics.Nav.Client.Capabilities.CameraProvider<br /><br /> **Important:** Choose the Microsoft.Dynamics.Nav.ClientExtensions dll on the **Server** tab, and then choose Microsoft.Dynamics.Nav.Client.Capabilities.CameraProvider.<br /><br /> Make sure to set the properties **RunOnClient** and **WithEvents** to **Yes**.|  
    |CameraAvailable|Boolean|-|  
  
5.  On the **View** menu, select **C/AL Code** and in the **C/AL Editor** locate the `OnOpenPage` trigger.  
  
6.  Instantiate the `Camera` variable by adding the following code to the `OnOpenPage` trigger  
  
    ```  
    IF Camera.IsAvailable THEN  
    BEGIN  
      Camera := Camera.Create;  
      CameraAvailable := TRUE;  
    END;  
    ```  
  
7.  Next, create the page actions. Choose the **View** menu, and then select **Page Actions**.  
  
8.  Locate the **ActionGroup** named **Customer** and create three actions; `TakePicture`, `TakePictureHigh`, and `TakePictureLow` all of them with the following properties set as shown in the following table.  
  
    |Property|Value|  
    |--------------|-----------|  
    |Name|TakePicture|  
    |Visible|CameraAvailable|  
    |Promoted|Yes|  
    |PromotedCategory|Process|  
    |PromotedIsBig|Yes|  
    |Image|Camera|  
  
9. Next, you will add the code that is executed on the actions. On the `TakePicture OnAction` trigger, insert the following line of code:  
  
    ```  
    Camera.RequestPictureAsync;  
  
    ```  
  
10. On the `TakePictureHigh OnAction` trigger, insert the following lines of code:  
  
    ```  
    CameraOptions := CameraOptions.CameraOptions();  
    CameraOptions.Quality := 100;  
    Camera.RequestPictureAsync(CameraOptions);  
  
    ```  
  
11. On the `TakePictureLow OnAction` trigger, insert the following lines of code:  
  
    ```  
    CameraOptions := CameraOptions.CameraOptions();  
    CameraOptions.Quality := 10;  
    Camera.RequestPictureAsync(CameraOptions);  
    ```  
  
12. You now need to declare the local variable `CameraOptions` for the `TakePictureHigh` and `TakePictureLow` triggers. From the Page Designer window, on the View menu, choose **C/AL Locals**.  
  
13. Create the following variable:  
  
    |Variable name|DataType|SubType|  
    |-------------------|--------------|-------------|  
    |CameraOptions|DotNet|Microsoft.Dynamics.Nav.Client.Capabilities.CameraOptions<br /><br /> **Important:** Choose the Microsoft.Dynamics.Nav.ClientExtensions dll on the **Server** tab, and then choose Microsoft.Dynamics.Nav.Client.Capabilities.CameraOptions.|  
  
14. You must now add code to handle the picture for when the camera has captured the picture and the picture has been uploaded to the [!INCLUDE[nav_server](includes/nav_server_md.md)]. In the C/AL Editor, on the `PictureAvailable` trigger, add code so that the `PictureAvailable` trigger looks like this.  
  
    ```  
    Camera::PictureAvailable(PictureName : Text;PictureFilePath : Text)  
          IncomingFile.OPEN(PictureFilePath);  
          MESSAGE('Picture size: %1', IncomingFile.LEN);  
          IncomingFile.CLOSE;  
          FILE.ERASE(PictureFilePath);  
    ```  
  
     The `PictureName` contains the name of the file including its extension on the device. The naming scheme depends on the device platform. The `PictureFilePath` contains the path to the picture in a temporary folder on the server for the current user.  
  
    > [!IMPORTANT]  
    >  It is important to clean up by using the FILE.ERASE command to avoid accumulating image files.  
  
15. Now, you need to declare the local variable `IncomingFile` used in the `PictureAvailable` trigger. From the Page Designer window, on the View menu, choose **C/AL Locals**.  
  
16. Create the following variable:  
  
    |Variable name|DataType|  
    |-------------------|--------------|  
    |IncomingFile|File|  
  
17. Close the C/AL Editor, and then save and compile the page.  
  
 You can now test the modified **Customer Card** page in the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] from either a tablet or a phone with a camera. To read more about different options that can be set for the camera, see [CameraOptions Overview](CameraOptions-Overview.md).  
  
## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md)