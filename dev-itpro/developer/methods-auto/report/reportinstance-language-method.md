---
title: "Language Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
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
# Language Method
Gets or sets the current language setting for the report.


## Syntax
```
[CurrentLanguage := ]  Report.Language([Language: Integer])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*Language*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new language setting for the report.  


## Return Value
*CurrentLanguage*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current language setting for the report.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)