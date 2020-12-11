---
title: "System.DT2Date Method"
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
# System.DT2Date Method
> **Version**: _Available from runtime version 1.0._

Gets the date part of a DateTime object.


## Syntax
```
Date :=   System.DT2Date(Datetime: DateTime)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Datetime*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
The DateTime of which to return the date part.  


## Return Value
*Date*
&emsp;Type: [Date](../date/date-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If *Datetime* is undefined, then this method returns an undefined date.  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)