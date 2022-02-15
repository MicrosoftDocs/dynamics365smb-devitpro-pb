---
title: "Set up your own GitHub runner to increase build performance"
description: "Setting up a GitHub runner to help increase the performance on builds for AL-Go projects for Business Central."
author: freddyk
ms.custom: na
ms.date: 01/21/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Set up your own GitHub runner to increase build performance

> *The prerequisite for this how to is that you have an AL-Go repository setup using one of the scenarios in this repo.*

When running the CI/CD workflow, the build job is by far the most time-consuming job. By adding your own GitHub Runner, which can cache the generic image, the build image and also the artifacts, the time for running the build job can become much faster.

GitHub runners can be registered for an organization (accessible for all repositories in the organization) or for a single repository.

## Steps

1. Navigate to the equivalent URL of `https://github.com/organizations/{organization}/settings/actions/runners/new` where `{organization}` is the name of your organization. Here you can create a self-hosted runner for your organization. Use the equivalent URL of `https://github.com/{organization}/{repository}/settings/actions/runners` with `{organization}` and `{repository}` filled in with your organization name and repository name. Here you create a self-hosted runner for a single repository.
1. To create a self-hosted runner manually, choose **Windows** under **Runner Image** and **x64** in architecture and follow the description on how to create a self-hosted runner manually, then go to step 9 to continue the configuration.
1. To create an Azure VM hosting x self-hosted runners, open a new tab and navigate to `https://aka.ms/getbuildagent`.
1. Enter the **Resource Group** name, **Region**, **VM Name**, and **Admin Password** of your choice.
1. Enter the number of agents you want to create on the VM.
1. Grab the token, the organization URL, and the Agent URL from the **Create Self-Hosted runner** page, and specify self-hosted in labels.
1. Select **Review and Create** and then review the deployment and choose **Create**.
1. Wait for the Azure VM creation to finalize, navigate back to see that the runners have been registered and are ready to use.
1. On the list of **Runners on GitHub**, choose the runner group **Default** and allow public repositories if your repository is public.
1. Now navigate to your project settings file (.AL-Go/settings.json) and set `gitHubRunner` to self-hosted.
1. Save and inspect your workflows performance increase on the second run.
1. Inspect that one of the runners pick up the workflow.
1. Clicking the runner reveals that the job is running.

## Additional information on build performance

1. Running six CI/CD workflows simultaneously, causes one workflow to wait as I only had five runners.
1. Connecting to the runner VM and looking at utilization indicates that the VM is pretty busy and probably over-allocated when starting 5+ builds at the same time. Every build was ~50% slower than when running only one build.
1. Decreasing the number of runners to four causes the build performance to be similar to when running just one build.
1. Turning off real-time protection on the self-hosted runner makes builds go ~25% faster.

## Next step

From here, you can look at [Introducing a Dependency to Another GitHub Repository](algo-dependency-app-github.md).  

## See also