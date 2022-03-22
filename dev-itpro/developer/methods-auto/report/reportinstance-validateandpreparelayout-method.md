---
title: "Report.ValidateAndPrepareLayout(InStream, var InStream, ReportLayoutType) Method"
description: "
		Validates if the provided report layout is compatible with the specified report and performs the required modifications
		so that it can be used for rendering."
ms.author: solsen
ms.custom: na
ms.date: 03/17/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.ValidateAndPrepareLayout(InStream, var InStream, ReportLayoutType) Method
> **Version**: _Available or changed with runtime version 9.0._


		Validates if the provided report layout is compatible with the specified report and performs the required modifications
		so that it can be used for rendering.
	


## Syntax
```AL
[Ok := ]  Report.ValidateAndPrepareLayout(LayoutStream: InStream, var PreparedLayoutStream: InStream, ReportLayoutType: ReportLayoutType)
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*LayoutStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The stream containing the layout to be validated.  

*PreparedLayoutStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The stream in which to return the prepared layout.  

*ReportLayoutType*  
&emsp;Type: [ReportLayoutType](../reportlayouttype/reportlayouttype-option.md)  
The type of the layout.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)