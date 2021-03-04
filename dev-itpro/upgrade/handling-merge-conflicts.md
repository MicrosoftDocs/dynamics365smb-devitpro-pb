---
title: "Handling Merge Conflicts"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---
# Handling Merge Conflicts
When you merge application changes by running the [Merge-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398884) cmdlet or the [Update-NAVApplicationObject](https://go.microsoft.com/fwlink/?linkid=398886) cmdlet, the differences are applied automatically if it is possible. However, when conflicts are detected, they are captured in **CONFLICT** files. The CONFLICT files clearly identify where two parties such as you and Microsoft have changed the same object or parts of it. You can open a CONFLICT file in Notepad, for example, and see the type of conflict, such as a code conflict or conflicting object property values. By clearly identifying the conflicts in this manner and automatically merging all other changes, you can more easily resolve the conflicts.  

## Identifying Conflicts  
The CONFLICT files describe differences that were not automatically merged. This includes conflicting code modifications, property settings, and application code. Each conflict is clearly marked in the corresponding application object text file in the RESULT folder. A copy of the files in ORIGINAL, MODIFIED, or TARGET that caused the conflict is added to subfolders to the RESULT folder. For example, if you run the Merge-NAVApplicationObject cmdlet on three different versions of codeunit 1, and a conflict is found, the RESULT folder will contain the following:  

|Folder|File name|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|------------|---------------|---------------------------------------|  
|RESULT|COD1.CONFLICT|Describes the conflict, such as a code modification in a function.|  
||COD1.TXT|The merged application object that has the conflicting code clearly marked.|  
|ConflictModified|COD1.TXT|The conflicting application object from the MODIFIED version.|  
|ConflictOriginal|COD1.TXT|The conflicting application object from the ORIGINAL version.|  
|ConflictTarget|COD1.TXT|The conflicting application object from the TARGET version.|  

Because the CONFLICT files describe the conflicts, you can import the merged text files into the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] and resolve the conflicts there. Alternatively, you can use an external three-way merge tool to analyze the conflicts.  

In most cases, the text files that contain the merged application objects clearly identify where the conflict is. The following code example illustrates an object that has a conflict.  

```  
PROCEDURE ApplicationBuild@3() : Text[80];  
BEGIN  
  {>>>>>>>} ORIGINAL  
  EXIT('35473-ORIGINAL');  
  {=======} MODIFIED  
  EXIT('35978');  
  {=======} TARGET  
  EXIT('35473');  
  {<<<<<<<}  
END;  

```  

In this example, the ApplicationBuild function is different in all three versions of codeunit 1 that you tried to merge. If you import this file into the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], it will not compile. To resolve the issue, removed the unwanted code, including all brackets {}. You can do this, for example, in Notepad, a three-way merge tool, or in the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)]. Use the source files in the subfolders in the RESULT folder to learn how to resolve the conflict.  

## See Also  
 [Merge Application Changes](merge-application-changes.md)   
 [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
