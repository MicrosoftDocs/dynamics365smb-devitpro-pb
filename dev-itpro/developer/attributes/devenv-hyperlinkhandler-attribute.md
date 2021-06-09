---
title: "HyperlinkHandler Attribute"
description: "Specifies that the method is a HyperLinkHandler method, which handles HyperLinkHandler statements."
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

# HyperlinkHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a HyperLinkHandler method, which handles HyperLinkHandler statements.


## Applies To

- Method

> [!NOTE]
> The **HyperlinkHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 1.0._

```
[HyperlinkHandler]
procedure HyperlinkHandler(Message: Text1024)
```
> **Version**: _Available or changed with runtime version 2.1._

```
[HyperlinkHandler]
procedure HyperlinkHandler(Message: Text)
```

### Parameters
*Message*  
&emsp;Type: [Text1024](../methods-auto/text/text-data-type.md)  
The actual hyperlink.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  