---
title: "Dialog.Close Method"
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
# Dialog.Close Method
Closes a dialog window that has been opened by the OPEN method.


## Syntax
```
 Dialog.Close()
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  

## Parameters
*Dialog*  
&emsp;Type: [Dialog](dialog-data-type.md)  
An instance of the [Dialog](dialog-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

If `Close` is used on a dialog window that is not open, a run-time error will occur. The dialog windows of an object are automatically closed when the object terminates. 

## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)