---
title: Use developer tools for Copilot in Business Central AI resources 
description: Learn how you can use the developer tools for Copilot in Business Central AI resources in your extensions to create Copilot experiences in Business Central
author: pborring
ms.author: solsen
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 03/27/2025
---

# Business Central AI resources

A key feature of the [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot is that [!INCLUDE [prod_short](includes/prod_short.md)] partners can use Large Language Models (LLMs) via Microsoft-managed Azure OpenAI resources. This approach eliminates the need to independently procure and manage Azure OpenAI subscriptions for customers.

Using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources is the default and recommended approach.

Some partners or customers might have special requirements that require them to use their own Azure OpenAI (AOAI) subscription, when running the feature in production, which is also supported in [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot.
 
## Benefits of relying on the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources

Using the AI resources provides several benefits, including:

- Reduced operational overhead: Avoid the need to handle infrastructure management, updates, monitoring, troubleshooting, or maintenance of custom Azure OpenAI subscriptions, freeing up resources to focus on core business operations and providing value-adding IP to customers.
- Simplified onboarding: Quickly integrate AI capabilities into your solutions without having to navigate the complexities of setting up and managing your own Azure OpenAI subscription.
- Improved reliability: Proactive scaling, throttling, load balancing, and fault tolerance measures, ensuring consistent performance during peak demand.
- Enhanced security compliance: Built-in compliance measures and governance, including robust protection from malicious and harmful content, ensuring compliance with data residency requirements, reducing the burden of ensuring regulatory compliance for ISVs.
- Streamlined experience for customers: customers experience a more seamless AI resource management process, avoiding the need to maintain different configurations for separate ISV solutions.

## Consumption-based customer billing when using [!INCLUDE [prod_short](includes/prod_short.md)] AI resources

By using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources, you can deliver a cohesive AI consumption tracking and billing experience for [!INCLUDE [prod_short](includes/prod_short.md)] customers. Customers using AI resources across multiple AI-enabled solutions built with [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot benefit from a unified approach to AI consumption monitoring and invoicing, avoiding the need to reconcile multiple invoices or metrics from separate ISVs.

This allows customers to:

- Track AI consumption at a granular level, per Copilot feature.
- Receive a consolidated invoice for AI consumption.


 
> [!NOTE]  
> It's important to note that the AI billing model isn't intended to replace the existing AppSource monetization pathway for [!INCLUDE [prod_short](includes/prod_short.md)] apps. Instead, it serves as another option to simplify AI consumption for customers and partners, with the AppSource monetization option available to ISVs to monetize their intellectual property (IP). <!-- link to more info? -->

## Use your own subscription with customers

For most ISVs, the default [!INCLUDE [prod_short](includes/prod_short.md)] AI resources are enough, However, if you have needs that aren't fulfilled with the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources, such as specific models including fine-tuned ones, you can bring your own (BYO) subscription to customers. If that's the case, the ISV is responsible for the deployment, maintenance, scaling, and security of the service - and the billing of AI resources to customers.

## Differences between [!INCLUDE [prod_short](includes/prod_short.md)] AI resources and custom Azure OpenAI subscriptions

By using the [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot, partners can easily get access to AI resources when they extend Copilot in [!INCLUDE [prod_short](includes/prod_short.md)]. While these AI resources are the same as what's being used for base application Copilot features, and are the default and recommended approach, partners might have special requirements that require them to use their own or customer-owned Azure OpenAI (AOAI) subscription when running the feature in production. The following section provides an overview of the major differences between using the AI resources in the toolkit and using your own Azure OpenAI subscription and model deployment.
<br><br>

|Area|Business Central AI resources|Your own AOAI subscription|
|----|-----------------------------|--------------------------|
|Deployment|Microsoft manages the AI resources. <br><br>We ask you to have an active Azure OpenAI subscription for sign-up, but no model. | You must handle deploying models, keep them up to date, set up Azure subscriptions, take care of geography and data residency, etc. <br><br>You're charged for deployed models even if they aren't used.|
|Models|Production-ready models available (today GPT4o and GPT4o mini, more in the future). <br><br> Get notified via developer telemetry when new models are coming, and old models are obsoleted. <br><br>Embeddings aren't yet available.|All Azure OpenAI models are available. <br><br>Follow Azure OpenAI model deprecation timelines. <br><br>Embeddings and fine tuning are available depending on your model.|
|Responsible AI|Azure OpenAI content filters (predefined by Business Central). <br><br>Microsoft additions to system prompts, same as first party.|Azure OpenAI content filters. <br><br>Microsoft additions to system prompts, same as first party in Saas; on-premises you need to write your own.|
|Environments|SaaS only|Can be used in SaaS, and for testing in on-premises and containers.|
|Billing|Microsoft charges the customer when they use AI. <br><br> Customers can track usage, set limits, and get a single, detailed invoice across Copilot features that use the toolkit AI resources. <br><br>You charge the customer for your IP.|You must track billing, split billing if multiple customers share the same subscription, manage spending limits, provide usage statistics etc.|

## Using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources and your own subscription in AL

The default and recommended approach is to use the developer toolkit AI resources when extending Copilot in [!INCLUDE [prod_short](includes/prod_short.md)]. All you need to do is to authenticate with the `SetManagedResourceAuthorization` method in the [AI Module AzureOpenAI](/dynamics365/business-central/application/system-application/codeunit/system.ai.azure-openai) codeunit. As part of this, you also need to provide your own AzureOpenAI subscription details, but this won't be used.

```al
// Example of using the default toolkit AI resources in AL 
AzureOpenAI.SetManagedResourceAuthorization(Enum::"AOAI Model Type"::"Chat Completions",AzureOpenAIAccountName,AzureOpenAIApiKey,AOAIDeployments.GetGPT4oLatest());
```

If you instead want to use your own subscription, whether for customer, or just when you developer or test, you must authenticate with your own subscription using the `SetAuthorization` method.

```al
// Example of using your own Azure OpenAI subscription in AL 
AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions",GetEndpoint(),GetDeployment(),GetApiKey());
```

## Use your own subscription during development

The [!INCLUDE [prod_short](includes/prod_short.md)] AI resources can only be used in customer production environments. Therefore, it's recommended that partners create and use their own Azure OpenAI subscriptions as part of noncustomer usage, for example, when prototyping, developing, testing, and supporting AI capabilities.

> [!NOTE]  
> To use the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources in an app, the partner must provide information about their own Azure OpenAI subscription for registration purposes.

The [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot easily allow conditionally branching on the Azure OpenAI subscription used, for example, using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources when running in customer environments and a custom Azure OpenAI subscription for the rest.

### Code snippet

The following code snippet demonstrates how to use the `EnvironmentInformation` to use a custom Azure OpenAI subscription during prototyping, developing, and testing, and the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources in customers production environments.

```al
If not EnvironmentInformation.IsSaaSInfrastructure() then
    AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions",GetEndpoint(),GetDeployment(),GetApiKey());
else
    AzureOpenAI.SetManagedResourceAuthorization(Enum::"AOAI Model Type"::"Chat Completions",AzureOpenAIAccountName,AzureOpenAIApiKey,AOAIDeployments.GetGPT4oLatest());
```

## Samples

You can find further AL code examples on using and calling LLM resources on [https://aka.ms/BCTech](https://github.com/microsoft/BCTech/tree/master/samples/AzureOpenAI).

## Related information

[Integrating AI using Developer Tools for Copilot](ai-integration-landing-page.yml)  