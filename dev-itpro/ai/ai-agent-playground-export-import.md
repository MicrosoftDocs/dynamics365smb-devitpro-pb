---
title: Export and Import an Agent Configuration
description: Learn how to export and import agent configurations in the agent playground to streamline your development process.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Export or import an agent configuration

As part of iterating to improve your agent, you can export and import the agent's configuration from the Agent playground to your local machine. The exported configuration includes:

- **Identity**: The name and display name of an agent
- **Instructions**: The detailed guidelines that define how the agent should behave.
- **Permissions**: The access rights the agent requires to function correctly.
- **Profile**: The name of the profile that should be used. The profile itself should be exported separately.

To export the configuration, do the following:

1. On the **Agents (preview)** page, choose the agent that you want to export.
2. Choose **Export agent**.
3. The exported agent appears in your **Downloads** window in .xml format. 

To import the configuration, do the following:

<!-- check with newest UI before publishing -->

1. On the **Agents (preview)** page, choose the agent that you want to import.
2. Choose **Import agent**.
3. Select if the agent should be a new agent or replace an existing agent - if the name already exists.
4. Continue to import the agent
5. Activate it

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  