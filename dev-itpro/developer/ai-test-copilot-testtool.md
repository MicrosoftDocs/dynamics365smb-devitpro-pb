---
title: AI Test Tool
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

# AI Test Tool

The AI Test Tool is an essential component of the developer tools for Copilot in [!INCLUDE [prod_short](includes/prod_short.md)]. It focuses on data-driven test automation to ensure that AI systems are accurate with various inputs, maintain the trust and security of our customers and their data, and are resilient to changes in AI model versions.

With the AI Test Tool, you can:

- Create tests for your prompt dialogues using a familiar framework in AL and Visual Studio Code.
- Organize your test datasets based on purpose and prompt variations.
- Implement automatic verification depending on your feature's use case.
- Run tests as fully automated or semi-automated.

## Step-by-step: Using the AI Test Tool

This goes over how to use the AI Test tool to set up a test suite, execute it, and view the results.

**Prerequisite**: You already created and published test codeunits for your AI Tests and created the necessary datasets. See [Creating datasets](02-datasets.md) and [Writing AI tests](03-tests.md).

### Step 1 - upload datasets

1. Open the **AI Test Suite** page.
1. Open the **Test Input** page using the **Input Datasets** action.
1. Import the dataset using the **Import data-driven test inputs** action and uploading your dataset.

Once the dataset is uploaded, you can open and view the dataset in [!INCLUDE [prod_short](includes/prod_short.md)]. From here, you can also view the test input of each line by clicking the test input. You can also set the dataset to **Sensitive** by toggling the **Sensitive** toggle, which hides the test input and output by default, both in the dataset view and results view.

![Image of dataset in BC](img/dataset.png "Dataset")

### Step 2 - set up the test suite

1. Open the *AI Test Suite* page.
1. Upload the previously created datasets for the tests.
1. Create a test suite using the New action.
1. Open the newly created test suite.
1. Configure the test suite (see the following example).

Specify a unique code for the test suite and description. On the header level, select the input dataset that was previously uploaded. On the test line, add the test codeunits previously created. Optionally, specify a line-specific input dataset for each line that requires a different input dataset than the header-level input dataset.

![Image of configurated test suite in BC](img/test-suite.png "Test Suite")

### Step 3 - preconfigure the test app 

These steps make sure that the test suite is preconfigured whenever the test app is installed.

1. Open the **AI Test Suites** page.
1. Export the previously created test suite using the **Export** action.
1. In your test app, add the datasets and test suite to the /.resources folder.
1. Create an install codeunit that imports the test suite and dataset when installed.

```al
codeunit 50201 "Marketing Text Simple Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        DatasetPaths: List of [Text];
        TestSuitePaths: List of [Text];
        ResourcePath: Text;
    begin
        // Load Datasets
        DatasetPaths := NavApp.ListResources('Datasets/*.jsonl');
        foreach ResourcePath in DatasetPaths do
            SetupDataInput(ResourcePath);

        // Load Test Suites
        TestSuitePaths := NavApp.ListResources('TestSuites/*.xml');
        foreach ResourcePath in TestSuitePaths do
            SetupTestSuite(ResourcePath);
    end;

    local procedure SetupDataInput(FilePath: Text)
    var
        AITALTestSuiteMgt: Codeunit "AIT AL Test Suite Mgt";
        FileName: Text;
        ResInStream: InStream;
    begin
        // Get the filename from the path
        FileName := FilePath.Substring(FilePath.LastIndexOf('/') + 1);

        NavApp.GetResource(FilePath, ResInStream);
        AITALTestSuiteMgt.ImportTestInputs(FileName, ResInStream);
    end;

    local procedure SetupTestSuite(Filepath: Text)
    var
        AITALTestSuiteMgt: Codeunit "AIT AL Test Suite Mgt";
        XMLSetupInStream: InStream;
    begin
        NavApp.GetResource(Filepath, XMLSetupInStream);
        AITALTestSuiteMgt.ImportAITestSuite(XMLSetupInStream);
    end;
}
```

### Step 4 - run the test suite

1. Open the **AI Test Suites** page.
1. Open the previously created test suite.
1. Run the AI Test Suite using the **Start** action. Alternatively, run them one line at a time using the Start action for each line. Each test method is executed for each dataset line.
1. The tests doing the evaluation in AL either fail or succeed based on the condition.
1. Test Output must be generated for all the tests which needs to be evaluated externally.

### Step 5 - inspect the results

1. Open the AL Test Tool and switch to the created test suite to execute each test manually.
1. Open **Log Entries** page to see the result of each execution.
1. Download the test output which generates the .jsonl file or export the logs to Excel.
1. Open the AL Test Tool and switch to the created test suite to execute each test manually.


> [!TIP]
> You can also use the API (page 149038 "AIT Log Entry API") to get the result for a suite.

## Related information

[Build the Copilot capability in AL](ai-build-copilot-in-al.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Create datasets](ai-test-copilot-datasets.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  