---
title: Transparency note Machine Learning APIs for Business Central  
description: Understand how our AI technology works with regards to Machine Learning APIs, the choices system owners can make that influence system performance and behavior, and the importance of thinking about the whole system, including the technology, the people, and the environment
author: andreipanko 
ms.author: solsen 
ms.reviewer: solsen
ms.topic: faq
ms.collection:
  - bap-ai-copilot 
ms.date: 11/15/2024
ms.custom: bap-template
---

# Transparency note: Machine Learning APIs for Business Central  

## What is a Transparency Note? 

An AI system includes not only the technology, but also the people who will use it, the people who will be affected by it, and the environment in which it is deployed. Creating a system that is fit for its intended purpose requires an understanding of how the technology works, what its capabilities and limitations are, and how to achieve the best performance. Microsoft's Transparency Notes are intended to help you understand how our AI technology works, the choices system owners can make that influence system performance and behavior, and the importance of thinking about the whole system, including the technology, the people, and the environment. You can use Transparency Notes when developing or deploying your own system, or share them with the people who will use or be affected by your system.

Microsoft's Transparency Notes are part of a broader effort at Microsoft to put our AI Principles into practice. To find out more, see the [Microsoft AI principles](https://aka.ms/RAI).

## The basics of Machine Learning APIs for  Business Central  

### Introduction 

Microsoft Dynamics 365 Business Central is a comprehensive business management solution for small and midsized organizations. Customers purchase Business Central through a network of software partners, who also customize the system to their needs via mature development tools in Visual Studio Code. From the very beginning, adaptability has been one of the core tenets of Business Central, and our community of partners across the world have built their business around this, tailoring the system to individual and changing customer needs, providing solutions in virtually all industries and geographies, selling add-ons at scale through the Microsoft AppSource store. Naturally, both partners and customers expect Copilot to be as adaptable as the rest of Business Central.

Business Central’s development platform includes an extension model, the proprietary AL (Application Language) programming language in Visual Studio Code, open-sourced components and business functionality, and diverse UI and APIs in which to add capabilities to Business Central or connect to and from external services or data sources. Machine Learning APIs for Business Central are a native part of this same platform  empowering partners to implement and deploy safer, enterprise-grade, AI capabilities for their customers.

These APIs are intended to accelerate development, integrate seamlessly, and provide common safety guard rails. Any capability built using these APIs is still required to meet its own privacy, compliance, security and Responsible AI criteria through its own individual assessment that covers the unique use case and nuances of that capability. 

Not only does this support our partner community, but many of Microsoft’s own features in Business Central are built using these same tools.  

### Key terms

|Terminology|Definition|
|-|-|
|API|Short name for the Machine Learning APIs for  Business Central .|
|UI|Abbreviation for user-interface, which refers to the space where interactions between users and the system occur, like screens, pages, fields, and buttons of Business Central's browser client or mobile app.|

## Capabilities

### System components

The APIs allows developers to build machine learning features (non-generative AI) integrated into Business Central's line-of-business functionality and deploy them as Business Central extensions to Business Central online. The following components are included:

- **APIs**

   The APIs provide a convenient abstraction layer that wraps Machine Learning models - Forecasting Model and Prediction Model and reduces the amount of code that must be written in AL for forecasting of time series or classification task. 

