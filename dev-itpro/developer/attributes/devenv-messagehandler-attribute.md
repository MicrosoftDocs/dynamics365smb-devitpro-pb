---
title: "MessageHandler Attribute"
description: "Specifies that the method is a MessageHandler method, which handles Message statements."
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

# MessageHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a MessageHandler method, which handles Message statements.


## Applies To

- Method

> [!NOTE]
> The **MessageHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[MessageHandler]
procedure MessageHandler(Message: Text[1024])
```
> **Version**: _Available or changed with runtime version 2.1._

```
[MessageHandler]
procedure MessageHandler(Message: Text)
```

### Arguments
*Message*  
&emsp;Type: [Text[1024]](../methods-auto/text/text-data-type.md)  
The message of the test method.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks

The **MessageHandler** method is called when a message method is invoked in the code. 

For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  