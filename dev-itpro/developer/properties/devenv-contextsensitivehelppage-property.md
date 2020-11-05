---
title: "ContextSensitiveHelpPage Property"
author: edupont04

ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
---

# ContextSensitiveHelpPage Property

Use this property to set the target Help file for context-sensitive Help for pages objects, report objects, and XMLport objects in your solution.  

## Applies to

- Page objects

- Page extension objects

- Report objects

- XMLport objects

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