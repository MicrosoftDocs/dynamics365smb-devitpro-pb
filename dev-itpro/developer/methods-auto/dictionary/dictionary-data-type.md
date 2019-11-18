---
title: "Dictionary Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
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
# Dictionary Data Type
Represents a collection of keys and values.



The following methods are available on instances of the Dictionary data type.

|Method name|Description|
|-----------|-----------|
|[Count()](dictionary-count-method.md)|Gets the number of key/value pairs contained in the Dictionary.|
|[Keys()](dictionary-keys-method.md)|Gets a collection containing the keys in the Dictionary.|
|[Values()](dictionary-values-method.md)|Gets a collection containing the values in the Dictionary.|
|[Get(TKey, var TValue)](dictionary-get-tkey-tvalue-method.md)|Gets the value associated with the specified key.|
|[Get(TKey)](dictionary-get-tkey-method.md)|Gets the value associated with the specified key.|
|[Set(TKey, TValue)](dictionary-set-tkey-tvalue-method.md)|Sets the value associated with the specified key.|
|[Set(TKey, TValue, var TValue)](dictionary-set-tkey-tvalue-tvalue-method.md)|Sets the value associated with the specified key.|
|[Add(TKey, TValue)](dictionary-add-method.md)|Adds the specified key and value to the dictionary.|
|[ContainsKey(TKey)](dictionary-containskey-method.md)|Determines whether the Dictionary contains the specified key.|
|[Remove(TKey)](dictionary-remove-method.md)|Removes the value with the specified key from the Dictionary.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Each addition to the dictionary consists of a value, and its associated key. Every key in a Dictionary must be unique. A key cannot be null, but a value can be, only when the value type is a reference type.

## Example  
In the following example, the variable `counter` represents the Dictionary data type to store a value representing the number of occurrences for each character in the `customerName`. Using the `Get` method, you get the number of occurrences for the character at position `i`. If `i` returns **false**, it means there is no value associated with that character, so you add the value 1. If `i` returns **true**, it means the value already exists, so you add `c + 1` to the value. The `Add` method adds the {key:value} pair to the Dictionary.

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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  