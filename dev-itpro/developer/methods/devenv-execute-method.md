---
title: "EXECUTE Method"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 08/24/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f0268c2e-bbd6-493e-9ffd-08eac5df435d
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# EXECUTE Method
Runs a report in preview or processing-only mode without showing the request page in the client. The method gets the request page parameter values as an input parameter string from a [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) call.  

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

 A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method call.  

 *RecordRef*  
 Type: RecordRef  

 The RecordRef that refers to a record in a table.  

## Remarks  
 You typically use this method together with the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method. The RUNREQUESTPAGE method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the EXECUTE method to get the parameter string and run the report.  

 For a simple example that illustrates how to use the EXECUTE method, see example in the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method topic.  

## See Also  
 [Report Object](../devenv-report-object.md)   
 <!--Links [Request Pages](Request-Pages.md)-->   
 [SAVEAS Method](devenv-SAVEAS-Method.md)   
 [PRINT Method](devenv-PRINT-Method.md)
