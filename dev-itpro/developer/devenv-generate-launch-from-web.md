---
title: Generate launch configuration file directly from Business Central
description: Generate launch.json files directly from the Business Central web client for easy troubleshooting and debugging in specific environments.
ms.date: 02/26/2025
ms.topic: conceptual
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ms.author: solsen
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:02/26/2025
---

# Generate launch configuration files directly from the web client

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2025 release wave 1, you can generate launch.json files directly from the web client. Instead of manually creating the launch.json file in Visual Studio Code, you can generate it directly from the Business Central web client for a specific environment. This is especially useful for troubleshooting and debugging scenarios, as it allows you to quickly set up the necessary configurations without having to switch between different tools or environments.

You can generate launch.json files from the **Help & Support** page in [!INCLUDE [prod_short](includes/prod_short.md)]. To do this, follow these steps:

1. In [!INCLUDE [prod_short](includes/prod_short.md)], go to the **Help & Support** page.
1. Under **Troubleshooting**, choose the **Generate launch configurations for this environment** link.

Or, you can generate launch.json files from the **Extension Management** page. 

1. In [!INCLUDE [prod_short](includes/prod_short.md)], go to the **Extension Management** page
1. Choose the extension that you want to generate launch configurations for.
1. Now, choose the **Develop in VS Code** action group, and then the **Generate launch configurations** action.

Visual Studio Code then generates launch configurations for deploy, attach, and snapshot configurations matching the specific environment, including the user session information.

## Related information

[Get started with AL](devenv-get-started.md)  
[Troubleshoot in Visual Studio Code directly from the web client](devenv-troubleshoot-vscode-webclient.md)  
[Page inspection](devenv-inspecting-pages.md)
[Resource exposure policy setting](devenv-security-settings-and-ip-protection.md)