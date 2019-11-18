---
title: "Walkthrough: Setting Up Outlook Synchronization"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ea74bd60-14a4-4ae0-bd56-9ee23fd32edd
caps.latest.revision: 46
---
# Walkthrough: Setting Up Outlook Synchronization
You can synchronize data, such as to-dos, contacts, and tasks, between [!INCLUDE[navnow](includes/navnow_md.md)] and Microsoft Outlook. This allows users who rarely connect to [!INCLUDE[navnow](includes/navnow_md.md)], such as salespeople who frequently work away from the office, to keep their data synchronized. For example, a sales manager can set a meeting for a salesperson as a to-do in [!INCLUDE[navnow](includes/navnow_md.md)]. That salesperson can then view or modify the meeting in Outlook. A salesperson can also add a new contact in Outlook. That contact is then added to the company's [!INCLUDE[navnow](includes/navnow_md.md)] database.  

 You define the mapping between [!INCLUDE[navnow](includes/navnow_md.md)] entities and Outlook items in [!INCLUDE[navnow](includes/navnow_md.md)]. You then specify the entities that users synchronize.  

 The Microsoft Outlook Add-In for [!INCLUDE[navnow](includes/navnow_md.md)] is required to set up and use synchronization. Outlook must be set up and configured for users before you install the add-in. If it is not, then the add-in may not display correctly. You must also set up a web service.  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   Setting up [!INCLUDE[navnow](includes/navnow_md.md)] synchronization in a multiple-user environment.  

-   Configuring [!INCLUDE[navnow](includes/navnow_md.md)] for Outlook synchronization.  

-   Mapping [!INCLUDE[navnow](includes/navnow_md.md)] entities to Outlook items, which lets you:  

    -   Assign synchronization entities to synchronization users.  

    -   Apply change log settings.  

-   Setting conditions for entities.  

-   Setting up a web services connection between Outlook and [!INCLUDE[navnow](includes/navnow_md.md)].  

-   Configuring synchronization in Outlook, which lets you:  

    -   Apply synchronization settings.  

    -   Establish the connection using web services.  

    -   Set up synchronization folders.  

    -   Set a filter to exclude Outlook contacts from synchronizing with [!INCLUDE[navnow](includes/navnow_md.md)].  

    > [!NOTE]  
    >  After you have set up and configured Outlook synchronization, you can test your setup by performing the steps that are described in.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   Microsoft Outlook 2013 or Microsoft Outlook 2010 installed and configured for you as a user on a client machine. Outlook integration requires the 32-bit version of Outlook.  

