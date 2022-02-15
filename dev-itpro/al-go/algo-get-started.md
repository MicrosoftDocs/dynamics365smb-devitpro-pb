---
title: "Create a new per-tenant extension and start developing in Visual Studio Code"
description: "Get started with AL-Go for GitHub and create repository from template for Business Central."
author: freddyk
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Create a new per-tenant extension and start developing in Visual Studio Code

The following steps will help you get started by creating a repository on GitHub using the available template. Then you will open the generated repository in Visual Studio Code and run a PowerShell script which will set up a local developer environment for you. 

## Getting the repo ready on GitHub

1. Navigate to https://github.com/microsoft/AL-Go-PTE and choose **Use this template**.
1. In the **Repository name** field, enter `app1` and then select if the repository will be **Private** or **Public**.
1. Choose the **Create repository from template** button.
1. On the **Actions** tab, under **Workflows** select **Create a new app**, and then choose the **Run workflow** drop-down button.
1. In the dialog, enter **Name**, **Publisher**, and **ID Range**, and specify **Y** for yes in the **Direct COMMIT** field. Now, choose **Run workflow**.
1. Once the workflow has completed, go to the **< > Code** tab.
1. Choose the **< > Code** button, and copy the **HTTPS** URL. The URL is equivalent to `https://github.com/user/app1.git`.

## Setting up the environment in Visual Studio Code

1. Start Visual Studio Code, press **Ctrl+Alt+P** and select **Git Clone** and paste the URL that you copied in the previous section.
1. Choose which folder to clone the directory to.
1. Now, open the cloned repository and then open the workspace in Visual Studio Code when prompted for it.
1. In the `.AL-Go` folder, choose the `localDevEnv.ps1` script and in the upper right corner of the script, choose **Run**.
1. As the script is running, you must enter container name, authentication mechanism, credentials, and select `none` if asked for a license file.  
The script might show a dialog asking for permissions to run Docker commands, select **Yes** in this dialog. 
1. Wait for completion of the script.
1. Once the script is completed, press **Ctrl+Alt+P** and choose **Clear credentials cache**.
1. Open the `HelloWorld.al` file, modify the string as you want and then press **F5**.  
Depending on selected authentication method, Visual Studio Code might ask for the credentials that you provided in step 5. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will now start.
1. Back in Visual Studio Code, you will see that in addition to your changes in the `HelloWorld.al`file, the `launch.json` file was also modified with the information about the local environment. 
1. Now, from the Visual Studio Code source control, stage your changes, commit them, and **Sync changes**.

## Check the workflow on GitHub

1. Go back to the repository on www.github.com, on the **Actions** tab, investigate the workflow that you started by committing and sync'ing your changes in the previous step.
1. When the build is done, chose the workflow to inspect the build summary.
1. In the left pane, choose **Build** and inspect the workflow run, expand the **Run Pipeline** section in the build, and the **Compiling apps** subsection.

## Next step

A next step to take, could be [Add a Test App to an Existing Project](algo-add-test-app.md).

## See also

[AL-Go Overview](algo-overview.md)  
[Add a Test App](algo-add-test-app.md)  
[Register a Customer Sandbox Environment for Continuous Deployment using S2S Authentication](algo-register-sandbox.md)  