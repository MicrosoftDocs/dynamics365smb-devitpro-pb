---
title: "Synchronizing extension test data"
description: "Retaining table data after publishing an extension"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/07/2018
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

# Retaining table data after publishing
When developing an extension, you debug several times using the F5 shortcut key, and you also test your app by adding some sample data every time. To simplify the extension development process in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you can synchronize the sample data specified in the extension when you do subsequent publishing from Visual Studio Code.

## How data synchronization works
The data synchronization between each publish is controlled by the `schemaUpdateMode` setting, which is specified in the `launch.json` file. This setting consists of two options; **Synchronize** and **Recreate**. The default value for `schemaUpdateMode` is set to the **Synchronize** mode, which means that every time you publish an extension to the development server, the data you entered previously stays. If you do not want to synchronize the sample data with each publish, you can change the `schemaUpdateMode` setting from `Synchronize` to `Recreate` as shown in the example below. 


```json
 { 
     "type": "al",
     "request": "launch",
     "name": "your own server",
     "server": "http://localhost",
     "serverInstance": "Nav",
     "authentcation": "UserPassword", 
     "startupobjectId": 22
     "schemaUpdateMode": "Recreate" 
 }
```

## Recreate mode
When you set the schema update mode to **Recreate**, all the tables and table extensions are recreated at every publish, which means that all the data in those tables are lost. This means that you will get empty records when you publish your extension.

## Things to be aware of
**Synchronize** is the default schema update mode for syncing the database and the extension. There are some key factors to consider when you work with the **Synchronize** mode.  

- After publishing, the field data and the primary key information synchronizes with all the tables and the table extensions. This means that you can do additions easily, but not deletions. For example, you can add a field and sync that with the extension just by pressing the F5 shortcut key, but if a field is removed then the table data cannot be synchronized and you have to either use the **Recreate** mode or write an [upgrade codeunit](devenv-upgrading-extensions.md).  
 
- When you make changes to the data types, you can only enlarge the unit size, and not decrease the unit size. For example, you can set a text type from `Code[20]` to `Code[50]` or `Text[32]` to  `Text[87]`, and you cannot set a text type from `Code[50]` to `Code[30]` or `Text[87]` to `Text[40]`.  

- Making major table structural changes could lead to compilation errors. For example, if you want to update a primary key. In this case, the table data cannot be synchronized, and if you want to publish the extension, you must change the `updateSchemaMode` to `Recreate` or write an upgrade codeunit. For more information, see [Upgrading Extensions](devenv-upgrading-extensions.md).  


## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Upgrading Extensions](devenv-upgrading-extensions.md)  
[Debugging](devenv-debugging.md)  
