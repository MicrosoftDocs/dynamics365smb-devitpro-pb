---
title: "Create Microsoft Azure Access Control Service Users"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 6a36517e-3f9d-44aa-875d-39a77ab24bc7
caps.latest.revision: 8
---
# Create Microsoft Azure Access Control Service Users

[!INCLUDE[ACS_md](includes/ACS_md.md)]

Microsoft Azure Access Control service \(ACS\) users are one of four types of users that you can create in [!INCLUDE[navnow](includes/navnow_md.md)] clients. For more information about how to create one or more users for ACS authentication, see the "To create a new user for AccessControlService authentication" section in [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md). Follow the instructions  and make a note of the user names and authentication keys for any users that you create.  
  
> [!IMPORTANT]  
>  If ACS authentication is not available, consider creating at least one user who will be able to connect by using a [!INCLUDE[navnow](includes/navnow_md.md)] client. For example, if users are registered by using a certain ACS namespace and that namespace changes, then the users will no longer be able to connect.  
>   
>  One way to prevent this kind of lockout is to create a user who will be able to access the client using **NavUserPassword** authentication. For more information, see [Users and Credential Types](Users-and-Credential-Types.md). Another option is to create an ACS user but to never log that user in with ACS authentication, so that the user's ACS status remains **Pending**.  
>   
>  For either option, make sure that you assign the SUPER permission set to this user, to make sure that there is at least one user with full access to all client functionality.