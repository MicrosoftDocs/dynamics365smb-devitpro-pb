---
title: "Import Worksheet"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Import Worksheet
When you import objects from a binary file \(.fob\), if there are conflicts with objects that exist in the database with the same ID, then you use the Import Worksheet to resolve the conflicts. If the import file contains only objects that are new, then the objects are imported.  
  
 If you import objects from a .txt file, then the objects in the file overwrite any existing objects in the database.  
  
 You use the Import Worksheet when you import objects by using the UI in the development environment. For more information about how to import objects, see [Importing Objects](cside-import-objects.md).  
  
## Default Actions in the Import File  
 The value of the **Action** column for each object in the Import Worksheet can be saved in the .fob file with the objects by choosing the **Save As** button in the Import Worksheet. When you import a .fob file, in the dialog box, you can choose the **Yes** button to import all objects and use the actions that are saved in the .fob file, or choose the **No** button to open the Import Worksheet and revise the action for any object in the file.  
  
## The Import Worksheet  
 Each line in the Import Worksheet displays information about one object. You decide how to handle the conflict by choosing an action in the **Action** column. The following table shows the information that is displayed about each object in the import file.  
  
|Object|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|Type|The type of this object. The type is one of the following:<br /><br /> \*  TableData<br /><br /> \*  Table<br /><br /> \*  Report<br /><br /> \*  Codeunit<br /><br /> \*  XMLport<br /><br /> \*  MenuSuite<br /><br /> \*  Page<br /><br /> \*  Query<br /><br /> \*  System<br /><br /> \*  FieldNumber|  
|No.|The ID of the object.|  
|Name|The name of the object.|  
|New Object|Specifies if the object to import is a new object that does not exist already in the database.|  
|New Object Changed|Specifies if the new object to import has been marked as changed.|  
|Existing Object Changed|Specifies if the object to import is an existing object that has been changed, for example, the **Modified** field is set or the **Version List** is changed.|  
|Warning|Specifies if there is a conflict that must be resolved before this object can be imported.|  
|Action|Specifies how the conflict will be resolved. This is the only field that you can change The options are the following:<br /><br /> **Create**: The new object will be added to the database. This option is only valid if no such object already exists.<br /><br /> **Replace**: The existing object will be replaced by the new object.<br /><br /> **Delete**: The existing object will be deleted and no new object created. This option is only valid if the new object has size 0. The intended use is to remove obsolete objects from the database.<br /><br /> **Skip**: This object will not be imported.<br /><br /> **Merge: Existing\<-New**: Only valid for tables. All fields in the existing table will remain and any additional fields from the new object will be added.<br /><br /> **Merge: New\<-Existing**: Only valid for tables. All fields in the new table will be imported and any additional fields in the existing table will be added to the new table.|  
|Existing Object Modified|Specifies if the existing object has the **Modified** field set.|  
|Existing Object Version List|The version of the existing object.|  
|New Object Modified|Specifies if the new object has the **Modified** field set.|  
|New Object Version List|The version of the new object.|  
  
 In addition, the **Name**, **Modified**, **Version list**, **Size**, **Date**, and **Time** fields are displayed in the window for the object that is selected.  
  
## Using the Import Worksheet  
 For each object, you can choose an action, given the constraints outlined in the preceding table. You can apply these actions by choosing the appropriate buttons.  
  
|Action|Definition|  
|------------|----------------|  
|OK|Perform the import according to the current settings in the worksheet.|  
|Cancel|Cancel the import.|  
|Replace All|Set **Action** for all objects in the worksheet to **Replace**.|  
|Save As|Save the current settings in the worksheet in the import file, together with the objects.|  
