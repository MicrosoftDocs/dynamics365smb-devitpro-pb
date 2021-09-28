---
title: "Merge Application Changes"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
ms.service: "dynamics365-business-central"
---
# Merge Application Changes
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets that can help you apply changes to your application by comparing and merging application objects from different versions. For example, you can use the Merge-NAVApplicationObject cmdlet to update your solution when Microsoft releases an update.  

 The [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets compare two sets of application objects, calculate the difference, and apply as many of changes as possible to a third version. You can use the cmdlets from the [!INCLUDE[devshell](../developer/includes/devshell.md)] or from the [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] Integrated Scripting Environment \(ISE\). The sections in this topic illustrate how you can use the Merge-NAVApplicationObject cmdlet to merge application changes into your solution. The sections are based on a scenario you want to apply changes from an update to your version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For more information, see [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md).  

 The scenario is based on the following three versions of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application:  

|Version label|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------------------|---------------------------------------|  
|ORIGINAL|The Microsoft release of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|  
|MODIFIED|The updated version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], such as Cumulative Update 1.|  
|TARGET|Your solution that is based on [!INCLUDE[prod_short](../developer/includes/prod_short.md)], such as **MySolution**.|  

 The steps in the following procedures compare the ORIGINAL version to the MODIFIED solution and apply the relevant changes to your TARGET solution. As a result, you have an application that contains your solution with the updates from the MODIFIED application. Alternatively, the MODIFIED solution can be your solution and the TARGET solution can be the new release from Microsoft. The actual versions that you use to set each cmdlet parameter depend on your concrete scenario. However, we recommend that MODIFIED contains the solution with the fewest changes compared to ORIGINAL.  

 First, you prepare the application object files for the ORIGINAL version. You can do that by exporting the application object from the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], or by using the development environment command [ExportObjects](/dynamics-nav/ExportObjects). The following procedure illustrates how to export the objects by calling finsql.exe file from a command prompt.  

### To prepare the application object files  

1.  In a command prompt, type a command such as the following:  

    ```  
    finsql.exe command=exportobjects, file=<file name>.txt, servername=<server name>, database=<database name>, ntauthentication=yes  
    ```  

     For example, to export all objects in the original Microsoft-provided version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to a single text file, type the following:  

    ```  
    finsql.exe command=exportobjects, file=original_all.txt, servername=MyServer, database="Demo Database NAV (9-0)", ntauthentication=yes  
    ```  

2.  Optionally, split the exported text file into separate files using the Split-NAVApplicationObjectFile cmdlet in the [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] ISE or in the [!INCLUDE[devshell](../developer/includes/devshell.md)]. Alternatively, you can do that as the first step in the next procedure.  

3.  Repeat these steps until you have the three sets of text files.  

4.  Copy the exported text files to the location where you want to run the merge process. Make sure that the text files are put in folders that reflect the version that they were exported from. The names of the folders are not important, but you must modify any [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] command or script to use the folder structure that you have set up.  

     For example, create a root folder such as C:\\UPGRADE. Then create three subfolders that contain the three sets of application object files, such as ORIGINAL, MODIFIED, and TARGET.  

 When you have the text files that you need, and you have the folder structure that you need, you can run the Merge-NAVApplicationObject cmdlet to merge the changes between ORIGINAL and MODIFIED into your TARGET application. The cmdlet will put the resulting text files into the folder that you specify in the *–ResultPath* parameter, such as RESULT.  

### To run the Merge-NAVApplicationObject cmdlet to merge application objects  

1.  Open the [!INCLUDE[devshell](../developer/includes/devshell.md)] in administrator mode.  

2.  Navigate to the location of your folders by typing a command such as the following:  

    ```  
    cd c:\upgrade  
    ```  

     In this example, the UPGRADE folder on the C drive contains the three folders that you created in the previous procedure, and it contains an empty RESULTS folder. You can now run the cmdlet.  

3.  To run the cmdlet and automatically merge as many objects as possible, type the following command:  

    ```  
    Merge-NAVApplicationObject -OriginalPath .\ORIGINAL -TargetPath .\TARGET -ModifiedPath .\MODIFIED -ResultPath .\RESULT  
    ```  

 Depending on the number of objects that you are merging and the number of differences found, this can take a few seconds, a few minutes, or longer. When the process completes, the result is shown. If no conflicts are found, the application merge is complete and you can import the text files from the RESULT folder into the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] development environment and compile them. If any conflicts are found, you must resolve them.  

 Alternatively, you can use the Compare-NAVApplicationObject cmdlet and Update-NAVApplicationObject cmdlet to first compare and the apply the difference. See [Compare and Update Application Object Source Files](compare-update-application-object-source-files.md).  

## Managing Conflicts  

> [!NOTE]
> [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] is [!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)].

 At the end of the previous procedure, the RESULT folder contains text files with merged application objects and zero or more CONFLICT files. Since the CONFLICT files describe the conflicts, you can import the merged text files into the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] and resolve the conflicts there. Alternatively, you can use an external three-way merge tool to further analyze the conflicts. For more information, see [Handling Merge Conflicts](Handling-Merge-Conflicts.md).  

#### To resolve merge conflicts in the development environment  

1.  Import the text files that contain the merged application objects into the relevant database in the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].  

     In the previous procedure, the merged objects were stored in the RESULT folder. Optionally, you can choose to run the Join-NAVApplicationObjectFile cmdlet to combine the text files into a single text file for easier file management.  

    > [!IMPORTANT]  
    >  You must import the text files that are the result of the previous procedure. You cannot import the CONFLICT files into [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. However, you can use the CONFLICT files to identify the conflicts and decide how to resolve them.  

2.  Compile all imported objects.  

     The application object that contain merge conflicts cannot compile because the conflicts are identified by `{>>>>>>>}` elements that are not valid C/AL code. The code conflict is clearly marked with the conflicting code from each version.  

3.  Resolve each conflict, and then compile the objects.  

 Resolving conflicts is not completely the end of the process. Even though the application objects compile, the code can still be incorrect. We recommend that you do a final validation of the automatically merged objects. The following list outlines the recommended process for completing an automated application merge:  

1.  Review the code.  

2.  Compile the objects.  

3.  Test the solution.  

4.  Optionally, export the objects as text files and check them into an external source control system.  

> [!TIP]  
>  The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] product media contains a folder with [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] sample scripts that illustrate how you can use the Merge-NAVApplicationObject cmdlet and other [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets. For more information, see [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md).  

## See Also  
 [Handling Merge Conflicts](Handling-Merge-Conflicts.md)   
 [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md)   
 [Compare and Update Application Object Source Files](compare-update-application-object-source-files.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
 [Business Central PowerShell Cmdlets](/powershell/business-central/overview)
