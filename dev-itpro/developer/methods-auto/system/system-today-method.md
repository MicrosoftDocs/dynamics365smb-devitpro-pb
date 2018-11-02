---
title: "Today Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# Today Method
Gets the current date set in the operating system.

## Syntax
```
Date :=   System.Today()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can only use the **TODAY** method to retrieve the current date from the operating system. You cannot use it to set the date in the operating system.  
  
## Example  
 This example shows how to use the **TODAY** method. This example requires that you create the following global text constant.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The current date is: %1|  
  
```  
MESSAGE(Text000, TODAY);  
```  
  
 The message window could display the following:  
  
 **The current date is: 05/27/08**  
  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)