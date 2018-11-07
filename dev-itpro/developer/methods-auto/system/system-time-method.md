---
title: "Time Method"
ms.author: solsen
ms.custom: na
ms.date: 11/06/2018
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
# Time Method
Gets the current time from the operating system.

## Syntax
```
Time :=   System.Time()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*Time*  
&emsp;Type: [Time](../time/time-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can only use the TIME method to retrieve the time from the operating system. You cannot use it to set the time in the operating system.  
  
## Example  
 This example requires that you create the following global text constant.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The current system time is %1.|  
  
```  
MESSAGE(Text000, TIME);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window could display the following:  
  
 **The current system time is 11:15:46 AM.**  

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)