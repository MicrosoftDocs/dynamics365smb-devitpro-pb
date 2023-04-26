---
title: "Replacing OnBeforeCompanyOpen and OnAfterCompanyOpen"
description: Describes how to replace OnBeforeCompanyOpen and OnAfterCompanyOpen events.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/11/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: freddyk
---

# Replacing OnBeforeCompanyOpen and OnAfterCompanyOpen

To improve the login time for [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], extensions should no longer use the **OnBeforeCompanyOpen** and **OnAfterCompanyOpen** events. Following are some recommended patterns to use in place of these events.

- Move the code to the actual usage of the extension.
- Code written on the subscribers that are called from these triggers must be safe. Every **Get**, **Modify**, **Delete**, and **Insert** operation must be written with `if...then`, to avoid raising conditions that could prevent user from signing in.
- The code should start with a check `if not guiallowed then exit;` to avoid impacting Web services code. Other checks to exit early should be added to the beginning of the code so that login performance isn't affected.
- If the extension is subscribing to **OnBeforeCompanyOpen** or **OnAfterCompanyOpen** triggers in order to perform some long-running data update, then either call **Update** when the extension gets called in code for the first time or apply the new task scheduler pattern for Update 6 and later. This applies to code that is not crucial.
    
    ```al
    // Add 15s
    TaskScheduler.CreateTask(Codeunit::"Job Queue User Handler",0,true,CompanyName,CurrentDateTime + 15000);
    ```

- If you're inserting data for a newly created company, we recommend subscribing to **OnCompanyInitialize** from Codeunit 2 instead. Use Installation or Upgrade code for the extension, or to set up on the first usage and if this isn't possible only then **OnCompanyInitialize** should be used to populate data for new companies, since this runs after every upgrade.

## See Also

[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  