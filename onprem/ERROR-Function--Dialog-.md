---
title: "ERROR Function (Dialog)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 651bb14b-8e07-44db-bcfd-7e743604bb0b
caps.latest.revision: 18
manager: edupont
---
# ERROR Function (Dialog)
Displays an error message and ends the execution of C/AL code.  
  
## Syntax  
  
```  
  
ERROR(String [, Value1, …])  
```  
  
#### Parameters  
 *String*  
 Type: Text constant or code  
  
 This string contains the text of the error message you want to display to the user. Use percent signs \(%\) or number signs \(\#\) to insert variable values into the string. Place the percent or number signs where you want to substitute the variable value. The string can be a text constant that is enabled for multilanguage functionality. For more information, see [Multilanguage Development](Multilanguage-Development.md).  
  
 *Value1, …*  
 Type: Any  
  
 Any variable or expression to be inserted in *String*. You can insert up to 10 values.  
  
 For '\#'-type fields, the value is truncated according to the total number of number-sign characters in *String*. For '%'-type fields, the full length of the value is printed.  
  
## Remarks  
 The window is automatically sized to hold the longest line of text and total number of lines.  
  
## Programming Guidelines  
 We recommend the following guidelines for error messages:  
  
-   Describe what is wrong and how to solve the problem.  
  
-   Write a short descriptive message. Do not use more words than necessary.  
  
-   Always end the error message with a period.  
  
-   Use a text constant for the text of the message.  
  
 For more information, see [Progress Windows, MESSAGE, ERROR, and CONFIRM Functions](Progress-Windows--MESSAGE--ERROR--and-CONFIRM-Functions.md).  
  
## Example  
 This example shows how to use the ERROR function. The code example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Name|DataType|  
|----------|--------------|  
|AccountNo|Integer|  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|Finance Account \#1\#\#\#\# must not be blocked.|  
|Text001|Placeholder message.|  
  
```  
AccountNo := 1230;  
// The execution stops when the error statement is executed  
// and all following statements will never be executed.  
ERROR(Text000, AccountNo);  
MESSAGE(Text001); // This line is not executed.  
```  
  
 The error window displays the following:  
  
 **Finance Account 1230  must not be blocked.**  
  
 The ERROR function causes execution of C/AL code to stop. The MESSAGE function is never executed.  
  
## See Also  
 [Dialog Data Type](Dialog-Data-Type.md)   
 [MESSAGE Function \(Dialog\)](MESSAGE-Function--Dialog-.md)   
 [Progress Windows, MESSAGE, ERROR, and CONFIRM Functions](Progress-Windows--MESSAGE--ERROR--and-CONFIRM-Functions.md)   
 <!-- [Error Handling](Error-Handling.md) -->