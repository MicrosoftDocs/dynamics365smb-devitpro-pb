---
title: Best Practices for Testing the Copilot Capability in AL
description: Learn about best practices for testing the Copilot capability in AL.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.date: 07/02/2025
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Best practices for testing the Copilot capability

Testing AI-driven features like Copilot requires a tailored approach to ensure accuracy, safety, and reliability. This article outlines best practices for testing the Copilot capability in AL, focusing on the unique challenges posed by Large Language Models (LLMs).

## Key considerations for LLM-based features

Unlike deterministic systems, LLM-based features require new testing approaches. Consider the following:

- **Non-determinism:** Identical prompts might produce different results.
- **Context sensitivity:** Small changes in input phrasing can significantly affect output quality.
- **Bias and safety:** Language models might reflect or amplify societal and cultural biases.

> [!NOTE]  
> Always include human-in-the-loop evaluation for user-facing or high-impact scenarios, even if you have automated parts of the test pipeline.

### Measure accuracy at scale

To evaluate Copilot performance broadly:

- Use the **AI Test Tool** to automate testing and verify thousands of prompts automatically.
- Score outputs for **correctness**, **relevance**, and **completeness**.  
- Flag low-confidence responses for human review.

The AI Test Toolkit allows automating AI Testing at scale.

### Create realistic test cases

Design tests that reflect actual usage:

- Base cases on real-world tasks and intents.
- Apply anonymized user logs for representative prompts.
- Include various phrasing styles and complexity levels.  

Build test suites that cover both common and edge-case user scenarios.

### Validate output safety and tone

A Copilot feature must be accurate—but also safe, respectful, and aligned with your organization’s voice. Outputs that appear correct can still fail due to inappropriate tone or harmful implications.

Test to ensure your Copilot:

- **Avoids bias and stereotyping:**  
  - Uses inclusive, nongendered language.  
  - Resists reproducing cultural or societal biases.  
- **Maintains professional tone:**  
  - Aligns with your brand’s voice.  
  - Avoids sarcasm or humor unless appropriate.  
- **Filters harmful content:**  
  - Blocks hate speech, profanity, and explicit material.  
  - Mitigates prompt abuse and adversarial input.  
- **Handles adversarial prompts safely:**  
  - Defends against prompt injection and chaining.  
  - Gracefully manages nonsense or confusing queries.  

> [!TIP]  
> Integrate both quality and safety tests into your CI/CD pipeline using the AI Test Toolkit.

### Test for cross-language compatibility

If your Copilot supports multiple languages:

- Validate input/output handling in each supported locale.  
- Involve native speakers to assess linguistic and cultural accuracy.  
- Avoid assuming that English test results apply globally.  

Localizing your test approach is essential to ensure consistent user experience across regions.

### Track changes across model versions

LLMs evolve quickly—and updates can unintentionally affect feature behavior. Use regression testing to:

- Rerun existing test suites on updated models.  
- Compare current vs. previous outputs side-by-side.  
- Identify unexpected changes or regressions.  

Maintain historical baselines for consistency across releases.

## Best practices checklist

| Task                   | Description                                |
|------------------------|--------------------------------------------|
| Automate testing       | Evaluate large-scale output with batch runs|
| Define realistic prompts| Reflect real-world user behavior           |
| Review for safety and tone| Detect harmful or biased content         |
| Localize testing       | Validate multilingual output accuracy       |
| Run version comparisons| Track regressions from model updates       |

## Related information

[Business Central Copilot Test Toolkit](https://github.com/microsoft/BCApps/blob/main/src/Tools/AI%20Test%20Toolkit/README.md)  
[Build the Copilot capability in AL](ai-build-capability-in-al.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Create datasets](ai-test-copilot-datasets.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[AI test tool](ai-test-copilot-testtool.md)