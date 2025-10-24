---
title: Build Business Central agents with Copilot Studio
description: Learn how to create agents that expose existing Business Central data and processes through Copilot Studio using either the Business Central MCP server or Business Central connector.
ms.topic: how-to
ms.date: 10/22/2025
author: YOURALIAS
ms.author: YOURALIAS
ms.reviewer: 
ms.collection: 
ms.custom: 
---

<!--
# Build agents with Copilot Studio

Create conversational agents that let users interact with Business Central data and processes from external channels such as Microsoft Teams, Microsoft 365 Copilot, and public websites. Agents don’t extend Business Central functionality—they expose what already exists (data, validation, pricing, workflows) through natural language. You can connect an agent to Business Central by using either the Business Central Model Context Protocol (MCP) server or the Business Central Power Platform connector.

## When to use agents

Use an agent when users need to:

- Look up customers, items, inventory, or documents.
- Trigger existing operations (create records, post, check status).
- Ask natural-language questions instead of navigating pages.
- Access Business Central data securely from external channels.

Agents don't:

- Add new AL code or business logic.
- Replace extension development.
- Override permissions or policies.
- Modify the schema or internal engine behavior.

## Integration options


| Option | Best for | Access style | Typical scenarios |
|--------|----------|--------------|-------------------|
| Business Central MCP server | Rich, model-aware, multi-turn interactions | Model context + server tools | Exploratory queries, refinements, chained operations |
| Business Central connector | Task-focused CRUD actions | Predefined action calls | Listing, creating, updating specific records |

Use MCP for deep schema navigation or iterative refinement; use the connector for targeted actions (for example, list items, create customers).

## Capabilities (consume only)

Agents can:

- Read data via exposed tools or connector actions.
- Create and update records using existing validation rules.
- Leverage server logic (pricing, discounts, numbering).
- Trigger existing workflows or approvals (if exposed as tools).
- Return structured results conversationally.

Agents can’t:

- Introduce new logic or bypass validation.
- Access tables not explicitly exposed.
- Perform non-API database operations.

## Architecture overview

1. User prompt: “Create a new customer named Fabrikam Supplies.”
2. Agent selects a tool/action (MCP tool or connector action).
3. Tool executes with authenticated context and permissions.
4. Result is formatted and returned as a conversational response.

## Prerequisites

- Business Central environment (sandbox or production).
- Copilot Studio license and sufficient Copilot Credits.
- User/service account with the required permissions.
- (Connector) Power Platform environment if broader integration is needed.
- (MCP) Configured MCP server endpoint and connection.

## Option 1: Business Central MCP server

The MCP server exposes Business Central model context (entities, fields) and server-side tools to Copilot Studio.

### Steps (high level)

1. Create or open an agent in Copilot Studio.
2. Add the Business Central MCP server as a tool.
3. Scope exposed entities and actions (limit to what’s needed).
4. Add example prompts (list, refine, create).
5. Test multi-turn conversations (refine, filter).
6. Publish to target channels.

### Strengths

- Schema awareness (relationships, fields).
- Multi-turn refinement (“Show customers in Spain” → “Only those with overdue balance”).
- Chaining read → validate → write patterns.

### Considerations

- Requires careful scoping and permission review.
- Needs good examples to guide model action selection.
- Broader exposure increases governance responsibilities.

## Option 2: Business Central connector

The connector provides discrete actions (for example, Find records (V3), Create record (V3), Update record (V3)) mapped to Business Central APIs.

### Steps (high level)

1. Create or open an agent.
2. Add connector actions as tools.
3. Configure required inputs (Environment, Company, API category, Table name).
4. Add example prompts mapping intent → action.
5. Test queries and writes.
6. Publish.

### Strengths

- Fast setup.
- Explicit action boundaries (easy auditing).
- Simple mental model for authors and administrators.

### Considerations

- Less dynamic schema exploration.
- Each new scenario may require adding another action.
- Precise input mapping (table names, categories) required.

## Example: Find and create customers (connector)

1. Add tools: `Find records (V3)` and `Create record (V3)` for table `customers`.
2. Configure inputs:
   - Environment: `PRODUCTION`
   - Company: `CRONUS USA, Inc.`
   - API category: `V2.0`
   - Table name: `customers`
3. Provide example prompts:
   - “List customers with overdue balance.”
   - “Create a customer named Fabrikam Demo with number FAB-001 and email ops@fabrikam.com.”
4. Test interactions in the test pane.
5. Publish to Teams or Microsoft 365 Copilot.

## Teaching the agent (examples)

Include 2–5 concise examples to ground tool usage:
- “Show the latest customers.” → Find records (limit, sort).
- “Add a customer called Alpine Ski with number ALP-100 and email sales@alpineski.com.” → Create record (mapped fields).
- (MCP) “Only show customers in Switzerland.” → Filtered query refinement.

## Testing

- Use the test panel for iterative prompt trials.
- Verify correct tool selection in logs.
- Confirm validation errors appear clearly (for example, number series invalid).
- Adjust examples if wrong action is chosen.

## Publishing channels

Agents can be published to:
- Microsoft Teams
- Microsoft 365 Copilot
- Public websites (embedded widget)
- Supported messaging platforms (where available)

Review compliance, authentication, and user access per channel.

## Security and governance

