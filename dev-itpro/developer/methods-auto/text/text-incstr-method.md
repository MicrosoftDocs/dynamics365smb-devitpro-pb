---
title: "Text.IncStr Method"
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
# Text.IncStr Method
Increases a positive number or decrease a negative number inside a string by one (1).


## Syntax
```
NewString :=   Text.IncStr(String: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string that you want to increase or decrease.  


## Return Value
*NewString*  
&emsp;Type: [String](../string/string-data-type.md)  
The incremented string.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If *String* contains more than one number, then only the number closest to the end of the string is changed. For example, 'A10B20' is changed to 'A10B21' and 'a12b12c' to 'a12b13c'.  
  
 If *String* contains a negative number, then it is decreased by one. For example, '-55' is changed to '-56'.  
  
 Zero \(0\) is considered a positive number. Therefore, it is increased it by one. For example, 'A0' is changed to 'A1'.  
  
 When *String* contains a number such as 99, it is increased to 100 and the length of the output string is: LEN\(String\) + 1. For example, 'a12b99c' is changed to 'a12b100c'.  
  
 If *String* does not contain any number, the output string is an empty string. For example, 'aaa' is changed to ''.  
  
 INCSTR only increments integer numbers within strings, not decimals. For example, if you call INCSTR on the string **a99.99b** then the result is **a99.100b**.  
  
## Example  

```  
var
    Account: Text[60]; 
    NegAccount: Text[60];  
    EmptyAccount: Text[60];  
    MyAccount: Text[60];  
    ResultAccount: Text[60];  
    ResultNegAccount: Text[60];  
    ResultEmptyAccount: Text[60];  
    ResultMyAccount: Text[60]; 
    Text000: TexConst ENU='Account no. 99 does not balance.';  
    Text001: TexConst ENU='Account no. 2342 shows a total of $-452.';  
    Text002: TexConst ENU='My bank account is empty.';
    Text003: TexConst ENU='My bank account shows a total of $0.';  
    Text004: TexConst ENU='The text strings before INCSTR is called:\\%1\\%2\\%3\\%4';  
    Text005: TexConst ENU='The text strings after INCSTR is called:\\%1\\%2\\%3\\%5'; 
begin
    Account := Text000;  
    NegAccount := Text001;  
    EmptyAccount := Text002;  
    MyAccount := Text003;  
    MESSAGE(Text004, Account, NegAccount, EmptyAccount, MyAccount);  
    ResultAccount := INCSTR(Account);  
    ResultNegAccount := INCSTR(NegAccount);  
    ResultEmptyAccount := INCSTR(EmptyAccount);  
    ResultMyAccount := INCSTR(MyAccount);  
    MESSAGE(Text005, ResultAccount, ResultNegAccount, ResultEmptyAccount, ResultMyAccount);  
end;
```  
  
 The first message displays the following:  
  
 **The text strings before INCSTR is called:**  
  
 **Account no. 99 does not balance.**  
  
 **Account no. 2342 shows a total of $ -452.**  
  
 **My bank account is empty.**  
  
 **My bank account shows a total of $ 0.**  
  
 The second message displays the following:  
  
 **The text strings after INCSTR has been called:**  
  
 **Account no. 100 does not balance.**  
  
 **Account no. 2342 shows a total of $ -453.**  
  
 **My bank account shows a total of $ 1.**  
  
 The example shows that if the string contains more than one number, only the last number is changed. Furthermore, positive numbers and zero are increased and negative numbers are decreased. Finally, if there are no numbers in the string, then an empty string is returned.  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)