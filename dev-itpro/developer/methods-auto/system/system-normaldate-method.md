---
title: "NormalDate Method"
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
# NormalDate Method
Gets the regular date (instead of the closing date) for the argument Date.


## Syntax
```
NormalDate :=   System.NormalDate(Date: Date)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The input date. You can enter a closing date or a normal date. A run-time error occurs if the value of Date is set to the undefined date (0D).  


## Return Value
*NormalDate*  
&emsp;Type: [Date](../date/date-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The input date is a regular date. This code example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|InputDate|Date|  
|OutputDate|Date|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|The normal date for %1 is %2.|  
  
```  
InputDate := 040414D;  
OutputDate := NORMALDATE(InputDate);  
MESSAGE(Text000, InputDate, OutputDate);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
 **The normal date for 04/04/14 is 04/04/14.**  
  
## Example  
 The input date is a closing date. This code example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|InputDate|Date|  
|OutputDate|Date|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text001|The normal date for %1 is %2.|  
  
```  
InputDate := CLOSINGDATE(040414C);  
OutputDate := NORMALDATE(InputDate);  
MESSAGE(Text001, InputDate, OutputDate);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
 **The normal date for C04/04/14 is 04/04/14.**  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)