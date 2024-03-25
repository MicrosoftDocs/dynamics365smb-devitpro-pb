---
title: "How to: Export and Import Companies and Other Data in Clients"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: bd97535e-09d7-4268-945a-fbef30d0ddb5
caps.latest.revision: 4
---
# How to: Export and Import Companies and Other Data in Clients
You can export data such as a company or an application from a [!INCLUDE[navnow](includes/navnow_md.md)] database in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)]. You can also import data into a [!INCLUDE[navnow](includes/navnow_md.md)] database.  

> [!IMPORTANT]  
>  To export or import data from a [!INCLUDE[navnow](includes/navnow_md.md)] database, you must be a user in the [!INCLUDE[navnow](includes/navnow_md.md)] database, and your user account must have a permission set that enables you to export or import data, such as the SUPER permission set. We recommend that you define a specific permission set such as DATA-EXPORTIMPORT and add system permissions 5410, Export Data to Data File, and 5420, Import Data from Data file. Optionally, add other permissions, and then assign the permission set to the users that you want to be able to export and import data.  

 When you export data from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)], data is exported from the database that your current company uses. Similarly, when you import data, data is imported into your current database.  

 The following procedures assume that you have the relevant permissions as described above.  

### To export data  

1.  In the **Search** box, enter **Export to a Data File**, and then choose the related link.  

2.  In the **Export to Data File** window, fill in the fields as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**Description**|Optionally, specifies a description of the data that you want to export, such as **Company A data**.<br /><br /> The text that you specify is used as a suggested file name when you start the export.|  
    |**All Companies**|Specifies if you want to export all companies in the current database.<br /><br /> If you do not choose this field, and you want to export one or more companies, you must you must select the relevant companies from the list of available companies.|  
    |**Global Data**|Specifies if you want to export data that is common to all companies in the database. This includes the report list, permission sets, user IDs, and printer selections, but no company-specific business data.|  
    |**Application Data**|Specifies if you want to export the data that defines the application in the database.|  
    |**Application**|Specifies if you want to export all application objects. Application data is not included.|  

3.  Optionally, if you did not choose the **All Companies** field, select one or more companies to export.  

4.  Choose the **OK** button, and then, in the window that appears, specify the location and name of the file that the data is exported to, and then choose the **Save** button.  

     The data is exported to a file with the extension **.navdata**.  

 You have exported data from a [!INCLUDE[navnow](includes/navnow_md.md)] database into a file. Now, you can import the data into another [!INCLUDE[navnow](includes/navnow_md.md)] database.  

 Before you import data from a navdata file, you can choose to use the **Get-NAVDataFile** Windows PowerShell cmdlet to see what the file contains. For more information, see [How to: Export and Import Companies and Other Data using Windows PowerShell Cmdlets](How-to--Export-and-Import-Companies-and-Other-Data-using-Windows-PowerShell-Cmdlets.md).  

### To import data  

1.  In the **Search** box, enter **Import Data**, and then choose the related link.  

2.  In the **Import from Data File** window, fill in the fields as described in the following table.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**File Name**|Specifies the name and location of the .navdata file that you want to import data from.|  
    |**All Companies**|Specifies if you want to import all companies in the current database.<br /><br /> If you do not choose this field, and you want to import one or more companies, you must select the relevant companies from the list of available companies.|  
    |**Company Name**|Specifies the name of the company that you want to import. You can specify more than one company.|  
    |**Global Data**|Specifies if you want to import data that is common to all companies in the database. This includes the report list, permission sets, user IDs, and printer selections, but no company-specific business data.|  
    |**Application Data**|Specifies if you want to import the data that defines the application in the database. **Warning:**  If you choose to import application data, you must make sure that the application in the current database supports the application data.|  

3.  Optionally, if you did not choose the **All Companies** field, select one or more companies to import.  

4.  Choose the **OK** button.  

    > [!WARNING]  
    >  If you choose to import data of a type that already exists in the database, you risk overwriting the data. You will be asked to confirm that you want to overwrite the existing data.  

5.  The data that you specified is now imported into your current database.  

## See Also  
 [Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md)   
 [How to: Export and Import Companies and Other Data using Windows PowerShell Cmdlets](How-to--Export-and-Import-Companies-and-Other-Data-using-Windows-PowerShell-Cmdlets.md)
