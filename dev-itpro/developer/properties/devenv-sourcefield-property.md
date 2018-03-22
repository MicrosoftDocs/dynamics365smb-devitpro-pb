---
title: "SourceField Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1bb41d0e-f4c8-4ec7-9e8b-3ecbe76e26ba
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# SourceField Property
Sets the field that you want to map XML data to.  
  
## Applies To  
 XMLports  
  
## Remarks  
 This property is only available if you have selected Field in the [SourceType Property](devenv-sourcetype-property.md).  
  
 You need to select Table as the SourceType of the parent tag and specify the table in the [SourceTable Property](devenv-sourcetable-property.md).  
  
 The SourceField property is related to the DataSource field in XMLport Designer.  
  
 When you choose the **AssistButton** in the Value field for the SourceField property, the window that opens lists all the tables that have been defined as part of this XMLport and you can select a field from one of these tables.  
  
 If you have given a table a variable name in the **Properties** window for that element, this name is displayed in the **Field Lookup** window.  
  
 When you select the variable name that you have given the current table, the selection is displayed in the DataSource field of XMLport Designer and in the Value field of the SourceField property in the following format:  
  
```  
tablevariablename::fieldname  
```  
  
## See Also  
 [SourceType Property](devenv-sourcetype-property.md)   
 [SourceTable Property](devenv-sourcetable-property.md)