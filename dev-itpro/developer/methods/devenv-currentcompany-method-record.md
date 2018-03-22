---
title: "CURRENTCOMPANY Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f3861f45-1254-42be-a4ca-9e39ebaa8be0
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTCOMPANY Method (Record)
Gets the current company of a database table record.  
  
## Syntax  
  
```  
  
CurrentCompany := Record.CURRENTCOMPANY  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 A record that refers to the table for which you want to find the company that is currently in use.  
  
## Property Value/Return Value  
 Type: Text or code  
  
 The name of the current company of *Record*.  
  
## Example  
 The following example returns the current company that is used in the **Customer** table and displays it in a message box. The MyRecord record is from the **Customer** table. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|CurrentCompany|Text||  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The current company is: %1|  
  
```  
CurrentCompany := MyRecord.CURRENTCOMPANY;  
MESSAGE(Text000, CurrentCompany);  
```  
  
## See Also  
 [CHANGECOMPANY Method \(Record\)](devenv-CHANGECOMPANY-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)