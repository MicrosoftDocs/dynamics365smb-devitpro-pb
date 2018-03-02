---
title: "UPLOADINTOSTREAM Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3c7fcef9-b1be-4e16-8872-8ae74750da42
caps.latest.revision: 24
manager: edupont
---
# UPLOADINTOSTREAM Function (File)
Sends a file from the client computer to the corresponding [!INCLUDE[nav_server](includes/nav_server_md.md)]. The client computer is the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the computer that is running a browser that accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## Syntax  
  
```  
  
[Ok :=] UPLOADINTOSTREAM(DialogTitle, FromFolder, FromFilter, FromFile, NVInStream)  
```  
  
#### Parameters  
 *DialogTitle*  
 Type: Text  
  
 The text displayed in the title bar of the **Open** dialog box.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The title is determined by the end-user's browser.  
  
 *FromFolder*  
 Type: Text  
  
 The path of the folder that is displayed in the **File Open** dialog box. This is the default folder, but the user can browse to any available location.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. By default, the browser uses the folder that was last accessed.  
  
 *FromFilter*  
 Type: Text  
  
 The type of file that can be uploaded to [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
 In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the type is displayed in the upload dialog box, so the user can only select files of the specified type. For the [!INCLUDE[nav_web](includes/nav_web_md.md)], a user can try to upload any file type but an error occurs if the file is not the specified type.  
  
 *FromFile*  
 Type: Text  
  
 The default file to upload to the [!INCLUDE[navnow](includes/navnow_md.md)] service. The name displays in the dialog box for uploading the file. The user can change the file.  
  
> [!NOTE]  
>  This parameter is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 *NVInStream*  
 Type: Variant  
  
 The InStream that is used to send the file.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, then a run-time error occurs if the record cannot be found. If you include a return value, then you must handle any errors.  
  
 **true** if the file was uploaded; otherwise, **false**.  
  
## Remarks  
  
> [!NOTE]  
>  This function is not supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)] on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays in the [!INCLUDE[nav_web](includes/nav_web_md.md)], but it is disabled and the user cannot select a file.  
  
 The maximum size of the file to be uploaded is specified by the MaxUploadSize setting in the CustomSettings.config file. The setting is specified in megabytes. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
 In [!INCLUDE[navnow](includes/navnow_md.md)], the business logic runs on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] and not on the client. Files are created on [!INCLUDE[nav_server](includes/nav_server_md.md)] and not locally on the client computer.  
  
 Use [UPLOAD Function \(File\)](UPLOAD-Function--File-.md) and [UPLOADINTOSTREAM Function \(FILE\)](UPLOADINTOSTREAM-Function--File-.md) to send a file from the client to [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
 Use [DOWNLOAD Function \(File\)](DOWNLOAD-Function--File-.md) and [DOWNLOADFROMSTREAM Function \(File\)](DOWNLOADFROMSTREAM-Function--File-.md) to send a file from [!INCLUDE[nav_server](includes/nav_server_md.md)] to the client.  
  
 We recommend that you use the functions in codeunit 419, File Management, to upload and download files.  
  
## Example  
 This example requires that you create the following variables.  
  
|Name|DataType|  
|----------|--------------|  
|FileName|Text|  
|NVInStream|InStream|  
  
```  
FileName := 'c:\SomeFile.txt';  
UPLOADINTOSTREAM('Import','',' All Files (*.*)|*.*',FileName,NVInStream);  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)   
 [Walkthrough: Uploading a File from a Client to Microsoft Dynamics NAV Server](Walkthrough--Uploading-a-File-from-a-Client-to-Microsoft-Dynamics-NAV-Server.md)