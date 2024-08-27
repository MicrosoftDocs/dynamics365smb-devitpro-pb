---
title: "ExternalBusinessEvent attribute"
description: "Specifies that the method is published as an external business event."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# ExternalBusinessEvent attribute
> **Version**: _Available or changed with runtime version 11.0._

Specifies that the method is published as an external business event.


## Applies to

- Method


## Syntax

```AL
[ExternalBusinessEvent(Name: Text, DisplayName: Text, Description: Text, Category: enum [, Version: Text])]
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

*[Optional] Version*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a version for the external business event.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `ExternalBusinessEvent` attribute can be set on methods that are published as external business events.

## Related information  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  