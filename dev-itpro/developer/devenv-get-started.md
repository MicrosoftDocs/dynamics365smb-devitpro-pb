---
title: Get started with AL
description: Description of how to get started with the AL development environment.
author: SusanneWindfeldPedersen
ms.date: 08/25/2026
ms.topic: get-started
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Get started with AL

[!INCLUDE [getstarted-contributions](includes/getstarted-contributions.md)]

AL (Application Language) is the foundation for developing extensions in [!INCLUDE[prod_short](includes/prod_short.md)]. This article walks you through setting up your development environment, creating your first AL project, and understanding the tools and resources available to streamline your development process.

To get started writing extensions for [!INCLUDE[prod_short](includes/prod_short.md)], you need a [!INCLUDE[prod_short](includes/prod_short.md)] tenant, Visual Studio Code, and the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. Visual Studio Code is a cross-platform editor that you use for coding and debugging.

## Steps to set up a sandbox environment and Visual Studio Code

Go through the following steps to set up a sandbox environment. Once you set up a sandbox environment, you get sample code that compiles and runs with just a few commands.

1. Sign up for a [Dynamics 365 Business Central sandbox](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1). 
1. Download [Visual Studio Code](https://code.visualstudio.com/Download).  
1. Download the [[!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al).
1. Select <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> to open the **User Settings** window. Modify the [telemetry settings](#telemetry-settings).
1. Select <kbd>Alt</kbd>+<kbd>A</kbd>, and right after, <kbd>Alt</kbd>+<kbd>L</kbd> to trigger the **AL Go!** command. Choose a path to a new empty folder and which version to run. Then choose **Microsoft cloud sandbox** as the server.  
  The **AL: Go!** command creates a new AL project with all the necessary files and folders including the `app.json` and `launch.json` files.
1. Enter the credentials that you provided for the sign-up.
1. Select <kbd>Ctrl</kbd>+<kbd>F5</kbd> to deploy and run the extension on your online sandbox tenant.  

You now have a `HelloWorld` sample that compiles and runs. The JSON files in the project are automatically updated with the settings that allows you to select <kbd>Ctrl</kbd>+<kbd>F5</kbd> to build and deploy the solution to [!INCLUDE[prod_short](includes/prod_short.md)]. Learn more in [JSON files](devenv-json-files.md).

> [!NOTE]
> With runtime 16.0 and later, you can cancel an in‑progress publish. Select the **Cancel** button in the dialog in the lower right corner. The operation stops packaging and upload steps as soon as possible. Partial artifacts aren't applied to the server.

### Things to note

- For information about creating a container-based sandbox, see [Get started with the container sandbox development environment](devenv-get-started-container-sandbox.md). To learn more about which sandboxes you can choose, see [Sandbox environments for Dynamics 365 Business Central development](devenv-sandbox-overview.md).
- You can't publish an extension from Visual Studio Code with the same identifiers as an extension that's already published to Marketplace. Identifiers include the combination of appID and version or name, publisher, and version. If you do publish such an extension, it can be removed at any time.
- Due to keyboard or other settings, some users might find that the <kbd>Ctrl</kbd>+<kbd>F5</kbd> shortcut key doesn't work. If it doesn't work for you, run your code by choosing **Run Without Debugging** from the **Run** dropdown in Visual Studio Code.
- You can change your configuration later in the `launch.json` file. Choose the **Add Configuration** button on the bottom right side, and then choose one of the available options. You don't have a `launch.json` file until you run the `AL:Go!` command.

## Install the required .NET runtime

> [!NOTE]
> Starting with Business Central 2026 release wave 2, the AL Language extension uses the [.NET Install Tool for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.vscode-dotnet-runtime) to acquire its required .NET 10.0 runtime. Visual Studio Code downloads and installs the runtime automatically when the AL Language extension starts.
>
> If your organization restricts Visual Studio Code extensions through a private marketplace, make the .NET Install Tool available there. The AL Language extension can't acquire its runtime dependency if the tool isn't available. If automatic acquisition fails after the extension starts, the extension tries to use a compatible ASP.NET Core runtime that is available through the system `dotnet` command.

## Tips and tricks

+ Use <kbd>Ctrl</kbd>+<kbd>Space</kbd> to activate IntelliSense at any place in the code, which helps you identify possible options.
+ Always use the `.al` extension on new files.
+ Use the built-in [snippets for code](devenv-syntax.md#examples-of-snippets) by typing `t` and choose the desired snippet from the list.
+ Create objects within the right object ranges. See [Object ranges in Dynamics 365 Business Central](devenv-object-ranges.md).
+ Build and get inspired by the sample library on [GitHub](https://github.com/Microsoft/bctech).
+ Use <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and select **AL: Clear credentials cache** to clear the credentials cache if you want to deploy against a different environment.
+ Use <kbd>F2</kbd> to rename objects, types, and more. Learn more in [Keyboard shortcuts](devenv-keyboard-shortcuts.md#editing-in-visual-studio-code).
+ The `settings.json` file contains user and workspace settings. Modify these options to suit your preference. To modify Visual Studio Code editor options and functional behavior settings, see [User and workspace settings](https://code.visualstudio.com/docs/getstarted/settings).
+ When no folders are opened, the primary side bar for the Visual Studio Code Explorer has a **Create AL Project** button. Clicking this button invokes the `AL:Go!` command to create a new project.

## Get started with Copilot templates

With runtime 15.0, use the <kbd>Alt</kbd>+<kbd>A</kbd> <kbd>Alt</kbd>+<kbd>P</kbd> shortcut key to create a **Copilot** or a **Copilot test** project. The **Copilot** project template gives you a starting point for your copilot project and includes sample pages and codeunits, which you can use to get started with your project.

The **Copilot test** project template furthermore includes codeunits that you can use to test the copilot functionality.

Learn more getting started building copilot functionality in [Get set up with Azure OpenAI Service](ai-dev-tools-get-started.md).

## JSON file settings

The project includes three JSON files: `app.json`, `launch.json`, and `rad.json`. The project automatically generates these files. For more information, see [JSON files](devenv-json-files.md) and [Work with Rapid Application Development (RAD)](devenv-rad-publishing.md).

## AL configuration settings

Use the AL configuration settings to specify general preferences for working with AL projects. Learn more in [AL Language extension configuration](devenv-al-extension-configuration.md).

## Telemetry settings

By default, Visual Studio Code is set up with a telemetry system to ensure that data and errors are sent to Microsoft. If you don't want to send telemetry data, change the `telemetry.telemetryLevel` setting to `off`.

To modify the telemetry setting, select <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> in Visual Studio Code and choose **User Settings**. This action opens the `settings.json` file. Add `telemetry.telemetryLevel` and set it to `off` as shown in the following example.
 
```json
"telemetry.telemetryLevel": "off"
```

## Installing and publishing an extension

To make your extension available to users, the package must be published to a specific [!INCLUDE[prod_short](includes/prod_short.md)] server instance. The extension can be installed for one or more tenants. Learn more about how to install and publish an extension in [Publishing and installing an extension](devenv-how-publish-and-install-an-extension-v2.md). 

## Controlling user access to develop and publish extensions

Control access to develop and publish extensions on a user or user group basis by using the **EXTEN. MGT. - ADMIN** permission set. It's important that you don't specify the **EXTEN. MGT. - ADMIN** permission set for a specific company, but leave it blank.

If you add new permission sets and want to control access to develop and publish extensions, include indirect read and write permissions to the **Published Application** table (read – for downloading symbols, write – for publishing the app) in the permission set.

To prohibit a user from publishing, remove the user from the **EXTEN. MGT. - ADMIN** permission set.

## Switching between different versions of AL

You can switch to a prerelease version of the AL Language extension directly within Visual Studio Code. This option is useful if you want to test new features or bug fixes that aren't yet available in the release version. To switch to a prerelease version of the AL Language extension, follow these steps:

1. Open Visual Studio Code and choose the **Extensions** icon in the Activity Bar on the side of the window.
1. Search for the **AL Language** extension.
1. On the **AL Language** extension, choose the **Switch to Pre-Release Version** button. Your extension is updated to the prerelease version.
4. Likewise, to go back choose the **Switch to Release Version** button.

Use preview environments to prepare for the next release. Learn more in [Prepare for major updates with preview environments](../administration/preview-environments.md).

## Next steps

Now that you have the tools and the `HelloWorld` example up and running, you might want to create a small sample app in AL. This walkthrough guides you to create an app adding objects, code, and publishing the app to your tenant. Learn more in [Build your first sample extension with extension objects, install code, and upgrade code](devenv-extension-example.md).

## Related information

[AL development environment](devenv-reference-overview.md)  
[FAQ for developing in AL](devenv-dev-faq.md)  
[Syntax](devenv-syntax.md)  
[Build your first sample extension with extension objects, install code, and upgrade code](devenv-extension-example.md)  
[AL Language extension configuration](devenv-al-extension-configuration.md)  
[Documenting your code with XML comments](devenv-xml-comments.md)
