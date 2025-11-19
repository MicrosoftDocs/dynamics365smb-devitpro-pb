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
ms.date: 11/19/2025
ms.update-cycle: 180-days
---

# Configure instructions and tasks for an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. To create a new agent, learn more in [Create and activate an AI Playground Agent (preview)](ai-playground-agent-create.md). Finetune and improve your agent's behavior by following guidance in [Iterate and manage an AI Playground Agent (preview)](ai-playground-agent-iterate.md).

## Getting started with agent instructions

### The AI-assisted approach

Rather than trying to write perfect instructions from the start, we recommend an iterative, AI-assisted workflow:

1. **Start with your ideas** - Write down what you want your agent to do in natural language, without worrying about format or structure
2. **Use AI to refine** - Leverage Copilot or other AI tools to transform your initial thoughts into well-structured instructions following best practices
3. **Test and iterate** - Deploy your agent, observe its behavior, and refine the instructions based on real-world results
4. **Leverage community examples** - Reference proven patterns and examples from the community

This approach allows you to focus on the business logic and desired outcomes, while AI helps with the technical formatting and best practices.

### Draft your initial instructions

Start by describing your agent's purpose and workflow in plain language. Don't worry about perfect formatting at this stage—just capture the core requirements and workflow.

#### Example initial draft

```text
I want an agent that helps with customer credit checks. When a sales order comes in, 
it should check if the customer has exceeded their credit limit. If they have, it should 
notify the sales team and suggest alternative payment terms. It needs to look at their 
payment history too.
```

Once you have your initial draft, you can use AI tools to refine it according to best practices and proven patterns.

## Refining instructions with AI assistance

### Instruction framework

Effective agent instructions follow a structured approach with three key components:

- **Responsibilities** Define what the agent is accountable for. For example, handling customer reminders, processing credit memos, or managing sales quotes.
- **Guidelines** Set rules that apply across all tasks. For example, always request user review before posting documents or sending external communications.
- **Instructions** Provide step-by-step, ordered lists for each specific task, including sub-steps for clarity.

This framework ensures that agents act consistently, handle exceptions gracefully, and involve users when necessary.

### Using AI to structure your instructions

Provide your draft instructions to AI tools like Copilot, which can help you:

- Structure your instructions into clear sections (Responsibilities, Guidelines, Instructions)
- Add appropriate emphasis and formatting
- Incorporate proven navigation patterns and tool usage
- Ensure alignment with your agent's profile and permissions
- Add validation rules and error handling guidance

### Example transformation

#### Before (initial draft)

```text
Check customer credit when creating sales orders. Stop if over limit.
```

#### After (AI-refined with best practices)

```text
**RESPONSIBILITY**: Monitor customer credit limits during sales order creation

**GUIDELINES**:
- Always request user review before blocking an order
- Provide clear explanations of credit status
- Suggest alternative payment terms when applicable

**INSTRUCTIONS**:
1. When a sales order is created, retrieve the customer's current balance and credit limit
2. Calculate available credit: Credit Limit - Current Balance
3. If available credit is less than the order amount:
   a. **DO NOT** proceed with order creation
   b. Request user intervention with details: current balance, credit limit, order amount
   c. Suggest alternative payment terms (e.g., Cash, Prepayment)
4. Document the credit check result for audit purposes
```

### Community-driven best practices

The Business Central community maintains repositories of agent instruction patterns, examples, and best practices. These resources can be used to ground AI-generated instruction improvements:

- Navigation patterns for common Business Central pages
- Tool usage examples for standard operations
- Error handling and validation patterns
- User intervention scenarios

