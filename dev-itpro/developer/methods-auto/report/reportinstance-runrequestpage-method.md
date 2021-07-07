---
title: "Report.RunRequestPage([String]) Method"
description: "Runs the request page for a report without running the report."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Report.RunRequestPage([String]) Method
> **Version**: _Available or changed with runtime version 1.0._

Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.


## Syntax
```AL
ReportParameters :=   Report.RunRequestPage([PageParameters: String])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*[Optional] PageParameters*  
&emsp;Type: [String](../string/string-data-type.md)  
A string of request page parameters as XML to use to run the report.  


## Return Value
*ReportParameters*  
&emsp;Type: [String](../string/string-data-type.md)  
XML string that contains the request page parameters that are entered on the request page


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method opens the request page for the specified report, where the user can provide parameters for the report. When the user closes the request page by choosing the **OK** button, a string that contains the parameter values that were set by the user is returned. When the user chooses the **Cancel** button, an empty string will be returned. The returned parameter string can be picked up by calling one of the following methods:  

- [Execute Method](reportinstance-execute-method.md)  
- [Print Method](reportinstance-print-method.md)  
- [SaveAs Method](reportinstance-saveas-method.md)  

> [!NOTE]  
> You can use these methods to schedule reports in the job queue.  

Because the request page runs in the context of where it was invoked from, users cannot bookmark a link to this page from the user interface.  

## Example  
 This example illustrates how to use the RunRequestPage method to run the request page for report ID 206 Sales Invoice. The request page parameters are saved to a table, and then uses the parameters with the Execute, SaveAs, and Print methods to preview the report, save it as a PDF file, and print it.  

 This example requires that you create a table for holding parameters that are entered on the report request page and a codeunit that runs the report methods.  

 Create a table called **Request Parameters** that has the following fields.  

```al
var
    ReportId: Integer;
    UserId: Code[100];
    Parameters: BLOB;
```  

 Create a codeunit and add the following code to the *OnRun* trigger of the codeunit.  

```al
var
    ReportParameters: Record "Report Parameters";
    XmlParameters: Text;
    OStream: OutStream;
    IStream: InStream;
    CurrentUser: Code[100];
    Content: File;
    TempFileName: Text;
begin
    // Use the Report.RunRequestPage method to run the request page to get report parameters  
    XmlParameters := Report.RunRequestPage(206);  
    CurrentUser := UserId;  
    
    // Save the request page parameters to the database table  
    with ReportParameters do begin  
        // Cleanup  
        if Get(206,CurrentUser) then  
        Delete;  
    
        SetAutoCalcFields(Parameters);  
        ReportId := 206;  
        UserId := CurrentUser;  
        Parameters.CreateOutStream(OStream,TextEncoding::UTF8);  
        Message(XmlParameters);  
        OStream.WriteText(XmlParameters);  
    
        Insert;  
    end;  
    
    Clear(ReportParameters);  
    XmlParameters := '';  
    
    // Read the request page parameters from the database table  
    with ReportParameters do begin  
        SetAutoCalcFields(Parameters);  
        Get(206,CurrentUser);  
        Parameters.CreateInStream(IStream,TextEncoding::UTF8);  
        IStream.ReadText(XmlParameters);  
    end;  
    
    // Use the Report.SaveAs method to save the report as a PDF file  
    Content.Create('TestFile.pdf');  // only supported in Business Central on-premises
    Content.CreateOutStream(OStream);  // only supported in Business Central on-premises
    Report.SaveAs(206,XmlParameters,ReportFormat::Pdf,OStream);  
    Content.Close;  // only supported in Business Central on-premises
    
    // Use the Report.Execute method to preview the report  
    Report.Execute(206,XmlParameters);  
    
    // Use the Report.Print method to print the report  
    Report.Print(206,XmlParameters);  
end;

```  


## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)