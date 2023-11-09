---
title: Hotfix an AppSource app
description: Learn how to hotfix an AppSource app in Dynamics 365 Business Central.
author: qutreson
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 10/24/2023
ms.custom: bap-template
---

# Hotfix an AppSource app

A `hotfix` is generally the submission of a new version of an AppSource app outside the planned scheduling, whether the hotfix applies to the latest major, latest minor app, or a previous version. 

However, for AppSource apps, the term `hotfix` is used to refer to the submission of a new version which isn't the latest version of the app. For example, if you have version 2.0.0.0 of your app available in AppSource and you submit a new version 1.5.0.0, then version 1.5.0.0 is considered a hotfix because 1.5.0.0 won't be the latest version available.

> [!IMPORTANT]  
> When you submit a hotfix, don't update the version of your offer in Partner Center to match the hotfix version submitted because the version shown in Partner Center on the AppSource marketplace listing shows the latest version.

> [!NOTE]  
> The concept of hotfix is tied to the country/region for which the version of your app is available. If you have different versions of your apps in some countries/regions, your submission might be a hotfix for one country/region but not another. However, we generally don't recommend having different versions per country/region.

## Against which releases is a hotfix submission validated?

When you submit a hotfix of your AppSource app, the service will automatically detect among the existing versions, which is the next version of your app that your customers will be upgraded to when their environment is upgraded to the next major/minor. The service will then validate your submission up to the [!INCLUDE [prod_short](includes/prod_short.md)] release for which this extension is available. 

The minimum release targeted by the submission is computed based on the `application` property similar to any other submission.

### Example 1 - One version targeting the next release

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |

You are now submitting a new version 1.5.0.0 with the `application` property set to 21.0.0.0. 

On their upgrade to the next major, your customers on [!INCLUDE [prod_short](includes/prod_short.md)] version 21 who will be running version 1.5.0.0 would then be upgraded to version 2.0.0.0 which targets [!INCLUDE [prod_short](includes/prod_short.md)] 22.0, so version 1.5.0.0 will be validated for all [!INCLUDE [prod_short](includes/prod_short.md)] releases from 21.0 (included) to 22.0 (excluded).

### Example 2 - Multiple versions targeting the next release

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |
| 3.0.0.0 | 22.0 |

You are now submitting a new version 1.5.0.0 with the `application` property set to 21.0.0.0. 

On their upgrade to the next major, your customers on [!INCLUDE [prod_short](includes/prod_short.md)] version 21 who will be running version 1.5.0.0 would then be upgraded to version 3.0.0.0 which targets [!INCLUDE [prod_short](includes/prod_short.md)] 22.0, so version 1.5.0.0 will be validated for all [!INCLUDE [prod_short](includes/prod_short.md)] releases from 21.0 (included) to 22.0 (excluded).

### Example 3 - Multiple versions targeting the next releases

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |
| 3.0.0.0 | 23.0 |

You are now submitting a new version 1.5.0.0 with the `application` property set to 21.0.0.0.

On their upgrade to the next major, your customers on [!INCLUDE [prod_short](includes/prod_short.md)] version 21 who will be running version 1.5.0.0 would then be upgraded to version 2.0.0.0 which targets [!INCLUDE [prod_short](includes/prod_short.md)] 22.0, so version 1.5.0.0 will be validated for all [!INCLUDE [prod_short](includes/prod_short.md)] releases from 21.0 (included) to 22.0 (excluded).

### Example 4 - Submitting a HF with application equal to the next versions

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |

You are now submitting a new version 1.5.0.0 with the `application` property set to 22.0.0.0.

The technical validation will fail with an error message similar to `The submission must target at least one existing release of Business Central.`, because it would validate version 1.5.0.0 for all [!INCLUDE [prod_short](includes/prod_short.md)] releases from 22.0 (included) to 22.0 (excluded). 

Instead, you should submit a new latest version 2.1.0.0 or 3.0.0.0.

Note that, if it passed validation, version 1.5.0.0 would not be available to any customers anyway, because:
- customers running on [!INCLUDE [prod_short](includes/prod_short.md)] version 21.0 won't be able to upgrade to this version because of the target [!INCLUDE [prod_short](includes/prod_short.md)] version,
- customers running on [!INCLUDE [prod_short](includes/prod_short.md)] version 22.0 will get version 2.0.0.0 which is higher.

### Example 5 - Submitting a HF with application higher than the next versions

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |
| 3.0.0.0 | 23.0 |

You are now submitting a new version 1.5.0.0 with the `application` property set to 23.0.0.0.

The technical validation will fail with an error message similar to `The submission must target at least one existing release of Business Central.`, because it would validate version 1.5.0.0 for all [!INCLUDE [prod_short](includes/prod_short.md)] releases from 23.0 (included) to 22.0 (excluded). 

Instead, you should submit a new latest version 3.1.0.0 or 4.0.0.0.

Note that, if it passed validation, version 1.5.0.0 would not be available to any customers anyway, because:
- customers running on [!INCLUDE [prod_short](includes/prod_short.md)] version 21.0 and 22.0 won't be able to upgrade to this version because of the target [!INCLUDE [prod_short](includes/prod_short.md)] version,
- customers running on [!INCLUDE [prod_short](includes/prod_short.md)] version 23.0 will get version 3.0.0.0 which is higher.

