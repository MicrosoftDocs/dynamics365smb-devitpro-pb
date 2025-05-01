---
title: Write AI Tests
description: Learn how to write AI tests in AL for Copilot features.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.date: 05/01/2025
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Write AI tests

An **AI Test** is a procedure designed to evaluate the accuracy, reliability, and safety of a Copilot feature. These tests involve running the Copilot through a series of predefined scenarios defined by datasets, then comparing the outputs against expected results.

## Step-by-step: write an AI test

<!--
> [!TIP]
> The full source code for the example used in this article can be found in the [Marketing text sample]() demo project. -->

Follow these steps to create an AI test.

### Step 1 - define the test

An AI test in [!INCLUDE [prod_short](includes/prod_short.md)] is a standard AL test that uses the `AIT Test Context` codeunit to interact with datasets. 

> [!NOTE]
> AI tests depend on datasets. Learn more about how to create one in the [Dataset](ai-test-copilot-datasets.md) article.

#### Example of a basic test method

```al
[Test]
procedure TestTagLineLength()
var
    AITTestContext: Codeunit "AIT Test Context";
begin
    // Test logic goes here
end;
```

### Step 2 - access the dataset

Use the `AIT Test Context` codeunit to retrieve inputs and expected values from your dataset.

- To get the full input as JSON:
  
  ```al
  AITTestContext.GetInput()
  ```

- To get specific setup values:

  ```al
  AITTestContext.GetTestSetup().Element('element_name').ValueAsText()
  ```

- To get expected result values:

  ```al
  AITTestContext.GetExpectedData().Element('element_name').ValueAsInteger()
  ```

> [!TIP]
> Review the `AIT Test Context` codeunit for all supported procedures.


#### Example - access the dataset

```al
[Test]
procedure TestTagLineLength()
var
    AITTestContext: Codeunit "AIT Test Context";
    MaxLength: Integer;
    ItemNo: Code[20];
begin
    // [GIVEN] The item and required maximum length
    CreateItem();
    ItemNo := CopyStr(AITTestContext.GetTestSetup().Element('item_no').ValueAsText(), 1, MaxStrLen(ItemNo));
    MaxLength := AITTestContext.GetExpectedData().Element('tagline_max_length').ValueAsInteger();

    // Continue with test logic
end;
```

### Step 3 - call the Copilot feature

You can invoke your Copilot feature from AL code just like any other method.

Example of calling `GenerateTagLine`:

```al
[Test]
procedure TestTagLineLength()
var
    AITTestContext: Codeunit "AIT Test Context";
    MarketingTextWithAI: Codeunit "Marketing Text With AI";
    TagLine: Text;
    MaxLength: Integer;
    ItemNo: Code[20];
begin
    // [GIVEN]
    CreateItem();
    ItemNo := CopyStr(AITTestContext.GetTestSetup().Element('item_no').ValueAsText(), 1, MaxStrLen(ItemNo));
    MaxLength := AITTestContext.GetExpectedData().Element('tagline_max_length').ValueAsInteger();

    // [WHEN]
    TagLine := MarketingTextWithAI.GenerateTagLine(ItemNo, MaxLength);

    // Continue with test logic
end;
```

### Step 4a - evaluate internally

Use AL assertions to verify that the generated results meet expectations.

```al
[Test]
procedure TestTagLineLength()
var
    AITTestContext: Codeunit "AIT Test Context";
    MarketingTextWithAI: Codeunit "Marketing Text With AI";
    TagLine: Text;
    MaxLength: Integer;
    ItemNo: Code[20];
    TaglineLengthErr: Label 'Tagline: %1; Length: %2; Exceeds maximum length of %3', Comment = '%1 = Tagline, %2 = Length, %3 = Maximum Length';
begin
    // [GIVEN]
    CreateItem();
    ItemNo := CopyStr(AITTestContext.GetTestSetup().Element('item_no').ValueAsText(), 1, MaxStrLen(ItemNo));
    MaxLength := AITTestContext.GetExpectedData().Element('tagline_max_length').ValueAsInteger();

    // [WHEN]
    TagLine := MarketingTextWithAI.GenerateTagLine(ItemNo, MaxLength);

    // [THEN]
    if StrLen(TagLine) > MaxLength then
        Error(TaglineLengthErr, TagLine, StrLen(TagLine), MaxLength);
end;
```

> [!NOTE]
> Ensure all test methods in a codeunit can handle the same input. If not, split the tests across multiple codeunits.

### Step 4b - evaluate externally

For more complex validations (for example, tone, relevance), it's often better to evaluate the results externally, using tools like Azure AI Foundry.

Use `SetTestOutput` to export output for external evaluation:

```al
[Test]
procedure TestMarketingTextContentCasual()
begin
    TestScenario(StyleEnum::Casual);
end;

local procedure TestScenario(Style: Enum "Marketing Text Style")
var
    Item: Record Item;
    TestContext: Codeunit "AIT Test Context";
    MarketingTextWithAI: Codeunit "Marketing Text With AI";
    TestOutputJson: Codeunit "Test Output Json";
    ContextOutputJson: Codeunit "Test Output Json";
    MarketingText: Text;
    QueryTxt: Text;
    ItemNo: Code[20];
begin
    // [GIVEN]
    CreateItem();
    ItemNo := CopyStr(TestContext.GetTestSetup().Element('item_no').ValueAsText(), 1, MaxStrLen(ItemNo));

    // [WHEN]
    MarketingText := MarketingTextWithAI.GenerateMarketingText(ItemNo, Style);

    // [THEN] External evaluation
    QueryTxt := 'Generate a marketing text for the given item in Business Central in ';
    case Style of
        StyleEnum::Formal:
            QueryTxt += '*Formal* Tone.';
        StyleEnum::Verbose:
            QueryTxt += '*Verbose* Tone.';
        StyleEnum::Casual:
            QueryTxt += '*Casual* Tone.';
    end;

    // Prepare test output
    TestOutputJson.Initialize();
    TestOutputJson.Add('query', QueryTxt);

    // Add context
    ContextOutputJson.Initialize();
    ContextOutputJson.Add('item_no', ItemNo);
    Item.Get(ItemNo);
    ContextOutputJson.Add('description', Item.Description);
    ContextOutputJson.Add('uom', Item."Base Unit of Measure");

    TestOutputJson.Add('context', ContextOutputJson.ToText());

    // Add generated response
    TestOutputJson.Add('response', MarketingText);

    // Set test output for external validation
    TestContext.SetTestOutput(TestOutputJson.ToText());
end;
```

## Related information

[Build the Copilot capability in AL](ai-build-capability-in-al.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Create datasets](ai-test-copilot-datasets.md)  
[AI test tool](ai-test-copilot-testtool.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  