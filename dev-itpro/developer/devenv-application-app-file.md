---
title: "The Microsoft_Application.app File"
ms.author: solsen
ms.custom: na
ms.date: 03/05/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# The Microsoft_Application.app File

The Microsoft_Application.app file is included with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. 

The `Microsoft_Application.app` file logically encapsulates all of the extensions making up a solution, for example, version `16.0.0.0` of the base and system application package files, and it provides a convenient way to define and refer to this solution identity. 

> [!NOTE]  
> In previous versions the references to base and system application were stated explicitly under `dependencies` in the `app.json` file of the extension.

The file name of the reference is `Microsoft_Application.app` and in the app.json file of the application package file, the `name` is `Application`. For code-customized base applications that have their own `appId`, the `Microsoft_Application.app` file can be modified to reference the `appId` of the code-customized base applications instead. This allows any extensions that are dependent on the `Application` to resolve to the custom appId. If you have modified the `Microsoft_Application.app` file, you can rename the file name, and change information about the `publisher`, but It is important to keep `"name": "Application"` in the extension, which is what is being checked for in terms of symbols references.

## See Also

[JSON Files](devenv-json-files.md)  