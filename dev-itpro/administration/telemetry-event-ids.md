---
title: Telemetry Event IDs in Application Insights | Microsoft Docs
description: Learn about the event IDs of Business Central events emitted to Azure Application Insights.  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/30/2020
ms.author: jswymer
---
# Telemetry Event IDs in Application Insights

The following tables list the IDs of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry events that can be emitted in Azure Application Insights.

## Application events

| Event ID | Area | Message |
|----------|-------------|-----------------|
|AL0000E2A|Permissions|[User-defined permission set added: {alPermissionSetId}](telemetry-permission-changes-trace.md#setadded)|
|AL0000E2B|Permissions|[User-defined permission set removed: {alPermissionSetId}](telemetry-permission-changes-trace.md#setremoved)|
|AL0000E28 |Permissions|[Permission set link added: {alSourcePermissionSetId} -> {alLinkedPermissionSetId}](telemetry-permission-changes-trace.md#linkadded)|
|AL0000E29 |Permissions|[Permission set link removed: {alSourcePermissionSetId} -> {alLinkedPermissionSetId}](telemetry-permission-changes-trace.md#linkremoved)|
|AL0000E2C |Permissions|[Permission set assigned to user: {alPermissionSetId}](telemetry-permission-changes-trace.md#assigneduser)|
|AL0000E2D |Permissions|[Permission set removed from user: {alPermissionSetId}](telemetry-permission-changes-trace.md#removeduser)|
|AL0000E2E |Permissions|[Permission set assigned to user group: {alPermissionSetId}](telemetry-permission-changes-trace.md#assignedusergroup)|
|AL0000E2F |Permissions|[Permission set removed from user group: {alPermissionSetId}](telemetry-permission-changes-trace.md#removedusergroup)|

## Client events

| Event ID | Area | Message |
|----------|-------------|-----------------|
| CL0001 | Page views | [Page opened: {alObjectName}](telemetry-page-view-trace.md#page-opened-alobjectname) |

## Lifecycle events

| Event ID | Area | Message |
|----------|-------------|-----------------|
| AL0000E24 | Job Queue Lifecycle | [Job queue entry enqueued: {alJobQueueId} ](telemetry-job-queue-lifecycle-trace.md#enqueued) |
| AL0000E25 | Job Queue Lifecycle | [Job queue entry started: {alJobQueueId} ](telemetry-job-queue-lifecycle-trace.md#started) |
| AL0000E26 | Job Queue Lifecycle | [Job queue entry finished: {alJobQueueId} ](telemetry-job-queue-lifecycle-trace.md#finished) |
|AL0000E3F|Configuration Package|[Configuration package export started: {alPackageCode}](telemetry-configuration-package-trace.md#exportstarted)|
|AL0000E3G|Configuration Package|[Configuration package exported successfully: {alPackageCode}](telemetry-configuration-package-trace.md#exportsuccessful)|
|AL0000E3H|Configuration Package|[Configuration package import started: {alPackageCode}](telemetry-configuration-package-trace.md#importstarted)|
|AL0000E3I|Configuration Package|[Configuration package imported successfully: {alPackageCode}](telemetry-configuration-package-trace.md#importsuccessful)|
|AL0000E3N|Configuration Package|[Configuration package apply started: {alPackageCode}](telemetry-configuration-package-trace.md#applystarted)|
|AL0000E3O|Configuration Package|[Configuration package applied successfully: {alPackageCode}](telemetry-configuration-package-trace.md#applysuccessful)|
|AL0000E3P|Configuration Package|[Configuration package deleted successfully: {alPackageCode}](telemetry-configuration-package-trace.md#deletesuccessful)|
| LC0001 | Company Lifecycle | [Company created: {companyName}](telemetry-company-lifecycle-trace.md#company-created) |
| LC0002 | Company Lifecycle | [Company creation canceled: {companyName}](telemetry-company-lifecycle-trace.md#company-creation-canceled) |
| LC0003 | Company Lifecycle | [Company creation failed: {companyName}](telemetry-company-lifecycle-trace.md#company-creation-failed) |
| LC0004 | Company Lifecycle | [Company copied: {companyNameSource} to {companyNameDestination}](telemetry-company-lifecycle-trace.md#company-copied) |
| LC0005 | Company Lifecycle | [Company copied canceled: {companyNameSource} to {companyNameDestination}](telemetry-company-lifecycle-trace.md#company-copy-canceled) |
| LC0006 | Company Lifecycle | [Company copy failed: {companyNameSource} to {companyNameDestination}](telemetry-company-lifecycle-trace.md#company-copy-failed) | 
| LC0007 | Company Lifecycle | [Company deleted: {companyName}](telemetry-company-lifecycle-trace.md#company-deleted)| 
| LC0008 | Company Lifecycle | [Company deletion canceled: {companyName}](telemetry-company-lifecycle-trace.md#company-deletion-canceled) | 
| LC0009 | Company Lifecycle | [Company deletion failed: {companyName}](telemetry-company-lifecycle-trace.md#company-deletion-failed) | 
| LC0010 | Extension Lifecycle | [Extension installed successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#installedsuccess) |
| LC0011 | Extension Lifecycle | [Extension failed to install: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#installedfailed) |
| LC0012 | Extension Lifecycle | [Extension synchronized successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId}](telemetry-extension-lifecycle-trace.md#syncedsuccess) |
| LC0013 | Extension Lifecycle | [Extension failed to synchronize: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#syncedfailed) |
| LC0014 | Extension Lifecycle | [Extension published successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#publishedsuccess) |
| LC0015 | Extension Lifecycle | [Extension failed to publish: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#publishedfailed) |
| LC0016 | Extension Lifecycle | [Extension un-installed successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#uninstalledsuccess) |
| LC0017 | Extension Lifecycle | [Extension failed to un-install: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#uninstalledfailed) |
| LC0018 | Extension Lifecycle | [Extension unpublished successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#unpublishedsuccess) |
| LC0019 | Extension Lifecycle | [Extension failed to un-publish: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#unpublishedfailed) |
| LC0020 | Extension Lifecycle | [Extension compiled successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#compiledsuccess) |
| LC0021 | Extension Lifecycle | [Extension failed to compile: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#compiledfailed) |
| LC0022 | Extension Lifecycle | [Extension updated successfully: {extensionName} version {extensionVersion} by {extensionPublisher}](telemetry-extension-lifecycle-trace.md#updatedsuccess) |
| LC0023 | Extension Lifecycle | [Extension failed to update: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})](telemetry-extension-lifecycle-trace.md#updatedfailed) |

## Runtime events

| Event ID | Area | Message |
|----------|-------------|-----------------|
| RT0001 | Authorization| [Authorization Failed (Pre Open Company): {failure reason}](telemetry-authorization-trace.md#authorizationfailedpreopencompany) |
| RT0002 | Authorization| [Authorization Failed (Open Company): {failure reason}](telemetry-authorization-trace.md#authorization-failed-open-company) |
| RT0003 | Authorization| [Authorization Succeeded (Pre Open Company)](telemetry-authorization-trace.md#authorizationsucceededpreopencompany) | 
| RT0004 | Authorization| [Authorization Succeeded (Open Company)](telemetry-authorization-trace.md#authorization-succeeded-open-company) |
| RT0005 | Performance | [Operation exceeded time threshold (SQL query)](telemetry-long-running-sql-query-trace.md) |
| RT0006 | Report generation | [Success report generation](telemetry-reports-trace.md#success-report-generation) |
| RT0006 | Report generation | [Report rendering failed: {report ID} - {report name}](telemetry-reports-trace.md#failed-report-generation) |
| RT0007 | Report generation | [Cancellation report generation](telemetry-reports-trace.md#cancellation-report-generation) | 
| RT0008 | Incoming Web service requests | [Web service called ({category of request}): {endpoint}](telemetry-webservices-trace.md) |
|RT0010|Extension lifecycle|[Extension Update Failed: exception raised in extension {extensionName} by {extensionPublisher} (updating to version {extensionTargetedVersion})](telemetry-extension-update-trace.md#extension-update-failed-exception-raised-in-extension) |
| RT0011 | Report generation | [Report cancelled but a commit occurred](telemetry-reports-trace.md#commit) | 
| RT0012 | Performance | [Database lock timed out](telemetry-database-locks-trace.md#database-lock-timed-out) | 
| RT0013 | Performance | [Database lock snapshot: {snapshotId}](telemetry-database-locks-trace.md#database-lock-snapshot) |
| RT0014 | Security | [App Key Vault initialization succeeded: '{keyVaultUri}'](telemetry-extension-key-vault-trace.md#initializedsuccess) |
| RT0015 | Security | [App Key Vault initialization failed](telemetry-extension-key-vault-trace.md#initializedfailed) |
| RT0016 | Security | [App Key Vault secret retrieval succeeded from key vault '{keyVaultUri}'](telemetry-extension-key-vault-trace.md#retrievedsuccess) |
| RT0017 | Security | [App Key Vault secret retrieval failed from key vault: '{keyVaultUri}'](telemetry-extension-key-vault-trace.md#retrievedfailed) |
| RT0018 | Performance | [Operation exceeded time threshold (AL method)](telemetry-al-method-trace.md) |
| RT0019 | Outgoing Web service requests  | [Web Service Called (Outgoing): {endpoint}](telemetry-webservices-outgoing-trace.md) |

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
