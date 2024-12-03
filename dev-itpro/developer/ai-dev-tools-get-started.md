---
title: Get set up with Azure OpenAI Service
description: Learn about the tasks that must be completed so that you can start integrating Azure OpenAI Service in your extensions to create Copilot experiences in Business Central
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 11/11/2024
ms.custom: bap-template
---
# Get set up with Azure OpenAI Service

This article explains the tasks that must be completed so that you can start integrating Azure OpenAI Service in your extensions to create Copilot experiences in Business Central.

1. Get an Azure subscription. You can sign up for paid plan or start for free.

   Learn more at [https://azure.microsoft.com](https://azure.microsoft.com).
1. Verify that you have access to Azure OpenAI Service for your subscription.

   Azure OpenAI is a Limited Access service, and access and use is subject to eligibility criteria determined by Microsoft. Unless otherwise indicated in the service, all Azure customers are eligible for access to Azure OpenAI models. Learn more at  [Limited access for Azure OpenAI Service](https://aka.ms/OAIapply).
1. Get permissions on your account to create Azure OpenAI resources and deploy models.

   Learn more at [Role-based access control for Azure OpenAI Service](/azure/ai-services/openai/how-to/role-based-access-control).
1. Create Azure OpenAI Service resource and deploy a model.

   This task is done using [Azure portal](https://portal.azure.com) and [Azure AI Studio](https://oai.azure.com/). Learn more at [Create and deploy an Azure OpenAI Service resource](/azure/ai-services/openai/how-to/create-resource).

   After you complete this step, you can start to develop your Copilot experience, which requires the following information about the resource and deployed model:

   |What|Where to find it|
   |-|-|
   |Azure OpenAI API key and endpoint (URL)|**Keys and Endpoint** page for the resource in the Azure portal.|
   |Deployment name for the model|**Deployments** page in Azure AI Studio.|

## Next steps

- [Build AI capability in AL](ai-build-capability-in-al.md)  
- [Build the Copilot user experience](ai-build-experience.md)  
