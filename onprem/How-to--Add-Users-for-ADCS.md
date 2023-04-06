---
title: Add Users for ADCS
description: Add user as an Automated Data Capture System ADCS user, and optionally provide a connection that identifies ADCS user as a warehouse employee.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4c5564b0-f01d-47af-b2f6-9f7587afd449
caps.latest.revision: 9
translation.priority.ht:
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-in
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# How to Add Users for ADCS in Dynamics NAV
You can add any user as a user of an Automated Data Capture System \(ADCS\). When you do this, the user must also provide a password. Optionally, you can also provide a connection that identifies the ADCS user as a warehouse employee. The ADCS user password can be different from the Windows logon password of the user.  

### To add an ADCS user  

1.  In the **Search** box, enter **ADCS Users**, and then choose the related link.  

2.  On the **Home** tab, choose **New** to add a new user.  

3.  In the **Name** field, enter a name for the user. The name cannot contain more than 20 characters, including spaces.  

4.  In the **Password** field, enter a password. The password is masked.  

### To indicate that a warehouse employee is an ADCS user  

1.  In the **Search** box, enter **Warehouse Employees**, and then choose the related link.  

2.  If needed, add a new warehouse employee.  

3.  On the **Home** tab, in the **Manage** group, choose **Edit List**.  

4.  Select a warehouse employee from the list. In the **ADCS User** field, choose the drop-down arrow, and then select the name of an ADCS user from the list.  

    > [!NOTE]  
    >  The default warehouse for the employee should be a warehouse that is set up to use ADCS. You can do this by opening the location card for the warehouse, and then choosing the Use ADCS check box.   

## See Also  
 [How to: Test the ADCS Connection](How-to--Test-the-ADCS-Connection.md)   
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)  
  <!--[ADCS Users](\($-N_7710-ADCS-Users-$\).md)-->   
