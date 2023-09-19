---
title: Performance Toolkit extension
description: Test your extensions for performance regressions during the development process for Business Central apps. 
author: bholtorf
ms.custom: bap-template
ms.date: 09/19/2023
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.tgt_pltfrm: na
ms.search.form: 149000, 149001, 149003, 149004, 149005, 149006, 149007, 149008, 149009
ms.topic: conceptual
ms.author: bholtorf
---

# The Performance Toolkit extension

The Performance Toolkit extension is built for Independent Solution Vendors (ISVs) and Value Added Resellers (VARs) who develop vertical solutions and customize [!INCLUDE[prod_short](includes/prod_short.md)] for their customers. Because things change between released versions, it's important that ISVs and VARs can test the performance of their solutions to ensure that new versions don't introduce performance regressions when the volume of users grows. To help, the Performance Toolkit lets developers simulate workloads in realistic scenarios to compare performance between builds of their solutions.

The Performance Toolkit extension helps answer questions such as, "Does my solution for [!INCLUDE[prod_short](includes/prod_short.md)] support X number of users doing this, that, and the other thing at the same time?"

The extension doesn't answer questions such as, "How many orders can [!INCLUDE[prod_short](includes/prod_short.md)] process per hour?"

## How can I use the Performance Toolkit?

Once installed and configured, how can you use the tool? We identified four different personas as described in this table:

| Persona | Description |
| ------- | ----------- |
| Account Manager | Person making sales to new and existing customers. |
| Product Owner | Person responsible for an extension/app. |
| Project manager | Person responsible for the implementation of a Business Central environment for a customer. |
| Consultant | Person working with implementations of Business Central by setting up functionality in the product (not by writing AL code)|
| Supporter | Person performing triage, investigation, and mitigation of customer issues. |
| Developer | Person who writes AL code. |
| Operations manager | Person responsible for running Business Central environments for customers. |

<br>
In the following table, you find examples of scenarios for each persona where the app might be of help.

| Persona | Scenario | How the Performance Toolkit can help |
| ------- | ---------| ------------------------------------ |
| Account Manager | In presales, be able to answer questions such as "can Business Central handle our scenarios?" | 0. Maybe get some help from your organization to complete steps 1-5 below. Or work on automating parts of this process. <br> 1. Spin up an online Business Central sandbox environment <br> 2. Set up telemetry on the environment (to get clean data, set up a new Application Insights resource for this test only) <br> 3. Install and configure the BCPT AL extension with the scenarios you need and in the expected use pattern. <br> 4. Run the scenarios <br> 5. Install and configure the Power BI app on telemetry.  Look at the results in Performance report. | 
| Product Owner | Compare performance between builds of your app(s). | 1. Set up telemetry on the app (to get clean data, set up a new Application Insights resource for devops) <br> 2. Have your developers write scenario codeunits for your main scenarios. <br> 3. Run scenarios as part of your Azure Pipelines. <br> 4. Install and configure the Power BI app on app telemetry. Look at the results in Performance report. <br> 5. Consider setting up alerts on regressions. | 
| Developer | Test concurrency of your code | 1. Set up telemetry on your development environment (to get clean data, set up a new Application Insights resource for your setup) <br> 2. Write a scenario codeunit for your scenario. <br> 3. Run the scenarios in the BCPT Visual Studio Code extension. <br> 4a. Install and configure the Power BI app on app telemetry. Look at the results in Performance report. <br> 4b. If you prefer to analyze with KQL, use that tool instead. | 
| Operations manager | Test Business Central environments on next version before upgrading customers | 1. Copy the production environment to a sandbox. <br> 2. Set up telemetry on the environment (to get clean data, set up a new Application Insights resource for this test only) <br> 3a. Install and configure the BCPT AL extension with the scenarios you need and in the expected use pattern. <br> 3b. Set up scenarios as part of a devops pipeline. <br>  4. Run the scenarios <br> 5. Install and configure the Power BI app on telemetry.  Look at the results in Performance report. <br> 5. Consider setting up alerts on regressions. | 
| Project manager | Before go-live, ensure that the system scales with the expected number of users and what they're supposed to do in the system. | 1. Together with the project sponsor on the customer side, identify the key scenarios that must be tested <br> 2. Copy the production environment to a sandbox. <br> 3. Set up telemetry on the environment (to get clean data, set up a new Application Insights resource for this test only) <br> 4a. Install and configure the BCPT AL extension with the scenarios you need and in the expected use pattern. <br> 4b. Set up scenarios as part of a devops pipeline (maybe work on automating parts of this process for easier repeatability). <br> 5. Run the scenarios <br> 6. Install and configure the Power BI app on telemetry.  Look at the results in Performance report. <br> 7. Consider setting up alerts on regressions. |
| Project manager | Test how multiple apps work together under pressure | Similar to the go-live scenario, but here you need to make sure that apps are installed in the environment. | 
| Supporter | Analyze performance issues due to locking or deadlocks | Similar to the developer scenario for concurrency testing. If you're lucky, scenario codeunits are already available on GitHub. |

