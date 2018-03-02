---
title: "PRINT Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 06451de1-2618-4fda-94b0-03974fccafb5
caps.latest.revision: 6
manager: edupont
---
# PRINT Function
Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the function gets the parameter values as an input parameter string, typically from a [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) call.  
  
## Syntax  
  
```  
REPORT.PRINT(Number, Parameters[,PrinterName][, RecordRef])  
```  
  
#### Parameters  
 *Number*  
 Type: Integer  
  
 The ID of the report that you want to print. To specify the report from a list, on the View menu, choose Symbols.  
  
 If the report that you specify does not exist, then a run-time error occurs.  
  
 *Parameters*  
 Type: Text or Code  
  
 A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function call.  
  
 *PrinterName*  
 Type: Text constant or code  
  
 The name of the printer to use to print the report. The printer must be set up on the [!INCLUDE[navnow](includes/navnow_md.md)] client computer. If you do not set this variable, the printer that is set as the default printer is used.  
  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table in which you want to find a record.  
  
## Remarks  
 You typically use this function together with the [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function. The RUNREQUESTPAGE function runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the PRINT function to get the parameter string and print the report.  
  
 For a simple example that illustrates how to use the PRINT function, see example in the [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function topic.  
  
## See Also  
 [Reports-duplicate 20](Reports.md)   
 [Request Pages](Request-Pages.md)   
 [SAVEAS Function](SAVEAS-Function.md)   
 [EXECUTE Function](EXECUTE-Function.md)