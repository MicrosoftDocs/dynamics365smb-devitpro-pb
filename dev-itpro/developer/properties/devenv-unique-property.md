---
title: "Unique Property"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Unique Property

Sets whether the value of a key must be unique. 

  
## Applies To  
  
Table keys
  
## Property Value
  
 **true** if the key value must be unique; otherwise, **false**. The default is **false**.  

## Remarks

In AL, keys cannot be changed, removed, or reordered. New keys can only be added to the end of the list.

## Example

The following example defines three keys. 

```
keys
{
    key(PrimaryKey; PKField)
    {
        Clustered = true;
    }
    key(Unique; UniqueField)
    {
        Unique = true;
    }
    key(Combined; UniqueField, NormaField)
    {
        Unique = true;
    }
}

```
## See Also  
[FlowFields](../devenv-flowfields.md)   
[Create FlowFields and FlowFilters](../devenv-creating-flowfields-and-flowfilters.md)   
[CalcFormula](devenv-calcformula-property.md)  
[FlowFilter Overview](../devenv-flowfilter-overview.md)   
[CalcFields Property](devenv-calcfields-property.md)