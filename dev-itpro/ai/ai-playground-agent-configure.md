---
title: Configure instructions and tasks for an AI Playground Agent (preview)
description: Learn how to configure instructions and tasks for an AI Playground Agent in Business Central. Optimize agent behavior with structured guidelines and clear steps.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 09/10/2025
ms.update-cycle: 180-days
---

# Configure instructions and tasks for an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. To create a new agent, learn more in [Create and activate an AI Playground Agent (preview)](ai-playground-agent-create.md).

## Instruction framework

Effective agent instructions follow a structured approach with three key components:

- **Responsibilities** Define what the agent is accountable for (for example, handling customer reminders, processing credit memos, or managing sales quotes)
- **Guidelines** Set rules that apply across all tasks (for example, always request user review before posting documents or sending external communications)  
- **Instructions** Provide step-by-step, ordered lists for each specific task, including sub-steps for clarity

This framework ensures that agents act consistently, handle exceptions gracefully, and involve users when necessary.

### Writing effective instructions

At the core of defining agents is expressing goals and instructions in natural language. Writing instructions for AI Playground agents is similar to crafting prompts for large language models (LLMs), so you can apply general prompt-writing guidelines to improve instruction quality. You can even use LLM-based tools like Copilot to help optimize your instructions.

#### Key principles for agent instructions

##### Structure and brevity

- **Introduce structure** in your instructions using clear sections and formatting
- **Write as few instructions as possible** while maintaining clarity—concise instructions often perform better
- Use **emphasis** (bold text, UPPERCASE) to highlight important points
- Apply **numbering** to create logical flow and priorities

##### Formatting for clarity

- Use bullet points or numbered lists for multi-step processes
- Bold key terms and critical requirements
- Structure instructions with clear headings when appropriate
- Keep sentences short and direct

##### Agent-specific considerations

- Include **specific keywords or phrasing** to help the agent utilize available tools in the agent runtime effectively
- Review the UI that the agent has access to based on its profile before writing instructions
- Tailor instructions to match what the agent can see and do
- Reference specific field names, page titles, and actions that align with the agent's profile

#### When instructions aren't enough

If you're having difficulty achieving accuracy with your agent:

- **Consider changing or adding new functionality** to better support the agent's tasks
- **Optimize the UI** that the agent interacts with
- **Improve error messages and tooltips** to provide clearer guidance
- **Enhance page instructions** to help the agent be more successful

Test your instructions thoroughly to ensure they lead to the desired behavior, and iterate based on the agent's actual performance.

#### User intervention and review guidelines

##### When to request user intervention

- The agent should request user intervention when it can't proceed due to missing data, ambiguous situations, or validation errors
- Provide clear examples in your instructions of when to ask for help
- Default behavior: Any validation errors or missing critical information should trigger user intervention

Examples of intervention scenarios:

- If customer information is incomplete or foreign, ask for user intervention
- If required items aren't found in inventory, request assistance  
- When encountering unexpected error messages or system responses

##### User review requirements

- Agents should always request user review before proceeding with critical steps or sending outgoing messages
- All outgoing communications (emails, documents, notifications) require user review by default
- After completing significant actions (like creating sales quotes or processing orders), request user review before moving forward

##### Response handling

- Agents draft messages and responses based on instructions but must confirm before sending
- Provide clear summaries of actions taken and request clarification when needed
- Example: After creating a sales quote, reply with a summary and ask for any needed clarifications from the customer

#### Memory and state management

Agents retain a history of their actions and searches but don't store the full state of every page they interact with. To ensure important information is preserved:

- Include explicit instructions to memorize specific key-value pairs when needed
- Stored values can be referenced in later steps of the same task
- Example: "Memorize the external document reference from the newly created sales quote for use in follow-up communications"

<!-- Add example of good instructions, like shown in the partner video. Link to best practices for prompting -->

### Defining tasks

#### How to trigger your agent

You invoke your agent by manually creating a task for it. When creating a task, you can specify an additional message that gets passed to the agent to complement the general instructions with specific details for that particular task.

#### Current limitations in public preview

The public preview of the agent playground doesn't include built-in integrations for automatically triggering your custom agents based on:

- Incoming emails
- System events  
- Recurring schedules

#### Workarounds for testing scenarios

You can simulate these trigger scenarios manually:

- **Email simulation**: Insert email headers and body content in the agent task message to test email-based workflows
- **Event simulation**: Manually trigger agents with tasks that represent the events you want to test
- **Recurrence simulation**: Create tasks manually at intervals to test recurring scenarios

This manual approach allows you to validate your agent's behavior across different trigger scenarios during the prototyping phase.

## Instruction optimization and continuous improvement

### Error handling and validation

When writing instructions, include specific guidance for error handling:

- **Validate inputs**: Ensure all required fields are filled before proceeding with critical actions
- **Improve error messages**: Make error messages clear, specific, and actionable for both the agent and users
- Use emphasis to highlight critical validation points

Examples:

- **DO NOT** proceed until the requested date is entered
- Validate that the request date is entered for this month before processing
- **ALWAYS** confirm customer details are complete before creating quotes

### Instruction management and testing

- **Test for accuracy regularly** Instruction effectiveness can change over time as systems and processes evolve
- **Use AI optimization** Leverage AI tools like Copilot to help refine and update instructions
- **Dynamic updates** Instructions can be updated through setup pages without requiring agent reconfiguration
- **Less is more** Shift from verbose to concise instructions—simpler instructions often perform better than complex ones

### Advanced capabilities

**Page-specific instructions** You can provide dynamic prompts based on the specific pages or contexts the agent encounters. Use conditional logic for instructions tied to particular scenarios.

**Additional tools** Agents can use advanced tools like field setting, lookups, and action invocation. Include specific keywords in your instructions that help the agent utilize these tools effectively within the agent runtime.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Create and activate an AI Playground Agent (preview)](ai-playground-agent-create.md)  
[Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)