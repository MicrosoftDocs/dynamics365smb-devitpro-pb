---
title: "ContextSensitiveHelpPage Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
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
# ContextSensitiveHelpPage Property
> **Version**: _Available from runtime version 3.0._

Specifies the help topic to show when the user presses Help in the UI. The help server on which this help topic is located, must be defined in the app.json file.

## Applies to
-   Page
-   Request Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
ContextSensitiveHelpPage = 'page-extension-topic';
```

## Remarks

The value of this property forms the second half of the URL to context-sensitive Help for your app. The first half is set in the app.json where you specify the URL to your library of Learn More content. For more information, see [Configure Context-Sensitive Help](../../help/context-sensitive-help.md).  

## See Also  

[Configure Context-Sensitive Help](../../help/context-sensitive-help.md)  
[User Assistance Model](../../user-assistance.md)  
[Configuring the Help Experience](../../deployment/configure-help.md)  
[Adding Help Links from Pages, Reports, and XMLports](../devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Properties](devenv-properties.md)  