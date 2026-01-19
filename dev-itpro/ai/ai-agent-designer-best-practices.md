---
title: Best practices for prototyping with the Agent designer (preview)
description: Explore how to design, test, and refine custom agents using the Agent designer. Follow these best practices to optimize your prototypes.
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

# Best practices for prototyping with the Agent designer (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

Following these best practices helps you create agents and get better results from your prototyping efforts.

Learn more about the Agent designer in [Agent designer overview (preview)](ai-agent-designer.md).

## Instructions best practices

### Write clear and specific instructions

Effective agent instructions are specific, actionable, and contextual. Instructions are key to guiding agent behavior. Learn more in [Write effective instructions for an Agent (preview)](ai-agent-designer-effective-instructions.md).

## Tasks best practices

### Define specific, measurable tasks

Create tasks that have clear success criteria:

- **Good**: "Generate a summary report of overdue invoices for customers with credit limits over $10,000"
- **Poor**: "Get the overdue invoices for customers with large credit limits"

### Limit task complexity

- Keep individual tasks focused on single objectives
- Break complex workflows into multiple tasks
- Consider the agent's UI access limitations - determined by their profile.
- Test each task independently

### UI design

- The fewer elements that the agent needs to consider, the more accurate it is
- Ensure that tooltips on relevant actions are descriptive enough for human and agent users
- Hide unrelated elements that might confuse the agent during testing
- Consider navigation shortcuts for your agent like adding links to the relevant pages to its role center
- Fewer navigation steps lead to a more cost-effective and accurate agent

### Structure task workflows

- Design tasks that can work together logically
- Consider task dependencies and sequencing
- Plan for error handling and fallback scenarios

Learn more in [Write effective instructions for an Agent (preview)](ai-agent-designer-effective-instructions.md).

## Permissions best practices

### Apply least privilege principle

- Grant only the minimum permissions needed for the agent's tasks
- Regularly review and audit agent permissions
- Remove permissions that aren't actively used
- Document why each permission is necessary

### Use custom profiles

Create agent-specific profiles that:

- Limit UI exposure to relevant pages only
- Remove unnecessary actions and views
- Simplify layouts to reduce complexity
- Use page customization properties effectively

### Test permission boundaries

- Verify that the agent can't access restricted data
- Confirm that permission changes work as expected

## Security and privacy best practices

### Protect sensitive information

- Be cautious with sensitive data in agent instructions and configurations
- Ensure that the agent can access only data that's relevant to its task
- Consider data privacy implications when testing with customer data
- Document data handling practices for compliance requirements

### Control agent access

- Limit which users can interact with the agent
- Monitor agent activity through task log entries
- Regularly review user access lists
- Deactivate agents when not in active use

### Data isolation

When an agent's output is used for external communication, it's necessary to test that the outputs don't expose unrelated data.
For example, if an agent answers to email queries about product prices, it's vital to test that it doesn't reveal internal details that would otherwise be
unavailable to the external customer like the wholesale acquisition cost of the product.

- Ensure that the agent's profile covers only the necessary elements for its task
- Always perform a human review of the output messages of agents if they interact with external customers
- If necessary, design agent specific pages or AL event subscribers, which filter the data to what the agent is supposed to process

### Document and audit

- Keep records of agent configurations and changes
- Document the business purpose for each agent. Ensure the description of the agent clearly describes its function.
- Track who has access and why
- Plan for agent cleanup and removal

Learn more in [Set up agent permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md).

## Testing and validation best practices

### Systematic testing approach

- Test with various input types and formats
- Include edge cases and error conditions, including typos and common human errors
- Validate responses for accuracy and completeness
- Check that the agent follows instructions consistently

### Accuracy testing

- Create scenarios with easily verifiable acceptance criteria - for example, 'a new sales order with a single bicycle should be added'
- Generate many variations through real business cases or via LLM powered tools, ensure consistency of outputs
- Ensure the agent can recover from common error scenarios, like field validations during data entry
- Include scenarios where the agent failed during development as test cases to ensure it doesn't regress

### User acceptance testing

- Have business users test realistic scenarios
- Gather feedback on response quality and usefulness
- Validate that the agent meets business requirements
- Test with users who weren't involved in development

### Red teaming

- Try to ask your agent about pages/fields it shouldn't have access to
- Ask your agent to infer information about the business that it shouldn't have access to
- Request your agent to perform actions that shouldn't be valid for your scenario, for example, to set the price of a product to zero and then sell it 

### Performance considerations

- Monitor the number of steps and the total credit cost of your test tasks
- Test on realistic data volumes to ensure that your agent can handle the complexity of the task
- Optimize for the minimum number of steps as longer workflows can reduce the accuracy of agents

## Common pitfalls to avoid

### Instruction problems

- **Overly vague instructions** lead to inconsistent behavior
- **Too many instructions** can confuse the agent
- **Contradictory requirements** create unpredictable results
- **Missing context** results in poor decision-making
- **Specific tool references** can lead to regressions if they get renamed. Refer to *what* the agent should do, not *which tool* to use
- **Ambiguous instructions** can cause erratic behavior as they might be interpreted either way on every run
- **Safety filters** can be triggered if the instructions are treated as a jailbreak attempt. Refactor the instructions to avoid any false positives

### Permission issues

- **Unnecessary agent permissions** can allow agents to modify data they shouldn't
- **The intersection of the assigning user's permissions and the agent permissions** should be enough to perform all of its functions
- **Agents cannot configure users or other agents by design**
- **Agents cannot access sensitive pages like user cards or permission set assignment**

### UI design problems

- **Limit the UI** either via profiles or pages designed specifically for your agent to help it achieve its task 

### Testing

- **Agents are non-deterministic** so testing is the only way to validate they do what they're designed to do
- **Testing only happy paths** misses important edge cases
- **Skipping documentation** makes knowledge transfer difficult

## Measuring success

### Key metrics to track

- **Task completion rate**: How often the agent successfully completes requested tasks
- **Response accuracy**: Quality and correctness of agent responses
- **User satisfaction**: Feedback from test users about agent usefulness
- **Error frequency**: How often the agent encounters errors or confusion

### Success indicators

- Users can accomplish their goals through agent interaction
- Agent responses are consistent and reliable
- Instructions and tasks work across different scenarios
- The prototype validates the business case for AI implementation

## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[Agent designer (preview)](ai-agent-designer.md)  
[Create and activate (preview)](ai-agent-designer-create.md)  
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-designer-attachments.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an Agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Agent designer frequently asked questions (preview)](ai-agent-designer-faq.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central Agent designer (preview)](transparency-note-agent-designer.md)  