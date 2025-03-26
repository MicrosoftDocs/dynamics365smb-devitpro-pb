---
title: If the standard code does not meet your needs, adjust it yourself!
description: Learn about how you can expand extensibility points in Business Central so your customizations can pass smooth. 
author: diegojoshuam
ms.topic: conceptual
ms.author: diegojoshuam, AleksandricMarko
ms.date: 02/18/2025
ms.reviewer: bholtorf
---

# If the standard code does not meet your needs, adjust it yourself!

Our AL codebase contains many scenarios that you can extend to cover the diverse needs of different businesses. However, you might have a business scenario that our extensibility offerings don't cover. For example, we might not have the event or interface you need. To get it, you can make the extensibility request, or, rather than to wait for us, for part of the app, we would like to encourage you to unblock yourself by contributing to our codebase.

We strive to bring our codebase closer to our partners so that through joint efforts we can achieve the desired results, so, currently, part of the application is available for improvements through the contribution model.

From the point how it can be extended (or better, how and where you are creating the extensibility request), we can simply split it to a: 

|Area  |Description  |
|---------|---------|
|[BCApps](https://github.com/microsoft/BCapps)     | This repository contains modules for the System Application and Business Foundation layers.</br>It's the first truly open source component in Business Central's AL codebase.</br>To learn more about the guidelines for contributing, see [contributing](https://github.com/microsoft/BCApps/blob/main/CONTRIBUTING.md.) guidelines.  |
|[ALAppExtensions](https://github.com/microsoft/ALAppExtensions/)     | This repository is a platform for Microsoft and our vibrant partner channel and community to work together to develop add-on apps in the AL language and to enable the general extensibility of [!INCLUDE [prod_short](includes/prod_short.md)].</br>To create extensibility request for **BaseApp** and other parts of the system, open the [Issues](https://github.com/microsoft/ALAppExtensions/issues) form and use **"New issue"** -> **"Create an extensibility request"**. </br>Before create new request, please check these guidelines:</br> - [Extensibility requests - ReadMe](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#extensibility-requests) </br> - [How to create an extensibility request](https://review.learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/create-extensibility-request) </br> - [Types of events](https://review.learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/types-of-events-for-extensibility) 
|

> [!NOTE]
>
> * We're adding new events in main and the latest release branch. At the time of this writing, the latest release branch is 26.x. In most cases, we make other types of requests, again, only in the main branch, available in upcoming major releases.
> * If anything in the request is marked as `Obsolete` or surrounded by `CLEAN` tags, we won't accept the request.

### Each request should contain the following information:

* A clear title.
* A description of why you need the change or addition.
* A description of the request.


### Contribution model
We welcome contributions to Microsoft's application add-ons.
* If you are looking to contribute to the System Application or Developer Tools you can do so in the [BCApps](https://github.com/microsoft/BCapps) repository.
* If you are looking to contribute to the Base Application you can do so in the [BusinessCentralApps](#contribute-to-businesscentralapps) repository. 
    * Please note, that this repository is private but you can request access to our contribution program by filling out this [form](https://forms.office.com/pages/responsepage.aspx?id=v4j5cvGGr0GRqy180BHbR_Qj5hjzNeNOhBcvBoRIOltUOVBVTklZN1hBOTZJUU40OE5CUzNWNk1FQy4u). 
    * To learn more, go to [Contribute to BusinessCentralApps](#contribute-to-businesscentralapps). 


⚠IMPORTANT⚠: This is not the right place to report product defects with customer impact to Microsoft! Issues created in this repository might not get picked up by the Microsoft engineering team and issues reported in this repository do not fall under SLAs (Service Level Agreements) and hence have no guaranteed time to mitigation, just as provided fixes won't get backported to all supported versions of the product.    