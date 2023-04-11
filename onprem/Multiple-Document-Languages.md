---
title: "Multiple Document Languages"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5c929ff4-72c2-4d81-999b-e7bb013f0efc
caps.latest.revision: 7
---
# Multiple Document Languages
With a multlanguage-enabled database you can automatically  get the languages needed for multiple document language functionality.  
  
## Running Multiple Document Languages  
 If you have documents that you want to print in the language of the recipient rather than in your own working language, you can add a single line of code in the document to handle this. This functionality is already enabled for most reports in the standard [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] database. The document is printed in the language that is specified in the **Language Code** field in the **Customer Card** window.  
  
 In reports that need the multiple document languages functionality, you must insert the following C/AL code as the first line in the **OnAfterGet Record\(\)** trigger:  
  
 `CurrReport.LANGUAGE := Language.GetLanguageID("Language Code")`  
  
 For each of these reports, you must create a new variable, `Language`, with the data type `Record` pointing to the **Language** table \(table 8\). When you have compiled the object, it will no longer print in the user’s working application language if another language has been specified in the **Customer Card** window.  
  
## See Also  
 [Multilanguage Development](Multilanguage-Development.md)   
 [How to: Add Translated Strings By Using the Multilanguage Editor](How-to--Add-Translated-Strings-By-Using-the-Multilanguage-Editor.md)   
 [How to: Delete Translated Strings](How-to--Delete-Translated-Strings.md)
