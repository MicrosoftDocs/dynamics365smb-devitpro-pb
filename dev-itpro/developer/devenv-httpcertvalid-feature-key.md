---
title: HttpServerCertificateValidation feature key
description: Learn about the HttpServerCertificateValidation feature key.
ms.date: 03/10/2025
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# HttpServerCertificateValidation feature key

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

The `HttpServerCertificateValidation` feature key is used to control the server certificate validation for HTTP requests in [!INCLUDE[prod_short](includes/prod_short.md)]. The feature key enabled by default, which means that validation is enabled. As you update your AL code, you can disable validation by using the feature key to ensure not to break customers. Learn more about enabling features in [Enabling upcoming features ahead of time](/dynamics365/business-central/dev-itpro/administration/feature-management).

The `HttpServerCertificateValidation` feature key will be removed in [!INCLUDE [prod_short](includes/prod_short.md)] version 27.0, when the server certificate validation will be enforced. At that point, the only way to disable it is through the [UseServerCertificateValidation](properties/devenv-useservercertificatevalidation-property.md) property.

Learn more in [Analyzing server certificate validation errors with telemetry](../administration/telemetry-webservices-outgoing-certificate-validation-errors.md)

## Related information

[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[UseServerCertificateValidation](properties/devenv-useservercertificatevalidation-property.md)  
[Enabling upcoming features ahead of time](/dynamics365/business-central/dev-itpro/administration/feature-management)  
