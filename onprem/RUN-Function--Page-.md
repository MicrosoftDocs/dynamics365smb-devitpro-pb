---
title: "RUN Function (Page)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 892a00dd-6fac-4454-bfae-6a5d5f37f0ff
caps.latest.revision: 9
manager: edupont
---
# RUN Function (Page)
Creates and launches a page that you specify. You can use [CLEAR Function](CLEAR-Function.md) to remove the page.  
  
## Syntax  
  
```  
  
Page.RUN  
```  
  
#### Parameters  
 *Page*  
 Type: Page  
  
 After you define this variable, you can run the following page functions:  
  
-   SETTABLEVIEW  
  
-   SETRECORD  
  
-   GETRECORD  
  
-   RUN  
  
-   RUNMODAL.  
  
 The variable is automatically cleared after this function is executed.  
  
 If the page you specify does not exist, you receive a compile error.  
  
## Remarks  
 If, at design time, you know the specific page that you want to run, then you can create a Page variable, set the Subtype of the variable to a specific page, and then use this function or the [RUNMODAL Function \(Page\)](RUNMODAL-Function--Page-.md) on the Page variable.  
  
 If you do not know the page that you want to run, then use the [PAGE.RUN Function](PAGE-RUN-Function.md) or the [PAGE.RUNMODAL Function](PAGE-RUNMODAL-Function.md) and specify the page in the *Number* parameter.  
  
 After you define the page variable, you can use it before you run the page. If you use the [RUNMODAL Function \(Page\)](RUNMODAL-Function--Page-.md), you can use the variable before and after you run the page.  
  
## Example  
 This example shows how to use the **RUN** function. Assume the variable MyPage has been defined as Page 1.  
  
```  
MyPage.XXX; // any user-defined function  
MyPage.SETTABLEVIEW(MyRecord);  
MyPage.SETRECORD(MyRecord);  
MyPage.RUN;  
```  
  
## See Also  
 [Page Data Type](Page-Data-Type.md)