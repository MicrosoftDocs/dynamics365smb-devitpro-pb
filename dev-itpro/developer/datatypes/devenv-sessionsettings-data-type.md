---
title: "SessionSettings Data Type"
ms.custom: na
ms.date: 06/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 2b9d7dad-f05c-4f93-a167-8a9fa036ed28
caps.latest.revision: 2
author: SusanneWindfeldPedersen
---
# SessionSettings Data Type
The SessionSettings data type is a complex data type for passing user personalization settings for a client session as an object. The object contains properties that correspond to the fields in the system table **2000000073 User Personalization**, including: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. You can use the AL methods of the SessionSettings data type to get, set, and send the user personalization settings for the current client session.

The SessionSettings data type is used extensively in the AL code of page **9176 My Settings** to enable users to change settings on the page, such as Role Center or company, without having to sign-in to the client again in order for the changes to take effect. 

> [!NOTE]  
> The SessionSettings data type is not supported in extensions.
>
> SessionSettings methods that are called in an OData or SOAP web service call are ignored.

## Methods
The following methods are supported for the SessionSettings data type:

[COMPANY Method](../methods/devenv-company-method-sessionsettings.md)

[INIT Method](../methods/devenv-init-method-sessionsettings.md)

[LANGUAGEID Method](../methods/devenv-languageid-method-sessionsettings.md)

[LOCALEID Method](../methods/devenv-localeid-method-sessionsettings.md)

[PROFILEAPPID Method](../methods/devenv-profileappid-method-sessionsettings.md)

[PROFILEID Method](../methods/devenv-profileid-method-sessionsettings.md)

[PROFILESYSTEMSCOPE Method](../methods/devenv-profilesystemscope-method-sessionsettings.md)

[REQUESTSESSIONUPDATE Method](../methods/devenv-requestsessionupdate-method.md)   

[TIMEZONE Method](../methods/devenv-timezone-method-sessionsettings.md)

## See Also  
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  