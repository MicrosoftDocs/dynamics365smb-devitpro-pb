---
title: "Set up CI/CD for an existing per-tenant extension (BingMaps)"
description: ""
author: freddyk
ms.custom: na
ms.date: 01/24/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Set up CI/CD for an Existing Per-Tenant Extension (BingMaps)

> *The prerequisites for this how to is that you have a GitHub account.*

This how to uses the BingMaps sample app, which can be found on Azure DevOps [](https://dev.azure.com/businesscentralapps/_git/BingMaps). Copy the following URL (a direct download of the main branch of the BingMaps sample) to the clipboard: https://dev.azure.com/businesscentralapps/BingMaps/_apis/git/repositories/BingMaps/items/items?path=/&versionDescriptor[versionOptions]=0&versionDescriptor[versionType]=0&versionDescriptor[version]=master&resolveLfs=true&$format=zip&api-version=5.0&download=true – you can download the .zip file and see the content of it.

1. Navigate to https://github.com/microsoft/AL-Go-PTE and then choose **Use this template**.
1. Enter `app2` as repository name and select **Create Repository** from template.
1. On the **Actions** tab, select the **Add existing app or test app** workflow and then choose **Run workflow**.
1. In the **Direct Download URL** field, paste in the direct download URL of the BingMaps sample from above.
1. When the workflow is complete, inspect the pull request. 

## See also