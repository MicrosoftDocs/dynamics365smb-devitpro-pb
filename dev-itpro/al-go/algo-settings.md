---
title: "Overview of AL-Go Settings"
description: "Overview of the settings for AL-Go for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/14/2022
ms.reviewer: 
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# AL-Go Settings

The behavior of AL-Go for GitHub is very much controlled by the settings in the settings file.

## Where is the settings file located?

An AL-Go repository can consist of a single project (with multiple apps) or multiple projects (each with multiple apps). Multiple projects in a single repository are comparable to multiple repositories; they are built, deployed, and tested separately. All apps in each project (single or multiple) are built together in the same pipeline, published and tested together. If a repository is multiple projects, each project is stored in a separate folder in the root of the repository.

When running a workflow or a local script, the settings are applied by reading one or more settings files. Last applied settings file wins. The following lists the settings files and their location:

**.github\AL-Go-settings.json** is the repository settings file. This settings file contains settings that are relevant for all projects in the repository. If a settings in the repository settings file is found in a subsequent settings file, it will be overridden by the new value.

> [!NOTE]  
> The repository settings file can also contains BcContainerHelper settings, which will be applied when loading BcContainerHelper in a workflow (see expert section).

**.AL-Go\settings.json** is the project settings file. If the repository is a single project, the .AL-Go folder is in the root folder of the repository. If the repository contains multiple projects, there will be a .AL-Go folder in each project folder.

**.AL-Go\<workflow>.settings.json** is the workflow-specific settings file. This option is used for the Current, NextMinor and NextMajor workflows to determine artifacts and build numbers when running these workflows.

**.AL-Go\<username>.settings.json** is the user-specific settings file. This option is rarely used, but if you have special settings, which should only be used for one specific user (potentially in the local scripts), these settings can be added to a settings file with the name of the user followed by .settings.json.

## See also