---
title: Export and Import an agent configuration
description: Learn how to export and import agent configurations in the agent designer to streamline your development process.
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

# Export or import an agent configuration

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

As part of iterating to improve your agent, you can export and import the agent's configuration to your local machine. The purpose of this feature is to allow you to back up your agent configuration, share it with others, or move it between different sandbox environments. The exported configuration includes:

- **Identity** - the name and display name of an agent
- **Instructions** - the detailed guidelines that define how the agent should behave.
- **Permissions** - the access rights the agent requires to function correctly.
- **Profile** - the name of the profile that should be used. The profile itself should be exported separately.

To export the configuration, do the following:

1. On the **Agents (preview)** page, choose the agent that you want to export.
2. Under **Actions** > **Other**, choose **Export agent definition**.
3. The exported agent appears in your **Downloads** window in .xml format. 

To import the configuration, do the following:

1. On the **Agents (preview)** page, choose the agent that you want to import.
1. Under **Actions** > **Other**, choose **Import agent definition**, which opens the **Import agents** dialog.
1. Choose the **Select XML File** button to browse to the .xml file that you want to import.
1. Review the imported agent details and choose whether to add or replace the existing agent configuration if the agent already exists. Then choose **Import**.
1. Activate the imported agent and choose **Done**.

## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-agent-designer.md)   
[Create and activate (preview)](ai-agent-designer-create.md)  
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-designer-attachments.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Best practices for designing an agent (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central agent designer (preview)](transparency-note-agent-designer.md)  