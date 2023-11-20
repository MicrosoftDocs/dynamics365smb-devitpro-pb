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

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
