---
title: "Create a Release of Your Application"
description: ""
author: freddyk
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Create a Release of Your Application

> *The prerequisite for this how to is that you have followed and completed the [Register a customer sandbox environment for Continuous Deployment using Service-to-Service Authentication](algo-create-release-app.md) instructions.*

1. On www.github.com, in your project, go to the **Actions** tab and in the left pane, select **Create Release**. 
1. Choose **Run workflow**, and in the dialog enter `1.0` as name and tag of the release, and then choose **Run workflow**.
1. When the create release workflow completes, choose the **< > Code** tab to see the releases.
1. Choose the release (1.0).  
The release notes are pulled from all pull requests checked in since the last release. The auto-generated release note also contains a list of the new contributers and a link to the full changelog. 
1. Choose the **Edit** button icon (the pencil) to modify the release notes.  
At the bottom, you can see the artifacts published, both the apps and the source code. A tag is created in the repository for the release number to always keep this.

## See also

[Get Started](algo-get-started.md)  
[Add a Test App](algo-add-test-app.md)  
[Register a Customer Sandbox Environment for Continuous Deployment using S2S Authentication](algo-register-sandbox.md)  