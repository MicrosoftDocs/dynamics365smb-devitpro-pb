---
title: "PAGE.RUNMODAL Method"
ms.author: solsen
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-financials"
ms.assetid: 4b7765a4-2d90-4d2f-8a92-6d94d3b30209
caps.latest.revision: 29
manager: edupont
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# PAGE.RUNMODAL Method
Creates, runs, and closes a specified page object. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.  

## Syntax  

```  
[Action :=] Page.RUNMODAL(Number[, Record][, Field])  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The number of the page that you want to run. If you enter zero (0), then the default lookup window for the current page is displayed.

 If the page that you specify does not exist, then a run-time error occurs.  

 *Record*  
 Type: Record  

 By default, this method shows the record that was last displayed on the page. For each object, information is stored about the most recently shown record and the attached key and filters.  

 Use this optional parameter to select a specific record to display on the page. The record must be of the same type as the table that is attached to the page. When the record is displayed, the key and filters that are attached to the record are used.  

 *Field*  
 Type: Field  

 Use this optional parameter to select a specific field on which focus will be put.  

## Property Value/Return Value  
 Type: Action  

 Specifies what action the user took on the page. The following table shows the possible return values for the different user actions.

|  Return value  |  Description  |  
|----------------|---------------|  
|OK|To close the page window, the user does one of the following:<br /><br /> -   Chooses the **Close** button.<br />-   Chooses the **X** button when there is no **Cancel** button on the window.|  
|Cancel|To close the page window, the user does one of the following:<br /><br /> -   Chooses the **Cancel** button.<br />-   Chooses the **X** button when there is a **Cancel** button on the window.|  
|LookupOK|To close a lookup window, the user chooses the **OK** button.|  
|LookupCancel|To close a lookup window, the user chooses the **Cancel** button.|  
|Yes|To close a confirmation window, the user selects **Yes**.|  
|No|To close a confirmation window, the user does one of the following:<br /><br /> -   Chooses the **No** button.<br />-   Chooses the **X** button.|  
|RunObject|The user selected an option that ran another object.|  
|RunSystem|The user selected an option that ran an external program.|  

## Remarks  
 The page is run modally. If you do not know the specific page that you want to run when you are designing your application, then use this method or the [PAGE.RUN Method](devenv-PAGE-RUN-Method.md) and specify the page in the *Action* parameter.  

 If you do know which page that you want to run, then you can create a Page variable, set the Subtype of the variable to a specific page, and then use the [RUN Method (Page)](devenv-RUN-Method-Page.md) or [RUNMODAL Method (Page)](devenv-RUNMODAL-Method-Page.md) on the Page variable.  

 When you want to close the page, use the CurrPage.CLOSE method. CurrPage is a predefined system variable.  

## Example  
 This example shows how to call page 21.  

```  
IF Page.RUNMODAL(21, MyRecord, ...) = Action::LookupOK THEN...;  
```  

## See Also  
 [Page Data Type](../datatypes/devenv-Page-Data-Type.md)  
