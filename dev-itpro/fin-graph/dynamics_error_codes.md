---
title: Error Codes | Microsoft Docs
description: List of error codes.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/25/2017
ms.author: solsen
---

# Error Codes
The following table lists the error codes for the various exceptions in the web service response for ODataV4.

## Error code categorization
The error codes in the table below can be divided into the following categories and described as follows:

|Category|Description|Resolution|
|--------|-----------|----------|
|BadRequest_*|Will typically be an error in the forming of the request or an error accessing the service.|Resolve the bug in the forming of the request.|
|Authentication_*|An error authenticating to the service.|Attempt to use different credentials.|
|Authorization_*|The authenticated identity does not have the correct permissions.|Attempt operation using different credentials.|
|Internal_*|Typically this is an internal error in the application on the server or data integrity issue. For example, the Dynamics NAV instance cannot communicate with the SQL Server.|Attempt the operation again. Resolve data issues.|
|Application_*|Typically an application logic error.|Request is made again with updated data.|


## Error codes

|Exception Type |Error Message |Error Code|
|---------------|--------------|----------|
|ODataArgumentException|An incompatible property definition<br> already exists for `'Allowed_Companies_0.Name'`|BadRequest_InvalidRequestUrl|
|ODataNotFoundException|Bad Request - Error in query syntax|BadRequest_NotFound|
|ODataNotFoundException|Expression expected at position 153 in '(AAMkAGY2ZTQwODIwLTNkOWYtN<br>DY3NC04N2JkLTE3MDEyNzlkM2VkOQBGAAAAAAD<br>FMnbflwH_RqlNoMYdjhvBBwCepO6AHq7GRJ13ldPngx5BAAAAAAEcAA<br>CepO6AHq7GRJ13ldPngx5BAAAGZyTmAAA=)'|BadRequest_NotFound|
|ODataNotFoundException|'\|' or ',' expected at position 3 in (GUID)|BadRequest_NotFound|
|ODataResourceNotFoundException|Resource not found for the segment `'OfficeAppResourceRegistrations'` <br>multiple segment errors (Company, v1.0, nativeInvoicingSalesInvoices,metadata,<br>nativeInvoicingItems, companies,company etc.)|BadRequest_ResourceNotFound|
|ODataInvalidOperationException|Control `'Last Date Modified'` is read-only|BadRequest_InvalidOperation|
|ODataBadRequestException|Invalid Request Body|BadRequest|
|ODataBadRequestException|Unable to convert value to Date|BadRequest|
|ODataBadRequestInvalidTokenException|Could not validate the client concurrency token required by the service.<br> Please provide a valid token in the client request.|BadRequest_InvalidToken|
|ODataBadRequestNullFieldException|Field `'taxable'` must not be blank or empty.|BadRequest_RequiredParamNotProvided|
|ODataConflictException|Another user has already changed the record.|Request_EntityChanged|
|ODataMethodNotAllowedException|`'POST'` requests for `'companies'` of EdmType `'Entity'` <br>are not allowed within Microsoft Dynamics NAV OData web services.|BadRequest_MethodNotAllowed|
|ODataNotImplementedException|Entity does not support bound actions|BadRequest_MethodNotImplemented|
|NavCSideDataException|There is no Cust. Ledger Entry within the filter.|Internal_DataNotFoundFilter|
|NavCSideRecordNotFoundException|The Acc. Sched. KPI Web srv. Setup does not exist.<br> Identification fields and values: Primary Key=''|Internal_RecordNotFound|
|NavCSideValidateTableRelationException|The field Account No. of table Gen. Journal Line contains a value (ABL001)<br> that cannot be found in the related table (Vendor).|Internal_InvalidTableRelation|
|NavCSideException|Cannot establish a connection to the SQL Server/Database. |Internal_ServerError|
|NavCSideDuplicateKeyException|The Attachment Entity Buffer already exists. <br>Identification fields and values: Document Id=<br>'{DAC3AB2F-5FEA-4AD2-A663-EF832F270A7B}',Id='<br>{00000000-0000-0000-0000-000000000000}' |Internal_EntityWithSameKeyExists|
|NavCompanyNotFoundException|Cannot process the request because the default company cannot be found. <br>You can specify a default company in the service configuration file, <br>or specify one for each tenant, or you can add a query string in the form of "company=[name]". <br>You can see the available companies by accessing the default OData web service, Company. <br>For more information, see "OData Web Services" in Help|Internal_CompanyNotFound|
|NavTenantNotAccessibleException|The tenant 'msca1a7355t05263373' is not accessible|Internal_TenantUnavailable|
|NavNCLDialogException|You cannot delete Item 1000 because there is at least one <br>outstanding Sales Quote that includes this item.|Application_DialogException|
|NavNCLDialogException|A customerNumber or a customerID must be provided.|Application_DialogException| 
|NavNCLDialogException|You may not enter numbers manually. If you want to enter numbers manually,<br> please activate Manual Nos. in No. Series FA.|Application_DialogException| 
|NavNCLDialogException|You are not allowed to apply and post an entry to an entry<br> with an earlier posting date.|Application_DialogException| 
|NavNCLDialogException|The "amount" should be a negative number.|Application_DialogException| 
|NavNCLEvaluateException|The value "Depreciation" cannot be evaluated into type Option.|Application_EvaluateException|
|NavNCLStringLengthExceededException|The length of the string is 57, but it must be less than or <br>equal to 50 characters. Value: JACKSBORO PUMP & SPECIALTY <br>BRIDGEPORT PUMP & SUPPLY, INC. |Application_StringExceededLength|
|NavNCLInvalidGuidFormatException|Invalid format of GUID string. The correct format of the GUID <br>string is: CDEF7890-ABCD-0123-1234-567890ABCDEF where<br> 0-9, A-F symbolizes hexadecimal digits.|Application_InvalidGUID|
|NavNCLCallbackNotAllowedException|Microsoft Sync 365 for fin Data services attempted to issue a client callback <br>to show a confirmation dialog box. We found an item with the description |Application_CallbackNotAllowed|
|NavFilterException|The filter `"='SELLACRE24_W%2FOORINGS'"` is not valid for the No. field<br> on the Item table. The length of the string is 22, but it must be less than or equal to 20 characters.<br> Value: `SELLACRE24_W%2FOORINGS`|Application_FilterErrorException|
|NavTestFieldException|Balance must be equal to '0'  in G/L Account: No.=10100. <br>Current value is '1,638.4'. Customer Posting Group must have a value<br> in Customer: No.=C00690. It cannot be zero or empty.|Application_FieldValidationException|
|NavTestFieldException|Customer Posting Group must have a value in Customer:<br> No.=C00690. It cannot be zero or empty.|Application_FieldValidationException|
|NavInvalidCredentialException|The server has rejected the client credentials|Authenciation_InvalidCredentials|
|Any|Any|Unknown|

## See also
[Working with Dynamics 365 for Financials in Microsoft Graph](resources/dynamics_overview.md) 
