---
title: Application Objects in Text Files
description: Export application objects to text files and modify them in external tools such as comparing and merging objects using Windows PowerShell cmdlets.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 17677da3-f68a-4899-a2d3-fa2964edd6fe
caps.latest.revision: 5
---
# Working with Dynamics NAV Application Objects as Text Files
You can export application objects to text files and modify them in external tools such as comparing and merging objects using [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets. Optionally, you can store the files in external source control systems for better maintainability.  

## Objects in Text Files  
 The input to and output from the application merge utilities, for example, are text files that have been exported from a [!INCLUDE[navnow](includes/navnow_md.md)] database. You can also use other tools to bulk edit the files, such as if you want to set a version number. You can export all objects into a single file, or you can export objects into separate files per object. [!INCLUDE[navnow](includes/navnow_md.md)] includes [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets that can split a large text file into separate files per object, and join separate files into a single text file.  

 For example, you can update the **VersionList**, **Modified**, **Date**, and **Time** properties for all or some of the application objects by using the Set-NAVApplicationObjectProperty cmdlet. This can be useful when you are applying the latest cumulative update to your solution, for example, and you want to set the date and time for all modified objects at the end of the process.  

 The following [!INCLUDE[wps_2](includes/wps_2_md.md)] command sets all object properties on all text files in the RESULTS folder.  

```  
Set-NAVApplicationObjectProperty -TargetPath .\RESULT\*.txt -VersionListProperty "MySolutionV2" -ModifiedProperty Yes -DateTimeProperty (Get-Date -Format g)  
```  

 The example sets the following properties: **VersionList** is set to **MySolutionV2**, **Modified** to **Yes**, and **Date** and **Time** are set to the current date and time. In the example, you update the text files that are the result of running the Merge-NAVApplicationObject cmdlet. For more information, see [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md).  

### External Source Control  
 When you export your application objects as text files, you can choose to store the files in external source control systems for source control and version control. Using a version control system such as Visual Studio Team Foundation Server for your application source text files is always highly recommended, and it makes it simpler to compare and merge objects using the [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets.  

### Adding and Removing Languages  
 When your application objects are in text format, you can also export captions into text files. You can use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to export one or more languages from the specified application objects, and you can import new languages, for example. This supplements the support for importing and exporting languages using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] commands that are based on the application objects in a [!INCLUDE[navnow](includes/navnow_md.md)] database. But if your application objects are stored externally as text files, you can use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets such as Export-NAVApplicationObjectLanguage, Import-NAVApplicationObjectLanguage, and Remove-NAVApplicationObjectLanguage instead. You can use other cmdlets to test that all objects have captions in a specific language, for example, and to join and split application language files.  

 The following [!INCLUDE[wps_2](includes/wps_2_md.md)] command exports the German captions from the objects in the TARGET folder to a single text file.  

```  
Export-NAVApplicationObjectLanguage –Source .\TARGET\*.TXT -Destination .\RESULT\ALL-DEU.TXT -LanguageId "DEU"  
```  

 The example exports the DEU captions for all application objects into an application language file, ALL-DEU.txt. Optionally, you can use the Split-NAVApplicationObjectLanguageFile cmdlet to the split that text file into separate text files with captions for each object. However, in most cases you probably prefer to work with a single application language file.  

 When you export a language by using the Export-NAVApplicationObjectLanguage cmdlet, and an object is missing a caption in that language, the exported text file will not have an entry in that language for that object. However, if the language that you are exporting is the base development language, then the entry is generated based on the name of the object. The default base development language is ENU.  

 For example, you exported table 50000 to a text file, TAB50000.txt. In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you did not specify a caption for field number 1, so the following example shows how that field is defined in TAB50000.txt:  

```  
{ 1   ;   ;Code                ;Code10        }  
```  

 If you then run the Export-NAVApplicationObjectLanguage cmdlet for ENU , the cmdlet will generate an entry for this field with the language code for ENU as shown in the following example:  

```  
T50080-F1-P8629-A1033-L999:Code  
```  

 If your [!INCLUDE[wps_2](includes/wps_2_md.md)] script exported other languages, the corresponding entries for this field will be blank as shown in the following example for DAN:  

```  
T50080-F1-P8629-A1030-L999:   
```  

 Similarly, the Remove-NAVApplicationObjectLanguage cmdlet will remove the captions in the languages that you specify. However, you can also use the cmdlet to remove all captions. If you do not set the *LanguageId* parameter, all available languages are removed from the objects except the development language.  

## See Also  
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
 [How to: Export Objects](How-to--Export-Objects.md)   
 [Importing and Exporting Objects](Importing-and-Exporting-Objects.md)
