---
title: "Report.Run(Text [, Boolean] [, Boolean] [, var Record]) Method"
description: "Loads and executes the report that you specify."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.Run(Text [, Boolean] [, Boolean] [, var Record]) Method
> **Version**: _Available or changed with runtime version 17.0._

Loads and executes the report that you specify.


## Syntax
```AL
 Report.Run(FullyQualifiedName: Text [, RequestWindow: Boolean] [, SystemPrinter: Boolean] [, var Record: Record])
```
## Parameters
*FullyQualifiedName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The fully qualified name of the report that you want to run.  

*[Optional] RequestWindow*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the request window for the report will be displayed. The request window is part of the report object.  

*[Optional] SystemPrinter*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to use the default Windows printer or use table 78, Printer Selection, to find the correct printer for this report.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that are attached to the record that you specify are used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report data type](report-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)