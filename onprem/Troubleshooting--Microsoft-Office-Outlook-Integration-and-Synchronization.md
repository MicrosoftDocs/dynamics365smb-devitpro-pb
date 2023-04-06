---
title: Troubleshoot Outlook Integration and Synchronization
description: Test multiple installations and configurations of the Dynamics NAV Synchronization Add-in to resolve the problems that can occur on the Outlook Add-in.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e921e9d1-e22e-42e8-b827-e534f8fe98f3
caps.latest.revision: 28
---
# Troubleshooting: Microsoft Office Outlook Integration and Synchronization
This topic lists some common problems that can occur when you use the Microsoft Office Outlook Add-in.  
  
## Cleaning Up Data and Configuration Information  
 You may have to test multiple installations and configurations of the [!INCLUDE[navnow](includes/navnow_md.md)] Synchronization Add-in.  
  
 To make sure that you are starting from a clean installation, you should delete the following files from your computer before you start a new setup. The following table describes the details.  
  
|Product version|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|File location|  
|---------------------|---------------------------------------|-------------------|  
|[!INCLUDE[nav2009sp1](includes/nav2009sp1_md.md)]|Storage of what has been synchronized and set up in the add-in.|C:\\Users\\\<user name>\\AppData\\Local\\Microsoft Dynamics NAV\\OutlookSynch\\settings.xml|  
|[!INCLUDE[navnowlong](includes/navnowlong_md.md)]|Storage of what has been synchronized and set up in the add-in.|C:\\Users\\\<user name>\\AppData\\Roaming\\Microsoft Dynamics NAV\\OutlookSynch|  
  
## Treating Uncompleted Tasks that Have Been Deleted  
 If you attempt to delete a task in Outlook before the task is completed, after you synchronize, you will receive a message noting that there is a conflict, because the Outlook version of the task has been deleted. When you address the conflict and delete it, and synchronize again, the task is added back to the **Tasks** folder as completed.  
  
 To work around this problem, create a task, synchronize the first time, and set the status of the task to **Complete**. Synchronize again, and then delete the task. Synchronize again.  
  
## Using Outlook Links Collection With Outlook 2013  
 When you are setting up a user and specifying APP and Task entities, you cannot use the **Outlook Links** collection, which is not supported by Outlook 2013. If you have configured links, when you synchronize, it will fail with the following error:  
  
 **An error has occurred during the synchronization process. You can find the error details in the DynamicsNAVsync.log file.**  
  
 To work around this problem, do not configure the APP and TASK entities to use the **Links** collection.  
  
## Verifying Information in the Change Log Setup Window  
 By default, the change log is activated. However, you may want to verify that the activation is valid. For example, you may have to do this when no Contacts or To-Dos are synchronized when Outlook synchronization runs.  
  
#### To verify the Change Log Setup setting  
  
1.  In the **Search** box, enter **Change Log Setup**, and then choose the related link.  
  
2.  Verify that the **Change Log Activated** field is selected.  
  
3.  To validate specific **Change Log Setup** settings, on the **Actions** tab, in the **Setup** group, choose **Tables**.  
  
4.  The default change log setup contains information for the **Salesperson/Purchaser**, **Contact**, and **To-do** tables. You can make additional modifications.  
  
## Synchronizing Addresses for Contacts  
 When you specify a salesperson for a contact and then synchronize the contact with Outlook, information from the contact’s **Country/Region Code** field in [!INCLUDE[navnow](includes/navnow_md.md)] is missing from the Address field in the Outlook Contact form. When you attempt to modify information, for example, the street address, for the contact’s address in Outlook, and then synchronize that information back to [!INCLUDE[navnow](includes/navnow_md.md)], you may encounter the following error:.  
  
 **An Outlook item cannot be synchronized because the Country/Region Code field of the CONT\_PERS entity cannot be processed. Try again later and if the problem persists contact your system administrator.**  
  
 To fix this issue, add the country/region information to the multiline address field in the Outlook Contact form and then proceed with synchronization.  
  
## Setting Conditions  
 Setting conditions for the TASK and APP entities is required. Meetings and tasks need a Meeting Organizer or Task Owner, so you must create a condition.  
  
#### To configure conditions  
  
1.  In the **Search** box, enter **Outlook Synch. User Setup**, and then choose the related link.  
  
