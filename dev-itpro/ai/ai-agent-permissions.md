---
title: Agent permissions (preview)
description: Learn about permissions and access control for AI agents in Dynamics 365 Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/23/2026
ms.update-cycle: 180-days
---

# Agent permissions (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

Two kinds of permission controls govern agents in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. 

- The **access controls** - Since agents are modeled as users in the system, they're assigned permissions via permission sets to govern what data, pages, and objects they can access. These are called the **access controls** of the agent.
- The **agent access controls** - This refers to the system that controls which **human users** have the ability to **edit** the configuration of an agent.

## Access Controls - Effective permissions of an agent

When a user schedules a task for an agent, the task is executed with permissions from the intersection of the user's permissions and the agent's permissions. This design ensures **agents never exceed the privileges of the user who scheduled the task**.

> [!NOTE]
> If the agent makes a user intervention request, the task continues proceeding with the *permissions of the user that responded to that intervention request*. This user might be different from the task creator.

### Example

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

## Per-company access controls

It is possible to assign permissions to an agent for just specific companies. This has the following effects:

**Agent visibility**: If an agent does not have any permissions on a specific company, it will not appear on the role center when logged in to that company.
**Ability to configure permissions**: When an agent has permissions across multiple companies, a user can only configure permissions for the companies where they also have access. The user won't be able to modify permission assignments for companies they can't access themselves.
**Per-company permissions**: When a task executes for a specific company, the intersection will only consider permissions defined for that company or all companies.

### Configuring access controls via code

The following example shows how to assign permission sets to an agent. The `UpdateAccessControl` method replaces any existing permission sets with the ones you provide:

```al
procedure AssignPermissionsToAgent(AgentUserSecurityID: Guid)
var
    Agent: Codeunit Agent;
    TempAccessControlBuffer: Record "Access Control Buffer" temporary;
begin
    // Add the permission sets to assign
    TempAccessControlBuffer."Role ID" := 'D365 BASIC';
    TempAccessControlBuffer.Insert();

    TempAccessControlBuffer."Role ID" := 'D365 READ';
    TempAccessControlBuffer.Insert();

    // Assign the permission sets to the agent
    Agent.UpdateAccessControl(AgentUserSecurityID, TempAccessControlBuffer);
end;
```

## Agent Access Controls - Who can see and edit the agent

An agent access control record defines which users have access to configure an agent. The `Agent Access Control` record contains the following fields:

| Agent User Security ID | User Security ID | Can Configure Agent | Company Name |
|------------------------|------------------|---------------------|--------------|
| The security ID of the agent user whose access is being controlled. | The security ID of the user who is granted access to the agent. | Indicates whether the user has permission to configure and modify the agent settings. | Name of the company where the access control entry applies. |

This allows users to be assigned as administrators of specific agent instances, without giving them access to configure all agents. Access can be revoked at any time by setting the `Can Configure Agent` field, either via the `Agent` card page or through code.

## Agent administration permission sets

To assign a user as an administrator of all agents, they can be assigned the `AGENT - ADMIN` permission set. This permission set comes with the following privileges:

**Configure all agents**: All agents will be configurable by the user.
**Create agents**: New agents can be created by the user
**Configure profiles**: Profiles for both users and agents can be configured

### Related permission sets

The `AGENT - ADMIN` permission set is included in the `SECURITY` permission set. Users with the `SUPER` permission set also gain the same privileges.

### Configuring agent permissions across companies

When a user is assigned the `AGENT - ADMIN` permission set for a specific company or set of companies, this gives them the right to configure the permissions of the agents which are defined on that exact set of companies only.

#### Example

Consider an environment with three companies: **Cronus US**, **Cronus EU**, and **Cronus Asia**. An agent named "Sales Agent" is configured with the `D365 SALES` permission set for **Cronus US** and **Cronus EU**.

| Scenario | User's AGENT - ADMIN assigned for | Can user configure `D365 Sales` on agent |
|----------|-----------------------------------|--------------------------------|
| Exact match | Cronus US, Cronus EU | Yes |
| Superset | Cronus US, Cronus EU, Cronus Asia | Yes |
| Missing company | Cronus US only | No |
| No overlap | Cronus Asia only | No |

The user can only configure an agent's permissions for a specific company if they have `AGENT - ADMIN` assigned for that company.

## Related information

- [Agent SDK](ai-agent-sdk.md)
- [Design agents with the Custom Agent designer](ai-agent-designer.md)
- [Custom Agent designer AL API](ai-agent-designer-tasks-api.md)
