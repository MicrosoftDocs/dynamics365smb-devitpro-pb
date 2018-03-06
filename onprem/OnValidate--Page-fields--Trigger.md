---
title: "OnValidate (Page fields) Trigger"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c9a4c961-c9c2-4afb-8493-fbeefdad27ca
caps.latest.revision: 9
manager: edupont
---
# OnValidate (Page fields) Trigger
Executed when a field loses focus after its value has been changed.  
  
## Syntax  
  
```  
  
OnValidate()  
```  
  
## Applies To  
  
-   Pages  
  
## Remarks  
 Use this trigger to validate user entries in a page field. If validation fails, then the field is marked with an error and its value is not saved.  
  
 The OnValidate trigger is also a field trigger at the table level. For more information, see [OnValidate \(Fields\) Trigger](OnValidate--Fields--Trigger.md). If both the table field and page field triggers are defined, then the OnValidate trigger on the table field is executed before the OnValidate trigger on the page field.  
  
> [!NOTE]  
>  You can use this trigger to write to the database. You cannot call the UPDATE function from this trigger.