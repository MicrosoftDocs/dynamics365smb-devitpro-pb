---
title: "ISPATHTEMPORARY Method (File)"
ms.custom: na
ms.date: 06/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---

# ISPATHTEMPORARY Method (File)

Validates whether the file is located within the current user's temporary folder in the current service.

## Syntax

``` 
[Ok :=] File.IsPathTemporary(FileName);
``` 

#### Parameters  

*FileName*  
Type: Text  

## Property Value/Return Value  
Type: Boolean
 
**true** if the FileName represents a file located within the current users temporary folder in the current service; otherwise **false**. 


Sends a file from the client device to the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. The client device is the device <!--NAV that is running the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or -->, such as a computer or phone, that accesses [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].

## Remarks  
Notice that the File.Open, File.Create functions now applies the same validation when the service runs as an Azure service. On-Premise installations will be able to access files in the local filesystem and is only limited by the access rights configured for the service user. 

## Example  
```
// Will return true
Ok := FILE.ISPATHTEMPORARY('FileNoPath.txt');

//  Will return false or show an error to the user if the return value is not assigned.
Ok := FILE.ISPATHTEMPORARY('c:\Temp\MyTempFile.txt');
```
Application pattern:
```
IF NOT FILE.ISPATHTEMPORARY(<bad path>) THEN
  ERROR(<error message>)
```


## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)
