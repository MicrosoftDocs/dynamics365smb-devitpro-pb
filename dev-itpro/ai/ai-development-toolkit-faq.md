---
title: Frequently asked questions (preview)
description: Get answers to common questions about designing agents in Business Central, including integration, AI development toolkit access, scheduling, instructions, and capabilities.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: faq
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
---

# Frequently asked questions (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

This article answers common questions about using the agent design experience in [!INCLUDE [prod_short](../includes/prod_short.md)].

## Integration and connectivity

### Can I link a mailbox to an agent like the Sales Order Agent?

Yes. While there is no built-in configuration of email integration in the agent design experience, you can integrate email functionality with agents using the AI development toolkit. Learn more in the BCTech repo sample [Agent and Email Integration Sample](https://github.com/microsoft/BCTech/pull/338/files).

This allows you to:

- Process incoming emails automatically
- Trigger agent tasks based on email content
- Extract information from email attachments
- Send automated responses

Learn more about triggering agents in [Run an agent (preview)](ai-development-toolkit-run-agent.md).

## Development

### Where can I find the AI development toolkit code?

Access the AI development toolkit at: [BCApps/src/System Application/App/Agent](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Agent)

The toolkit provides:

- Agent Task Builder API
- Agent Task Message Builder API
- Custom Agent management codeunits
- Sample implementations and patterns

Learn more in [Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md).

## Scheduling and automation

### How can I trigger an agent on a schedule (for example, daily)?

<!-- Link to scheduled task sample in BCTech once available -->

You can schedule agent tasks using job queues in [!INCLUDE [prod_short](../includes/prod_short.md)]:

1. Create a codeunit that uses the Agent Task Builder API to create tasks
2. Set up a job queue entry to run the codeunit on your desired schedule
3. Configure the job queue to run daily, hourly, or at custom intervals

Example pattern:

```al
codeunit 50100 "Daily Agent Task Scheduler"
{
    procedure CreateDailyTask()
    var
        AgentTaskBuilder: Codeunit "Agent Task Builder";
        AgentTask: Record "Agent Task";
    begin
        AgentTask := AgentTaskBuilder
            .Initialize(AgentUserSecurityId, 'Daily Review Task')
            .SetExternalId('DAILY-' + Format(Today))
            .AddTaskMessage('System', 'Perform daily review of pending items')
            .Create();
    end;
}
```

Learn more about creating tasks programmatically in [Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md).

## Instructions and language

### Can I write agent instructions in languages other than English?

> [!NOTE]
> While instructions can be in any language, consider that many [!INCLUDE [prod_short](../developer/includes/prod_short.md)] field names, page names, and technical terms are in English. Mixing languages for technical references while keeping business logic in your local language often works well.
>
> While other languages are supported, English instructions might yield the best results due to the training data used for the AI models.

You can write agent instructions in your local language, but bear the language considerations in mind. The AI models support multiple languages, allowing you to:

- Write instructions in the language most natural for your team
- Use domain-specific terminology in your native language
- Provide multilingual support for international implementations

Learn more in [Write effective instructions for an agent (preview)](ai-development-toolkit-instructions.md).

### Is there a size limit for agent instructions?

No, there's no hard limit on instruction size. However, we recommend keeping instructions focused and concise for best results.

#### Recommendations for effective instructions

- **Optimal length**  
  500-2000 words for most scenarios
- **Focus on essentials**  
  Include only relevant guidance and rules
- **Use structure**  
  Break instructions into clear sections (responsibilities, guidelines, steps)
- **Avoid repetition**  
  Don't repeat information that's already available in field tooltips or page descriptions

#### Signs your instructions might be too long

- The agent frequently misses important steps
- Responses become inconsistent
- Processing time increases noticeably
- The agent struggles with context from earlier in the instructions

If your instructions exceed 3000-4000 words, consider:

- Splitting complex workflows into multiple specialized agents
- Moving static reference information to linked documentation
- Consolidating redundant or overlapping guidance

Learn more in [Write effective instructions for an agent (preview)](ai-development-toolkit-instructions.md).

## Choosing the right approach

### When should I use which tools?

Choose the approach that best fits your scenario and stage of development:

#### **Design agents** when

- **Prototyping** new AI-powered features before committing to development
- **Testing** AI feasibility for specific business scenarios
- **Learning** how AI can interact with Business Central data
- **Demonstrating** AI capabilities to stakeholders
- **Rapid iteration** is needed to refine requirements
- You're in a **sandbox environment** and want quick results

**Limitations:**  
These agents are for prototyping in sandbox environments. To deliver these agents to customers in production environments, use the AI development toolkit to productize adding integrations, setup etc. and ship in extensions.

#### Use **Copilot Studio agents** when:

- Building **production-ready** conversational experiences
- Need integration with other products via the many supported Copilot Studio connectors
- Require **advanced dialog management** and conversation flows
- Want **low-code** development with visual designers
- Building **customer-facing** or **employee-facing** chat experiences

**Example scenarios:**  
Customer service chatbots, HR support agents, IT helpdesk automation.

#### Use **AL code** when:

- Building **custom Business Central extensions** with AI features
- Need **full control** over the implementation and logic
- Require **tight integration** with Business Central objects and events
- Must meet **specific performance** or **security** requirements
- Building **commercial solutions** for AppSource
- Need **version control** and **ALM** (Application Lifecycle Management)

**Example scenarios:**  
Custom Copilot features, AI-powered document processing, and intelligent automation in extensions.

## Agent capabilities

### Does the agent support filtering on pages?

Yes, agents can filter data on pages. Filtering is one of the core capabilities that agents use to navigate and find specific records.

**Supported filtering operations:**

- Filter by specific field values
- Apply multiple filter criteria
- Use comparison operators (equals, greater than, less than)
- Filter by date ranges

**Available agent capabilities:**

The agent's ability to use filtering depends on:

- The profile assigned to the agent (which controls visible pages and fields)
- The permissions granted to the agent
- Instructions that guide when and how to filter

**Example instruction:**

```text
To find overdue invoices:
1. Open the Sales Invoices page
2. Filter the "Due Date" field to show dates before today
3. Review the filtered list and prioritize by amount
```

Learn more about available keywords in [Instruction keywords for an agent (preview)](ai-development-toolkit-instruction-keywords.md).

## Related information

[AI development toolkit overview (preview)](ai-development-toolkit-overview.md)  
[Create and activate an agent (preview)](ai-development-toolkit-agent-create.md)  
[Write effective instructions for an agent (preview)](ai-development-toolkit-instructions.md)  
[Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-development-toolkit-attachments.md)  
[Set up permissions and profiles (preview)](ai-development-toolkit-permissions-profiles.md)  
[Run an agent (preview)](ai-development-toolkit-run-agent.md)  
[Best practices for designing an agent (preview)](ai-development-toolkit-best-practices.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)