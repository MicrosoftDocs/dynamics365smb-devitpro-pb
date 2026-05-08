---
title: Evaluation
description: Learn how to use Evaluation to test Copilot features and agents in AL.
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

# Evaluation

Evaluation for AL (formerly AI Test Toolkit) is an essential component of the developer tools for Copilot in [!INCLUDE [prod_short](includes/prod_short.md)]. It focuses on data-driven test automation to ensure that AI systems are accurate with various inputs, maintain the trust and security of our customers and their data, and are resilient to changes in AI model versions.

With Evaluation, you can:

- Create tests for your prompt dialogues using a familiar framework in AL and Visual Studio Code.
- Organize your test datasets based on purpose and prompt variations.
- Configure suite-level metadata such as capability, test type, and execution frequency.
- Run the same suite across multiple languages.
- Implement automatic verification depending on your feature's use case.
- Track Copilot credit consumption per run, test line, and dataset entry.
- Build and validate Business Central agents in evaluation runs.
- Run tests as fully automated or semi-automated.

## Step-by-step: using Evaluation

This section goes over how to use Evaluation to set up a test suite, execute it, and view the results.

**Prerequisite**: 
- You already created and published test codeunits for your AI Tests and created the necessary datasets. See [Creating datasets](ai-test-copilot-datasets.md) and [Writing AI tests](ai-test-copilot-ai-tests.md).
- You have the **AI TEST TOOLKIT** permission set assigned to your user.

### Step 1 - upload datasets

1. Open the **AI Eval Suites** page.
1. Open the **Test Input** page using the **Input Datasets** action.
1. Import the dataset using the **Import data-driven test inputs** action and uploading your dataset.

Once the dataset is uploaded, you can open and view the dataset in [!INCLUDE [prod_short](includes/prod_short.md)]. From here, you can also view the test input of each line by clicking the test input. You can also set the dataset to **Sensitive** by toggling the **Sensitive** toggle, which hides the test input and output by default, both in the dataset view and results view.

### Step 2 - set up the test suite

1. Open the *AI Eval Suites* page.
1. Upload the previously created datasets for the tests.
1. Create a test suite using the New action.
1. Open the newly created test suite.
1. Configure the test suite (see the following example).

Specify a unique code for the test suite and description. On the header level, select the input dataset that was previously uploaded. On the test line, add the test codeunits previously created. Optionally, specify a line-specific input dataset for each line that requires a different input dataset than the header-level input dataset.

### Configure suite metadata

As a step toward making AI quality easier to manage at scale, evaluation suites support suite-level configuration parameters. You can configure values such as capability, test type, and execution frequency. These settings apply to all tests in the suite and help keep large evaluation scenarios consistent and structured.

These metadata values are also exported in the suite XML and can be consumed by automation, such as CI/CD pipelines.

```xml
<Root>
    <AITSuite Code="DEMO" Description="Demo" TestRunnerId="130451" Capability="Sales Order Agent" Frequency="Daily" TestType="Agent">
        <Line CodeunitID="133540" Description="Tests" Dataset="SET" />
    </AITSuite>
</Root>
```

### Configure languages for evaluation runs

Business Central solutions are global, and AI experiences must work across languages. Evaluation supports multilingual datasets so you can validate the same scenario across multiple locales.

In the evaluation setup, you can choose the language used for a specific run.

You can also view and configure dataset content with language variants.

Exported suite XML includes language tags that automation can use:

```xml
<Root>
    <AITSuite Code="DEMO" Description="Demo" TestRunnerId="130451">
        <Language Tag="da-DK" Frequency="Weekly" />
        <Language Tag="en-US" Frequency="Weekly" />
        <Line CodeunitID="50000" Description="Tests" Dataset="DATA" />
    </AITSuite>
</Root>
```

### Step 3 - preconfigure the test app 

These steps make sure that the test suite is preconfigured whenever the test app is installed.

1. Open the **AI Eval Suites** page.
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

1. Open the **AI Eval Suites** page.
1. Open the previously created test suite.
1. Run the AI Eval Suites using the **Start** action. Alternatively, run them one line at a time using the **Start** action for each line. Each test method is executed for each dataset line.
1. The tests doing the evaluation in AL either fail or succeed based on the condition.
1. Test Output must be generated for all the tests, which needs to be evaluated externally.

### Step 5 - inspect the results

1. Open Evaluation and switch to the created test suite to execute each test manually.
1. Open **Log Entries** page to see the result of each execution.
1. Download the test output, which generates the .jsonl file or export the logs to Excel.

### Step 6 - review Copilot credit usage

AI features consume Copilot credits. Evaluation provides visibility into both token usage and Copilot credit consumption per run, per test line, and per dataset entry.

Use this insight to understand consumption patterns, optimize prompts, and manage costs more effectively.

> [!IMPORTANT]
> Evaluation runs aren't free. Each test run consumes Copilot credits from your environment. We recommend using environments with prepaid Copilot credits when running eval suites, especially for automated or frequent runs.

> [!NOTE]
> For agent tests, the token usage displayed reflects only the tokens consumed by the AI evaluators, not the tokens used by the agent runtime during task execution.

> [!TIP]
> You can also use the API (page 149038 "AIT Log Entry API") to get the result for a suite.

## Copilot credit limits for agent evaluation suites

To prevent uncontrolled credit consumption, the system enforces monthly Copilot credit limits for agent evaluation tasks. Limits are applied at two independent levels:

- **Environment level**: An overall credit limit for all companies in the environment combined.
- **Company level**: An individual credit limit per company within the environment.

Both limits are checked before a new evaluation task is allowed to start. If either limit has been reached, the task is blocked.

**Example**: Environment limit is 100 credits, Company A limit is 50 credits.

- If Company A has consumed 55 credits, then no new eval tasks can start for Company A, even if the overall environment limit hasn't been reached.
- If all companies combined have consumed 105 credits, then no new eval tasks can start in any company in that environment.

When a limit is reached, evaluation tasks that are already running continue to completion to avoid wasting credits already consumed. However, any tasks that are queued but haven't started yet are stopped, and a notification is raised indicating that the credit limit has been reached.

> [!NOTE]
> If a test run is cancelled or aborted, no credit consumption record or task link is created for that run.

### Managing credit limits

Credit limits can be viewed and modified by users with the **agent admin** role. For more information about agent admin permissions, see [Permissions in Evaluation](../ai/ai-development-toolkit-permissions.md).

- Agent admins with permissions in specific companies can modify the credit limits for those companies only.
- Agent admins with permissions in all companies can also modify the environment-level limit.

All changes to credit limits are recorded in audit telemetry.

## Related information

[Business Central Copilot Evaluation](https://github.com/microsoft/BCApps/blob/main/src/Tools/AI%20Test%20Toolkit/README.md)  
[Build the Copilot capability in AL](ai-build-capability-in-al.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Create datasets](ai-test-copilot-datasets.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  