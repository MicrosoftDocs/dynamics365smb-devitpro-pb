---
title: Web service security
description: Get the list of recommendations for how to secure web services in your Business Central solution.
author: kennieNP
ms.custom: bap-template
ms.date: 02/02/2024
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: kepontop
---

# Web service security

Security is an important part of a solution involving web services, both because the client calling the web service endpoint is likely not delivered by Microsoft and also because the interaction between the client and [!INCLUDE[prod_short](../includes/prod_short.md)] happens over a network.

This article provides recommendations that you can implement to make your web services applications secure.

For more general information about security in [!INCLUDE[prod_short](../includes/prod_short.md)], see  [Security overview](../security/security-and-protection.md).


|To|See|  
|--------------------|-------------|  
| Learn about authenticating web services in [!INCLUDE[prod_short](../includes/prod_short.md)]. | [Authentication](web-services-authentication.md) |
| Use OAuth, the open standard for authorizing access to web services in [!INCLUDE[prod_short](../includes/prod_short.md)] online. | [Authentication with OAuth](authenticate-web-services-using-oauth.md) |
| Learn how to use OAuth by example. | [Walkthrough: Creating a console application that uses OAuth](walkthrough-authenticate-web-services-using-oauth.md) |
| Use Service-to-Service (S2S) authentication for scenarios where integrations are required to run without any user interaction. | [Service-to-service authentication](../administration/automation-apis-using-s2s-authentication.md) |
| Use an HTTPS certificate to connect to an external API from AL Httpclient. | [Supported cipher suites in outgoing calls](../developer/devenv-supported-cipher-suites.md) |
| Use Azure security service tags to restrict network access from/to [!INCLUDE[prod_short](../includes/prod_short.md)] online | [How to restrict network access from/to Business Central online](../security/security-service-tags.md) |
| Learn how to use security certificates to help secure connections with [!INCLUDE[prod_short](../includes/prod_short.md)] (on-premises). | [Securing remote connections using certificates (on-premises)](../deployment/implement-security-certificates-production-environment.md) |




## See also

[Security overview](../security/security-and-protection.md)  
[Web Services Overview](web-services.md)  
