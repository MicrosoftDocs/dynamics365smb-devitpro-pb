---
title: "List Data Type"
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
# List Data Type
The List data type represents a strongly typed list of values that can be assessed by index. 

## Remarks  
 The List can only be used with simple types i.e. you can have a ```List of [Integer]``` but cannot have a ```List of [Blob]```. 

## Example  
 In the following example, the variable ``CustomerNames`` is a list of Text values which represent customer names. The procedure ``WorkWithListOfCustomers`` displays how one would work with the List data type. The ``Add`` method is used to add the string ``'John'`` to the ``CustomerNames`` list. The ``Contains`` method is used to check whether the list contains the specified value, in this case, the string ``'John'``. We continue by using the Message procedure to display a relevant message. 

```
procedure WorkWithListOfCustomers();
var
    customerNames : List of [Text];
begin
    // Adding an element to the list
    customerNames.Add('John');

    // Checking if the list contains an element
    if customerNames.Contains(John) then
        Message('John is in the list')
    else 
        Message('John is not in the list')
end;

```  
  
## See Also
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  