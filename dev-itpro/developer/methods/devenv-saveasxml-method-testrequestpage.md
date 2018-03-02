---
title: "SAVEASXML Method (TestRequestPage)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f8f9e22e-e496-4c67-8dfd-b13680c28146
caps.latest.revision: 5
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASXML Method (TestRequestPage)
Saves a report dataset and the labels on a report as two XML \(.xml\) files.  
  
## Syntax  
  
```  
  
TestRequestPage.SAVEASXML(Filename_Labels, Filename_Dataset)  
```  
  
#### Parameters  
 *TestRequestPage*  
 Type: TestRequestPage  
  
 The TestRequestPage from which you want to test saving the report dataset and labels as XML files.  
  
 *Filename\_Labels*  
 Type: Text  
  
 The path and file name to which the report labels are saved. The file name extension should be .xml.  
  
 *Filename\_Dataset*  
 Type: Text  
  
 The path and file name to which the report dataset is saved. The file name extension should be .xml.  
  
## Remarks  
 All filters and options that have been set on the TestRequestPage are respected in the saved report.  
  
 After you run this method, you cannot continue to interact with the *TestRequestPage*. If you want to continue to use the *TestRequestPage* variable, you must run a report again.  
  
## Example  
 The following example shows the code for a test method to run a report and a request page handler method to test the request page. This example requires that you create the following:  
  
-   A test codeunit called SaveAsXML. <!--Links For more information, see [How to: Create Test Codeunits and Test Methods](devenv-How-to--Create-Test-Codeunits-and-Test-Methods.md). --> 
  
-   A test method in the test codeunit called TestSaveAsXML. <!--Links For more information, see [How to: Create Test Codeunits and Test Methods](devenv-How-to--Create-Test-Codeunits-and-Test-Methods.md). --> 
  
-   A handler method of type RequestPageHandler called ReqPageHandler. This handler method has one parameter called RequestPage of Type TestRequestPage and Subtype Customer – Top 10 List. The RequestPage parameter is specified as VAR and is passed by reference to the handler method. <!--Links For more information, see [How to: Create Handler Methods](devenv-How-to--Create-Handler-Methods.md).-->  
  
 This example also requires that you create the following global variables of the SaveAsXML codeunit.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|LabelsFilename|Text|  
|DatasetFilename|Text|  
  
```  
// Add the following code to the TestSaveAsXML test method.  
LabelsFilename := TEMPORARYPATH + 'MyLabels.xml';  
DatasetFilename := TEMPORARYPATH + 'MyDataset.xml';  
REPORT.RUN(111);  
IF NOT FILE.EXISTS(LabelsFilename) THEN  
  ERROR('Labels file should exist!');  
IF NOT FILE.EXISTS(DatasetFilename) THEN  
  ERROR('Dataset file should exist!');  
  
// Add the following code to the ReqPageHandler method.  
RequestPage.Customer.SETFILTER("No.", '20000');  
RequestPage.ChartType.VALUE('Pie chart');  
RequestPage.SAVEASXML(LabelsFilename,DatasetFilename);  
  
```  
  
## See Also  
 [TestRequestPage Data Type](../datatypes/devenv-TestRequestPage-Data-Type.md)