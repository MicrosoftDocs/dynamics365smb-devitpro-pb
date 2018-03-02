---
title: "SAVEASPDF Function (TestRequestPage)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 38f043cb-bfa2-4301-8087-c5a0ed14b2e3
caps.latest.revision: 7
manager: edupont
---
# SAVEASPDF Function (TestRequestPage)
Saves a report as an Adobe Acrobat \(.pdf\) file.  
  
## Syntax  
  
```  
  
TestRequestPage.SAVEASPDF(Filename)  
```  
  
#### Parameters  
 *TestRequestPage*  
 Type: TestRequestPage  
  
 The TestRequestPage from which you want to test saving the report as a PDF file.  
  
 *Filename*  
 Type: Text  
  
 The path and filename to which the report is saved. The file name extension should be .pdf.  
  
## Remarks  
 All filters and options that have been set on the TestRequestPage are respected in the saved report.  
  
 After you run this function, you cannot continue to interact with the *TestRequestPage*. If you want to continue to use the *TestRequestPage* variable, you must run a report again.  
  
## Example  
 The following example shows the code for a test function to run a report and a request page handler function to test the request page. This example requires that you create the following:  
  
-   A test codeunit called SaveAsPDF. For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).  
  
-   A test function in the test codeunit called TestSaveAsPDF. For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).  
  
-   A handler function of type RequestPageHandler called ReqPageHandler. This handler function has one parameter called RequestPage of Type TestRequestPage and Subtype Customer – Top 10 List. The RequestPage parameter is specified as VAR and is passed by reference to the handler function. For more information, see [How to: Create Handler Functions](How-to--Create-Handler-Functions.md).  
  
 This example also requires that you create the following variable in the **C/AL Globals** window of the SaveAsPDF codeunit.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|Filename|Text|  
  
```  
//Test function: TestSaveAsPDF  
Filename := TEMPORARYPATH + 'MyRep.pdf';  
MESSAGE(Filename);  
IF NOT FILE.ERASE(Filename) THEN  
  ERROR('Cannot erase %1',Filename);  
REPORT.RUN(111);  
IF NOT FILE.EXISTS(Filename) THEN  
  ERROR('File should exist!');  
  
//Request Page Handler function  
RequestPage.Customer.SETFILTER("No.", '20000');  
RequestPage.ChartType.VALUE('Pie chart');  
RequestPage.SAVEASPDF(Filename);  
  
```  
  
## See Also  
 [SAVEASEXCEL Function \(TestRequestPage\)](SAVEASEXCEL-Function--TestRequestPage-.md)   
 [SAVEASWORD Function \(TestRequestPage\)](SAVEASWORD-Function--TestRequestPage-.md)   
 [Testing the Application](Testing-the-Application.md)