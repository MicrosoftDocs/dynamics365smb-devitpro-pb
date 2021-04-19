---
title: "XMLport Triggers"
description: "XMLport triggers in AL for Business Central."
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# XMLport Triggers
The following triggers apply to XMLports.  

## XMLport triggers  

|XMLport trigger|Runs|  
|---------------------|--------------|  
|[OnAfterAssignField Trigger](devenv-onafterassignfield-trigger.md)|Runs after a field has been assigned a value and before it is validated and imported.<br /><br /> This trigger is only used to import data.|  
|[OnAfterAssignVariable Trigger](devenv-onafterassignvariable-trigger.md)|Runs after the value defined in the XML document is assigned to the text variable.<br /><br /> This trigger is only used to import data.|  
|[OnAfterGetField Trigger](devenv-onaftergetfield-trigger.md)|Runs after a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterGetRecord (XMLports) Trigger](devenv-onaftergetrecord-xmlports-trigger.md)|Runs after a record is retrieved from a table and before it is exported to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterInitRecord Trigger](devenv-onafterinitrecord-trigger.md)|Runs after a record is loaded.<br /><br /> This trigger is only used to import data.|  
|[OnAfterInsertRecord Trigger](devenv-onafterinsertrecord-trigger.md)|Runs after a record has been inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnAfterModifyRecord Trigger](devenv-onaftermodifyrecord-trigger.md)|Runs after a record has been modified. <br /><br /> The trigger is used to import data.|
|[OnBeforeInsertRecord Trigger](devenv-onbeforeinsertrecord-trigger.md)|Runs after a record has been loaded and before it is inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnBeforeModifyRecord Trigger](devenv-onbeforemodifyrecord-trigger.md)|Runs before a record is modified.<br /><br />This trigger is used to import data.|
|[OnBeforePassField Trigger](devenv-onbeforepassfield-trigger.md)|Runs before a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnBeforePassVariable Trigger](devenv-onbeforepassvariable-trigger.md)|Runs after the source expression has been formatted into a text variable and before the text variable is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnInitXmlPort Trigger](devenv-oninitxmlport-trigger.md)|Executes when the XMLport is loaded and before any table views and filters are set.|  
|[OnPreXmlPort Trigger](devenv-onprexmlport-trigger.md)|Runs after the table views and filters are set and before the XMLport is run.|  
|[OnPostXmlPort Trigger](devenv-onpostxmlport-trigger.md)|Runs after the XMLport is run.|  
|[OnPreXmlItem Trigger](devenv-onprexmlitem-trigger.md)|Runs after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLport elements that have a source type of Table.<br /><br /> This trigger is only used to export data.|  

## See Also

[XMLPort Object](../devenv-xmlport-object.md)  
[Triggers](devenv-triggers.md)  
[XMLPort Properties](../properties/devenv-xmlport-properties.md)  
