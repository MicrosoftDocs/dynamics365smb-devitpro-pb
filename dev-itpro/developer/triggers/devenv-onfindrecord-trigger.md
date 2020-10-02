---
title: "OnFindRecord Trigger"
description: "Describes the functionality of the OnFindRecord trigger."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnFindRecord Trigger

Overrides the default page behavior and enables you to specify which record you want to display when the page loads data during page opening or when there is a need to show more data on the page.

## Syntax  

```  
trigger OnFindRecord(Which): Ok
begin
    ...
end;
``` 
  
#### Parameters  

 *Which*  
  
 Text or code value with the following options:  
  
|Parameter Value|Result|  
|---------------------|------------|  
|- \(a dash\)|First record|  
|+ \(a plus sign\)|Last record|  
|=>\<|Record defined in the `Rec` variable or the closest match|  
  
## Return Value  

 *Ok*  
  
 \(Boolean\) Indicates whether the specified record was found.  
  
|Value|Result|  
|-----------|------------|  
|true|Found|  
|false|Not found (default)|  
  
## Applies to  
  
- Pages  
  
## Remarks  

By default, open pages display the last record shown when the user exited the page. Use this trigger to override the default behavior and display the first record, last record, or a specific record as defined in the `Rec` variable.  
  
## See Also  

[Triggers](devenv-triggers.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  