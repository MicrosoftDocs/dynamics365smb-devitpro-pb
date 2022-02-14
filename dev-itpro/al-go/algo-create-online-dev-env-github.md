---
title: "Create an Online Development Environment from GitHub"
description: "Create an online development environment in GitHub for AL-Go for Business Central"
author: freddyk
ms.custom: na
ms.date: 01/21/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Create an Online Development Environment from GitHub

> *The prerequisites for this how to is that you have completed the [Use Azure KeyVault for secrets with AL-Go](algo-use-azure-keyvault-for-secrets.md) instructions.* 

To create an online development environment, we need to authenticate to our Business Central Admin API using OAuth. The (Create Online Dev. Environment) workflow works unattended if you provide a secret called `AdminCenterApiCredentials`, either as a GitHub Secret or in a key vault. Currently, the Admin Center API does not yet support S2S, which means that the `AdminCenterApiCredentials` cannot be formatted like explained in section 3, but must be formatted as: `{"refreshtoken":"refreshtoken"}`.

Getting the refresh token can be done using this command on a machine with `BcContainerHelper` installed:

```powershell
New-BcAuthContext -includeDeviceLogin | ConvertTo-GitHubGoCredentials | Set-Clipboard
```

If you do **not** provide an `AdminCenterApiCredentials` secret, the workflow will initiate a device code flow and you can login by opening a browser, pasting in this URL `https://aka.ms/devicelogin` using this code and have the workflow continue. In order to get the code, you will have to inspect the details of the workflow and open the job called Check AdminCenterApiCredentials / Initiate Device Login (open to see code)

## Steps

1. On www.github.com, on the **Actions** tab, select the **Create Online Dev. Environment** workflow.
1. choose **Run workflow** and specify the requested environment name and whether you want to reuse the environment if it already exists and then choose the **Run workflow** button.
1. When the workflow is complete, inspect the pull request to see the changes in the `launch.json` file. This environment can now be used by a developer, but be aware that two developers cannot share one online environment.
1. Merge the pull request and now you are ready to do rapid application development (RAD).

## See also