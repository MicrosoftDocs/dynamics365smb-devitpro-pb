---
title: Hotfixing an AppSource app
description: How to hotfix an AppSource app in Dynamics 365 Business Central
author: qutreson
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 06/08/2023
ms.custom: bap-template
---

# Hotfixing an AppSource app

A `hotfix` is defined as the submission of a new version of an AppSource app, which won't be the latest version available in AppSource. 

For example, if you have version 2.0.0.0 of your app available in AppSource, and you submit a new version 1.5.0.0, then version 1.5.0.0 is considered a hotfix because 1.5.0.0 won't be the latest version available.

> [!IMPORTANT]  
> When submitting a hotfix, you must not update the version of your offer in Partner Center to match the hotfix version submitted, because the version in Partner Center is shown on the AppSource marketplace listing, which is meant to show the latest version.

> [!NOTE]  
> The concept of hotfix is tied to the country/region for which your apps version are available. If you have different versions of your apps on some countries, your submission might be a hotfix for one country, but not for another one. However, we generally do not recommend having different versions per country.

### Against which releases is a hotfix submission validated?

When you submit a hotfix of your AppSource app, the service will automatically detect the next version available and for which release of Business Central it's available. The service will then validate your submission up to that release. The minimum release targeted by the submission is computed based on the `application` property similarly to any other submission.

For example, if you have version 2.0.0.0 of your app available in AppSource targeting Business Central version 21.0, and you submit a new version 1.5.0.0 with `application` set to 19.0.0.0, then version 1.5.0.0 will be validated for all Business Central releases from 19.0.0.0 (included) to 21.0.0.0 (excluded).

### What is the extra validation done for a hotfix submission?

In order to make sure your customer can upgrade from your hotfix version to the next version available in AppSource, we're validating the next version of your app for breaking changes with your hotfix version.

For example, if you have versions 1.0.0.0 and 2.0.0.0 of your app in AppSource, and you submit a new version 1.5.0.0, the technical validation will verify that:

- there are no breaking changes between 1.0.0.0 and 1.5.0.0,
- there are no breaking changes between 1.5.0.0 and 2.0.0.0.

### What kind of changes can't be part of a hotfix?

Since the AppSourceCop will validate for breaking change the next version of your app against the version you have submitted, you can modify the content of your procedure, but you can't add new AL objects or new elements (procedure, actions, fields, etc.) to your app's public API unless they're also part of the next version, or obsolete pending (except for table and table fields).

For example, let's consider that you have versions 1.0.0.0 and 2.0.0.0 of your app in AppSource.

Version 1.0.0.0 of your app is defined as follows:

```al
codeunit 1000000 MyCodeunit
{
    procedure MyPublicProcedureFromV1()
    begin
    end;
}
```

Version 2.0.0.0 of your app is defined as follows:
```al
codeunit 1000000 MyCodeunit
{
    procedure MyPublicProcedureFromV1()
    begin
    end;

    procedure MyPublicProcedureFromV2()
    begin
    end;
}
```

If you submit a new version 1.5.0.0, you're then allowed to add the following procedures:

- `local procedure MyNewLocalProcedure()` because it's not public,
- `[Obsolete] procedure MyNewObsoleteProcedure()` because it's obsolete pending,
- `MyPublicProcedureFromV2()` because it's already defined in the next version.

However, you're not allowed to define a new procedure `procedure MyNewPublicProcedure()`, because the service detects that upgrading from version to 1.5.0.0 to version 2.0.0.0 results in the deletion of a public procedure.

## See also

[Technical Validation FAQ](devenv-checklist-submission-faq.md) 