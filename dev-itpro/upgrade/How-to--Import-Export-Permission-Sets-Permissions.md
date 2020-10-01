---
title: "How to: Export and Import Permission Sets and Permissions"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
# Export and Import Permission Sets and Permissions

This articles describes how to import and export permission sets and permissions as XML files. This is useful when upgrading from [!INCLUDE[navnow](../developer/includes/navnow_md.md)] to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] or from one version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to another.

## <a name="ExportPerms"></a>Export permission sets and permissions 

1. To export the permission sets' XML file, run XMLport 9171 **Import/Export Permission Sets**.

    1. In the request page for the XMLport, in the **Direction** field, choose **export**.
    2. Add a filter to exclude the `SUPER` permission set, for example `<>SUPER`.
    3. Add additional filters to exclude other permission sets that you do not want.
    4. Choose the **OK** button, and then specify the name and location of the permission sets XML file.

    > [!IMPORTANT]
    > If you intend to import the exported permission sets as part of the upgrade from [!INCLUDE[navnow](../developer/includes/navnow_md.md)] to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], modify the exported permission sets file to accommodate user-defined permission sets. See the [Permission Sets file](#PermissionSetsFile) details.

2.  To export permissions, run XMLport 9172 **Import/Export Permissions**.  

     In the request page for the XMLport, in the **Direction** field, choose **Export**, choose the **OK** button, and then specify name and location of the permissions XML file.

## <a name="PermissionSetsFile"></a>Prepare the permission sets file for importing

Before you import the exported permission sets file, you might have to make some changes the file to the ensure that you will be able edit the permission sets after they are imported.

### Background

The reason for this is that the implementation of permission sets has changed in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] compared to [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)]. In [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], you could modify any permission set, even those provided by Microsoft. This is not the case in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], where permission sets are categorized in to three distinct types:

|Type|Description|
|----|-----------|
|`System`|Predefined permission sets that are typically added by Microsoft or by a software provider, like SUPER and D365 permission sets. You cannot modify these permission sets directly. However, you can make a copy of them and modify the copy.|
|`User-Defined`| Custom permission sets that users have created, either from scratch or from a copy of a **System** permission set. You can modify these permission sets directly.|
|`Extension`|Permission sets that are added by an extension. For purposes of upgrading from [!INCLUDE[navnow](../developer/includes/navnow_md.md)], you can ignore these permission sets.|

<!-- 
- `System`: Predefined permission sets that are typically added by Microsoft or by a software provider, like SUPER and D365 permission sets. You cannot modify these permission sets directly. However, you can make a copy of them and modify the copy.
- `User-Defined`: Custom permission sets that users have created, either from scratch or from a copy of a **System** permission set. You can modify these permission sets directly.
- `Extension`: Permission sets that are added by an extension. For purposes of upgrading from [!INCLUDE[navnow](../developer/includes/navnow_md.md)], you can ignore these permission sets.  


This differs from permission sets in [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], where there was no distinction between **System** and **User-Defined** permission sets.
-->

### How to change the permission sets file

To accommodate the different types when importing permission sets, the permission sets file requires a specific structure, as described below. Using a text editor, like NotePad or Visual Studio code, modify the exported permission sets file to suit this structure.

The file is divided into two sections that are separated by a blank line. The first section lists the **System** permission sets. The second section, after the blank line, lists the **User-Defined** permission sets. For example:

```
"System-1","Description-System-1"
"System-2","Description-System-2"

"UserDefined-1","Description-User-Defined-1"
"UserDefined-2","Description-User-Defined-2"
```

If there are no **System** permission sets for import, then file must have two blank lines at the beginning, before the **User-Defined** permission sets. For example:

```


"UserDefined-1","Description-UD-1"
"UserDefined-2","Description-UD-2"
 ```

## <a name="ImportPerms"></a>Import the permission sets and permissions  

1.  To import the permission sets XML file, run XMLport 9171 **Import/Export Permission Sets** ,  

     In the request page for the XMLport, in the **Direction** field, choose **Import**, choose the **OK** button, and then specify the permission sets XML file.  

2.  To import the permissions XML file, run XMLport 9172 **Import/Export Permissions**  

     In the request page for the XMLport, in the **Direction** field, choose **Import**, choose the **OK** button, and then specify the permissions XML file. 

## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
