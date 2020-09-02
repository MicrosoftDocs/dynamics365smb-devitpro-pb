---
title: "Performance Toolkit Extension"
description: Test your extensions for performance regressions. 
author: bholtorf
ms.custom: na
ms.date: 06/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: bholtorf
---

# The Performance Toolkit Extension
[!INCLUDE[prodshort](includes/prodshort.md)] often serves as a scalable platform on which ISVs and VARs deliver vertical solutions and customizations to their customers. To keep performance levels high in customer tenants, and keep them current with major and minor updates in ISV solutions and customizations, it's important to thoroughly test changes in code before releasing solutions. The Business Central Performance Toolkit helps developers track and compare performance between builds of their solutions by simulating current and projected customer loads.

To sum it up, the extension is intended to provide answers to questions such as, Does my solution for Business Central support X number of users doing this, that, and the other thing at the same time? It does not answer questions such as, How many orders can Business Central process per hour?

## Components of the Performance Toolkit
The Business Central Performance Toolkit is actually two extensions, the **Business Central Performance Toolkit** and the **Business Central Performance Toolkit Samples**. To get the full benefit of the toolkit, we recommend that you install both. Between the two, they provide the following:

1. A framework for configuring test suites, such as defining a set of tests or scenarios to run in parallel. The framework also logs results and lets you import and export suite definitions.  
2. Several tests for predefined test suites that cover basic scenarios. You can use these out-of-the-box, but because Business Central is typically customized for each company, the suites also serve as inspiration for partners or ISVs who want to configure suites that suit their own solutions and mimic their customer environments.
3. A command-line tool that must be installed on a client computer. To simulate multiple users signing in and using pages, for security reasons we must activate these scenarios from outside Business Central. The command-line tool will establish as many concurrent client sessions as specified in the suite that is being executed.

## Getting started
Go to AppSource and download and install the **Business Central Performance Toolkit** and, optionally, the **Business Central Performance Toolkit Samples** extensions.

The **BCPT Suites** page is where you create and manage your test suites. Each suite has a header that specifies general information about the suite, and lines that specify individual test scenarios. 

*******Image**************

## Configure a suite 
The following steps assume that the **Business Central Performance Toolkit Samples** extension is installed. The test suite that will be created has the following stats:

Number of concurrent users = 10
Duration of the session = 10
Scenario tested = Creating lines on sales orders
Time period = One work day

### To configure a suite

1. Search for **BCPT Suites**, and then choose the related link.
2. Choose **New** to open the BCPT Suite page.
3. 

## Starting the job from the command line
Open a PowerShell command prompt, and make sure you have installed the necessary binaries and scripts. <!--not sure whether they still need to check the binaries and scripts. If they do, where and how do they check that?--> The commands use the example from above. <!--To start a test on the local machine (“on-prem”), run this command: command is missing-->

First create an Authorization object in PowerShell with following command:

```
$Credential = New-Object PSCredential -ArgumentList <username>,
(ConvertTo-SecureString -String '<password>' -AsPlainText -Force)

```
Now run the following command:

```
<localpath>\ RunABTTests.ps1 -Environment OnPrem -
AuthorizationType NavUserPassword -TestRunnerPage 50010 -
SuiteCode “TRADE-50U" -ABTTestRunnerInternalFolderPath
<localpath>\ApplicationBenchmarkTool -Credential $Credential -
ServiceUrl <webclient URL>/BC
```

To start tests in a [!INCLUDE[prodshort](includes/prodshort.md)]d online sandbox, run these two commands:

```
$Credential = New-Object PSCredential -ArgumentList <user email>,
(ConvertTo-SecureString -String <password> -AsPlainText -Force)
RunABTTests.ps1 -Environment PROD -AuthorizationType AAD -
Credential $Credential -SandboxName <sandbox name> -
TestRunnerPage 150010 -SuiteCode "TRADE-50U"

```

> [!NOTE]
> When you start from the command-line, there is a two second delay between new sessions.

## Analyzing log entries
After running the suite, you can choose **Log Entries** to see what happened.

********Image of the Log Entries page******************

Log entries are listed in the order that they were created, so the different scenarios are mixed. Each test run is identified by the value in the **Version No.** fields. 

By default, the Log Entries page is filtered to show the latest version, but you can change or remove the filter if you want to compare runs. 

The **Operation** column shows the individual measurements, where the term _Scenario_ is used for running the codeunit without the user wait time. The **No. of SQL Statements** column includes the SQL statements that were issued by the scenario and system activities, such as retrieving metadata. The counts do, however, exclude the log entries themselves. To drill down to a single session, filter on the **Session No.** field or choose **Open in Excel** to create a pivot table and pivot chart for deeper analysis. 

> [!IMPORTANT]
> The actual numbers shown in the pivot table here are from running everything locally on a laptop.

## Comparing runs
In the following example the change log is turned on for all modifications on sales and purchase lines. However, this is not a recommended approach and used here for demonstration purposes only. <!--can we show a recommended approach instead?--> Before running the simulation with change log on, change the **Tag** field to **Change log**. When looking at the log entries afterwards, either remove the filter on the **Version No.** field, or change it to only include the last two runs. After exporting to Excel, select the tag as columns in the pivot table, use **Operation** as a filter, and set the filter to **Scenario**.

**************Image of pivot table and chart***************

Logging all changes to the sales and purchase line significantly added to the duration. But equally interesting, the added load on the system also caused the other scenarios to be a bit slower.


## Writing test suites
A test suite, in its simplest form, is just a codeunit that does something:

*************Image of codeunit**************
> [!NOTE]
> Note: The codeunit runs on the BCPT Line record, so it can read parameters, such as user delay and so on from the record fields.

To interact with pages to make the tests more realistic, define a codeunit of the subtype Test, as the example showing codeunit BCPT Open Item List. Test-codeunits don’t run on tables, so get the BCPT Line record by calling the BCPT Role Wrapper codeunit, which is a single instance codeunit. In the example of BCPT Open Item List, we have declared BCPTLine as a global variable, and as the first thing, we call the BCPT Role Wrapper to get the line. The example also shows the use of individual timers where we call the BCPTLine.StartScenario(‘<some name>’) which stores the current date-time, and later ABTLine.EndScenario(‘<some name>’) which creates a log entry, specifying the start and end time, duration, as well as the Operation (‘<some name>’ in this case). You must also call ABTLine.UserWait(), which simulates the user spending time in between fields, as well as it also issues a Commit().

> [!IMPORTANT]
> If you run tests on standard [!INCLUDE[prodshort](includes/prodshort.md)] demo companies, and you want to create more than just a handful of entities, you will probably have to change the number series or create a new one.

********Image of codeunit 150110*************


## See Also
[Testing the Application Overview](devenv-testing-application.md)  
[Development in AL](devenv-dev-overview.md)  
[Best Practices for AL](../compliance/apptest-bestpracticesforalcode.md)