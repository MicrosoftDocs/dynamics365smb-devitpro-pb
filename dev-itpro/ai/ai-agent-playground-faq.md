---
title: Agent playground frequently asked questions (preview)
description: Get answers to common questions about the agent playground in Business Central, including integration, SDK access, scheduling, instructions, and capabilities.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: faq
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/05/2026
ms.update-cycle: 180-days
---

# Agent playground frequently asked questions (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

This article answers common questions about using the Agent playground in [!INCLUDE [prod_short](../includes/prod_short.md)].

## Integration and connectivity

### Can I link a mailbox to a playground agent like the Sales Order Agent?

Yes, you can integrate email functionality with playground agents. Learn more in the BCTech repo sample [Agent and Email Integration Sample](https://github.com/microsoft/BCTech/pull/338/files).

This allows you to:

- Process incoming emails automatically
- Trigger agent tasks based on email content
- Extract information from email attachments
- Send automated responses

Learn more about triggering agents in [Run a playground agent (preview)](ai-agent-playground-run-agent.md).

## Development and SDK

### Where can I find the agent SDK code?

Access the agent SDK at: [BCApps/src/System Application/App/Agent](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Agent)

The SDK provides:

- Agent Task Builder API
- Agent Task Message Builder API
- Custom Agent management codeunits
- Sample implementations and patterns

Learn more about using the SDK in [Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md).

## Scheduling and automation

### How can I trigger an agent on a schedule (for example, daily)?

> [PENDING: Link to scheduled task sample in BCTech once available from Darrick]

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

Learn more about creating tasks programmatically in [Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md).

## Instructions and language

### Can I write agent instructions in languages other than English?

Yes, you can write agent instructions in your local language. The AI models support multiple languages, allowing you to:

- Write instructions in the language most natural for your team
- Use domain-specific terminology in your native language
- Provide multilingual support for international implementations

While other languages are supported, English instructions might yield the best results due to the training data used for the AI models.

> [!TIP]
> While instructions can be in any language, consider that many Business Central field names, page names, and technical terms are in English. Mixing languages for technical references while keeping business logic in your local language often works well.

Learn more in [Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md).

### Is there a size limit for agent instructions?

No, there's no hard limit on instruction size. However, we recommend keeping instructions focused and concise for best results.

**Recommendations:**

- **Optimal length**: 500-2000 words for most scenarios
- **Focus on essentials**: Include only relevant guidance and rules
- **Use structure**: Break instructions into clear sections (responsibilities, guidelines, steps)
- **Avoid repetition**: Don't repeat information that's already available in field tooltips or page descriptions

**Signs your instructions might be too long:**

- The agent frequently misses important steps
- Responses become inconsistent
- Processing time increases noticeably
- The agent struggles with context from earlier in the instructions

If your instructions exceed 3000-4000 words, consider:

- Splitting complex workflows into multiple specialized agents
- Moving static reference information to linked documentation
- Consolidating redundant or overlapping guidance

Learn more in [Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md).

## Choosing the right approach

### When should I use a playground agent vs. Copilot Studio agent vs. AL code?

<!-- [PENDING: Verify guidance with Peter] -->

Choose the approach that best fits your scenario and stage of development:

#### Use **playground agents** when:

- **Prototyping** new AI-powered features before committing to development
- **Testing** AI feasibility for specific business scenarios
- **Learning** how AI can interact with Business Central data
- **Demonstrating** AI capabilities to stakeholders
- **Rapid iteration** is needed to refine requirements
- You're in a **sandbox environment** and want quick results

**Limitations:** Playground agents are for prototyping only and shouldn't be used in production environments.

#### Use **Copilot Studio agents** when:

- Building **production-ready** conversational experiences
- Need **cross-platform** integration (Teams, websites, Power Platform)
- Require **advanced dialog management** and conversation flows
- Want **low-code** development with visual designers
- Need **enterprise-grade** security and compliance features
- Building **customer-facing** or **employee-facing** chat experiences

**Example scenarios:** Customer service chatbots, HR support agents, IT helpdesk automation

#### Use **AL code** when:

- Building **custom Business Central extensions** with AI features
- Need **full control** over the implementation and logic
- Require **tight integration** with Business Central objects and events
- Must meet **specific performance** or **security** requirements
- Building **commercial solutions** for AppSource
- Need **version control** and **ALM** (Application Lifecycle Management)

**Example scenarios:** Custom Copilot features, AI-powered document processing, intelligent automation in extensions

## UI interaction and guidance

### How can I provide information to agents about actions and fields in the UI?

<!--  [PENDING: Verify with Sotiris whether tooltip or AboutText property is used] 

Agents learn about UI elements through:

- **ToolTip property** - [VERIFY: Confirm this is the property agents read]
- **AboutText property** - [VERIFY: Confirm if this property is also used]
- **Agent instructions** - You can explicitly describe actions and fields
- **Field and action names** - Clear naming helps agents understand purpose

**Best practices:**

1. **Use descriptive tooltips/about text** - Ensure your fields and actions have clear descriptions that explain their purpose
2. **Reference UI elements in instructions** - When necessary, explicitly mention page names, field names, or action names in your agent instructions
3. **Test agent understanding** - Monitor agent reasoning to see if it correctly interprets UI elements
4. **Customize profiles** - Control which UI elements the agent can see through profile configuration

**Example instruction guidance:**

```text
To approve a sales order:
1. Navigate to the Sales Orders page
2. Select the order to approve
3. Choose the "Approve" action under the Process menu
4. Verify the "Approval Status" field changes to "Approved"
```
-->

## Agent capabilities

### Does the agent support filtering on pages?

<!-- [PENDING: Need to document available tools/capabilities more comprehensively, not just keywords] -->

Yes, agents can filter data on pages. Filtering is one of the core capabilities that agents use to navigate and find specific records.

**Supported filtering operations:**

- Filter by specific field values
- Apply multiple filter criteria
- Use comparison operators (equals, greater than, less than)
- Filter by date ranges
- [VERIFY: Add complete list of supported filtering capabilities]

**Available agent capabilities:** [VERIFY: Document the full set of tools and capabilities beyond keywords]

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

Learn more about available keywords in [Instruction keywords for playground agents (preview)](ai-agent-playground-instruction-keywords.md).

## Related information

[Agent playground overview (preview)](ai-agent-playground.md)  
[Create and activate a playground agent (preview)](ai-agent-playground-create.md)  
[Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-playground-attachments.md)  
[Set up playground agent permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Best practices for prototyping with the Agent playground (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)
