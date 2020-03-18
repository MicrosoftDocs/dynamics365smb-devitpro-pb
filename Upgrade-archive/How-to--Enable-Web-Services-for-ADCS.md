---
title: "How to: Enable Web Services for ADCS"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
<!-- This topic is redirected -->

# Enabling Web Services for ADCS

[!INCLUDE[2020_releasewave1_deprecated](../includes/2020_releasewave1_deprecated.md)]

To use Automated Data Capture System, you must enable the ADCS web service.  

### To enable and publish the ADCS web service  

1.  Start the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].  

2.  In the **Search** box, enter **Web Services**, and then choose the related link.  

3.  On the **Home** tab, choose **New**.  

4.  In the **Web Services** window, enter the following information on a new line:  

    |[!INCLUDE[bp_tablefield](../developer/includes/bp_tablefield_md.md)]|Value|  
    |---------------------------------|-----------|  
    |**Object Type**|Codeunit|  
    |**Object ID**|7714|  
    |**Service Name**|ADCS **Important:**  It is required that you name the service **ADCS**.|  

5.  Select the **Published** check box.  

6.  Choose the **OK** button.  

### To verify that the web service has been published  

1.  In a web browser window, enter a URL in the following format:  **https://\<web services path>/Services**. The following example demonstrates the results.  

    ```  
    https://localhost:7047/<server instance>/WS/Services  
    ```  

     You see the following XML information if the ADCS web service is published.  

    ```  
    <contractRef xmlns="https://schemas.xmlsoap.org/disco/scl/" ref="https://localhost:7047/<server instance>/WS/Codeunit/ADCS"/>  
    ```  

2.  To verify that the codeunit is performing as expected, enter a URL in the following format: **https://\<web services path>/Codeunit/\<Service Name>**.  

    ```  
    https://localhost:7047/<server instance>/WS/Codeunit/ADCS  
    ```  

     Information about the ADCS web service is displayed.  

## See Also  
 [SOAP Web Services](SOAP-Web-Services.md)
