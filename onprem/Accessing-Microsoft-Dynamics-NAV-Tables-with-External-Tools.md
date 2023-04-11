---
title: "Accessing Microsoft Dynamics NAV Tables with External Tools"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 78e80b89-f560-4ff2-98be-bb57afc42b33
caps.latest.revision: 7
---
# Accessing Microsoft Dynamics NAV Tables with External Tools
You can access data in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] tables with external tools, such as Microsoft Enterprise Manager. When you do this, the values in fields that contain the code, date, and time data types with a specific format, must be manipulated correctly for data modification or comparison. When you use external tools, no special processing of code field data is required to join fields in different tables, if you use the same SQL data type value for each code field in a join or CAST the value to the appropriate data type.  
  
 In the **New Database** and **Alter Database** windows, you can choose to maintain SQL views. If you enable this option, SQL Server will create and maintain a view for each language ID that is added to a table in [!INCLUDE[navnow](includes/navnow_md.md)]. The system creates a SQL view by prefixing the SQL Server table name with the Windows language ID for each **CaptionML** value.  
  
 This means that external tools can use a view of the object in the user’s language, for example, Spanish, rather than the object name. The object name could be in another language, for example, English \(United States\).  
  
 The view is updated by every change in the **CaptionML** values of a table. For more information, see [Multilanguage Development](Multilanguage-Development.md).  
  
## See Also  
 [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md)   
 [Identifiers, Data Types, and Data Formats](Identifiers--Data-Types--and-Data-Formats.md)
