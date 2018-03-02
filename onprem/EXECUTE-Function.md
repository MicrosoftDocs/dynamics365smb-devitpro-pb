---
title: "EXECUTE Function"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 08/24/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f0268c2e-bbd6-493e-9ffd-08eac5df435d
caps.latest.revision: 6
---
# EXECUTE Function
Runs a report in preview or processing-only mode without showing the request page in the client. The function gets the request page parameter values as an input parameter string from a [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) call.  

>   [!NOTE]  
>   The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.  

## Syntax  

```  
REPORT.EXECUTE (Number, Parameters[,RecordRef])  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to run. To specify the report from a list, on the **View** menu, choose **Symbols**.  

 If the report that you specify does not exist, then a run-time error occurs.  

 *Parameters*  
 Type: Text or Code  

 A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function call.  

 *RecordRef*  
 Type: RecordRef  

 The RecordRef that refers to a record in a table.  

## Remarks  
 You typically use this function together with the [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function. The RUNREQUESTPAGE function runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the EXECUTE function to get the parameter string and run the report.  

 For a simple example that illustrates how to use the EXECUTE function, see example in the [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function topic.  

## See Also  
 [Reports](Reports.md)   
 [Request Pages](Request-Pages.md)   
 [SAVEAS Function](SAVEAS-Function.md)   
 [PRINT Function](PRINT-Function.md)
