---
title: "System.Evaluate Method"
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
# System.Evaluate Method
Evaluates a string representation of a value into its typical representation. The result is assigned to a variable.


## Syntax
```
[Ok := ]  System.Evaluate(var Variable: Any, String: String [, Number: Integer])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Variable*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value of the string is assigned to the variable.
        
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
 A string that contains a value of any simple AL data type.
        
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional value can be used when exporting data with an XmlPort. The only valid value is 9, which indicates that the data must be converted from XML format to C/SIDE format.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example shows how to use the **EVALUATE** method when it is called with four different types of variables.  
    
```  
var
    VarInteger: Integer;  
    VarDate: Date;
    VarYesNo: Boolean;  
    VarDuration: Duration;  
    Value: Text;
    Ok1: Boolean;  
    Ok2: Boolean;  
    Ok3: Boolean;  
    Ok4: Boolean; 
    Text000: Label 'VarInteger = \#1\#\#\#\#\#\#. The return code is: %2.\\';
    Text001: Label 'VarDate = \#3\#\#\#\#\#\#. The return code is: %4.\\'; 
    Text002: Label 'VarYesNo = \#5\#\#\#\#\#\#. The return code is: %6.\\';  
    Text003: Label 'VarDuration = %7. The return code is: %8.';
begin
    Value := '19960101';  
    Ok1 := EVALUATE(VarInteger, Value);  
    Ok2 := EVALUATE(VarDate, Value);  
    Ok3 := EVALUATE(VarYesNo, Value);  
    Value := '2days 4hours 3.7 seconds 17 milliseconds';  
    Ok4 := EVALUATE(VarDuration, Value);  
    MESSAGE(Text000 + Text001 + Text002 + Text003, VarInteger, Ok1, VarDate, Ok2, VarYesNo, Ok3, VarDuration, Ok4); 
end; 
```  
  
 The message window displays the following:  
  
 **VarInteger = 10196   . The return code is: Yes.**  
  
 **VarDate = 01/01/96. The return code is: Yes.**  
  
 **VarYesNo = No      . The return code is: No.**  
  
 **VarDuration = 2 days 4 hours 3 seconds 717 milliseconds. The return code is: Yes.**  
  
 This example shows that although Value \('010196'\) can be interpreted as both an integer and a date expression, it cannot be interpreted as a Boolean expression. This causes an error, shown in the return code Ok3 \(=FALSE\).  
  
 This example also shows that when you evaluate a string as a duration data type, you can use certain words in the string to describe the duration. The following words or abbreviations are supported:  
  
-   day, days, d  
  
-   hour, hours, h  
  
-   minute, minutes, min, m  
  
-   second, seconds, sec, s  
  
-   millisecond, milliseconds, milli, millis  
  
 You can include decimal values in the string that you evaluate as a duration, except for milliseconds, which must be a whole number.  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)