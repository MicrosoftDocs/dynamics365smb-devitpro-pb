---
title: "Page.ObjectId Method"
description: "Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object."
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
# Page.ObjectId Method
> **Version**: _Available or changed with runtime version 1.0._

Returns a string in the "Page xxx" format, where xxx is the caption or ID of the application object.


## Syntax
```
String :=   Page.ObjectId([UseNames: Boolean])
```
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*[Optional] UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If **true**, the page caption is returned, else the page ID as text.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The text of the object


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

If you add the following code to a page method or trigger, then the returned string is displayed in a message window.  
  
```al
Message(CurrPage.ObjectId(true));  
  
```
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)