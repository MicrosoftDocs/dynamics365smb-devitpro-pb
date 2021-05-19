---
title: "Report.SaveAsHtml Method"
ms.author: solsen
ms.custom: na
ms.date: 05/19/2021
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
# Report.SaveAsHtml Method
> **Version**: _Available from runtime version 1.0._

Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Report.SaveAsHtml(FileName: String)
```
## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.

*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The folder path and name of the file that you want to save the report as. The path must already exist and the service (login) account that is used by the server instance must have permission to write to the target folder. Otherwise, you will get errors.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The SaveAsHTML method uses the logic in the codeunit **9651 Document Report Mgt.** code unit to handle the format transformation.  
  
 The SaveAsHTML method can be used on the Report data type and on Report variables. When you are programming the SaveAsHTML method, if you do not know the specific report that you want to run, then use the global Report object and specify the report number in the *Number* parameter. If you know which report you want to run, then create a Report variable, set the **Subtype** of the variable to a specific report, and then use this variable when you call the SaveAsHTML method.  
  
 When you call the SaveAsXML method, the report is generated and saved to "FileName." The request page is not shown.  
  
 Reports that use an RDLC layout when run cannot be saved in the HTML format. A runtime error will occur if SaveAsHTML is used on an RDLC report.  
  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)