---
title: "System Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System Data Type
Is a complex data type.


The following methods are available on the System data type.


|Method name|Description|
|-----------|-----------|
|[Round(Decimal [, Decimal] [, String])](system-round-method.md)|Rounds the value of a numeric variable.|
|[Abs(Decimal)](system-abs-method.md)|Calculates the absolute value of a number (Decimal, Integer or BigInteger). ABS always returns a positive numeric value or zero.|
|[Power(Decimal, Decimal)](system-power-method.md)|Raises a number to a power. For example, you can use this method to square the number 2 to get the result of 4.|
|[Randomize([Integer])](system-randomize-method.md)|Generates a set of random numbers from which the RANDOM method (Integer) will select a random number.|
|[Random(Integer)](system-random-method.md)|Returns a pseudo-random number.|
|[Today()](system-today-method.md)|Gets the current date set in the operating system.|
|[Time()](system-time-method.md)|Gets the current time from the operating system.|
|[WorkDate([Date])](system-workdate-method.md)|Gets and sets the work date for the current session.|
|[CalcDate(String [, Date])](system-calcdate-string-date-method.md)|Calculates a new date that is based on a date expression and a reference date.|
|[CalcDate(DateFormula [, Date])](system-calcdate-dateformula-date-method.md)|Calculates a new date that is based on a date expression and a reference date.|
|[NormalDate(Date)](system-normaldate-method.md)|Gets the regular date (instead of the closing date) for the argument Date.|
|[ClosingDate(Date)](system-closingdate-method.md)|Gets the closing date for a Date Data Type.|
|[Date2DMY(Date, Integer)](system-date2dmy-method.md)|Gets the day, month, or year of a Date Data Type.|
|[Date2DWY(Date, Integer)](system-date2dwy-method.md)|Gets the day of the week, week number, or year of a Date Data Type.|
|[DMY2Date(Integer [, Integer] [, Integer])](system-dmy2date-method.md)|Gets a Date object based on a day, month, and year.|
|[DWY2Date(Integer [, Integer] [, Integer])](system-dwy2date-method.md)|Gets a Date that is based on a week day, a week, and a year.|
|[Hyperlink(String)](system-hyperlink-method.md)|Passes a URL as an argument to an Internet browser, such as Windows Internet Explorer.|
|[Sleep(Integer)](system-sleep-method.md)|Returns control to the operating system for a specified time.|
|[GuiAllowed()](system-guiallowed-method.md)|Checks whether the AL code can show any information on the screen.|
|[ArrayLen(Array of [Any] [, Integer])](system-arraylen-method.md)|Returns the total number of elements in an array or the number of elements in a specific dimension.|
|[CompressArray(Array of [String])](system-compressarray-method.md)|Moves all non-empty strings (text) in an array to the beginning of the array. The resulting StringArray has the same number of elements as the input array, but empty entries appear at the end of the array.|
|[CopyArray(Array of [Any], Array of [Any], Integer [, Integer])](system-copyarray-method.md)|Copies one or more elements in an array to a new array.|
|[Clear(var Array of [Any])](system-clear-joker-method.md)|Clears the value of a single variable. Also, it clears all the filters that were set if the variable is a record and resets the key to the primary key and the company on a record variable.|
|[Clear(var Any)](system-clear-joker-method.md)|Clears the value of a single variable. Also, it clears all the filters that were set if the variable is a record and resets the key to the primary key and the company on a record variable.|
|[ClearAll()](system-clearall-method.md)|Clears all internal variables (except REC variables), keys, and filters in the object and in any associated objects, such as reports, pages, codeunits, and so on that contain AL code.|
|[Evaluate(var Any, String [, Integer])](system-evaluate-method.md)|Evaluates a string representation of a value into its typical representation. The result is assigned to a variable.|
|[Format(Any [, Integer] [, Integer])](system-format-joker-integer-integer-method.md)|Formats a value into a string.|
|[Format(Any, Integer, String)](system-format-joker-integer-string-method.md)|Formats a value into a string.|
|[WindowsLanguage()](system-windowslanguage-method.md)|Gets the current Windows language setting.|
|[GlobalLanguage([Integer])](system-globallanguage-method.md)|Gets and sets the current global language setting.|
|[DaTi2Variant(Date, Time)](system-dati2variant-method.md)|Creates a variant that contains an encapsulation of a COM VT\\_DATE.|
|[Variant2Date(Variant)](system-variant2date-method.md)|Gets a date from a variant.|
|[Variant2Time(Variant)](system-variant2time-method.md)|Gets a time from a variant.|
|[CopyStream(OutStream, InStream [, Integer])](system-copystream-method.md)|Copies the information that is contained in an InStream to an OutStream.|
|[CreateGuid()](system-createguid-method.md)|Creates a new unique GUID. The value can then be assigned to a GUID data type or a text data type. Use the text data type if you want to compare the GUID to another text string.|
|[CurrentDateTime()](system-currentdatetime-method.md)|Gets the current DateTime.|
|[IsNullGuid(Guid)](system-isnullguid-method.md)|Indicates whether a value has been assigned to a GUID. A null GUID that consists only of zeros is valid but must never be used for references.|
|[RoundDateTime(DateTime [, BigInteger] [, String])](system-rounddatetime-method.md)|Rounds a DateTime.|
|[CreateDateTime(Date, Time)](system-createdatetime-method.md)|Creates a DateTime object from a date and a time.|
|[DT2Date(DateTime)](system-dt2date-method.md)|Gets the date part of a DateTime object.|
|[DT2Time(DateTime)](system-dt2time-method.md)|Gets the time part of a DateTime object.|
|[GetLastErrorText()](system-getlasterrortext-method.md)|Gets the last error that occurred in the debugger.|
|[GetLastErrorCode()](system-getlasterrorcode-method.md)|Gets the classification of the last error that occurred.|
|[GetLastErrorObject()](system-getlasterrorobject-method.md)|Gets the last System.Exception object that occurred.|
|[ClearLastError()](system-clearlasterror-method.md)|Removes the last error message from memory.|
|[ApplicationPath()](system-applicationpath-method.md)|Returns the path of the directory where the executable file for the product is installed.|
|[TemporaryPath()](system-temporarypath-method.md)|Gets the path of the directory where the temporary file is stored.|
|[IsServiceTier()](system-isservicetier-method.md)|Gets a value indicating whether the runtime is a service tier.|
|[ExportObjects(String, var Record [, Integer])](system-exportobjects-method.md)|Exports application objects to a file.|
|[ImportObjects(String [, Integer])](system-importobjects-method.md)|Imports application objects from a file.|
|[IsNull(DotNet)](system-isnull-method.md)|Gets a value indicating whether a DotNet object has been created or not.|
|[GetLastErrorCallStack()](system-getlasterrorcallstack-method.md)|Gets the call stack from where the last error occurred.|
|[CodeCoverageLog([Boolean] [, Boolean])](system-codecoveragelog-method.md)|Starts and stops the logging of code. You can also use this method to retrieve the current logging status.|
|[CodeCoverageInclude(var Record)](system-codecoverageinclude-method.md)|Includes the code that has been logged.|
|[CodeCoverageRefresh()](system-codecoveragerefresh-method.md)|Refreshes the code that has been logged.|
|[CodeCoverageLoad()](system-codecoverageload-method.md)|Loads the code that has been logged.|
|[GetDotNetType(Any)](system-getdotnettype-method.md)|Gets the System.Type that corresponds to the given value.|
|[CanLoadType(DotNet)](system-canloadtype-method.md)|Tests if the specified .NET Framework type can be loaded.|
|[CaptionClassTranslate(String)](system-captionclasstranslate-method.md)|Returns a translated version of the caption string. The string is translated to the current local language.|
|[GetUrl(ClientType [, String] [, ObjectType] [, Integer] [, Record] [, Boolean])](system-geturl-clienttype-string-objecttype-integer-table-boolean-method.md)| Generates a URL for the specified client target that is based on the configuration of the server instance. If the code runs in a multitenant deployment architecture, the generated URL will automatically apply to the tenant ID of the current user.|
|[GetUrl(ClientType, String, ObjectType, Integer, RecordRef [, Boolean])](system-geturl-clienttype-string-objecttype-integer-recordref-boolean-method.md)|Generates a URL for the specified client target that is based on the configuration of the server instance. If the code runs in a multitenant deployment architecture, the generated URL will automatically apply to the tenant ID of the current user.|
|[Encrypt(String)](system-encrypt-method.md)|Takes a string as input and returns the encrypted value of the string.|
|[Decrypt(String)](system-decrypt-method.md)|Takes a string as input and returns the decrypted value of the string.|
|[ExportEncryptionKey(String)](system-exportencryptionkey-method.md)|Returns a password protected temporary filepath containing the encryption key. When encrypting or decrypting data in Dynamics 365 Business Central, an encryption key is used. A single key is used per tenant and every tenant will have a different key. Keys can be exported to a file which may be necessary in the case of upgrading or migrating a system from one set of hardware to another. The EXPORTENCRYPTIONKEY method allows an administrator to specify a destination file for the key and specify a password protection for the file.|
|[ImportEncryptionKey(String, String)](system-importencryptionkey-method.md)|Points to a password protected file that contains the key on the current server. When encrypting or decrypting data in Dynamics 365 Business Central, an encryption key is used. A single key is used per tenant, and every tenant will have a different key. Keys can be created or imported if one exists already, as may be the case if upgrading or migrating a system from one set of hardware to another. The IMPORTENCRYPTIONKEY method allows an administrator to specify a file (password protected) which contains a key and imports it to the current Dynamics 365 Business Central service.|
|[CreateEncryptionKey()](system-createencryptionkey-method.md)|Creates an encryption key for the current tenant.|
|[DeleteEncryptionKey()](system-deleteencryptionkey-method.md)|Deletes an encryption key for the current tenant.|
|[EncryptionKeyExists()](system-encryptionkeyexists-method.md)|Checks whether an encryption key for the current tenant is present on the server tenant.|
|[EncryptionEnabled()](system-encryptionenabled-method.md)|Checks if the tenant is configured to allow encryption.|
|[GetDocumentUrl(Guid)](system-getdocumenturl-method.md)|Gets the URL for the specified temporary media object ID.|
|[ImportStreamWithUrlAccess(InStream, String [, Integer])](system-importstreamwithurlaccess-method.md)|Imports an object into a media container to be used in a temporary URL with a default expiration time.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  