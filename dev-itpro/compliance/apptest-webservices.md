---
title: "Be careful about UI for web services"
description: Describes restrictions on UI for web services.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: freddyk
---

# Restrictions on UI for Objects Exposed as Web Services
Pages and code units that are designed to be exposed as Web services must not generate any UI that would cause an exception in the calling code.

**SUMMARY AND INTENT**: When writing code for Web services, you must not use end-user confirmation dialog boxes, message boxes, or any other page constructs in the code. Because a Web service runs independently of a user interface, running this type of code causes the code to throw an exception. The exception can be caught and handled, but the Web service will not complete.

**RESOURCES**: For more information, see [Microsoft Dynamics NAV Web Services](/dynamics-nav/Microsoft-Dynamics-NAV-Web-Services-Overview).

**HOW TO COMPLY**: Ensure that code for pages and code units that are being exposed as Web services do not use any end-user confirmation dialog boxes or message boxes.

**TEST METHODOLOGY**: To verify this requirement, the following tests will be performed:
1. Identify the pages and code units that are exposed as Web services during the installation of the extension.
2. Using code inspection, verify that methods from the following table are not used by the pages and code units published by the installation without conditional code that is based on GUIALLOWED=FALSE or CurrFieldNo=0 circumventing their call.

|AL Method|Applies to|
|-----------|----------|
|CONFIRM|Codeunit/page|
|STRMENU|Codeunit/page|
|(Page RunModal)|Page|
|Page of type Confirmation Dialog|Page|
|(Request page)|Page|
|ERROR|Codeunit/page|
|BEEP|Codeunit/page|
|YIELD|Codeunit/page|

Additionally, when running the page or code unit as a Web service, the following exception should never occur:

*Microsoft.Dynamics.Nav.Types.Exceptions.NavNCLCallbackNotAllowedException: Callback functions are not allowed.*

## See Also
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  
