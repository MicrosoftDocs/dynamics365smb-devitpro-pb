---
title: "ConfirmHandler Attribute"
description: "Specifies that the method is a ConfirmHandler method, which handles Confirm statements."
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

# ConfirmHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a ConfirmHandler method, which handles Confirm statements.


## Applies To

- Method

> [!NOTE]
> The **ConfirmHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[ConfirmHandler]
procedure ConfirmHandler(Question: Text1024, var Reply: Boolean)
```
> **Version**: _Available or changed with runtime version 2.1._

```
[ConfirmHandler]
procedure ConfirmHandler(Question: Text, var Reply: Boolean)
```

### Parameters
*Question*  
&emsp;Type: [Text1024](../methods-auto/text1024/text1024-data-type.md)  
The text of the test method.


*Reply*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether the response to confirm is *yes* or *no*.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  