---
title: "SumIndexFields Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SumIndexFields Property
Sets the SumIndexField Technology (SIFT) for the key, if applicable.

## Applies to
-   Key

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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