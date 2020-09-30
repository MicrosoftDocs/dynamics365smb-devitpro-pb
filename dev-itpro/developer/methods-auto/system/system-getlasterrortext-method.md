---
title: "System.GetLastErrorText Method"
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
# System.GetLastErrorText Method
Gets the last error that occurred in the debugger.


## Syntax
```
String :=   System.GetLastErrorText()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If you call the GETLASTERRORTEXT method immediately after you call the CLEARLASTERROR method, then an empty string is returned.  

 The result of the [GETLASTERRORCODE Method](../../methods-auto/system/system-getlasterrorcode-method.md) is not translated into the local language. The result of the GETLASTERRORTEXT method is translated into the local language.  

## Example  
 If you call the Codeunit.RUN method to run a codeunit and an error occurs in the codeunit, then  the error is displayed. However, if you also use the return value of the Codeunit.RUN method, then the error is not displayed. In this case, you can use the GETLASTERRORTEXT method to determine whether an error has occurred and to see the text of the last error message that was generated. This example shows how to use the GETLASTERRORTEXT method. This example requires that you create two codeunits. Codeunit 50001 generates an error. Codeunit 50002 runs codeunit 50001 and if an error occurs, then it displays the text of the error.  

```  
// Codeunit 50001  
// OnRun trigger  
ERROR(‘Some error message.’);  

// Codeunit 50002  
// OnRun trigger  
CLEARLASTERROR();  
if not Codeunit.RUN(50001) then  
  MESSAGE(‘The last error was: ’ + GETLASTERRORTEXT);  
```  

 In this example, because the if statement uses the return value of the Codeunit.RUN method, the error from codeunit 50001 is not displayed. Instead, you use the GETLASTERRORTEXT method to display the error.  

 When you run codeunit 50002, the message window displays the following:  

 **The last error was: Some error message.**  
 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)