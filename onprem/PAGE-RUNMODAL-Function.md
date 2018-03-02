---
title: "PAGE.RUNMODAL Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4b7765a4-2d90-4d2f-8a92-6d94d3b30209
caps.latest.revision: 29
manager: edupont
---
# PAGE.RUNMODAL Function
Creates, runs, and closes a specified page object. When a page is run modally, no input, such as a keyboard or mouse click, can occur except for objects on the modal page.  
  
## Syntax  
  
```  
  
[Action :=] Page.RUNMODAL(Number[, Record][, Field])  
```  
  
#### Parameters  
 *Number*  
 Type: Integer  
  
 The number of the page that you want to run. If you enter zero \(0\), then the default lookup window for the current page is displayed. On the **View** menu, choose the **C/AL Symbols Menu** to select the page from a list.  
  
 If the page that you specify does not exist, then a run-time error occurs.  
  
 *Record*  
 Type: Record  
  
 By default, this function shows the record that was last displayed on the page. For each object, information is stored about the most recently shown record and the attached key and filters.  
  
 Use this optional parameter to select a specific record to display on the page. The record must be of the same type as the table that is attached to the page. When the record is displayed, the key and filters that are attached to the record are used.  
  
 *Field*  
 Type: Field  
  
 Use this optional parameter to select a specific field on which focus will be put.  
  
## Property Value/Return Value  
 Type: Action  
  
 Specifies what action the user took on the page. The following table shows the possible return values for the different user actions. In some cases, the actions for the return values are different when the page displays in the [!INCLUDE[nav_web](includes/nav_web_md.md)] than in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
|Return value|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|[!INCLUDE[nav_web](includes/nav_web_md.md)]|  
|------------------|-------------------------------|---------------------------|  
|OK|To close the page window, the user does one of the following:<br /><br /> -   Chooses the **OK** button.<br />-   Chooses the **X** button when there was no **Cancel** button on the window.<br />-   Presses the Esc key when there is no **Cancel** button on the window.|To close the page window, the user does one of the following:<br /><br /> -   Chooses the **Close** button.<br />-   Chooses the **X** button when there is no **Cancel** button on the window.|  
|Cancel|To close the page window, the user does one of the following:<br /><br /> -   Chooses the **Cancel** button.<br />-   Chooses the **X** button when there is a **Cancel** button on the window.<br />-   Presses the Esc key when there is a **Cancel** button on the window.|To close the page window, the user does one of the following:<br /><br /> -   Chooses the **Cancel** button.<br />-   Chooses the **X** button when there is a **Cancel** button on the window.|  
|LookupOK|To close a lookup window, the user does one of the following:<br /><br /> -   Chooses the **OK** button.<br />-   Chooses an item in the Lookup window.|To close a lookup window, the user chooses the **OK** button.|  
|LookupCancel|To close a lookup window, the user chooses the **Cancel** button.|Same as [!INCLUDE[nav_windows](includes/nav_windows_md.md)].|  
|Yes|To close a confirmation window, the user selects **Yes**.|Same as [!INCLUDE[nav_windows](includes/nav_windows_md.md)].|  
|No|To close a confirmation window, the user does one of the following:<br /><br /> -   Chooses the **No** button.<br />-   Chooses the **X** button.<br />-   Presses the Esc key.|To close a confirmation window, the user does one of the following:<br /><br /> -   Chooses the **No** button.<br />-   Chooses the **X** button.|  
|RunObject|The user selected an option that ran another [!INCLUDE[navnow](includes/navnow_md.md)] object.|Same as [!INCLUDE[nav_windows](includes/nav_windows_md.md)].|  
|RunSystem|The user selected an option that ran an external program.|Same as [!INCLUDE[nav_windows](includes/nav_windows_md.md)].|  
  
## Remarks  
 The page is run modally. If you do not know the specific page that you want to run when you are designing your application, then use this function or the [PAGE.RUN Function](PAGE-RUN-Function.md) and specify the page in the *Action* parameter.  
  
 If you do know which page that you want to run, then you can create a Page variable, set the Subtype of the variable to a specific page, and then use the [RUN Function \(Page\)](RUN-Function--Page-.md) or [RUNMODAL Function \(Page\)](RUNMODAL-Function--Page-.md) on the Page variable.  
  
 When you want to close the page, use the CurrPage.CLOSE function. CurrPage is a predefined system variable.  
  
## Example  
 This example shows how to call page 21.  
  
```  
IF Page.RUNMODAL(21, MyRecord, ...) = Action::LookupOK THEN...;  
```  
  
## See Also  
 [Page Data Type](Page-Data-Type.md)