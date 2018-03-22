---
title: "RUNMODAL Method (Page)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9188c6ec-bcd2-42cb-a7c9-2f2b36be1b0d
caps.latest.revision: 19
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RUNMODAL Method (Page)
Creates, opens, and closes a page that you specify. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.  

## Syntax  

```  

[Action :=] Page.RUNMODAL  
```  

#### Parameters  
 *Page*  
 Type: Variable  

 After you define this variable, you can run the following page methods:  

-   SETTABLEVIEW  

-   SETRECORD  

-   GETRECORD  

-   RUN  

-   RUNMODAL  

 Unlike the [PAGE.RUN Method](devenv-PAGE-RUN-Method.md), the variable is not automatically cleared after this method runs.  

 If the page that you specify does not exist, then a compile-time error occurs.  

## Property Value/Return Value  
 Type: Action  

 Specifies what action the user took on the page. The following table shows the possible return values for the different user actions.

<!--NAV
In some cases, the actions for the return values are different when the page displays in the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] than in the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)].
-->

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
 If you know the specific page that you want to run when you are designing your application, then you can create a Page variable, set the Subtype of the variable to a specific page, and then use this method or the [RUN Method \(Page\)](devenv-RUN-Method-Page.md).  

 If you do not know the specific page that you want to run, then use the [PAGE.RUN Method](devenv-PAGE-RUN-Method.md) or the [PAGE.RUNMODAL Method](devenv-PAGE-RUNMODAL-Method.md) and specify the page in the *Number* parameter.  

 After you define the page variable, you can use it before and after you run the page. If you use the [PAGE.RUN Method](devenv-PAGE-RUN-Method.md), then you can only use the variable before you run the page.  

## Example  
 This example shows how to use this method. Assume that the *SomePage* variable has been defined as `Page 1`.  

```  
CLEAR(SomePage)  
SomePage.XXX; // Any user-defined method  
SomePage.SETTABLEVIEW(MyRecord);  
SomePage.SETRECORD(MyRecord);  
IF SomePage.RUNMODAL = Action::LookupOK THEN  
  SomePage.GETRECORD(MyRecord)...  
```  

> [!NOTE]  
>  This code example includes the [CLEAR Method](devenv-CLEAR-Method.md) to make sure that the variable has been cleared.  

## See Also  
 [Page Data Type](../datatypes/devenv-Page-Data-Type.md)
