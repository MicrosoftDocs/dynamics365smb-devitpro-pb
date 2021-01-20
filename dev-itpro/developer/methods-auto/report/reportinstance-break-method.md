---
title: "Report.Break Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Report.Break Method
> **Version**: _Available from runtime version 1.0._

Exits from a loop or a trigger in a data item trigger of a report or XmlPort.


## Syntax
```
 Report.Break()
```

## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 BREAK causes the current trigger to end. When used inside a loop, such as a WHILE-DO or REPEAT-UNTIL construction, BREAK interrupts the loop and causes the current trigger to end.  

 Compare this with the [QUIT Method \(Report, XMLport\)](../../methods/devenv-quit-method-report-xmlport.md).  

> [!TIP]  
>  You can also use the [AL BREAK Statement](../../devenv-al-control-statements.md) to exit an iteration or loop. The difference is that the BREAK statement does not terminate the trigger. It just exits the loop.  

## Example  

```  
var
    MyVar: Integer;
    Text000: Label "The variable is now %1.";
begin
    MyVar := 0;  
    repeat  
      MyVar := MyVar + 1;  
      if MyVar = 5 then  
        CurrReport.BREAK;  
      Message(Text000,MyVar);  
    until Myvar = 10;  
    Message('After REPEAT-UNTIL loop'); //This statement is never called.  
end;
```  

 When you run the previous code, the loop will end when MyVar is 5 and the execution of the current trigger ends. Statements after the loop are not executed. 

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)