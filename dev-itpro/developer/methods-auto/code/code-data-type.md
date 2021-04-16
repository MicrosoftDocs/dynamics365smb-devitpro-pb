---
title: "Code Data Type"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Code Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a special type of string that is converted to uppercase and removes any trailing or leading spaces.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The length of a Code variable equals the number of characters in the text without leading or trailing spaces.  
  
You must specify the length of a Code variable or field. The maximum length of a Code variable is 1024 characters. The maximum length of a Code field in a table is 2048 characters. A Code variable cannot be null. The Code data type supports Unicode.  
  
You can index any character position in a string, such as A[65]. The resulting value will be a [Char Data Type](../char/char-data-type.md). You cannot assign a char to a position in the code variable greater than the current length of the variable +1. 
  
Fields that contain a date formula must not have data type Code. Instead, use the [DateFormula Data Type](../dateformula/dateformula-data-type.md). All fields that contain a date formula with data type Code must be converted into data type DateFormula.
  
## Example

This example shows some typical examples of code string assignments. In these examples, assume that the variable c is a code variable with a maximum length of 4.  
  
```al
c := 'ABC';   
// Results in variable c, which contains 'ABC'   
// and is 3 characters in length.  
c := '1';  
// Results in variable c, which contains '1'   
// and is 1 character in length.  
c := '';  
// Results in variable c, which contains '' (empty string)  
// and is zero (0) characters in length.  
c := ' 2 ';  
// Results in variable c, which contains '2'  
// and is 1 character in length.  
```  
  
## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  