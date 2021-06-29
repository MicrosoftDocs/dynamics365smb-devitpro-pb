---
title: "TestRequestPage.SaveAsWord Method"
description: "Saves a report as a Microsoft Word (.doc) file."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# TestRequestPage.SaveAsWord Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report as a Microsoft Word (.doc) file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 TestRequestPage.SaveAsWord(FileName: String)
```
## Parameters
*TestRequestPage*  
&emsp;Type: [TestRequestPage](testrequestpage-data-type.md)  
An instance of the [TestRequestPage](testrequestpage-data-type.md) data type.  

*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path and file name to which the report is saved. The file name extension should be .doc.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 All filters and options that have been set on the TestRequestPage are respected in the saved report.  
  
 After you run this method, you cannot continue to interact with the *TestRequestPage*. If you want to continue to use the *TestRequestPage* variable, you must run a report again.  
  
## Example  
 The following example shows the code for a test method to run a report and a request page handler method to test the request page. This example requires that you create the following:  
  
-   A test codeunit called SaveAsWord. 
<!--Links For more information, see [How to: Create Test Codeunits and Test Methods](devenv-How-to--Create-Test-Codeunits-and-Test-Methods.md).-->  
  
-   A test method in the test codeunit called TestSaveAsWord. 
<!--Links For more information, see [How to: Create Test Codeunits and Test Methods](devenv-How-to--Create-Test-Codeunits-and-Test-Methods.md). --> 
  
-   A handler method of type RequestPageHandler called ReqPageHandler. This handler method has one parameter called RequestPage of Type TestRequestPage and Subtype Customer – Top 10 List. The RequestPage parameter is specified as VAR and is passed by reference to the handler method. 
<!--Links For more information, see [How to: Create Handler Methods](devenv-How-to--Create-Handler-Methods.md).-->  
   
```al
var
    Filename: Text;
begin
    //Test method: TestSaveAsWord  
    Filename := TemporaryPath + 'MyRep.doc';  
    Message(Filename);  
    if not File.Erase(Filename) then  
      Error('Cannot erase %1',Filename);  
    Report.Run(111);  
    if not File.Exists(Filename) then  
      Error('File should exist!');  
      
    //Request Page Handler method  
    RequestPage.Customer.SetFilter("No.", '20000');  
    RequestPage.ChartType.Value('Pie chart');  
    RequestPage.SaveAsExcel(Filename);  
end;
  
```

## See Also
[TestRequestPage Data Type](testrequestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)