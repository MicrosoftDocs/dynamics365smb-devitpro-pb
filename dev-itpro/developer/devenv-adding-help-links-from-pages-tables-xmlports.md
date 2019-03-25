---
title: "Adding Help Links from Pages, Reports, and XMLports"
description: "This topic shows how to specify the help link."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/25/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
---

 

# Adding Help Links from Pages, Reports, and XMLports

When creating new pages, you can specify links to context-sensitive Help that will be used when a user selects the *Learn more* links in the UI of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  

The help link includes a placeholder `{0}` for the user locale. For information about translating base app help, see [Translating Base App Help](devenv-translate-base-app-help.md). The default help link for your extension is specified in the `app.json` file. For more information, see [JSON Files](devenv-json-files.md#Appjson).

## Examples

The following examples show how you can specify the *ContextSensitiveHelpPage* property from new pages, reports, and XMLports:

``` 
page 50100 MyPageWithHelp
{
    ContextSensitiveHelpPage = 'sales-rewards';
}
```

``` 
report 50100 MyReportWithHelp
{
    requestpage
    {
        ContextSensitiveHelpPage = 'sales-rewards';
    }
}
```

```
xmlport 50100 XmlPortWithHelp
{
    requestpage
    {
        ContextSensitiveHelpPage = 'sales-rewards';
    }
}
```

In all three examples, the *ContextSensitiveHelpPage* property is set to point at the same Help files. This is because all three example objects support the same feature that is explained in the *sales-rewards* Help topic. In your app, you can choose to structure the Help differently.  

## See Also

[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
[Translating Base App Help](devenv-translate-base-app-help.md)  
[Page Object](devenv-page-object.md)  
[Report Object](devenv-report-object.md)  
[XMLport Object](devenv-xmlport-object.md)  
[Table Object](devenv-table-object.md)  
