---
title: Field Groups
description: A field group defines the fields to display in a drop-down control in Dynamics 365 Business Central. 
ms.custom: na
ms.date: 09/03/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ddb133b9-e940-4db8-bf3a-e5f906600188
caps.latest.revision: 24
author: SusanneWindfeldPedersen
---

# Field Groups

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](includes/vnext_preview.md)]

A field group defines the fields to display in a drop-down control. The fieldgroups control allows you to add more fields to the field group members list. In order to add fields to a field group, you create a table extension and specify the fieldgroups control and the fields you want to append to the field group.  

> [!NOTE]  
> You can only place the fields at the end of the field group members list using the addlast keyword. 

> [!WARNING]  
> The server will remove the duplicates, if multiple extensions attempt to add the same field more than once. A field can only be added to the field group once.

### Example

```
tableextension 50100 CustomerExercise extends Customer
{
    fields
    {
        field(50100); "V02Max"; Decimal) { }
    }
   
    fieldgroups
    {
        addlast(DropDown; V02Max) { }
    }
}
```

## See Also
[Debugging in AL](devenv-debugging.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
