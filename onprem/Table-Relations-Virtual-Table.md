---
title: "Table Relations Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b149e9d9-6f76-4034-b666-b8b81671ce48
caps.latest.revision: 2
---
# Table Relations Virtual Table
The **Table Relations** virtual table \(ID 2000000141\) contains information about table relations for all fields in [!INCLUDE[navnow](includes/navnow_md.md)] non-system tables.  
  
 The following table describes the fields in the **Table Relations** virtual table.  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**TableId**|ID of table that contains the field with the relation.|  
|**FieldNo**|Specifies the field number of the field with the relation.|  
|**RelationNo**|Specifies the identification number of the relation.|  
|**ConditionNo**|Specifies the identification number of the condition.|  
|**RelatedTableId**|Specifies the ID of related table.|  
|**RelatedFieldNo**|Specifies the field number of related field.|  
|**ConditionType**|Specifies the type of condition for the relation. It can contain the following values **CONST** or **FILTER**.|  
|**ConditionFieldNo**|Specifies the field number that is involved in the condition.|  
|**ConditionValue**|Specifies the condition value.|  
|**TestTableRelation**|Specifies whether to test the relation.|  
|V**alidateTableRelation**|Specifies whether to validate the relation.|  
  
## See Also  
 [Virtual Tables](Virtual-Tables.md)
