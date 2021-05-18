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
|[OnAfterAssignField Trigger](triggers-auto/xmlportfieldelement/devenv-onafterassignfield-xmlportfieldelement-trigger.md)|Runs after a field has been assigned a value and before it is validated and imported.<br /><br /> This trigger is only used to import data.|  
|[OnAfterAssignVariable Trigger](triggers-auto/xmlporttextelement/devenv-onafterassignvariable-xmlporttextelement-trigger.md)|Runs after the value defined in the XML document is assigned to the text variable.<br /><br /> This trigger is only used to import data.|  
|[OnAfterGetRecord (XMLports) Trigger](triggers-auto/xmlporttableelement/devenv-onaftergetrecord-xmlporttableelement-trigger.md)|Runs after a record is retrieved from a table and before it is exported to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterInitRecord Trigger](triggers-auto/xmlporttableelement/devenv-onafterinitrecord-xmlporttableelement-trigger.md)|Runs after a record is loaded.<br /><br /> This trigger is only used to import data.|  
|[OnAfterInsertRecord Trigger](triggers-auto/xmlporttableelement/devenv-onafterinsertrecord-xmlporttableelement-trigger.md)|Runs after a record has been inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnAfterModifyRecord Trigger](triggers-auto/xmlporttableelement/devenv-onaftermodifyrecord-xmlporttableelement-trigger.md)|Runs after a record has been modified. <br /><br /> The trigger is used to import data.|
|[OnBeforeInsertRecord Trigger](triggers-auto/xmlporttableelement/devenv-onbeforeinsertrecord-xmlporttableelement-trigger.md)|Runs after a record has been loaded and before it is inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnBeforeModifyRecord Trigger](triggers-auto/xmlporttableelement/devenv-onbeforemodifyrecord-xmlporttableelement-trigger.md)|Runs before a record is modified.<br /><br />This trigger is used to import data.|
|[OnBeforePassField Trigger](triggers-auto/xmlportfieldelement/devenv-onbeforepassfield-xmlportfieldelement-trigger.md)|Runs before a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnBeforePassVariable Trigger](triggers-auto/xmlporttextelement/devenv-onbeforepassvariable-xmlporttextelement-trigger.md)|Runs after the source expression has been formatted into a text variable and before the text variable is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnInitXmlPort Trigger](triggers-auto/xmlport/devenv-oninitxmlport-xmlport-trigger.md)|Executes when the XMLport is loaded and before any table views and filters are set.|  
|[OnPreXmlPort Trigger](triggers-auto/xmlport/devenv-onprexmlport-xmlport-trigger.md)|Runs after the table views and filters are set and before the XMLport is run.|  
|[OnPostXmlPort Trigger](triggers-auto/xmlport/devenv-onpostxmlport-xmlport-trigger.md)|Runs after the XMLport is run.|  
|[OnPreXmlItem Trigger](triggers-auto/xmlporttableelement/devenv-onprexmlitem-xmlporttableelement-trigger.md)|Runs after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLport elements that have a source type of Table.<br /><br /> This trigger is only used to export data.|  

## See Also

[XMLPort Object](devenv-xmlport-object.md)  
[Triggers](triggers-auto/devenv-triggers.md)  
[XMLPort Properties](properties/devenv-xmlport-properties.md)  