-   Microsoft Office Outlook Integration, installed on the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   Microsoft Office Outlook Add-in, installed with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 For more information, see [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md) and [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

## Setting Up Synchronization for a Single User on a Single Computer  
 This walkthrough describes how to set up and use the Outlook add-in for a single user on a single computer. You can also set up and use the Outlook add-in for multiple users on a single computer, using tools such as Terminal Services. You should follow these steps before you use the Outlook add-in in this environment.  

1.  Ensure that Outlook is correctly installed and configured for all users who need the add-in.  

2.  Install the Outlook add-in from the [!INCLUDE[navnow](includes/navnow_md.md)] product media and make sure that the installation is for all users.  

 For best results, install [!INCLUDE[navnowlong](includes/navnowlong_md.md)] and the Outlook add-in on a machine that has not previously had [!INCLUDE[navnow](includes/navnow_md.md)] installed and then uninstalled on it.  

## Configuring Microsoft Dynamics NAV for Outlook Synchronization  
 In this walkthrough, before you set up synchronization, make sure that the correct permissions are set up.  

> [!NOTE]  
>  In a production environment, you can specify any permission set that lets you add a salesperson and modify data in the **Outlook Synch. Entities** and **Outlook Synch. User Setup** tables.  

#### To define synchronization users  

1.  Start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

2.  In the **Search** box, enter **Users**, and then choose the related link.  

3.  If you are not already listed in the **Users** window, then create a new user.  

4.  On the **User** card, in the **User Permission Sets** FastTab, specify the SUPER permission set. Choose the **OK** button.  

 Next, you add yourself as a salesperson in [!INCLUDE[navnow](includes/navnow_md.md)] so that you can assign synchronization entities to yourself and then test your setup.  

#### To add yourself as a salesperson  

1.  In the **Search** box, enter **Salespeople**, and then choose the related link.  

2.  On the **Home** tab, choose **New**, and then fill in the following fields in the **Salesperson/Purchaser** card.  

     The following table describes the fields.  

    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**\($ T\_13\_1 Code $\)**|Your initials.|  
    |**\($ T\_13\_2 Name $\)**|Your name as defined in your Outlook profile.|  
    |**\($ T\_13\_5052 E-mail $\)**|Your email address as defined in your Outlook profile.|  

## Mapping Microsoft Dynamics NAV Entities to Outlook Items  
 You start synchronization setup by identifying the [!INCLUDE[navnow](includes/navnow_md.md)] objects to synchronize. When you open the **Outlook Synch. Entities** window for the first time, you may receive a message that asks for permission to connect to a .dll file that is installed with the Outlook add-in. You should choose the option that lets you connect: Allow for this session.  
<!--
 For this walkthrough, you can use the synchronization entities that come with [!INCLUDE[navnow](includes/navnow_md.md)] by default. But you can also customize and add entities. For more information, see [How to: Set Up Outlook Synchronization Entities](How-to--Set-Up-Outlook-Synchronization-Entities.md) and [Define Synchronization with Outlook Items](Define-Synchronization-with-Outlook-Items.md).  -->

#### To set up default synchronization entities  

1.  In the **Search** box, enter **Outlook Synch. Entities**, and then choose the related link.  

2.  In the dialog box asking for permissions, choose **Allow for this session**, and then choose the **OK** button. The **Outlook Synch. Entity List** window opens.  

     The following table lists the default [!INCLUDE[navnow](includes/navnow_md.md)] entities and the Outlook item types to which they map.  

    |[!INCLUDE[navnow](includes/navnow_md.md)] entity code|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|Outlook items|  
    |--------------------------------------|---------------------------------------|-------------------|  
    |APP|To-do type: Meeting|Meetings|  
    |CONT\_COMP|Contacts: Company|Contacts|  
    |CONT\_PERS|Contacts: Person|Contacts|  
    |CONT\_SP|Contacts: Salesperson|Contacts|  
    |TASK|To-do type: Blank or Phone|Tasks|  

 After you have set up entities to synchronize with Outlook items, you assign a user to the entity that the user wants to synchronize. In the following procedure, you assign yourself as the user who is associated with the default entities.  

 When you are setting up synchronization, you can first assign a user to one or two entities and then continue with the setup to test whether your connection works.  

#### To assign synchronization entities to users  

1.  In the **Search** box, enter **Outlook Sync. User Setup**, and then choose the related link. The **Outlook Synch. User Setup** window opens.  

2.  Choose **New**. In the **Outlook Synch. User Setup** window, choose the **\($ T\_5305\_1 User ID $\)** field, and then choose your user ID.  

3.  Choose the **\($ T\_5305\_2 Synch Entity Code $\)** field, and then add synchronization entities in the following order with your user ID:  

    1.  Add **CONT\_SP**. Leave the **\($ T\_5305\_8 No. of Elements $\)** field as 0.  

    2.  Add **CONT\_PERS**. Leave the **\($ T\_5305\_8 No. of Elements $\)** field as 0.  

    3.  Add **Cont\_COMP**. Leave the **\($ T\_5305\_8 No. of Elements $\)** field as 0.  

    4.  Add **APP**.  

        1.  Choose the **\($ T\_5305\_8 No. of Elements $\)** field to open the **Outlook Synch. Setup Details** window.  

        2.  On the **Home** tab, choose **New**, choose the line under **\($ T\_5310\_4 Outlook Collection $\)**, choose **Recipients**, and then choose the **OK** button.  

        3.  Choose the **Close** button to close the **Outlook Synch. Setup Details** window.  

        4.  Choose the **\($ T\_5305\_4 Condition $\)** field, and enter information in the **Filter** window.  

             The following table describes the information that you have to enter.  

            |Column|Value|  
            |------------|-----------|  
            |**Field Name**|Salesperson Code|  
            |**\($ T\_5303\_7 Type $\)**|CONST|  
            |**\($ T\_5303\_8 Value $\)**|\<salesperson code>|  

        5.  Choose the **OK** button.  

    5.  Add **Task**.  

        1.  Choose the **\($ T\_5305\_8 No. of Elements $\)** field to open the **Outlook Synch. Setup Details** window.  

        2.  Choose **New**, choose the line under **\($ T\_5310\_4 Outlook Collection $\)**, choose **Links**, and then choose the **OK** button. Choose the **OK** button again to close the window.  

        3.  Choose the **\($ T\_5305\_4 Condition $\)** field, and enter information in the **Filter** window.  

             The following table describes the information that you have to enter.  

            |Column|Value|  
            |------------|-----------|  
            |**Field Name**|Salesperson Code|  
            |**\($ T\_5303\_7 Type $\)**|CONST|  
            |**\($ T\_5303\_8 Value $\)**|\<salesperson code>|  

4.  Choose the **OK** button. Choose the **OK** button again to close the window.  

 You must activate the change log to enable tracking of the changes that you made to the synchronization entities.  

#### To apply change log settings  

1.  In the **Outlook Synch. User Setup** window, on the **Navigate** tab, in the **Setup** group, choose **Register in Change Log Setup**. The **\($ B\_5300 Outlook Synch. Change Log Set. $\)** window opens.  

2.  Clear the filter value for **Code**. This lets you enable the change log for all entities at the same time.  

3.  Choose the **OK** button. Close and reopen the company to enable the change log settings.  

    > [!NOTE]  
    >  Run the **\($ B\_5300 Outlook Synch. Change Log Set. $\)** batch job every time that you add or change a synchronization entity to make sure that changes are collected for the required fields.  

## Setting Conditions for Entities  
 You can set conditions for the TASK and APP entities to help limit the tasks and meetings that are included on your Outlook calendar. For example, you can set a condition to retrieve only those meetings and tasks that involve you as the salesperson and that you own. Meetings and tasks must have a Meeting Organizer or Task Owner, so that you must create a condition. If you do not, then you cannot synchronize meetings with [!INCLUDE[navnow](includes/navnow_md.md)].  

#### To configure conditions  

1.  In the **Search** box, enter **Outlook Synch. User Setup**, and then choose the related link.  

2.  Select the line with the APP entity, and then choose the **Condition** field.  

3.  In the **Outlook Synch. Filters – Condition** window, in the **Field Name** field, select **Salesperson Code**. In the **\($ T\_5303\_8 Value $\)** field, enter the code for the salesperson.  

4.  Repeat these steps for the TASK entity.  

 Setting conditions for other entities is not required, but we recommend doing it to prevent mass data transfer to a local mailbox or a public folder.  

## Setting Up Web Services Connections  
 You must set up a web services connection between [!INCLUDE[navnow](includes/navnow_md.md)] and Outlook.  

 Before starting the next procedure, make sure that you have previously opened the **Outlook Sync. Entities** window. When you do this, there is preparation in the background that is needed for the web service to appear in the later steps.  

#### To set up a web services connection  

1.  On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], verify that web services are running. The web service has to run in English for locale 1033.  

