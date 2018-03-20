---
title: "NodeType Property"
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 876916ae-b69b-431f-93c2-8536336cc9b7
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 

# NodeType Property
Sets the value to specify whether an XML object is an element or an attribute.  
  
## Applies To  
 XMLports  
  
## Remarks  
 The possible values are as follows: **Element** and **Attribute**. The default value is **Undefined**. In an XML document, you can use the **Element** node to represent a record and the **Attribute** node to represent the fields in the record. For example, the following code defines a table with one record and the record contains two fields: `<Record> <Field1>123</Field><Field2>456</Field2> </Record>`  
  
|Value|Description|  
|-----------|-----------------|  
|Element|Describes the data that it contains. The data could be record. For example, `<Record> “Data 1” </Record>` could represent an element that contains 1 record.|  
|Attribute|An attribute could represent a field in the record. For example, the <Record></Record> Element could contain two fields, as shown in the code example. An attribute cannot contain other elements.|  
  
## See Also  
 [NodeName Property](devenv-nodename-property.md)