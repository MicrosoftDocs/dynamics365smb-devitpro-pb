---
title: "FIELDNAME Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 63760b9b-4131-41cd-b9d2-4bf5867c2516
caps.latest.revision: 12
manager: edupont
---
# FIELDNAME Function (Record)
Gets the name of a field as a string.  

## Syntax  

```  

Name := Record.FIELDNAME(Field)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The name of the record that contains the field.  

 *Field*  
 Type: Field  

 The name of the field in the record.  

## Property Value/Return Value  
 Type: Text constant or code  

 The name of the field specified.  

## Remarks  
 The [FIELDCAPTION Function \(Record\)](FIELDCAPTION-Function--Record-.md) retrieves the [Caption Property](Caption-Property.md) of a field. If you want to enable your application for multilanguage functionality now or in the future, you must use the **FIELDCAPTION** function instead of the **FIELDNAME** function.  

## Example  
 This example requires that you create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|NameOfField|Text|Not applicable|  
|CustomerRec|Record|Customer|  

```  
NameOfField := CustomerRec.FIELDNAME("No.");  
```  

 The name of the field is stored in a string.  

 The advantage of using this statement instead of `Name := 'No.';` is that using the **FIELDNAME** function dynamically adapts to any change to the field name made in the development system. The statement `Name := 'No.';` performs a static assignment.  

## See Also  
 [Record Data Type](Record-Data-Type.md)   
 [Multilanguage Development](Multilanguage-Development.md)
