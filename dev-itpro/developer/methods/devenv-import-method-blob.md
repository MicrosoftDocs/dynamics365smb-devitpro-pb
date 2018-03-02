---
title: "IMPORT Method (BLOB)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 21394df3-3a62-40ee-b56a-7e7ae2d2f1a0
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# IMPORT Method (BLOB)
Imports a binary large object \(BLOB\).  

## Syntax  

```  

[ImportName] := Blob.IMPORT([Name [, CommonDialog]])  
```  

#### Parameters  
 *Blob*  
 Type: Variable  

 The BLOB that you want to import.  

 *Name*  
 Type: Text or code  

 The path and name of the BLOB that you want to import.  

 When you enter the path, consider the following shortcuts:  

-   You can omit the drive letter if the command is located on the current drive.  

-   You can omit the full path if the command is located in the current directory.  

-   You can enter only the subdirectory name if the command is located in a subdirectory of the current directory.  

 *CommonDialog*  
 Type: Boolean  

 Specifies whether you want to display an import dialog box before the BLOB is imported. This dialog box lets you select the file that you want to import. Based on the [SubType Property \(BLOB\)](../properties/devenv-subtype-blob-property.md), only the relevant file types are listed, such as bitmap files \(\*.bmp\), memo files \(\*.txt\), or all files \(\*.\*\).  

 If the *CommonDialog* parameter is **true**, then [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] displays the import dialog box. If the *CommonDialog* parameter is **false** \(default\), then [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] does not display the import dialog box.  

## Property Value/Return Value  
 Type: text  

 The name and path of the imported file.  

 If the return value is the file's name and path, then the BLOB was imported.  

 If the return value is an empty string, then the BLOB was not imported.  

## See Also  
 [BLOB Data Type](../datatypes/devenv-BLOB-Data-Type.md)
