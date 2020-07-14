---
title: "Format Property (XMLports)"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Format Property (XMLports)

Determines the import and export format of the XMLPort.  
  
## Applies to  
  
- XMLports  

## Syntax

```
Format = VariableText;
```
  
## Remarks  

This property supports CSV (comma separated values) export files and XML files. The available options are:  
  
- XML  
  
- VariableText  
  
- FixedText  

The default value for the **Format** property is **XML**, which allows to work with XML documents. 

If you want to work with variable text files, the **Format** property must be set to **VariableText** and if you want to work with fixed-width text fields, it must be set to **FixedText**.

You can configure the text file's default settings by using the properties [TextEncoding (XMLports) Property](devenv-textencoding-property.md), 
[TableSeparator Property](devenv-tableseparator-property.md),
[RecordSeparator Property](devenv-recordseparator-property.md),
[FieldSeparator Property](devenv-fieldseparator-property.md) and
[FieldDelimiter Property](devenv-fielddelimiter-property.md).

## See Also  

[Properties](devenv-properties.md)