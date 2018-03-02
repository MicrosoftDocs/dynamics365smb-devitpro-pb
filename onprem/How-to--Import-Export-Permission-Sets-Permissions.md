---
title: "How to: Export and Import Permission Sets and Permissions"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.prod: "dynamics-nav-2018"
---
# How to: Export and Import Permission Sets and Permissions

This articles describes how to import and export permission sets and permissions as XML files. This is useful when upgrading from one version of [!INCLUDE[navnow](includes/navnow_md.md)] to another.

## <a name="ExportPerms"></a>Export permission sets and permissions  

1.  To export the permission sets' XML file, run XMLport 9171 **Import/Export Permission Sets** ,  

     In the request page for the XMLport, in the **Direction** field, choose **export**, choose the **OK** button, and then specify the name and location of the permission sets XML file.  

3.  Run XMLport 9172 **Import/Export Permissions** to import the permission XML file.  

     In the request page for the XMLport, in the **Direction** field, choose **Export**, choose the **OK** button, and then specify name and location of the permissions XML file.

## <a name="ImportPerms"></a>Import the permission sets and permissions  

1.  To import the permission sets XML fileRun XMLport 9171 **Import/Export Permission Sets** ,  

     In the request page for the XMLport, in the **Direction** field, choose **Import**, choose the **OK** button, and then specify the permission sets XML file.  

3.  Run XMLport 9172 **Import/Export Permissions** to import the permission XML file.  

     In the request page for the XMLport, in the **Direction** field, choose **Import**, choose the **OK** button, and then specify the permissions XML file.  

## See Also  
[About Permissions](About-Permissions.md)  
[How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)  
[Upgrading to Microsoft Dynamics NAV](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)  
