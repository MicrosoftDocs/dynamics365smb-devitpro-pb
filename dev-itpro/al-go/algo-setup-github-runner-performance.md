---
title: "Set up your own GitHub runner to increase build performance"
description: ""
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

Navigate to https://github.com/organizations/{organization}/settings/actions/runners/new to create a self-hosted runner for your organization. Use https://github.com/{organization}/{repository}/settings/actions/runners to create a self-hosted runner for a single repository.

## See also