---
title: "Windows Language Virtual Table"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7e768229-1dd4-41b6-9acb-5857142f4d88
caps.latest.revision: 9
---
# Windows Language Virtual Table
The virtual, read-only Windows Language table displays the languages that Windows supports. You can view its contents by designing a tabular-type page based on the table.  
  
## The Table  
 The Windows Language virtual table contains the following fields.  
  
|Field name|Description|  
|----------------|-----------------|  
|Language ID|This field is the primary key. It displays the standard Windows language ID for a specific language.<br /><br /> C/AL supports the setting of language using the **GLOBALLANGUAGE**, **WINDOWSLANGUAGE**, and object **LANGUAGE** properties. The values of these properties are taken from this field.|  
|Primary Language ID|Windows languages are grouped. A group consists of a primary language and zero or more secondary languages. The **Primary Language ID** field contains the **Windows Language ID** of the primary language.|  
|Name|This field contains the standard Windows name for the language|  
|Abbreviated Name|This field is a secondary key. It contains the standard Windows three-letter code for the language|  
|Enabled|If selected, indicates that the language is globally enabled, page enabled, report enabled, or data port enabled. Your license file determines how a specific language can be used.|  
|Globally Enabled|If selected, indicates that the license file allows you to set the language in question as the global language for the entire application.|  
|Page Enabled|If selected, indicates that the license file allows pages to be shown in a language other than the global language.|  
|Report Enabled|If selected, indicates that the license file allows reports to be printed in a language other than the global language|  
|XMLport Enabled|If selected, indicates that the license file allows data ports to be shown in a language other than the global language.|  
|Primary Code Page|The code page for a language defines the character set available for that language. If you mix text by using multiple code pages, you may not obtain the expected result.|  
|STX File|If selected, indicates that an \*.stx file is installed for the language in question. An \*.stx file contains general text used in menu labels and system table names.|  
|ETX File|If selected, indicates that an \*.etx file is installed for the language in question. An \*.etx file contains error messages.|  
|Help File|If selected, indicates that an \*.hlp or a \*.chm file is installed for the language in question.|  
  
## See Also  
 [Multilanguage Development](Multilanguage-Development.md)
