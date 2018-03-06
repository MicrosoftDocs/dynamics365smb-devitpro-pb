---
title: Compare and Update Application Object Source Files
description: Compare the different set of Dynamics NAV application objects using Windows PowerShell cmdlets and apply all or some differences to the target solution.
ms.custom: na
ms.date: 11/22/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 464cf181-c272-42db-baa0-2c817aa66468
caps.latest.revision: 3
---
# Compare and Update Application Object Source Files
You can use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to compare different sets of [!INCLUDE[navnow](includes/navnow_md.md)] application objects to identify the differences. Then, you can choose to apply all or some of the differences to a target solution.  
  
 We recommend that you use the Merge-NAVApplicationObject cmdlet because it is the faster and easier way to merge objects. However, you can choose to use the Compare-NAVApplicationObject cmdlet and Update-NAVApplicationObject cmdlet to identify the differences before you apply them. Or, for example, when you want to apply the same modifications to multiple applications or similar. The following procedures illustrate how you can use these two cmdlets in combination  
  
 The scenario is based on the following three versions of the [!INCLUDE[navnow](includes/navnow_md.md)] application:  
  
|Version label|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-------------------|---------------------------------------|  
|ORIGINAL|The Microsoft release of [!INCLUDE[navnow](includes/navnow_md.md)].|  
|MODIFIED|The updated version of [!INCLUDE[navnow](includes/navnow_md.md)], such as Cumulative Update 1.|  
|TARGET|Your solution that is based on [!INCLUDE[navnow](includes/navnow_md.md)], such as **MySolution**.|  
  
 The steps in the following procedures compare the ORIGINAL version to the MODIFIED solution and apply the relevant changes to your TARGET solution. As a result, you have an application that contains your solution with the updates from the MODIFIED application. Alternatively, the MODIFIED solution can be your solution and the TARGET solution can be the new release from Microsoft. The actual versions that you use to set each cmdlet parameter depend on your concrete scenario. However, we recommend that MODIFIED contains the solution with the fewest changes compared to ORIGINAL. The Compare-NAVApplicationObject cmdlet compares two sets of application objects and stores the differences in DELTA files in the specified folder.  
  
 The following procedure assumes that you have exported the relevant application objects to text files. For an example of how to do that, see the **To prepare the application object files** section in the [How to: Merge Application Changes](How-to--Merge-Application-Changes.md) topic.  
  
### To compare two sets of application objects  
  
1.  Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] in administrator mode.  
  
2.  Navigate to the location of your folders by typing a command such as the following:  
  
    ```  
    cd c:\upgrade  
    ```  
  
     In this example, the UPGRADE folder on the C drive contains five folders: ORIGINAL, MODIFIED, TARGET, DELTA, and RESULT. The DELTA and RESULT folders are empty. The ORIGINAL, MODIFIED, and TARGET folders contains one or more text files that contain application objects. You can now run the cmdlet.  
  
3.  To run the cmdlet to compare all application objects in the ORIGINAL folder to the application objects in the MODIFIED folder, type the following command:  
  
    ```  
    Compare-NAVApplicationObject -OriginalPath .\ORIGINAL -ModifiedPath .\MODIFIED -DeltaPath .\DELTA  
    ```  
  
     This generates a number of DELTA files that describe the difference between ORIGINAL and MODIFIED. You can open the DELTA files in text editors such as Notepad. The following example illustrates how a DELTA file identifies the difference between ORIGINAL and MODIFIED.  
  
    ```  
    CHANGES  
  
    {  
  
      { CodeModification  ;Target=ApplicationBuild(PROCEDURE 3);   
  
                           OriginalCode=BEGIN  
  
                                          EXIT('35473-ORIGINAL');   
  
                                        END;  
  
                           ModifiedCode=BEGIN  
  
                                          EXIT('35978');   
  
                                        END;   
  
                                         }  
  
    }  
  
    ```  
  
 You can apply those differences to TARGET by using the Update-NAVApplicationObject cmdlet.  
  
### To apply DELTA files to application objects  
  
1.  Open the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] in administrator mode.  
  
2.  Navigate to the location of your folders by typing a command such as the following:  
  
    ```  
    cd c:\upgrade  
    ```  
  
     In this example, the folder structure is the same as described in the previous procedure. You can now run the cmdlet.  
  
3.  To run the cmdlet to apply the differences that are stored in the DELTA folder to the application objects in the TARGET folder, type the following command:  
  
    ```  
    Update-NAVApplicationObject –DeltaPath .\DELTA -TargetPath .\TARGET\*.txt -ResultPath .\RESULT  
    ```  
  
     This merges the difference between ORIGINAL and MODIFIED with the target solution and puts the resulting solution in the RESULT folder.  
  
 You can now import the merged objects into a [!INCLUDE[navnow](includes/navnow_md.md)] database. For more information, see [How to: Merge Application Changes](How-to--Merge-Application-Changes.md).  
  
## See Also  
 [How to: Merge Application Changes](How-to--Merge-Application-Changes.md)   
 [Handling Merge Conflicts](Handling-Merge-Conflicts.md)   
 [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
 [ExportObjects](ExportObjects.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)