---
title: "Page.Run(Text [, Record] [, Any]) Method"
description: "Creates and launches a page that you specify."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.Run(Text [, Record] [, Any]) Method
> **Version**: _Available or changed with runtime version 17.0._

Creates and launches a page that you specify. You can use CLEAR method to remove the page.


## Syntax
```AL
 Page.Run(FullyQualifiedName: Text [, Record: Record] [, Field: Any])
```
## Parameters
*FullyQualifiedName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The fully qualified name of the page that you want to run. If you enter an empty string, the system displays the default lookup window for the current page. If the page you specify does not exist, a run-time error occurs.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record last displayed on the page. For each object, the system stores information about the most recently displayed record and the attached key and filters. Use this optional parameter to select a specific record to display on the page. The record must be of the same type as the table attached to the window. When the record is displayed, the key and filters attached to the record are used.  

*[Optional] Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
Use this optional parameter to select a specific field on which focus will be placed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page data type](page-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)