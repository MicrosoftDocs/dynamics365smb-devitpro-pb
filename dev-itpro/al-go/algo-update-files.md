---
title: "Update AL-Go System Files"
description: ""
author: freddyk
ms.custom: na
ms.date: 12/30/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Update AL-Go System Files

> *The prerequisite for this how to is that you have followed and completed the [Register a Customer Production Environment for Manual Deployment](algo-register-cust-prod-env.md) instructions.*

Every time a CI/CD pipeline runs, it checks whether there are updates to AL-Go system files. AL-Go system files are scripts in the `.AL-Go` folder and workflows in the `.github` folder. Looking into the details of the Check for updates to Al-Go system files, usually looks like this:

<!-- image -->

1. In Visual Studio Code, modify the `LocalDevEnv.ps1` file, stage the change, and then commit and push it.
1. Now there is a difference in the files. AL-Go doesn’t support changes to the AL-Go system files and will warn if that happens. The CI/CD pipeline, which kicked off when pushing the change gives this warning.
1. To update the AL-Go system files using the **Update AL-Go System Files** workflow, you need to provide a secret called `GHWORKFLOWTOKEN` that contains a Personal Access Token with permissions to modify workflows.
1. Open a browser window, log into www.github.com and navigate to **Settings** and then choose **Personal access tokens** in the left pane. Create a new personal access token; name it, set the expiration date, and check the workflow option in the list of scopes.
1. 

## See also