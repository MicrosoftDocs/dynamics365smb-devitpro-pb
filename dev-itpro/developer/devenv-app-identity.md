---
title: "App Identity"
description: "Description of what makes up the app identity of an app for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# App Identity

<!-- What makes an app for Business Central unique, what makes up the app identity? -->

Apps built using AL extend the functionality of [!INCLUDE[prod_short](../includes/prod_short.md)]. The `app.json` file is, together with the `launch.json` file, automatically generated when you create a new AL project. The `app.json` file contains information about the extension that you are building, such as publisher information and specifies the minimum version of base application objects that the extension is built on. Often the `app.json` file is referred to as the *manifest*. The `app.json` file contains numerous project settings, but a few of them constitutes the actual identity of the app that you are creating.

|Setting|Example|Description|
|-------|------|-----|
|`id`   |`"id": "ef4dabfc-1de7-4d90-b948-4a9c2933d794"`| The `id`, also known as the app ID. This is a GUID which is auto-generated when the project is created. The app ID is also bound to how tables are named in [!INCLUDE[prod_short](../includes/prod_short.md)] and how the identity of an application is computed. Changing the app ID may have severe consequences, such as the app not functioning properly, or data not being available.|
|`name`|`"name": "Partner X extension"`|The unique extension name.|
|`Publisher`|`"publisher": "Business Central Partner X"`|The name of the publisher.|


<!-- The appId with a tenantId identifies an application in the service architecture of business central. --> 

## When is it okay to change the app identity?

## App identity and AppSource apps


## See Also

[JSON Files](devenv-json-files.md)  