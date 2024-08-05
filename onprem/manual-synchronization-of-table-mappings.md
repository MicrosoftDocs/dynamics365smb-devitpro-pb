---
title: "Manual Synchronization of Table Mappings"
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Manual Synchronization of Table Mappings
An integration table mapping associates a [!INCLUDE[navnow_md](includes/navnow_md.md)] table \(record type\), such as Customer, with a [!INCLUDE[crm_md](includes/crm_md.md)] entity, such as Account. Synchronizing an integration table mapping enables you to synchronize data in all records of the [!INCLUDE[navnow_md](includes/navnow_md.md)] table and [!INCLUDE[crm_md](includes/crm_md.md)] entity that coupled together. Additionally, depending on the configuration of the table mapping, synchronization can create and couple new records in the destination solution for uncoupled records in the source.  

The manually synchronizing integration table mappings can be useful during the initial set up of a 365 for Sales integration, and when diagnosing synchronization errors.  

There are three methods for manually synchronizing integration table mappings as described in this article. Each method provides a different level of synchronization.

## <a name="FullSync"></a>Run a Full Synchronization
A *full synchronization* runs all the default integration synchronization jobs for synchronizing [!INCLUDE[navnow_md](includes/navnow_md.md)] record types and [!INCLUDE[crm_md](includes/crm_md.md)] entities, as defined in the **Integration Table Mappings** page. A full synchronization performs the following operations:  

 -   Synchronizes data in [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] records that are already coupled.  

      The synchronization direction \(for example, from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)] or from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)]\) is predetermined by the integration table mappings.  

 -   For [!INCLUDE[navnow_md](includes/navnow_md.md)] or [!INCLUDE[crm_md](includes/crm_md.md)] records that are not already coupled, a new matching record will be created and coupled in the opposing solution.  

      Whether and where a record gets created depends on the synchronization direction. For example, when synchronizing data from [!INCLUDE[navnow_md](includes/navnow_md.md)] customers to [!INCLUDE[crm_md](includes/crm_md.md)] accounts, if there is a customer that is not coupled to an account, then a new account will be automatically added in [!INCLUDE[crm_md](includes/crm_md.md)] and coupled to the customer in [!INCLUDE[navnow_md](includes/navnow_md.md)]. The opposite holds true when the synchronization direction is from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)]. For each account that is not already coupled to a customer, a new matching customer will be created in [!INCLUDE[navnow_md](includes/navnow_md.md)] and coupled to the account in [!INCLUDE[crm_md](includes/crm_md.md)].  

     > [!NOTE]  
     >  To achieve this, the full synchronization operation temporarily clears the **Synch. Only Coupled Records** option on the integration table mapping that is used by the synchronization job. At the end of the full synchronization process, you will be prompted whether you want to keep this option cleared for all jobs.  


 -   The jobs are run in the following order to avoid coupling dependencies between entities.  

    1.  CURRENCY \- Dynamics 365 for Sales synchronization job  
    2.  SALEPEOPLE \- Dynamics 365 for Sales synchronization job  
    3.  UNITOFMEASURE \- Dynamics 365 for Sales synchronization job  
    4.  CUSTOMER \- Dynamics 365 for Sales synchronization job  
    5.  CONTACTS \- Dynamics 365 for Sales synchronization job  
    6.  RESOURCE\-PRODUCT \- Dynamics 365 for Sales synchronization job  
    7.  ITEM\-PRODUCT \- Dynamics 365 for Sales synchronization job  

> [!IMPORTANT]  
>  You typically only use the full synchronization when you initially set up integration between [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] and only one of solutions contains data, which you want to copy to the other solution. A full synchronization can be useful in a demonstration environment. Because the full synchronization automatically creates and couples records between the solutions, it makes it faster to start working with synchronizing data between records. On the other hand, you should only run a full synchronization if you want a record in [!INCLUDE[navnow_md](includes/navnow_md.md)] for each record in [!INCLUDE[crm_md](includes/crm_md.md)] for the given table mappings. Otherwise, you can have unwanted or duplicate records in either [!INCLUDE[navnow_md](includes/navnow_md.md)] or [!INCLUDE[crm_md](includes/crm_md.md)].  

