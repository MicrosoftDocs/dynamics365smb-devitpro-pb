---
title: Introduce UI support for masking sensitive data feature key
description: Learn about the MaskType feature key.
ms.date: 09/01/2025
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Introduce UI support for masking sensitive data feature key

[!INCLUDE [2025-releasewave2-later](../includes/2025-releasewave2-later.md)]

The `Introduce UI support for masking sensitive data` feature key in **Feature Management** is used to control the masking of sensitive data in [!INCLUDE[prod_short](includes/prod_short.md)]. The feature key is disabled by default in version 27, which means that masking sensitive data is disabled and must be switched on to enable masking, which is done using the `MaskType` property in AL code. From version 29, this feature will be enabled by default.

To enable masking sensitive data, you must use the `MaskType` property in AL code. Learn more in [MaskType property](/properties/devenv-masktype-property.md).

## Related information

[Enabling upcoming features ahead of time](/dynamics365/business-central/dev-itpro/administration/feature-management)  
[MaskType property](/properties/devenv-masktype-property.md)  