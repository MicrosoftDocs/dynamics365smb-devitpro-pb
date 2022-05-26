---
title: "Set up CI/CD for an existing per-tenant extension (BingMaps)"
description: "Setting up continuous integration, continuous delivery for existing PTE extension for Business Central."
author: freddyk
ms.custom: na
ms.date: 01/24/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Set up CI/CD for an Existing Per-Tenant Extension (BingMaps)

> *The prerequisites for this how to is that you have a GitHub account.*

This how to uses the BingMaps sample app, which can be found on GitHub in the [Business Central BingMaps.PTE repo](https://github.com/BusinessCentralApps/BingMaps.PTE). Copy the following URL (a direct download of the latest released app file from BingMaps sample) to the clipboard: https://businesscentralapps.blob.core.windows.net/bingmaps-pte/latest/bingmaps-pte-apps.zip – you can also download the .zip file and see the content of it.

## Steps

1. Navigate to https://github.com/microsoft/AL-Go-PTE and then choose **Use this template**.
1. Enter `app2` as repository name and select **Create Repository** from template.
1. On the **Actions** tab, select the **Add existing app or test app** workflow and then choose **Run workflow**.
1. In the **Direct Download URL** field, paste in the direct download URL of the BingMaps sample from above.
1. When the workflow is complete, inspect the pull request. 
1. Merge the pull request and the CI/CD workflow will kick off.
1. After the workflow completes, you can investigate the output and see that everything works.
1. Use [Register a customer sandbox environment for Continuous Deployment using Service-to-Service Authentication](algo-register-sandbox-env.md), [Create a Release of Your Application](algo-create-release-app.md), and [Register a Customer Production Environment for Manual Deployment](algo-register-cust-prod-env.md) to set up customer environments, publish, and test the app.

## Next step

It is also possible to [Set up CI/CD for an Existing Per-Tenant Extension](algo-setup-cicd-existing-pte.md).

## See also

[AL-Go Overview](algo-overview.md)  