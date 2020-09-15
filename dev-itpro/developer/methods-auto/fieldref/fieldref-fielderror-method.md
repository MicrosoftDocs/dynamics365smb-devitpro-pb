---
title: "FieldRef.FieldError Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# FieldRef.FieldError Method
Stops the execution of the code, causing a run-time error, and creates an error message for a field.


## Syntax
```
 FieldRef.FieldError([Text: String])
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*Text*  
&emsp;Type: [String](../string/string-data-type.md)  
Use this optional parameter to include the text of the error message. If this parameter is not present, default text will be used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  
 Similar to a run-time error, this method causes any transaction to be aborted automatically.  
  
 This method is like the FIELDERROR Method for the Record data type. For examples, see [FIELDERROR Method \(Record\)](../../methods-auto/record/record-fielderror-method.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The CustomerName variable is initialized with a blank text. `CustomerRecref.FIELD` creates a FieldRef that is named MyFieldRef for field1 \(No.\) and selects record 30000. Field 2 \(Name\) is then selected for record 30000. If the CustomerName variable is a blank text, then `MyFieldRef.FIELDERROR` is executed and an error message is displayed. The text in Text000 text constant is inserted into the error message that is displayed by [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)]. 

```
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    CustomerName: Text;
    Text000: Label 'cannot be blank';
begin
    CustomerRecref.OPEN(18);  
    CustomerName := '';  
    MyFieldRef := CustomerRecref.FIELD(1);  
    MyFieldRef.VALUE('30000');  
    MyFieldRef := CustomerRecref.FIELD(2);  
    if CustomerName = '' then  
      MyFieldRef.FIELDERROR(Text000)  
    else  
      //Do some processing  
end;
```  
  
 This code example displays the following error message:  
  
 **Name cannot be blank in Customer No.=”30000”.**  
  
## Programming Guidelines  
 We recommend the following guidelines for error messages:  
  
-   Describe what is wrong and how to solve the problem.  
  
-   Write a short descriptive message. Do not use more words than necessary.  
  
-   Note that a period is automatically inserted at the end of a FIELDERROR.  
  
-   Use a text constant for the *Text* parameter.  
  
 For more information, see [Progress Windows, MESSAGE, ERROR, and CONFIRM Methods](../../devenv-progress-windows-message-error-and-confirm-methods.md). 

 
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)