---
title: "XmlVersionNo Property"
description: "Set which version of XML the XML document conforms to. Two options are available: 1.0 (the default) and 1.1."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlVersionNo Property
> **Version**: _Available or changed with runtime version 1.0._

Set which version of XML the XML document conforms to. Two options are available: 1.0 (the default) and 1.1.

## Applies to
-   Xml Port

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**V10**|Version 1.0. This is the default value.|
|**V11**|Version 1.1.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
XMLVersionNo = V10;
```
  
## Remarks

The XML version number is inserted into the XML document as the XML declaration.  
  
## See Also  

[Properties](devenv-properties.md)