2.  In the **Search** box, enter **Web Services**, and then choose the related link.  

3.  On the **Home** tab, in the **Manage** group, choose **Edit List**.  

4.  Choose the **DynamicsNAVsynchOutlook** service, and then select the **\($ T\_2000000076\_12 Published $\)** check box.  

## Configuring Synchronization in Outlook  
 You can now start Outlook. By default, the [!INCLUDE[navnow](includes/navnow_md.md)] Synchronization items are on the **Add-ins** tab.  

 The following table describes the items on the Synchronization toolbar.  

|Ribbon command|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------------|---------------------------------------|  
|**Synchronize**|Start synchronization manually. When you choose this command, synchronization applies to items that have been created or modified since the last synchronization.|  
|**Full Synchronization**|Synchronize all items.|  
|**Settings**|Configure synchronization, including automatic synchronization, conflict resolution, and connection, and set folders and filters for synchronization entities.|  
|**Troubleshooting**|Resolve synchronization issues. If the **Troubleshooting** icon is red, then you have existing errors that must be fixed.|  
|**Connection State**|Indicate the status of the connection state between Outlook and [!INCLUDE[navnow](includes/navnow_md.md)]. Choose the command to get a message that describes the status.|  

### Applying Synchronization Settings  
 You start to establish synchronization settings in the **Settings** dialog box. You can set synchronization to run automatically and set how frequently that it should run. You can also set how conflicts should be resolved between [!INCLUDE[navnow](includes/navnow_md.md)] and Outlook when changes have been made in each application at the same time.  

 Because you want to test the synchronization setup manually to make sure that it is working correctly, in this walkthrough, you do not select the automatic synchronization setting. You also do not select the automatic resolution setting.  

##### To set rules for synchronization  

1.  In Outlook, on the **Add-ins**  tab, choose **Settings**. The **Settings** dialog box opens.  

2.  On the **General** tab, select **Show synchronization progress** and **Show synchronization summary**.  

3.  Select **Resolve conflicts manually**. Choose the **Apply** button.  

### Establishing a Connection Between [!INCLUDE[navnow](includes/navnow_md.md)] and Outlook  
 On the **Connection** tab, you must select a type of connection. You must have a working connection before you can create the synchronization settings.  

 You can be either a [!INCLUDE[navnow](includes/navnow_md.md)] user or a Windows user. A NAV user requires that you supply a username and password.  

 You follow these steps to establish your web services connection on the NAV Service tier.  

> [!IMPORTANT]  
>  When you are connecting to a [!INCLUDE[nav_server](includes/nav_server_md.md)] in Azure, you must specify settings for Internet Explorer.  
>   
>  1.  Open Internet Explorer.  
> 2.  On the **Tools** menu, and then choose **Internet Options**.  
> 3.  Choose the **Connections** tab and choose the **LAN Settings** button.  
> 4.  Clear the **Automatically detect settings** check box.  

##### To establish a web services synchronization connection  