## How can I answer the question "Can Business Central handle a specific load for prospect customer"?

As a VAR partner, you sometimes get questions like "Can Business Central handle this many transactions per day?" when discussing a new ERP implementation project with a prospective customer. BCPT can help you answer part of that question by simulating the load the customer is intending. The following outlines a way to achieve this (note that all of these step can be automated):

1. Deploy a sandbox environment
2. Deploy an Azure Application Insights resource
3. Enable telemetry on the environment
4. Optionally, install extensions/apps that are needed for the implementation
5. Define the scenarios and currency needed (with the customer)
6. Set up BCPT to run scenarios (there are already many scenarios available out-of-the-box)
7. Install and configure the Power BI app on telemetry
8. Use the Usage, Errors, and Performance reports in the app to get insights into how Business Central is handling the load.

## How can I analyze BCPT data?

If you have enabled environment telemetry, then you get signal about Performance Toolkit runs and scenarios. See more here [Analyzing Performance Toolkit Telemetry](../administration/telemetry-performance-toolkit-trace.md).

The telemetry data emitted from the Performance Toolkit can be analyzed using the Power BI Performance report:
![Performance Toolkit report in PBI](images/bcpt-pbi-report.png)

You can also analyze this data directly with KQL, see sample code here: https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/KQL/Queries/ExampleQueriesForEachArea/PerformanceToolkit.kql


## Performance Toolkit Terms and definitions

The performance toolkit has many terms and their definitions that might make it easier for you to understand how everything fits together. 

| Term | Definition | 
| ---- | -----------| 
| Test suite | A suite is a configuration of which test codeunits to run and, if applicable, with what parameters. Also how many concurrent sessions you want to simulate for each test, and the duration of the scenario. | 
| Test suite tag | You can change the _tag_ for a test suite before running it. If you do this, you can compare test results between tags for different configurations of the environment or suite. For example, you might want to compare the performance of your scenarios with/without a given extension, or compare the performance of your scenarios across two versions of an extension, or compare the performance of your scenarios with different values of test codeunit parameters (for example, to see how performance changes with number of lines: 1, 10, 100, 1000). | 
| Test codeunit | Test codeunits are the containers of test scenarios. | 
| Test codeunit parameter | Test codeunits can use parameters. This is useful when you want to be able to change certain behavior of your tests. For example, you might want to change the number of sales lines you add to a sales order. | 
| Test scenario | Within a test codeunit, developers can define _test scenarios_ using the StartScenario/EndScenario functions. The text used in these scenarios is logged to telemetry and the test log together with the context of how the test codeunit was running.| 
| Test suite run | Each time you run a test suite, results are logged with a version number. You can use these version number to compare results for different configurations of the environment or suite. For example, you might want to compare the performance of your scenarios with/without a given extension, or compare the performance of your scenarios across two versions of an extension, or compare the performance of your scenarios with different values of test codeunit parameters (for example, to see how performance changes with number of lines: 1, 10, 100, 1000). |
| Test suite baseline (run) | A test suite baseline is simply a scenario run that you choose to be the one you want to compare other runs with. | 

## Components of the Performance Toolkit extension

The Performance Toolkit is actually three separate extensions that work together. The following table describes the extensions and where to get them.

