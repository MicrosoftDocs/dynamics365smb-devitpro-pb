---
title: "Report.RunRequestPage Method"
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
# Report.RunRequestPage Method
Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.


## Syntax
```
Parameters :=   Report.RunRequestPage(Number: Integer [, Parameters: String])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report for which you want to run the request page. If the report that you specify does not exist, then a run-time error occurs.
          
*Parameters*  
&emsp;Type: [String](../string/string-data-type.md)  
A string of request page parameters as XML to use to run the report.
          


## Return Value
*Parameters*  
&emsp;Type: [String](../string/string-data-type.md)  
XML string that contains the request page parameters that are entered on the request page  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This method opens the request page for the specified report, where the user can provide parameters for the report. When the user closes the request page by choosing the **OK** button, a string that contains the parameter values that were set by the user is returned. When the user chooses the **Cancel** button, an empty string will be returned. The returned parameter string can be picked up by calling one of the following methods:  

- [Execute Method](../report/report-execute-method.md)  

- [Print Method](../report/report-print-method.md)  

- [SaveAs Method](../report/report-saveas-method.md)  

> [!NOTE]  
> You can use these methods to schedule reports in the job queue.  

Because the request page runs in the context of where it was invoked from, users cannot bookmark a link to this page from the user interface.  

## Example  
 This example illustrates how to use the RUNREQUESTPAGE method to run the request page for report ID 206 Sales Invoice. The request page parameters are saved to a table, and then uses the parameters with the EXECUTE, SAVEAS, and PRINT methods to preview the report, save it as a PDF file, and print it.  

 This example requires that you create a table for holding parameters that are entered on the report request page and a codeunit that runs the report methods.  

 Create a table called **Request Parameters** that has the following fields.  

```
var
    ReportId: Integer;
    UserId: Code[100];
    Parameters: BLOB;
``` 

 Create a codeunit and add the following code to the *OnRun* trigger of the codeunit.  

```  
var
    ReportParameters: Record "Report Parameters";
    XmlParameters: Text;
    OStream: OutStream;
    IStream: InStream;
    CurrentUser: Code[100];
    Content: File;
    TempFileName: Text;

begin
    // Use the REPORT.RUNREQUESTPAGE method to run the request page to get report parameters  
    XmlParameters := REPORT.RUNREQUESTPAGE(206);  
    CurrentUser := USERID;  
    
    // Save the request page parameters to the database table  
    with ReportParameters do begin  
        // Cleanup  
        if GET(206,CurrentUser) then  
        DELETE;  
    
        SETAUTOCALCFIELDS(Parameters);  
        ReportId := 206;  
        UserId := CurrentUser;  
        Parameters.CREATEOUTSTREAM(OStream,TEXTENCODING::UTF8);  
        MESSAGE(XmlParameters);  
        OStream.WRITETEXT(XmlParameters);  
    
        INSERT;  
    end;  
    
    CLEAR(ReportParameters);  
    XmlParameters := '';  
    
    // Read the request page parameters from the database table  
    with ReportParameters do begin  
        SETAUTOCALCFIELDS(Parameters);  
        GET(206,CurrentUser);  
        Parameters.CREATEINSTREAM(IStream,TEXTENCODING::UTF8);  
        IStream.READTEXT(XmlParameters);  
    end;  
    
    // Use the REPORT.SAVEAS method to save the report as a PDF file  
    Content.CREATE('TestFile.pdf');  
    Content.CREATEOUTSTREAM(OStream);  
    REPORT.SAVEAS(206,XmlParameters,REPORTFORMAT::Pdf,OStream);  
    Content.CLOSE;  
    
    // Use the REPORT.EXECUTE method to preview the report  
    REPORT.EXECUTE(206,XmlParameters);  
    
    // Use the REPORT.Print method to print the report  
    REPORT.PRINT(206,XmlParameters);  

```  


## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
