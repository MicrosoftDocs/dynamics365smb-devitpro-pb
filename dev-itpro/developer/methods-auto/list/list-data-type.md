---
title: "List Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# List Data Type
Represents a strongly typed list of ordered objects that can be accessed by index. Contrary to the Array data type, a List is unbounded, such that its dimension does not need to be specified upon declaration.



The following methods are available on instances of the List data type.

|Method name|Description|
|-----------|-----------|
|[Count()](list-count-method.md)|Gets the number of elements contained in the List.|
|[Add(T)](list-add-method.md)|Adds a value to the end of the List.|
|[AddRange(T [, T,...])](list-addrange-t-t-method.md)|Adds the elements of the specified collection to the end of the list.|
|[AddRange(List of [T])](list-addrange-list[t]-method.md)|Adds the elements of the specified collection to the end of the list.|
|[Get(Integer, var T)](list-get-integer-t-method.md)|Gets the element at the specified index.|
|[Get(Integer)](list-get-integer-method.md)|Gets the element at the specified index. This method will raise an error if the index is outside the valid range.|
|[Set(Integer, T)](list-set-integer-t-method.md)|Sets the element at the specified index.|
|[Set(Integer, T, var T)](list-set-integer-t-t-method.md)|Sets the element at the specified index.|
|[Contains(T)](list-contains-method.md)|Determines whether an element is in the List.|
|[IndexOf(T)](list-indexof-method.md)|Searches for the specified value and returns the one-based index of the first occurrence within the entire List.|
|[Insert(Integer, T)](list-insert-method.md)|Inserts an element into the List at the specified index.|
|[LastIndexOf(T)](list-lastindexof-method.md)|Searches for the specified value and returns the one-based index of the last occurrence within the entire List.|
|[Remove(T)](list-remove-method.md)|Removes the first occurrence of a specified value from the List.|
|[RemoveAt(Integer)](list-removeat-method.md)|Removes the element at the specified index of the List.|
|[RemoveRange(Integer, Integer)](list-removerange-method.md)|Removes a range of elements from the List.|
|[GetRange(Integer, Integer)](list-getrange-integer-integer-method.md)|Get a shallow copy of a range of elements in the source.|
|[GetRange(Integer, Integer, var List of [T])](list-getrange-integer-integer-list[t]-method.md)|Get a shallow copy of a range of elements in the source.|
|[Reverse()](list-reverse-method.md)|Reverses the order of the elements in the entire List.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The List can only be used with simple types i.e. you can have a List of [Integer] but cannot have a List of [Blob]. Similarly, the List data type does not support holding instantiated records. For this purpose, use temporary tables.

Lists are 1-based indexed, that is, the indexing of a List begins with 1.


> [!WARNING]
> Previously in C/AL, one would have typically used an in-memory temporary table to create an unbounded "array" data structure, as shown in the code below. In AL you use the List Data Type instead.
> 
> ```
> listRec.Value := ‘Some Value’;​
> listRec.INSERT();​
> ```

## Example  
 In the following example, the variable `CustomerNames` is a list of Text values which represent customer names. The procedure `WorkWithListOfCustomers` displays how one would work with the List data type. The `Add` method is used to add the string `'John'` to the `CustomerNames` list. The `Contains` method is used to check whether the list contains the specified value, in this case, the string `'John'`. We continue by using the Message procedure to display a relevant message. 

```
procedure WorkWithListOfCustomers();
var
    customerNames : List of [Text];
begin
    // Adding an element to the list
    customerNames.Add('John');

    // Checking if the list contains an element
    if customerNames.Contains('John') then
        Message('John is in the list')
    else 
        Message('John is not in the list')
end;

```  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Dictionary Data Type](../dictionary/dictionary-data-type.md)