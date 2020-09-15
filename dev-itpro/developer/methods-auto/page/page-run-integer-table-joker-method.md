---
title: "Page.Run Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Page.Run Method
Creates and launches a page that you specify. You can use CLEAR method to remove the page.


## Syntax
```
 Page.Run(Number: Integer [, Record: Record] [, Field: Any])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the page that you want to run. If you enter zero (0), the system displays the default lookup window for the current page. If the page you specify does not exist, a run-time error occurs.
          
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record last displayed on the page. For each object, the system stores information about the most recently displayed record and the attached key and filters. Use this optional parameter to select a specific record to display on the page. The record must be of the same type as the table attached to the window. When the record is displayed, the key and filters attached to the record are used.
          
*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
Use this optional parameter to select a specific field on which focus will be placed.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)