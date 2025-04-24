---
title: "Date.Year() Method"
description: "Gets the year."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Date.Year() Method
> **Version**: _Available or changed with runtime version 14.0._

Gets the year.


## Syntax
```AL
Year :=   Date.Year()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Date*  
&emsp;Type: [Date](date-data-type.md)  
An instance of the [Date](date-data-type.md) data type.  

## Return Value
*Year*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The year.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks
Don't use this method to replace [`Date2DWY(Date, 3)`](../system/system-date2dwy-method.md).
When the input date to the `Date2DWY` method is in a week that spans two years, the `Date2DWY` method computes the output year as the year that has the most days.
The `Date.Year()` method, on the other hand, always returns the year of the date.

## Related information
[Date Data Type](date-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)