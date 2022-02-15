---
title: "Update AL-Go System Files"
description: "Updating the AL-Go system files for your project for Business Central."
author: freddyk
ms.custom: na
ms.date: 12/30/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Update AL-Go System Files

> *The prerequisite for this how to is that you have completed the [Register a Customer Production Environment for Manual Deployment](algo-register-cust-prod-env.md) instructions.*

Every time a CI/CD pipeline runs, it checks whether there are updates to AL-Go system files. AL-Go system files are scripts in the `.AL-Go` folder and workflows in the `.github` folder. Looking into the details of the Check for updates to Al-Go system files, usually looks like this:

<!-- image -->

## Steps

1. In Visual Studio Code, modify the `LocalDevEnv.ps1` file, stage the change, and then commit and push it.
1. Now, there is a difference in the files. AL-Go doesn’t support changes to the AL-Go system files and will warn if that happens. The CI/CD pipeline, which kicked off when pushing the change gives this warning.
1. To update the AL-Go system files using the **Update AL-Go System Files** workflow, you need to provide a secret called `GHWORKFLOWTOKEN` that contains a Personal Access Token with permissions to modify workflows.
1. Open a browser window, log into www.github.com and navigate to **Settings** and then choose **Personal access tokens** in the left pane. Create a new personal access token; name it, set the expiration date, and check the workflow option in the list of scopes.
1. Generate the token and copy it to the clipboard. **Note:** You will not be able to see the token again.
1. On www.github.com, open **Settings** in your project and in the left pane select **Secrets**. Choose the **New repository secret** button and create a secret called `GHTOKENWORKFLOW` and paste the personal access token that you saved in the previous step into the **Value** field and then choose the **Add secret** button.
1. On www.github.com, on the **Actions** tab in your project, select the **Update AL-Go system files** workflow and choose **Run workflow**. Leave the **Template Repository URL** blank and choose **Run workflow**.
1. Inspect the pull request and confirm that it reverts your change to the `LocalDevEnv.ps1` file.

By default, this workflow will apply any updates to the workflow files (in the `.github\workflows` folder) or system scripts (in the `.AL-Go` folder) from the template repository used to spin up the repository. If you want to change branch or template URL, you can specify the `templateUrl@branch` when you run the workflow.

## Next steps

Next, you can go to [Use Azure KeyVault for Secrets with AL-Go](algo-enable-keyvault-app-development.md).

## See also

[AL-Go Overview](algo-overview.md)  