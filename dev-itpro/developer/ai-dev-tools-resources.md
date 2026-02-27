---
title: Use developer tools for Copilot in Business Central AI resources 
description: Learn how you can use the developer tools for Copilot in Business Central AI resources in your own Marketplace extensions to create Copilot experiences in Business Central
author: pborring
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 08/27/2025
ms.update-cycle: 180-days
---

# Business Central AI resources (preview)

[This article is prerelease documentation and is subject to change.]

A key feature of the [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot is that [!INCLUDE [prod_short](includes/prod_short.md)] partners can use Large Language Models (LLMs) via Microsoft-managed Azure OpenAI resources for their Marketplace extensions that extend Copilot in Business Central. This approach eliminates the need to independently procure and manage Azure OpenAI subscriptions for customers.

Using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources is the default and recommended approach.

In certain cases, partners or customers might need to use their own Azure OpenAI (AOAI) subscription for production environments, or when developing and testing in sandbox environments. [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot fully support this option when specific requirements make it necessary.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-d365.md)]

## Supported models

The following Azure OpenAI models are supported when using the [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot and [!INCLUDE [prod_short](includes/prod_short.md)] AI resources.

|Azure OpenAI model|Supported|
|------------------|---------|
|GPT-4.1|Yes|
|GPT-4.1-mini|Yes|

You can read more about each of the models here [Azure OpenAI Models](/azure/ai-services/openai/concepts/models?tabs=global-standard%2Cstandard-chat-completions).

## Benefits of relying on the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources

Using the AI resources provides several benefits, including:

- *Reduced operational overhead*  
Avoid the need to handle infrastructure management, updates, monitoring, troubleshooting, or maintenance of custom Azure OpenAI subscriptions, freeing up resources to focus on core business operations and providing value-adding IP to customers.
- *Simplified onboarding*  
Quickly integrate AI capabilities into your solutions without having to navigate the complexities of setting up and managing your own Azure OpenAI subscription.
- *Improved reliability*  
Proactive scaling, throttling, load balancing, and fault tolerance measures, ensuring consistent performance during peak demand.
- *Enhanced security compliance*  
Built-in compliance measures and governance, including robust protection from malicious and harmful content, ensuring compliance with data residency requirements, reducing the burden of ensuring regulatory compliance for ISVs.
- *Streamlined experience for customers*  
Customers experience a more seamless AI resource management process, avoiding the need to maintain different configurations for separate ISV solutions.

## Consumption-based customer billing when using [!INCLUDE [prod_short](includes/prod_short.md)] AI resources

By using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources, you can deliver a cohesive AI consumption tracking and billing experience for [!INCLUDE [prod_short](includes/prod_short.md)] customers. Customers who use AI resources across multiple AI-enabled solutions built with [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot benefit from a unified approach to AI consumption monitoring and invoicing, thereby they avoid the need to reconcile multiple invoices or metrics from separate ISVs.

This allows customers to:

- Track AI consumption at a granular level, per Copilot feature.
- Receive a consolidated invoice for AI consumption.

[!INCLUDE [prod_short](includes/prod_short.md)] AI resources are billed in alignment with Copilot Studio message billing, and follow the AI Tools rates, that depends on the underlying language model of the Copilot feature prompts.

|Business Central AI resources model|AI Tools rate|
|-----------------------------------|-------------|
|GPT-4.1|Standard|
|GPT-4.1-mini|Basic|

Learn more about the rates under AI Tools in [Billing rates and management](/microsoft-copilot-studio/requirements-messages-management#message-scenarios)
 
> [!NOTE]  
> It's important to note that the AI billing model isn't intended to replace the existing Marketplace monetization pathway for [!INCLUDE [prod_short](includes/prod_short.md)] apps. Instead, it serves as another option to simplify AI consumption for customers and partners, with the Marketplace monetization option available to ISVs to monetize their intellectual property (IP).

### Gracefully handle errors in case of overconsumption

When using [!INCLUDE [prod_short](includes/prod_short.md)] AI resources, developers can easily react and handle cases of overconsumption. Overconsumption can happen, for example, when the customer provides nonvalid billing information, or when a user is using AI resources too fast.

To identify and handle these scenarios, developers can use the codeunit `AOAI Operation Response`, which is returned when using the [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot.

Here are some examples of using an instance of `AOAI Operation Response` to identify errors related to AI consumption.

|AL code check|scenario|
|-----------------------------------|-------------|
|`AOAIOperationResponse.IsSuccess()`|The operation was successful and no more error handling is needed.|
|`AOAIOperationResponse.GetStatusCode() = 402`|The operation wasn't successful because the current Microsoft Entra tenant ran out of AI resources and has no valid billing setup.|
|`AOAIOperationResponse.GetStatusCode() = 429`|The current user is issuing requests to Copilot too fast. This can be an indication of automations or scheduled tasks that the user isn't aware of. This error disappears after a few seconds.|
|`AOAIOperationResponse.GetStatusCode() = 503`|The [!INCLUDE [prod_short](includes/prod_short.md)] backend is temporarily unavailable; this is a rare occurrence and typically transient.|

## Use your own subscription with customers

For most ISVs, the default [!INCLUDE [prod_short](includes/prod_short.md)] AI resources are enough, However, if you have needs that aren't fulfilled with the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources, such as specific models including fine-tuned ones, you can bring your own (BYO) subscription to customers. If that's the case, the ISV is responsible for the deployment, maintenance, scaling, and security of the service - and the billing of AI resources to customers.

## Differences between [!INCLUDE [prod_short](includes/prod_short.md)] AI resources and custom Azure OpenAI subscriptions

By using the [!INCLUDE [prod_short](includes/prod_short.md)] developer tools for Copilot, partners can easily get access to AI resources when they extend Copilot in [!INCLUDE [prod_short](includes/prod_short.md)].

[!INCLUDE [prod_short](includes/prod_short.md)] AI resources are identical to those used in base application Copilot features and are the recommended default option. Partners, however, might sometimes need to use their own or customer-owned Azure OpenAI subscription in production environments when they have specific requirements. The following section provides an overview of the major differences between using the AI resources in the toolkit and using your own Azure OpenAI subscription and model deployment.
<br><br>

|Area|Business Central AI resources|Your own AOAI subscription|
|----|-----------------------------|--------------------------|
|Deployment|Microsoft manages the AI resources. <br><br>We ask you to have an active Azure OpenAI subscription for sign-up, but no model. | You must handle deploying models, keep them up to date, set up Azure subscriptions, take care of geography and data residency, etc. <br><br>You're charged for deployed models even if they aren't used.|
|Model support|Production-ready models available (today GPT-4o and GPT-4o-mini, more in the future). <br><br> Get notified via developer telemetry when new models are coming, and old models are obsoleted. Observe that when models are discontinued, partners are accountable for migrating to newer models and model versions as dictated by Microsoft within communicated SLA.<br><br>Embeddings aren't yet available.|All Azure OpenAI models are available. <br><br>Follow Azure OpenAI model deprecation timelines. <br><br>Embeddings and fine tuning are available depending on your model.|
|Responsible AI|Azure OpenAI content filters predefined by Business Central. <br><br>Microsoft automatically appends safeguard prompts to your system prompt that increase protection against typical harms such as generation of harmful content and prompt injection attacks.|Azure OpenAI content filters, configurable by you. <br><br>Microsoft automatically appends safeguard prompts to your system prompt that increase protection against typical harms such as generation of harmful content and prompt injection attacks in Saas|
|Environments|SaaS only|Can be used in SaaS, and for testing in containers.|
|Billing|Microsoft charges the customer when they use AI. <br><br> Customers can track usage, set limits, and get a single, detailed invoice across Copilot features that use the toolkit AI resources. <br><br>You charge the customer for your IP.|You must track billing, split billing if multiple customers share the same subscription, manage spending limits, provide usage statistics etc.|
|Geographic availability|AI model endpoints are available in limited Azure geographies, managed by Microsoft, that might change over time. You can find the list of currently supported Azure geos [here](/dynamics365/business-central/ai-copilot-data-movement#how-data-movement-across-geographies-works). <br><br> Customer environments in all other geos connect to endpoints in the US and are managed by the data governance controls provided to administrators in Business Central.|Availability follows the general availability of the chosen model in Azure OpenAI. See [Azure OpenAI Models](/azure/ai-services/openai/concepts/models?tabs=global-standard%2Cstandard-chat-completions) for more.|

## Mandatory to migrate to newer models as older ones are deprecated

Models evolve and are replaced over time. By using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources, partners are accountable for migrating to newer models and model versions as dictated by Microsoft within the communicated SLA. Failure to do so can lead to Copilot features using the deprecated model in [!INCLUDE [prod_short](includes/prod_short.md)] AI resources to no longer work in production.

## Using the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources and your own subscription in AL

The default and recommended approach is to use the developer toolkit AI resources when extending Copilot in [!INCLUDE [prod_short](includes/prod_short.md)]. All you need to do is to authenticate with the `SetManagedResourceAuthorization` method in the [AI Module AzureOpenAI](/dynamics365/business-central/application/system-application/codeunit/system.ai.azure-openai) codeunit. As part of this, you also need to provide your own AzureOpenAI subscription details, but this isn't used or billed when authenticating with `SetManagedResourceAuthorization`.

```al
// Example of using the default toolkit AI resources in AL 
AzureOpenAI.SetManagedResourceAuthorization(Enum::"AOAI Model Type"::"Chat Completions",AzureOpenAIAccountName,AzureOpenAIApiKey,AOAIDeployments.GetGPT4oLatest());
```

If you instead want to use your own subscription, whether for a customer, or just when you develop or test, you must authenticate with your own subscription using the `SetAuthorization` method.

```al
// Example of using your own Azure OpenAI subscription in AL 
AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions",GetEndpoint(),GetDeployment(),GetApiKey());
```

## Use your own subscription during development

The [!INCLUDE [prod_short](includes/prod_short.md)] AI resources can only be used in customer production environments. Therefore, it's recommended that partners create and use their own Azure OpenAI subscriptions as part of noncustomer usage, for example, when prototyping, developing, testing, and supporting AI capabilities.

> [!NOTE]  
> To use the [!INCLUDE [prod_short](includes/prod_short.md)] AI resources in an app, the partner must provide information about their own Azure OpenAI subscription. This is to ensure that the partner is aware of and has accepted Azure OpenAI Service data, privacy, and security policies.

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
[Transparency note: Developer tools for Copilot in Business Central](../ai/transparency-note-dev-tools-for-copilot.md)  