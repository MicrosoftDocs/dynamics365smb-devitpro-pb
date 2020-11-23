---
title: "TestTableRelation Property"
ms.author: solsen
ms.custom: na
ms.date: 11/17/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestTableRelation Property
> **Version**: _Available from runtime version 1.0 until version 1.0 where it was deprecated._

Sets whether to include this field when evaluating field relations between primary and secondary indexes.

## Applies to
-   Table Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if you want to test the table relationship for this field; otherwise, **false**. The default is **true**.  

## Syntax

```AL
TestTableRelation = false;
```
  
## Remarks  

You may want to use this property to exclude certain fields from the table relation test. For example, if a table in your application has a field that is a foreign key, but records from the other table may have been deleted, then you would not want to test the relationship with this table. Only set this property to **false** if you are certain that testing this relationship would only cause errors that do not compromise the consistency of your application tables.  
  
This test is available from the **Database** option on the **File** menu. You can use this property to limit the number of relationships that are tested.  
  
If you set the ValidateTableRelation property to **false**, then you should also set the TestTableRelation property to **false**. Otherwise, a database test on the field relations in a database may fail.  
  
## See Also  

[Properties](devenv-properties.md)   
[TestTableRelation](devenv-testtablerelation-property.md)   
[ValidateTableRelation Property](devenv-validatetablerelation-property.md)