---
title: "Register a customer sandbox environment for Continuous Deployment using Service-to-Service Authentication"
description: ""
author: freddyk
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Register a Customer Sandbox Environment for Continuous Deployment using Service-to-Service Authentication

> *Prerequisites: A completed [Add a Test App](algo-add-test-app.md), an AAD App, and an online sandbox environment called `QA` with the setup for Service-to-Service as specified in [task 1](../administration/automation-apis-using-s2s-authentication.md#task-1-register-an-azure-ad-application-for-authentication-to-business-central) and [task 2](../administration/automation-apis-using-s2s-authentication.md#task-2-set-up-the-azure-ad-application-in-) in the [Using Service-to-Service (S2S) Authentication](../administration/automation-apis-using-s2s-authentication.md) topic completed. You will also need the `BcContainerHelper` PowerShell module installed on your computer.*

> [!NOTE]  
> Environments are only supported in public repositories or with GitHub Enterprise license. For more information, see [Using environments for deployment](/actions/deployment/targeting-different-environments/using-environments-for-deployment). We are considering adding a secondary option for listing environments.

1. On www.github.com, go to your project, and on the **Settings** tab and in the left pane, choose **Environments**. Choose the **New Environment** button and specify the name of the environment you have created in your tenant, for example `QA` and then choose **Configure environment**.
1. Under **Environment secrets**, choose the **Add Secret** action. Create a secret called `AUTHCONTEXT`, and enter a *compressed JSON* construct with 3 values: TenantID (where the environment lives), ClientID, and ClientSecret (from the pre-requisites), such as:  
```json
{"TenantID":"<TenantID>","ClientID":"<theClientID>","ClientSecret":"<theClientSecret>"}
```  
For example:
```json
...
```
1. Now, navigate to the **Actions** tab, select the **Publish To Environment** workflow and choose **Run workflow**. Enter `latest` in the **App version** field and the name of your environment or keep the * in the environment to receive the new version field, and then choose **Run workflow**.  
When the workflow completes, you can inspect the output of the workflow.
1. And, you can open the `QA` environment, navigate to **Customers** and see that your very own **Hello World** message appears.


## See also