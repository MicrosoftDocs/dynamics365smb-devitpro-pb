---
title: Integrate with the Tasks AL API (preview)
description: Learn how to integrate custom agents with common scenarios using the Tasks AL API in Dynamics 365 Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
---

# Integrate with the Tasks AL API

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

The Tasks AL API allows you to work with custom agents programmatically from AL code. This article covers how to retrieve agent information and write AL code specific to agent sessions.

For information about creating and managing agent tasks, including triggering tasks from page actions, business events, adding attachments, and managing task lifecycle, see [Agent SDK (preview)](ai-agent-sdk-overview.md).

## Get information about the available custom agents

The first step to configure agents is to retrieve their user ID. The Agent designer provides an API to retrieve all available agents.

```al
local procedure GetAllAgents()
var
    CustomAgent: Codeunit "Custom Agent";
    TempAgentInfo: Record "Custom Agent Info" temporary;
begin 
    // Retrieve all custom agents
    CustomAgent.GetCustomAgents(TempAgentInfo);
    
    // Iterate through the agents
    if TempAgentInfo.FindSet() then
        repeat
            // Use the agent information
            // TempAgentInfo."User Security ID" contains the agent's user ID
            // TempAgentInfo."User Name" contains the agent's user name
            Message('Agent: %1 (ID: %2)', TempAgentInfo."User Name", TempAgentInfo."User Security ID");
        until TempAgentInfo.Next() = 0;
end;
```

## Detect custom agent sessions

To write AL code that runs only when a custom agent is executing, use the `Agent Session` codeunit with the `Custom Agent` metadata provider:

```al
local procedure DoCustomAgentWork()
var
    AgentSession: Codeunit "Agent Session";
    AgentMetadataProvider: Enum "Agent Metadata Provider";
begin
    if not AgentSession.IsAgentSession(AgentMetadataProvider::"Custom Agent") then
        exit;

    // Custom agent-specific code goes here...
    Message('Running in a Custom Agent session!');
end;
```

For more information about writing AL code specific to agent sessions, including event subscription patterns and task-specific code, see [Agent SDK (preview)](ai-agent-sdk-overview.md).

## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[Agent designer (preview)](ai-agent-designer.md)  
[Agent SDK (preview)](ai-agent-sdk-overview.md)  
[Create and activate (preview)](ai-agent-designer-create.md)  
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Agent designer frequently asked questions (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central Agent designer (preview)](transparency-note-agent-designer.md)  