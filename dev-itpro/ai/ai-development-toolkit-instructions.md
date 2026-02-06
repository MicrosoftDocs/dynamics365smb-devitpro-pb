---
title: Write effective instructions for an agent (preview)
description: Learn how to author instructions for an agent in Business Central. Optimize agent behavior with structured guidelines and clear steps.
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

# Write effective instructions for an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. To create a new agent, learn more in [Create and activate an agent (preview)](ai-development-toolkit-agent-create.md). Fine tune and improve your agent's behavior by following guidance in [Iterate and manage an agent (preview)](ai-development-toolkit-iterate.md).

Learn more about how to *trigger* your agent once you have written effective instructions in [Run an agent (preview)](ai-development-toolkit-run-agent.md).

## Getting started with agent instructions

### The AI-assisted approach

Rather than trying to write perfect instructions from the start, we recommend an iterative, AI-assisted workflow:

1. **Start with your ideas** - Write down what you want your agent to do in natural language, without worrying about format or structure
2. **Use AI to refine** - Use Copilot or other AI tools to transform your initial thoughts into well-structured instructions. Use the best practices as a knowledge input to your chosen AI tool to help it suggest good instructions.
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

- **Responsibilities**  
Define what the agent is accountable for. For example, handling customer reminders, processing credit memos, or managing sales quotes.
- **Guidelines**  
Set rules that apply across all tasks. For example, always request user review before posting documents or sending external communications.
- **Instructions**  
Provide step-by-step, ordered lists for each specific task, including substeps for clarity.

This framework ensures that agents act consistently, handle exceptions gracefully, and involve users when necessary.

### Using AI to structure your instructions

Provide your draft instructions to AI tools like Copilot, which can help you:

- Structure your instructions into clear sections (responsibilities, guidelines, and instructions)
- Add appropriate emphasis and formatting
- Incorporate proven navigation patterns and tool usage
- Ensure alignment with your agent's profile and permissions
- Add validation rules and error handling guidance

### Example transformation

#### Before - initial draft

```text
Check customer credit for the given sales order. Document the result.
```

#### After - AI-refined with best practices

```text
**RESPONSIBILITY**: Monitor customer credit limits during sales order creation

**GUIDELINES**:
- Always request user review before blocking an order
- Provide clear explanations of credit status
- Suggest alternative payment terms when applicable

**INSTRUCTIONS**:
1. For the given sales order, retrieve the customer's current balance and credit limit
2. Calculate available credit: Credit Limit - Current Balance
3. If available credit is less than the order amount:
   a. **DO NOT** proceed with order creation
   b. Request user intervention with details: current balance, credit limit, order amount
   c. Suggest alternative payment terms (for example; Cash, Prepayment)
4. Document the credit check result for audit purposes
   a. Add a new comment line with the credit check details to the **Comments** section of the sales order
   b. Example format: "Credit Check - [Date/Time] | Available Credit: [Amount] | Order Amount: [Amount] | Status: [APPROVED/BLOCKED]"
```

### Community-driven best practices

The [!INCLUDE [prod_short](../includes/prod_short.md)] community maintains repositories of agent instruction patterns, examples, and best practices. These resources can be used to ground AI-generated instruction improvements:

- Navigation patterns for common [!INCLUDE [prod_short](../includes/prod_short.md)] pages
- Tool usage examples for standard operations
- Error handling and validation patterns
- User intervention scenarios

