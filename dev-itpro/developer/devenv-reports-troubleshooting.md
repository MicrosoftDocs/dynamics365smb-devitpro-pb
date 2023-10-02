---
title: Troubleshooting reports
description: Learn about how to troubleshoot Business Central reports
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 10/02/2023
---

# Troubleshooting report errors

If reports fail to generate or if they take too long time to generate, you might need to investigate why. This article contains strategies for analyzing report telemetry to find possible root cases for such errors or slow performance.

A report in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can fail in either of these phases
1. in the request page
2. when generating the report dataset
3. when rendering the report with a layout
4. in any of the OnAfterDocument* triggers

The most effective way to troubleshoot report errors is to enable telemetry. In the paragraphs below, you can read more about report error telemetry and how to use that to identify the cause and possible solutions/mitigations for report errors.

## Reporting telemetry

[!INCLUDE[report_telemetry_intro](../includes/include-report-telemetry-intro.md)]

When you run a report, either from the UI, in a background sessions, or from a web service call, it might fail. The failure can either be in the AL code of the report or in the layout. When a report fails to generate, you get an RT0006 event in telemetry and the `result` column in the customDimensions will include the title of the exception that was thrown by the service or the AL code.


[!INCLUDE[telemetry_error_kql](../includes/include-report-telemetry-error-kql.md)]

For more information, see [Report telemetry](../administration/telemetry-reports-trace.md).

## Reporting exceptions


In the following table, we list some common report exceptions and suggestions to how to fix them:

[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the excel file defining exceptions in reports.)

