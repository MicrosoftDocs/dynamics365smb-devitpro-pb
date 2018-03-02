---
title: "UPLOADINTOSTREAM Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3c7fcef9-b1be-4e16-8872-8ae74750da42
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# UPLOADINTOSTREAM Method (File)
Sends a file from the client device to the corresponding [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  The client device is the device <!--NAV that is running the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or -->, such as a computer or phone, that accesses [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].  

## Syntax  

```  
[Ok :=] UPLOADINTOSTREAM(DialogTitle, FromFolder, FromFilter, FromFile, NVInStream)  
```  

#### Parameters  
 *DialogTitle*  
 Type: Text  
<!--NAV  
 The text displayed in the title bar of the **Open** dialog box.  
-->

> [!NOTE]  
>  This parameter is not supported<!-- by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. The title is determined by the end-user's browser.  

 *FromFolder*  
 Type: Text  
<!--NAV  
 The path of the folder that is displayed in the **File Open** dialog box. This is the default folder, but the user can browse to any available location.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. By default, the browser uses the folder that was last accessed.  

 *FromFilter*  
 Type: Text  

 The type of file that can be uploaded to [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

 <!--NAV
 In the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)], the type is displayed in the upload dialog box, so the user can only select files of the specified type.
 -->
 A user can try to upload any file type but an error occurs if the file is not the specified type.  

 *FromFile*  
 Type: Text  
<!--NAV  
 The default file to upload to the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] service. The name displays in the dialog box for uploading the file. The user can change the file.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->.  

 *NVInStream*  
 Type: Variant  

 The InStream that is used to send the file.  

## Property Value/Return Value  
 Type: Boolean  

 If you omit this optional return value, then a run-time error occurs if the record cannot be found. If you include a return value, then you must handle any errors.  

 **true** if the file was uploaded; otherwise, **false**.  

## Remarks  

> [!NOTE]  
>  This method is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]--> on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays, but it is disabled and the user cannot select a file.  

<!-- NAV
 The maximum size of the file to be uploaded is specified by the MaxUploadSize setting in the CustomSettings.config file. The setting is specified in megabytes. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
-->

The business logic runs on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] and not on the client. Files are created on [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] and not locally on the client computer.  

 Use [UPLOAD Method \(File\)](devenv-UPLOAD-Method-File.md) and [UPLOADINTOSTREAM Method \(FILE\)](devenv-UPLOADINTOSTREAM-Method-File.md) to send a file from the client to the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

 Use [DOWNLOAD Method \(File\)](devenv-DOWNLOAD-Method-File.md) and [DOWNLOADFROMSTREAM Method \(File\)](devenv-DOWNLOADFROMSTREAM-Method-File.md) to send a file from the  [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to the client.  

 We recommend that you use the methods in codeunit 419, File Management, to upload and download files.  

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
 [File Data Type](../datatypes/devenv-File-Data-Type.md)   
 <!--Links [Walkthrough: Uploading a File from a Client to Microsoft Dynamics NAV Server](Walkthrough--Uploading-a-File-from-a-Client-to-Microsoft-Dynamics-NAV-Server.md)-->  
