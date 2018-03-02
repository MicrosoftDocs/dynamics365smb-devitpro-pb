---
title: "TestTableRelation Property"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d4b37c19-bcb3-49d2-868d-126be1d383be
caps.latest.revision: 8
manager: edupont
---
# TestTableRelation Property
Sets whether to include this field when evaluating field relations between primary and secondary indexes.  
  
## Applies To  
 Fields  
  
## Property Value  
 **Yes** if you want to test the table relationship for this field; otherwise, **No**. The default is **Yes**.  
  
## Remarks  
 You may want to use this property to exclude certain fields from the table relation test. For example, if a table in your application has a field that is a foreign key, but records from the other table may have been deleted, then you would not want to test the relationship with this table. Only set this property to **No** if you are certain that testing this relationship would only cause errors that do not compromise the consistency of your application tables.  
  
 This test is available from the **Database** option on the **File** menu. You can use this property to limit the number of relationships that are tested.  
  
 If you set the ValidateTableRelation property to **No**, then you should also set the TestTableRelation property to **No**. Otherwise, a database test on the field relations in a database may fail.  
  
## See Also  
 [TestTableRelation](TestTableRelation-Property.md)   
 [ValidateTableRelation Property](ValidateTableRelation-Property.md)