---
title: "Break Method"
ms.author: solsen
ms.custom: na
ms.date: 09/16/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Break Method
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
 This example of code in a trigger on a report object requires that you create the following global variable and text constant.  

|Variable name|DataType|  
|-------------------|--------------|  
|MyVar|Integer|  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The variable is now %1.|  

```  
MyVar := 0;  
REPEAT  
  MyVar := MyVar + 1;  
  IF MyVar = 5 THEN  
    CurrReport.BREAK;  
  MESSAGE(Text000,MyVar);  
UNTIL Myvar = 10;  
MESSAGE('After REPEAT-UNTIL loop'); //This statement is never called.  
```  

 When you run the previous code, the loop will end when MyVar is 5 and the execution of the current trigger ends. Statements after the loop are not executed. 

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)