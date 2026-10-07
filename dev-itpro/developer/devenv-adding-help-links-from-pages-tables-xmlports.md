---
title: Context-Sensitive Help Links for AL Objects
description: Learn how to use the ContextSensitiveHelpPage property in AL to connect pages, queries, and request pages to context-sensitive Help.
author: SusanneWindfeldPedersen
ms.date: 10/06/2026
ms.reviewer: solsen
ms.topic: concept-article
ms.author: solsen
---

# Add context-sensitive Help links to AL objects

When you create pages, queries, or request pages for reports and XMLports, you can specify which Help file opens when the user selects a **Learn more** link in the [!INCLUDE[prod_short](includes/prod_short.md)] interface.

The context-sensitive Help link combines a configuration setting in the `app.json` file with the name of the relevant Help file that you specify in the object metadata. Learn more about the configuration in [Configure context-sensitive Help](../help/context-sensitive-help.md).

## Add context-sensitive Help links

The following examples show how you can specify the `ContextSensitiveHelpPage` property on a page and on request pages for reports and XMLports:

```AL
page 50100 MyPageWithHelp
{
    ContextSensitiveHelpPage = 'sales-rewards';
}
```

```AL
report 50100 MyReportWithHelp
{
    requestpage
    {
        ContextSensitiveHelpPage = 'sales-rewards';
    }
}
```

```AL
xmlport 50100 XmlPortWithHelp
{
    requestpage
    {
        ContextSensitiveHelpPage = 'sales-rewards';
    }
}
```

All three examples set the [ContextSensitiveHelpPage property](properties/devenv-contextsensitivehelppage-property.md) to the same Help file because the objects support the feature described in the `sales-rewards` Help article. You can structure Help differently in your app.

## Related information

[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
[Translating Base App Help](devenv-translate-base-app-help.md)  
[JSON Files](devenv-json-files.md#appjson-file)  
[Page Object](devenv-page-object.md)  
[Report Object](devenv-report-object.md)  
[XMLport Object](devenv-xmlport-object.md)  
[Query object](devenv-query-object.md)  
[ContextSensitiveHelpPage Property](properties/devenv-contextsensitivehelppage-property.md)  
