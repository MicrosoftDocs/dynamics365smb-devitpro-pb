---
title: "TableRelation Property"
ms.custom: na
ms.date: 07/28/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4890e233-6301-4d7e-888f-2021ea5946da
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# TableRelation Property
Sets relationships \(links\) to other tables. For example, if you want to provide a lookup into another table, enter the name of that table in this property.  
  
## Applies To  
  
-   Table Fields  
  
-   Page Fields  
  
## Remarks  
 The TableRelation property lets you establish lookups into other tables. For example, on the Item card you can select a vendor from who you usually purchase an item. This is done through a table relationship.  
  
 This property is also used to define where to look to validate entries.  
  
 In addition, when you choose the option to test the relationships between primary and secondary indexes, this property defines what to test. This option is one of the **Database** options on the **File** menu.  
  
## See Also  
 [ValidateTableRelation Property](devenv-validatetablerelation-property.md)   
 [TestTableRelation Property](devenv-testtablerelation-property.md)