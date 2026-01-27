---
title: Transparency Note Business Central Agent designer (preview)
author: pborring
description: Learn how the Business Central Agent designer empowers partners to prototype AI-powered agents, automate workflows, and enhance productivity responsibly.
ms.author: solsen
ms.reviewer: solsen
ms.topic: faq
ms.collection: bap-ai-copilot
ms.date: 01/27/2026
ms.update-cycle: 180-days
ms.custom: bap-template
---

# Transparency note: Business Central Agent designer (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

## What is a Transparency Note?

An AI system includes the technology, the people who use it, the people it affects, and the environment where it's deployed. Creating a system that is fit for its intended purpose requires an understanding of how the technology works, what its capabilities and limitations are, and how to achieve the best performance. Microsoft's Transparency Notes help you learn how our AI technology works, what choices system owners can make to influence system performance and behavior, and why it's important to consider the whole system, including the technology, people, and environment. Use Transparency Notes when you develop or deploy your own system, or share them with people who use or are affected by your system. Microsoft’s Transparency Notes are part of a broader effort at Microsoft to put our AI Principles into practice. Learn more at [Microsoft AI principles](https://www.microsoft.com/ai/responsible-ai).

## The basics of Business Central Agent designer

### Introduction

The [!INCLUDE [prod_short](../includes/prod_short.md)] Agent designer is an environment designed to help partners prototype, test, and refine AI-powered agents in Microsoft Dynamics 365 [!INCLUDE [prod_short](../includes/prod_short.md)]. This transparency note outlines the system’s capabilities, limitations, and responsible use considerations to support informed and ethical adoption by our partner ecosystem.

### What is the Agent designer?

The Agent designer enables partners to prototype, run, and troubleshoot autonomous agents that can reason over [!INCLUDE [prod_short](../includes/prod_short.md)] data, automate workflows, and enhance user productivity. It provides a guided interface for iterating on agent instruction, access to [!INCLUDE [prod_short](../includes/prod_short.md)] entities, and relies on Azure OpenAI models.

This tool is intended for:

- ISVs and partners building their own agents in [!INCLUDE [prod_short](../includes/prod_short.md)]
- Solution architects exploring agent scenarios
- Developers testing prompt-based agent logic and workflows

## Capabilities

Agents operate in [!INCLUDE [prod_short](../includes/prod_short.md)] using AI to identify and complete tasks based on their instructions and user configuration. An agent acts and interacts with the UI similar to a user, where what they can access can also be limited by [!INCLUDE [prod_short](../includes/prod_short.md)]’s same, extensive controls for security and role-tailoring.

- Agent instructions  

  The agent gets high-level business instructions that define its purpose, outline the tasks it performs, and specify more considerations. These instructions are set in the agent code and aren't visible to users.

- Agent configuration  

  The agent is available directly within [!INCLUDE [prod_short](../includes/prod_short.md)]. You can configure and activate the agent and specify the users who can use the agent. In the Agent designer, there's no support for specifying extra configuration properties beyond the agent instruction prompt, permission, and user profile, and the general agent capabilities like language, locale, and time zone.

- Task execution and interaction  

  The agent operates based on its instructions and user configuration. The instructions describe its purpose, tasks, and high-level considerations for how to perform the flow. These instructions are defined in the agent code and aren't visible to users. The agent uses AI to identify and carry out the steps needed to complete its task within the B[!INCLUDE [prod_short](../includes/prod_short.md)] environment.  
  
  The agent interacts with the [!INCLUDE [prod_short](../includes/prod_short.md)] web client using the logical UI API. The agent can:  

  - Read data displayed on pages.
  - Access properties of UI elements, such as names, descriptions, fields, actions, and tooltips.
  - Combine this data with user-provided instructions.
  - Use AI and business knowledge to orchestrate the steps needed to complete each task.
  
