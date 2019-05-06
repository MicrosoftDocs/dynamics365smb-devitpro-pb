---
title: "OnValidate (Fields) Trigger"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dbc4e207-632a-482b-9787-615eb1815571
author: SusanneWindfeldPedersen
manager: edupont
---

# OnValidate (Fields) Trigger
Runs when user input is validated.  

## Syntax  
  
```  
OnValidate()  
```
  
## Applies To  
- Fields  
  
## Remarks  
 This trigger is run after the default validation behavior. An error message displays if an error occurs in the trigger code. In case of an error, the user entry is not written to the database.  

 The OnValidate trigger is also a field trigger at the page level. For more information, see [OnValidate (Page Fields) Trigger](devenv-onvalidate-page-fields-trigger.md). If both the table field and page field triggers are defined, then the OnValidate trigger on the table field is run before the OnValidate trigger on the page field.  

## Example

```
tableextension 50111 "CustomerExt" extends Customer
{
    fields
    {
        field(50112; Acronym; Text[15])
        {
            trigger OnValidate();
            begin
                rec.Acronym := rec.Acronym.ToUpper();
            end;
        }
    }
}
```
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
 [Table Properties](../properties/devenv-table-properties.md)    