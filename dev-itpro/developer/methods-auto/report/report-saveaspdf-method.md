---
title: "Report.SaveAsPdf Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# Report.SaveAsPdf Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report as a .pdf file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Report.SaveAsPdf(Number: Integer, FileName: String [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run.
        
*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path and name of the file that you want to save the report as.
        
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use the **SaveAsPDF** method on the global Report object or on Report variables. If, at design time, you do not know the specific report that you want to run, then use the global Report object and specify the report number in the *Number* parameter. If you do know which report you want to run, then create a Report variable, set the Subtype of the variable to a specific report, and use this variable when you call the **SaveAsPDF** method.  

 When you call **SaveAsPDF**, the report is generated and saved to "*FileName*." A **Saving to PDF** window shows the status of the process. Note that the request page will not be shown.  

 The *FileName* parameter specifies a location on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. If you call this method from a client, such as from an action on a page, then use the [DOWNLOAD Method \(File\)](../file/file-download-method.md) to download the .pdf file from the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to the computer that is running the client.  

> [!NOTE]  
>  By default, when a report uses an RDLC report layout at runtime, fonts are embedded in the generated PDF. You can specify whether fonts are embedded in the PDF for RDLC reports by changing the **Report PDF Font Embedding** setting in the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance configuration or changing the **PDFFontEmbedding** property in report objects. <!--NAV For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md) and [PDFFontEmbedding Property](../properties/devenv-PDF-FontEmbedding-Property.md).-->  

## Example  
 This example shows how to use the **SaveAsPDF** method to save a specific report as a PDF file on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].
  
```  
var
    Filename: Text;
    ReturnValue: Boolean;
    Report206: Report " Sales - Invoice";
begin
    Filename := 'C:\MyReports\report206.pdf';   
    ReturnValue := Report206.SaveAsPDF(Filename);  
end;
```  


## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)