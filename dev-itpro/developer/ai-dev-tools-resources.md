---
title: Use developer tools for Copilot in Business Central ai resources 
description: Learn how you can use the developer tools for Copilot in Business Central ai resources in your extensions to create Copilot experiences in Business Central
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: how-to
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 03/06/2025
ms.custom: bap-template
---
# Business Central AI Dev Tools subscription
A key feature of the Business Central Developer Tools for Copilot (BC AI Dev Tools) is that Business Central AppSource publishers (ISVs) can leverage Large Language Models (LLMs) via Microsoft-managed Azure OpenAI instances. This approach eliminates the need for ISVs to independently procure and manage their own Azure OpenAI subscriptions for customers. However, if an ISV has special needs that are not fulfilled in the Business Central AI Dev Tools subscription, they can still bring their own subscription (BYO) to customers. 
 
## Benefits of relying on the Business Central AI Dev Tools subscription for customers
Utilizing the toolkit subscription provides several benefits, including:
* Reduced Operational Overhead: Avoid the need to handle infrastructure management, updates, monitoring, troubleshooting or maintenance of custom Azure OpenAI subscriptions, freeing up resources to focus on core business operations and providing value-adding IP to customers.
* Simplified Onboarding: Quickly integrate AI capabilities into your solutions without needing to navigate the complexities of setting up and managing your own Azure OpenAI subscription.
* Improved Reliability: Proactive scaling, throttling, load balancing, and fault tolerance measures, ensuring consistent performance during peak demand.
* Enhanced Security Compliance: Built-in compliance measures and governance, including robust protection from malicious and harmful content, ensuring compliance with data residency requirements, reducing the burden of ensuring regulatory compliance for ISVs.
* Streamlined experience for customers: customers will experience a more seamless AI resource management process, avoiding the need to maintain different configurations for separate ISV solutions.

## Consumption-based billing of customers when using the Business Central AI Dev Tools subscription  
Additionally, this capability deliver a cohesive AI consumption tracking and billing experience for Business Central customers. Customers using AI resources across multiple AI-enabled ISV solutions built with BC AI Dev Tools will benefit from a unified approach to AI consumption monitoring and invoicing, avoiding the need to reconcile multiple invoices or metrics from separate ISVs. 

This allows customers to: 
* Track AI consumption at a granular level, per ISV solution and AI capability.
* Receive a consolidated invoice for AI consumption, expressed through a generic metric rather than LLM tokens.
 
> [!NOTE]  
> It is important to note that this new AI consumption billing mechanism is not intended to replace the existing AppSource monetization pathway for Business Central apps. Instead, it serves as an additional option to simplify AI consumption for customers and partners, with the AppSource monetization option available to ISVs to monetize their 
IP.

## Use your own subscription with customers
For the vast majority of ISVs, the default Business Central AI Dev Tools subscription will be enough, However, if you have special needs that are not fulfilled in the Business Central AI Dev Tools subscription, such as specific models incl fine-tuned ones, you can bring your own subscription (BYO) to customers. It that case, the ISV is responsible for the deployment, maintenance, scaling and security of the service - as well as billing of AI resources to customers.

## Differences between toolkit ai resources and your own subscription
By using the developer toolkit, partners can easily get access to AI resources when they extend Copilot in Business Central. While these AI resources are the same as what is being used for base application Copilot features, and are thus the ddefault and recommended approach, partners might have special requirements that require them to use their own or customer owned Azure OpenAI subscription when running the feature in production. Below provides an overview of the major differences between using the AI resources in the toolkit and using your own Azure OpenAI subscription and model deployment. 
<br><br>

|Area|Toolkit AI resources|Using your own subscription|
   |-|-|-|
   |Deployemnt|Microsoft manages the AI resources. <br><br>We ask you to have an active Azure OpenAI subscription for sign-up, but no model. | You must handle deploying models, keep them up to date, set up Azure subscriptions, calculate billing, split billing across customers that share the same subscription, manage spending limits, provide usage statistics, take care of geography and data residency, etc. <br><br>You are charged for deployed models even if they are not used|
   |Models|Production-ready models available (today GPT4o and GPT4o mini, more in the future). <br><br> Get notified via dev telemetry when new models are coming, and old models are obsoleted. <br><br>Embeddings not yet available|All Azure OpenAI models available. <br><br>Follow Azure OpenAI model deprecation timelines. <br><br>Embeddings and fine tuning available depending on your model|
   |Responsible AI|Azure OpenAI content filters (pre-defined by the Business Central team). <br><br>Microsoft additions to system prompts, same as first party|Azure OpenAI content filters. <br><br>Microsoft additions to system prompts, same as first party, in Saas; OnPrem you need to write your own|
   |Environments|SaaS only|Can be used in SaaS, as well as for testing in OnPrem and containers|
   |Billing|You charge the customer for your IP, Microsoft charges the customer when they use AI|-|

## Use your own subscription for development
The Business Central AI Dev Tools subscription can only be used in customer production environments. Thus it is recommended that ISVs create and use their own Azure OpenAI subscription(s) as part of non-customer usage, e.g., when prototyping, developing, testing and supporting AI capabilities. 

> [!NOTE]  
> To use the Business Central AI Dev Tools subscription in an app, the ISV must provide information about their own Azure OpenAI subscription for registration purposes.

The Business Central AI Dev Tools easily allows conditionally branching on the Azure OpenAI subscription used, e.g., using the Business Central AI Dev Tools subscription when running in customer environments and the ISVs own for the rest.

## Code example
[example]
