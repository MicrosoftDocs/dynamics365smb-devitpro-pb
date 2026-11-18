---
title: Dynamics GP Migration Validation Overview
description: Validate Dynamics GP data migrated to Business Central, review failed tests and record details, and configure automatic or manual validation.
author: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Validate Dynamics GP data migration

The migration validation feature checks data migrated from Dynamics GP to Business Central by comparing replicated GP source data with migrated data in Business Central. This validation process helps you identify discrepancies between the two sets of data.

The feature can run automatically as part of the data upgrade or be triggered manually after migration. It tests multiple entities, including G/L accounts, customers, vendors, items, and other key business data.

## How validation works

Migration validation compares specific data points between the replicated Dynamics GP source data and the migrated data in Business Central. For each entity tested, the validation process checks whether values match expected results based on the source data.

When validation completes, you can view a summary that shows:

* Entities that were tested
* Description of each validation test performed
* Number of records that failed validation for each test
* Detailed information about specific records that didn't match

This information helps you identify and resolve data migration issues before you begin using Business Central. Validation checks specific data points, not every field or transaction, so also review the migrated data against your business requirements.

## Run migration validation

You can run validation in two ways depending on your workflow preferences:

### Automatic validation

Before starting your migration, open **Cloud Migration Management** and select **Configure GP Migration**. On the **GP Company Migration Configuration** page, select **Migration settings** to open **GP Migration Settings**. In the **Automatic Validation** group, turn on **GP**. This option is on by default for a new migration configuration.

When enabled, validation runs during the data upgrade without requiring manual intervention. In US environments, **GP-US (1099)** controls automatic validation of vendor 1099 information separately.

The **Validation Errors Should Fail Migration** group controls whether validation errors cause the data upgrade to fail. The options in this group are off by default. Review the recovery requirements before enabling them. Learn more in [Upgrade data for Dynamics GP cloud migration](migration-data-upgrade-gp.md).

### Manual validation

Run validation manually after migration by using either of these methods:

* On **Cloud Migration Management**, select **Validation Errors** in the **Company Status** FactBox, select **Company Migration Status**, and then choose **Run All Validation**.
* From **Cloud Migration Management**, select **Validation Status**, and then choose **Run All Validation**.

The action asks whether to force validation on all companies, including companies that were already validated. Choose **Yes** to retest those companies. This choice deletes their previous validation results before scheduling validation again. Choose **No** to validate only companies that haven't been validated.

Manual validation is useful when you want to retest data after making corrections or when you completed migration without automatic validation enabled.

## View validation results

Access validation results from the **Cloud Migration Management** page. In the **Company Status** FactBox, **Validation Errors** displays the number of validation issues detected across all migrated companies.

When you select **Validation Errors**, the **Migration Validation Results** page opens with a summary view showing:

* All entities that were tested
* Specific validation test descriptions
* Count of records that failed each test

The page hides passing tests by default. Turn off **Hide passing tests** to include tests with no reported failures.

For detailed investigation, select a test's **Fail Count** to open **Migration Validation Errors** and view:

* The entity and record identifier
* Company where the issue occurred
* Expected value from the source GP system
* Actual value found in Business Central after migration

This detailed view helps you investigate why validation failed for specific records. Expected and actual values can be redacted for sensitive data.

## Manage validation tests

You can suppress failure logging for individual validation tests. If a specific validation test isn't relevant to your business requirements or you verified the data through other means, you can ignore its failures in future validation runs.

To ignore a validation test's failures, open the **Migration Validation Results** page, locate the test, and select **Ignore**. The test still runs, but it doesn't log new validation failures until you clear **Ignore**. This setting applies across companies and doesn't remove existing failures.

## Entities checked during validation

The migration validation feature tests the following entities, depending on the modules and data selected for migration:

* G/L accounts
* Statistical accounts
* Bank accounts
* Customers and ship-to addresses
* Items
* Purchase orders and lines
* Vendors, order addresses, and remit-to addresses
* Vendor 1099 information in US environments

Each entity has specific validation tests that check data points relevant to that business object. Some balance discrepancies are reported as warnings when migrated journal batches haven't been posted.

## Related information

[Dynamics GP data migrated to Business Central online](migrate-dynamics-gp.md)