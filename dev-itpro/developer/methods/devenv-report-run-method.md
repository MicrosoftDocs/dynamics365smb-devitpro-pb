---
title: "REPORT.RUN Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 58f49755-b127-4d3e-9ae5-289402bbe557
caps.latest.revision: 17
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# REPORT.RUN Method
Loads and runs the report that you specify.  

## Syntax  

```  

REPORT.RUN(Number [, ReqWindow] [, SystemPrinter] [, Record])  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to run. To specify the report from a list, on the **View** menu, choose **Symbols**.  

 If the report that you specify does not exist, then a run-time error occurs.  

 *ReqWindow*  
 Type: Boolean  

 Specifies whether the request window for the report will be displayed. The request window is part of the report object.  

 Specify **true** to display the request window before you run the report. Specify **false** to run the report without displaying the request window.  

 This parameter overrides the setting of the [UseRequestPage Property](../properties/devenv-UseRequestPage-Property.md) of the report. If you do not provide a value for the *ReqWindow* parameter, then the setting of the UseRequestPage property is used.  

> [!IMPORTANT]  
>  Client-side printing is not supported<!--NAV by [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->. If you set this parameter to **false**<!--NAV and the report will be run on [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]-->, you must set up the report to print from the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)], otherwise an error occurs at runtime. For more information, see <!--Links [How to: Specify Printer Selection for Reports](How-to--Specify-Printer-Selection-for-Reports.md) and -->[STARTSESSION Method \(Sessions\)](devenv-STARTSESSION-Method-Sessions.md).  

 *SystemPrinter*  
 Type: Boolean  

 Specifies whether to use the default Windows printer or use table 78, Printer Selection, to find the correct printer for this report. For example, if the report prints on continuous pages, you can set up an entry in the Printer Selection table to specify to always print this report on a specific printer.  

 Specify **true** to use the printer that is defined as the system printer. Specify **false**, which is the default value, to use the printer that is defined in the Printer Selection table.  

 *Record*  
 Type: Record  

 Specifies which record to use in the report. Any filters that are attached to the record that you specify are used.  

## Remarks  
 If you do not know the specific report that you want to run when you are designing the report, then use this method or the [REPORT.RUNMODAL Method](devenv-REPORT-RUNMODAL-Method.md). If you do know the specific report that you want to run, then you can use the [RUN Method \(Report\)](devenv-RUN-Method-Report.md) or the [RUNMODAL Method \(Report\)](devenv-RUNMODAL-Method-Report.md). When you use these methods, the request page runs modally. However, when you choose **Preview** on the request page, the **Print Preview** page does not run modally.  

## Example  
 This example shows how to run a report. This example displays the request window and sends the report to the printer that is selected in the Printer Selection table.  

```  
REPORT.RUN(1001);  
```  

## Example  
 This example shows how to run a report. This example skips the request window, starts the report immediately, and sends the report to the printer that is selected in the Printer Selection table.  

```  
REPORT.RUN(1001, FALSE);  
```  

## Example  
 This example shows how to run a report. This example skips the request window and starts the report immediately. It sends the report to the system printer instead of the printer that is selected in the Printer Selection table.  

```  
REPORT.RUN(1001, FALSE, TRUE);  
```  

## Example  
 This example shows how to run a report for which you specify a record. This example displays the request window and sends the report to the system printer. This example requires that you create the following global variable.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRec|Record|Customer|  

```  
MyRec.FINDLAST;  
MyRec.SETRECFILTER;  
Report.RUN(101, TRUE, TRUE, MyRec);  
```  

## See Also  
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)
