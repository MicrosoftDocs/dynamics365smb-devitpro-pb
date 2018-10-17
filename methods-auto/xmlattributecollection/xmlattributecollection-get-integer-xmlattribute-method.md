---
title: "Get Method"
ms.author: solsen
ms.custom: na
ms.date: 09/30/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Get Method
Gets the specified attribute.

## Syntax
```
[Ok := ]  XmlAttributeCollection.Get(Index: Integer, var Result: XmlAttribute)
```
## Parameters
*XmlAttributeCollection*  
&emsp;Type: [XmlAttributeCollection](xmlattributecollection-data-type.md)  
An instance of the [XmlAttributeCollection](xmlattributecollection-data-type.md) data type.  

*Index*  
&emsp;Type: [Integer](integer-data-type.md)  
The index of the attribute to retrieve.
        
*Result*  
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)  
Variable containing the requested XmlAttribute if the operation is successful.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttributeCollection Data Type](xmlattributecollection-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)