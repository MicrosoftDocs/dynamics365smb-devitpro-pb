---
title: Application lifecycle management
description: Learn how to use AL-Go to implement application lifecycle management (ALM) for your Power Apps 
author: andersgMSFT
ms.author: andersg
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.date: 04/21/2023
ms.custom: bap-template
---

# Application lifecycle management for Power Apps in Business Central (preview)

[!INCLUDE[general_preview](../developer/includes/general_preview.md)]

When you're building and distributing software services, application lifecycle management (ALM) is key. For Power Platform, ALM means having your artifacts in a Power Platform *solution* and using a designated tool to manage its lifecycle.

*Solutions* are the basis of all ALM in the Power Platform now and going forward. This methodology also applies to Power Apps. To learn more about solutions and ALM in the Power Platform, see [Develop an application lifecycle management strategy](/training/modules/application-lifecycle-management-strategy/) module on Microsoft Training.

Business Central offers full ALM support for Power Platform solutions in our Al-Go for GitHub template. The integration lets you store your AL and Power Platform artifacts in a single repository&mdash;where you can manage it with a unified set of tools. This setup means you can add Power Platform artifacts to your offering without any extra management and setup cost.  

The Al-Go for GitHub template is open source and based on the [GitHub Actions for Microsoft Power Platform](https://github.com/marketplace/actions/powerplatform-actions). For now, we only support per-tenant extensions, not AppSource extensions. To learn more, about the template and how to use it, go to [https://github.com/microsoft/AL-Go/tree/PPPreview](https://github.com/microsoft/AL-Go/tree/PPPreview).

## New and updated workflows

As part of the new support for Power Platform solutions, we have updated the following workflows and added a couple of new ones:

### CI/CD

The **CI/CD** workflow has been updated with more steps to support Power Platform solutions. That means that if you have added configuration for a Power Platform solution to your Al-go settings, they're automatically part of your CI/CD process.

### Create Release

The **Create Release** workflow has been updated to support Power Platform solutions. The workflow creates a GitHub release and uploads the Power Platform solution and AL artifacts to it as assets.

### Publish to Environment

The **Publish to environment** workflow has been updated to support Power Platform solutions. The workflow now has more steps that check that the AL extension has been successfully deployed, and then deploys the Power Platform solution to the environment specified.

### Pull Power Platform changes

The **Pull Power Platform changes** workflow is a new workflow that makes working with Power Platform solutions easier. The workflow pulls the latest published changed to a Power Platform solution into your repository. The flow can either do direct commits to the main branch or create a PR with the latest changes for review.

### Push Power Platform changes

The **Push Power platform changes** workflow is a new workflow that makes working with Power Platform solutions easier. The workflow lets you push your latest Power Platform solution changes to a specified environment.

This workflow is especially useful when working multiple people on feature branches, where you don't have release or CI/CD artifacts to publish.

## How to connect your AL-Go for GitHub repository to your Power Platform environment

To connect your Al-Go for GitHub environment to Power Platform, you need to create an authentication context, and update the Al-GO Settings file with the relevant connection information.

For detailed step-by-step guide, see the Al-go ReadMe file:  https://github.com/microsoft/AL-Go/tree/PPPreview

## Known limitations

- Hard-coded Business Central connection information  
  
  The connection to Business Central is hard coded into the Power App files, which means that you have to use the **Publish Environment**  or **Push Power Platform changes** actions to deploy the package. If you manually deploy the package, you need to update the connection references manually inside the maker experience.

## Next steps

- Use the available sample apps as an easy starting point to try Business Central and Power Platform. For more information, see [Sample apps](power-apps-samples.md).
- Review the [Best practices for Power Apps with Business Central](power-apps-best-practices.md) for tips on building Power Apps.