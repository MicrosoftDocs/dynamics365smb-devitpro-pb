---
title: "FIELDCAPTION Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4b1bcb52-fea1-4981-9b12-c8299f1893b4
caps.latest.revision: 15
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FIELDCAPTION Method (Record)
Gets the current caption of the specified field as a string.  
  
## Syntax  
  
```  
  
Caption := Record.FIELDCAPTION(Field)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that holds the field for which you want to retrieve the caption.  
  
 *Field*  
 Type: Field  
  
 The field for which you want to retrieve the caption.  
  
## Property Value/Return Value  
 Type: Text or code  
  
 The caption is a string.  
  
## Remarks  
 The **FIELDCAPTION** method returns the caption of a specified field. **FIELDCAPTION** searches for a [CaptionML Property](../properties/devenv-CaptionML-Property.md). If none is found, the [Name Property](../properties/devenv-Name-Property.md) is used. This means that **FIELDCAPTION** has multilanguage functionality.  
  
## Example  
 The following example uses the **FIELDCAPTION** method to retrieve the caption of the Address 2 field in the **Customer** table. The method stores the retrieved caption in the varFieldCaption variable and displays it in a message box. In this **Customer** table, the field name is the same as the caption so the value Address 2 is displayed for the caption. If you change the caption for Address 2 in the Address 2 property window, then the new caption will be displayed. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|varFieldCaption|Text|Not applicable|  
  
```  
varFieldCaption := MyRecord.FIELDCAPTION("Address 2");  
MESSAGE(varFieldCaption);  
```  
  
## See Also  
 [TABLECAPTION Method \(Record\)](devenv-TABLECAPTION-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)   
 [Multilanguage Development](../devenv-multilanguage-development.md)