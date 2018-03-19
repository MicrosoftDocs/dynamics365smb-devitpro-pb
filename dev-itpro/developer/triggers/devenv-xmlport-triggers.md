---
title: "XMLport Triggers"
ms.custom: na
ms.date: 03/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: bc6beaeb-07bb-4a5e-b84a-3c48b17f3c54
author: SusanneWindfeldPedersen
manager: edupont
---


# XMLport Triggers
The following triggers apply to XMLports.  

## XMLport Triggers  

|XMLport trigger|Executed|  
|---------------------|--------------|  
|[OnAfterAssignField Trigger](devenv-onafterassignfield-trigger.md)|Executed after a field has been assigned a value and before it is validated and imported.<br /><br /> This trigger is only used to import data.|  
|[OnAfterAssignVariable Trigger](devenv-onafterassignvariable-trigger.md)|Executed after the value defined in the XML document is assigned to the text variable.<br /><br /> This trigger is only used to import data.|  
|[OnAfterGetField Trigger](devenv-onaftergetfield-trigger.md)|Executed after a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterGetRecord \(XMLports\) Trigger](devenv-onaftergetrecord-xmlports-trigger.md)|Executed after a record is retrieved from a table and before it is exported to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterInitRecord Trigger](devenv-onafterinitrecord-trigger.md)|Executed after a record is loaded.<br /><br /> This trigger is only used to import data.|  
|[OnAfterInsertRecord Trigger](devenv-onafterinsertrecord-trigger.md)|Executed after a record has been inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnAfterModifyRecord Trigger](devenv-onaftermodifyrecord-trigger.md)|Executed after a record has been modified. <br /><br /> The trigger is used to import data.|
|[OnBeforeInsertRecord Trigger](devenv-onbeforeinsertrecord-trigger.md)|Executed after a record has been loaded and before it is inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnBeforeModifyRecord Trigger](devenv-onbeforemodifyrecord-trigger.md)|Executed before a record is modified.<br /><br />This trigger is used to import data.|
|[OnBeforePassField Trigger](devenv-onbeforepassfield-trigger.md)|Executed before a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnBeforePassVariable Trigger](devenv-onbeforepassvariable-trigger.md)|Executed after the source expression has been formatted into a text variable and before the text variable is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnInitXMLport Trigger](devenv-oninitxmlport-trigger.md)|Executes when the XMLport is loaded and before any table views and filters are set.|  
|[OnPreXMLport Trigger](devenv-onprexmlport-trigger.md)|Executed after the table views and filters are set and before the XMLport is run.|  
|[OnPostXMLport Trigger](devenv-onpostxmlport-trigger.md)|Executes after the XMLport is run.|  
|[OnPreXMLItem Trigger](devenv-onprexmlitem-trigger.md)|Executed after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLport elements that have a source type of Table.<br /><br /> This trigger is only used to export data.|  

## See Also  
[Triggers](devenv-triggers.md)  
[XMLport Properties](../properties/devenv-xmlport-properties.md)  
<!--
[How to: Define or Modify Table or Field Triggers](How-to-define-or-modify-table-or-field-triggers.md)
-->