- **Resources**

   For Business Central online, the models are deployed by Microsoft and connected to the Microsoft subscription. For other deployment options, you have to create Machine Learning resources in your own Azure subscription. You can find sample steps in the [sample repo](https://github.com/microsoft/BCTech/tree/master/samples/MachineLearning).

- **Guidance**

   This component includes a "Hello world" code example and documentation that illustrates how to use the APIs.  

### Use cases

#### Intended uses

The toolkit is intended for Business Central partners to extend Business Central. It can be used to design, implement and deploy a variety of use cases where machine learning (non-generative AI) is applied to solve specialized tasks, such as:

- Forecast sales, usage, cash flow, returns.
- Predict customer churn, quote conversion, shipment delay.

#### Considerations when choosing a use case

We encourage partners to leverage the APIs in their innovative solutions or applications. However, here are some considerations when choosing a use case.

- Financial impact

   When depend on models deployed by Microsoft be aware about available capacity and usage.

   If your API features are attached to models in your subscription, you are responsible for the operating costs of Azure MAchine Learning resources throughout development, testing and when your customers use the feature in production or sandbox environments.

- Sensitive use cases

   Some applications of AI can be particularly sensitive and impactful on individuals and society, as well as on the partner that published the AI feature. For example:

   - The use or misuse of an AI feature that predicts when to service critical machinery may result in injury.
   - The use or misuse of an AI feature that determines eligibility for education may infringe upon human rights.
   - The use or misuse of an AI feature that ranks individuals’ access to social housing may have consequential impact to their life opportunities.

   Sensitive use cases require increased attention throughout their development lifecycle and may carry additional effort to satisfy any of your organization’s policies or regulations in the countries, regions, or industries in which they will be deployed.

- Seek appropriate legal and professional advice

   We strongly recommend seeking legal advice from a specialist to understand the laws and regulations applicable to your use case. You are responsible for complying with all laws and regulations, including privacy, security, accessibility, and AI safety. 

## Limitations

### General limitations for AI models

It is important to understand that while AI systems are valuable tools, they are non-deterministic. This means that perfect accuracy of any generated content, suggestions or insights is not possible. Failure to understand this limitation can lead to over-reliance on the system and unmerited decisions that can impact any stakeholders including customers, their customers, and partners. Ensuring that any output of the AI model is weighted against human judgement and logic can help mitigate this risk.

### Country/region limitations  

The API itself does not determine the environment localizations in which your AI feature is available. If your API features are attached to models in your subscription, then partner developers fully control these aspects of their AI features, and are responsible for ensuring both quality and compliance.

## Evaluation of the APIs

### Evaluation methods and results

The APIs are reviewed and tested throughout Microsoft's development lifecycle and is designed to meet the requirements outlined in the [Responsible AI Standard](https://blogs.microsoft.com/wp-content/uploads/prod/sites/5/2022/06/Microsoft-Responsible-AI-Standard-v2-General-Requirements-3.pdf) that sets the bar for Microsoft's AI products and features.

## Evaluating and integrating API for your use

The Microsoft cloud runs on trust. Our fundamental promise to our customers is that their data is their data: it is not used to train underliyng MAchine Learninig  models to the benefit of others, and it is protected by comprehensive enterprise compliance and security controls that they govern. Furthermore, Microsoft's AI systems are built on Responsible AI principles of fairness, reliability, safety, privacy, security, inclusiveness, transparency and accountability. 

### Working Responsible AI into your development practices

We recommend that partners adopt a similar process and criteria to the [Microsoft Responsible AI Standard](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE5cmFl) as a structured mechanism to build use cases responsibly. For example, you should:

- Assess the impact of your AI feature using the [Microsoft Responsible AI Impact Assessment Template](https://aka.ms/RAIImpactAssessmentTemplatePDF).
- Review the assessment with diverse stakeholders and SMEs.
- Mitigate any identified risks by adjusting your use case requirements, design, implementation and documentation.
- Measure whether your mitigations are successful at reducing or deflecting risk.

## Learn more about responsible AI 

[Microsoft AI principles](https://www.microsoft.com/en-us/ai/responsible-ai)

[Microsoft responsible AI resources](https://www.microsoft.com/en-us/ai/tools-practices)

[Microsoft Azure Learning courses on responsible AI](/ai/)

## About this document 

© 2024 Microsoft Corporation. All rights reserved. This document is provided "as-is" and for informational purposes only. Information and views expressed in this document, including URL and other Internet Web site references, may change without notice. You bear the risk of using it. Some examples are for illustration only and are fictitious. No real association is intended or inferred. 

This document is not intended to be, and should not be construed as providing legal advice. The jurisdiction in which you’re operating may have various regulatory or legal requirements that apply to your AI system. Consult a legal specialist if you are uncertain about laws or regulations that might apply to your system, especially if you think those might impact these recommendations. Be aware that not all of these recommendations and resources will be appropriate for every scenario, and conversely, these recommendations and resources may be insufficient for some scenarios. 

Published: June 2024

Last updated: June 2024
