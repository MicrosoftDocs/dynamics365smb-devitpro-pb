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
# Business Central AI Resources
A key feature of the Business Central Developer Tools for Copilot (BC AI Dev Tools) is that Business Central partners can leverage Large Language Models (LLMs) via Microsoft-managed Azure OpenAI resources. This approach eliminates the need to independently procure and manage Azure OpenAI subscriptions for customers. 

Using the Business Central AI resources is the default and recommended approach. However, some partners or customers might have special requirements that require them to use their own Azure OpenAI (AOAI) subscription, when running the feature in production, which is also supported in the Business Central AI Dev Tools.
 
## Benefits of relying on the Business Central AI resources
Utilizing the AI resources provides several benefits, including:
* Reduced Operational Overhead: Avoid the need to handle infrastructure management, updates, monitoring, troubleshooting or maintenance of custom Azure OpenAI subscriptions, freeing up resources to focus on core business operations and providing value-adding IP to customers.
* Simplified Onboarding: Quickly integrate AI capabilities into your solutions without needing to navigate the complexities of setting up and managing your own Azure OpenAI subscription.
* Improved Reliability: Proactive scaling, throttling, load balancing, and fault tolerance measures, ensuring consistent performance during peak demand.
* Enhanced Security Compliance: Built-in compliance measures and governance, including robust protection from malicious and harmful content, ensuring compliance with data residency requirements, reducing the burden of ensuring regulatory compliance for ISVs.
* Streamlined experience for customers: customers will experience a more seamless AI resource management process, avoiding the need to maintain different configurations for separate ISV solutions.

## Consumption-based customer billing when using Business Central AI resources  
Additionally, this capability deliver a cohesive AI consumption tracking and billing experience for Business Central customers. Customers using AI resources across multiple AI-enabled solutions built with Business Central AI Dev Tools will benefit from a unified approach to AI consumption monitoring and invoicing, avoiding the need to reconcile multiple invoices or metrics from separate ISVs. 

This allows customers to: 
* Track AI consumption at a granular level, per Copilot feature.
* Receive a consolidated invoice for AI consumption
 
> [!NOTE]  
> It is important to note that the AI consumption billing mechanism is not intended to replace the existing AppSource monetization pathway for Business Central apps. Instead, it serves as an additional option to simplify AI consumption for customers and partners, with the AppSource monetization option available to ISVs to monetize their 
IP.

## Use your own subscription with customers
For the vast majority of ISVs, the default Business Central AI resources will be enough, However, if you have special needs that are not fulfilled with the Business Central AI resources, such as specific models incl fine-tuned ones, you can bring your own (BYO) subscription to customers. It that case, the ISV is responsible for the deployment, maintenance, scaling and security of the service - as well as billing of AI resources to customers.

## Differences between Business Central AI resources and custom Azure OpenAI subscriptions
By using the developer toolkit, partners can easily get access to AI resources when they extend Copilot in Business Central. While these AI resources are the same as what is being used for base application Copilot features, and are the default and recommended approach, partners might have special requirements that require them to use their own or customer owned Azure OpenAI (AOAI) subscription when running the feature in production. Below provides an overview of the major differences between using the AI resources in the toolkit and using your own Azure OpenAI subscription and model deployment. 
<br><br>

|Area|Business Central AI resources|Your own AOAI subscription|
   |-|-|-|
   |Deployment|Microsoft manages the AI resources. <br><br>We ask you to have an active Azure OpenAI subscription for sign-up, but no model. | You must handle deploying models, keep them up to date, set up Azure subscriptions, take care of geography and data residency, etc. <br><br>You are charged for deployed models even if they are not used|
   |Models|Production-ready models available (today GPT4o and GPT4o mini, more in the future). <br><br> Get notified via dev telemetry when new models are coming, and old models are obsoleted. <br><br>Embeddings not yet available|All Azure OpenAI models available. <br><br>Follow Azure OpenAI model deprecation timelines. <br><br>Embeddings and fine tuning available depending on your model|
   |Responsible AI|Azure OpenAI content filters (pre-defined by the Business Central team). <br><br>Microsoft additions to system prompts, same as first party|Azure OpenAI content filters. <br><br>Microsoft additions to system prompts, same as first party, in Saas; OnPrem you need to write your own|
   |Environments|SaaS only|Can be used in SaaS, as well as for testing in OnPrem and containers|
   |Billing|Microsoft charges the customer when they use AI. <br><br> Customers can track usage, set limits, and get a single, detailed invoice across Copilot features that use the toolkit ai resources <br><br>You charge the customer for your IP|You must track billing, split billing if multipel customers share the same subscription, manage spending limits, provide usage statistics etc|


## Using the Business Central AI resources and your own subscription in AL
The default and recommended approach is to use the toolkit AI resources when extending Copilot in Business Central. The only thing you need to do for this is to authenticate with the SetManagedResourceAuthorization method in the AI Module AzureOpenAI codeunit. As part of this, you also need to provide your own AzureOpenAI subscription details, but this will not be used.

```al
// Example of using the default toolkit ai resources in AL 
AzureOpenAI.SetManagedResourceAuthorization(Enum::"AOAI Model Type"::"Chat Completions",AzureOpenAIAccountName,AzureOpenAIApiKey,AOAIDeployments.GetGPT4oLatest());
```

If you instead want to use your own subscription, you need to authenticate with that using the SetAuthorization method.

```al
// Example of using your own Azure OpenAI subscription in AL 
AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions",GetEndpoint(),GetDeployment(),GetApiKey());
```


## Use your own subscription during development
The Business Central AI resources can only be used in customer production environments. Thus it is recommended that partners create and use their own Azure OpenAI subscription(s) as part of non-customer usage, e.g., when prototyping, developing, testing and supporting AI capabilities. 

> [!NOTE]  
> To use the Business Central AI resources in an app, the partner must provide information about their own Azure OpenAI subscription for registration purposes.

The Business Central AI Dev Tools easily allows conditionally branching on the Azure OpenAI subscription used, e.g., using the Business Central AI resources when running in customer environments and a custom Azure OpenAI subscription for the rest.

#### Code snippet

The following code snippet demonstrates how to use the EnvironmentInformation to use a custom Azure OpenAI subscription during prototyping, developing and testing, and the Business Central AI resources in customers production environments.


```al
If not EnvironmentInformation.IsSaaSInfrastructure() then
    AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions",GetEndpoint(),GetDeployment(),GetApiKey());
else
    AzureOpenAI.SetManagedResourceAuthorization(Enum::"AOAI Model Type"::"Chat Completions",AzureOpenAIAccountName,AzureOpenAIApiKey,AOAIDeployments.GetGPT4oLatest());
```

## Samples
You can find further AL code examples on using and calling LLM resources in the samples on https://aka.ms/BCTech, under samples > AzureOpenAI.