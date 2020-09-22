---
title: "FieldError Method"
ms.author: solsen
ms.custom: na
ms.date: 06/18/2020
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
# FieldError Method
Stops the execution of the code causing a run-time error, and creates an error message for a field.


## Syntax
```
 Record.FieldError(Field: Any [, Text: String])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field for which you want to create an error message.
          
*Text*  
&emsp;Type: [String](../string/string-data-type.md)  
Use this optional parameter to include the text of the error message. If you do not use this parameter, then default text is used as shown in the following examples. You can use backslashes (\) to break lines.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

Like a run-time error, this method causes the system to automatically abort any transaction.  
  
## Programming guidelines

The following guidelines for error messages are recommended:  
  
- Describe what is wrong and how to solve the problem.  
- Write a short descriptive message. Do not use more words than necessary.  
- Note that a period is automatically inserted at the end of a FieldError.  
- Use a label data type for the *Text* parameter.  
  
For more information, see [Progress Windows, Message, Error, and Confirm Methods](../../devenv-progress-windows-message-error-and-confirm-methods.md).
  
### Example 1
 
In the first example, there is no *Text* parameter and the field does not have a value.
  
```  
var
    CustomerRec: Record Customer;

...
CustomerRec."No." := '';  
CustomerRec.FieldError("No.");  

```  
  
The following message is displayed:  
  
**You must specify No. in Customer No.=''.**  
  
### Example 2
 
In the next example, there is no *Text* parameter and the field has a value.
  
```
var
    CustomerRec: Record Customer;

...  
CustomerRec."No." := 'NEW 3500';  
CustomerRec.FieldError("No.");  
```  
  
The following message is displayed:  
  
**No. must not be NEW 3500 in Customer No.='NEW 3500'.**  
  
### Example 3

The third example uses a non-empty string as the *Text* parameter.
  
```  
var
    CustomerRec: Record Customer;
    Text001: Label 'is not valid';

...
CustomerRec."No." := 'NEW 3500';  
CustomerRec.FieldError("No.", Text001);  
```  
  
The following message is displayed:  
  
**No. is not valid in Customer No.='NEW 3500'.**  

## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)