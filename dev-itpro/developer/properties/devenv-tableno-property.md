---
title: "TableNo Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e28a2f89-b24f-4191-aa37-12d3a9901b88
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---


# TableNo Property

Sets a record parameter by reference to a table on the `OnRun` trigger. 
  
## Applies to

- Codeunits  
  
## Remarks

Although you do not see this in AL code, setting the **TableNo** property changes the signature of the `OnRun` trigger of the codeunit to include a variable `Record` data type parameter (named `Rec`) for the specified table. For example, the following code sets the **TableNo** property in a codeunit to the **Item** table.

```AL
codeunit 50100 MyCodeunit
{
    TableNo = Item;

    trigger OnRun()
    begin
        
    end;

}
```

The signature of the `OnRun` trigger is `OnRun(var Rec : Record Item)`. 

You can then use the `Rec` variable in the codeunit, and use the  [Run Method \(Codeunit\)](../methods-auto/codeunit/codeunit-RUN-method.md) to execute the codeunit.  
  
## See Also

[Run Method \(Codeunit\)](../methods-auto/codeunit/codeunit-RUN-method.md)