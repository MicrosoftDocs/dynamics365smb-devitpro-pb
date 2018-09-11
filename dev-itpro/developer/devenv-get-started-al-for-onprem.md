---
title: "Getting Started with C/SIDE and AL Side-By-Side for On-Premises"
description: "Description of how to get started with the new development environment along with C/SIDE."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/11/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Getting Started with C/SIDE and AL for On-Premises
To get started with a mixed development environment of C/SIDE and AL, you must follow the steps below. 

## Steps to install Business Central on-premises with C/SIDE and AL development environment

1. Install [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises and make sure to include the **AL Development Environment**.
2. Download [Visual Studio Code](https://code.visualstudio.com/Download).  
3. Download the [[!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).  
4. Press **Alt+A, Alt+L** to trigger the **AL Go!** command, choose a project, and then choose **Your own server**.  
6) Authenticate with the credentials you provided for the sign up.  
7) Press **F5** to deploy and run the extension on your online sandbox tenant.  

> [!NOTE]  
> Use **Ctrl+Shift+P** to clear the credentials cache if you want to deploy against a different environment.

You now have a HelloWorld sample that compiles and runs. The JSON files in the project are automatically updated with the settings that allows you to press **F5** to build and deploy the solution.

> [!TIP]  
> For information about which sandboxes you can choose, see [Choosing Your Dynamics 365 Business Central Development Sandbox Environment](devenv-sandbox-overview.md).

> [!NOTE]  
> Build and get inspired by our sample library on [GitHub](https://github.com/Microsoft/al).

## JSON file settings
There are two JSON files in the project; the `app.json` file and the `launch.json` file. The files are automatically generated for your project. For more information, see [JSON files](devenv-json-files.md).

## Telemetry settings
By default, Visual Studio Code is set up with a telemetry system to enable that data and errors are sent to Microsoft. If you do not want to send telemetry data, you can change the `telemetry.enableTelemetry` setting from `true` to `false`. 

To modify the telemetry setting, press **Ctrl+,** in Visual Studio Code and choose the **user settings** window, which opens the `settings.json` file, and then add `telemetry.enableTelemetry` and set it to `false`. 
```
"telemetry.enableTelemetry": false,
```

> [!TIP]  
> The `settings.json` file contains user and workspace settings, these options can be modified to suit your preference. If you want to modify Visual Studio Code editor options and functional behavior settings, see [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings).


## The symbol file
The symbol file contains metadata of the application. This is what your extension is being built on, and therefore the symbol file must be present. If it is not present, you will be prompted to download it. For more information about the platform symbol file, see [Symbols](devenv-symbols.md).

## Installing and publishing an extension
To make your extension available to users, the package must be published to a specific Microsoft Dynamics 365 Business Central Server instance. The extension can be installed for one or more tenants. For more information about how to install and publish an extension, see [How to: Publish and Install an Extension V2](devenv-how-publish-and-install-an-extension-v2.md). 

## See Also 
[AL Development Environment](devenv-reference-overview.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