|Component  |Description  |
|---------|---------|
|**Performance Toolkit** | This is the recommended place to start because this extension makes it easier to get going with performance tests. The extension is free and can be installed from the **Extensions Marketplace** for Visual Studio Code. This extension can set up a new BCPT project that targets your environment, and it includes **BCPT-SampleTests** and the PowerShell scripts for simulating scenarios. It also allows you to run your scenarios from Visual Studio Code. <br><br>**IMPORTANT:** You can use the toolkit only in sandbox environments and Docker images. You can't use it in a production tenant. Currently, only Windows is supported.
|**Performance Toolkit** | Free and available on [AppSource](https://go.microsoft.com/fwlink/?linkid=2148001).
| **PowerShell Scripts** | A command line tool for simulating multiple users signing in and interacting with [!INCLUDE[prod_short](includes/prod_short.md)]. |
|**BCPT-SampleTests**    | Free and available on the [ALAppExtensions](https://go.microsoft.com/fwlink/?linkid=2148002) repository on GitHub. These tests are intended to provide inspiration for creating your own tests. You can't use them for actual testing.       |

Combined, the extensions provide the following:

* A framework for defining a set of tests or scenarios to run in parallel. The framework also logs results and lets you import and export suite definitions.  
* Predefined sample tests that cover basic scenarios, which can also serve as inspiration for other tests that suit your customer environments.
* A command line tool that must be installed on a client computer. To simulate multiple users signing in and using pages, you must start those scenarios from outside [!INCLUDE[prod_short](includes/prod_short.md)]. The command line tool runs the number of concurrent client sessions that is specified in the suite.
* A Visual Studio Code extension that helps setting up your BCPT project and allows you to run your suites from Visual Studio Code.

## Before you start

To use the Performance Toolkit, you must be assigned to the *BC PERF. TOOLKIT* permission set in [!INCLUDE [prod_short](includes/prod_short.md)].

## Get started

There are two ways to get started with the Performance Toolkit:

* The recommended way is to install the **Performance Toolkit** extension from the Extension Marketplace in Visual Studio Code. This extension is purpose-built to make it easy to set up the toolkit and start testing performance.  
* If you want to set up the toolkit yourself, install the toolkit from AppSource via the **Extensions Marketplace** page in [!INCLUDE [prod_short](includes/prod_short.md)], get the test samples from GitHub and download the DVD to get the PowerShell scripts. This method is useful, for example, if you can't install the extension in Visual Studio Code or your environment isn't supported. Learn more about getting the scripts at [Run using the PowerShell scripts](#run-using-the-powershell-scripts).

The following steps provide an overview of how to get started. This article describes each step in more detail.

1. Install the Performance Toolkit extension in Visual Studio Code.
1. In Visual Studio Code, prepare your BCPT project and set up the **Performance Toolkit** extension on your environment.
1. Write tests for the scenarios to simulate.
1. In [!INCLUDE [prod_short](../includes/prod_short.md)], configure a BCPT suite.

### Install the Performance Toolkit extension in Visual Studio Code

> [!NOTE]
> Remember that you can't install the extension in a production environment.

1. In Visual Studio Code, open the **Extension Marketplace**, search for **Performance Toolkit**, and then install the extension.
1. Create a project by running the **BCPT Setup new Business Central Performance Toolkit project** command.

    > [!NOTE]
    > If third-party extensions are installed, the toolkit will renumber the tests to avoid conflicts.

1. Choose whether to test in a Docker or online (SaaS) environment. Use Docker for [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises.
1. Sign in to your [!INCLUDE [prod_short](../includes/prod_short.md)], and choose your environment.
1. Specify the directory to create the BCPT project in.

    When you choose **OK**, the extension verifies that the following Performance Toolkit components are installed in your [!INCLUDE [prod_short](../includes/prod_short.md)]. If the components aren't installed, the extension installs them.

    * The Performance Toolkit.
    * The sample test cases.
    * The PowerShell scripts.

1. When installation is complete, choose **Open a new window** to open your project.

### Create codeunits for your test scenarios

The test scenarios that the extension provides are meant to serve as inspiration for creating your own tests. To test your environment, you need to write your own scenarios. A test scenario is a codeunit of either a **Normal** or **Test** subtype.

If the subtype is Normal, the test scenario should be defined in the `OnRun` trigger because the Performance Toolkit uses the codeunit to run the test scenario. These codeunits are useful when you want to write a scenario without the involvement of pages, illustrated by the following example.

```al
codeunit 50000 "Create Sales Order"
{
    var
        BCPTTestContext: Codeunit "BCPT Test Context";

    trigger OnRun();
    var
        Customer: Record Customer;
        *SalesHeader: Record "Sales Header";*
    begin
        Customer.FindFirst();
        *SalesHeader.Init();*
        *SalesHeader."Document Type" := SalesHeader."Document Type"::Order;*
        *SalesHeader.Insert(true);*
        BCPTTestContext.EndScenario('Add Order');
        BCPTTestContext.UserWait();
        BCPTTestContext.StartScenario('Enter Account No.');
        *SalesHeader.Validate("Sell-to Customer No.", Customer."No.");*
        *SalesHeader.Modify(true);*
        BCPTTestContext.EndScenario('Enter Account No.');
        BCPTTestContext.UserWait();
```

To interact with pages and make the tests more realistic, define a codeunit of the subtype **Test** and use [Test Pages](devenv-testing-pages.md). The following code example shows the main difference between normal and test codeunits.

```al
codeunit 50000 "Create Sales Order"
{
    *Subtype = Test;*

    var
        BCPTTestContext: Codeunit "BCPT Test Context";

    trigger OnRun();
    var
        Customer: Record Customer;
        *SalesOrder: TestPage "Sales Order";*
    begin
        Customer.FindFirst();
        *SalesOrder.OpenNew();*
        *SalesOrder."No.".SetValue('');*
        BCPTTestContext.EndScenario('Add Order');
        BCPTTestContext.UserWait();
        BCPTTestContext.StartScenario('Enter Account No.');
        *SalesOrder."Sell-to Customer No.".SetValue(Customer."No.");*
        BCPTTestContext.EndScenario('Enter Account No.');
        BCPTTestContext.UserWait();
```

> [!TIP]  
> We recommend that you only write scenarios using test pages for scenarios in which the client behavior is predictable. For example, if an unexpected dialog shows up during the test, the test will fail with an exception.

Tests can use the `StartScenario` and `EndScenario` functions on the **BCPT Test Context** codeunit to log when the scenario you're measuring started and stopped. These scenarios can also be nested, as shown in the earlier example. Here we have a top level scenario for *Add order*, which contains subscenarios, such as *Enter Account No.*. This allows you to perform overall measurements and more detailed measurements.

To simulate delays between user actions and make your tests more realistic, call the `UserWait()` function while moving between fields. When using [!INCLUDE[prod_short](includes/prod_short.md)], an implicit `Commit()` is called for every interaction. Tests should simulate the implicit `Commit()` by calling an explicit `Commit()`.

> [!NOTE]  
> The `UserWait` function will call the commit, so you don't need to do it yourself.

You can also specify parameters that you can provide for your tests. This is useful when you want to be able to change certain behavior of your test. For example, you might want to change the number of sales lines you add to a sales order. To enable parameters, implement the **BCPT Test Param. Provider** interface. The following example shows how to implement the interface.

```al
codeunit 50000 "Create PO with N Lines" implements "BCPT Test Param. Provider"
{
    var
        BCPTTestContext: Codeunit "BCPT Test Context";
        NoOfLinesParamLbl: Label 'Lines';
        ParamValidationErr: Label 'Parameter is not defined in the correct format. The expected format is "%1"', Comment = '%1 = Format';
        NoOfLinesToCreate: Integer;

    trigger OnRun();
    begin
        ...
    end;

    procedure GetDefaultParameters(): Text[1000]
    begin
        exit(copystr(NoOfLinesParamLbl + '=' + Format(10), 1, 1000));
    end;

    procedure ValidateParameters(Parameters: Text[1000])
    begin
        if StrPos(Parameters, NoOfLinesParamLbl) > 0 then begin
            Parameters := DelStr(Parameters, 1, StrLen(NoOfLinesParamLbl + '='));
            if Evaluate(NoOfLinesToCreate, Parameters) then
                exit;
        end;
        Error(ParamValidationErr, GetDefaultParameters());
    end;
}
```

Next, extend the **BCPT Test Param. Enum** to make it available in the Performance Toolkit.

```al
enumextension 50000 "Test Codeunits with Params" extends "BCPT Test Param. Enum"
{
    value(50000; "50000")
    {
        Implementation = "BCPT Test Param. Provider" = "Create PO with N Lines";
    }
    ...
}

```

Learn more about writing test scenarios at [Testing the Application Overview](devenv-testing-application.md).

### Configure a BCPT suite

Configure a suite for the scenario that you want to simulate. When you configure a suite, you need to specify:

* What tests to run and, if applicable, with what parameters.
* How many concurrent sessions you want to simulate for each test.
* The duration of the scenario.

#### Single and multiple sessions

Typically, you want to run the suite for multiple sessions at the same time. After you configure the suite, you can do that by using the **Start** action. You can also use the Visual Studio Code extension or PowerShell scripts. Learn more at [Run a test suite using the Visual Studio Code extension](#run-a-test-suite-using-the-visual-studio-code-extension).  

To do a quick test, for example, during the development phase, choose the **Start in Single Run mode** action to run all your tests (suite lines) one time. It also skips the user delays. Single Run mode lets you monitor the number of SQL statements between runs and define baselines, and gives you quick feedback that can help identify regressions early on.

You can run up to 500 sessions at the same time for a test suite. The **Total No. of Sessions** field shows how many sessions are created when you run the suite.

#### Run tests in the background and foreground

On the suite lines, the **Run in Foreground** checkbox lets you run tests in the foreground rather than as a background task. You can specify this for each individual suite line. However, if your test involves UI interactions, then it must run in the foreground. From the client, it's only possible to have one foreground test running at a time. If multiple lines have the run in foreground option enabled, they'll run sequentially. Background tests will still run in parallel.

> [!NOTE]
> If you must run multiple foreground tests in parallel, you must use the Visual Studio Code extension or the PowerShell scripts.

#### Prepare your suite

The settings to configure a suite depend on the environment that you want to simulate. The following procedure provides an example for testing multiple sessions, but the steps also apply to a single run.  

1. Search for **BCPT Suites**, and choose the related link.
1. Choose **New** to open the **BCPT Suite** page.
1. In the **Code**, **Description**, and **Tag** fields, provide an identifier, some information about the test, and a tag that you can use to find the results of the suite on the Log Entries page. Tags are useful if you want to generate different sets of log entries from a suite. An example could be to measure performance before and after installing extensions. Use the tag to differentiate between those two runs.
1. To define the timing for the run, follow these steps.

    1. The **1 Work Day Corresponds to** field works with the **Duration (minutes)** field to update the **Work Date Starts at** field. Use the **1 Work Day Corresponds to** field to test processes that have deadlines, such as payments. The duration can be up to 240 minutes.
    1. The **Default Min. User Delay** and **Default Max. User Delay** fields let you simulate pauses between actions. You must specify a delay. Between each iteration, for example when creating sales orders, you can define a **Delay** (Delay between iterations) before the test starts on the next sales order. The delay can be **Fixed** or **Random**. Delays aren't included in the results for run times.
1. Configure lines for the suite. The lines contain some of the settings from the header. Updating the values on the lines will also update the header.

    1. If your test supports parameters, in the **Parameters** field, enter the parameters for your test. The Parameter field must not contain spaces.
    1. In the **No. of Sessions** field, enter the number of concurrent users to simulate in the workflow.
    1. In the **Min. User Delay (ms)** and **Max. User Delay (ms)** fields, specify how long to pause between actions. When you run a suite in Single Run mode, user delays are ignored.    
    1. In the **Delay between interactions (sec)** field, specify how long to pause between each run of the codeunit for each session. Use this field to simulate how much work each user do. If one user creates 15 sales orders an hour, then you would need ~240 seconds (4 minutes) of delay between each test to achieve that throughput.
    1. In the **Delay Type** field, specify whether to use a fixed or random delay. If you choose **Fixed**, the test pauses for the number of seconds specified in the **Delay between iterations (sec)** field.

## Test performance

There are three ways to run BCPT suites.

* Directly from [!INCLUDE[prod_short](includes/prod_short.md)].
* By using the Visual Studio Code extension or PowerShell scripts.
* By using AL-Go for GitHub. For more information, see [Workflow: Create new Performance Test App](https://github.com/microsoft/AL-Go/blob/main/RELEASENOTES.md#new-workflow-create-new-performance-test-app)


### Known limitations

There are a couple of limitations for running BCPT suites.

* If you run it from the client, you can only run one session at a time in the foreground.
* Depending on whether your environment is on-premises, Docker, or online, there might be a limit to the number of sessions you can run at the same time in the background. Typically, the default number of sessions is **10**. Learn more at [Operational Limits for Business Central Online](../administration/operational-limits-online.md).

If your BCPT suite runs more than one session in the foreground, or more than 10 sessions at the same time in the background, you must run the suite from the Visual Studio Code extension or PowerShell. Learn more at [Run using the PowerShell scripts](#run-using-the-powershell-scripts).

### To run a test in Single Run mode

The following steps provide an example of how to run a test in Single Run mode.

1. On the **BCPT Suites** page, choose **New**.
2. In the **Code** field, enter a name for the test suite. In this example, we use **PreTest**.
3. In the **Tag** field, enter something that makes it easy to identify the suite later when you analyze the results.
4. The fields for duration and delays aren't used for Single Run mode, so we leave their default values.
5. On the BCPT Suit Lines FastTab, choose the test suite for your component.
6. In this example, we're calculating the total weight of the items on a sales order, so we use the **Sales Order** page test with a parameter that creates four lines. The parameter looks as follows: Lines=4.
7. Clear the **Run in Foreground** checkbox. This runs the test suite in a background thread.
8. Choose **Start in Single Run mode**.
9. To set your baseline after the run completes, in the **Base Version** field, enter **1**.

    > [!TIP]  
    > If you run the test again you'll have delta values on the test line. Learn more at [Analyze the results](#analyze-the-results). You can reset the baseline to any version, and run as many tests as needed.

### Run a test suite using the Visual Studio Code extension

Running suites from the Visual Studio Code extension gives you realistic simulations of multiple people working at the same time. To offer a seamless experience, we have provided a command in the Visual Studio Code extension for starting.

1. In Visual Studio Code, run the **BCPT: Run BCPT (PowerShell)** command.
2. Select the environment type.
3. Select the specific environment to target.
4. Enter the BCPT suite code to run.
5. Optional: If you're targeting an online sandbox environment, you might be prompted to sign in.

An internal PowerShell process should start and an output window appears in Visual Studio Code that shows output similar to this:

:::image type="content" source="../media/vscode_output.png" alt-text="Example of VS Code output from Powershell.":::

### Run using the PowerShell scripts

> [!NOTE]  
> The the Performance Toolkit extension in Visual Studio Code automatically installs these PowerShell scripts. However, if you aren't using the Performance Toolkit in Visual Studio Code, you'll need to download the scripts. The scripts are available in the [DVD](/dynamics365/business-central/dev-itpro/deployment/install-using-setup) in the **Applications\testframework\TestRunner** folder. To get there, follow these steps:
>
> 1. Go to [Download the files](/dynamics365/business-central/dev-itpro/deployment/install-using-setup#download-the-files).
> 1. Choose the link to the latest version of [!INCLUDE [prod_short](../includes/prod_short.md)].
> 1. In the **Resolution** section, choose the link to the latest update.

Depending on what you want to do, there are several ways to start the test suite by using the PowerShell scripts.

Create the credential object.

```powershell
$Credential = New-Object PSCredential -ArgumentList <user email>,(ConvertTo-SecureString -String <password> -AsPlainText -Force)

```

Start tests in a [!INCLUDE[prod_short](includes/prod_short.md)] online sandbox.

```powershell
RunBCPTTests.ps1 -Environment PROD -AuthorizationType AAD -Credential $Credential -SandboxName <sandbox name> -ClientId <AAD application ID> -TestRunnerPage 149002 -SuiteCode "TRADE-50U" -BCPTTestRunnerInternalFolderPath <path to Internal folder>

```

Start tests in a [!INCLUDE[prod_short](includes/prod_short.md)] on-premises database.

```powershell
RunBCPTTests.ps1 -Environment OnPrem -AuthorizationType Windows -Credential $Credential -TestRunnerPage 149002 -SuiteCode "TRADE-50U" -ServiceUrl <webclient address> -BCPTTestRunnerInternalFolderPath <path to Internal folder>

```

> [!NOTE]
> When you use RunBCPTTests.ps1, there are a few important parameters to use.
>
> * `-Environment` - Specifies the environment the tests will be run in. The supported values are `PROD`, `TIE`, and `OnPrem`. Default is `PROD`.
> * `AuthorizationType` - Specifies the authorization type needed to authorize to the service. The supported values are `Windows`,`NavUserPassword`, and `AAD`.
> * `SandboxName` - Specifies the sandbox name. This is necessary only when the environment is either `PROD` or `TIE`. Default is `sandbox`.
> * `ServiceUrl` - Specifies the base URL of the service. This parameter is used only in `OnPrem` environment. For example, `http://localhost:8080/PerformanceToolkit`.
> * `ClientId` - Specifies the guid that the [!INCLUDE [prod_short](includes/prod_short.md)] is registered with in Azure AD. To set up Azure AD, go to [https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess](https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess).

1. In Visual Studio Code, on the Explorer Pane, choose the script that you want to run.
2. Choose the type of environment you want to target.
3. Choose the environment to run the test in.
4. Enter the name of the BCPT suite that you want to run, and then choose **OK**.

In [!INCLUDE [prod_short](../includes/prod_short.md)], you can check the status of the BCPT suite by choosing the **Refresh** action.

> [!NOTE]
> When you run tests there's a two second delay between new sessions. The delay prevents locking issues when the users are signing into [!INCLUDE [prod_short](../includes/prod_short.md)].

### Running scenarios using AL-Go for GitHub

It's possible to run BCPT scenario runs in AL-Go for GitHub. For more information, see [Workflow: Create new Performance Test App](https://github.com/microsoft/AL-Go/blob/main/RELEASENOTES.md#new-workflow-create-new-performance-test-app).

## Analyze the results

Results show on the **BCPT Suite Lines** FastTab. The following tables describe the fields that show results of the current run, the baseline, and the delta between the two.

|Fields for Current Run  |Description  |
|---------|---------|
|**No. of Iterations**|How many times it ran. This is **1** because we used the **Start in Single Run Mode** action.|
|**Total Duration in (ms)**|How long it took to complete one iteration.|
|**Average duration** |Equal to the **Total Duration in (ms)** field for the first run, but after you run a test multiple times it's a result of the sum of runs since your baseline.|
|**No. of SQL statements**|The number of SQL statements generated for one run.|
|**Avg. No. of SQL Statements**|Similar to the duration fields, for the first run this will be the same as the **No. of SQL statements** field, but will become averaged after subsequent runs.|
  
The following table describes the fields related to the baseline.
  
|Fields for Baseline  |Description  |
|---------|---------|
|**No. of Iterations Base**|Not relevant for Single Run mode.|
|**Total Duration Base (ms)**|The total duration of the baseline run.|
|**Avg. Duration Base (ms)**|Not relevant for Single Run mode.|
|**Avg. No. of SQL Statements Base**|The number of SQL statements in your base run.|
  
The following table describes the fields that show the delta between the run and the baseline.
  
|Fields for the Delta  |Description  |
|---------|---------|
|**Change in No. of SQL statements (%)**|The percent of difference between the baseline and the latest run.|
|**Changes in Duration (%)**|The change in measured time between a baseline and the latest run.|

> [!NOTE]
> The first iteration of any run will show a higher number of SQL Statements because nothing has been cached.

### Comparing runs in the Change Log

Before you run a test with the change sign in, change the **Tag** field to **Change log**. When you explore the log entries afterwards, either remove the filter on the **Version No.** field, or change it to only include the last two runs. After exporting to Excel, select the tag as columns in the pivot table, use **Operation** as a filter, and set the filter to **Scenario**.

<!--Logging all changes to the sales and purchase line significantly added to the duration, and the added load made the other scenarios a bit slower. this might be a note-->

### Troubleshoot log entries

After running the suite, you can choose **Log Entries** to see what happened. Use the **Show Errors** and **Show sessions running at the same time as this** actions to apply filters to the results. For example, filtering can help troubleshoot errors by showing what a user was doing when an error occurred. By default, the page is filtered to show the latest version, but you can change or remove the filter if you want to compare runs. You can use the **Open in Excel** action to build dashboards that can help visualize performance results.

<!--********NEED AN IMAGE OF THE LOG ENTRIES PAGE******************-->

Log entries are listed in the order that they were created, which means that the different scenarios are mixed. <!--they need to apply filters to group results, I guess?--> Each run is identified by the value in the **Version No.** fields.

The **Operation** column shows the individual measurements, where the term *Scenario* is used for running the codeunit without the user wait time. The **No. of SQL Statements** column includes the SQL statements that were issued by the scenario and system activities, such as retrieving metadata. The counts exclude the log entries themselves. To drill down to a single session, filter on the **Session No.** field or choose **Open in Excel** to create a pivot table and pivot chart for deeper analysis.

### Example: Evaluate SQL calls and timing in Single Run mode

This example shows how to use Single Run mode for performance regression testing (PRT) between changes to code, to evaluate SQL calls and timing. While developing a new extension, you often start out with limited code and may want to wait to do a larger benchmark test with simulated concurrent users until you’re closer to having a full, end-to-end scenario. You can use the **Start in Single Run Mode** action to perform a limited test, for example, on a new extension. Single Run mode provides things like a baseline, the ability to run the test in the background, and give you instant feedback.

The data that the runs generate is persisted in the database. If the database is maintained, you can set previous runs as baseline.

### Analyze with telemetry
If you have enabled telemetry on your test environment, then you get telemetry when the Performance Toolkit runs start/complete and when scenarios complete (including measurements). Learn more at [Performance toolkit telemetry](../administration/telemetry-performance-toolkit-trace.md).

The telemetry data emitted from the Performance Toolkit can then be analyzed using the Power BI Performance report or directly with KQL. See sample KQL code here: [https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/KQL/Queries/ExampleQueriesForEachArea/PerformanceToolkit.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/KQL/Queries/ExampleQueriesForEachArea/PerformanceToolkit.kql).


## BCPT FAQ

### Can I use BCPT in production?

No, BCPT doesn't work on production environments.

### Does BCPT work on-premises?

Yes, BCPT works on on-premises/local sandboxes and on online sandboxes.

### Can I run scenarios in a DevOps pipeline?

Yes, it's possible to run BCPT scenario runs in AL-Go for GitHub. See https://github.com/microsoft/AL-Go/blob/main/RELEASENOTES.md#new-workflow-create-new-performance-test-app:~:text=New%20workflow%3A%20Create%20new%20Performance%20Test%20App.

### Do you have sample code for scenarios?

Yes, to get you started quickly, open source scenario code is available here: https://github.com/microsoft/ALAppExtensions/tree/main/Other/Tests/BCPT-SampleTests.

### What does it cost?

The Performance Toolkit is free to download and use.

### Can I get telemetry for BCPT runs?

Yes, if you have enabled telemetry on your test environment, you get telemetry when BCPT runs start/complete and when scenarios complete (including measurements). See more at [Analyzing Performance Toolkit Telemetry](../administration/telemetry-performance-toolkit-trace.md).

### How can I analyze BCPT data?

The telemetry data emitted from the Performance Toolkit can be analyzed using the Power BI Performance report:
![Performance Toolkit report in PBI](images/bcpt-pbi-report.png).

You can also analyze this data directly with KQL, see sample code here: https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/KQL/Queries/ExampleQueriesForEachArea/PerformanceToolkit.kql.

### What PowerPoint presentations are available?

To make it easier to adopt BCPT, we added many PowerPoint presentations that you can use for various situations.

For more information, see [PowerPoint presentations](https://github.com/microsoft/BCTech/blob/master/samples/BCPT/presentations/README.md).

### I want to learn about BCPT. Where are the blogs?

Visit the [BCPT video page](https://github.com/microsoft/BCTech/blob/master/samples/BCPT/VIDEOS.md) for learning resources published as videos.

Visit the [BCPT blogs page](https://github.com/microsoft/BCTech/blob/master/samples/BCPT/BLOGS.md) for learning resources published as blogs.


## See also

[Testing the Application Overview](devenv-testing-application.md)  
[Performance toolkit telemetry](../administration/telemetry-performance-toolkit-trace.md)   
[Development in AL](devenv-dev-overview.md)  
[Best Practices for AL](../compliance/apptest-bestpracticesforalcode.md)
