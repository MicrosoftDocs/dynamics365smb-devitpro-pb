---
title: Table and Field Triggers 
description: Triggers are predefined functions that are executed when certain actions happen to a table, when you use it, for example, insert or modify data.
ms.custom: na
ms.date: 10/20/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1b65a764-c293-4153-9e3d-f30930789e71
caps.latest.revision: 6
manager: edupont
---
# Table and Field Triggers in Dynamics NAV
[!INCLUDE[navnow](includes/navnow_md.md)] recognizes certain actions that happen to a table when you use it, for example, that you insert or modify data. In response, you can set up [!INCLUDE[navnow](includes/navnow_md.md)] to execute C/AL code defined in a trigger. Triggers are predefined functions that are executed when certain actions happen. The bodies of these functions are initially empty and must be defined by the developer. Defining C/AL code in triggers allows you to change the default behavior of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 The triggers in a table can be divided into two categories:  
  
-   Table triggers  
  
-   Field triggers  
  
 Tables have the following triggers.  
  
|Table trigger|Executes when|  
|-------------------|-------------------|  
|[OnInsert Trigger](OnInsert-Trigger.md)|A new record is inserted into the table.|  
|[OnModify Trigger](OnModify-Trigger.md)|A record in the table is modified.|  
|[OnDelete Trigger](OnDelete-Trigger.md)|A record in the table is deleted.|  
|[OnRename Trigger](OnRename-Trigger.md)|A record is modified in a primary key field.|  
  
 Fields have the following triggers.  
  
|Field trigger|Executes when|  
|-------------------|-------------------|  
|[OnValidate \(Fields\) Trigger](OnValidate--Fields--Trigger.md)|Data is entered in a field or when the [VALIDATE Function \(Record\)](VALIDATE-Function--Record-.md) is executed.|  
|[OnLookup \(Fields\) Trigger](OnLookup--Fields--Trigger.md)|Lookup is activated.|  
  
## See Also  
 [How to: Define or Modify Table or Field Triggers](How-to--Define-or-Modify-Table-or-Field-Triggers.md)