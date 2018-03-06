---
title: "RUNREQUESTPAGE Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f3930bd5-9734-4d1a-8f78-1c7b44a59b4c
caps.latest.revision: 7
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RUNREQUESTPAGE Method
Runs the request page for a report without running the report. Returns an XML string that contains the request page parameters that are entered on the request page.  

## Syntax  

```  

Parameters := REPORT.RUNREQUESTPAGE(Number[, Parameters])  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report for which you want to run the request page. To specify the report from a list, on the **View** menu, choose **Symbols**.  

 If the report that you specify does not exist, then a run-time error occurs.  

 *Parameters*  
 Type: Text or Code  

 A string of request page parameters as XML to use to run the report.  

## Property Value/Return Value  
 Type: Text or Code  

 A string of the request page parameters as XML.  

## Remarks  
 This method opens the request page for the specified report, where the user can provide parameters for the report. When the user closes the request page by choosing the **OK** button, a string that contains the parameter values that were set by the user is returned. When the user chooses the **Cancel** button, an empty string will be returned. The returned parameter string can be picked up by calling one of the following methods:  

-   [EXECUTE Method](devenv-EXECUTE-Method.md)  

-   [PRINT Method](devenv-PRINT-Method.md)  

-   [SAVEAS Method](devenv-SAVEAS-Method.md)  

> [!NOTE]  
>  You can use these methods to schedule reports in the job queue.  

## Example  
 This example illustrates how to use the RUNREQUESTPAGE method to run the request page for report ID 206 Sales Invoice. The request page parameters are saved to a table, and then uses the parameters with the EXECUTE, SAVEAS, and PRINT methods to preview the report, save it as a PDF file, and print it.  

 This example requires that you create a table for holding parameters that are entered on the report request page and a codeunit that runs the report methods.  

 Create a table called **Request Parameters** that has the following fields.  

|Field Name|Data Type|Length|  
|----------------|---------------|------------|  
|ReportId|Integer||  
|UserId|Code|100|  
|Parameters|BLOB||  

 Create a codeunit and add the following global variables.  

|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|ReportParameters|Record|Report Parameters||  
|XmlParameters|Text|||  
|OStream|OutStream|||  
|IStream|InStream|||  
|CurrentUser|Code||100|  
|Content|File|||  
|TempFileName|Text|||  

 Add the following code to the *OnRun* trigger of the codeunit.  

```  
// Use the REPORT.RUNREQUESTPAGE method to run the request page to get report parameters  
XmlParameters := REPORT.RUNREQUESTPAGE(206);  
CurrentUser := USERID;  

// Save the request page parameters to the database table  
WITH ReportParameters DO BEGIN  
    // Cleanup  
    IF GET(206,CurrentUser) THEN  
    DELETE;  

    SETAUTOCALCFIELDS(Parameters);  
    ReportId := 206;  
    UserId := CurrentUser;  
    Parameters.CREATEOUTSTREAM(OStream,TEXTENCODING::UTF8);  
    MESSAGE(XmlParameters);  
    OStream.WRITETEXT(XmlParameters);  

    INSERT;  
END;  

CLEAR(ReportParameters);  
XmlParameters := '';  

// Read the request page parameters from the database table  
WITH ReportParameters DO BEGIN  
    SETAUTOCALCFIELDS(Parameters);  
    GET(206,CurrentUser);  
    Parameters.CREATEINSTREAM(IStream,TEXTENCODING::UTF8);  
    IStream.READTEXT(XmlParameters);  
END;  

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
 [Report Object](../devenv-report-object.md)   
 <!--Links [Request Pages](Request-Pages.md)-->
