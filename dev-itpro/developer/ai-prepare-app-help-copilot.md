---
title: Prepare your app Help for Copilot
description:  
author: SusanneWindfeldPedersen
ms.author: mikebc
ms.topic: concept-article
ms.date: 07/02/2025
ms.collection:
  - bap-ai-copilot
ms.reviewer: solsen
---

# Prepare your app Help for Copilot

The [!INCLUDE [prod_short](includes/prod_short.md)] user assistance model is based on principles of helping users get started, get unblocked and learn more. Copilot in [!INCLUDE [prod_short](includes/prod_short.md)] makes it easy for users to learn new skills or quickly get unblocked by allowing them to ask questions in their own words, or quickly get answers at the click of a button – without leaving the [!INCLUDE [prod_short](includes/prod_short.md)] app. 

When your customers install your app and want to learn about functionality that your app provides, such as how to set up and configure, how to get past specific error messages, or how to use certain fields or pages, your app must link to your online content that includes this information, so that Copilot can use this to provide answers. Rather than relying on Large Language Models to answer questions, where the AI model may not know the details of your app, Copilot uses your online content as grounding data to provide better answers. 

Copilot is able to access content in a wide range of styles, languages, and hosted on different publishing platforms. This article highlights the limitations and best practices you need to be aware of, to increase the chance of Copilot successfully answering questions about your app.

## Recommended process to verify fit for Copilot 

The best way to verify that Copilot can reach your help content and is able to return good quality responses is to test this directly through [!INCLUDE [prod_short](includes/prod_short.md)]. The following steps can help you plan your approach: 

1. Deploy a sandbox environment and install your app. 
1. Ensure Copilot Chat is active and all prerequisites are satisfied. For more information <see here>. 
1. Carefully plan which questions to ask Copilot, providing sufficient coverage across different aspects of your app, such as different roles, processes, fields, pages your app supports. To start with, 5-10 questions can be sufficient for an initial test.
1. Ask Copilot, either directly using the Copilot pane, or by using the “Ask Copilot” action on tooltips for fields from your app.  
1. Capture and analyze the responses.  
  1. If Copilot provides responses based on Microsoft’s online documentation or is unable to answer the question, this may be because your online content is unreachable, or you are using a publishing platform or web content structure that is not supported.
  1. If Copilot provides responses that include references to your online content, but the results are of poor quality, you may need to optimize your content to match how Copilot searches and retrieves information. 

> [!TIP]
> You can also test the AI-readiness of your online content by using Microsoft Copilot Studio’s feature Generative Answers. This uses similar technology to Copilot in Business Central, but is not identical and may not produce the same results or reveal issues with Copilot connecting to your online content. 

## Making help content reachable by Copilot 

Copilot doesn’t do a broad web search to find your online content. Instead, it relies on hints from your app.json for where to find your documentation. The following table highlights requirements that may impact whether Copilot can reach your online content. 



## Related information