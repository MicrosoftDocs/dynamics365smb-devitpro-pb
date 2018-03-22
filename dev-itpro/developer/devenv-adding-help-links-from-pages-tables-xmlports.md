---
title: "Adding Help Links from Pages, Reports, and XMLports"
description: "This topic shows how to specify the help link."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/05/2018
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
When creating pages, reports, or XMLports, you can also specify the help link that will be used when a user selects the **Help** button in the UI of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)].


## Examples 

The following examples show how you can specify the HelpLink property from pages, reports, and XMLports: 

``` 
page 50100 MyPageWithHelp
{
         HelpLink = 'https://www.github.com/Microsoft/AL';
}
```



``` 
report 50100 MyReportWithHelp
{
        requestpage
        {
                HelpLink = 'https://www.github.com/Microsoft/AL';
        }
}
```

```
xmlport 50100 XmlPortWithHelp
{
    Caption = 'XmlPort With Help';
 
        requestpage
        {
             HelpLink = 'https://github.com/Microsoft/AL';
        }
}
```
 


## See Also
[Table Object](devenv-table-object.md)  
[Page Object](devenv-page-object.md)  
[XMLport Object](devenv-xmlport-object.md)  