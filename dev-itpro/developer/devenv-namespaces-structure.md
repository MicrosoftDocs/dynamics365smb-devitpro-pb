---
title: Structuring namespaces in AL
description: Structuring your namespaces in AL for Business Central with script code example.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: bap-template
ms.date: 25/08/2023
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: conceptual
---

# Structuring namespaces in AL

Namespaces provide structure to the source code... For more information, see [Namespaces in AL](devenv-namespaces.md).

To get started introducing namespaces in your application, we're sharing a script that we have been using ourselves. This script allows you to specify namespaces for multiple objects at a time, using your folder structure. Usually code is structured into folders according to some kind of structure, which is often what you would like to replicate to some degree in your namespaces. The tool allows you to specify what namespace to assign all your AL objects within a folder. After you have run the tool, you can then customize these a bit further. We recommend doing a commit once you have found the proper namespaces. You can then use the code action to apply `using` statements to your application.

The script takes a .csv file as input, which specifies what namespace to give to each file within a folder. The .csv file looks like below:

| Folder             | Namespace |
|--------------------|-----------|
| Azure AD Graph     | System.Azure.Identity|
| Azure AD Licensing | System.Azure.Identity |
| Data Archive       | System.DataAdministration |
| Retention Policy   | System.DataAdministration |
| SharePoint         | System.Integration.Sharepoint |

Open PowerShell and go to your source folder and run the following script:


You are now ready to open VS Code and use the AL Code actions to apply all the missing using statements.

## See also

[Namespaces in AL](devenv-namespaces.md)