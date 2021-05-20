---
title: "FieldDelimiter Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# FieldDelimiter Property

Specifies the text delimiter for a field.  
  
## Applies to  
  
- XMLports  

## Syntax

```AL
FieldDelimiter = '<None>';
```
  
## Remarks  

**FieldDelimiter** is only used if the Format property is set to **Variable Text**. Otherwise, the setting is ignored.

The default value is “”, an empty string.    
  
You can set the field delimiter in AL code so that the XMLport can import and export records with different delimiters. For example, if your XMLport must import from a file or stream where one record uses commas and another uses an empty string, you can change the field delimiter property at run time.

Escaping the field delimiter within the field value as documented in [RFC 4180 standard](https://www.ietf.org/rfc/rfc4180.txt) is not respected.

## See Also  

[Properties](devenv-properties.md)
