---
title: "ExternalBusinessEvent Attribute"
description: "Specifies that the method is published as an external business event."
ms.author: solsen
ms.custom: na
ms.date: 01/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# ExternalBusinessEvent Attribute
> **Version**: _Available or changed with runtime version 11.0._

Specifies that the method is published as an external business event.


## Applies To

- Method


## Syntax

```AL
[ExternalBusinessEvent(Name: Text, DisplayName: Text, Description: Text, Category: enum)]
```

### Arguments
*Name*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a name for the external business event.  

*DisplayName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a user friendly name for the external business event.  

*Description*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a description of the external business event.  

*Category*  
&emsp;Type: [enum](../methods-auto/anyenum/anyenum-data-type.md)  
Specifies the category of the event.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  