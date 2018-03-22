---
title: "UPLOAD Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 0da8d4ad-82cd-4906-9faa-e49e360262b9
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# UPLOAD Method (File)
Sends a file from the client device to the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. The client device is the device <!--NAV that is running the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or -->, such as a computer or phone, that accesses [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].

## Syntax  

```  
[Ok :=] UPLOAD(DialogTitle, FromFolder, FromFilter, FromFile, ToFile)  
```  

#### Parameters  

 *DialogTitle*  
 Type: Text  
<!--NAV
 The title that you want to display in the dialog box for uploading the file.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. The title is determined by the end-user's browser.  

 *FromFolder*  
 Type: Text  
<!--NAV
 The name of the folder that is displayed in the dialog box. This is the default value, and the user can change it.
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV - by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. The browser uses the folder that was last accessed.  

 *FromFilter*  
 Type: Text  

 The type of file that can be uploaded to [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

<!--NAV
In the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)], the type is displayed in the upload dialog box, so that the user can only select files of the specified type.
-->
A user can try to upload any file type but an error occurs if the file is not the specified type.  

 *FromFile*  
 Type: Text  
<!--NAV
 The default file that you want to upload to the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] service. The name displays in the dialog box for uploading the file. The user can change the file.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV - by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->.

 *ToFile*  
 Type: Variant  

 The path and file name to give the uploaded file.  

<!--NAV If you do not provide a path, or you upload the file that uses [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)], then the file is uploaded to the following folder on the computing that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]:  

 \\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\90\\Server\\MicrosoftDynamicsNAVServer$[!INCLUDE[nav_server_instance](../includes/nav_server_instance_md.md)]\\users\\*ServiceAccount*  -->

 *ServiceAccount* is the folder for the account for [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

## Property Value/Return Value  
 Type: Boolean  

 If you omit this optional return value, then a run-time error occurs if the file cannot be found. If you include a return value, then you must handle any errors.  

 **true** if the file was uploaded; otherwise, **false**.  

## Remarks  

> [!NOTE]  
>  This method is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]--> on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays, but it is disabled and the user cannot select a file.  

The business logic is run on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] and not on the client. Files are created on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] and not locally on the client.  

[UPLOAD Method \(FILE\)](devenv-UPLOAD-Method-File.md) and [UPLOADINTOSTREAM Method \(File\)](devenv-UPLOADINTOSTREAM-Method-File.md) are used to send a file from the client to a [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

[DOWNLOAD Method \(File\)](devenv-DOWNLOAD-Method-File.md) and [DOWNLOADFROMSTREAM Method \(File\)](devenv-DOWNLOADFROMSTREAM-Method-File.md) are used to send a file from a [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to the client.  

We recommend that you use the methods in codeunit 419, File Management, to upload and download files.  

## Example  

```  
UPLOAD('Upload file','C:\','Text file(*.txt)|*.txt','Test.txt',varTest)  
```  

## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)
