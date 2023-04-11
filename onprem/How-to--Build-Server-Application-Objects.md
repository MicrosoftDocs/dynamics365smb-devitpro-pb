---
title: Build Server Application Objects
description: Building server application objects recompiles the objects, regenerates the C\# and metadata information and updates record in the object metadata.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6f98e4db-fb5a-463c-8767-a1835d0abed5
caps.latest.revision: 5
---
# How to Build Server Application Objects
If you import a .fob file that contains objects that were exported from a native [!INCLUDE[navnow](includes/navnow_md.md)] database, then those objects do not contain the C\# and metadata information that is required for [!INCLUDE[nav_server](includes/nav_server_md.md)]. Additionally, if you import a .fob file that contains the C\# and metadata information but the information is from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)], then the information may be in an incompatible format. In these cases, you must build the server application objects. If you do not build the server application objects, then these objects cannot be run. Building the server application objects does the following:  
  
-   Recompiles the objects.  
  
-   Regenerates the C\# and metadata information for the objects.  
  
-   Updates the record in the **Object Metadata** table for each object.  
  
> [!NOTE]  
>  In [!INCLUDE[navnow](includes/navnow_md.md)] 2009, you used the **Enable for [!INCLUDE[nav_server](includes/nav_server_md.md)]** option to specify that when you compiled objects, you also wanted to regenerate the C\# and metadata information. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the **Enable for [!INCLUDE[nav_server](includes/nav_server_md.md)]** option has been removed from the **Options** tab in the **Alter Database** window.  
  
### To build server application objects  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Build Server Application Objects**.  
  
2.  In the dialog box, choose the **Yes** button.  
  
     If errors occurred, then the **Error List** window opens.  
  
## See Also  
 [Importing and Exporting Objects](Importing-and-Exporting-Objects.md)