- Access and permissions  

  An agent runs as an independent user in [!INCLUDE [prod_short](../includes/prod_short.md)] and is granted access only to the necessary parts of the product. It's configured with its own permission set and UI role (profile) that limits the parts of the product and UI elements (such as pages, fields, and actions) it can access. It then runs with the intersection of the permissions given to the agent with the permissions of the user that approved the task - or the user that configured the agent, if task approval wasn't required.

- Transparency and change control  

  The agent seeks user intervention in specific situations as instructed, such providing business review, approval for key operations, or requesting assistance for help.  
  
  [!INCLUDE [prod_short](../includes/prod_short.md)] maintains full transparency and provides control over changes made by the agent. The agent brings humans in the loop when their attention is required by issuing in-product notifications that are displayed on the role center. For example, a notification occurs when approval is instructed for important changes.  
  
  For each task performed by the agent, users get a detailed timeline that shows the key steps taken by the agent and human users, including the email conversation. Users can review this information and update the values and actions the agent suggested if needed. [!INCLUDE [prod_short](../includes/prod_short.md)] can also display the reasoning used by the agent and citations that led to a suggested value.

- Troubleshooting agents  

  A core part of exploring and prototyping agents in the Agent designer is the ability to understand what steps the agent performed when running, which data is used at each step, and what AI generated. To help with this, the Agent designer includes troubleshooting views.

## Use Cases

### Intended uses

The Agent designer is intended for [!INCLUDE [prod_short](../includes/prod_short.md)] partners to explore and prototype custom agents in [!INCLUDE [prod_short](../includes/prod_short.md)]. It can be used to design, implement, and deploy various use cases where generative AI is applied to solve specialized tasks in an automated way, such as:  

- Automating quote-to-order transitions

### Considerations when choosing a use case

We encourage partners to use the Agent designer in their innovative solutions or applications. However, here are some considerations when choosing a use case.

- Building features for customers that aren't yet running [!INCLUDE [prod_short](../includes/prod_short.md)] online

Agents in [!INCLUDE [prod_short](../includes/prod_short.md)] are intended for use with [!INCLUDE [prod_short](../includes/prod_short.md)] online, Microsoft's SaaS flavor of [!INCLUDE [prod_short](../includes/prod_short.md)]. 

- Use of AI platforms other than Azure OpenAI Service
- The Agent designer isn't intended for use with any other AI models other than Azure OpenAI Service. 

<br>
- Financial impact  

Because your AI features are attached to your Azure OpenAI Service key, you're responsible for the operating costs of Azure OpenAI resources throughout development, testing and when your customers use the feature in production or sandbox environments. For example, an AI feature that provides a handful of monthly suggestions to business owners will likely consume fewer resources and cost less. In contrast, an AI feature that generates a daily, two-page project summary for each employee will likely consume more resources and cost more.

- Use for non-AI use cases or nonbusiness use cases  

The Agent designer is built specifically to unlock the benefits and manage the challenges of autonomous agents in a business context. Using the Agent designer for other purposes, or personal use cases might erode customer trust and understanding of these experiences.

- Fully automated use cases  

Autonomous agents are intended to help support productivity and should be used with human-in-the-loop review. We acknowledge that AI systems aren't always correct and that careful review from humans is required to assess that generated output is accurate and appropriate. Use cases that fully automate processes without human oversight elevate the risk to stakeholders and place more accountability on the developer of the AI feature. For example, generating reminder emails and immediately sending those to thousands of contacts might result in recipients receiving inappropriate content that affects the customer's reputation.

- Sensitive use cases  

Some applications of AI can be sensitive and impactful on individuals and society, as well as on the partner that published the AI feature. For example:  

- The use or misuse of an AI feature that predicts when to service critical machinery might result in injury.
- The use or misuse of an AI feature that determines eligibility for education might infringe upon human rights.
- The use or misuse of an AI feature that ranks individuals’ access to social housing might have consequential impact to their life opportunities.