1.  In the **Settings** dialog box, choose the **Connection** tab.  

     Specify a Web service path in the **Web Service Path** text box:  

     On premises \(default\): https://localhost:7047/DynamicsNAV71/WS/Codeunit/DynamicsNAVsynchOutlook  

     -or-  

     Azure: https://\<cloud NST URL>:7047/DynamicsNAV71/WS/Codeunit/DynamicsNAVsynchOutlook  

2.  Select an authentication type:  

     On premises: Basic or Windows  

     -or-  

     Azure: Basic  

3.  Enter the NavUserPassword credentials for the user whose meetings, tasks, and contacts you are synchronizing from [!INCLUDE[navnow](includes/navnow_md.md)] to Outlook.  

4.  In the **Company Name** box, select **[!INCLUDE[demoname](includes/demoname_md.md)]**  

5.  Choose the **Apply** button.  

6.  Choose the **Test Connection** button.  

     If your connection succeeds, then you receive a confirmation message. Choose the **OK** button. The red X is cleared from the **Connection State** button in the **Add-ins** tab. If your connection does not succeed, then you receive an error message. To resolve the error, stop and start the web service again.  

### Defining Synchronization Folders  
 Each [!INCLUDE[navnow](includes/navnow_md.md)] entity must be mapped to folders that you create for synchronization in Outlook. The folders must map to the entity type. For contacts, the folder must be created in Outlook Contacts. For tasks, the folder must be created in Outlook Tasks. If you create a new entity, then you set the Outlook item that the entity maps to. You can verify what Outlook item that you have set by selecting the entity in the **Outlook Synch. Entities** window in [!INCLUDE[navnow](includes/navnow_md.md)].  

##### To set folders for synchronization entities  

1.  Create a new folder in Outlook for each entity that you have set up for synchronization. For example, create a folder named **Company Contacts**, and then set the folder to contain Contact Items. The following table lists the default entities and the type of folder to create.  

    |[!INCLUDE[navnow](includes/navnow_md.md)] entities|Outlook folder item types|  
    |-----------------------------------|-------------------------------|  
    |[!INCLUDE[navnow](includes/navnow_md.md)] Contacts of the Company type|Contacts|  
    |[!INCLUDE[navnow](includes/navnow_md.md)] Contacts of the Person type|Contacts|  
    |[!INCLUDE[navnow](includes/navnow_md.md)] Salespeople|Contacts|  
    |[!INCLUDE[navnow](includes/navnow_md.md)] Meetings|Calendar|  
    |[!INCLUDE[navnow](includes/navnow_md.md)] Tasks|Tasks|  

2.  In Outlook, in the **Settings** dialog box, choose the **Folders** tab.  

     The entities that you set for synchronization are displayed in the **Synchronization Folders** area. If you add a new entity in [!INCLUDE[navnow](includes/navnow_md.md)], then it is displayed in this list.  

3.  Choose the **Browse** button, and then map each entity to the folder that you created for it. Choose **Apply**.  

##### To specify which toolbar commands are displayed  

1.  In the **Settings** dialog box, choose the **Customize** tab.  

2.  Choose the **Full Synchronization** and **Synchronize** options. Choose the **Apply** button, and then choose the **OK** button.  

 In addition to the options you have chosen, the **Settings** command is always available on the ribbon.  

### Setting Filters  
 You set filters to define any items that you do not want to be synchronized. For example, if you have personal contacts that you do not want to be synchronized with your [!INCLUDE[navnow](includes/navnow_md.md)] contacts, then you can filter for those. In this procedure, you filter to exclude personal contacts from synchronization by excluding contacts that contain home telephone numbers.  

##### To set a filter  

1.  In the **Settings** dialog box, on the **Filters** tab, on the **Microsoft Dynamics NAV Contacts of the Person type** line, choose the **Edit** button.  

2.  In the **Field Name** box, select **HomeTelephoneNumber**.  

3.  In the **Condition** box, select **is not empty**, and then choose **Add to List**.  

4.  Choose the **Apply** button, and then choose the **OK** button.  

5.  On the **Microsoft Dynamics NAV Synchronization** toolbar, choose the **Synchronize** button.  

     The **Synchronization Progress** message is displayed. When synchronization is complete, you can view the details for the synchronization.  
<!--
## Next Steps  
 You have completed the required setup for synchronizing information between [!INCLUDE[navnow](includes/navnow_md.md)] and Outlook. To test your setup, see [Walkthrough: Synchronizing Information Between Outlook and Microsoft Dynamics NAV](Walkthrough--Synchronizing-Information-Between-Outlook-and-Microsoft-Dynamics-NAV.md).  -->

## See Also  
 [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Troubleshooting: Microsoft Office Outlook Integration and Synchronization](Troubleshooting--Microsoft-Office-Outlook-Integration-and-Synchronization.md)