By referencing these community patterns when refining your instructions, you ensure your agent follows proven approaches and handles edge cases effectively. Learn more in [alguidelines](https://github.com/microsoft/alguidelines/blob/d2cdf97e0c4ba8fa3a618169339d2d6655d63493/content/docs/agentic-coding/vibe-coding-rules/al-code-style.md).

### Key principles for agent instructions

At the core of defining agents is expressing goals and instructions in natural language. Writing instructions for agents is similar to crafting prompts for large language models (LLMs), so you can apply general prompt-writing guidelines to improve instruction quality. Learn about specific keywords in [Instruction keywords for an agent (preview)](ai-development-toolkit-instruction-keywords.md).

#### Start simple, iterate based on results

- Begin with core functionality and essential workflows
- Deploy and test with real scenarios
- Add complexity and refinements based on observed behavior
- Use AI to help incorporate lessons learned from testing

#### Use AI and community knowledge

- Use AI tools to transform drafts into structured instructions
- Reference community patterns for common scenarios
- Ground AI refinements with proven examples
- Contribute your own successful patterns back to the community

#### Focus on outcomes

- Describe what the agent should accomplish
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

The agent should request user intervention when it can't proceed due to missing data, ambiguous situations, or validation errors. Examples could be:

- Incomplete customer information  
- Items aren't found in inventory  
- Unexpected error messages

##### User review requirements

- Agents should always request user review before proceeding with critical steps or sending outgoing messages
- All outgoing communications require a user review by default
- After completing significant actions, request user review before moving forward

##### Response handling

- Agents draft messages based on instructions but they must confirm before sending
- Provide clear summaries of actions taken

#### Memory and state management

Agents retain a history of their actions and searches per task, but don't store the full state of every page. Include explicit instructions to memorize specific key-value pairs when needed, which can be referenced in later steps.

An example of giving such instructions could be: "**Memorize** the external document reference from the newly created sales quote for use in follow-up communications."
Consider providing an example of what the memorized information should look like to improve accuracy, for example "external document reference: ABCD1234 Document Number: 1234"

Learn more about using specific instruction keywords in [Instruction keywords for an agent (preview)](ai-development-toolkit-instruction-keywords.md).

#### Error handling and validation

- **Validate inputs**: Ensure all required fields are filled in before proceeding with critical actions
- **Use emphasis**: Highlight critical validation points with bold text or UPPERCASE
- For example:  
  "**DO NOT** proceed until the requested date is entered"  
  "**ALWAYS** confirm customer details are complete before creating quotes"

## Testing and continuous improvement

### When instructions aren't enough

If you're having difficulty achieving accuracy with your agent:

- **Consider changing or adding new functionality** to better support the agent's tasks
- **Optimize the UI** that the agent interacts with
- **Improve error messages and tooltips** to provide clearer guidance
- **Enhance page instructions** to help the agent be more successful

Test your instructions thoroughly to ensure they lead to the desired behavior, and iterate based on the agent's actual performance.

### Instruction management best practices

- **Test for accuracy regularly** Instruction effectiveness can change over time as systems and processes evolve.
- **Use AI optimization** Leverage AI tools like Copilot to help refine and update instructions.
- **Dynamic updates** Instructions can be updated through setup pages without requiring agent reconfiguration.
- **Version control** The UI maintains a history of instruction changes, allowing you to revert to earlier versions if needed. This is useful when testing different instruction approaches or when a new version doesn't perform as expected.
- **Less is more** Shift from verbose to concise instructions. Simpler instructions often perform better than complex ones.

### Advanced capabilities

**Page-specific instructions** You can provide dynamic prompts based on the specific page that the agent encounters. Use conditional logic for instructions tied to particular scenarios.

```
Consider the following fields:
{% if page.id == 42 %}
Field "The answer" - An important answer to questions about the universe
{% else %}
Field "Business data" - Relevant business information
{% endif %}
```

**Additional tools** Agents can use tools like field setting, lookups, and action invocation. Include specific keywords in your instructions that help the agent utilize these tools effectively within the agent runtime. You can find a list of these tools in the log entry details for individual log entries.

## Frequently asked questions

### How detailed should my initial draft be?

Start with enough detail to convey the business logic and key decision points. You don't need perfect formatting or complete edge case coverage—focus on the core workflow. AI can help fill in the structure and best practices.

### Can I update instructions after the agent is deployed?

Yes, agent instructions can be updated dynamically. 

### How do I know if my instructions are working?

Monitor the agent's behavior through the timeline view. Look for:

- Successful task completions
- Appropriate use of tools and navigation
- Correct handling of edge cases
- Reasonable user intervention requests

### Where can I find example instructions and patterns?

The [!INCLUDE [prod_short](../includes/prod_short.md)] community maintains repositories with agent instruction patterns, navigation examples, and tool usage guidance. These resources provide proven approaches that you can reference when refining your instructions with AI assistance. Learn more in [alguidelines](https://github.com/microsoft/alguidelines/blob/d2cdf97e0c4ba8fa3a618169339d2d6655d63493/content/docs/agentic-coding/GettingStarted/effective-prompting.md)

### Should I write different instructions for different environments?

Your core instructions should be environment-agnostic. Use the agent's profile and permissions to control what it can access in different environments, rather than having environment-specific instructions.

## Related information

[Overview (preview)](ai-development-toolkit-landing-page.yml)  
[Designing and coding agents (preview)](ai-development-toolkit-overview.md)   
[Create and activate (preview)](ai-development-toolkit-agent-create.md)  
[Instruction keywords (preview)](ai-development-toolkit-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-development-toolkit-attachments.md)  
[Set up permissions and profiles (preview)](ai-development-toolkit-permissions-profiles.md)  
[Run an agent (preview)](ai-development-toolkit-run-agent.md)  
[Iterate and manage (preview)](ai-development-toolkit-iterate.md)  
[Best practices for designing an agent (preview)](ai-development-toolkit-faq.md)  
[Best practices (preview)](ai-development-toolkit-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-development-toolkit-sales-validation.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)
