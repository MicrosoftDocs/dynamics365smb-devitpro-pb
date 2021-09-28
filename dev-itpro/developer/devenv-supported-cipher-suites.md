---
title: "Supported Cipher Suites"
description: "Lists the cipher suites that are supported for external APIs called from Business Central"
ms.custom: na
ms.date: 05/19/2021
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
ms.author: jswymer
---

# Supported Cipher Suites

This article lists the cipher suites that are supported on external APIs that are called from [!INCLUDE[prod_short](includes/prod_short.md)] online.

## Overview

For [!INCLUDE[prod_short](includes/prod_short.md)] to connect to an external API, the API's web site must use an HTTPS certificate. In [!INCLUDE[prod_short](includes/prod_short.md)], the certificate must be added to [HttpClient](methods-auto/httpclient/httpclient-data-type.md) instance that will send HTTP requests to and receive HTTP responses from external API. The certificate must use one of supported cipher suites; otherwise, the outgoing web service call will fail with security exception.

A cipher suite is used to help secure web service calls made from the [!INCLUDE[prod_short](includes/prod_short.md)] app to an external URL. A cipher suite is a set of algorithms, which typically include:  key exchange, authentication, encryption, and message authentication code (MAC).

## Supported cipher suites

|Suite|Protocol|Key exchange algorithm|Authentication algorithm|Encryption algorithm (*cipher*\_*keysize*\_*type*)|MAC algorithm (Hash)|
|----|--------|----------------------|------------------------------------|----------|----|
|TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384|TLS|ECDHE|ECDSA|AES_256_GCM|SHA384|
|TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256|TLS|ECDHE|ECDSA|AES_128_GCM|SHA256|
|TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384|TLS|ECDHE|RSA|AES_256_GCM|SHA384|
|TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256|TLS|ECDHE|RSA|AES_128_GCM|SHA256|
|TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384|TLS|ECDHE|ECDSA|AES_256_CBC|SHA384|
|TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256|TLS|ECDHE|ECDSA|AES_128_CBC|SHA256|
|TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384|TLS|ECDHE|RSA|AES_256_CBC|SHA384|
|TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256|TLS|ECDHE|RSA|AES_128_CBC|SHA256|

## See Also

[HttpClient Data Type](methods-auto/httpclient/httpclient-data-type.md)  
[Programming in AL](devenv-programming-in-al.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[AL Essential Methods](devenv-essential-al-methods.md)  
