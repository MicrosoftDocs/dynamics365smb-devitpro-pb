---
title: "Control Add-In Performance Best Practices"
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Control Add-In Performance Best Practices

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

When developing control add-ins it's important to provide the best possible experience, as well as performance so that users can maintain their productivity without interruption. With version 20.0 of [!INCLUDE[prod_short](../includes/prod_short.md)] the client, if it detects a slow, or unhealthy control add-in, will present the user with a warning equivalent to the following.

:::image type="content" source="media/controladdin-resiliency.png" alt-text="Busy control add-in detected.":::

The dialog can be closed by the user, but will appear again if the control add-in continues to run slowly. To ensure that the client is responsive and fast, the non-responsive or non-performant control add-in will result in continuous warnings, and if the problem persists the control add-in communication is throttled depending on the volume of communication with the [!INCLUDE[prod_short](../includes/prod_short.md)] service​. If the volume of requests to [!INCLUDE[prod_short](../includes/prod_short.md)] does not decrease, the service actively rejects incoming calls, resulting in some or all of the control add-in not functioning.

## Code examples

### Bad code example

The following example illustrates code that is problematic and might cause performance issues because the trigger is invoked no matter if the previous calls are completed.

```javascript
function invokeALTriggerTheWrongWay() {
    // Invoke the trigger every 10 seconds, ignoring 
    // whether the previous call has completed
    window.setTimeout(() => {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
            "MyTrigger",
            arguments,
            false);

        invokeALTriggerTheWrongWay();
    }, 
    10000);
}
```

### Good code example

The following example illustrates the right implementation where the trigger is invoked only when the previous call is completed.

```javascript
function invokeALTriggerTheRightWay() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
        "MyTrigger",
        arguments,
        false,
        () => {
            // Invoking the AL trigger has completed, invoke
            // the AL trigger again in 10 seconds
            window.setTimeout(() => {
                invokeALTriggerTheRightWay();
            },
            10000);
        },
        () => { /* error handling and perhaps retrying */ });
}
```

## See also

[Control Add-In Resiliency](/dynamics365/business-central/across-controladdin-resiliency) <!-- link to app doc -->  
[InvokeExtensibilityMethod Method](methods/devenv-invokeextensibility-method.md)  
[GetEnvironment Method](methods/devenv-getenvironment-method.md)
