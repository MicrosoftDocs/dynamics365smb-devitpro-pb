---
title: "Adding Help Links from Pages, Reports, and XMLports"
description: "This topic shows how to specify the help link."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Adding Help Links from Pages, Reports, and XMLports 
When creating new pages, reports, or XMLports, you can specify the help link that will be used when a user selects the **Help** button in the UI of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)]. The `HelpLink` property is not supported in extensions of these objects. The help link includes a placeholder `{0}` for the user locale. For information about translating base app help, see [Translating Base App Help](devenv-translate-base-app-help.md). The default help link for your extension is specified in the `app.json` file. For more information, see [JSON Files](devenv-json-files.md#Appjson).


## Examples 
The following examples show how you can specify the HelpLink property from new pages, reports, and XMLports: 

``` 
page 50100 MyPageWithHelp
{
    HelpLink = 'https://www.mydocumentationwebsite.com/{0}/business-central/mypage';
}
```

``` 
report 50100 MyReportWithHelp
{
    requestpage
    {
        HelpLink = 'https://www.mydocumentationwebsite.com/{0}/business-central/myreport';
    }
}
```

```
xmlport 50100 XmlPortWithHelp
{
    requestpage
    {
        HelpLink = 'https://www.mydocumentationwebsite.com/{0}/business-central/myxmlport';
    }
}
```

## See Also
[Translating Base App Help](devenv-translate-base-app-help.md)  
[Table Object](devenv-table-object.md)  
[Page Object](devenv-page-object.md)  
[XMLport Object](devenv-xmlport-object.md)  