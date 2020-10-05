---
title: "XmlName Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8a414c9a-4470-46cc-8091-b1613031fde7
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---
 
# XmlName Property
Sets a variable name for the table or the text that is the data source of the current element.

## Applies to  

- XmlPortTextElement 

- XmlPortFieldElement 

- XmlPortTableElement

- XmlPortFieldAttribute

- XmlPortTextAttribute

## Property Value
String

## Syntax
```
XmlName = 'CreditNote';
```

## Remarks
If the **XmlName** property is not defined, it will use the string specified in the [NodeName Property](devenv-nodename-property.md) as the default variable name.

## See Also  
 [Properties](devenv-properties.md)
