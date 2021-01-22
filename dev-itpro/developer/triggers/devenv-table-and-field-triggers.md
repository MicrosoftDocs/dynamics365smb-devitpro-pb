---
title: "Table and Field Triggers"
description: "Table and field triggers in AL for Business Central."
ms.author: solsen
ms.custom: na
ms.date: 01/22/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Table and Field Triggers

[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] recognizes certain actions that happen to a table when you use it, for example, when you insert or modify data. In response, you specify to run AL code defined in a trigger. Triggers are predefined methods that are run when certain actions happen. The bodies of these methods are initially empty and must be defined by the developer. Defining AL code in triggers allows you to change the default behavior of [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  

The triggers in a table can be divided into two categories:  

- Table triggers
- Field triggers

Tables have the following triggers.  

|Table trigger|Runs when|  
|-------------------|-------------------|  
|[OnInsert Trigger](devenv-oninsert-trigger.md)|A new record is inserted into the table.|  
|[OnBeforeInsert Trigger](devenv-onbeforeinsert-trigger.md)|A new record is inserted into the table.|
|[OnAfterInsert Trigger](devenv-onafterinsert-trigger.md)|A new record is inserted into the table.|
|[OnModify Trigger](devenv-onmodify-trigger.md)|A record in the table is modified.|
|[OnBeforeModify Trigger](devenv-onbeforemodify-trigger.md)|A record in the table is modified.|
|[OnAfterModify Trigger](devenv-onaftermodify-trigger.md)|A record in the table is modified.|  
|[OnDelete Trigger](devenv-ondelete-trigger.md)|A record in the table is deleted.|
|[OnBeforeDelete Trigger](devenv-onbeforedelete-trigger.md)|A record in the table is deleted.|
|[OnAfterDelete Trigger](devenv-onafterdelete-trigger.md)|A record in the table is deleted.|
|[OnRename Trigger](devenv-onrename-trigger.md)|A record is modified in a primary key field.|  
|[OnBeforeRename Trigger](devenv-onbeforerename-trigger.md)|A record is modified in a primary key field.|  
|[OnAfterRename Trigger](devenv-onafterrename-trigger.md)|A record is modified in a primary key field.|  

Fields have the following triggers.  

|Field trigger|Runs when|  
|-------------------|-------------------|  
|[OnValidate (Fields) Trigger](devenv-onvalidate-fields-trigger.md)|Data is entered in a field or when the [Validate (Record) method](../methods-auto/record/record-validate-method.md) is run.|  
|[OnLookup (Fields) Trigger](devenv-onlookup-fields-trigger.md)|Lookup is activated.|  
|[OnAfterLookup (Fields) Trigger](devenv-onafterlookup-trigger.md)|Field is selected and lookup is closed.|
|[OnBeforeValidate (Fields) Trigger](devenv-onbeforevalidate-fields-trigger.md)|Before data is entered in a field.|
|[OnAfterValidate (Fields) Trigger](devenv-onaftervalidate-fields-trigger.md)|After data is entered in a field.|

## See Also

[Table Object](../devenv-table-object.md)  
[Table Extension Object](../devenv-table-ext-object.md)  
[Triggers](devenv-triggers.md)  
[Table and Table Extension Properties](../properties/devenv-table-properties.md)  