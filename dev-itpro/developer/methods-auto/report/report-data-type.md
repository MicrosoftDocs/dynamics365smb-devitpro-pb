---
title: "Report Data Type"
description: "Is used to display, print, or process information from a database."
ms.author: solsen
ms.custom: na
ms.date: 06/04/2021
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
# Report Data Type
> **Version**: _Available or changed with runtime version 1.0._

Is used to display, print, or process information from a database.


The following methods are available on the Report data type.


|Method name|Description|
|-----------|-----------|
|[DefaultLayout(Integer)](report-defaultlayout-method.md)|Gets the default built-in layout type that is used on a specified report.|
|[Execute(Integer, String [, RecordRef])](report-execute-method.md)|Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't open the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.|
|[GetSubstituteReportId(Integer)](report-getsubstitutereportid-method.md)|Gets the ID of the report that will be run by the platform after considering any substitutions made by extensions.|
|[Print(Integer, String [, String] [, RecordRef])](report-print-method.md)|Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE method call.|
|[RdlcLayout(Integer, InStream)](report-rdlclayout-method.md)|Gets the RDLC layout that is used on a report and returns it as a data stream.|
|[Run(Integer [, Boolean] [, Boolean] [, var Record])](report-run-method.md)|Loads and executes the report that you specify.|
|[RunModal(Integer [, Boolean] [, Boolean] [, var Record])](report-runmodal-method.md)|Loads and executes the report that you specify.|
|[RunRequestPage(Integer [, String])](report-runrequestpage-method.md)|Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.|
|[SaveAs(Integer, String, ReportFormat, var OutStream [, RecordRef])](report-saveas-method.md)|Runs a specific report without a request page and saves the report as a PDF, Excel, Word, HTML, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a RUNREQUESTPAGE method call.|
|[SaveAsExcel(Integer, String [, var Record])](report-saveasexcel-method.md)|Saves a report on the computer that is running the server as a Microsoft Excel (.xls) workbook.|
|[SaveAsHtml(Integer, String [, var Record])](report-saveashtml-method.md)|Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.|
|[SaveAsPdf(Integer, String [, var Record])](report-saveaspdf-method.md)|Saves a report as a .pdf file.|
|[SaveAsWord(Integer, String [, var Record])](report-saveasword-method.md)|Saves a report on the computer that is running the server as a Microsoft Word (.doc) document.|
|[SaveAsXml(Integer, String [, var Record])](report-saveasxml-method.md)|Saves the resulting data set of a query as an .xml file. The following code shows the syntax of the SAVEASXML function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[WordLayout(Integer, InStream)](report-wordlayout-method.md)|Gets the Word report layout that is used on a report and returns it as a data stream.|
|[WordXmlPart(Integer [, Boolean])](report-wordxmlpart-method.md)|Returns the report data structure as structured XML that is compatible with Microsoft Word custom XML parts. The method has an instance call and a static call. The following code shows the syntax of the WORDXMLPART function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|

The following methods are available on instances of the Report data type.

|Method name|Description|
|-----------|-----------|
|[Break()](reportinstance-break-method.md)|Exits from a loop or a trigger in a data item trigger of a report or XmlPort.|
|[CreateTotals(var Decimal [, var Decimal,...])](reportinstance-createtotals-decimal-decimal-method.md)|Maintains totals for a variable in AL.|
|[CreateTotals(Array of [Decimal])](reportinstance-createtotals-decimal-method.md)|Maintains totals for a variable in AL.|
|[DefaultLayout()](reportinstance-defaultlayout-method.md)|Gets the default built-in layout type that is used on a specified report.|
|[Execute(String [, RecordRef])](reportinstance-execute-method.md)|Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't open the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.|
|[IsReadOnly()](reportinstance-isreadonly-method.md)|Gets if the current report's data access intent is readonly.|
|[Language([Integer])](reportinstance-language-method.md)|Gets or sets the current language setting for the report.|
|[NewPage()](reportinstance-newpage-method.md)|Forces a page break when printing a report.|
|[NewPagePerRecord([Boolean])](reportinstance-newpageperrecord-method.md)|Gets or sets the current setting of the NewPagePerRecord property.|
|[ObjectId([Boolean])](reportinstance-objectid-method.md)|Gets or sets the name or number of the report.|
|[PageNo([Integer])](reportinstance-pageno-method.md)|Gets or sets the current page number of a report.|
|[PaperSource(Integer [, Integer])](reportinstance-papersource-method.md)|Gets or sets the paper source used for the current page or a specified page.|
|[Preview()](reportinstance-preview-method.md)|Indicates whether a report is being printed in preview mode.|
|[Print(String [, String] [, RecordRef])](reportinstance-print-method.md)|Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE method call.|
|[PrintOnlyIfDetail([Boolean])](reportinstance-printonlyifdetail-method.md)|Gets or sets the current settings of the PrintOnlyIfDetail property.|
|[Quit()](reportinstance-quit-method.md)|Aborts the processing of a report or XmlPort.|
|[RDLCLayout(var InStream)](reportinstance-rdlclayout-method.md)|Gets the RDLC layout that is used on a report and returns it as a data stream.|
|[Run()](reportinstance-run-method.md)|Loads and executes the report that you specify.|
|[RunModal()](reportinstance-runmodal-method.md)|Loads and executes the report that you specify.|
|[RunRequestPage([String])](reportinstance-runrequestpage-method.md)|Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.|
|[SaveAs(String, ReportFormat, var OutStream [, RecordRef])](reportinstance-saveas-method.md)|Runs a specific report without a request page and saves the report as a PDF, Excel, Word, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a RUNREQUESTPAGE method call.|
|[SaveAsExcel(String)](reportinstance-saveasexcel-method.md)|Saves a report on the computer that is running the server as a Microsoft Excel (.xls) workbook.|
|[SaveAsHtml(String)](reportinstance-saveashtml-method.md)|Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.|
|[SaveAsPdf(String)](reportinstance-saveaspdf-method.md)|Saves a report as a .pdf file.|
|[SaveAsWord(String)](reportinstance-saveasword-method.md)|Saves a report on the computer that is running the server as a Microsoft Word (.doc) document.|
|[SaveAsXml(String)](reportinstance-saveasxml-method.md)|Saves the resulting data set of a query as an .xml file.The following code shows the syntax of the SAVEASXML method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[SetTableView(var Record)](reportinstance-settableview-method.md)|Applies the table view on the current record as the table view for the page, report, or XmlPort.|
|[ShowOutput()](reportinstance-showoutput--method.md)|Returns the current setting of whether a section should be printed, and changes this setting.|
|[ShowOutput(Boolean)](reportinstance-showoutput-boolean-method.md)|Returns the current setting of whether a section should be printed, and changes this setting.|
|[Skip()](reportinstance-skip-method.md)|Skips the current iteration of the current report or XmlPort.|
|[TotalsCausedBy()](reportinstance-totalscausedby-method.md)|Determines which field caused a group total to be calculated. This determines which field changed contents and thereby concluded a group.|
|[UseRequestPage([Boolean])](reportinstance-userequestpage-method.md)|Gets or sets whether a request page is presented to the user.|
|[WordLayout(var InStream)](reportinstance-wordlayout-method.md)|Gets the Word report layout that is used on a report and returns it as a data stream.|
|[WordXmlPart([Boolean])](reportinstance-wordxmlpart-method.md)|Gets the report data structure as structured XML that is compatible with Microsoft Word custom XML parts.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## See Also  
[Report Object](../../devenv-report-object.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  