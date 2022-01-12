---
title: "Moving from OnCompanyOpen to OnCompanyOpenCompleted"
description: Explains why you should use OnCompanyOpenCompleted instead of OnCompanyOpen.
author: jswymer
ms.custom: na
ms.date: 01/12/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Moving from OnCompanyOpen to OnCompanyOpenCompleted

APPLIES to

With the introduction of Isolated Events (John add link) it has become possible to write events that doesn’t interrupt execution upon event subscriber errors. The platform-based event “OnCompanyOpenCompleted” takes advantage of this to ensure the user will no longer be unable to login upon a failure in an event subscriber.



Moving from the “OnCompanyOpen” event to “OnCompanyOpenCompleted” event is as easy as changing the event subscriber definition. Furthermore, events that are emitted from within the “OnCompanyOpen” will slowly be moved onto the “OnCompanyOpenCompleted” or becomes isolated themselves.
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