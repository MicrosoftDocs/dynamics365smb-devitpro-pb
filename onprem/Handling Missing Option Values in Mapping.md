---
title: "Handling Missing Option Values in Mapping"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: SorenGP
manager: edupont
---
# Handling Missing Option Values in Mapping
[!INCLUDE[crm_md](includes/crm_md.md)] contains only three so-called option set fields that contain option values, which can be mapped to [!INCLUDE[navnow_md](includes/navnow_md.md)] fields of type Option for automatic synchronization. During synchronization, such non-mapped options are ignored, the missing options are appended to the related [!INCLUDE[navnow_md](includes/navnow_md.md)] table and added to the **CRM Option Mapping** system table for manual handling later, for example by adding the missing options in either product and then updating the mapping. This is described in the following.

The **Integration Table Mapping** table contains three maps for fields in the current version that contain one or more mapped option values.

![Dynamics 365 for Sales Integration 1.](media/crm_mapping_1.png)

After a full synchronization, the **CRM Option Mapping** table contains the non-mapped options in the three fields respectively. (Green rows are for payment term options. Yellow rows for shipment method options. Blue rows are for shipping agent options.)

![Dynamics 365 for Sales Integration 1.](media/crm_mapping_2.png)

The content of the **CRM Option Mapping** table is based on option strings in the **CRM Account** table.
![Dynamics 365 for Sales Integration 1.](media/crm_mapping_3.png)

In [!INCLUDE[crm_md](includes/crm_md.md)], the following fields on the account entity are mapped to fields on the customer record:

- **Address 1: Freight Terms** of data type Option Set, where options are defined as follows.

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_4.png)

- **Address 1: Shipping Method** of data type Option Set, where options are (from 1 to 7).

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_5.png)

- **Payment Terms** of data type Option Set, where options are (from 1 to 4).

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_6.png)

All the above [!INCLUDE[crm_md](includes/crm_md.md)] option sets are mapped to options in [!INCLUDE[navnow_md](includes/navnow_md.md)].

> [!NOTE]
> Do not rename records in tables mapped to [!INCLUDE[crm_md](includes/crm_md.md)] options as that will break the synchronization of the renamed options.

### Extending Option Sets in [!INCLUDE[crm_md](includes/crm_md.md)]
1. Add the three new options, with values from 5 to 7.

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_6.png)
2. Test that you can access the new options in the **CRM Account** table.

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_7.png)

> [!NOTE]
> Make sure that the first ten characters of the new option value names are [!INCLUDE[crm_md](includes/crm_md.md)] are unique. For example, two options named "Transfer 20 working days" and "Transfer 20 calendar days" will cause a failure because both have the same first 10 characters, "Transfer 2". Name them, for example, "TRF20 WD" and "TRF20 CD".

### Extending the CRM Account Table in [!INCLUDE[navnow_md](includes/navnow_md.md)]
You can now regenerate the **CRM Account** table, either with the related PowerShell script or by modifying the table manually.

1. Modify the **PaymentTermsCode** field by adding new options.

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_8.png)
2. The **OptionOrdinalValues** property is not visible in the Development Environment, but you can update it in the text object.

    ![Dynamics 365 for Sales Integration 1.](media/crm_mapping_9.png)

### Update the CRM Option Mapping table
Now you can recreate the mapping between [!INCLUDE[crm_md](includes/crm_md.md)] options and [!INCLUDE[navnow_md](includes/navnow_md.md)] records.

In the **Integration Table Mapping** window, select the line for the Payment Terms map, and then choose the **Synchronize Modified Records** action.

![Dynamics 365 for Sales Integration 1.](media/crm_mapping_10.png)

The **CRM Option Mapping** table is updated.

![Dynamics 365 for Sales Integration 1.](media/crm_mapping_11.png)

The **Payment Terms** table in [!INCLUDE[navnow_md](includes/navnow_md.md)] will then have new records for the [!INCLUDE[crm_md](includes/crm_md.md)] options. (New  options are in bold font below. Yellow rows represent all options that can now be synchronized. Gray rows represent options are not in use and will be ignored during synchronization. You can remove them or extend [!INCLUDE[crm_md](includes/crm_md.md)] options with the same names.)

![Dynamics 365 for Sales Integration 1.](media/crm_mapping_12.png)

## See Also  
[Customizing Dynamics 365 for Sales and Dynamics NAV Integration](Customizing-Dynamics-CRM-and-Dynamics-NAV-Integration.md)  
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md)
