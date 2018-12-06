---
title: "TableNo Property"
ms.custom: na
ms.date: 10/01/2018
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

<!-- Sets the source table number, if any, for this codeunit.--> 

Sets a table as a record parameter by reference in the `OnRun` trigger of the codeunit.
  
## Applies To

Codeunits  
  
## Remarks

Although you do not see this in AL code, setting the **TableNo** property changes the signature of the `OnRun` trigger of the codeunit to include a `var` type record parameter with the name `Rec`. For example, the following code specifies the **TableNo** property in a codeunit

```
codeunit 50100 MyCodeunit
{
    TableNo = Item;

    trigger OnRun()
    begin

    end;

}

OnRun(var Rec : Record Item)

Tif you set the  VAR parameter for the table, as shown in the following example for the Table.


  
 If you specify a table number for this property, then you can use the CurrRec global variable in the codeunit and use the [Codeunit.RUN Method \(Codeunit\)](../methods/devenv-codeunit.RUN-method-codeunit.md) to execute the code unit  
  
## See Also  
 [Codeunit.RUN Method \(Codeunit\)](../methods/devenv-codeunit.RUN-method-codeunit.md)