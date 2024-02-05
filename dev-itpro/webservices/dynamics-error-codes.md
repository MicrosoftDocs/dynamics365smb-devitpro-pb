---
title: Troubleshooting REST API/OData calls
description: Learn about how to troubleshoot Business Central web service errors of types REST API or OData.
documentationcenter: ''
author: SusanneWindfeldPedersen
ms.topic: article
ms.devlang: al
ms.date: 04/01/2021
ms.author: solsen
---

# Troubleshooting REST API/OData calls

When troubleshooting failed REST API/OData calls, you have a number of tools/techniques available:
- telemetry 
- HTTP status codes 
- OData error codes 
- the AL debugger 

## Troubleshoot failed REST API/OData calls with telemetry

[!INCLUDE [prod_short](../includes/prod_short.md)] telemetry on REST API/OData web service calls have two important dimensions to troubleshoot failed web service calls: *httpStatusCode* and *failureReason*. The *httpStatusCode* dimension stores the HTTP return code provided by the [!INCLUDE[prod_short](../includes/prod_short.md)] server. The *failureReason* dimension stores the exception types described above. These dimensions are not available in telemetry for SOAP calls.

> [!TIP]
> The custom dimension *category* hold information about the type of endpoint (REST API, OData, or SOAP) being called. 

For more information about web services telemetry (including KQL code samples), see [Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md).


## Troubleshoot failed REST API/OData calls with HTTP status codes
When you call a web service endpoint, either a [!INCLUDE[prod_short](../includes/prod_short.md)] REST API or an OData-enabled page/query/codeunit, you get an HTTP status code as part of the response. All HTTP status codes that start with 4 (sometimes also written 4xx) are classified as client errors, and it's your responsibility to react on these errors and fix them in your code. 

[!INCLUDE[on-prem-ws-off-405-note](../includes/include-on-prem-ws-off-405-note.md)]

For more information, see [Troubleshooting web service errors with HTTP status codes](web-service-troubleshooting.md#http-status-codes).


## Error messages and error codes for REST API/OData failures

If a call to a REST API or OData endpoint fails, the [!INCLUDE[prod_short](../includes/prod_short.md)] server will return an error message and an error code in the response. Error codes can be divided into the following categories and described as follows:

|If you see an error code like this...|It is because...| Do this to resolve the issue...|
|--------|-----------|----------|
|BadRequest_*|Will typically be an error in the forming of the request or an error accessing the service.|Resolve the bug in the forming of the request.|
|Authentication_*|An error authenticating to the service.|Attempt to use different credentials.|
|Authorization_*|The authenticated identity does not have the correct permissions.|Attempt operation using different credentials.|
|Internal_*|Typically this is an internal error in the application on the server or data integrity issue. For example, the [!INCLUDE[prod_short](../includes/prod_short.md)] server cannot communicate with the SQL Server.|Attempt the operation again. Resolve data issues.|
|Application_*|Typically an application logic error.|Request is made again with updated data.|


The following table explains how the OData error codes/messages translate to exceptions thrown by the AL runtime.

|AL runtime exception type |OData error message |OData error Code|
|---------------|--------------|----------|
|ODataArgumentException|An incompatible property definition<br> already exists for `'Allowed_Companies_0.Name'`|BadRequest_InvalidRequestUrl|
|ODataNotFoundException|Bad Request - Error in query syntax|BadRequest_NotFound|
|ODataNotFoundException|Expression expected at position 153 in '(AAMkAGY2ZTQwODIwLTNkOWYtN<br>DY3NC04N2JkLTE3MDEyNzlkM2VkOQBGAAAAAAD<br>FMnbflwH_RqlNoMYdjhvBBwCepO6AHq7GRJ13ldPngx5BAAAAAAEcAA<br>CepO6AHq7GRJ13ldPngx5BAAAGZyTmAAA=)'|BadRequest_NotFound|
|ODataNotFoundException|'\|' or ',' expected at position 3 in (GUID)|BadRequest_NotFound|
|ODataResourceNotFoundException|Resource not found for the segment `'OfficeAppResourceRegistrations'` <br>multiple segment errors (Company, v2.0, nativeInvoicingSalesInvoices,metadata,<br>nativeInvoicingItems, companies,company etc.)|BadRequest_ResourceNotFound|
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
|NavInvalidCredentialException|The server has rejected the client credentials|Authentication_InvalidCredentials|
|Any|Any|Unknown|


## Debugging code called from a web service endpoint

This topic is covered in the general troubleshooting guide for web services. For more information, see [Debugging code called from a web service endpoint](web-service-troubleshooting.md#debugging-code-called-from-a-web-service-endpoint).


## Which IP addresses or ranges does my environment use?

This topic is covered in the general troubleshooting guide for web services. For more information, see [Which IP addresses or ranges does my environment use?](web-service-troubleshooting.md#which-ip-addresses-or-ranges-does-my-environment-use).


## It works in my sandbox but not in production

This topic is covered in the general troubleshooting guide for web services. For more information, see [It works in my sandbox but not in production](web-service-troubleshooting.md#it-works-in-my-sandbox-but-not-in-production).


## See also

[Troubleshoot web service errors](web-service-troubleshooting.md)  
[Web service performance](web-service-performance.md)  
[Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md) 
[Web service telemetry](web-service-telemetry.md)  
