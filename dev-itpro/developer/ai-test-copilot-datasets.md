---
title: Datasets
description: Test your integration of Azure OpenAI Service through the AI module of Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.date: 05/01/2025
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Datasets

A **dataset** is the foundation of AI testing in [!INCLUDE [prod_short](includes/prod_short.md)]. Since AI tests are inherently data-driven, datasets allow us to simulate various user scenarios and interactions. By using diverse and comprehensive datasets, we can thoroughly evaluate AI features to ensure they meet high standards for correctness, safety, and accuracy.

## Create a dataset

> [!TIP]
> The full source code for the example used in this article can be found in the [Marketing Text Simple](#) demo project.

AI tests in [!INCLUDE [prod_short](includes/prod_short.md)] rely on datasets defined in either **JSONL** or **YAML** format. These datasets contain both test input and expected data values used by the AI Test Tool.

### Defining a JSONL dataset

While there's no rigid schema required, the AI Test Tool supports certain common elements like `test_setup` and `expected_data`. Using these keywords helps create a consistent structure.

Here's an example of a valid JSONL dataset:

```json
{"test_setup": {"item_no": "C-10000", "description": "Contoso Coffee Machine", "uom": "PCS"}, "expected_data": {"tagline_max_length": 20}}
{"test_setup": {"item_no": "C-10001", "description": "Contoso Toaster", "uom": "PCS"}, "expected_data": {"tagline_max_length": 20}}
{"test_setup": {"item_no": "C-10002", "description": "Contoso Microwave Oven", "uom": "PCS"}, "expected_data": {"tagline_max_length": 20}}
```

Each line represents a distinct test case with inputs and expected outputs.

### Defining a YAML dataset

You can also define the same dataset in YAML format for improved readability:

```yaml
tests:
  - test_setup:
      item_no: "C-10000"
      description: "Contoso Coffee Machine"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20

  - test_setup:
      item_no: "C-10001"
      description: "Contoso Toaster"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20

  - test_setup:
      item_no: "C-10002"
      description: "Contoso Microwave Oven"
      uom: "PCS"
    expected_data:
      tagline_max_length: 20
```

## Get data for your tests

When creating AI tests, the data you use is as important as the AI features you're testing. Quality, consistency, and realism of data are critical for ensuring that your tests are comprehensive and meaningful.

> [!TIP]
> Learn more in [Best practices](ai-test-copilot-bestpractices.md) about other considerations when creating datasets.

### Sources of data for your tests

1. **Public datasets**:
   - There are many publicly available datasets that you can use for AI testing.

2. **Synthetic data**:
   - In cases where real-world data is difficult to obtain or too sensitive, you can generate synthetic data. 
   - Synthetic data can be especially useful for testing edge cases or generating large volumes of data quickly.

3. **Customer or internal data**:
   - If you have access to anonymized customer data or internal business datasets, this can be a valuable source for realistic AI testing.
   - Ensure that the data is appropriately anonymized and that you comply with privacy regulations.

4. **Crowdsourced data**:
   - Certain platforms allow you to gather custom data by using crowdsourcing. 

5. **Simulated data from domain experts**:
   - In certain domains, domain experts can provide valuable insights into generating realistic and relevant test data.
   - This approach is helpful when real-world data isn't readily available or too sensitive to share.

### More tips for collecting test data

- **Start with small datasets**: Especially when testing new AI features, begin with small, manageable datasets to avoid overwhelming your testing process.
- **Incrementally increase complexity**: As you refine your tests, increase the complexity of the datasets to better simulate real-world scenarios.
- **Document data sources**: Always document the origins of your test data, including any transformations made, to ensure traceability and transparency in your testing process.

## Related information

[Build the Copilot capability in AL](ai-build-capability-in-al.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[AI Test Tool](ai-test-copilot-testtool.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  
