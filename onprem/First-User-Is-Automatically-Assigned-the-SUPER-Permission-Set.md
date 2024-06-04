---
title: "First User Is Automatically Assigned the SUPER Permission Set"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 88cebadf-d01b-4ddd-a23d-2f0832715c79
caps.latest.revision: 18
---
# First User Is Automatically Assigned the SUPER Permission Set
When a user creates a [!INCLUDE[navnow](includes/navnow_md.md)] database, that user is automatically assigned the SUPER permission set in the [!INCLUDE[navnow](includes/navnow_md.md)] security system. There are different ways to create a database, such as by performing a Demo install, which creates the [!INCLUDE[demolong](includes/demolong_md.md)], or by restoring a previously backed-up database. After the database is created, the first user is automatically assigned the SUPER permission set. The SUPER permission set allows the user to read, use, update, and delete all data and all application objects in the scope of the current [!INCLUDE[navnow](includes/navnow_md.md)] license. This user is then responsible for creating additional users and for assigning appropriate permission sets to those users.  
  
## The SUPER Permission Set  
 When you have the SUPER permission set, you can create other users and assign them the SUPER permission set. For example, you can assign the SUPER permission set to one or more users in each company in the [!INCLUDE[navnow](includes/navnow_md.md)] database. Each of these users can then create other users and assign them permission sets in their own company and any other company in that [!INCLUDE[navnow](includes/navnow_md.md)] database. However, a user who has the SUPER permission set for a specific company cannot assign the SUPER permission set to users in other companies.  
  
> [!NOTE]  
>  You cannot modify permissions for the SUPER permission set.  
  
 If you want to set up a user who can create other users and assign permission sets, you can choose to assign them the SUPER permission set. Alternatively, you can create a dedicated SECURITY permission set that includes read, insert, modify, and delete permission to the following tables and any other tables that you want to grant access to:  
  
-   **\($ T\_2000000120 User $\)**  
  
-   **\($ T\_2000000121 User Property $\)**  
  
-   **\($ T\_2000000053 Access Control $\)**  
  
 The permission set must also include read access to the **\($ T\_2000000004 Permission Set $\)** table.  
  
 Users who have a SECURITY permission set can create new users and assign them the same permission sets. If you create a SECURITY permission set, users who have this permission set cannot assign themselves or anyone else the SUPER permission set. Also, a user who has the SECURITY permission set for a specific company cannot assign permission sets to users in other companies.  
  
## See Also  
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md)   
 [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md)