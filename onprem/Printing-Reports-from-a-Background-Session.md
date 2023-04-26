---
title: "Printing Reports from a Background Session"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2ca013c1-f142-4679-8c09-876841c83029
caps.latest.revision: 10
---
# Printing Reports from a Background Session
If you print a report from a background session that you started by using the [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md), or if you print a report from a NAS services session, then you must know which printer prints the report.  
  
## Printer Selection Rules  
 If the [UseSystemPrinter Property](UseSystemPrinter-Property.md) for the report that you want to print is **true**, then the rules in the following table apply, regardless of what is set on the **Printer Selections** page.  
  
|A default printer is set on the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|Result|  
|-----------------------------------------------------------------------------------------------------------|------------|  
|Yes|Report is printed on the default printer.|  
|No|You receive an error in the event log on the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|  
  
 If the **UseSystemPrinter** property for the report that you want to print is **false**, then the printer on which the report is printed depends on what is set on the **Printer Selections** page. The rules in the following table apply.  
  
|Report ID condition|User ID in the **Printer Selections** page entry matches the User ID that started the background session|User ID in the Printer Selections page entry matches the account under which the NAS services session is running|User ID in the **Printer Selections** page entry is blank|User ID in the **Printer Selections** page entry does not match the User ID that started the background session|  
|-------------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|  
|**Report ID in the Printer Selections page entry matches the report ID that you run from the background session**|Report is printed on the printer that is specified in the **Printer Selections** page entry.|Report is printed on the printer that is specified in the **Printer Selections** page entry.|Report is printed on the printer that is specified in the **Printer Selections** page entry.|Report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|  
|**Report ID in the Printer Selections page entry is blank**|Report is printed on the printer that is specified in the **Printer Selections** page entry.|Report is printed on the printer that is specified in the **Printer Selections** page entry.|Report is printed on the printer that is specified in the **Printer Selections** page entry.|Report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|  
|**Report ID in the Printer Selections page entry does not match the report ID that you run from the background session**|Report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|Report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|Report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|Report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.|  
  
 Be aware of the following:  
  
-   If the printer that is specified on the **Printer Selections** page is not installed on the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed, then you receive an error in the event log on the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.  
  
-   If the selected printer is a not an actual printer but a driver, such as the Microsoft XPS Document Writer or One Note, then the report is not printed and the background session is blocked.  
  
-   If the selected printer displays a dialog box, such as a request for credentials or a warning about low printer ink, then the report is not printed and the background session is blocked.  
  
-   The user account must have access to print to the specified printer. By default, [!INCLUDE[nav_server](includes/nav_server_md.md)] instances run under the Network Service account, which does not have access to print to network printers or most local printers. If the user account does not have access to print to the specified printer, then one of the following occurs:  
  
    -   If there is a default printer installed for the user account, then the user account attempts to print to that default printer.  
  
    -   If there is not a default printer installed for the user account, then you receive an error in the event log on the server on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed and the background session exits.  
  
-   If the report should be printed on the printer that is specified in the **Printer Selections** page entry but the **Printer Name** field is blank for the entry, then the report is printed to the default printer of the computer on which the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is installed.  
  
## See Also  
 [How to: Specify Printer Selection for Reports](How-to--Specify-Printer-Selection-for-Reports.md)   
 [Printing Reports](Printing-Reports.md)   
 [Configuring NAS Services](Configuring-NAS-Services.md)   
 [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md)
