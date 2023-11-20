---
title: Get setup with Azure OpenAI Service
description: Learn how to get setup with Azure OpenAI Service
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection: get-started
ms.date: 11/06/2023
ms.custom: bap-template
---
# Get setup with Azure OpenAI Service

This article explains the tasks you or an admin must complete so that you can start integrating Azure OpenAI Service in your extensions to create copilot experiences in Business Central.

1. Get an Azure subscription. You can sign up for paid plan or start for free.

   [Learn more](https://azure.microsoft.com)
1. Request access to Azure OpenAI Service for your subscription.

   Currently, access to this service is granted only by applying for access. To apply for access to Azure OpenAI Service, complete the form at [aka.ms/OAIapply](https://aka.ms/OAIapply). 
1. Get permissions on your account to create Azure OpenAI resources and deploy models.

   [Learn more](/azure/ai-services/openai/how-to/role-based-access-control)
1. Create Azure OpenAI Service resource and deploy a model.

   This task is done using [Azure portal](https://portal.azure.com) and [Azure AI Studio](https://oai.azure.com/). [Learn more](/azure/ai-services/openai/how-to/create-resource).

   After you complete this step, you can start to develop your copilot experience, which requires the following information about the resource and deployed model:

   |What|Where to find it|
   |-|-|
   |Azure OpenAI API key and endpoint (URL)|**Keys and Endpoint** page for the resource in the Azure portal.
   |Deployment name for the model|**Deployments** page in Azure AI Studio.|

## Next steps

- [Build AI capability in AL](ai-build-capability-in-al.md)  
- [Build the copilot user experience](ai-build-experience.md)  