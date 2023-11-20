---
title: Transparency note Developer tools for copilot in Business Central 
description: Concept description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: jswymer #Required; your GitHub user alias, with correct capitalization.
ms.author: jswymer #Required; your Microsoft alias; optional team alias.
ms.reviewer: jswymer #Required; Microsoft alias of content publishing team member.
ms.topic: FAQ
ms.collection: 
ms.date: 11/20/2023
ms.custom: bap-template
---

# Transparency note: Developer tools for copilot in Business Central  

## What is a Transparency Note? 

An AI system includes not only the technology, but also the people who will use it, the people who will be affected by it, and the environment in which it is deployed. Creating a system that is fit for its intended purpose requires an understanding of how the technology works, what its capabilities and limitations are, and how to achieve the best performance. Microsoft’s Transparency Notes are intended to help you understand how our AI technology works, the choices system owners can make that influence system performance and behavior, and the importance of thinking about the whole system, including the technology, the people, and the environment. You can use Transparency Notes when developing or deploying your own system, or share them with the people who will use or be affected by your system.  

Microsoft’s Transparency Notes are part of a broader effort at Microsoft to put our AI Principles into practice. To find out more, see the [Microsoft AI principles](https://www.microsoft.com/ai/responsible-ai). 

## The basics of Developer Tools for Copilot in Business Central  

### Introduction 

Microsoft Dynamics 365 Business Central is a comprehensive business management solution for small and midsized organizations. Copilot in Business Central is the AI-powered assistant that helps boost creativity and reduce tedious tasks across lines of business, such as finance, operations and marketing. 

Customers purchase Business Central through a network of software partners, who also customize the system to their needs via mature development tools in Visual Studio Code. From the very beginning, adaptability has been one of the core tenets of Business Central, and our community of partners across the world have built their business around this, tailoring the system to individual and changing customer needs, providing solutions in virtually all industries and geographies, selling add-ons at scale through the Microsoft AppSource store. Naturally, both partners and customers expect Copilot to be as adaptable as the rest of Business Central.  


Business Central's development platform includes an extension model, the proprietary AL language in Visual Studio Code, open-sourced components and business functionality, and diverse UI and APIs in which to seamlessly add capabilities to Business Central or connect to and from external services or data sources. Developer tools for Copilot in Business Central are a native part of this same platform and are based on Azure OpenAI Service, empowering partners to implement and deploy safer, enterprise-grade, generative AI capabilities for their customers. 

These tools are intended to accelerate development, integrate seamlessly, and provide common guard rails: any capability built using these tools is still required to meet its own privacy, compliance, security and Responsible AI criteria through its own individual assessment that covers the unique use case and nuances of that capability.  

Not only does this support our partner community, but many of Microsoft’s own Copilot features in Business Central are built using these same tools. 

### Key terms


|Terminology|Definition|
|-|-|
|toolkit|Short name for the Developer tools for Copilot in Business Central.|
|UI|Abbreviation for user-interface, which refers to the space where interactions between users and the system occur, like screens, pages, fields, and buttons of Business Central's browser client or mobile app.|

### Benefits 

With Business Central's flexible development platform, developers can implement AI from scratch using any AI platform, model or APIs. However, building upon the toolkit provides numerous benefits to both partners and customers. 

|Stakeholder|Benefits|
|-|-|
|Partners|<ul><li>Rapidly build prototypes to validate ideas within your team or with customers.</li><li>Attractive visual design with signature Microsoft Copilot experience that is seamless in Business Central's UI. </li><li>Build upon Microsoft's expertise in responsible AI to improve the safety of your features. </li><li>Reduced time and effort to bring your idea to market, resulting in new monetization and compete opportunities. </li></ul>|
|Customers|<ul><li>Seamlessness and consistency of experience across Copilot capabilities from different software vendors.</li><li>Safer Business Central capabilities, developed responsibly  </li><li>Centralized place to discover and control generative AI features from Microsoft and partners. </li></ul>|

## Capabilities 

### System components 

The toolkit allows developers to build generative AI features integrated into Business Central’s line-of-business functionality and includes the following components:  

- APIs 

   The APIs provide a convenient abstraction layer that wraps Azure OpenAI Service and reduces the amount of code that must be written in AL. Developers call this API with their own Azure OpenAI Service key that they obtain and manage. 

- Prompt Dialog 

   This a flexible, in-app UI window that’s designed for generative AI features that have distinct inputs and outputs. It exhibits the signature Microsoft AI visual elements, and Responsible AI controls such as the “AI generated” disclaimer.  

   <!--A screenshot of a computer-->

- Guidance 

   This component includes a “Hello world” code example and documentation that illustrates how to use the toolkit and promotes Responsible AI practices.  

- Feedback loop 

   End-users can choose to provide feedback on generative output that is then visible to partners and to Microsoft through the standard telemetry-based PowerBI report, along with statistics around usage and adoption. The feedback mechanism is a like and dislike button at the top of the page, which leads to the option to provide a reason before submitting.  
  
   <!--A screenshot of a computer-->

- Feature governance  

   Developers have a convenient way to funnel generative AI features into a single admin screen where customer admins can gain an overview of AI features available on that specific environment, manage compliance such as data movement across compliance boundaries, and also deactivate specific AI features that their organization isn’t ready to use.  

   <!--A screenshot of a computer-->

### Use cases 

#### Intended uses 

The toolkit is intended for Business Central partners to extend Copilot that is available with Business Central. It can be used to design, implement and deploy a variety of use cases where generative AI is applied to solve specialized tasks, such as: 

- Generating a project plan for a wind turbine manufacturing project. 
- Suggesting alternate available vehicles with similar attributes for a vehicle rental business. 
- Drafting a social media post based on active product campaigns for a specific product line. 

The following table provides additional details about the intended use: 
 
||Intended use|
|-|-|
|AI models |The toolkit APIs connect to Azure OpenAI Service models for Large Language Models and embeddings. |
|Typical use case |Ideal for specialized, single-task processes that have a well-defined problem or outcome. |
|User interaction |<ul><li>Windowed task inside Business Central (as opposed to alongside or outside Business Central).</li><li>Non-conversational (not a multi-turn chatbot interaction pattern).</li><li> User inputs and system outputs may be structured, such as well-defined fields.</li><li> User inputs and system outputs may be unstructured, such as freeform text.</li></ul> |
|Distribution|Features built using the toolkit are distributed as part of Business Central extensions. |
|Deployment|Features built using the toolkit are intended for Business Central online. | 

#### Considerations when choosing a use case 

We encourage partners to leverage the toolkit in their innovative solutions or applications. However, here are some considerations when choosing a use case. 

- Building features for customers that are not yet running Business Central online:

   Copilot in Business Central is intended for use with Business Central online, Microsoft’s SaaS flavor of Business Central. While Microsoft does not prevent partners from deploying and running their features to on-premises, Azure private cloud or other topologies, features built using the toolkit are not supported in these combinations. Some of the built-in guard rails such as protective metaprompts are not available on these topologies, increasing risk to stakeholders and increasing the effort for partners to mitigate those risks. 

- Using some but not all of the components

   The API and UI components of the toolkit are designed to work together to maximize value and safety. Using one but not all components may degrade the experience for customers, and may increase risk due to the availability of fewer guard rails. For example, using the UI but not the APIs as a means to work with other AI models such as DALL-E for image generation will not provide any metaprompt guard rails. 

- Use of AI platforms other than Azure OpenAI Service

   The toolkit is not intended for use with any other AI platforms other than Azure OpenAI Service.  

- Financial impact

   Because your AI features are attached to your Azure OpenAI Service key, you are responsible for the operating costs of Azure OpenAI resources throughout development, testing and when your customers use the feature in production or sandbox environments. For example, an AI feature that provides a handful of monthly suggestions to business owners will likely consume fewer resources and cost less. In contrast, an AI feature that generates a daily, 2-page project summary for each employee will likely consume more resources and cost more. 

- Use for non-AI use cases or non-business use cases

   The toolkit is built specifically to unlock the benefits and manage the challenges of generative AI in a business context. Using the UI components for other purposes, or using generative for personal use cases may erode customer trust and understanding of these experiences. 

- Fully automated use cases

   Copilot is the AI-powered assistant that is intentionally named copilot, not autopilot - we acknowledge that AI systems are not always correct and that careful review from humans is required to assess that generated output is accurate and appropriate. Use cases that fully automate processes without human oversight elevate the risk to stakeholders and place more accountability on the developer of the AI feature. For example, generating reminder emails and immediately sending those to thousands of contacts may result in recipients receiving inappropriate content that affects the customer’s reputation. 

- Sensitive use cases

   Some applications of AI can be particularly sensitive and impactful on individuals and society, as well as on the partner that published the AI feature. For example: 

   - The use or misuse of an AI feature that predicts when to service critical machinery may result in injury. 
   - The use or misuse of an AI feature that determines eligibility for education may infringe upon human rights. 
   - The use or misuse of an AI feature that ranks individuals’ access to social housing may have consequential impact to their life opportunities. 

   Sensitive use cases require increased attention throughout their development lifecycle and may carry additional effort to satisfy any of your organization’s policies or regulations in the countries, regions or industries in which they will be deployed. 

- Seek appropriate legal and professional advice

   We strongly recommend seeking legal advice from a specialist to understand the laws and regulations applicable to your use case. You are responsible for complying with all laws and regulations, including privacy, security, accessibility, and AI safety. 

## Limitations 

### General limitations for AI models 

It is important to understand that while AI systems are incredibly valuable tools, they are non-deterministic. This means that perfect accuracy of any generated content, suggestions or insights is not possible. Failure to understand this limitation can lead to over-reliance on the system and unmerited decisions that can impact any stakeholders including customers, their customers, and partners. Ensuring that any output of the AI model is weighted against human judgement and logic can help mitigate this risk. 

### Limitations for specific industries, products and topics  

### Language and country/region limitations  

The toolkit itself does not impose limits on the set of languages or environment localizations in which your AI feature is available. Similarly, the toolkit does not define or limit which Azure OpenAI Service endpoints you deploy and connect to. Partner developers fully control these aspects of their AI features, and are responsible for ensuring both quality and compliance. 

#### About language 

Large Language Models are trained on large volumes of data in different languages, but the overall corpus of data is not evenly distributed across all world languages. This means your specific use case may be more successful in some languages than others. We recommend that partners verify language quality independently for each use case, to determine which languages each use case will be made available. Language availability is regulated in some countries such as Canada: we recommend seeking appropriate legal and professional advice from a specialist to understand the laws and regulations applicable to your choice of languages. 

#### About Azure OpenAI Service endpoints 

Business Central includes an administrative screen for Copilot that provides customer admins with transparency and control over generative AI features in their specific environment. Business Central does not distinguish between partner or Microsoft-built features in terms of how they connect to Azure OpenAI Service outside of the customer’s compliance boundary. You are responsible for ensuring that you deploy Azure OpenAI Service endpoints in the same regions as Microsoft, so that customer admins have a simple mechanism to provide their consent for data to flow beyond the compliance boundary where applicable. 

## System guard rails 

The Microsoft cloud runs on trust. Our fundamental promise to our customers is that their data is their data: it is not used to train foundation AI models to the benefit of others, and it is protected by the most comprehensive enterprise compliance and security controls that they govern. Furthermore, Microsoft’s AI systems are built on Responsible AI principles of fairness, reliability, safety, privacy, security, inclusiveness, transparency and accountability. When using the toolkit to implement and deploy your use cases, you have an opportunity to exhibit these same values. 

To reduce time and effort to build responsible use cases, the toolkit provides numerous, built-in safeguards that reduce risk and impact to customers, their customers and partners. However, each use case may come with unique challenges depending on the nature of that use case, the affected stakeholders, and how AI is applied. You are responsible for assessing and mitigating risks for your use cases. 

### Working Responsible AI into your workflow 

We recommend that partners adopt a similar process and criteria to the [Microsoft Responsible AI Standard](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE5cmFl) as a structured mechanism to build use cases responsibly. For example, you should 

- **Assess** the impact of your AI feature using the [Microsoft Responsible AI Impact Assessment Template](https://blogs.microsoft.com/wp-content/uploads/prod/sites/5/2022/06/Microsoft-RAI-Impact-Assessment-Template.pdf). 
- **Review** the assessment with diverse stakeholders and SMEs. 
- **Mitigate** any identified risks by adjusting your use case requirements, design, implementation and documentation after understand which mitigations are already provided by the toolkit. 
- **Measure** whether your mitigations are successful at reducing or deflecting risk. 

### Best practices for responsible AI 

## Evaluation of the toolkit 

### Evaluation methods and results 

The toolkit is reviewed and tested throughout Microsoft's development lifecycle and is designed to meet the requirements outlined in the [Microsoft Responsible AI Standard](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE5cmFl) that sets the bar for Microsoft's AI products and features. Evaluating success of the toolkit was primarily conducted through early adoption of the technology by select partner developers, as well as rigorous red team test exercises with hundreds of example prompts to verify that built-in guard rails are able to mitigate risk. 

Early adoption of the toolkit by select partner developers across different skill levels indicates that the toolkit is successful in reducing effort and delivering a seamless experience as intended, with the user experience successfully drawing user attention towards review of generated content. 

Prompt guard rails indicate a high (>95%) success rate at deflecting risks such as harmful content and prompt injection. 

## Learn more about responsible AI 

[Microsoft AI principles](https://www.microsoft.com/en-us/ai/responsible-ai) 

[Microsoft responsible AI resources](https://www.microsoft.com/en-us/ai/tools-practices) 

[Microsoft Azure Learning courses on responsible AI](/ai/)

## Learn more about Developer Tools for Copilot in Business Central 

[Developer tools for copilot in Business Central](../developer/ai-integration-landing-page.yml)  


<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
