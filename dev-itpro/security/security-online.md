---
title: "Security in Business Central"
description: "Learn about the main aspects of security in your online deployment of Dynamics 365 Business Central."
author: jswymer

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.date: 04/01/2021
---

# Business Central Security 
<!--note from editor: Please see editor's note in security-application.md-->
This section helps you understand and improve the security of your Dynamics 365 Business Central tenant. In the links below you'll find information, guidance, and recommended practices related to authentication, data encryption, and safely integrating with other services. You'll also find information on Business Central certifications and regulatory compliance.<!--note from editor: Via MWSG, no possessive with product names.-->


## Authentication
 
Business Central uses Azure Active Directory (Azure AD) as the authentication method, which is automatically set up and managed for you.

## Data isolation and encryption

Data belonging to a single tenant is stored in an isolated database and is never mixed with data from other tenants. This ensures complete isolation of data in day-to-day use and in backup/restore scenarios.
Furthermore, Business Central uses encryption to help protect tenant data in the following ways:

- Data at rest is encrypted by using Transparent Data Encryption (TDE) and backup encryption.
- Data backups are always encrypted.
- All network traffic inside the service is encrypted by using industry-standard encryption protocols.

## Service integration

We recommend that you use encrypted network protocols to connect to the Power BI server and Business Central web services. For more information, see the following articles:

[Connect to Business Central with Power BI](/power-bi/service-connect-to-microsoft-dynamics-nav) 

[Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md) 

## See Also  

[Microsoft Trust Center (what we do to make the service secure)](https://www.microsoft.com/trustcenter/security/default.aspx)  
[Microsoft Dynamics 365 Cloud Services Compliance](https://aka.ms/d365-compliance-list)  
[Security and Protection](security-and-protection.md)  
[Security Tips for Business Users](security-users.md)  
