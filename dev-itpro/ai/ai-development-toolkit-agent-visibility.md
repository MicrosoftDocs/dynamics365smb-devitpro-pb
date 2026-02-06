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
ms.date: 01/21/2026
ms.update-cycle: 180-days
---

# Understand agent visibility (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

There are multiple factors that control if an agent's avatar can be seen in the role center and if new instances of an agent can be created through it.

## Application must be installed

Agents come from AL applications. If the application, which contains an agent is uninstalled, the agent no longer appears on the role center and all existing instances become inactive. It's only possible to reactivate the agent when the application is reinstalled or upgraded.

## Copilot capability

All agents are tied to a Copilot capability that controls if they're enabled. You can find these in the `Copilot & agent capabilities` page. The agent's capability must be active for agents to appear on the role center.

## Permissions

### Agent permissions

For an agent to be visible in the role center when logged in to a specific company, at least one permission set, which applies for the current company must be assigned to it.

### User permissions

At least one of the conditions below must apply for an agent to be visible for a user:

- The user has the "AGENT - ADMIN" permission set. These are suggested only for users who are meant to administrate all agents on one company or across all companies.
- The user exists in the agent user access controls of the agent. They don't need to have the right to configure the agent to see its avatar and tasks.

If the user should be able to configure agents, they also require **permission to access the setup page**.

## Creating new agents icon

For a user to be allowed to create agents via the role center, three conditions must apply:

- The user has access to see the agent, as described in previous sections.
- The user has the "MANAGE ALL AGENTS" permission, which is provided via "AGENT - ADMIN" permission set.
- The agent type allows instance creation. Learn more in [Control agent instance creation](ai-agent-sdk-define-register.md#control-agent-instance-creation). 

## Related information

[Configure agents programmatically  (preview)](ai-agent-sdk-configuration.md)  
[Coding agents in AL (preview)](ai-agent-sdk-overview.md)  
[Define and register an agent programmatically  (preview)](ai-agent-sdk-define-register.md)  
[Managing agent tasks programmatically  (preview)](ai-agent-sdk-tasks.md)  
