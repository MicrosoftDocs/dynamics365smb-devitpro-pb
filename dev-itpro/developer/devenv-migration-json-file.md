---
title: "The Migration.json File"
description: "Description of the json file for data migration for AL in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/10/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# The Migration.json File
Data migration allows you to move table and field data between extensions. The `migration.json` file provides a pointer to the ID of an app that one or more tables will be moved to. The `migration.json` file can be added into the app project of an extension that a table is moved from to specify the ID of the app that the table will be moved to.

## Syntax for the migration.json file

```
{ 

    "apprules": [ 

        { 

            "id": "12345678-abcd-abcd-abcd-1234567890ab" 

        } 

    ] 

} 
 
```

## See Also

[JSON Files](devenv-json-files.md)  

