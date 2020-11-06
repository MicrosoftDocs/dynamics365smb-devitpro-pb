---
title: "How to Work with a Performance Problem"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# How to work with a performance problem

What do you do if users complain that "it is slow"? In this section, we describe a troubleshooting process that can help to guide you to find the root cause of the problem.

Before getting started on solving a performance tuning problem, it often helps to define and quantify "slow" and also negotiate acceptable values for execution time of "slow" operations with users. This is sometimes called "establishing a baseline." 

To define baselines for performance, and to test whether new code or extensions introduce a performance regression, you can use the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] extension. The extension makes it easier to simulate and compare user experiences to your baseline. The following are examples of when the extension can help:  

* When you want to ensure that new code does not introduce a regression. 
* In a sandbox environment when, for example, the number of users running the same process increases significantly. 
* When you want to roll out a new process, or install a new extension. 

To solve a performance problem, a common pattern is to do iterations of the following:

1. Measure system performance and collecting performance data
2. Locate a bottleneck
3. Eliminate the bottleneck

and continue until the "slow" operations are comparable to the established baseline.

## See Also

[Performance Overview](performance-overview.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance tips for business users](performance-users.md)  
[How Application Configurations Affect Performance](performance-application.md)  
[Performance Online](performance-online.md)  
[Performance of On-Premises Installations](performance-onprem.md)  