---
title: Troubleshooting in Visual Studio Code directly from the web client
description: Opening Visual Studio Code directly from the Business Central web client to perform troubleshooting.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.topic: overview
ms.collection: 
ms.date: 09/13/2023
ms.custom: bap-template
---

# Troubleshooting in Visual Studio Code directly from the web client

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, you can open a new Visual Studio Code session directly from the web client for a specific customer production or sandbox environment. This enables performing troubleshooting, such as debugging, inspecting variables, setting breakpoints and viewing source code.

Depending on the context, Visual Studio Code will open to allow inspecting objects and source, and allow attaching to debug or snapshot debug and profile the current web client session. Access to the source code is gated by the resource exposure profile settings for each extension. For more information, see [Resource exposure policy setting](devenv-security-settings-and-ip-protection.md).

From the [!INCLUDE [prod_short](includes/prod_short.md)] web client, you can open Visual Studio Code in the following ways:

- Open a page from within the **Page Inspector**
- Troubleshoot the current session from within the **Help and Support** page

## Open a page from within the Page Inspector

- On a page, you can start the Page Inspector, and choose the **Explore page in Visual Studio Code** link, you will be asked if you want to download the symbols for the page, and if the code, for example, was added by another extension, you will need the symbols to be able to troubleshoot further. You can now choose to snapshot debug, regular debug, or just inspect the code.
    - You can also choose to inspect a specific field on a page, from the **Page Inspector**, choose the field, choose the dropdown menu, and choose **Explore field in VS Code**.
    - 
## Troubleshoot the current session from within the Help and Support page

 (**Attach debugger to this session**, **Use current project**, or **Create a new project** - if you choose to create a new project, you will be asked to specify a location for the project and you will choose whether to use snapshot debugging, or regular debugging. Then you will attach to the current session that you're running in the web client. Now, you can, for example, set the breakpoints needed in the code, go back to run the task in the web client, and when the breakpoint is hit, you can inspect this code in Visual Studio Code.

## Good to know

- If Visual Studio Code is already open, the last active session will be used; otherwise, a new Visual Studio Code session will open. If the AL Language extension isn't installed, the user will be asked to install it, and the process ends.
- Wen invoked, a new project will be created or updated, and a matching launch configuration will be created, depending on the current environment being a production or sandbox environment.
- If invoked for page in the **Page Inspector**, symbols for that page will be downloaded 
- If the user chooses to debug, Visual Studio Code will attach to the web client process, which it was invoked from and await breaking on error.

When you choose to generate new projects, remember to delete the projects once in a while to not accumulate many unused projects.

## See also

[Resource exposure policy setting](devenv-security-settings-and-ip-protection.md)  
[Debugging](devenv-debugging.md)  
[Snapshot debugging](devenv-snapshot-debugging.md)