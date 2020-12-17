---
title: "Comparing and Merging Application Object Source Files"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.service: "dynamics365-business-central"
---
# Comparing and Merging Application Object Source Files
When you create or modify application objects, you use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and you import and export objects as .fob files. But you can also export objects as text files and use other tools, such as the [!INCLUDE[devshell](../developer/includes/devshell.md)], to make general changes to the objects. For example, you can use [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets to merge changes from an upgrade with your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution.  

>[!NOTE]
> [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] and [!INCLUDE[devshell](../developer/includes/devshell.md)] are [!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)]. 

 You can export all application objects to a single text file. Optionally, you can split the large text file into separate text files for each application object. You can also use an external source control system to store the text files, such as Visual Studio Team Foundation Server, but this is not required by the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cmdlets.  

 The application merge utilities that are available in the [!INCLUDE[devshell](../developer/includes/devshell.md)] install when you choose the **Developer** option in [!INCLUDE[nav_setup](../developer/includes/nav_setup_md.md)], or if you add the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to another installation option.  

## Comparing and Merging Application Objects  
 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets that help you apply changes to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solutions. You can use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cmdlets to modify application object source files in the [!INCLUDE[devshell](../developer/includes/devshell.md)], or by importing the Microsoft.Dynamics.NAV.Model.Tools.psd1 module into the [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] Integrated Scripting Environment \(ISE\).  

 When Microsoft releases a new version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you want to upgrade your solution. Similarly, you want to update your solution with cumulative updates and other smaller changes to the application. Each time you want to update your solution, you have to compare the original version to the new version, and then you have to apply the difference to your own solution. Or you compare the new version to your own solution and merge the changes into your solution. In both cases, you compare different versions of application objects to calculate and apply the difference. The Merge-NAVApplicationObject cmdlet compares the changes that have been made to application objects between two sets of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application objects, and applies the difference to a third set of application objects, the target of the merge. The result of the application object merge is a fourth set of application objects that make up your new, updated solution.  

 In the [!INCLUDE[devshell](../developer/includes/devshell.md)], you can also use other [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets that help you with manage application object files. But the recommended way to update your application is to use the Merge-NAVApplicationObject cmdlet. The other option is a two-step process using the Compare-NAVApplicationObject and Update-NAVApplicationObject cmdlets.  

 You can use the application merge utilities to merge and update the following application object types:  

-   Tables  

-   Pages  

-   Reports  

-   Codeunits  

-   MenuSuites  

-   Queries  

-   XMLPorts  

 You cannot use the cmdlets to modify dataports, forms, or reports with classic report sections. Also, some parts of some object types require special attention from the tool or from you as described in the following list:  

-   Application object properties  

     Each of the application object properties in the application object files often calls for hands-on handling. The text files specify the **Modified**, **Date**, **Time**, and **VersionList** properties for each object. When you run the Merge-NAVApplicationObject cmdlet, you can set parameters that are specific for application object properties. But two cmdlets are available specifically for post-processing of object properties: Get-NAVApplicationObjectProperty and Set-NAVApplicationObjectProperty.  

     Often handling or setting application object properties is done at a later time than the merge itself. For example, you run the merge, resolve the conflicts, and once you are done, you want to stamp the current date and time on all objects. To do that, use the Set-NAVApplicationObjectProperty cmdlet to change the values of the Version List, Date, Time, or Modified properties in the specified text files. You can use the Set-NAVApplicationObjectProperty cmdlet to extract information about the application objects before you change them.  

-   Documentation triggers  

     In each object, the documentation trigger is used for many different purposes. Documentation, of course, but also for tracking changes with date or history semantics built into it. You can use the cmdlets to modify the contents of the documentation section. If you want to be explicit about how the content of the documentation triggers is merged, you can set the *-DocumentationConflict* parameter when you run the Merge-NAVApplicationObject cmdlet. Set this parameter when you are merging objects with the same type of content in the documentation trigger, such as technical descriptions or a version list. By default, conflicting lines of documentation are merged into the result file with the content from the modified object listed first. This is particularly useful when the objects contain version history in the documentation triggers.  

-   ControlID  

     Sometimes, developers in-house or external partners create objects in the same ID range as you. This surfaces in the merge process as conflicts and hence as work to do. The application merge utilities provide ways to handle that, depending on your needs and requirements. To reduce noise, by default the Merge-NAVApplicationObject cmdlet suppresses conflicting modifications on non-functional incidents such as the ordering of variables and methods that are sometimes referred to as control IDs. If you set the*–Strict* parameter, these occurrences are treated like any other conflicts and reported accordingly.Significant IDs, such as table and field IDs, are fully considered during compare and merge.  

-   CaptionML  

     Captions are an integral part of the solution, but when you compare two versions of the same object with two different languages, you will see extensive differences. You can choose to export captions into text files before you compare or merge application objects. For example, you can use the Export-NAVApplicationObjectLanguage[!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlet to export specific languages from the objects before you merge them. You can then use the Import-NAVApplicationObjectLanguage cmdlet to import the captions after the merge. Other [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets support joining and splitting application object language files.  

 When you merge application changes by running the Merge-NAVApplicationObject cmdlet or the Update-NAVApplicationObject cmdlet, the differences are applied automatically if possible. However, when conflicts are detected, they are captured in **CONFLICT** files that clearly identify where two parties such as you and Microsoft have changed the same object or parts of it. For more information, see [Handling Merge Conflicts](Handling-Merge-Conflicts.md).  

### Scenario: Updating your Solution to the Next Cumulative Update  
 In the following example, you have built a solution that is based on [!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)], **MySolution**. Microsoft then releases [!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)] Cumulative Update 1 that includes hotfixes and two regulatory features for your country/region. To help you apply the cumulative update to your solution, you use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cmdlets. The cmdlets calculate the modifications that Microsoft made between the original release and the cumulative update, and apply these to your solution. Then, you must manually resolve any conflicts, such as both you and Microsoft modified a report object or a table. You must also validate the automatically applied modifications through testing and maybe code review. The following table describes the three versions of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application that you want to compare and merge.  

|Version|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------------|---------------------------------------|  
|ORIGINAL|The baseline of the application merge. For example, the Microsoft release of [!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)].|  
|MODIFIED|The updated version of the original. For example, this can be [!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)] Cumulative Update 1. Alternatively, it can be a small add-on.<br /><br /> In many cases, the modified application is the version that contains fewer changes to the original than the version that is the target of the merge. This is because you want to apply fewer changes to a large application rather than applying a large change to a small application.|  
|TARGET|The version of the application that you want to apply the difference between the original and the modified application to. For example, this can be your solution that you want to apply a cumulative update to. Alternatively, it can be a new major release from Microsoft that you want to apply your modified solution to.|  

 The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cmdlets calculate the modifications made from **ORIGINAL** to **MODIFIED**, capture these, and then apply automatically as many as possible to the **TARGET** application. The resulting application is stored in a **RESULT** folder. Some application objects cannot be merged automatically; these **conflicts** are described in separate text files that you can analyze for further processing.  

> [!TIP]  
>  The use of TARGET as the name of the folder in the sample scripts and in the *–TargetPath* cmdlet parameters indicates the most common direction of the merge: You apply external modifications to a target solution. However, there are scenarios where it makes sense to swap the versions that you specify as MODIFIED and TARGET, such as when you upgrade from version to version. Since the processing is so fast, typically just a few minutes, it is recommended that you try out both options. For the smoother experience, place the set of application objects with the fewest modifications in MODIFIED.  

## See Also  
 [Merge Application Changes](merge-application-changes.md)   
 [Compare and Update Application Object Source Files](compare-update-application-object-source-files.md)   
 [Handling Merge Conflicts](Handling-Merge-Conflicts.md)   
 [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md)      
 [Business Central PowerShell Cmdlets](/powershell/business-central/overview)
