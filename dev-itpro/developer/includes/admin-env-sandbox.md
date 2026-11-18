---
author: jswymer
ms.topic: include
ms.date: 11/18/2026
ms.author: jswymer
ms.reviewer: jswymer
---
Sandbox environments are meant to be precisely that: Environments that you can play around with, use as a testbed for development, and delete at will. You can deploy apps straight from Visual Studio Code to a sandbox environment, and you can attach a debugging session to a sandbox.  

You can also safely use sandboxes for training, such as for following a learning path from [Microsoft Learn](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs), because it's a safe environment to experiment with. If anything goes wrong, you just delete the sandbox and start over.

Sandbox environments can be created on or updated to preview versions during preview periods to preview and test upcoming functionality ahead of its official availability. For more information, see [Preview environments](/dynamics365/business-central/dev-itpro/administration/preview-environments).

Sandbox environments are handy for certain types of development scenarios because the debugging endpoint is open by default. This means that you can attach Visual Studio Code to a running system and debug through running code. It also allows you to publish directly to the environment from Code.

[!INCLUDE[allowhttpclientnote](../../includes/include-http-allowhttpclient-note.md)]

#### Sandbox environment resource configuration

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

Environment databases for sandbox environments are provisioned with different configurations than those for typical production environments. For some scenarios typically executed on sandbox environments, such as using the [Performance Toolkit Extension](../devenv-performance-toolkit.md) or testing Cloud Migration data upgrades, administrators may need a production-like configuration for their sandbox environment.

Administrators can temporarily match the database configuration of their sandbox environment to that of a typical production environment:

1. Navigate to the [!INCLUDE[prodadmincenter](prodadmincenter.md)] and select the sandbox environment.
1. Select **Match production configuration** in the action ribbon.
1. Select **Save** in the pane that opened. The sandbox environment's database configuration is matched to that of a typical production environment immediately.
1. The sandbox environment's database configuration remains matched to that of a typical production environment for 72 hours, and automatically moves back to its prior configuration during the environment's first update window after the 72 hour period ends.

> [!IMPORTANT]
> Changing the environment's configuration restarts the environment; ensure no users are active when you start this operation to avoid interrupting their work.

This operation is limited to three 72-hour configuration matches per tenant per calendar month; this allocation renews automatically once a new calendar month starts. It's not possible to match the environment for a period shorter or longer than 72 hours, and it's not possible to run this more than thrice per calendar month.
