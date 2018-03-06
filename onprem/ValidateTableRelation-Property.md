---
title: "ValidateTableRelation Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e582fbdb-5a43-4c9f-bd79-84eb724590c7
caps.latest.revision: 11
manager: edupont
---
# ValidateTableRelation Property
Sets whether to validate a table relationship.  
  
## Applies To  
  
-   Fields  
  
## Property Value  
 **Yes** if you want to validate the table relationship; otherwise, **No**. The default is **Yes**.  
  
## Remarks  
 For fields, use this property to determine whether to validate the user's entry based on the information already in the table set up through the [TableRelation Property](TableRelation-Property.md) property.  
  
 If you want to let users enter any value without validating the entry, then choose **No**. For example, on the item card, you can specify the vendor that you typically purchase the item from. Set this property to **No** to allow users to select a vendor that may not already be in the **Vendor** table.  
  
 If you set the ValidateTableRelation property to **No**, then you should also set the TestTableRelation property to **No**. Otherwise, a database test on the field relations in a database may fail.  
  
## See Also  
 [TestTableRelation Property](TestTableRelation-Property.md)