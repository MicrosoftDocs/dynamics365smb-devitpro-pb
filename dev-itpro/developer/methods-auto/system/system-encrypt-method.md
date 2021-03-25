---
title: "System.Encrypt Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# System.Encrypt Method
> **Version**: _Available or changed with runtime version 1.0._

Takes a string as input and returns the encrypted value of the string.


## Syntax
```
EncryptedString :=   System.Encrypt(PlainTextString: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*PlainTextString*  
&emsp;Type: [String](../string/string-data-type.md)  
The input string that will be encrypted. The input string cannot exceed a length of 215 plain characters. If the input string includes special characters the length is even more reduced.  


## Return Value
*EncryptedString*
&emsp;Type: [String](../string/string-data-type.md)
The output string that is encrypted.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If encryption is not enabled or the encryption key is not found, the following error will be displayed: **An encryption key is required to complete the request**.   

## Example

```al
var
    Text000: Text;
begin
    Text000 := 'ABC123';  
    Message('Value: ' + Text000);  
    Text000 := Encrypt(Text000);  
    Message('Value: ' + Text000);  
end;
```  

This code example takes the string value **ABC123** and outputs the encrypted value of the string. The encrypted value will vary from system to system due to differences in the encryption key.  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)