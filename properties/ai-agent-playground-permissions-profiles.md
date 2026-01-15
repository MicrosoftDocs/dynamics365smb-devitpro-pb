---
title: Set up agent permissions and profiles (preview)
description: Discover how to configure agent permissions and profiles to control access and customize the user interface for sandbox environments.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection: bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
---

# Set up agent permissions and profiles (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The Agent playground is a prototyping environment that allows subject matter experts, product owners, consultants, and developers to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] by building agents. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data. Learn more in [Agent playground overview (preview)](ai-agent-playground.md).

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

> [!NOTE]
> If the agent makes a user intervention request, the task continues proceeding with the *permissions of the user that responded to that intervention request*. This user might be different from the task creator.

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

### The agent and the UI

A playground agent can interact with the UI it sees. It can access search on any list page, but not **Tell me**. The agent is assigned to a profile just like any other user and this is the key to controlling its access. For the **Profile (Role)**, to ensure that you don't expose too much of the UI, it's recommended to build a custom profile for the agent in the same way as you would build a custom profile for a user. The intent is to define an inclusion list or positive list of UI elements exposed to the agent.

On the page customization object, you can set specific flags to control what the agent can see and do on that page. The following flags are available:

| Property | Data type | If set to... |
|----------|-----------|-------------|
| `ClearActions` | Boolean | `true`, all actions on the page are removed for the agent.|
| `ClearLayout`  | Boolean | `true`, the layout of the page is simplified for the agent. |
| `ClearViews`   | Boolean | `true`, all views on the page are removed for the agent. |
| `DeleteAllowed`| Boolean | `false`, the delete action isn't allowed for the agent. |
| `InsertAllowed`| Boolean | `false`, the insert action isn't allowed for the agent. |

#### Example of a page customization for an agent profile

With the following page customization, the agent assigned to this profile won't see any actions or views on the Customer Card page, will have a simplified layout, and won't be able to insert or delete customers.

```al
pagecustomization 50100 CustomerAgentProfileCustomization
{
    PageType = Card;
    PageID = Customer;
    ClearActions = true; // No actions available
    ClearLayout = true;  // Simplified layout
    ClearViews = true;    // No views available
    DeleteAllowed = false; // Delete not allowed
    InsertAllowed = false; // Insert not allowed

    layout
    {
       modify(Name) { Visible = true; }
       // Other changes
    }
    ...
}
```

Once you have built and published a profile, you can assign it to the agent in the **Profile** field on the **Agent Card** or from the **Configure agent** wizard.

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-playground-attachments.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Agent playground frequently asked questions (preview)](ai-agent-playground-faq.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-playground-sales-validation.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  