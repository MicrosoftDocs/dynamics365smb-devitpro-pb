---
title: "StrMenuHandler Attribute"
description: "Specifies that the method is a StrMenuHandler method, which handles StrMenu statements."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# StrMenuHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a StrMenuHandler method, which handles StrMenu statements.


## Applies To

- Method

> [!NOTE]
> The **StrMenuHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[StrMenuHandler]
procedure StrMenuHandler(Options: Text[1024], var Choice: Integer, Instruction: Text[1024])
```
> **Version**: _Available or changed with runtime version 2.1._

```
[StrMenuHandler]
procedure StrMenuHandler(Options: Text, var Choice: Integer, Instruction: Text)
```

### Parameters
*Options*  
&emsp;Type: [Text[1024]](../methods-auto/text/text-data-type.md)  
The list of the different option values.


*Choice*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
The option chosen in the StrMenu.


*Instruction*  
&emsp;Type: [Text[1024]](../methods-auto/text/text-data-type.md)  
The leading text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  