---
title: "Resolving My Settings Page After a Database Conversion"
description: Explains how to resolve the problem with the My Settings page in the web client after you convert a Dynamics NAV 2016 database.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Resolving My Settings Page Implementation After a Database Conversion
When you convert a [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)] database, the My Settings page in the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] will not work properly. This article explains how to resolve the problem.


1.  Modify Codeunit 40 LogInManagement:

    1.  In the AL code, add a global function that has the following properties:

        <table>
        <tr>
        <th>Property</th>
        <th>Value</th>
        </tr>
        <tr>
        <td>Name</td>
    <td>OpenSettings</td>
    </tr>
    <tr>
        <td>ID</td>
        <td>65</td>
        </tr>
        <tr>
        <td>Local</td>
        <td>No</td>
        </tr>
        </table>
    2.  Add the following code to the **OpenSettings** function:
        ```
        PAGE.RUN(PAGE::"My Settings");
        ```
2. Modify page **9176 My Settings**:

    In AL code, replace the code on the local function **GetTimeZone** with the following code.
    ```
    TimeZone.SETRANGE(ID,TimeZoneID);
    IF TimeZone.FINDFIRST THEN
        EXIT(TimeZone."Display Name");
    ```
## See Also  
 [Converting a Database](Converting-a-Database.md)
