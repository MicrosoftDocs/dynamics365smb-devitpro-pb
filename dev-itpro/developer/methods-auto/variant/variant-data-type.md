---
title: "Variant Data Type"
description: "Represents an AL variable object."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Variant Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents an AL variable object. The AL variant data type can contain many AL data types.



The following methods are available on instances of the Variant data type.

|Method name|Description|
|-----------|-----------|
|[IsAction()](variant-isaction-method.md)|Indicates whether an AL variant contains an Action variable.|
|[IsAutomation()](variant-isautomation-method.md)|Indicates whether an AL variant contains an Automation variable.|
|[IsBigInteger()](variant-isbiginteger-method.md)|Indicates whether an AL variant contains a BigInteger variable.|
|[IsBinary()](variant-isbinary-method.md)|Indicates whether an AL variant contains a Binary variable.|
|[IsBoolean()](variant-isboolean-method.md)|Indicates whether an AL variant contains a Boolean variable.|
|[IsByte()](variant-isbyte-method.md)|Indicates whether an AL variant contains a Byte data type variable.|
|[IsChar()](variant-ischar-method.md)|Indicates whether an AL variant contains a Char variable.|
|[IsClientType()](variant-isclienttype-method.md)|Indicates whether an AL variant contains a ClientType variable.|
|[IsCode()](variant-iscode-method.md)|Indicates whether an AL variant contains a Code variable.|
|[IsCodeunit()](variant-iscodeunit-method.md)|Indicates whether an AL variant contains a Codeunit variable.|
|[IsDataClassification()](variant-isdataclassification-method.md)|Indicates whether an AL variant contains a DataClassification variable.|
|[IsDataClassificationType()](variant-isdataclassificationtype-method.md)|Indicates whether an AL variant contains a DataClassification variable.|
|[IsDate()](variant-isdate-method.md)|Indicates whether an AL variant contains a Date variable.|
|[IsDateFormula()](variant-isdateformula-method.md)|Indicates whether an AL variant contains a DateFormula variable.|
|[IsDateTime()](variant-isdatetime-method.md)|Indicates whether an AL variant contains a DateTime variable.|
|[IsDecimal()](variant-isdecimal-method.md)|Indicates whether an AL variant contains a Decimal variable.|
|[IsDefaultLayout()](variant-isdefaultlayout-method.md)|Indicates whether an AL variant contains a DefaultLayout variable.|
|[IsDotNet()](variant-isdotnet-method.md)|Indicates whether an AL variant contains a DotNet variable.|
|[IsDuration()](variant-isduration-method.md)|Indicates whether an AL variant contains a Duration variable.|
|[IsExecutionMode()](variant-isexecutionmode-method.md)|Indicates whether an AL variant contains an ExecutionMode variable.|
|[IsFieldRef()](variant-isfieldref-method.md)|Indicates whether an AL variant contains a FieldRef variable.|
|[IsFile()](variant-isfile-method.md)|Indicates whether an AL variant contains a File variable.|
|[IsFilterPageBuilder()](variant-isfilterpagebuilder-method.md)|Indicates whether an AL variant contains a FilterPageBuilder variable.|
|[IsGuid()](variant-isguid-method.md)|Indicates whether an AL variant contains a Guid variable.|
|[IsInStream()](variant-isinstream-method.md)|Indicates whether an AL variant contains an InStream variable.|
|[IsInteger()](variant-isinteger-method.md)|Indicates whether an AL variant contains an Integer variable.|
|[IsJsonArray()](variant-isjsonarray-method.md)|Indicates whether an AL variant contains a JsonArray variable.|
|[IsJsonObject()](variant-isjsonobject-method.md)|Indicates whether an AL variant contains a JsonObject variable.|
|[IsJsonToken()](variant-isjsontoken-method.md)|Indicates whether an AL variant contains a JsonToken variable.|
|[IsJsonValue()](variant-isjsonvalue-method.md)|Indicates whether an AL variant contains a JsonValue variable.|
|[IsNotification()](variant-isnotification-method.md)|Indicates whether an AL variant contains a Notification variable.|
|[IsObjectType()](variant-isobjecttype-method.md)|Indicates whether an AL variant contains an ObjectType variable.|
|[IsOption()](variant-isoption-method.md)|Indicates whether an AL variant contains an Option variable.|
|[IsOutStream()](variant-isoutstream-method.md)|Indicates whether an AL variant contains an OutStream variable.|
|[IsRecord()](variant-isrecord-method.md)|Indicates whether an AL variant contains a Record variable.|
|[IsRecordId()](variant-isrecordid-method.md)|Indicates whether an AL variant contains a RecordId variable.|
|[IsRecordRef()](variant-isrecordref-method.md)|Indicates whether an AL variant contains a RecordRef variable.|
|[IsReportFormat()](variant-isreportformat-method.md)|Indicates whether an AL variant contains a ReportFormat variable.|
|[IsSecurityFiltering()](variant-issecurityfiltering-method.md)|Indicates whether an AL variant contains a SecurityFiltering variable.|
|[IsTableConnectionType()](variant-istableconnectiontype-method.md)|Indicates whether an AL variant contains a TableConnectionType variable.|
|[IsTestPermissions()](variant-istestpermissions-method.md)|Indicates whether an AL variant contains a TestPermissions variable.|
|[IsText()](variant-istext-method.md)|Indicates whether an AL variant contains a Text variable.|
|[IsTextBuilder()](variant-istextbuilder-method.md)|Indicates whether an AL variant contains a TextBuilder variable.|
|[IsTextConstant()](variant-istextconstant-method.md)|Indicates whether an AL variant contains a Text constant.|
|[IsTextEncoding()](variant-istextencoding-method.md)|Indicates whether an AL variant contains a TextEncoding variable.|
|[IsTime()](variant-istime-method.md)|Indicates whether an AL variant contains a Time variable.|
|[IsTransactionType()](variant-istransactiontype-method.md)|Indicates whether an AL variant contains a TransactionType variable.|
|[IsWideChar()](variant-iswidechar-method.md)|Indicates whether an AL variant contains a WideChar variable.|
|[IsXmlAttribute()](variant-isxmlattribute-method.md)|Indicates whether an AL variant contains an XmlAttribute variable.|
|[IsXmlAttributeCollection()](variant-isxmlattributecollection-method.md)|Indicates whether an AL variant contains an XmlAttributeCollection variable.|
|[IsXmlCData()](variant-isxmlcdata-method.md)|Indicates whether an AL variant contains an XmlCData variable.|
|[IsXmlComment()](variant-isxmlcomment-method.md)|Indicates whether an AL variant contains an XmlComment variable.|
|[IsXmlDeclaration()](variant-isxmldeclaration-method.md)|Indicates whether an AL variant contains an XmlDeclaration variable.|
|[IsXmlDocument()](variant-isxmldocument-method.md)|Indicates whether an AL variant contains an XmlDocument variable.|
|[IsXmlDocumentType()](variant-isxmldocumenttype-method.md)|Indicates whether an AL variant contains an XmlDocumentType variable.|
|[IsXmlElement()](variant-isxmlelement-method.md)|Indicates whether an AL variant contains an XmlElement variable.|
|[IsXmlNamespaceManager()](variant-isxmlnamespacemanager-method.md)|Indicates whether an AL variant contains an XmlNamespaceManager variable.|
|[IsXmlNameTable()](variant-isxmlnametable-method.md)|Indicates whether an AL variant contains an XmlNameTable variable.|
|[IsXmlNode()](variant-isxmlnode-method.md)|Indicates whether an AL variant contains an XmlNode variable.|
|[IsXmlNodeList()](variant-isxmlnodelist-method.md)|Indicates whether an AL variant contains an XmlNodeList variable.|
|[IsXmlProcessingInstruction()](variant-isxmlprocessinginstruction-method.md)|Indicates whether an AL variant contains an XmlProcessingInstruction variable.|
|[IsXmlReadOptions()](variant-isxmlreadoptions-method.md)|Indicates whether an AL variant contains an XmlReadOptions variable.|
|[IsXmlText()](variant-isxmltext-method.md)|Indicates whether an AL variant contains an XmlText variable.|
|[IsXmlWriteOptions()](variant-isxmlwriteoptions-method.md)|Indicates whether an AL variant contains an XmlWriteOptions variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  