---
title: "Register a Customer Production Environment for Manual Deployment"
description: "Set up and register a customer production environment for AL-Go for manual deployment for Business Central."
author: freddyk
ms.custom: na
ms.date: 12/30/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Register a Customer Production Environment for Manual Deployment

> *The prerequisites for this how to is that you have completed the [Create a Release of Your Application](algo-create-release-app.md) instructions, and that you have an online production environment setup for S2S as specified in [task 2](../administration/automation-apis-using-s2s-authentication.md#task-2-set-up-the-azure-ad-application-in-) in the [Using Service-to-Service (S2S) Authentication](../administration/automation-apis-using-s2s-authentication.md) in the [Using Service to Service Authentication](../administration/automation-apis-using-s2s-authentication.md) topic, using the same AAD App as you did in the Create a Release of Your Application scenario.*

> [!NOTE]  
> Environments are only supported in public repositories or with GitHub Enterprise license, see [Using environments for deployment](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment). We are considering adding a secondary option for listing environments.

## Steps

1. Following the process in the [Register a Customer Sandbox Environment for Continuous Deployment using S2S Authentication](algo-register-sandbox-env.md) topic, you can add an environment to the GitHub repository under the **Settings** tab called `MYPROD` (Production) (the name of your production environment followed by “ (Production)”), which maps to a production environment called `MYPROD`. Remember to add the `AUTHCONTEXT` secret. Apps will **not** be deployed to production environments from the CI/CD pipeline, by adding the (Production) tag, the environment will be filtered out already during the Analyze phase. You need to run the **Publish To Environment** workflow to publish the apps. Leave the `App` version as current, which means that the latest released bits are published to `MYPROD`.
2. After running the **Publish to Environment** workflow, check that the app was deployed to the `MYPROD` environment only.

## Next step

Next, you can [Update AL-Go System Files](algo-update-system-files.md).
 
## See also

[AL-Go Overview](algo-overview.md)  