2.  Select the line for the APP entity, and then select the **Condition** field.  
  
3.  In the **Outlook Synch. Filters -Condition** window, in the **Field Name** field, select **Salesperson Code**.  
  
4.  In the **Value** field, add the code for the salesperson.  
  
5.  Repeat these steps for the TASK entity.  
  
 Setting conditions is not required, but you should do it to prevent mass data transfer to a local mailbox or a public folder. In large environments with hundreds of contacts, you may want to set conditions to limit the data that is to be synchronized to every salesperson who has a mailbox that is configured for Outlook synchronization.  
  
 If there are no conditions set for the contacts entities, then you may get the following message to view the debug log:  
  
 **Closing Mapi session "/o=First Organization/ou=First Administrative Group/cn=Recipients/cn=XY" because it exceeded the maximum of 250 objects of type "objtMessage**  
  
 This is due to a security setting on the Exchange Server. If a large set of data, which is first triggered with 250 objects, is synchronized to Exchange Server, then Exchange Server logs an error in the event log file and does not let you add the data to the mailbox.  
  
 To work around this limitation, you can adjust the registry based on the objects that can be found in event ID 9646 in the application event log file on Exchange Server. After you have completed setting conditions, you may have to register the changes in the change log but only if you have made changes to the default configuration in the **Outlook Synch. Entities** window. The changes are registered in the following order in the change log: CONT\_SP, CONT\_COMP, CONT\_PERS, TASK, and APP entity.  
  
 For more information, see the following articles:  
  
