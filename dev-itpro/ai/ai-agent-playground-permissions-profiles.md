---
title: Set up playground agent permissions and profiles (preview)
description: Discover how to configure playground agent permissions and profiles to control access and customize the user interface for sandbox environments.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection: bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Set up playground agent permissions and profiles (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The Agent playground is a prototyping environment that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] by building playground agents. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data. Learn more about the Agent playground in [Agent playground overview (preview)](ai-agent-playground.md).

## Permissions

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege—grant only the permissions necessary for the agent's intended functionality. 

> [!NOTE]
> Permission sets can only be modified when the agent is deactivated.

### How to determine required permissions
You can refer to the documentation about how to
[create or modify permissions for a specific workflow via recording permissions](/dynamics365/business-central/ui-define-granular-permissions#create-or-modify-permissions-by-recording-your-actions).

Alternatively, you can assign existing permission sets to the agent, treating it like a user performing the intended tasks. In this approach, applying the principle of least privilege becomes especially critical to minimize the risk of the agent accessing functionality beyond its intended scope.

### Effective permissions

When a user schedules a task for an agent, the task is executed with permissions from the intersection of the user's permissions and the agent's permissions. This design ensures **agents never exceed the privileges of the user who scheduled the task**.

#### Example

| Permission | User | Agent | Effective Permissions |
|------------|------|-------|----------------------|
| Read Customers | Yes | Yes | Yes |
| Modify Customers | Yes | Yes | Yes |
| Delete Customers | Yes | No | No |
| Post Sales Orders | Yes | No | No |
| Read Items | No | Yes | No |

This means that in this example:

- The agent can read and modify customers (both user and agent have these permissions)
- The agent can't delete customers or post sales orders (agent lacks these permissions, even though the user has them)
- The agent can't read items (user lacks this permission, even though the agent has it)

## Profiles

The agent is assigned to a profile (role) that determines which UI elements it can see and interact with. The profile also defines the role center, which is the agent's starting point when it executes a task.

You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete. Learn more in [Designing profiles](../developer/devenv-design-profiles.md) and [Page customization object](../developer/devenv-page-customization-object.md).

> [!NOTE]
> The profile of the agent is set as default to the **Playground Agent (Copilot)** type. This can be changed, but changing the type changes what the agent has access to.

### The agent and the UI

A playground agent can interact with the UI it sees. For example, it can't access page search. The agent is assigned to a profile just like any other user and this is the key to controlling its access. For the **Profile (Role)**, to ensure that you don't expose too much of the UI, it's recommended to build a custom profile for the agent in the same way as you would build a custom profile for a user.

On the page customization object, you can set specific flags to control what the agent can see and do on that page. The following flags are available:

| Property | Data type | Description |
|----------|-----------|-------------|
| `ClearActions` | Boolean | If set to true, all actions on the page are removed for the agent.|
| `ClearLayout`  | Boolean | If set to true, the layout of the page is simplified for the agent. |
| `ClearViews`   | Boolean | If set to true, all views on the page are removed for the agent. |
| `DeleteAllowed`| Boolean | If set to false, the delete action isn't allowed for the agent. |
| `InsertAllowed`| Boolean | If set to false, the insert action isn't allowed for the agent. |

```al
page customization example with these...
```

Once you have built and published a profile, you can assign it to the agent in the **Profile** field on the **Agent Card**.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Transparency Note: Agent playground (preview)](transparency-note-ai-agent-playground.md)  
[Create and activate a playground agent (preview)](ai-agent-playground-create.md)  
[Configure instructions and tasks for a playground agent (preview)](ai-agent-playground-configure.md)  
[Best practices for prototyping with the Agent playground (preview)](ai-agent-playground-best-practices.md)  
[Designing profiles](../developer/devenv-design-profiles.md)  
[Page customization object](../developer/devenv-page-customization-object.md)  