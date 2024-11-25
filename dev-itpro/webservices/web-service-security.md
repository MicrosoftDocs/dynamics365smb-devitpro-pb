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

Security is an important part of a solution involving web services. This is because the client calling the web service endpoint is likely not delivered by Microsoft and also because the interaction between the client and [!INCLUDE[prod_short](../includes/prod_short.md)] happens over a network.

This article provides recommendations that you can implement to make your web services applications secure.

For more general information about security in [!INCLUDE[prod_short](../includes/prod_short.md)], see  [Security overview](../security/security-and-protection.md).

## Web service authentication options

Here are some authentication options you can use:

- [Authentication](web-services-authentication.md): Learn about the basic authentication methods for web services in [!INCLUDE[prod_short](../includes/prod_short.md)].
- [Authentication with OAuth](authenticate-web-services-using-oauth.md): Use OAuth, an open standard that lets you authorize access to web services in [!INCLUDE[prod_short](../includes/prod_short.md)] online.
- [Walkthrough: Creating a console application that uses OAuth](walkthrough-authenticate-web-services-using-oauth.md): See an example of how to use OAuth in a console application.
- [Service-to-service authentication](../administration/automation-apis-using-s2s-authentication.md): Use this method for scenarios where integrations need to run without any user interaction.
- [Supported cipher suites in outgoing calls](../developer/devenv-supported-cipher-suites.md): Use an HTTPS certificate to connect to an external API from AL Httpclient.
- [How to restrict network access from/to Business Central online](../security/security-service-tags.md): Use Azure security service tags to limit network access to and from [!INCLUDE[prod_short](../includes/prod_short.md)] online.
- [Securing remote connections using certificates (on-premises)](../deployment/implement-security-certificates-production-environment.md): Learn how to use security certificates to help secure connections with [!INCLUDE[prod_short](../includes/prod_short.md)] (on-premises).

## Related information

- [Security overview](../security/security-and-protection.md)  
- [Web Services Overview](web-services.md)  
