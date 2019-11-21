---
title: "How to: Test the ADCS Connection"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1791c245-d4bf-4f22-9eb8-8726ee4df6c2
caps.latest.revision: 14
---
# How to: Test the ADCS Connection
The following procedure demonstrates how to use Windows Services and Telnet to test your Automated Data Capture System connection. Before you can begin, you must install the ADCS component as part of a customized installation of [!INCLUDE[navnow](includes/navnow_md.md)]. For more information, see [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md).  

### To configure and start the Microsoft Dynamics NAV VT100 Plugin service  

1.  From the Windows **Start** menu, in the **Start Search** box, enter **services.msc**, and then press the Enter key. The **Services** window opens.  

2.  Right-click the [!INCLUDE[navnow](includes/navnow_md.md)] VT100Plugin service, and then choose **Properties**.  

3.  To specify the user account that the service can use to log on, choose the **Log On** tab.  

     To specify an account, choose **This account**, choose **Browse**, and then specify a user account in the **Select User** dialog box. When you are finished, choose the **OK** button. The format is as follows:  

     *\<Domain>\\\<Windows User ID>*  

    > [!NOTE]  
    >  To complete testing, you must also add the same user to [!INCLUDE[navnow](includes/navnow_md.md)], with an appropriate permission set. For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  

4.  Type the password for the user account in **Password** and in **Confirm password**, and then choose the **OK** button.  

5.  On the **General** tab, choose **Start**.  

### To verify that the service is running  

1.  Start the Windows **Event Viewer**. From the Windows **Start** menu, in the **Start Search** box, enter **eventvwr.msc**, and then press the Enter key.  

2.  In the **Windows Logs** console tree, choose **Application**, and then locate event information for the [!INCLUDE[navnow](includes/navnow_md.md)] VT100 Plugin.  

## Testing Your Connection  
 In the following procedure, you will open a terminal connection and use HyperTerminal to simulate using handheld devices. HyperTerminal is a program that you can use to connect to other computers, Telnet sites, bulletin board systems \(BBSs\), online services, and host computers. HyperTerminal connections are made using a modem, a null modem cable \(used to emulate modem communication\), or an Ethernet connection.  

> [!NOTE]  
>  HyperTerminal is no longer included with Windows. You can usually find a free downloadable version on the Internet. For more information, see [What-happened-to-HyperTerminal](https://go.microsoft.com/fwlink/?LinkId=222571). Alternatively, in Windows 7, you can turn on the Telnet Client feature. For more information, see [Install Telnet Client](https://go.microsoft.com/fwlink/?LinkId=248471).  

#### To test your ADCS connection  

1.  Start your HyperTerminal application.  

2.  Enter a name for the connection. Choose the **OK** button.  

3.  In the **Connect Using** list, select **TCP/IP \(Winsock\)**.  

4.  The following table describes the details of a local installation on one machine.  

    |Detail|Description|Example|  
    |------------|-----------------|-------------|  
    |**Host Address**|IP address of the machine that is running the VT100 Plug-in service.|localhost|  
    |**Port Number**|Port number that the VT100 Plug-in is listening on.|6666|  

     Choose the **OK** button. The HyperTerminal window opens.  

5.  Enter a user ID and password. Choose the **OK** button.  

6.  Select a warehouse activity option. For example, enter **1** in the **Choose** field if you want to simulate working with pick documents.  

     You can review the data about warehouse picks in [!INCLUDE[navnow](includes/navnow_md.md)]. For example, you can use the data in the [!INCLUDE[demolong](includes/demolong_md.md)] to send information from and to [!INCLUDE[navnow](includes/navnow_md.md)].  

    > [!NOTE]  
    >  To see the interaction between [!INCLUDE[navnow](includes/navnow_md.md)] and ADCS, in [!INCLUDE[demoname](includes/demoname_md.md)], you can use warehouse activities that are located in the White warehouse. It is preconfigured to use ADCS.  

## See Also  
 [Configuring Automated Data Capture System](Configuring-Automated-Data-Capture-System.md)
