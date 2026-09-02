---
title: Implementing the Camera in AL for Business Central
description: Learn how to implement the camera capability on a Business Central page in AL, so users can take pictures and handle them directly from the same device.
ms.date: 08/24/2026
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Implementing the camera in AL

You can access the camera of a device from the [!INCLUDE[webclient](includes/webclient.md)] in the browser and from the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]. This allows the user to take pictures and handle them directly from the same device, and in that way, improve accuracy of capturing data closest to the source, and reduce end-to-end time to perform tasks. 

You can also add access to the camera to a specific page from the [!INCLUDE[d365_dev_short_md](includes/d365_dev_short_md.md)]. For a [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] existing implementation of this, see the `Picture` factbox on the `Item Card`, which lets you take a picture of a specific item and store it together with the item.  
  
> [!IMPORTANT]  
> The camera access is only available on devices that have a camera. 

> [!IMPORTANT]  
> This example uses .NET interoperability, which is only available for on-premises deployments. To use it, you must set `"target": "OnPrem"` in the `app.json` file. Learn more in [Get started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md). For online environments, use the `Camera` codeunit in the System Application instead. Learn more in [Camera](/dynamics365/business-central/application/system-application/codeunit/system.device.camera).

## Example

This example illustrates how to implement the camera capability on a page in AL. The example implements three actions to take a picture: **Take Picture**, **Take Picture High Quality**, and **Take Picture Low Quality**. However, it doesn't include code that saves the picture to the database.

The example also shows how to specify options for the camera functionality such as picture quality or source type. Learn more about the options that you can set for the camera in [CameraOptions overview](devenv-camera-options.md).

> [!NOTE]
> To enable the camera functionality, you must add the path of the folder containing the `"Microsoft.Dynamics.Nav.ClientExtensions"` assembly on the **Al: Assembly Probing Paths** setting on the **User Settings** or **Workspace Settings** so the compiler can access it. Learn more in [Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md).

The following code will create two variables; the `CameraAvailable` variable is a **Boolean** that checks whether the current device has a camera. The `Camera` variable is a **DotNet** type that gets instantiated by adding code to the `OnOpenPage` trigger. Then, it will add the actions to the page that lets the user start the camera. Finally, the trigger `Camera::PictureAvailable` is defined to handle the incoming picture.  

```al
page 50101 "Card with Camera Capability"
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
            CameraAvailable := true;
        end;
    end;

    // The PictureName contains the name of the file including its extension on the device. 
    // The naming scheme depends on the device platform. 
    // The PictureFilePath contains the path to the picture in a temporary folder on the server for the current user.
    // The PictureAvailable trigger handles the picture for when the camera has captured it and it has been uploaded.
    trigger Camera::PictureAvailable(PictureName: Text; PictureFilePath: Text) 
    begin
        IncomingFile.Open(PictureFilePath);
        Message('Picture size: %1', IncomingFile.Len());
        IncomingFile.Close();
        // It's important to clean up by using the File.Erase command to avoid accumulating image files.
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

Learn more about troubleshooting camera access in [Troubleshooting: camera and location](/dynamics365/business-central/ui-troubleshooting-camera-location).

## Related information  

[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
[Implementing location in AL](devenv-implement-location-al.md)  
[CameraOptions overview](devenv-camera-options.md)  
[RunOnClient property](./properties/devenv-properties.md)  
[WithEvents property](./properties/devenv-properties.md)
