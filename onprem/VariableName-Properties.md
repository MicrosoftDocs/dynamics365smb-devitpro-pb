---
title: "VariableName Properties"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a706d220-a1d8-4ff1-81d6-ee81be6f3323
caps.latest.revision: 7
manager: edupont
---
# VariableName Properties
Sets a variable name for the table that you have specified in the [SourceTable Property](SourceTable-Property.md). It is also used to specify a variable name for a text that you have specified in the [SourceType Property](SourceType-Property.md).  
  
## Applies To  
 XMLports  
  
## Remarks  
 The text or table variables that you define here act the same way as variables that are defined in the C/AL Globals window. However, these variables are only visible in the C/AL Symbol Menu.  
  
 The values of the VariableName and [SourceTable Property](SourceTable-Property.md) correspond to the contents of the DataSource field in XMLport Designer. The values that you enter in these properties in the **Properties** window are shown in the DataSource field in XMLport Designer.  
  
 If you have defined a text variable, you can only see the name of the text variable in the DataSource field in XMLport Designer.  
  
 If you have defined a table as an XML item, the DataSource field can display the following information.  
  
 **Properties window:**  
  
 SourceTable  
  
 *Customer*  
  
 *Customer*  
  
 VariableName  
  
 `<Customer>` default  
  
 Cust.  
  
 **XMLport Designer:**  
  
 DataSource field  
  
 `<Customer>` \(Customer\)  
  
 Cust. `<Customer>`  
  
## See Also  
 [SourceTable Property](SourceTable-Property.md)   
 [SourceType Property](SourceType-Property.md)