By referencing these community patterns when refining your instructions, you ensure your agent follows proven approaches and handles edge cases effectively. Learn more in [alguidelines](https://github.com/microsoft/alguidelines/blob/d2cdf97e0c4ba8fa3a618169339d2d6655d63493/content/docs/agentic-coding/vibe-coding-rules/al-code-style.md).

### Key principles for agent instructions

At the core of defining agents is expressing goals and instructions in natural language. Writing instructions for AI Playground agents is similar to crafting prompts for large language models (LLMs), so you can apply general prompt-writing guidelines to improve instruction quality.

#### Start simple, iterate based on results

- Begin with core functionality and essential workflows
- Deploy and test with real scenarios
- Add complexity and refinements based on observed behavior
- Use AI to help incorporate lessons learned from testing

#### Leverage AI and community knowledge

- Use AI tools to transform drafts into structured instructions
- Reference community patterns for common scenarios
- Ground AI refinements with proven examples
- Contribute your own successful patterns back to the community

#### Focus on outcomes, not formatting

- Describe what the agent should accomplish, not how to format the text
- Let AI handle the structuring, emphasis, and formatting details
- Concentrate on business logic, edge cases, and user experience

#### Agent-specific considerations

- Include **specific keywords or phrasing** to help the agent utilize available tools in the agent runtime effectively
- Review the UI that the agent has access to based on its profile before writing instructions
- Tailor instructions to match what the agent can see and do
- Reference specific field names, page titles, and actions that align with the agent's profile

### Advanced instruction concepts

As you refine your agent instructions, consider incorporating these advanced patterns. AI tools can help you apply these concepts effectively when you provide your draft instructions and indicate which patterns are relevant.

#### User intervention and review

##### When to request user intervention

- The agent should request user intervention when it can't proceed due to missing data, ambiguous situations, or validation errors
- Examples: incomplete customer information, items not found in inventory, unexpected error messages

##### User review requirements

- Agents should always request user review before proceeding with critical steps or sending outgoing messages
- All outgoing communications require user review by default
- After completing significant actions, request user review before moving forward

##### Response handling

- Agents draft messages based on instructions but must confirm before sending
- Provide clear summaries of actions taken

#### Memory and state management

Agents retain a history of their actions and searches but don't store the full state of every page. Include explicit instructions to memorize specific key-value pairs when needed, which can be referenced in later steps.

Example: "Memorize the external document reference from the newly created sales quote for use in follow-up communications"

#### Error handling and validation

- **Validate inputs**: Ensure all required fields are filled before proceeding with critical actions
- **Use emphasis**: Highlight critical validation points with bold text or UPPERCASE
- Examples: "**DO NOT** proceed until the requested date is entered" or "**ALWAYS** confirm customer details are complete before creating quotes"

### Defining tasks

#### How to trigger your agent

You invoke your agent by manually creating a task for it. When creating a task, you can specify an additional message that gets passed to the agent to complement the general instructions with specific details for that particular task. As you're testing and prototyping your agent, you can create tasks directly from the **AI Playground Agent** setup page. Each task you create will appear in the agent's task queue, where the agent will pick it up and process it according to its instructions.

#### Current limitations in public preview

The public preview of the agent playground doesn't include built-in integrations for automatically triggering your custom agents based on, for example:

- Incoming emails
- System events  
- Recurring schedules

#### Workarounds for testing scenarios

You can simulate these trigger scenarios manually:

- **Email simulation**: Insert email headers and body content in the agent task message to test email-based workflows
- **Event simulation**: Manually trigger agents with tasks that represent the events you want to test
- **Recurrence simulation**: Create tasks manually at intervals to test recurring scenarios

This manual approach allows you to validate your agent's behavior across different trigger scenarios during the prototyping phase.

## Testing and continuous improvement

### When instructions aren't enough

If you're having difficulty achieving accuracy with your agent:

- **Consider changing or adding new functionality** to better support the agent's tasks
- **Optimize the UI** that the agent interacts with
- **Improve error messages and tooltips** to provide clearer guidance
- **Enhance page instructions** to help the agent be more successful

Test your instructions thoroughly to ensure they lead to the desired behavior, and iterate based on the agent's actual performance.

### Instruction management best practices

- **Test for accuracy regularly** Instruction effectiveness can change over time as systems and processes evolve
- **Use AI optimization** Leverage AI tools like Copilot to help refine and update instructions
- **Dynamic updates** Instructions can be updated through setup pages without requiring agent reconfiguration
- **Less is more** Shift from verbose to concise instructions—simpler instructions often perform better than complex ones

### Advanced capabilities

**Page-specific instructions** You can provide dynamic prompts based on the specific pages or contexts the agent encounters. Use conditional logic for instructions tied to particular scenarios.

**Additional tools** Agents can use advanced tools like field setting, lookups, and action invocation. Include specific keywords in your instructions that help the agent utilize these tools effectively within the agent runtime.

## Frequently asked questions

### How detailed should my initial draft be?

Start with enough detail to convey the business logic and key decision points. You don't need perfect formatting or complete edge case coverage—focus on the core workflow. AI can help fill in the structure and best practices.

### Can I update instructions after the agent is deployed?

Yes, agent instructions can be updated dynamically. Test your changes in a sandbox environment first, then deploy updates to your production agent. Remember that agents must be deactivated to modify certain settings.

### How do I know if my instructions are working?

Monitor the agent's behavior through the timeline view in the playground. Look for:

- Successful task completions
- Appropriate use of tools and navigation
- Correct handling of edge cases
- Reasonable user intervention requests

### Where can I find example instructions and patterns?

The Business Central community maintains repositories with agent instruction patterns, navigation examples, and tool usage guidance. These resources provide proven approaches that you can reference when refining your instructions with AI assistance.

### Should I write different instructions for different environments?

Your core instructions should be environment-agnostic. Use the agent's profile and permissions to control what it can access in different environments, rather than having environment-specific instructions.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Create and activate an AI Playground Agent (preview)](ai-playground-agent-create.md)  
[Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)
