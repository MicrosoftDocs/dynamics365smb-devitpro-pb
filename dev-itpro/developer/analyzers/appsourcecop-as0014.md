---
title: "AppSourceCop Error AS0014"
description: "The project manifest must contain the allocated identifier range."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0014
The project manifest must contain the allocated identifier range

## Description
The project manifest must contain the allocated identifier range.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when the project manifest (app.json) doesn't include the allocated identifier range for your extension. The identifier range is a set of unique IDs assigned to your extension to avoid conflicts with other extensions.

## How to fix this diagnostic?

To resolve this error, you must add the allocated identifier range to your project manifest (app.json). Here are the steps:

1. Obtain the identifier range from Microsoft, if you don't already have one.
2. Open the app.json file in your project.
3. In the `idRanges` property, specify the allocated identifier range.


## Example

If your allocated identifier range is from 50000 to 59999, your app.json file should look like this:

```json
{
    "id": "your-app-id",
    "name": "Your App Name",
    "publisher": "Your Publisher Name",
    "version": "1.0.0.0",
    "idRanges": [
        {
            "from": 50000,
            "to": 59999
        }
    ],
    // Other properties
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  