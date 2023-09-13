---
title: Troubleshoot in Visual Studio Code directly from the web client
description: Opening Visual Studio Code directly from the Business Central web client to perform troubleshooting.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.topic: overview
ms.collection: 
ms.date: 09/13/2023
ms.custom: bap-template
---

# Troubleshoot in Visual Studio Code directly from the web client

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, you can open a new Visual Studio Code session directly from the web client for a specific customer production or sandbox environment. This enables performing troubleshooting, such as debugging, inspecting variables, setting breakpoints and viewing source code.

Depending on the context, Visual Studio Code opens to allow inspecting objects and source, and allow attaching to debug or snapshot debug and profile the current web client session. Whether you can access the source code is gated by the resource exposure profile settings for each extension. For more information, see [Resource exposure policy setting](devenv-security-settings-and-ip-protection.md).

From the [!INCLUDE [prod_short](includes/prod_short.md)] web client, you can open Visual Studio Code in the following ways:

- Open a page from within the **Page Inspector**
- Troubleshoot the current session from within the **Help and Support** page

## Open a page from within the Page Inspector

From a page in the [!INCLUDE [prod_short](includes/prod_short.md)] web client, do the following:

1. Locate the page that you want to inspect.
1. From the page, start the **Page Inspector** with <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F1</kbd>.
1. Choose the **Explore page in Visual Studio Code** link.  
4. Next, select to do snapshot debugging, regular debugging, or just inspect the code. <!-- create new project?-->
1. If you want to debug, set breakpoints and go back to the web client to run the task. When the breakpoint is hit, you can inspect the code in Visual Studio Code.

You can also choose to inspect a specific field on a page, from the **Page Inspector**, choose the field, choose the dropdown menu, and then choose **Explore field in VS Code**.

## Troubleshoot from the Help and Support page

In the [!INCLUDE [prod_short](includes/prod_short.md)] web client, do the following:

1. Go to the **Help and Support** page, and then choose the **Attach debugger to this session** link.
1. If installed, and not already open, Visual Studio Code opens a new session, and you can choose **Use current project**, or **Create a new project**.
1. Specify the location for the project, and choose whether to use snapshot debugging, regular debugging, or just view code.
1. Next, if you have chosen to debug, you can attach to the current session in the web client.
1. Set the breakpoints needed in the code, and return to the web client to perform the task, you want to inspect. Once the breakpoint is hit, you can inspect the code in Visual Studio Code.

## Good to know

- If Visual Studio Code is already open, the last active session is used; otherwise, a new Visual Studio Code session opens. If the AL Language extension isn't installed, the user is asked to install it, and the process ends.
- When invoked, a new project is created, and a matching launch configuration is created, depending on the current environment being a production or sandbox environment.
- If invoked for page in the **Page Inspector**, symbols for that page are downloaded 
- If the user chooses to debug, Visual Studio Code attaches to the web client process, which it was invoked from and awaits breaking on error.

When you choose to generate new projects, remember to delete the projects occasionally to not accumulate many unused projects.

## See also

[Resource exposure policy setting](devenv-security-settings-and-ip-protection.md)  
[Debugging](devenv-debugging.md)  
[Snapshot debugging](devenv-snapshot-debugging.md)