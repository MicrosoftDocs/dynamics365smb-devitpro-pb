---
title: "Table and Field Triggers"
ms.custom: na
ms.date: 03/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1b65a764-c293-4153-9e3d-f30930789e71
author: SusanneWindfeldPedersen
manager: edupont
---


# Table and Field Triggers
[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] recognizes certain actions that happen to a table when you use it, for example, when you insert or modify data. In response, you specify to execute AL code defined in a trigger. Triggers are predefined methods that are executed when certain actions happen. The bodies of these methods are initially empty and must be defined by the developer. Defining AL code in triggers allows you to change the default behavior of [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  

The triggers in a table can be divided into two categories:  

-   Table triggers  

-   Field triggers      

Tables have the following triggers.  

|Table trigger|Executes when|  
|-------------------|-------------------|  
|[OnInsert Trigger](devenv-oninsert-trigger.md)|A new record is inserted into the table.|  
|[OnModify Trigger](devenv-onmodify-trigger.md)|A record in the table is modified.|  
|[OnDelete Trigger](devenv-ondelete-trigger.md)|A record in the table is deleted.|  
|[OnRename Trigger](devenv-onrename-trigger.md)|A record is modified in a primary key field.|  

 Fields have the following triggers.  

|Field trigger|Executes when|  
|-------------------|-------------------|  
|[OnValidate (Fields) Trigger](devenv-onvalidate-fields-trigger.md)|Data is entered in a field or when the [VALIDATE Record)](../methods/devenv-validate-method-record.md) is executed.|  
|[OnLookup (Fields) Trigger](devenv-onlookup-fields-trigger.md)|Lookup is activated.|  

## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Table Extension Properties](../properties/devenv-table-properties.md)  