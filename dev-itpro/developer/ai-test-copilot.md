---
title: Test the Copilot Capability in AL
description: Explore testing strategies for Copilot features in AL. Ensure AI-generated outputs are accurate, safe, and user-friendly.  
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.date: 05/03/2026
ms.update-cycle: 180-days
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Test the Copilot capability in AL

Copilot features can dramatically improve user productivity, but only when they’re reliable. Since Large Language Models (LLMs) generate output based on probabilistic patterns, traditional rule-based testing approaches aren’t sufficient. The next articles help developers and testers adapt their strategies to ensure high-quality, trustworthy Copilot experiences.

## Why test Copilot features?

Testing helps ensure that Copilot features:

- Deliver accurate, relevant responses  
- Respond consistently to similar user prompts  
- Avoid producing harmful, biased, or inappropriate content  

Without proper validation, AI-generated outputs can lead to user frustration, compliance risks, and brand damage.

## Permission set prerequisite for Evaluation

To use Evaluation, users must have the **AI TEST TOOLKIT** permission set assigned. This permission set provides access to the necessary pages and actions to create and run AI tests.

## Overview of Evaluation

In the next articles, we explore how to test Copilot features in Business Central using Evaluation (formerly the AI Test Toolkit). Evaluation allows you to create and run tests that validate the accuracy, safety, and reliability of your Copilot features. It also supports suite-level configuration, multilingual test execution, Copilot credit visibility, and Business Central agent evaluation scenarios.

- [Create datasets](ai-test-copilot-datasets.md)  
- [Write AI tests](ai-test-copilot-ai-tests.md)  
- [Evaluation](ai-test-copilot-testtool.md)  
- [Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  

## Related information

[Business Central Copilot Evaluation](https://github.com/microsoft/BCApps/blob/main/src/Tools/AI%20Test%20Toolkit/README.md)  
[Build the Copilot capability in AL](ai-build-capability-in-al.md)  