---
title: "Replacing OnBeforeCompanyOpen and OnAfterCompanyOpen"
description: Describes how to replace OnBeforeCompanyOpen and OnAfterCompanyOpen events.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: freddyk
---

# Replacing OnBeforeCompanyOpen and OnAfterCompanyOpen
To improve the login time for [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], extensions should no longer use the **OnBeforeCompanyOpen** and **OnAfterCompanyOpen** events. Following are some recommended patterns to use in place of these events.

- Move the code to the actual usage of the extension.
- Code written on the subscribers that are called from these triggers must be safe. Every **GET**, **MODIFY**, **DELETE**, and **INSERT** operation must be written with `IF THEN`, to avoid raising conditions that could prevent user from signing in.
- The code should start with check `IF NOT GUIALLOWED THEN EXIT;` to avoid impacting Web services code. Other checks to exit early should be added to the beginning of the code so that login performance is not affected.
- If the extension is subscribing to **OnBeforeCompanyOpen** or **OnAfterCompanyOpen** in order to perform some long-running data update, then either call **Update** when the extension gets called in code for the first time or apply the new task scheduler pattern for Update 6 and later. This applies to code that is not crucial.
    
    ```
    // Add 15s
    TASKSCHEDULER.CREATETASK(CODEUNIT::"Job Queue User Handler",0,TRUE,COMPANYNAME,CURRENTDATETIME + 15000);
    ```

- If you are inserting data for a newly created company, we recommend subscribing to **OnCompanyInitialize** from Codeunit 2 instead. Use Installation or Upgrade code for the extension, or to set up on the first usage and if this is not possible only then it should be **OnCompanyInitialize** be used to populate data for new companies. This runs after every upgrade.

## See Also
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  