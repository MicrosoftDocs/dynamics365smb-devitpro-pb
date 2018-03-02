---
title: "SourceTable Property (XMLports)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 936e25f2-6f64-44b4-b455-d91fb5dbb55b
caps.latest.revision: 4
manager: edupont
---
# SourceTable Property (XMLports)
Sets the table to which you want to map XML data or the table that you want to export data from.  
  
## Applies To  
 XMLports  
  
## Remarks  
 This property is available if you selected Table in the [SourceType Property](SourceType-Property.md).  
  
 The values of the [VariableName Properties](VariableName-Properties.md) and the SourceTable properties correspond to the contents of the DataSource field in XMLport Designer. The values that you enter in these properties in the **Properties** window are shown in the DataSource field in XMLport Designer.  
  
 If you have defined a text variable, you can only see the name of the text variable in the DataSource field in the XMLport Designer. For example, if you have defined a table as an XML item, the DataSource field can display the following information.  
  
|Properties window<br /><br /> SourceTable|Properties window<br /><br /> VariableName|XMLport Designer|  
|---------------------------------------|----------------------------------------|----------------------|  
|Customer|\<Customer> default|\<Customer>\(Customer\)|  
|Customer|Cust.|Cust.\<Customer>|  
  
## See Also  
 [SourceType Property](SourceType-Property.md)   
 [VariableName Properties](VariableName-Properties.md)