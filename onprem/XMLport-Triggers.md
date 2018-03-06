---
title: "XMLport Triggers"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bc6beaeb-07bb-4a5e-b84a-3c48b17f3c54
caps.latest.revision: 5
manager: edupont
---
# XMLport Triggers
The following triggers apply to XMLports.  
  
## XMLport Triggers  
  
|XMLport trigger|Executed|  
|---------------------|--------------|  
|[OnAfterAssignField Trigger](OnAfterAssignField-Trigger.md)|Executed after a field has been assigned a value and before it is validated and imported.<br /><br /> This trigger is only used to import data.|  
|[OnAfterAssignVariable Trigger](OnAfterAssignVariable-Trigger.md)|Executed after the value defined in the XML document is assigned to the text variable.<br /><br /> This trigger is only used to import data.|  
|[OnAfterGetField Trigger](OnAfterGetField-Trigger.md)|Executed after a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterGetRecord \(XMLports\) Trigger](OnAfterGetRecord--XMLports--Trigger.md)|Executed after a record is retrieved from a table and before it is exported to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnAfterInitRecord Trigger](OnAfterInitRecord-Trigger.md)|Executed after a record is loaded.<br /><br /> This trigger is only used to import data.|  
|[OnAfterInsertRecord Trigger](OnAfterInsertRecord-Trigger.md)|Executed after a record has been inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnAfterModifyRecord Trigger](OnAfterModifyRecord-Trigger.md)|Executed after a record has been modified. <br /><br /> The trigger is used to import data.|
|[OnBeforeInsertRecord Trigger](OnBeforeInsertRecord-Trigger.md)|Executed after a record has been loaded and before it is inserted into a database table.<br /><br /> This trigger is only used to import data.|  
|[OnBeforeModifyRecord Trigger](OnBeforeModifyRecord-Trigger.md)|Executed before a record is modified.<br /><br />This trigger is used to import data.|
|[OnBeforePassField Trigger](OnBeforePassField-Trigger.md)|Executed before a field is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnBeforePassVariable Trigger](OnBeforePassVariable-Trigger.md)|Executed after the source expression has been formatted into a text variable and before the text variable is passed to the XML document.<br /><br /> This trigger is only used to export data.|  
|[OnInitXMLport Trigger](OnInitXMLport-Trigger.md)|Executes when the XMLport is loaded and before any table views and filters are set.|  
|[OnPreXMLport Trigger](OnPreXMLport-Trigger.md)|Executed after the table views and filters are set and before the XMLport is run.|  
|[OnPostXMLport Trigger](OnPostXMLport-Trigger.md)|Executes after the XMLport is run.|  
|[OnPreXMLItem Trigger](OnPreXMLItem-Trigger.md)|Executed after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLport elements that have a source type of Table.<br /><br /> This trigger is only used to export data.|  
  
## See Also  
 [How to: Define or Modify Table or Field Triggers](How-to--Define-or-Modify-Table-or-Field-Triggers.md)