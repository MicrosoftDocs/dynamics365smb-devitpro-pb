---
title: "PAGE.RUN Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3e164447-541b-4e8c-8bc0-19fb4c3e9410
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# PAGE.RUN Method
Creates and launches a page object, which you specify.  

## Syntax  

```  

PAGE.RUN(Number[, Record] [, Field])  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The number of the page that you want to run. If you enter zero \(0\), the system displays the default lookup window for the current page.  

 If the page you specify does not exist, a run-time error occurs.  

 *Record*  
 Type: Record  

 The *Page*.RUN method shows, by default, the record last displayed on the page. For each object, the system stores information about the most recently displayed record and the attached key and filters.  

 Use this optional parameter to select a specific record to display on the page. The record must be of the same type as the table attached to the window. When the record is displayed, the key and filters attached to the record are used.  

 *Field*  
 Type: Field  

 Use this optional parameter to select a specific field on which focus will be placed.  

## Remarks  
 If, at design time, you do not know the specific page you want to run, then use this method or the [PAGE.RUNMODAL Method](devenv-PAGE-RUNMODAL-Method.md) and specify the page in the *Number* parameter.  

 If you do know which page you want to run, then you can create a Page variable, set the subtype of the variable to a specific page, and then use the [RUN Method \(Page\)](devenv-RUN-Method-Page.md) or [RUNMODAL Method \(Page\)](devenv-RUNMODAL-Method-Page.md) on the Page variable.  

 When you want to close the page, use CurrPage.CLOSE. CurrPage is a predefined system variable.  

## Example  

```  
Page.RUN(4711)  
```  

## See Also  
 [Page Data Type](../datatypes/devenv-Page-Data-Type.md)