### To run a full synchronization  

 1.  In the **Search** box, enter **Microsoft Dynamics 365 for Sales Connection Setup**, and then choose the related link.  

 2.  On the **Actions** tab, in the **General** group, choose **Run Full Synchronization**, and then choose the **Yes** button.  

    The full synchronization process starts.  

 3.  When the full synchronization is completed, you are prompted whether you want to allow scheduled synchronization jobs to create new records.  

    If you want all synchronization jobs to create new records in the destination for uncoupled records in the source, then choose the **Yes** button. This sets the **Synch. Only Coupled Records** field on the table mappings that are used by the synchronization jobs. <!--For more information about this option, see [\($ T\_5335\_16 Synch. Only Coupled Records $\)](../Topic/\($-T_5335_16-Synch.-Only-Coupled-Records-$\).md).-->  

    If you want synchronization jobs to run as they did before the full synchronization with regard to creating new records, choose the **No** button. This sets the **Synch. Only Coupled Records** field to the setting it had before the full synchronization.  

You can view the results of the full synchronization in the **Integration Synchronization Jobs** window. For more information, see [How to: View Microsoft Dynamics 365 for Sales Synchronization Status](how-to-view-synchronization-status.md).  

## <a name="SyncAllRecords"></a>Synchronize Records for All Tables
You can use the **Microsoft Dynamics 365 for Sales Connection Setup** window to run synchronization for all integration table mappings. This will synchronize data in all coupled records in the [!INCLUDE[navnow_md](includes/navnow_md.md)] tables and [!INCLUDE[crm_md](includes/crm_md.md)] entities that are defined in the table mappings. By default, only records that have been modified since the last time they were synchronized will be synchronized. The table mappings are synchronized in the following order to avoid coupling dependencies between the entities:  

1.  CURRENCY \- Dynamics 365 for Sales synchronization job  
2.  SALEPEOPLE \- Dynamics 365 for Sales synchronization job  
3.  UNITOFMEASURE \- Dynamics 365 for Sales synchronization job  
4.  CUSTOMER \- Dynamics 365 for Sales synchronization job  
5.  CONTACTS \- Dynamics 365 for Sales synchronization job  
6.  RESOURCE\-PRODUCT \- Dynamics 365 for Sales synchronization job  
7.  ITEM\-PRODUCT \- Dynamics 365 for Sales synchronization job  

> [!TIP]  
>  By modifying the individual integration table mapping in advance, you can configure the synchronization with filters to control which records are synchronized, or configure it to create new records in the destination solution for uncoupled records in the source. For more information, see [How to: Modify Table Mappings for Synchronization](How-to-Modify-Table-Mappings-for-Synchronization.md).  

### To synchronize records for all tables  
1.  In the **Search** box, enter **Microsoft Dynamics 365 for Sales Connection Setup**, and then choose the related link.  
2.  On the **Actions** tab, in the **General** group, choose **Synchronize Modified Records**, and then choose the **Yes** button.  

    The synchronization process starts.  

3.  A message appears when the synchronization is completed. Choose the **OK** button.  

You can view the results of the synchronization in the **Integration Synchronization Jobs** window. For more information, see [How to: View Dynamics 365 for Sales Synchronization Status](how-to-view-synchronization-status.md).  

## <a name="SyncTableMappings"></a>Synchronize Individual Table Mappings
You can use the **Integration Table Mappings** window to run a synchronization job specific table mappings. This will synchronize data in all coupled records in the [!INCLUDE[navnow_md](includes/navnow_md.md)] table and [!INCLUDE[crm_md](includes/crm_md.md)] entity that are defined by the table mapping. By default, only records that have been modified since the last time they were synchronized will be synchronized.  

By modifying the integration table mapping in advance, you can configure the synchronization job to create new records in the destination solution for uncoupled records in the source. For more information, see [How to: Modify Table Mappings for Synchronization](How-to-Modify-Table-Mappings-for-Synchronization.md).  

### To synchronize records of an integration table mapping  
1.  In the **Search** box, enter **Integration Table Mappings**, and then choose the related link.  
2.  On the **Home** tab, in the **Process** group, choose **Synchronize Modified Records**, and then choose the **Yes** button.  

     The synchronization process starts.  

3.  A message appears when the synchronization is completed. Choose the **OK** button.  

You can view the results of the synchronization in the **Integration Synchronization Jobs** window. For more information, see [How to: View Microsoft Dynamics 365 for Sales Synchronization Status](how-to-view-synchronization-status.md).

## See Also  
[Synchronizing Microsoft Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md)   
[Scheduled Synchronization Using the Synchronization Job Queue Entries](Scheduled-Synchronization-Using-the-Synchronization-Job-Queue-Entries.md)   
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md )   
[Record Couplings](Dynamics-CRM-Integration-Concepts-and-Terminology.md#CouplingOverview)   
[Integration Table Mappings](Dynamics-CRM-Integration-Concepts-and-Terminology.md#IntegTblMappingsOverview)
