---
title: "Create Online Development Environment from Visual Studio Code"
description: ""
author: freddyk
ms.custom: na
ms.date: 01/21/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Create Online Development Environment from Visual Studio Code

> *The prerequisite for this how to is that you have completed the [Use Azure KeyVault for secrets with AL-Go](algo-use-azure-key-vault-for-secrets.md) instructions.*

1. Locate the `App1` project that you created in a previous how to, and open it in Visual Studio Code.
1. Open the `cloudDevEnv.ps1` file in your `.AL-Go` folder and run the script in the **Terminal** window. The script will ask for an environment name if it isn’t specified and it will ask whether you want to reuse or recreate the environment if it already exists. After this the script will need access to the admin center API and will initiate a device code login for this purpose.
1. Open a browser window and enter this URL `https://aka.ms/devicelogin`, then paste in the code provided, sign in and accept that you are trying to sign in with PowerShell.



## See also