---
title: "Exporting Permission Sets"
description: Export permission sets for Dynamics 365 for Business Central.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0ba68a20-d83a-4e4c-9938-dac7fa8f5461
caps.latest.revision: 35
ms.author: solsen
---

# Exporting Permission Sets

Permission sets that exist in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] can be exported and packaged for your extension directly from the client, instead of defining XML by hand. 

## To export permission sets from [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]
1. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], search for **Permission Sets**, and then choose the relevant link.
2. On the **Permission Sets** page, choose the permissions that you want to export, and then choose **Export Selected Permissions**.
3. In the **Export Permission Sets** dialog, choose to export permission sets only for the application, only for the tenant, or for both.
4. Save the file to your extension folder.
5. Delete the permission sets from [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. 

You can generate a permission set file which contains permissions to all the files in your extension. This will make it easier to start setting up permissions for your app. You can do this by simply creating an extension with some objects. 

## To export permission sets using Visual Studio Code

1. In Visual Studio Code, open your extension.
2. Create extension with some objects like Page, Report, Table, Query, Codeunit, or XmlPort.  
3. Open the command palette using the `Ctrl+Shift+P` keys and select the **AL: Generate permission set containing current extension objects** command.  
    > [!NOTE]  
    > If you do this repeatedly, Visual Studio Code will probe for overwriting the file, there is no support for merging manual corrections into newly generated content.
4. Publish the app. 

Now, you have the XML file with default permissions to all your objects.

## See Also
[Permissions on Database Objects](devenv-permissions-on-database-objects.md)  
[Permissions Property](properties/devenv-permissions-property.md)  
[TestPermissions Property](properties/devenv-testpermissions-property.md)  
