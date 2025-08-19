---
author: jswymer
ms.topic: include
ms.date: 08/19/2025
ms.author: jswymer
ms.reviewer: jswymer
---
Sandbox environments are meant to be precisely that: Environments that you can play around with, use as a testbed for development, and delete at will. You can deploy apps straight from Visual Studio Code to a sandbox environment, and you can attach a debugging session to a sandbox.  

> [!IMPORTANT]
> Apps that are published to a sandbox from the development environment or created using [Designer](../devenv-inclient-designer.md) are published within the scope of the service node that hosts the environment. When the sandbox is upgraded, these apps are removed because the environment is moved to another node that is running the new version. However, the data of the app isn't removed, so you only have to republish and install the app to make it available.  
>
> Apps that are uploaded to the environments of both types (production and sandbox) using the **Upload Extension** action from the **Extension Management** page are published within a global scope. When the environment is upgraded or moved, these apps are downloaded to the service node and installed, which means that they don't disappear.

You can also safely use sandboxes for training, such as for following a learning path from [Microsoft Learn](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs), because it's a safe environment to experiment with. If anything goes wrong, you just delete the sandbox and start over.

Sandbox environments can be created on or updated to preview versions during preview periods to preview and test upcoming functionality ahead of its official availability. For more information, see [Preview environments](/dynamics365/business-central/dev-itpro/administration/preview-environments).

> [!IMPORTANT]
> Environment databases belonging to sandbox environments can't be exported. If you want to export data from a sandbox environment, you can use Excel or RapidStart or copy the environment to a production environment first.

You can create a sandbox environment that includes data from your production environment for debugging purposes, for example. But if you want to run performance tests, or similar benchmarking, the sandbox isn't reliable enough for that purpose. The reason is that sandboxes run in a different performance tier on Azure than production environments. Instead, create a dedicated environment based on the Production environment type to get the same experience and performance that users experience in the actual production environment. For more information, see [Performance in Business Central online](../../performance/performance-online.md)

Sandbox environments are handy for certain types of development scenarios because the debugging endpoint is open by default. This means that you can attach Visual Studio Code to a running system and debug through running code. It also allows you to publish directly to the environment from Code.  

[!INCLUDE[allowhttpclientnote](../../includes/include-http-allowhttpclient-note.md)]

If your organization has more than one sandbox environment, you can switch between environments by opening the App Launcher, choosing the Dynamics 365 tile, then choose the Business Central Sandbox tile. The sandbox environment picker shows the available sandboxes, so choose the one that you want to switch to.
