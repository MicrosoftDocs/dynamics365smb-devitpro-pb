---
title: "How to: View the Dynamics 365 for Sales Connection Status"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# How to: View the Dynamics 365 for Sales Connection Status
When [!INCLUDE[navnow_md](includes/navnow_md.md)] is set up to integrate with [!INCLUDE[crm_md](includes/crm_md.md)], you can view the status of the connection to [!INCLUDE[crm_md](includes/crm_md.md)] to determine whether the connection is working properly, has failed, or is disabled. This can be helpful when troubleshooting problems. If a connection has failed, you can view the errors that caused the connection failure and access the connection setup to try to fix the problem.  

 You can view the status of the [!INCLUDE[crm_md](includes/crm_md.md)] connection from the **Service Connections** window, **Microsoft Dynamics 365 for Sales  Connection Setup** window, or on the **IT Manager** Role Center.  

### To view the connection status from the Service Connections window  

1.  In the **Search** box, enter **Service Connections**, and then choose the related link.  

     The [!INCLUDE[crm_md](includes/crm_md.md)] connection entry is indicated by **Microsoft Dynamics 365 for Sales  Connection Setup** in the **Description** field.  

2.  To view or change the [!INCLUDE[crm_md](includes/crm_md.md)] connection setup, choose the **Description** field.  

### To view the connection status from the Microsoft Dynamics 365 for Sales  Connection Setup window  

1.  In the **Search** box, enter **Microsoft Dynamics 365 for Sales  Connection Setup**, and then choose the related link.  

2.  On the **Home** tab, in the **Process** group, choose **Connection Status**.  

### To view the connection status from the IT Manager Role Center  

1.  Open the IT Manager Role Center.  

2.  The [!INCLUDE[crm_md](includes/crm_md.md)] connection status is available in the **Service Connection Status** part.  

     If this part is not displayed, do the following:  

    1.  On the **Application** menu ![Dynamics NAV Application menu.](media/ApplicationMenuIcon.png), select **Customize**, and then **Customize this Page**.  

    2.  In the **Customize the Role Center** window, in the **Available parts** field, select **Service Connection Status**, and then choose **Add**.  

    3.  Use the **Move Up**, **Move Down**, **Move Left**, and **Move Right** buttons to position the part on your Role Center.  

    4.  Choose the **OK** button.  

3.  In the **Service Connection Status** part, a connection that is working properly has the status **Connected**. A connection that is not working properly has the status **Failed**. A connection that is not enabled has the status **Disabled**.  

     As long as you are on the Role Center, the connection status is automatically tested every five minutes. However, the **Status** column does not update automatically. Therefore, you should choose **Refresh** occasionally to update it. The connection testing stops when you leave the Role Center, and starts again when you return to the Role Center.  

     You can perform the following operations from the **Service Connection Status** part:  

    -   To run a test of the connection immediately, choose **Refresh**.  

    -   To view or change the settings of the connection to fix a failed connection, choose **Microsoft Dynamics 365 for Sales  Connection Setup*.*  

    -   To view the error that caused a connection failure, choose **Dynamics 365 for Sales Connection Failures.**  

         The **365 for Sales Connection Failures** window appears, which shows a log of connection failures. Use the **Last Occurrence** column to identify the cause of the current connection failure.  

## See Also  
 [Integrating Dynamics 365 for Sales in Dynamics NAV](Integrating-Dynamics-CRM-in-Dynamics-NAV.md)   
 [How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)
