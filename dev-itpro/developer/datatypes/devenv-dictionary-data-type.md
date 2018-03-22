---
title: "Dictionary Data Type"
ms.custom: na
ms.date: 10/09/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4ce38f7b-bae2-427d-9db8-3e5014a48c6a
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---
# Dictionary Data Type
 Dictionary data type represents a collection of keys and values. The Dictionary provides a mapping of the set of keys with their values.

## Remarks  
 Each addition to the dictionary consists of a value, and its associated key. Every key in a Dictionary must be unique. A key cannot be null, but a value can be, only when the value type is a reference type.

## Example  
In the following example, the variable ``counter`` represents the Dictionary data type to store a value representing the number of occurrences for each character in the ``customerName``. Using the ``Get`` method, you get the number of occurences for the character at position ``i``. If ``i`` returns **false**, it means there is no value associated with that character, so you add the value 1. If ``i`` returns **true**, it means the value already exists, so you add ``c + 1`` to the value. The ``Add`` method adds the {key:value} pair to the Dictionary.

```
procedure CountCharactersInCustomerName(customerName: Text; var counter: Dictionary of [Char, Integer]);
var
    i : Integer;
    c : Integer;
begin

    for i := 1 to StrLen(customerName) do 
    begin
        if counter.Get(customerName[i], c) then
            counter.Set(customerName[i], c + 1) 
        else 
            counter.Add(customerName[i], 1);
    end;
end;

```  
  
## See Also
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  