---
title: Configure agents via the SDK (preview)
description: Learn how to configure agent instances and manage agent instructions in Dynamics 365 Business Central.
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

# Configure agents (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

This article explains how to configure agent instances and manage agent instructions. 

There can be one or multiple instances of an agent in [!INCLUDE [prod_short](../includes/prod_short.md)]. Each agent instance can have its own instructions, permissions, user settings, and agent access controls defined separately. Each agent instance is uniquely identified by its **User Security ID** which is passed as a parameter to all the methods of the SDK.

## Configuring an agent instance

The `Agent` codeunit provides methods to configure various aspects of an agent instance after creation. All configuration methods require the agent's User Security ID.

### Lifecycle management

- Activate or deactivate agent instances to control whether they can process tasks
- Check the current activation state of an agent

### Identity and display settings

- Get or set the agent's display name
- Retrieve the agent's user name
- Set the agent's instructions that guide how it completes tasks
- Assign a profile to control which Role Center and UI elements the agent uses

### Localization settings

- Update the agent's language, regional settings (locale), and time zone
- Retrieve current user settings including profile, language, and regional preferences

### Permissions and access control

- Assign permission sets to control what data and operations the agent can access
- Retrieve the current permission sets assigned to the agent
- Configure which users can manage the agent or assign tasks to it through agent access controls

Learn more in [Agent permissions](ai-agent-permissions.md).

```al
procedure ConfigureAgent(AgentUserSecurityID: Guid; AgentInstructions: SecretText)
var
    TempAccessControlBuffer: Record "Access Control Buffer" temporary;
    TempAgentAccessControl: Record "Agent Access Control" temporary;
    Agent: Codeunit Agent;
begin
    // Set agent instructions
    Agent.SetInstructions(AgentUserSecurityID, AgentInstructions);
    
    // Set display name
    Agent.SetDisplayName(AgentUserSecurityID, 'Updated Agent Name');
    
    // Assign a profile
    Agent.SetProfile(AgentUserSecurityID, 'ACCOUNTANT', SystemApplicationAppId);
    
    // Update localization settings (language, locale, timezone)
    Agent.UpdateLocalizationSettings(AgentUserSecurityID, 1033, 1033, 'UTC');
    
    // Update permission sets
    TempAccessControlBuffer."Role ID" := 'D365 BASIC';
    TempAccessControlBuffer.Scope := TempAccessControlBuffer.Scope::System;
    TempAccessControlBuffer.Insert();
    Agent.UpdateAccessControl(AgentUserSecurityID, TempAccessControlBuffer);
    
    // Update which users can interact with the agent
    Agent.UpdateAgentAccessControl(AgentUserSecurityID, TempAgentAccessControl);
    
    // Activate the agent
    Agent.Activate(AgentUserSecurityID);
end;
```

## Agent instructions

Agent instructions are defined on **each agent instance separately**. This allows for customizing instructions based on custom settings per agent and for dynamically updating them during the agent's lifetime.

### Setting agent instructions from resources

If an agent has instructions that won't change based on per-instance settings or other parameters, the easiest way to define them is in the resources of the agent's AL application. The instructions can then be set every time an agent instance is created by accessing the resource file.

First, add the instruction file to your `app.json` resources:

```json
{
    "resourceFolders": ["Resources"]
}
```

Then, load and apply the instructions when creating the agent:

```al
procedure AssignStaticInstructions(AgentUserSecurityID: Guid)
var
    Agent: Codeunit Agent;
    Instructions: SecretText;
    InstructionsLbl: Label 'Instructions.txt', Locked = true;
begin
    // Load instructions from resource file
    Instructions := NavApp.GetResourceAsText(InstructionsLbl);

    // Apply to the agent instance
    Agent.SetInstructions(AgentUserSecurityID, Instructions);
end;
```

> [!NOTE]
> Upgrade code is needed for older instances if instructions are only applied during creation.

## Creating agent instances programmatically

While the typical way to create agent instances is through a [setup page](ai-agent-sdk-setup-page.md), you can also create them programmatically using the `Agent` codeunit. This approach is intended for automation scenarios where agent instances need to be created as part of a business process, eg. a custom wizard.

```al
procedure CreateMyAgent(AgentInstructions: SecretText)
var
    TempAgentAccessControl: Record "Agent Access Control" temporary;
    Agent: Codeunit Agent;
    AgentUserSecurityID: Guid;
    UserName: Code[50];
begin
    UserName := 'MYAGENT';
    
    // Create an agent instance with the specified metadata provider
    AgentUserSecurityID := Agent.Create(
        Enum::"Agent Metadata Provider"::"My Agent",
        UserName,
        'My Agent Display Name',
        TempAgentAccessControl);
    
    // Set the agent's instructions
    Agent.SetInstructions(AgentUserSecurityID, AgentInstructions);
    
    // Activate the agent so it can start processing tasks
    Agent.Activate(AgentUserSecurityID);
end;
```

> [!IMPORTANT]
> You cannot create agent instances from install codeunits, upgrade codeunits, or background sessions. Agent creation requires an interactive user session.

## Cross-agent operations

For security reasons, it's only possible to use the agent SDK to interact with agents defined in your own application. Creating instances, tasks, messages and any configuration changes targeting an agent defined in a different application is blocked with an error.

The following example fails if `"Other Agent"` is defined in a different application:

```al
procedure ConfigureOtherAgent()
var
    Agent: Codeunit Agent;
    OtherAgentUserSecurityID: Guid;
begin
    // This will fail with an error if "Other Agent" is defined in a different app
    Agent.SetDisplayName(OtherAgentUserSecurityID, 'Updated Name');
end;
```

It's possible, however, to allow access to your agent for other apps by creating your own API for interacting with it. To do this, public procedures, which implement the functionality must be exposed.

```al
codeunit 50110 "My Agent API"
{
    Access = Public;

    /// <summary>
    /// Updates the display name of the My Agent instance.
    /// </summary>
    /// <param name="AgentUserSecurityID">The User Security ID of the agent instance.</param>
    /// <param name="NewDisplayName">The new display name to set.</param>
    procedure SetDisplayName(AgentUserSecurityID: Guid; NewDisplayName: Text[80])
    var
        Agent: Codeunit Agent;
    begin
        Agent.SetDisplayName(AgentUserSecurityID, NewDisplayName);
    end;

    /// <summary>
    /// Activates or deactivates the My Agent instance.
    /// </summary>
    /// <param name="AgentUserSecurityID">The User Security ID of the agent instance.</param>
    /// <param name="Activate">True to activate, false to deactivate.</param>
    procedure SetActiveState(AgentUserSecurityID: Guid; Activate: Boolean)
    var
        Agent: Codeunit Agent;
    begin
        if Activate then
            Agent.Activate(AgentUserSecurityID)
        else
            Agent.Deactivate(AgentUserSecurityID);
    end;
}
```

Other applications can then call these public procedures to interact with your agent without directly using the SDK.

## Related information

[Create agent setup pages (preview)](ai-agent-sdk-setup-page.md)  
[Coding agents in AL (preview)](ai-agent-sdk-overview.md)  
[Define and register an agent (preview)](ai-agent-sdk-define-register.md)  
[Managing agent tasks (preview)](ai-agent-sdk-tasks.md)  
[Agent permissions (preview)](ai-agent-permissions.md)  
[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-agent-designer.md)   
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)
