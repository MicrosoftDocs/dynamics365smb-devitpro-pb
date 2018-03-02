---
title: "DOWNLOAD Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 177ea399-06d4-4a49-b287-a6fe4a3b8f8f
caps.latest.revision: 28
manager: edupont
---
# DOWNLOAD Function (File)
Sends a file from a [!INCLUDE[nav_server](includes/nav_server_md.md)] computer to the client computer.  The client computer is the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the computer that is running a browser that accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## Syntax  
  
```  
  
[Ok :=] DOWNLOAD(FromFile, DialogTitle, ToFolder, ToFilter, ToFile)  
```  
  
#### Parameters  
 *FromFile*  
 Type: Text  
  
 The name of the file on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer that you want to download to the client computer.  
  
 *DialogTitle*  
 Type: Text  
  
 The title that you want to display in the dialog box for downloading the file.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The title is determined by the end-user's browser.  
  
 *ToFolder*  
 Type: Text  
  
 The default folder in which to save the file to be downloaded. The folder name is displayed in the dialog box for downloading the file. The folder can be changed by the user.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. By default, files are saved to the default download location that is configured in the end-user's browser.  
  
 *ToFilter*  
 Type: Text  
  
 The type of file that can be downloaded to the client computer. The type is displayed in the dialog box for downloading the file.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 *ToFile*  
 Type: Variant  
  
 The name to give the downloaded file. This is the default file name that is shown in the dialog box for downloading the file. This value can be changed by the user.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, then a run-time error occurs if the file cannot be found. If you include a return value, then it is assumed that you will handle any errors.  
  
 **true** if the file was downloaded; otherwise, **false**.  
  
## Remarks  
  
> [!NOTE]  
>  This function is not fully supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)] on devices that run Apple iOS, such as iPad. You can only download a file if the Apple iOS device on which you are downloading the file has an application that supports the file type.  
  
 In [!INCLUDE[navnow](includes/navnow_md.md)], the business logic is run on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] and not on the client. Files are created on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] and not locally on the client computer.  
  
 [UPLOAD Function \(File\)](UPLOAD-Function--File-.md) and [UPLOADINTOSTREAM Function \(File\)](UPLOADINTOSTREAM-Function--File-.md) are used to send a file from the client to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
 [DOWNLOAD Function \(FILE\)](DOWNLOAD-Function--File-.md) and [DOWNLOADFROMSTREAM Function \(File\)](DOWNLOADFROMSTREAM-Function--File-.md) are used to send a file from a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to the client.  
  
 We recommend that you use the functions in codeunit 419, File Management, to upload and download files.  
  
## Example  
 This example shows how to use the DOWNLOAD function. It requires that you create the following variable.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|ToFile|Text|  
  
```  
ToFile := 'ToFile.txt';  
DOWNLOAD('FromFile.txt','Download file','C:\','Text file(*.txt)|*.txt',ToFile);  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)