Sensitive use cases require increased attention throughout their development lifecycle. They might carry extra effort to satisfy any of your organization’s policies or regulations in the countries or regions, or industries in which they'll be deployed.

- Seek appropriate legal and professional advice  

We strongly recommend seeking legal advice from a specialist to understand the laws and regulations applicable to your use case. You're responsible for complying with all laws and regulations, including privacy, security, accessibility, and AI safety.

- **Language Support**: English is the primary supported language; user interactions in other languages might yield inconsistent results. In addition, agent instructions should be defined in English to ensure optimal accuracy.
- **User administration**: Agents aren't allowed to access and modify user configurations for security reasons. This includes permissions, user information, and profile assignment.

## What operational factors and settings allow for effective and responsible use of the feature?

- Access control and permissions

Agents can be granted access exclusively to specific parts of [!INCLUDE [prod_short](../includes/prod_short.md)] required to perform its designated tasks. The agent settings include predefined permissions and a user interface (UI) role, also known as a profile, that an administrator or configuring user can assign to the agent. This assignment restricts the agent's access to certain areas of the product. It defines the type of access (for example, whether the agent is only allowed to read specific data or also update or delete it) and determines which UI elements—such as pages, fields, actions, and FactBoxes—it can interact with.
We strongly encourage building and assigning permission sets and profile specific to the Agent, which can be assigned on the Agent card. This practice ensures that the agent only has access to the functionalities and data necessary for its role, enhancing both security and efficiency within the system.

- Transparency and notifications

[!INCLUDE [prod_short](../includes/prod_short.md)] users can maintain full transparency and control over the changes made by an agent by using other experiences that enable them to:
    - Receive notifications on the role center that come from the agent when it requires help or when the process demands human review. 
    - Get a better understanding of the specific task context and history (“timeline” view), including key steps involved in it.
    - Get a detailed review of each entity created by the agent that surfaces all changes and suggestions made by the agent within a specific task. This behavior allows users to review and adjust changes, and then agree on proceeding with the task.
    - Get an overview of the agent's key performance indicators (KPIs) that summarize the impact of the agent's work.  
Make sure you attend to the notifications raised by the agent to review and approve its work.

- All actions done by the agent, including creating and modifying records and calling actions, carry the agent's user ID. This user ID appears in the same places and in the same way as it does with other users, such as in list views, history, posted documents, notifications, and more.
- Approval workflows can be used to add an extra layer of control to the tasks done by the agent, as they do with other users. You can set up approval workflows to make the agent create a request for approval for a specific change. The change isn't allowed until another user approves the request. Learn more in [Use Approval Workflows](/dynamics365/business-central/across-how-use-approval-workflows).

## Limitations

### General limitations for AI models

It's important to understand that while AI systems are valuable tools, they're nondeterministic. This means that perfect accuracy of any generated content, suggestions, or insights isn't possible. Failure to understand this limitation can lead to over-reliance on the system and unmerited decisions that can impact any stakeholders including customers, their customers, and partners. Ensuring that any output of the AI model is weighted against human judgement and logic can help mitigate this risk. To learn more about common limitations associated with generative AI models, consult [Transparency Note for Azure OpenAI Service](/azure/ai-foundry/responsible-ai/openai/transparency-note?view=foundry-classic&context=%2Fazure%2Fai-services%2Fopenai%2Fcontext%2Fcontext&tabs=text#limitations).

## Eligible environments

> [!IMPORTANT]
> The feature is available only in sandbox environments for evaluation purposes at the current stage. The agents built in the Agent designer can't be deployed to a production environment yet.

## Limitations for specific industries, products, and topics

The Agent designer includes built-in safety mechanisms that prevent the undesirable generation of harmful content, such as sexually explicit content or incitement of violence. Sometimes, our customers operate in industries, sell products and services, or work with processes that naturally overlap with what might be considered inappropriate in other contexts, or work with data that might trigger these safeguards. The Agent designer might not perform as well in these cases. For example:

