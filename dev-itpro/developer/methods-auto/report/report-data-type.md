---
title: "Report Data Type"
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
# Report Data Type
> **Version**: _Available from runtime version 1.0._

Is used to display, print, or process information from a database.


The following methods are available on the Report data type.


|Method name|Description|
|-----------|-----------|
|[Run(Integer [, Boolean] [, Boolean] [, var Record])](report-run-method.md)|Loads and executes the report that you specify.|
|[RunModal(Integer [, Boolean] [, Boolean] [, var Record])](report-runmodal-method.md)|Loads and executes the report that you specify.|
|[SaveAsHtml(Integer, String [, var Record])](report-saveashtml-method.md)|Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.|
|[SaveAsXml(Integer, String [, var Record])](report-saveasxml-method.md)|Saves the resulting data set of a query as an .xml file. The following code shows the syntax of the SAVEASXML function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[SaveAsPdf(Integer, String [, var Record])](report-saveaspdf-method.md)|Saves a report as a .pdf file.|
|[SaveAsExcel(Integer, String [, var Record])](report-saveasexcel-method.md)|Saves a report on the computer that is running the server as a Microsoft Excel (.xls) workbook.|
|[SaveAsWord(Integer, String [, var Record])](report-saveasword-method.md)|Saves a report on the computer that is running the server as a Microsoft Word (.doc) document.|
|[WordXmlPart(Integer [, Boolean])](report-wordxmlpart-method.md)|Returns the report data structure as structured XML that is compatible with Microsoft Word custom XML parts. The method has an instance call and a static call. The following code shows the syntax of the WORDXMLPART function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[WordLayout(Integer, InStream)](report-wordlayout-method.md)|Gets the Word report layout that is used on a report and returns it as a data stream. The method has an instance call and a static call. The following code shows the syntax of the WORDLAYOUT function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[RdlcLayout(Integer, InStream)](report-rdlclayout-method.md)|Gets the RDLC layout that is used on a report and returns it as a data stream. The method has an instance call and a static call. The following code shows the syntax of the RDLC function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[DefaultLayout(Integer)](report-defaultlayout-method.md)|Gets the default built-in layout type that is used on a specified report.|
|[RunRequestPage(Integer [, String])](report-runrequestpage-method.md)|Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.|
|[Execute(Integer, String [, RecordRef])](report-execute-method.md)|Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.|
|[Print(Integer, String [, String] [, RecordRef])](report-print-method.md)|Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE method call.|
|[SaveAs(Integer, String, ReportFormat, var OutStream [, RecordRef])](report-saveas-method.md)|Runs a specific report without a request page and saves the report as a PDF, Excel, Word, HTML, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a RUNREQUESTPAGE method call.|
|[GetSubstituteReportId(Integer)](report-getsubstitutereportid-method.md)|Gets the ID of the report that will be run by the platform after considering any substitutions made by extensions.|

The following methods are available on instances of the Report data type.

|Method name|Description|
|-----------|-----------|
|[Break()](reportinstance-break-method.md)|Exits from a loop or a trigger in a data item trigger of a report or XmlPort.|
|[Skip()](reportinstance-skip-method.md)|Skips the current iteration of the current report or XmlPort.|
|[CreateTotals(var Decimal [, var Decimal,...])](reportinstance-createtotals-decimal-decimal-method.md)|Maintains totals for a variable in AL.|
|[CreateTotals(Array of [Decimal])](reportinstance-createtotals-decimal-method.md)|Maintains totals for a variable in AL.|
|[TotalsCausedBy()](reportinstance-totalscausedby-method.md)|Determines which field caused a group total to be calculated. This determines which field changed contents and thereby concluded a group.|
|[WordXmlPart([Boolean])](reportinstance-wordxmlpart-method.md)|Gets the report data structure as structured XML that is compatible with Microsoft Word custom XML parts.|
|[ShowOutput()](reportinstance-showoutput--method.md)|Returns the current setting of whether a section should be printed, and changes this setting.|
|[ShowOutput(Boolean)](reportinstance-showoutput-boolean-method.md)|Returns the current setting of whether a section should be printed, and changes this setting.|
|[PageNo([Integer])](reportinstance-pageno-method.md)|Gets or sets the current page number of a report.|
|[NewPage()](reportinstance-newpage-method.md)|Forces a page break when printing a report.|
|[Quit()](reportinstance-quit-method.md)|Aborts the processing of a report or XmlPort.|
|[Preview()](reportinstance-preview-method.md)|Indicates whether a report is being printed in preview mode.|
|[RunModal()](reportinstance-runmodal-method.md)|Loads and executes the report that you specify.|
|[Run()](reportinstance-run-method.md)|Loads and executes the report that you specify.|
|[SaveAsHtml(String)](reportinstance-saveashtml-method.md)|Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.|
|[SaveAsXml(String)](reportinstance-saveasxml-method.md)|Saves the resulting data set of a query as an .xml file.The following code shows the syntax of the SAVEASXML method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[SaveAsPdf(String)](reportinstance-saveaspdf-method.md)|Saves a report as a .pdf file.|
|[SaveAsExcel(String)](reportinstance-saveasexcel-method.md)|Saves a report on the computer that is running the server as a Microsoft Excel (.xls) workbook.|
|[SaveAsWord(String)](reportinstance-saveasword-method.md)|Saves a report on the computer that is running the server as a Microsoft Word (.doc) document.|
|[WordLayout(var InStream)](reportinstance-wordlayout-method.md)|Gets the Word report layout that is used on a report and returns it as a data stream. The method has an instance call and a static call. The following code shows the syntax of the WORDLAYOUT method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[RDLCLayout(var InStream)](reportinstance-rdlclayout-method.md)|Gets the RDLC layout that is used on a report and returns it as a data stream.The method has an instance call and a static call. The following code shows the syntax of the RDLC method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.|
|[DefaultLayout()](reportinstance-defaultlayout-method.md)|Gets the default built-in layout type that is used on a specified report.|
|[RunRequestPage([String])](reportinstance-runrequestpage-method.md)|Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.|
|[Execute(String [, RecordRef])](reportinstance-execute-method.md)|Runs a report in preview or processing-only mode without showing the request page in the client. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.|
|[Print(String [, String] [, RecordRef])](reportinstance-print-method.md)|Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE method call.|
|[SaveAs(String, ReportFormat, var OutStream [, RecordRef])](reportinstance-saveas-method.md)|Runs a specific report without a request page and saves the report as a PDF, Excel, Word, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a RUNREQUESTPAGE method call.|
|[SetTableView(var Record)](reportinstance-settableview-method.md)|Applies the table view on the current record as the table view for the page, report, or XmlPort.|
|[PrintOnlyIfDetail([Boolean])](reportinstance-printonlyifdetail-method.md)|Gets or sets the current settings of the PrintOnlyIfDetail property.|
|[UseRequestPage([Boolean])](reportinstance-userequestpage-method.md)|Gets or sets whether a request page is presented to the user.|
|[NewPagePerRecord([Boolean])](reportinstance-newpageperrecord-method.md)|Gets or sets the current setting of the NewPagePerRecord property.|
|[Language([Integer])](reportinstance-language-method.md)|Gets or sets the current language setting for the report.|
|[ObjectId([Boolean])](reportinstance-objectid-method.md)|Gets or sets the name or number of the report.|
|[PaperSource(Integer [, Integer])](reportinstance-papersource-method.md)|Gets or sets the paper source used for the current page or a specified page.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## See Also  
[Report Object](../../devenv-report-object.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  