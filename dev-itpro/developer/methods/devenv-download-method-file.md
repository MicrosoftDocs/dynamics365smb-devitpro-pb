---
title: "DOWNLOAD Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 177ea399-06d4-4a49-b287-a6fe4a3b8f8f
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DOWNLOAD Method (File)
Sends a file from a [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to the client device.  The client device <!--NAV is the computer that is running the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or -->is the device, such as a computer or phone, that accesses [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].  

## Syntax  

```  
[Ok :=] DOWNLOAD(FromFile, DialogTitle, ToFolder, ToFilter, ToFile)  
```  

#### Parameters  
 *FromFile*  
 Type: Text  

 The name of the file on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] that you want to download to the client device.  

 *DialogTitle*  
 Type: Text  
<!--NAV
 The title that you want to display in the dialog box for downloading the file.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. The title is determined by the end-user's browser.  

 *ToFolder*  
 Type: Text  
<!--NAV
 The default folder in which to save the file to be downloaded. The folder name is displayed in the dialog box for downloading the file. The folder can be changed by the user.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. By default, files are saved to the default download location that is configured in the end-user's browser.  

 *ToFilter*  
 Type: Text  
<!--NAV
 The type of file that can be downloaded to the client computer. The type is displayed in the dialog box for downloading the file.  
-->

> [!NOTE]  
>  This parameter is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->.  

 *ToFile*  
 Type: Variant  

 The name to give the downloaded file. This is the default file name that is shown in the dialog box for downloading the file. This value can be changed by the user.  

## Property Value/Return Value  
 Type: Boolean  

 If you omit this optional return value, then a run-time error occurs if the file cannot be found. If you include a return value, then it is assumed that you will handle any errors.  

 **true** if the file was downloaded; otherwise, **false**.  

## Remarks  

> [!NOTE]  
>  <!-- This method is not fully supported by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] on devices that run Apple iOS, such as iPad.--> On devices that run Apple iOS, such as iPad, you can only download a file if the Apple iOS device on which you are downloading the file has an application that supports the file type.  

Files are saved to the default download location that is configured in the end-user's browser.

The business logic is run on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] and not on the client. Files are created on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] and not locally on the client computer.  

 [UPLOAD Method \(File\)](devenv-UPLOAD-Method-File.md) and [UPLOADINTOSTREAM Method \(File\)](devenv-UPLOADINTOSTREAM-Method-File.md) are used to send a file from the client to a [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance.  

 [DOWNLOAD Method \(FILE\)](devenv-DOWNLOAD-Method-File.md) and [DOWNLOADFROMSTREAM Method \(File\)](devenv-DOWNLOADFROMSTREAM-Method-File.md) are used to send a file from a [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance to the client.  

 We recommend that you use the methods in codeunit 419, File Management, to upload and download files.  

## Example  
 This example shows how to use the DOWNLOAD method. It requires that you create the following variable.  

|Variable name|DataType|  
|-------------------|--------------|  
|ToFile|Text|  

```  
ToFile := 'ToFile.txt';  
DOWNLOAD('FromFile.txt','Download file','C:\','Text file(*.txt)|*.txt',ToFile);  
```  

## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)