| Exception | Severity | Explanation | 
| --------- | -------- | ----------- |
|NavCSideRecordNotFoundException|Error|[Read more](#NavCSideRecordNotFoundException)|
|NavNCLDialogException|Error|[Read more](#NavNCLDialogException)|
|NavNCLReportResultEmptyException|Warning|[Read more](#NavNCLReportResultEmptyException)|
|NavCSideException|Error|[Read more](#NavCSideException)|
|NavTestFieldException|Warning|[Read more](#NavTestFieldException)|
|XmlException|Error|[Read more](#XmlException)|
|NavNCLStringLengthExceededException|Error|[Read more](#NavNCLStringLengthExceededException)|
|NavCSideDuplicateKeyException|Error|[Read more](#NavCSideDuplicateKeyException)|
|Canceled|Warning|[Read more](#Canceled)|
|NavAdministratorMadeChangesException|Error|[Read more](#NavAdministratorMadeChangesException)|
|NavNCLFieldNotFoundException|Error|[Read more](#NavNCLFieldNotFoundException)|
|NavCSideFilterException|Error/Warning|[Read more](#NavCSideFilterException)|
|NavSqlException|Error|[Read more](#NavSqlException)|
|NavCSideSQLLockTimeoutException|Warning|[Read more](#NavCSideSQLLockTimeoutException)|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)



[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the excel file defining exceptions in reports.)

### <a name=NavCSideRecordNotFoundException></a>NavCSideRecordNotFoundException
The NavCSideRecordNotFoundException error typically occurs when the server tries to access a record that doesn’t exist. This can happen in a report if the report is trying to access data from a table, but the specific record it’s looking for doesn’t exist in that table, or if the user is not allowed to access that record.

#### Suggested solution (NavCSideRecordNotFoundException)
Here are some potential solutions:<br> Check the data: Make sure the data the report is trying to access actually exists in the database.<br> Check the report code: There might be an issue with how the report is trying to access the data. You might need to modify the report code to correctly handle cases where a record doesn’t exist.<br><br>

### <a name=NavNCLDialogException></a>NavNCLDialogException
The NavNCLDialogException error happens when a error funtion has been called in the report. 

#### Suggested solution (NavNCLDialogException)
The error messages will in most cases provide the necessary information to mitigate the problem. If not, you need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavNCLReportResultEmptyException></a>NavNCLReportResultEmptyException
When the report dataset does not have any data, we show a dialog to the user.

#### Suggested solution (NavNCLReportResultEmptyException)
This is not an error per se, but if you do not see any successful renderings of the report, you might have a bug in the AL code that generates the dataset. The typical root cause for this error is incorrect filters on the request page that result in an empty data set.<br><br>

### <a name=NavCSideException></a>NavCSideException
There is an error in the report code (likely in the code generating the dataset) or in the code running the report.

#### Suggested solution (NavCSideException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavTestFieldException></a>NavTestFieldException
This happens when the TESTFIELD function test a value in a field and it does not match the expected value.

#### Suggested solution (NavTestFieldException)
This is not an error per se, but if you do not see any successful renderings of the report, you might have a bug in the AL code for the request page.<br><br>

### <a name=XmlException></a>XmlException
This typically happens if there is an error in a Word layout

#### Suggested solution (XmlException)
You need a developer to debug the Word report layout. If the layout was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavNCLStringLengthExceededException></a>NavNCLStringLengthExceededException
This can happen when you assign an unlimited string to a string with a fixed length. The error will occur if the source string is longer than the allocated length in the target.

#### Suggested solution (NavNCLStringLengthExceededException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavCSideDuplicateKeyException></a>NavCSideDuplicateKeyException
The report code is trying to insert data into a table and there is already data there with the supplied key (either primary or unique)

#### Suggested solution (NavCSideDuplicateKeyException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=Canceled></a>Canceled
The report was cancelled either by the user or by the platform.

#### Suggested solution (Canceled)
This is not an error per se, but if you do not see any successful renderings of the report, you might have a bug in the AL code that generates the dataset.<br><br>

### <a name=NavAdministratorMadeChangesException></a>NavAdministratorMadeChangesException
The NavAdministratorMadeChangesException error typically occurs when an administrator has installed or updated an extension that have impact on the report (directly or via dependencies).

#### Suggested solution (NavAdministratorMadeChangesException)
Ask the user to re-run the report.<br><br>

### <a name=NavNCLFieldNotFoundException></a>NavNCLFieldNotFoundException
The NavNCLFieldNotFoundException typically occurs when a field that the report is trying to access is not found. This is typically due to outdated field refs in AL code that try to address a table field using an index that is no longer valid.  

#### Suggested solution (NavNCLFieldNotFoundException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavCSideFilterException></a>NavCSideFilterException
The NavCSideFilterException error typically occurs when there’s an issue with a filter in a report, either when generating the dataset or when a user provides data in a request page. This could be due to a variety of reasons, such as an incorrect filter value, a problem with the filter syntax, or a data type mismatch.

#### Suggested solution (NavCSideFilterException)
Here are some potential solutions:<br><br>Check the filter values (with the user): Make sure the filter values being used in the report are correct and valid.<br>Check the filter syntax: Ensure that the filter syntax is correct in the report dataset generation code. This includes the use of filter tokens, such as .. for ranges and | for alternatives.<br>Check for data type mismatches: Make sure that the data type of the filter value matches the data type of the field being filtered.<br><br>If the report is run in the background or from a web service call, then this is not a user error.<br><br>

### <a name=NavSqlException></a>NavSqlException
This is a transient error in the Business Central service.

#### Suggested solution (NavSqlException)
Ask the user to re-run the report<br><br>

### <a name=NavCSideSQLLockTimeoutException></a>NavCSideSQLLockTimeoutException
The report code tried to get a lock on data, but another process had a lock on the same data. After 30 seconds, the report proces had to timeout and give up getting a lock on the data.

#### Suggested solution (NavCSideSQLLockTimeoutException)
The user should retry running the report. If the issue persists, then the administrator might need to look into telemetry for lock timeouts to find which process is locking data.<br><br>

### <a name=NavNCLRecordNotOpenedException></a>NavNCLRecordNotOpenedException
AL runtime error caused by programming errror when the code does not open a record reference before use.

#### Suggested solution (NavNCLRecordNotOpenedException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavNCLCallbackNotAllowedException></a>NavNCLCallbackNotAllowedException
The report is running in the background or triggered from a webservice and the code is trying to open UI from any function in AL that requires the client , for example confirmation, a file upload, opening a page etc. 

#### Suggested solution (NavNCLCallbackNotAllowedException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavPermissionException></a>NavPermissionException
The user running the report was missing permissions to run the report or to some of the data needed in the report dataset.

#### Suggested solution (NavPermissionException)
This is not an error in the report, but you might want to look into which users experience this and sort out the permission issue for them.<br><br>

### <a name=NavReportingServiceException></a>NavReportingServiceException
This is a transient error in the Business Central service.

#### Suggested solution (NavReportingServiceException)
Ask the user to re-run the report<br><br>

### <a name=NavCSideDataException></a>NavCSideDataException
Legacy error related to invalid data in the current context

#### Suggested solution (NavCSideDataException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavCSideValidateTableRelationException></a>NavCSideValidateTableRelationException
A field table relation cannot be validated

#### Suggested solution (NavCSideValidateTableRelationException)
Missing data in the related table or incorrect data in the current field that does not match the required fiels in the related table.<br><br>

### <a name=NavNCLDateInvalidException></a>NavNCLDateInvalidException
A string cannot be converted to a date type.

#### Suggested solution (NavNCLDateInvalidException)
Incorrect string format that cannot be converted to a date in the current regional setup. Inspect the data behing the report or change the regional settings to fit report requirements. In BC 23 and later, try to set the format region in the request page and rerun the report.<br><br>

### <a name=NavNCLNotSupportedTypeException></a>NavNCLNotSupportedTypeException


#### Suggested solution (NavNCLNotSupportedTypeException)
<br><br>

### <a name=NavNCLDebuggerActivityAbortedException></a>NavNCLDebuggerActivityAbortedException
This happens when a developer is debugging a report

#### Suggested solution (NavNCLDebuggerActivityAbortedException)
Not an error<br><br>

### <a name=NavALException></a>NavALException
This typically happens if there is an error in the AL code generating the report dataset, not in the report layout

#### Suggested solution (NavALException)
You need a developer to debug the report code or the code running the report<br><br>

### <a name=NavNCLMissingFileNameException></a>NavNCLMissingFileNameException
This typically happens in processing-only reports

#### Suggested solution (NavNCLMissingFileNameException)
First check the parameters on the request page. Could be a missing file name in field that does not have a proper field validation. You might need a developer to debug the report code or the code running the report<br><br>

### <a name=NavFilterException></a>NavFilterException
The NavFilterException error typically occurs when there’s an issue with a filter in a report, either when generating the dataset or when a user provides data in a request page. This could be due to a variety of reasons, such as an incorrect filter value, a problem with the filter syntax, or a data type mismatch.

#### Suggested solution (NavFilterException)
Here are some potential solutions:<br><br>Check the filter values (with the user): Make sure the filter values being used in the report are correct and valid.<br>Check the filter syntax: Ensure that the filter syntax is correct in the report dataset generation code. This includes the use of filter tokens, such as .. for ranges and | for alternatives.<br>Check for data type mismatches: Make sure that the data type of the filter value matches the data type of the field being filtered.<br><br>If the report is run in the background or from a web service call, then this is not a user error.<br><br>

### <a name=NavNCLXmlException></a>NavNCLXmlException
This typically happens if there is an error in the XML of the request page

#### Suggested solution (NavNCLXmlException)
You need a developer to debug the report code or the code running the report<br><br>

### <a name=NavCreateScheduledTasksNotAllowedException></a>NavCreateScheduledTasksNotAllowedException
The report code is trying to start a background session, which is not allowed.

#### Suggested solution (NavCreateScheduledTasksNotAllowedException)
You need a developer to debug the report code or the code running the report<br><br>

### <a name=NavNCLConversionCastException></a>NavNCLConversionCastException
There is an error in the report AL code (not the layout) related to invalid type conversion.

#### Suggested solution (NavNCLConversionCastException)
You need a developer to debug the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavNCLEvaluateException></a>NavNCLEvaluateException
Unabler to evaluate the input string to the desired database.

#### Suggested solution (NavNCLEvaluateException)
You need a developer to debug the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavNCLReportSourceExpressionException></a>NavNCLReportSourceExpressionException


#### Suggested solution (NavNCLReportSourceExpressionException)
<br><br>

### <a name=NavNCLArgumentException></a>NavNCLArgumentException
Invalid parameter has been passed on to an AL runtime method.

#### Suggested solution (NavNCLArgumentException)
You need a developer to debug the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavCompanyPermissionException></a>NavCompanyPermissionException
The user running the report did not have access to the company.

#### Suggested solution (NavCompanyPermissionException)
This is not an error in the report, but you might want to look into which users experience this and sort out the permission issue for them.<br><br>

### <a name=ConnectionLostException></a>ConnectionLostException
This is a transient error in the Business Central service.

#### Suggested solution (ConnectionLostException)
Ask the user to re-run the report<br><br>

### <a name=NavEntitlementPermissionException></a>NavEntitlementPermissionException
The user running the report has a license that does not allow running the report. 

#### Suggested solution (NavEntitlementPermissionException)
This is not an error in the report, but you might want to look into which users experience this and sort out the license issue for them.<br><br>

### <a name=NavNCLTableIdMismatchException></a>NavNCLTableIdMismatchException


#### Suggested solution (NavNCLTableIdMismatchException)
<br><br>

### <a name=NavNCLIncompatibleConnectionIntentException></a>NavNCLIncompatibleConnectionIntentException


#### Suggested solution (NavNCLIncompatibleConnectionIntentException)
<br><br>

### <a name=NavNCLReportDefinitionInvalidException></a>NavNCLReportDefinitionInvalidException
Invalid RDLC layout which need a review by a developer.

#### Suggested solution (NavNCLReportDefinitionInvalidException)
You need a developer to debug the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=InconsistentReadException></a>InconsistentReadException
Reports read data with UNCOMMITTED level. For this instance of the report, there was a conflict where data was modified by another session while reading the data in the session running the report

#### Suggested solution (InconsistentReadException)
Ask the user to re-run the report<br><br>

### <a name=NavNclHttpRequestException></a>NavNclHttpRequestException
The NavNclHttpRequestException error in AL code for Microsoft Dynamics 365 Business Central typically occurs when there’s an issue with the HTTP request made to a web service. This could be due to a variety of reasons such as network issues, incorrect endpoint URL, or issues with the request parameters.

#### Suggested solution (NavNclHttpRequestException)
An error in (third-party) extension code being called from report triggers. You need a developer to debug the report code. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=XPathException></a>XPathException
This typically happens if there is an error in the XML of the request page or if  the xml data set for Word based reports is corrupted.

#### Suggested solution (XPathException)
You need a developer to debug the report code or the code running the report<br><br>

### <a name=NavNCLArgumentOutOfRangeException></a>NavNCLArgumentOutOfRangeException


#### Suggested solution (NavNCLArgumentOutOfRangeException)
<br><br>

### <a name=NavNCLInvalidPathException></a>NavNCLInvalidPathException
This typically happens in processing-only reports. Some typical scenarios are code that tries to read or write a file using an invalid path (OnPrem) or a path outside of the users allowed temp area (SaaS).

#### Suggested solution (NavNCLInvalidPathException)
You need a developer to debug the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=IOException></a>IOException
This is a transient error in the Business Central service.

#### Suggested solution (IOException)
Ask the user to re-run the report<br><br>

### <a name=NavOfficeDocumentRenderMaxRowsExceededException></a>NavOfficeDocumentRenderMaxRowsExceededException
The Business Central service cannot process the report because the dataset contains too many rows.

#### Suggested solution (NavOfficeDocumentRenderMaxRowsExceededException)
Update the filter on the report to limit the number of rows. The maximum number of rows can be controlled in the Report Limits  page or in the advanced tab on the request page. Notice that setting the limit too high, can put the node at risk due to high memory usage (can result in Out-of-memory exception) and constrain other users on the system.<br><br>

### <a name=OutOfMemoryException></a>OutOfMemoryException
The Business Central service cannot process the report because the memory needed to do that exceeds the limit on the platform

#### Suggested solution (OutOfMemoryException)
Set a filter in the report to limit the number of rows in the data set. <br><br>

### <a name=NavNCLDocumentServiceException></a>NavNCLDocumentServiceException
This is a transient error in the Business Central service.

#### Suggested solution (NavNCLDocumentServiceException)
Ask the user to re-run the report<br><br>

### <a name=NavNCLReportNoLayoutException></a>NavNCLReportNoLayoutException
There is an error in the report code or layout setup in the application if the selected has been set to a user defined layout or the layout selection points to an uninstalled layout from a report extension.

#### Suggested solution (NavNCLReportNoLayoutException)
You need a developer to debug the report or the code running the report. If the report was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=NavCSideSqlTimeoutException></a>NavCSideSqlTimeoutException
This is a transient error in the Business Central service.

#### Suggested solution (NavCSideSqlTimeoutException)
Ask the user to re-run the report<br><br>

### <a name=OpenXmlPackageException></a>OpenXmlPackageException
This typically happens if there is an error in a Word layout

#### Suggested solution (OpenXmlPackageException)
You need a developer to debug the Word report layout. If the layout was supplied by Microsoft or an ISV, then create a support request.<br><br>

### <a name=DeadSqlConnectionException></a>DeadSqlConnectionException
This is a transient error in the Business Central service.

#### Suggested solution (DeadSqlConnectionException)
Ask the user to re-run the report<br><br>

### <a name=SqlException></a>SqlException
This is a transient error in the Business Central service.

#### Suggested solution (SqlException)
Ask the user to re-run the report<br><br>

### <a name=NavNCLOutsidePermittedRangeException></a>NavNCLOutsidePermittedRangeException


#### Suggested solution (NavNCLOutsidePermittedRangeException)
<br><br>


[//]: # (IMPORTANT: END>DO_NOT_EDIT)



## Report performance

[!INCLUDE[report_performance](../includes/include-report-performance.md)]

For more information, see [Report performance](devenv-report-performance.md)

## See also

[Testing a report](devenv-testing-reports.md)   
[Report performance](devenv-report-performance.md)   
[Report telemetry](../administration/telemetry-reports-trace.md)   
