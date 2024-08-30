---
title: "AppSourceCop Error AS0059"
description: "Application database tables and reserved application tables should be used only as temporary tables in a multi-tenant environment."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0059
Reserved database tables are read-only in a multi-tenant environment

## Description
Application database tables and reserved application tables should be used only as temporary tables in a multi-tenant environment. Writing to these tables can lead to runtime errors or unexpected behavior.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to write to reserved database tables in a multi-tenant environment. In such environments, application database tables and reserved application tables should only be used as temporary tables. Writing to these tables can lead to runtime errors or unexpected behavior.

## How to fix this diagnostic?

To resolve this error, you need to ensure that reserved database tables are only used as temporary tables in a multi-tenant environment. Here are the steps:

1. Locate the code where a write operation is being attempted on a reserved database table.
2. Change the code to use the table as a temporary table instead of writing directly to it.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  