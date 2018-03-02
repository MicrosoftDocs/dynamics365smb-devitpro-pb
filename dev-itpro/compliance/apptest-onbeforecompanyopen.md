---
title: "Replacing OnBeforeCompanyOpen and OnAfterCompanyOpen"
description: "Describing the steps you must go through to successfully submit your app to AppSource."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/09/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: rweigel
caps.latest.revision: 18
---

# Replacing OnBeforeCompanyOpen and OnAfterCompanyOpen

To improve the login time for [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], extensions should no longer use the **OnBeforeCompanyOpen** and **OnAfterCompanyOpen** events. Following are some recommended patterns to use in place of these events.

- If the extension is subscribing to OnBefore(After)CompanyOpen in order to complete company setup for a newly created company, we recommend subscribing to OnCompanyInitialize from codeunit2 instead
- If the extension is subscribing to OnBefore(After)CompanyOpen in order to perform some long-running data update, then either call the “update” when the extension gets called in code for the first time or apply the new task scheduler pattern for update 6 and later

*Task Scheduler Example:*
- TASKSCHEDULER.CREATETASK(CODEUNIT::"Job Queue User Handler",0,TRUE,COMPANYNAME,CURRENTDATETIME + 15000); // Add 15s