- an agent that generates project plans for testing of weapons might not be able to generate complete plans.
- an AI feature for a customer selling child psychology services might not be able to operate the feature.

Microsoft doesn't provide a mechanism for partners or customers to remove these specific safeguards or add topics to any inclusion list within [!INCLUDE [prod_short](../includes/prod_short.md)] at this time. The list of impacted topics are:

- Topics covering offensive material that might hurt or impact all or specific demographics, minorities, or children.
- Adult material and sexually explicit topics.
- Gambling.
- Drugs and harmful substances.
- Violence, physical and emotional harm.

Learn more in [Azure AI Content Safety](/azure/ai-foundry/openai/concepts/content-filter?view=foundry-classic&tabs=warning%2Cpython).

## Language and country/region limitations

The Agent designer itself doesn't determine the set of languages or environment localizations in which your agent feature is available. Mixed language input might result in lower-quality output because the system relies on pure string similarity, and the semantic part of the matching might not work properly.

## About languages and Large Language Models

Large Language Models are trained on large volumes of data in different languages, but the overall corpus of data isn't evenly distributed across all world languages. This behavior means your specific agent use case might be more successful in some languages than others. Check language quality independently for each use case, decide which languages to support for each use case, and clearly document supported languages. We recommend seeking appropriate legal and professional advice from a specialist to understand the laws and regulations applicable to your choice of languages.

## Language of agent instructions (prompts)

[!INCLUDE [prod_short](../includes/prod_short.md)]'s built-in safeguards are designed to work with agent instruction prompts that are in English language. These safeguards are less effective when the prompts you write, the data you include in your prompts, or the end-user prompts you include with your prompt to Azure OpenAI Service aren't in English.

## Agent designer extensibility

Agents created in the Agent designer aren't extensible. However, an agent is able to use and react to page fields added by extensions, if the agent has permissions and access via its assigned profile to those added fields.

## Evaluation of the Agent designer

### Evaluation methods and results

The toolkit is reviewed and tested throughout Microsoft's development lifecycle. It meets the requirements outlined in the [Responsible AI Standard](https://www.microsoft.com/ai/responsible-ai) that sets the bar for Microsoft's AI products and features.

In addition, the preview is aiming at evaluating success of the Agent designer through early adoption of the technology by select partner developers.

### Evaluating and integrating agents for your use

The Microsoft cloud runs on trust. Our fundamental promise to our customers is that their data is their data: it isn't used to train foundation AI models to the benefit of others, and it's protected by comprehensive enterprise compliance and security controls that they govern. Furthermore, Microsoft's AI systems are built on Responsible AI principles of fairness, reliability, safety, privacy, security, inclusiveness, transparency, and accountability.

To reduce time and effort to build responsible use cases, the Agent designer includes many built-in safeguards that reduce risk and impact to customers, their customers, and partners. However, each use case might come with unique challenges depending on the nature of that use case, the affected stakeholders, and how AI is applied. You're responsible for assessing and mitigating risks for your use cases. In some cases, resting on system safeguards might be insufficient.

## Working Responsible AI into your development practices

We recommend that partners adopt a similar process and criteria to the [Microsoft Responsible AI Standard](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE5cmFl) as a structured mechanism to build use cases responsibly. For example, you should:

- Assess the impact of your AI feature using the Microsoft Responsible AI Impact Assessment Template.
- Review the assessment with diverse stakeholders and subject matter experts (SMEs).
- Mitigate any identified risks by adjusting your use case requirements, design, implementation, and documentation after understanding which mitigations are already provided by the toolkit.
- Measure whether your mitigations are successful at reducing or deflecting risk.

## Learn more about responsible AI

[Microsoft AI principles](https://www.microsoft.com/ai/responsible-ai)  

[Microsoft responsible AI resources](https://www.microsoft.com/ai/tools-practices)  

[Microsoft Azure Learning courses on responsible AI](/ai/)
