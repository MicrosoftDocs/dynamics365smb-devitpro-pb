---
title: "COMPANYNAME Method (Database)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a516ccda-c1fc-4dd9-8c38-77c09f4c1f7b
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COMPANYNAME Method (Database)
Gets the current company name.  
  
## Syntax  
  
```  
  
Name := COMPANYNAME  
```  
  
## Property Value/Return Value  
 Type: Text constant or code  
  
 The name of the company, or an empty string if no company has been selected.  
  
## Example  
 This example requires that you create the following variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|CompName|Text|1024|  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The name is %1.|  
  
```  
CompName := COMPANYNAME;  
MESSAGE(Text000, CompName);  
```  
  
## See Also  
 [Database Methods](devenv-database-methods.md)