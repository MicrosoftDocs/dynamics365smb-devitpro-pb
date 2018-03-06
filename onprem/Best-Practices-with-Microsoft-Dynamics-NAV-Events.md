---
title: "Best Practices with Microsoft Dynamics NAV Events"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 25f6e021-c8fd-4235-8f76-7de7798a20aa
caps.latest.revision: 3
manager: edupont
---
# Best Practices with Microsoft Dynamics NAV Events
This topic provides naming and coding guidelines for using events in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
## Naming Conventions  
  
|Item|Guideline|Example|  
|----------|---------------|-------------|  
|Event publisher function|The name should indicate the circumstances when the published event is raised. Begin the name with **On** followed by a descriptive name that can be easily identified.|OnCancelCustomerApprovalRequest|  
|Event subscriber function|The name should indicate what the operation that the subscriber performs. Begin the name with a phrase that indicates what the subscriber does, followed by the name of the publisher function to which it subscribes.|RunWorkflowOnCancelCustomerApprovalRequest|  
|Variables and parameters|Follow the naming conventions that are defined in [Naming Conventions](Naming-Conventions.md). It is important that you define appropriate names from the beginning because the name becomes part of the interface definition.||  
  
## Coding Guidelines  
  
-   Whenever possible, make events local, so that all pre and post validation can remain in the object.  
  
-   Use VAR parameters with care because they form a stricter coupling between the publisher and the subscriber.