-   [Knowledge Base article 830836: Event ID 9646 is logged when you try to send many messages in Exchange Server 2003](https://go.microsoft.com/fwlink/?LinkId=154865)  
  
-   [Knowledge Base article 830829: Your Exchange Server 2003 computer may stop responding after a MAPI client opens more than the default value of certain server objects](https://go.microsoft.com/fwlink/?LinkID=154446)  
  
-   [An Exchange 2007 server stops responding to a MAPI client and logs event ID 9646 in the Application log](https://go.microsoft.com/fwlink/?LinkID=154447)  
  
    > [!NOTE]  
    >  By default, there is no debug log. You must enable it first. For more information, see [Knowledge Base article 944237: How to enable the log file mode for the Outlook Synchronization feature in Microsoft Dynamics NAV 5.0](https://go.microsoft.com/fwlink/?LinkID=154448) \(requires PartnerSource account\).  
  
## Locating the Error Log Created By the Outlook Synchronization Process  
 You may receive the following message:  
  
 **An Error has occurred during the synchronization process.  You can find the error details in the log file**  
  
 The location of this log file depends on the operating system that you are using. You can find the path of the file by looking in the Outlook.exe.config file: c:\\Program Files\\Microsoft Office\\Office\<version number>\\Outlook.exe.config.  
  
> [!NOTE]  
>  You can modify the Outlook.exe.config file to change the amount of information that is logged in the log file and to show more detailed information. For more information, see [Knowledge Base article 944237: How to enable the log file mode for the Outlook Synchronization feature in Microsoft Dynamics NAV 5.0](https://go.microsoft.com/fwlink/?LinkID=154448) \(requires PartnerSource account\).  
  
## Synchronizing Large Sets of Data  
 Synchronizing large amounts of data can cause issues with the connection through NAS Services and web services.  
  
 If you are synchronizing with the web services connection, then the maximum size of the web service can be changed. You can configure the maximum permitted size of a web services request in the CustomSettings.config file.  
  
```  
<!--  Maximum permitted size of a web services request, in kilobytes-->  
<add key="WebServicesMaxMsgSize" value="512"></add>  
```  
  
 You should not regularly synchronize large sets of data, although it may be appropriate to do this during initial setup. Instead, we recommend that you change the web service size back to an appropriate level after you perform a full synchronization.  
  
## Setting Up Microsoft Outlook Integration in a Three-Machine Environment  
 When selecting a company, you may receive a message that resembles one of the following messages:  
  
-   The connection to "" Microsoft Dynamics NAV database failed. The program returned the following error: GetCompaniesList error: The login failed when connecting to SQL Server \<DatabaseTier>. connection string: NavSynchronizationUrl=https://\<ServiceTier>:7047/DynamicsNAV71/WS/Codeunit/DynamicsNAVsynchOutlook;CompanyName=\<CompanyName>; Please verify your synchronization settings. If the problem persists contact your system administrator.  
  
-   The connection to "" Microsoft Dynamics NAV database failed. The program returned the following error: GetCompaniesList error: The request failed with HTTP status 401: Unauthorized. connection string: NavSynchronizationUrl=https://\<ServiceTier>:7047/DynamicsNAV70/WS/Codeunit/DynamicsNAVsynchOutlook;CompanyName=\<CompanyName>; Please verify your synchronization settings. If the problem persists contact your system administrator.  
  
 In the message, \<DatabaseTier> is the server name of the SQL Server, \<ServiceTier> is the server name of the Microsoft Dynamics NAV Server, and \<CompanyName> is the company name.  
  
 These errors can occur if [!INCLUDE[navnow](includes/navnow_md.md)] web services are not set up with the correct Service Principal Names \(SPN\) and delegation information. They can also occur if the web service path is not set correctly in the **Connection** tab. For more information, see [Walkthrough: Installing the Three Tiers on Three Computers](Walkthrough--Installing-the-Three-Tiers-on-Three-Computers.md). You can also see the [NAV 2009 Web Services on a three machine setup](https://go.microsoft.com/fwlink/?LinkID=154453) blog post in the [!INCLUDE[navnow](includes/navnow_md.md)] Team Blog on MSDN.  
  
## Configuring the Outlook Profile in an Environment Other than Microsoft Exchange  
 When you add and configure a new user Outlook profile in an environment other than Microsoft Exchange and are working with the TASK entity, you must make sure that the name of the Active Directory user \(Full name\) or name of the Mailbox owner matches the Salesperson as configured on the **Salesperson/Purchaser** card.  
  
 Otherwise, you may receive this message:  
  
 **The error occurred while setting the Owner property of the item: Task owner can be set to XXX only**  
  
## Displaying the [!INCLUDE[navnow](includes/navnow_md.md)] Synchronization Toolbar  
 After you reinstall the Microsoft Office Outlook Add-in, the **Microsoft Dynamics NAV Synchronization** toolbar items may not appear in Outlook on the Add-ins tab, even though the toolbar is selected in the list of available toolbars from the **View** menu. This occurs because an earlier version of the add-in is running during reinstallation.  
  
#### To display the Microsoft Dynamics NAV Synchronization toolbar  
  
1.  In Outlook, on the **File** tab, choose **Options**, and then, in the **Options** dialog, choose **Add-Ins**.  
  
2.  In the **Manage** box, verify that **COM Add-ins** is selected, and then choose **Go**.  
  
3.  If the [!INCLUDE[navnow](includes/navnow_md.md)] Synchronization Add-in is selected, clear the check box, and then choose the **OK** button.  
  
4.  In the **Manage** box, verify that **COM Add-ins** is selected, and then choose **Go**.  
  
5.  Select the **Microsoft Dynamics NAV Synchronization Add-in** check box, and then choose the **OK** button.  
  
## Showing Synchronization  
 We recommend that you enable the **Show Synchronization Progress** option in Outlook so that a user knows when synchronization is occurring. This helps a user avoid receiving an error if Outlook is closed when synchronization is occurring.  
  
#### To set rules for synchronization  
  
1.  In Outlook, on the **Microsoft Dynamics NAV Synchronization** toolbar, choose **Settings**.  
  
2.  On the **General** tab, select the **Show synchronization progress** and **Show synchronization summary** check boxes.  
  
## Finding Additional Information  
 For additional information about the set up and configuration of the Microsoft Dynamics Synchronization Add-in, see the [!INCLUDE[navnow](includes/navnow_md.md)] Help. You can search for the "Set Up Outlook Synchronization" topic as a starting point. In addition, see the [Outlook Integration Installation & Setup Technical White Paper](https://go.microsoft.com/fwlink/?LinkID=154449) \(requires PartnerSource account\). Although this document describes installation for [!INCLUDE[nav_5](includes/nav_5_md.md)], much of the information applies to [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. You can also find troubleshooting information on the [NAV Developer's Blog](https://go.microsoft.com/fwlink/?LinkId=154870) on MSDN.  
  
## See Also  
 [Walkthrough: Setting Up Outlook Synchronization](Walkthrough--Setting-Up-Outlook-Synchronization.md)   
 [Installation Options](Installation-Options.md)
