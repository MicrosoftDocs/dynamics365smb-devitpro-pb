---
title: "Resolving My Settings Page Implementation After a Database Conversion"
ms.custom: na
ms.date: 20/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6ea75b39-cf7d-4c88-868b-86fa0be2426b
caps.latest.revision: 4
manager: edupont
---
# Resolving My Settings Page Implementation After a Database Conversion
When you convert a [!INCLUDE[navcorfu](includes/navcorfu_md.md)] database, the My Settings page in the  [!INCLUDE[nav_web_md](includes/nav_web_md.md)] will not work properly. This article explains how to resolve the problem.


1.  Modify Codeunit 1 Application Management:

    1.  In the C/AL code, add a global function that has the following properties:

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

    In C/AL code, replace the code on the local function **GetTimeZone** with the following code.
    ```
    TimeZone.SETRANGE(ID,TimeZoneID);
    IF TimeZone.FINDFIRST THEN
        EXIT(TimeZone."Display Name");
    ```
## See Also  
 [Converting a Database](Converting-a-Database.md)
