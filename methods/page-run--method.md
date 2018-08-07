---
title: "Run Method"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Run Method
Creates and launches a page that you specify. You can use CLEAR function to remove the page.

## Syntax
```
 Page.Run()
```

## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If, at design time, you know the specific page that you want to run, then you can create a Page variable, set the Subtype of the variable to a specific page, and then use this method or the [RUNMODAL Method \(Page\)](devenv-RUNMODAL-Method-Page.md) on the Page variable.  
  
 If you do not know the page that you want to run, then use the [PAGE.RUN Method](devenv-PAGE-RUN-Method.md) or the [PAGE.RUNMODAL Method](devenv-PAGE-RUNMODAL-Method.md) and specify the page in the *Number* parameter.  
  
 After you define the page variable, you can use it before you run the page. If you use the [RUNMODAL Method \(Page\)](devenv-RUNMODAL-Method-Page.md), you can use the variable before and after you run the page.  
  
## Example  
 This example shows how to use the **RUN** method. Assume the variable MyPage has been defined as Page 1.  
  
```  
MyPage.XXX; // any user-defined method  
MyPage.SETTABLEVIEW(MyRecord);  
MyPage.SETRECORD(MyRecord);  
MyPage.RUN;  
```  
  

## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)