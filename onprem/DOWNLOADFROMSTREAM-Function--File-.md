---
title: "DOWNLOADFROMSTREAM Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0823a1e7-a870-41ef-813d-fdb25fbaf73b
caps.latest.revision: 29
manager: edupont
---
# DOWNLOADFROMSTREAM Function (File)
Sends a file from [!INCLUDE[nav_server](includes/nav_server_md.md)] computer to the client computer. The client computer is the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the computer that is running the browser that accesses the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## Syntax  
  
```  
  
[Ok :=] DOWNLOADFROMSTREAM(VarInstream, DialogTitle, ToFolder, ToFilter, ToFile)  
```  
  
#### Parameters  
 *VarInStream*  
 Type: Variant  
  
 An InStream that you want to use to send the data in a file on [!INCLUDE[nav_server](includes/nav_server_md.md)] to a file on the client computer.  
  
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
  
 The name to give the downloaded file. This is the default file name that is shown in the dialog box for downloading the file. This value, can be changed by the user.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, then a run-time error occurs if the record cannot be found. If you include a return value, then you must handle any errors.  
  
 **true** if the file was downloaded; otherwise, **false**.  
  
## Remarks  
  
> [!NOTE]  
>  This function is not fully supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)] on devices that run Apple iOS, such as iPad. You can only download a file if the Apple iOS device on which you are downloading the file has an application that supports the file type.  
  
 The business logic runs on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] and not on the client. Files are created on a [!INCLUDE[navnow](includes/navnow_md.md)] service and not locally on the client computer. When you write code, you must consider where files are created.  
  
 Use [UPLOAD Function \(File\)](UPLOAD-Function--File-.md) and [UPLOADINTOSTREAM Function \(File\)](UPLOADINTOSTREAM-Function--File-.md) to send a file from a client to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
 Use [DOWNLOAD Function \(File\)](DOWNLOAD-Function--File-.md) and [DOWNLOADFROMSTREAM Function \(FILE\)](DOWNLOADFROMSTREAM-Function--File-.md) to send a file from a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to a client.  
  
 We recommend that you use the functions in codeunit 419, File Management, to upload and download files.  
  
## Example  
 This example requires that you create the following variables.  
  
|Name|DataType|  
|----------|--------------|  
|TempFile|File|  
|NewStream|InStream|  
|ToFileName|Variant|  
  
```  
TempFile.CREATETEMPFILE();  
TempFile.WRITE('abc');  
TempFile.CREATEINSTREAM(NewStream);  
ToFileName := 'SampleFile.txt';  
DOWNLOADFROMSTREAM(NewStream,'Export','','All Files (*.*)|*.*',ToFileName)  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)   
 [Walkthrough: Transferring a File from Microsoft Dynamics NAV Server to the Client](Walkthrough--Transferring-a-File-from-Microsoft-Dynamics-NAV-Server-to-the-Client.md)