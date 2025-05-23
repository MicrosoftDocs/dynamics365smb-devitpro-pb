---
title: "Page.Run() Method"
description: "Creates and launches a page that you specify."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.Run() Method
> **Version**: _Available or changed with runtime version 1.0._

Creates and launches a page that you specify. You can use CLEAR method to remove the page.


## Syntax
```AL
 Page.Run()
```
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If, at design time, you don't know the specific page you want to run, then use this method or the [Page.RunModal method](page-runmodal--method.md) and specify the page in the *Number* parameter.  

If you do know, which page you want to run, then you can create a Page variable, set the subtype of the variable to a specific page, and then use the [RunMethod \(Page\)](page-run--method.md) or [RunModal method \(Page\)](page-runmodal--method.md) on the Page variable.  

When you want to close the page, use `CurrPage.Close`. CurrPage is a predefined system variable. For more information, see [System-defined variables](../../devenv-system-defined-variables.md).  

The `Run` method will clear the instance of the page every time `Run` completes, which means that all variables inside the page are initialized. The `RunModal` method doesn't clear the instance of the page every time. For more information, see [RunModal method \(Page\)](page-runmodal--method.md).

## Example  

```al
Page.Run(4711)
```  
  
## Related information
[Page Data Type](page-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
