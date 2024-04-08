---
title: Token counting in AI
description: Learn whether your AI idea or feature is a match for Copilot in Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: reference
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 04/08/2024
ms.custom: bap-template 
---

# Token counting in AI

Large Language Models (LLMs) operate using tokens, which are representations of ASCII or other encoded characters, rather than directly processing these characters as input or output. Token counting is the process of determining the number of tokens that will be used by your input before sending an actual request to Azure OpenAI (AOAI). A simple example to illustrate token counting is the following:

Input: "Tell me about the solar system."  
Tokens: 41551 757 922 279 13238 1887 13  
Number of tokens: 7  

The spacing between the numbers has been added purely for readability.

By evaluating the number of tokens it takes for your request, you can determine the following:

- Estimating your potential cost of your copilot <Link to AOAI pricing page> 
- Models have limited context sizes and when you have more data than what fits the context size, you’d want to use this to help split up your generation into multiple generations. 

## Token counting codeunit

In the Business Central System Application, there is a codeunit that can help you count the number of tokens in your input. The codeunit is located in the following path: BCApps/src/System Application/App/AI/src/Azure OpenAI/AOAIToken.Codeunit.al at main · microsoft/BCApps (github.com) 

The AOAIToken codeunit has the following methods:

- GetGPT35TokenCount(Input):Integer 
- GetGPT4TokenCount(Input):Integer 
- GetGPTAdaTokenCount(Input):Integer 
- GetGPTDavinciTokenCount(Input):Integer 

These methods are version agnostic. For example, GetGPT4TokenCount works for GPT4 0613, GPT4 0125, and all versions. 

## See also