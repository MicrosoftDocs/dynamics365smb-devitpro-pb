---
title: "How to: Set Up a Local Language for the ADCS Web Service"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Set Up a Local Language for the ADCS Web Service

[!INCLUDE[2020_releasewave1_deprecated](../includes/2020_releasewave1_deprecated.md)]

To have messages, including errors, display in the language of the user, you have to modify the ADCS web service codeunit to account for the language setting.  
  
### To specify the local language of ADCS messages  
  
1.  Start the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and on the **Tools** menu, choose **Object Designer**.  
  
2.  Choose **CodeUnit**, and from the list, select codeunit 7714. Choose the **Design** button. The AL Editor opens.  
  
3.  In the **ProcessDocument** method, add a line of code as highlighted in the following code. The following example demonstrates setting the language code for German.  
  
    ```  
  
              GLOBALLANGUAGE(1031);  
    InputXmlDocument := InputXmlDocument.XmlDocument;  
    InputXmlDocument.LoadXml(Document);  
    ADCSManagement.ProcessDocument(InputXmlDocument);  
    ADCSManagement.GetOutboundDocument(OutputXmlDocument);   
    Document := OutputXmlDocument.OuterXml;  
    ```  
  
## See Also  
 [Configuring Automated Data Capture System](/dynamics-nav/Configuring-Automated-Data-Capture-System)