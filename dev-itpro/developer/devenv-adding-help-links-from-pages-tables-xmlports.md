---
title: "Adding Help Links from Pages, Reports, and XMLports"
description: "This topic shows how to specify the help link."
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

# Adding Help Links from Pages, Reports, and XMLports

When creating new pages, you can specify which Help file to open if the user selects the *Learn more* links in the UI of [!INCLUDE[prodshort](includes/prodshort.md)].  

The context-sensitive Help link is generated based on a configuration setting in the `app.json` file and the name of the relevant Help file that you specify as part of the metadata for the page object. For more information, see [Configure Context-Sensitive Help](../help/context-sensitive-help.md).  

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

In all three examples, the [ContextSensitiveHelpPage property](properties/devenv-contextsensitivehelppage-property.md) is set to point at the same Help files. This is because all three example objects support the same feature that is explained in the *sales-rewards* Help topic. In your app, you can choose to structure the Help differently.  

## See Also

[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
[Translating Base App Help](devenv-translate-base-app-help.md)  
[JSON Files](devenv-json-files.md#Appjson)  
[Page Object](devenv-page-object.md)  
[Report Object](devenv-report-object.md)  
[XMLport Object](devenv-xmlport-object.md)  
[Table Object](devenv-table-object.md)  
[ContextSensitiveHelpPage Property](properties/devenv-contextsensitivehelppage-property.md)  
