---
title: "Overview of AL-Go"
description: "Overview of how to use AL-Go for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/14/2022
ms.reviewer: 
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Overview of AL-Go

AL-Go for GitHub contains a set of GitHub templates and actions that can be used to set up and maintain professional DevOps processes for your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] AL projects.

The goal is that people who have created their GitHub repositories based on the AL-Go templates, can maintain these repositories and stay current just by running a workflow, which updates their repositories. This includes necessary changes to scripts and workflows to cope with new features and functions in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

The template repositories to use as starting point are:

- For creating a **per-tenant extension**, this is your starting point
**[https://github.com/microsoft/AL-Go-PTE](https://github.com/microsoft/AL-Go-PTE)** is the GitHub repository template for per-tenant extensions.
- For creating an **AppSource app**, this is your starting point
**[https://github.com/microsoft/AL-Go-AppSource](https://github.com/microsoft/AL-Go-AppSource)** is the GitHub repository template for AppSource apps. 


The usage scenarios below take you through how to get started and how to perform the most common tasks.

- [Create a New Per-Tenant Extension and Start Developing in Visual Studio Code](algo-get-started.md)  
- [Add a Test App to an Existing Project](algo-add-test-app.md)  
- [Register a Customer Sandbox Environment for Continuous Deployment using S2S](algo-register-sandbox-env.md)  
- [Create a Release of Your Application](algo-create-release-app.md)  
- [Register a Customer Production Environment for Manual Deployment](algo-register-cust-prod-env.md)  
- [Update AL-Go System Files](algo-update-system-files.md)  
- [Use Azure KeyVault for Secrets with AL-Go](algo-enable-keyvault-app-development.md)  
- [Create Online Development Environment from Visual Studio Code](algo-create-online-dev-env-vscode.md)  
- [Create Online Development Environment from GitHub](algo-create-online-dev-env-github.md)  
- [Set up CI/CD for an Existing Per-Tenant Extension](algo-setup-cicd-existing-pte.md)  
- [Set up CI/CD for an Existing AppSource App](algo-setup-cicd-existing-app.md)  
- [Enable KeyVault Access for Your AppSource App during Development and/or Test](algo-enable-keyvault-app-development.md)  
- [Set up Your Own GitHub Runner to Increase Build Performance](algo-setup-github-runner-performance.md)  
- [Introducing a Dependency to Another GitHub Repository](algo-dependency-app-github.md)  
- [Enabling Telemetry for AL-Go Workflows and Actions](algo-enabling-telemetry.md)  

To get information about which settings you can use to control the behavior of AL-Go, please read [AL-Go Settings](algo-settings.md)

## See also

[Developing Extensions in AL](../developer/devenv-dev-overview.md)
[AL-Go for GitHub](https://freddysblog.com/2022/04/26/al-go-for-github/)
[Migrating to AL-Go for GitHub](https://freddysblog.com/2022/04/27/migrating-to-al-go-for-github/)
[Structuring your AL-Go for GitHub repositories](https://freddysblog.com/2022/04/28/structuring-your-github-repositories/)
[Preview of future AL-Go for GitHub functionality](https://freddysblog.com/2022/05/02/al-go-for-github-preview-bits/)
[Branching strategies for your AL-Go for GitHub repo](https://freddysblog.com/2022/05/03/branching-strategies-for-your-al-go-for-github-repo/)
[Deployment strategies and AL-Go for GitHub](https://freddysblog.com/2022/05/06/deployment-strategies-and-al-go-for-github/)
[Secrets in AL-Go for GitHub](https://freddysblog.com/2022/05/14/secrets-in-al-go-for-github/)
