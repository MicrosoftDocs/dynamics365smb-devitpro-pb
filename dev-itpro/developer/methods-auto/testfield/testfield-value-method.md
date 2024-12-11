---
title: "TestField.Value([Text]) Method"
description: "Gets or sets the value of this field."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestField.Value([Text]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the value of this field.


## Syntax
```AL
[Value := ]  TestField.Value([Value: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestField*  
&emsp;Type: [TestField](testfield-data-type.md)  
An instance of the [TestField](testfield-data-type.md) data type.  

*[Optional] Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The new value to set for this field.  


## Return Value
*[Optional] Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The value of this field.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
If you omit NewValue, the method returns the current value of the field.  

## Related information
[TestField Data Type](testfield-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)