---
title: "Page.Run Method"
description: "Creates and launches a page that you specify. You can use CLEAR method to remove the page."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.Run Method
> **Version**: _Available or changed with runtime version 1.0._

Creates and launches a page that you specify. You can use CLEAR method to remove the page.


## Syntax
```
 Page.Run()
```

## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If, at design time, you do not know the specific page you want to run, then use this method or the [Page.RunModal Method](page-runmodal--method.md) and specify the page in the *Number* parameter.  

If you do know which page you want to run, then you can create a Page variable, set the subtype of the variable to a specific page, and then use the [Run Method \(Page\)](page-run--method.md) or [RunModal Method \(Page\)](page-runmodal--method.md) on the Page variable.  

When you want to close the page, use CurrPage.Close. CurrPage is a predefined system variable. For more information, see [System-Defined Variables](../../devenv-system-defined-variables.md).  

## Example  

```al
Page.Run(4711)
```  
  

## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)