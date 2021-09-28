---
title: "Setting Up Colored Indicators on Cues"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c29658cf-c786-4d10-bc4d-e02bc53fd88c
caps.latest.revision: 4
manager: edupont
---
# Setting Up Colored Indicators on Cues
You can set up Cues with an indicator that changes color based on the data values in the Cues. The indicator appears as a bar along the top border of the Cue tile. It provides a visual signal of the status of the Cue's activity, which can indicate various conditions such as favorable or unfavorable to prompt the user to take action.  
  
 ![Cues on the Order Processor Role Center.](media/NAV_Cues_OrderProcessor.png "NAV\_Cues\_OrderProcessor")  
  
 For example, if a Cue displays open sales quotes, you can set up the indicator to appear green \(favorable\) when total number of open sales quotes is below 10, and appears red \(unfavorable\) when the total is greater than 20.  
  
 There are two ways that you can set up indicators.  
  
-   Using the Style or StyleExpr property of the Field control that defines the Cue.  
  
     With this method, you set up predefined indicators on a Cue-By-Cue basis.  
  
     For more information, see [How to: Set Up Colored Indicators on Cues by Using the Style and StyleExpr Property](How-to--Set-Up-Colored-Indicators-on-Cues-by-Using-the-Style-and-StyleExpr-Property.md).  
  
-   Coding the GetCueStyle trigger in codeunit 1  
  
     With this method, you define the logic for the indicators for all Cues in one place. Using the GetCueStyle trigger also enables you to provide customization of the indicators from the [!INCLUDE[navnow](includes/navnow_md.md)] clients.  
  
     For more information, see [Setting Up Colored Indicators on Cues by Using Codeunit 1](Setting-Up-Colored-Indicators-on-Cues-by-Using-Codeunit-1.md).  
  
## See Also  
 [Creating and Customizing Cues](Creating-and-Customizing-Cues.md)   
 [Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md)   
 [Walkthrough: Creating a Cue Based on a Normal Field and a Query](Walkthrough--Creating-a-Cue-Based-on-a-Normal-Field-and-a-Query.md)