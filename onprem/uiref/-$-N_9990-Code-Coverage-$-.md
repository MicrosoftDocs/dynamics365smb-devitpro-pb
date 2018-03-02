---
title: "($ N_9990 Code Coverage $)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2d05cd81-9015-41ce-9899-d0169d1524b4
caps.latest.revision: 2
translation.priority.ht:
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# ($ N_9990 Code Coverage $)
Specifies the extent to which the application code is covered by tests. You use the **Code Coverage** window to track code coverage after you have run one or more test suites in the **CAL Test Tool** window. You can run both pages from the [!INCLUDE[nav_dev_short](../includes/nav_dev_short_md.md)], or from the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](../includes/nav_web_md.md)].  

 In the **Code Coverage** window, you can start, refresh, and stop the code coverage recorder.  

> [!IMPORTANT]  
>  Code coverage is recorded globally for all sessions, so make sure that you run the tool in a controlled environment so you do not have any activity from unaccounted sessions.  

## Monitoring Code Coverage  
 Code coverage is the means of being able to track which part of the application code has been exercised during test activity. In [!INCLUDE[navnow](../includes/navnow_md.md)], code coverage is recorded by C/AL code line and specifies if a code line was exercised by test and the number of times the line of code was recorded.  

 To start monitoring code coverage, choose **Start**. This starts the code coverage engine, and code coverage is captured. However, you will not be able to see any updated information until you choose **Refresh** or **Stop**. The information contains coverage of objects, triggers and functions, and individual lines of code or empty lines as determined by the column **Line Type**. Only lines of type **Code** can have coverage. Lines of type **Trigger/Function** show the average coverage of all code lines in the trigger or function. Lines of type **Object** show the average coverage of all code lines inside the object. The following table illustrates the result of a code coverage run:  

|Code|Coverage %|Line Type|  
|----------|----------------|---------------|  
|Table Currency \(4\)|20,00|Object|  
|OnModify\(\)|0,00|Trigger/Function|  
|OnDelete\(\)|0,00|Trigger/Function|  
|OnRename\(\)|0,00|Trigger/Function|  
|InitRoundingPrecision\(\)|81,82|Trigger/Function|  

 In this example, the activity exercised 20% of the **\($ T\_4 Currency $\)** table, including 81,82% of the `InitRoundingPrecision` function.You can then expand the section for `InitRoundingPrecision` to investigate the code coverage for each line of code in this function.  

 Only objects that are touched by the activity are recorded. This means that if an object is not shown in this window, the coverage of the object is implied to be zero. If you want to force the code coverage recorder to include specific objects even if they are not covered, choose the **Load objects** action, and then specify the relevant objects. This forces the code coverage engine to load these objects and provide information on even when no lines are covered.  

## See Also  
 [Code Coverage Virtual Table](../Code-Coverage-Virtual-Table.md)   
 [Application Test Automation](../Application-Test-Automation.md)
