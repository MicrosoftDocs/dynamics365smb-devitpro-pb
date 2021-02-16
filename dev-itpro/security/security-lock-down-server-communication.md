---
title: "Locking Down Server Communication"
description: List the server configuration settings that you can use to help secure and limit communication with clients and the database.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Locking Down Server Communication

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance includes several configuration settings that you can use to help secure and limit communication with clients and the database. The configuration settings are listed below. For more detailed information about each setting, and additional settings, see [Configuring Business Central Server](../administration/configure-server-instance.md).

|Setting|
|-------|
|ServicesCertificateValidationEnabled​|
|ServicesUseNTLMAuthentication​|
|EnableSqlConnectionEncryption​|
|ODataServicesSSLEnabled​|
|ClientServicesProtection|
|ReportAppDomainIsolation​|
|ClientServicesMaxUploadSize​|
|ClientServicesProhibitedFileTypes|
|EnableDataExportImport​|
|EnableALServerFileAccess​|
|DebuggingAllowed​|
|EnableDebugging|


<!--
|Setting|Recommended value|Why|
|-------|-----------------|---|
|ServicesCertificateValidationEnabled​|true|Validates security certificates.|
|ServicesUseNTLMAuthentication​|true|Uses SPNEGO for SOAPServices or Windows for ODataServices|
|EnableSqlConnectionEncryption​|true|Configures the server to request encryption on the SQL Connections used against the database.|
|ODataServicesSSLEnabled​|false||
|SOAPServicesSSLEnabled​|false||
|ClientServicesProtection|EncryptAndSign|Protects the data stream between clients and [!INCLUDE[server](../developer/includes/server.md)] instance. For background information, see [Understanding Protection Level](/dotnet/framework/wcf/understanding-protection-level)|
|ReportAppDomainIsolation​|||
|ClientServicesMaxUploadSize​|30MB|Helps to avoid out-of-memory errors.|
|RestrictedFileTypes​ (ClientServicesProhibitedFileTypes)||Prevents specific file types from uploaded to the database from the client. |
|EnableDataExportImport​|||
|EnableALServerFileAccess​|true|Specifies whether access to server files by C/AL file data type functions is allowed.|
|DebuggingAllowed​|true|Specifies whether AL debugging is allowed for this [!INCLUDE[server](../developer/includes/server.md)] instance.|
|EnableDebugging|false| With the EnableDebugging flag set to true the Microsoft Dynamics NAV Server will start with debugging mode enabled.  This mode has three main functions:1)Upon first connection by a RoleTailored Client all C# for that application will be generated. 2) C# files will be persisted between server restarts. 3)  Application Objects will be compiled with debug information.|

-->

## See Also  

[Security and Protection](security-and-protection.md)  
[Data Security](data-security.md)  
