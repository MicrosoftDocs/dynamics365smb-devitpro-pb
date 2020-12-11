---
title: "TableNo Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TableNo Property
> **Version**: _Available from runtime version 1.0._

Sets the source table number, if any, for this codeunit.

## Applies to
-   Codeunit


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


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

[Run Method \(Codeunit\)](../methods-auto/codeunit/codeunit-run-method.md)