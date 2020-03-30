---
title: "Implementing the Camera in AL"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
---
# Implementing the Camera in AL
It is possible to access the camera of a device from a browser in the [!INCLUDE[webclient](includes/webclient.md)] and in the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]. This allows the user to take pictures and handle them directly from the device.

For a [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] existing implementation of this, see `Item Picture` factbox on the the `Item Card`, which lets you take a picture of a specific item and store it with the item.  
  
> [!IMPORTANT]  
>  The camera access is only available on devices that have a camera. 

You can specify options for the camera capability such as picture quality or source type. To read more about the different options that can be set for the camera, see [CameraOptions Overview](devenv-CameraOptions.md). 

## Example

This example illustrates how you can add access to camera to a specific page from the [!INCLUDE[d365_dev_short_md](includes/d365_dev_short_md.md)]. It implements three actions; **Take Picture**, **Take Picture High Quality**, and **Take Picture Low Quality** on the `Customer Card` page, but does not include code that saves the picture to the database.

> [!NOTE]
> To enable this functionality, it is required that you add the path of the folder containing the `"Microsoft.Dynamics.Nav.ClientExtensions"` assembly on the **Al: Assembly Probing Paths** setting on the **User Settings** or **Workspace Settings** so the compiler can access it. For more information, see [Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md).

The following code will create two variables; the `CameraAvailable` variable is a **Boolean**  checks whether the current device has a camera. The `Camera` variable is a **DotNet** type that gets instantiated by adding code to the `OnOpenPage` trigger. Then, it will add actions to the `Customer Card` page that lets the user start the camera. Finally, the trigger `Camera::PictureAvailable` is defined to handle the incoming picture.  

```
pageextension 50101 ImplementCameraCustCard extends "Customer Card"
{

    actions
    {
        addafter("&Customer")
        {
            action(TakePicture)
            {
                Visible = CameraAvailable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Camera;

                trigger OnAction()
                begin
                    Camera.RequestPictureAsync();
                end;
            }

            action(TakePictureHigh)
            {
                Visible = CameraAvailable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Camera;

                trigger OnAction()
                begin
                    CameraOptions := CameraOptions.CameraOptions();
                    CameraOptions.Quality := 100;
                    Camera.RequestPictureAsync(CameraOptions);
                end;
            }

            action(TakePictureLow)
            {
                Visible = CameraAvailable;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Camera;

                trigger OnAction()
                begin
                    CameraOptions := CameraOptions.CameraOptions();
                    CameraOptions.Quality := 10;
                    Camera.RequestPictureAsync(CameraOptions);
                end;
            }
        }

    }

    trigger OnOpenPage()
    begin
        // The IsAvailable() enables the camera functionality based on its presence.
        if Camera.IsAvailable() then begin
            Camera := Camera.Create();
            CameraAvailable := True;
        end;
    end;

    // The PictureName contains the name of the file including its extension on the device. 
    // The naming scheme depends on the device platform. 
    // The PictureFilePath contains the path to the picture in a temporary folder on the server for the current user.
    trigger Camera::PictureAvailable(PictureName: Text; PictureFilePath: Text) handles the picture for when the camera has captured it and it has been uploaded.
    begin
        IncomingFile.Open(PictureFilePath);
        Message('Picture size: %1', IncomingFile.Len());
        IncomingFile.Close();
        // It is important to clean up by using the File.Erase command to avoid accumulating image files.
        File.Erase(PictureFilePath);
    end;

    var
        [RunOnClient]
        [WithEvents]
        Camera: DotNet UT_CameraProvider;
        CameraOptions: DotNet UT_CameraOptions;
        // Checks whether the current device has a camera.
        CameraAvailable: Boolean;
        IncomingFile: File;
}

dotnet
{
    assembly("Microsoft.Dynamics.Nav.ClientExtensions")
    {

        type("Microsoft.Dynamics.Nav.Client.Capabilities.CameraProvider"; "UT_CameraProvider")
        {

        }

        type("Microsoft.Dynamics.Nav.Client.Capabilities.CameraOptions"; "UT_CameraOptions")
        {

        }
    }
}

```
  
 You can now test the modified `Customer Card` page from a device with a camera.  
  
## See Also  
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
[Implementing Location in AL](devenv-implement-location-al.md)