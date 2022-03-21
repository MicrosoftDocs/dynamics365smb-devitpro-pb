---
title: "Control Add-In Best Practices"
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Control Add-In Best Practices

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

When developing control add-ins it's important to provide the best possible experience, as well as performance so that users can maintain their productivity without disruption. With the newest version of [!INCLUDE[prod_short](../includes/prod_short.md)] the client, if it detects a slow, or bad performant control add-in, will present the user with a dialog equivalent to this:

:::image type="content" source="media/controladdin-resiliency.png" alt-text="Busy control add-in detected.":::

The dialog can be closed by the user, but will appear again if the control add-in continues to run slowly. To ensure that the client is responsive and fast, the non-responsive or non-performant control add-in will result in continuous warnings, and if the problem persists the control add-in communication is throttled depending on the volume of communication with the [!INCLUDE[prod_short](../includes/prod_short.md)] service​.


## Code examples

## See also

[Control Add-In Resiliency](/dynamics365/business-central/across-controladdin-resiliency) <!-- link to app doc -->  
[InvokeExtensibilityMethod Method](methods/devenv-invokeextensibility-method.md)  
[GetEnvironment Method](methods/devenv-getenvironment-method.md)
