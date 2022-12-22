---
title: Troubleshooting profile configuration can't be started
description: Learn how to troubleshoot issues with profile configuration.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: troubleshooting
ms.date: 12/22/2022
ms.custom: bap-template
---

# Troubleshooting profile configuration can't be started

When there are issues preventing the profile configuration in [!INCLUDE [prod_short](includes/prod_short.md)], the user will get an error message, and not be able to start the profile configuration. When the configuration is started, all customization records are loaded and compiled together. If one of these records causes a compilation error, then the profile configuration can't be started.

## Symptoms

The user sees the following error message "Sorry, something went wrong and personalization could not be started. Please try again later, or contact your system administrator."

## Resolution

As a tenant administrator, you can do the following to mitigate the issue. 

> [!NOTE]  
> It's recommended to take a screenshot of any configuration done, before deleting them.