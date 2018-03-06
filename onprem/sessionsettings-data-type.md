---
title: "SessionSettings Data Type"
ms.custom: na
ms.date: 06/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# SessionSettings Data Type
The SessionSettings data type is a complex data type for passing user personalization settings for a client session as an object. The object contains properties that correspond to the fields in the system table **2000000073 User Personalization**, including: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. You can use the AL functions of the SessionSettings data type to get, set, and send the user personalization settings for the current client session.

The SessionSettings data type is used extensively in the AL code of page **9176 My Settings** to enable users to change settings on the page, such as Role Center or company, without having to sign-in to the client again in order for the changes to take effect. 

> [!NOTE]  
> The SessionSettings data type is not supported in extensions.
>
> SessionSettings functions that are called in an OData or SOAP web service call are ignored.

## Functions
The following functions are supported for the SessionSettings data type:

[COMPANY Function](company-function-sessionsettings.md)

[INIT Function](init-function-sessionsettings.md)

[LANGUAGEID Function](languageid-function-sessionsettings.md)

[LOCALEID Function](localeid-function-sessionsettings.md)

[PROFILEAPPID Function](profileappid-function-sessionsettings.md)

[PROFILEID Function](profileid-function-sessionsettings.md)

[PROFILESYSTEMSCOPE Function](profilesystemscope-function-sessionsettings.md)

[REQUESTSESSIONUPDATE Function](requestsessionupdate-function-sessionsettings.md)   

[TIMEZONE Function](timezone-function-sessionsettings.md)

## See Also  
[C/AL Functions](c-al-functions.md)  
