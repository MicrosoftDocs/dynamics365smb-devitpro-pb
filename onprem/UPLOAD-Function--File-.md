---
title: "UPLOAD Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0da8d4ad-82cd-4906-9faa-e49e360262b9
caps.latest.revision: 24
manager: edupont
---
# UPLOAD Function (File)
Sends a file from the client computer to the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. The client computer is the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the computer that is running a browser that accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## Syntax  
  
```  
  
[Ok :=] UPLOAD(DialogTitle, FromFolder, FromFilter, FromFile, ToFile)  
```  
  
#### Parameters  
 *DialogTitle*  
 Type: Text  
  
 The title that you want to display in the dialog box for uploading the file.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The title is determined by the end-user's browser.  
  
 *FromFolder*  
 Type: Text  
  
 The name of the folder that is displayed in the dialog box. This is the default value, and the user can change it.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The browser uses the folder that was last accessed.  
  
 *FromFilter*  
 Type: Text  
  
 The type of file that can be uploaded to [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
 In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the type is displayed in the upload dialog box, so that the user can only select files of the specified type. For the [!INCLUDE[nav_web](includes/nav_web_md.md)], a user can try to upload any file type but an error occurs if the file is not the specified type.  
  
 *FromFile*  
 Type: Text  
  
 The default file that you want to upload to the [!INCLUDE[navnow](includes/navnow_md.md)] service. The name displays in the dialog box for uploading the file. The user can change the file.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 *ToFile*  
 Type: Variant  
  
 The path and file name to give the uploaded file.  
  
 If you do not provide a path, or you upload the file that uses [!INCLUDE[nav_web](includes/nav_web_md.md)], then the file is uploaded to the following folder on the computing that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]:  
  
 \\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\90\\Server\\MicrosoftDynamicsNAVServer$[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\users\\*ServiceAccount*  
  
 *ServiceAccount* is the folder for the account for [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, then a run-time error occurs if the file cannot be found. If you include a return value, then you must handle any errors.  
  
 **true** if the file was uploaded; otherwise, **false**.  
  
## Remarks  
  
> [!NOTE]  
>  This function is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)] on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays in the [!INCLUDE[nav_web](includes/nav_web_md.md)], but it is disabled and the user cannot select a file.  
  
 In [!INCLUDE[navnow](includes/navnow_md.md)], the business logic is run on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] and not on the client. Files are created on the [!INCLUDE[navnow](includes/navnow_md.md)] service and not locally on the client computer.  
  
 [UPLOAD Function \(FILE\)](UPLOAD-Function--File-.md) and [UPLOADINTOSTREAM Function \(File\)](UPLOADINTOSTREAM-Function--File-.md) are used to send a file from the client to a [!INCLUDE[navnow](includes/navnow_md.md)] service.  
  
 [DOWNLOAD Function \(File\)](DOWNLOAD-Function--File-.md) and [DOWNLOADFROMSTREAM Function \(File\)](DOWNLOADFROMSTREAM-Function--File-.md) are used to send a file from a [!INCLUDE[navnow](includes/navnow_md.md)] service to the client.  
  
 We recommend that you use the functions in codeunit 419, File Management, to upload and download files.  
  
## Example  
  
```  
UPLOAD('Upload file','C:\','Text file(*.txt)|*.txt','Test.txt',varTest)  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)