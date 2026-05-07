---
title: Migration validation overview
description: Learn about the migration validation feature that verifies data migrated from Dynamics GP to Business Central.
author: jswymer
ms.topic: conceptual
ms.date: 01/09/2025
ms.author: jswymer
ms.reviewer: jswymer
---

# Validate Dynamics GP data migration

The **Migration validation** feature verifies data migrated from Dynamics GP to Business Central by comparing source data in GP with migrated data in Business Central. This validation process ensures accuracy and improves efficiency by identifying discrepancies between the two systems.

The feature can run automatically after migration completes or be triggered manually at any time. It tests multiple entities including G/L accounts, customers, vendors, items, and other key business data to confirm successful data transfer.

## How validation works

Migration validation compares specific data points between your Dynamics GP source system and the migrated data in Business Central. For each entity tested, the validation process checks whether values match expected results based on the source data.

When validation completes, you receive a summary that shows:

* Entities that were tested
* Description of each validation test performed
* Number of records that failed validation for each test
* Detailed information about specific records that didn't match

This information helps you identify and resolve data migration issues quickly, ensuring your Business Central environment contains accurate data before you begin using the system.

## Run validation

You can run validation in two ways depending on your workflow preferences:

### Automatic validation

Enable automatic validation before starting your migration by turning on the **Automatic Validation** option in the **Configure GP Migration > GP Migration Settings** window. When enabled, validation runs immediately after the migration process completes without requiring manual intervention.

### Manual validation

Run validation manually after migration by using either of these methods:

* Navigate to the **Validation Errors** tile, select **Company Migration Status**, then choose **Run All Validation**
* From the **Migration Management** page, select **Actions > Validation Status > Run All Validation**

Manual validation is useful when you want to retest data after making corrections or when you completed migration without automatic validation enabled.

## View validation results

Access validation results from the **Cloud Migration Management** page. In the **Company Status Fact Box** area, a tile called **Validation Errors** displays the number of validation issues detected across all migrated companies.

When you select the **Validation Errors** tile, the **Migration Validation Results** page opens with a summary view showing:

* All entities that were tested
* Specific validation test descriptions
* Count of records that failed each test
* Company context for multi-company migrations

For detailed investigation, you can drill down into individual failed records to view:

* Complete record details
* Company where the issue occurred
* Expected value from the source GP system
* Actual value found in Business Central after migration

This detailed view helps you understand exactly what data didn't transfer correctly and why validation failed for specific records.

## Manage validation tests

You have control over which validation tests run for your migration. If a specific validation test isn't relevant to your business requirements or you verified the data through other means, you can exclude it from future validation runs.

To exclude a validation test, open the **Migration Validation Results** page, locate the test you want to skip, and select **Ignore**. The test doesn't run in subsequent validation executions until you re-enable it.

## Validated entities

The migration validation feature tests the following entities to ensure data accuracy:

* G/L Accounts
* Statistical Accounts  
* Bank Accounts
* Customers
* Items
* Purchase Orders
* Vendors
* Vendor 1099 Information

Each entity has specific validation tests that check critical data points relevant to that business object. The validation ensures that key fields, relationships, and calculated values transferred correctly from Dynamics GP to Business Central.

## Related information

[Migrate Dynamics GP data to Business Central online](migrate-dynamics-gp.md)