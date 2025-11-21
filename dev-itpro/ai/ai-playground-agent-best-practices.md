---
title: Best practices for prototyping with an AI Playground Agent (preview)
description: Explore how to design, test, and refine AI Playground agents in Business Central. Follow these best practices to optimize your prototypes.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 10/24/2025
ms.update-cycle: 180-days
---

# Best practices for prototyping with an AI playground agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

Following these best practices helps you create more effective AI Playground agents and get better results from your prototyping efforts.

## Instructions best practices

### Write clear and specific instructions

Effective agent instructions are specific, actionable, and contextual:

**Good example:**

```text
You're a customer service agent for a [!INCLUDE [prod_short](../includes/prod_short.md)] implementation. 
When users ask about customer information, search the Customer table and provide:
- Customer name and number
- Contact details (phone, email)
- Current balance and credit limit
- Recent sales history (last 5 transactions)
Always format responses in a clear, professional manner and ask clarifying questions if the request is ambiguous.
```

**Poor example:**

```text
Help users with customer stuff.
```

### Include context and constraints

- Define the agent's role and scope clearly
- Specify what data sources the agent should use
- Set expectations for response format and tone
- Include any business rules or constraints
- Provide examples of good responses when possible

### Use iterative refinement

- Start with basic instructions and test
- Refine based on actual agent behavior
- Document what works and what doesn't
- Test edge cases and unexpected inputs

Learn more in [Configure instructions and tasks for an AI playground agent (preview)](ai-playground-agent-configure.md).

## Tasks best practices

### Define specific, measurable tasks

Create tasks that have clear success criteria:

- **Good**: "Generate a summary report of overdue invoices for customers with credit limits over $10,000"
- **Poor**: "Help with accounting stuff"

### Limit task complexity

- Keep individual tasks focused on single objectives
- Break complex workflows into multiple tasks
- Consider the agent's UI access limitations
- Test each task independently

### Structure task workflows

- Design tasks that can work together logically
- Consider task dependencies and sequencing
- Plan for error handling and fallback scenarios

Learn more in [Configure instructions and tasks for an AI playground agent (preview)](ai-playground-agent-configure.md).

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

- Verify the agent can't access restricted data
- Test that insufficient permissions produce clear errors
- Confirm that permission changes work as expected

## Security and privacy best practices

### Protect sensitive information

- Only use playground in sandbox environments (never production)
- Be cautious with sensitive data in agent instructions and configurations  
- Consider data privacy implications when testing with customer data
- Document data handling practices for compliance requirements

### Control agent access

- Limit which users can interact with the agent
- Monitor agent activity through task logs
- Regularly review user access lists
- Deactivate agents when not in active use

### Document and audit

- Keep records of agent configurations and changes
- Document the business purpose for each agent
- Track who has access and why
- Plan for agent cleanup and removal

Learn more in [Set up AI playground agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md).

## Testing and validation best practices

### Systematic testing approach

- Test with various input types and formats
- Include edge cases and error conditions
- Validate responses for accuracy and completeness
- Check that the agent follows instructions consistently

### User acceptance testing

- Have business users test realistic scenarios
- Gather feedback on response quality and usefulness
- Validate that the agent meets business requirements
- Test with users who weren't involved in development

### Performance considerations

- Monitor response times and system impact
- Test with realistic data volumes
- Consider concurrent user scenarios
- Document any performance limitations

## Graduation to production best practices

### Knowledge transfer preparation

- Document all working instructions and configurations
- Identify which features need AL implementation
- Plan the development roadmap for production features
- Capture lessons learned and design decisions

### AL development considerations

- Plan how to implement agent capabilities in AL code
- Consider integration with existing [!INCLUDE [prod_short](../includes/prod_short.md)] features
- Design for scalability and performance requirements
- Plan testing strategies for production code
<!-- - Consider the upcoming agent development SDK for packaging agents as deployable apps -->

### Prototype cleanup

- Deactivate and remove playground agents after graduation
- Clean up test data and configurations
- Document the graduation process for future reference
- Archive prototype documentation for reference

## Common pitfalls to avoid

### Instruction problems

- **Overly vague instructions** lead to inconsistent behavior
- **Too many instructions** can confuse the agent
- **Contradictory requirements** create unpredictable results
- **Missing context** results in poor decision-making

### Permission issues

- **Over-permissioning** creates security risks
- **Under-permissioning** blocks legitimate functionality
- **Inconsistent permissions** across related tasks cause confusion
- **Unaudited permissions** create compliance risks

### Testing shortcuts

- **Insufficient testing** leads to poor production decisions
- **Testing only happy paths** misses important edge cases
- **No user feedback** results in solutions that don't meet needs
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

[AI playground agent overview (preview)](ai-playground-agent.md)  
[Transparency Note: AI playground agent (preview)](transparency-note-ai-playground-agent.md)  
[Create and activate an AI playground agent (preview)](ai-playground-agent-create.md)  
[Configure instructions and tasks for an AI playground agent (preview)](ai-playground-agent-configure.md)  
[Set up AI playground agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Build Copilot capability in AL](../developer/ai-build-capability-in-al.md)  
[Test Copilot capability in AL](../developer/ai-test-copilot.md)