- Enforce least privilege (restrict tables and actions).
- Monitor usage logs for anomalies.
- Avoid exposing sensitive financial or personal data.
- Remove or disable tools if misuse occurs.
- Keep examples free of real PII—use fictional data.

## Performance tips

- Limit page sizes and use filters.
- Encourage specific prompts (“Customers with overdue balance > $1000”).
- Avoid over-exposing large tables if not needed.
- Use API categories aligned with performance-tested endpoints.

## Error handling patterns

| Error type | Cause | Suggested response |
|------------|-------|--------------------|
| Permission denied | Insufficient rights | “I couldn’t access that data. Check your permissions.” |
| Validation failure | Field rule or number series | “Creation failed: Number invalid. Provide a number from series CUST-###.” |
| Timeout | Network or API latency | “The request took too long. Try again or narrow the query.” |
| Missing required field | Prompt didn’t supply value | Ask follow-up: “What’s the email for the new customer?” |

## FAQ

1. Can an agent add new business logic?  
   No. Add logic via AL extensions; agents only consume exposed capabilities.

2. Can it access any table?  
   Only those intentionally exposed and permitted.

3. Do I need MCP for simple record creation?  
   No. The connector is often sufficient.

4. Can agents trigger approvals?  
   Yes, if approval actions are exposed.

5. Is data cached?  
   No. Each action executes in real time against Business Central.

## MCP vs connector decision

Choose MCP if:
- You need deep model navigation or iterative refinement.
- You expect chained multi-step operations.

Choose connector if:
- You need quick CRUD or lookup tasks.
- You want tight, explicit action governance.
- Minimal authoring complexity is preferred.

You can combine both paths, but start with one to reduce complexity.

## Governance checklist

- [ ] Licensing and credits confirmed
- [ ] Target tables/entities defined
- [ ] Integration approach selected (MCP or connector)
- [ ] Example prompts drafted
- [ ] Tools/actions configured (least privilege)
- [ ] Validation and error cases tested
- [ ] Published to pilot channel
- [ ] Monitoring in place

## Next steps

- Add update/delete actions or MCP update tools.
- Expand examples for edge cases (duplicates, missing fields).
- Introduce prompt guidance (“You can ask me to list or create customers.”).
- Integrate approvals or workflow triggers if available.

## Summary

Agents provide a conversational layer over existing Business Central capabilities—no new logic, just secure, permission-based access to data and processes. Use the MCP server for rich, model-aware interactions or the connector for focused business actions. With scoped exposure, clear examples, and proper governance, agents improve productivity across multiple channels.


Extending Business Central with Copilot Agents
Business Central doesn’t just bring AI into the application—it can also reach your users wherever they work. By creating Copilot agents that connect to Business Central, you can expose business data and processes through conversational experiences in Microsoft Teams, Microsoft 365 Copilot, and even on public-facing websites. This chapter explains how to build, configure, and publish these agents, so your organization can extend Business Central beyond its core interface and deliver AI-powered assistance across multiple channels.

## Activate MCP server
-->

# Configure Business Central MCP Server

The article explains how to enable and configure the Business Central MCP Server in your Business Central environment to allow agents can connect to APIs. 

## Configuration overview


You can only add one confiuration per MCP Server instance in Copilot Studio.
You can only add page objects.

## Prerequisites

- The **Feature: Enable MCP Server access** feature is enabled on the environment in the [Feature Management](https://businesscentral.dynamics.com/?page=2610) page. Learn more in [Enabling Upcoming Features Ahead of Time](/dynamics365/business-central/dev-itpro/administration/feature-management).

## Create a MCP Server configuration

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page in Business Central.
1. Select **New**.
1. Set these general fields:  

   |Field|Description|
   |-|-|
   |Name|Specifies the configuration's name. This name appears in Copilot Studio to assign the configuration to MCP Server connection for an agent.|
   |Description|Specifies a brief description of the configuration.|
   |Active|When on, the configuration and its tools are available for agents to use. If you turn the swicth off, agents that currently use the configuration won't work as expected.|
   |Dynamic Tool Mode|When on, agents that use the configuration can search for tools within the configuration dynamically. In the MCP server configuration for the agent in Copilot Studio, you don't explicitly allow access to the tools. If off, you to select the tools you to allow the agent to use.|
   |Discover Additional Objects|When on, read-only objects that aren't defined as tools in the confiuration are also accessible by agents. This switch only applies when the **Dynamics Tool Mode** is on. |
   |Allow Create/Update/Delete Tools|When off, agents that use this configuration can't perform create, update, and delete operations on tools even if the operations are enabled.|

1. In the **Tools** section, add API page objects as tools to the configuration.

   You add the objects individually in lines. Select the **Add All Standard APIs as Tools** to automatically add the Business Central API pages.

   Set the permissions agents have for each tool according to the following table: 

   |Permission|Description|
   |-|-|
   |Allow Read|Specifies whether read operations are allowed for this tool.|
   |Allow Create|Specifies whether create operations are allowed for this tool.|
   |Allow Modify|Specifies whether modify operations are allowed for this tool.|
   |Allow Delete|Specifies whether modify operations are allowed for this tool.|
   |Allow Bound Actions|Specifies whether bound actions are allowed for this tool. A bound action is an OData action that is bound to a resource, like a table or record |

## Next steps

[][]