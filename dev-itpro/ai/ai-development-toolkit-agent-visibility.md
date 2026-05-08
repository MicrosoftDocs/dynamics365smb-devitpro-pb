---
title: Understand agent visibility (preview)
description: Learn about the factors that control agent visibility in Dynamics 365 Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: how-to
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 05/03/2026
ms.update-cycle: 180-days
---

# Understand agent visibility (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

There are multiple factors that control whether an agent's avatar appears in the role center. There are two types of agent avatars:

- **Activated agents** – Agents that have already been created and activated by a user. These appear as active avatars with which users can interact, create tasks, and manage. Those agents can either be in Active or Inactive state.
- **Not-yet-activated agents** – Agents that come from installed extensions but haven't been created and activated yet. These appear as placeholder avatars that allow users to set up and activate a new instance of the agent.

The visibility rules differ for each type. The sections below describe the common requirements that apply to both types, followed by the specific requirements for each.

## Common requirements

The following conditions apply to both activated and not-yet-activated agent avatars.

### Application must be installed

Agents come from AL applications. If the application, which contains an agent is uninstalled, the agent no longer appears on the role center and all existing instances become inactive. It's only possible to reactivate the agent when the application is reinstalled or upgraded.

### Copilot capability

All agents are tied to a Copilot capability that controls if they're enabled. You can find these in the `Copilot & agent capabilities` page. The agent's capability must be active for agents to appear on the role center.

## Activated agents

### Agent permissions

For an agent to be visible in the role center when logged in to a specific company, at least one permission set, which applies for the current company must be assigned to it.

### User permissions

For an already activated agent to be visible for a user, at least one of the following conditions must apply in addition to the [common requirements](#common-requirements):

- The user is an [agent administrator](ai-development-toolkit-permissions.md#agent-administrators). These are suggested only for users who are meant to administrate all agents on one company or across all companies.
- The user exists in the agent user access controls of the agent. They don't need to have the right to configure the agent to see its avatar and tasks.

If the user should be able to configure agents, they also require **permission to access the setup page**.

## Not-yet-activated agents (creating new instances)

For a user to see not-yet-activated agent avatars and create new agent instances via the role center, the conditions depend on whether the agent comes from an extension or from the Agent Design Experience.

### Extension agents

#### For agent administrators

For [agent administrators](ai-development-toolkit-permissions.md#agent-administrators) to create instances of agents defined in AL extensions, the following conditions must all apply:

1. The user has permissions for the agent's setup page and the agent setup table. If enabling the agent is considered to have security implications, it's recommended to associate a specific permission set to its setup page and setup table instead of relying on inherent permissions.
1. The agent type allows instance creation, meaning the `IAgentFactory.ShowCanCreateAgent` method returns `true`. Learn more in [Control agent instance creation](ai-agent-sdk-define-register.md#control-agent-instance-creation).

#### For non-agent administrators

> [!NOTE]
> The extension agent creation capabilities described in this section are available starting with version 28.1 and later.

For non-admin users to create instances of agents defined in AL extensions, the following conditions must all apply:

1. The user has the "Create Extension Agent" system permission, which is included in the "D365 Agent" permission set (part of "D365 BASIC"). Most users have this permission by default.
1. The user has permissions for the agent's setup page and the agent setup table. If enabling the agent is considered to have security implications, it's recommended to associate a specific permission set to its setup page and setup table instead of relying on inherent permissions.
1. The agent type allows instance creation, meaning the `IAgentFactory.ShowCanCreateAgent` method returns `true`. Learn more in [Control agent instance creation](ai-agent-sdk-define-register.md#control-agent-instance-creation).
1. A rule in the **Agent Configuration Rights** page allows the user to create an instance of the agent. By default, a rule is specified to allow all users can create all types of agents in all companies. However, users with "AGENT - ADMIN" permission set can restrict this by modifying the rules, for example, limiting which users can create specific agent types in specific companies.

#### Discoverability after activation

When a non-admin user activates an extension agent, only that user and [agent administrators](ai-development-toolkit-permissions.md#agent-administrators) can see the newly activated agent. Other users don't automatically get access. To make the agent visible to additional users, the activating user or an agent administrator should add the relevant users to the agent's access controls. Consider automating this step in your agent's setup page logic to ensure that all intended users can discover and interact with the agent after activation.

### Agent Design Experience agents

For agents created through the Agent Design Experience, the following conditions must all apply:

- The user has access to see the agent, as described in previous sections.
- The user has the "Configure All Agents" permission, which is provided via the "AGENT - ADMIN" permission set.
- The agent type allows instance creation. Learn more in [Control agent instance creation](ai-agent-sdk-define-register.md#control-agent-instance-creation).

## Related information

[Configure agents programmatically  (preview)](ai-agent-sdk-configuration.md)  
[Coding agents in AL (preview)](ai-agent-sdk-overview.md)  
[Define and register an agent programmatically  (preview)](ai-agent-sdk-define-register.md)  
[Managing agent tasks programmatically  (preview)](ai-agent-sdk-tasks.md)  
