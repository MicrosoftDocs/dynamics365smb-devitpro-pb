---
title: "TextConst Data Type"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# TextConst Data Type
> **Version**: _Available from runtime version 1.0._

Denotes a multi-language string constant.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The `TextConst` data type is typically used for UI messages; process or error messages. Keeping the `TextConst` data type in global scope, makes it easier to reuse the same message for several situations. For information about naming, see [CodeCop Rule AA0074](../../analyzers/codecop-aa0074-textconstlabelvariablenamesshouldhaveapprovedsuffix.md).

> [!IMPORTANT]  
> The `TextConst` data type is not included in the .xlf files for translation. Make sure to use the [Label Data Type](../label/label-data-type.md) instead.

## Example
The data type can be declared with the syntax as shown in the example below.

```al
codeunit 50100 MyCodeunit
{
    procedure MyProcedure()
    var
        localTextConst: TextConst ENU = 'My text', DAN = 'Min tekst';
    begin
        Message(localTextConst);
    end;

    var
        globalTextConst: TextConst ENU = 'My text', DAN = 'Min tekst';
}

```

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  