## What is the extra validation done for a hotfix submission?

To ensure that your customer can upgrade from your hotfix version to the next version available in AppSource, we're validating for breaking changes the next version of your app that would be selected during an environment upgrade to the next minor/major with your hotfix version.

### Example 1 - One version targeting the next release

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 22.0 |
| 2.0.0.0 | 23.0 |

If you submit a new version 1.5.0.0 with the `application` property set to 22.0.0.0, the technical validation will verify that:
- There are no breaking changes between 1.0.0.0 and 1.5.0.0, and that
- There are no breaking changes between 1.5.0.0 and 2.0.0.0.

### Example 2 - Multiple versions targeting the next release

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 22.0 |
| 2.0.0.0 | 23.0 |
| 3.0.0.0 | 23.0 |

If you submit a new version 1.5.0.0 with the `application` property set to 22.0.0.0, the technical validation will verify that:
- There are no breaking changes between 1.0.0.0 and 1.5.0.0, and that
- There are no breaking changes between 1.5.0.0 and 3.0.0.0.

### Example 3 - Multiple versions targeting the next releases

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |
| 2.1.0.0 | 22.0 |
| 3.0.0.0 | 23.0 |

If you submit a new version 1.5.0.0 with the `application` property set to 21.0.0.0, the technical validation will verify that:
- There are no breaking changes between 1.0.0.0 and 1.5.0.0, and that
- There are no breaking changes between 1.5.0.0 and 2.1.0.0.

## What kind of changes can't be part of a hotfix?

Since the AppSourceCop will validate for breaking changes, you cannot add code that contains breaking changes with the previous and next version selected for validation. This includes, among others, removing non-obsolete objects, removing table fields, reducing the accessibility of an object. 

As part of a hotfix, you also cannot add new AL objects (pages, reports, codeunits, etc.) or new elements (procedure, actions, fields, etc.) that contribute to your extension's public API unless they're also part of the next version selected for the validation, or they're obsolete pending (except for table and table fields).

### Example 1 - How to add procedures in hotfixes

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |

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

- `local procedure MyNewLocalProcedure()` because it's not public.
- `[Obsolete] procedure MyNewObsoleteProcedure()` because it's obsolete pending.
- `MyPublicProcedureFromV2()` because it's already defined in the next version.

However, you aren't allowed to define a new procedure `procedure MyNewPublicProcedure()`, because the service detects that upgrading from version to 1.5.0.0 to version 2.0.0.0 results in the deletion of a public procedure.

### Example 2 - How to add AL objects in hotfixes

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |

Version 1.0.0.0 of your app is defined as follows:
```al
codeunit 1000000 MyCodeunitFromV1
{
    // Some business logic
}
```

Version 2.0.0.0 of your app is defined as follows:
```al
codeunit 1000000 MyCodeunitFromV1
{
    // Some business logic
}

codeunit 1000001 MyCodeunitFromV2
{
    // Some business logic
}
```

If you submit a new version 1.5.0.0, you're then allowed to add the following codeunits:

- `codeunit 1000002 MyInternalCodeunit { Accessibility = Internal; }` because it's not public.
- `codeunit 1000002 MyObsoleteCodeunit { ObsoleteState = Pending; }` because it's obsolete pending.
- `codeunit 1000001 MyCodeunitFromV2 { }` because it's already defined in the next version.

However, you aren't allowed to define a new procedure `codeunit 1000002 MyNewPublicCodeunit { }`, because the service detects that upgrading from version to 1.5.0.0 to version 2.0.0.0 results in the deletion of a public codeunit.

### Example 3 - How to handle hotfixes when objects are obsoleted and removed within the next release

> [!IMPORTANT]  
> This example demonstrates the impact of obsoleting and removing objects within the same release. The technical validation of AppSource submission does not enforce a specific timeline when deprecating code, but we recommend following the approach documented in [Microsoft Timeline for Deprecating Code in Business Central](devenv-deprecation-timeline.md)

Let's consider that you have the following versions of your app publicly available in AppSource:

| Version | Target [!INCLUDE [prod_short](includes/prod_short.md)] version |
| ------- | ---- |
| 1.0.0.0 | 21.0 |
| 2.0.0.0 | 22.0 |
| 2.1.0.0 | 22.0 |

Version 1.0.0.0 of your app is defined as follows:
```al
codeunit 1000000 MyCodeunitFromV1
{
    // Some business logic
}
```

Version 2.0.0.0 of your app is defined as follows:
```al
codeunit 1000000 MyCodeunitFromV1
{
    ObsoleteState = Pending;
    ObsoleteReason = 'This will be removed in version 2.1.0.0';

    // Some business logic
}
```

Version 2.1.0.0 of your app is defined without MyCodeunitFromV1.

If you submit a new version 1.5.0.0, it will be validated for breaking changes with version 1.0.0.0 and version 2.1.0.0.
Independently of your changes, since MyCodeunitFromV1 was removed from version 2.1.0.0, it must now be marked as ObsoletePending in version 1.5.0.0.

## See also

[Technical Validation FAQ](devenv-checklist-submission-faq.md) 
