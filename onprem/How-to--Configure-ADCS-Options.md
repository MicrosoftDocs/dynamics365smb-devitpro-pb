---
title: Configure ADCS Options
description: Modify Dynamics NAV VT100Plugin configuration file to work with Automated Data Capture Systems (ADCS) which should be performed by a system administrator.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8e1e399e-a538-4438-bca4-06c5b7090e38
caps.latest.revision: 24
---
# How to Configure ADCS Options in Dynamics NAV
Before you can work with Automated Data Capture Systems \(ADCS\), you have to configure [!INCLUDE[navnow](includes/navnow_md.md)] by modifying the VT100Plugin configuration file.  
  
> [!IMPORTANT]  
>  Modification of the configuration file should only be performed by a system administrator.  
  
### To modify and update the ADCS configuration file for the terminal listener  
  
1.  Locate and open the NavisionVT100Plugin.exe.config configuration file. It is typically located in the following location: [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\Automated Data Capture System.  
  
     The following example shows the XML that is contained in the configuration file by default.  
  
    ```  
    <configuration>  
    <configSections>  
    <section name="VT100" type="Microsoft.Dynamics.Nav.Adcs.Configuration.VT100ConfigurationSection, Microsoft.Dynamics.Nav.VT100Plugin" />  
    </configSections>  
    <VT100>  
    <Warehouse>  
    <!-- Endpoint attributes are described in the table in step 3. -->  
    </Warehouse>  
    <Terminal />   
    <!-- Terminal attributes are described in the table in step 2. -->  
    </VT100>  
    </configuration>  
  
    ```  
  
2.  For the **Terminal** element, update the attributes in the configuration file using attributes as described in the following table. You specify the attribute values in quotation marks.  
  
    |Attribute|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*listenIP*|Required. IP address that specifies where to listen for terminal connections.|  
    |*listenPort*|Required. Positive integer that specifies the port number to listen for terminal connections.|  
    |*stylesheet*|Required. Path to transformation style sheet, which transforms warehouse functions to terminal keycodes. Two style sheets are provided with the ADCS installation.|  
    |*screenLines*|Optional. Positive integer that specifies the number of screen lines. The default is 5.|  
    |*screenWidth*|Optional. Positive integer that specifies the screen width. The default is 30.|  
    |*codePage*|Optional. Positive integer that specifies the codepage. The default is the system codepage defined in HKey\_Local\_Machine\\SYSTEM\\CurrentControlSet\\Control\\Nls\\CodePage\\ACP.|  
    |*terminalTimeout*|Optional. Positive integer that specifies the terminal time-out in milliseconds. The default is 65000 and cannot be fewer than 6000.|  
    |*debugDirectory*|Optional. Output directory for debug data.|  
  
3.  For the **Endpoints** element, update the attributes in the configuration file and modify an endpoint to support your processes. You can also add more endpoints. The following table provides some options.  
  
    |Attribute|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*defaultType*|Optional. *defaultType* is an attribute of the **Endpoints** element. It specifies what type of endpoint to use when no type is specified, if you want to customize it. The default is the **NavEndpoint** type.|  
    |*name*|Required. Endpoint name. The name must be unique.|  
    |*url*|Required. Endpoint URL address. **Note:**  This attribute does not have to be included if the *clientEndpointName* attribute is specified.|  
    |*type*|Optional. Fully qualified name of a non-default endpoint.|  
    |*clientEndpointName*|Optional. Windows Communications Foundation client endpoint configuration name. If specified, a WCF configuration with the specified name must exist. For more information, see [Client Configuration](https://go.microsoft.com/fwlink/?LinkId=260871) in the MSDN Library.|  
  
 The following example describes the XML for a **Terminal** element and the **Endpoints** element. It adds one endpoint for [!INCLUDE[navnow](includes/navnow_md.md)].  
  
```  
<configuration>  
<configSections>  
<section name="VT100" type="Microsoft.Dynamics.Nav.Adcs.Configuration.VT100ConfigurationSection, NavisionVT100Plugin" />  
</configSections>  
<VT100>  
<Warehouse>  
<Endpoints>  
<add name="NavEndpoint" url="https://[local]:7047/nav_server_instance/WS/CRONUS%20International%20Ltd/Codeunit/ADCS" />  
</Endpoints>  
</Warehouse>  
<Terminal listenIP="127.0.0.1" listenPort="6666" stylesheet="VT100_W2k_and_OtherClients.xsl" />  
</VT100>  
</configuration>  
  
```  
  
## .NET Framework Security  
 By default, the **NavEndpoint** uses the security settings that you have specified for web services generally. You can configure additional security by changing the configuration of [!INCLUDE[nav_server](includes/nav_server_md.md)] and matching that configuration in the VT100Plugin configuration service.  
  
 For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
## See Also  
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [How to: Enable Web Services for ADCS](How-to--Enable-Web-Services-for-ADCS.md)
