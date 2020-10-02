---
title: "SumIndexFields Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0b03b2f5-e6b8-4aea-aceb-dedeb7b2be82
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---
 
# SumIndexFields Property

Sets the **SumIndexField Technology (SIFT)** for the key, if applicable.  

## Applies to  

- Keys  

## Syntax

```AL
key(PK;PK) { MaintainSqlIndex=false; MaintainSiftIndex=true; SumIndexFields=IntField; }
```  
 
## Remarks  

You can select up to 20 SumIndexFields for each key.  
  
The fields must be of a numeric datatype \(Decimal, Integer, BigInteger, or Duration\).  
  
Changing existing keys may affect the behavior of the application since other parts of your application may depend on the existence of certain keys.  

## See Also  

[Properties](devenv-properties.md)  
[AL Data Types](../datatypes/devenv-al-data-types.md)
  