---
title: Set up AI Playground Agent permissions and profiles (preview)
description: Discover how to configure AI Playground Agent permissions and profiles to control access and customize the user interface for sandbox environments.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection: bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Set up AI playground agent permissions and profiles (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The AI playground agent is a prototyping tool that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data. Learn more about the AI playground agent in [AI playground agent overview (preview)](ai-playground-agent.md).

## Permissions

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege—grant only the permissions necessary for the agent's intended functionality. 

> [!NOTE]
> Permission sets can only be modified when the agent is deactivated.

## Profiles

The agent is assigned to a profile (role) that determines which UI elements it can see and interact with. You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete. Learn more in [Designing profiles](../developer/devenv-design-profiles.md) and [Page customization object](../developer/devenv-page-customization-object.md).

> [!NOTE]
> The profile of the agent is set as default to the **Playground Agent (Copilot)** type. This can be changed, but changing the type changes what the agent has access to.

### The agent and the UI

The AI playground agent can interact with the UI it sees. For example, it can't access page search. The agent is assigned to a profile just like any other user and this is the key to controlling its access. For the **Profile (Role)**, to ensure that you don't expose too much of the UI, it's recommended to build a custom profile for the agent in the same way as you would build a custom profile for a user.

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
[Transparency Note: AI playground agent (preview)](transparency-note-ai-playground-agent.md)  
[Create and activate an AI playground agent (preview)](ai-playground-agent-create.md)  
[Configure instructions and tasks for an AI playground agent (preview)](ai-playground-agent-configure.md)  
[Best practices for prototyping with AI playground agent (preview)](ai-playground-agent-best-practices.md)  
[Designing profiles](../developer/devenv-design-profiles.md)  
[Page customization object](../developer/devenv-page-customization-object.md)  