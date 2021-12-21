---
title: "Get started "
description: ""
author: freddyk
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# AL-Go Get started

## Getting started on GitHub

1. Navigate to https://github.com/microsoft/AL-Go-PTE and choose **Use this template**
1. In the **Repository name** field, enter `app1` and then select if the repository will be **Private** or **Public**.
1. Choose the **Create repository from template** button.
1. On the **Actions** tab, under **Workflows** select **Create a new app**, and then choose the **Run workflow** drop-down button.
1. In the dialog, enter **Name**, **Publisher**, and **ID Range**, and specify **Y** for yes in the **Direct COMMIT** field. Now, choose **Run workflow**.
1. Once the workflow has completed, go to the **< > Code** tab.
1. Choose the **< > Code** button, and copy the **HTTPS** URL. The URL is equivalent to `https://github.com/user/app1.git`.

## Continue in Visual Studio Code

1. Start Visual Studio Code, press **Ctrl+Alt+P** and select **Git Clone** and paste the URL that you copied in the previous section.
1. Choose which folder to clone the directory to.
1. <!-- authentication?? -->
1. Now, open the cloned repository and then open the workspace in Visual Studio Code when prompted for it.
1. In the `.AL-Go` folder, choose the `localDevEnv.ps1` script and in the upper right corner of the script, choose **Run**.
1. As the script is running, you must enter container name, authentication mechanism, credentials, and select `none` if asked for a license file.  
The script might show a dialog asking for permissions to run Docker commands, select **Yes** in this dialog. 
1. Wait for completion of the script.
1. 

## See also