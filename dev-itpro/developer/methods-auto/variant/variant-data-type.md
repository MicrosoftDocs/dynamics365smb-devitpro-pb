---
title: "Variant Data Type"
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
# Variant Data Type
Represents an AL variable object. The AL variant data type can contain many AL data types.



The following methods are available on instances of the Variant data type.

|Method name|Description|
|-----------|-----------|
|[IsRecord()](variant-isrecord-method.md)|Indicates whether an AL variant contains a Record variable.|
|[IsFile()](variant-isfile-method.md)|Indicates whether an AL variant contains a File variable.|
|[IsAction()](variant-isaction-method.md)|Indicates whether an AL variant contains an Action variable.|
|[IsCodeunit()](variant-iscodeunit-method.md)|Indicates whether an AL variant contains a Codeunit variable.|
|[IsAutomation()](variant-isautomation-method.md)|Indicates whether an AL variant contains an Automation variable.|
|[IsBoolean()](variant-isboolean-method.md)|Indicates whether an AL variant contains a Boolean variable.|
|[IsOption()](variant-isoption-method.md)|Indicates whether an AL variant contains an Option variable.|
|[IsInteger()](variant-isinteger-method.md)|Indicates whether an AL variant contains an Integer variable.|
|[IsDecimal()](variant-isdecimal-method.md)|Indicates whether an AL variant contains a Decimal variable.|
|[IsChar()](variant-ischar-method.md)|Indicates whether an AL variant contains a Char variable.|
|[IsText()](variant-istext-method.md)|Indicates whether an AL variant contains a Text variable.|
|[IsCode()](variant-iscode-method.md)|Indicates whether an AL variant contains a Code variable.|
|[IsDate()](variant-isdate-method.md)|Indicates whether an AL variant contains a Date variable.|
|[IsTime()](variant-istime-method.md)|Indicates whether an AL variant contains a Time variable.|
|[IsBinary()](variant-isbinary-method.md)|Indicates whether an AL variant contains a Binary variable.|
|[IsDateFormula()](variant-isdateformula-method.md)|Indicates whether an AL variant contains a DateFormula variable.|
|[IsTransactionType()](variant-istransactiontype-method.md)|Indicates whether an AL variant contains a TransactionType variable.|
|[IsInStream()](variant-isinstream-method.md)|Indicates whether an AL variant contains an InStream variable.|
|[IsOutStream()](variant-isoutstream-method.md)|Indicates whether an AL variant contains an OutStream variable.|
|[IsDotNet()](variant-isdotnet-method.md)|Indicates whether an AL variant contains a DotNet variable.|
|[IsWideChar()](variant-iswidechar-method.md)|Indicates whether an AL variant contains a WideChar variable.|
|[IsExecutionMode()](variant-isexecutionmode-method.md)|Indicates whether an AL variant contains an ExecutionMode variable.|
|[IsDateTime()](variant-isdatetime-method.md)|Indicates whether an AL variant contains a DateTime variable.|
|[IsGuid()](variant-isguid-method.md)|Indicates whether an AL variant contains a Guid variable.|
|[IsRecordId()](variant-isrecordid-method.md)|Indicates whether an AL variant contains a RecordId variable.|
|[IsDuration()](variant-isduration-method.md)|Indicates whether an AL variant contains a Duration variable.|
|[IsBigInteger()](variant-isbiginteger-method.md)|Indicates whether an AL variant contains a BigInteger variable.|
|[IsRecordRef()](variant-isrecordref-method.md)|Indicates whether an AL variant contains a RecordRef variable.|
|[IsFieldRef()](variant-isfieldref-method.md)|Indicates whether an AL variant contains a FieldRef variable.|
|[IsFilterPageBuilder()](variant-isfilterpagebuilder-method.md)|Indicates whether an AL variant contains a FilterPageBuilder variable.|
|[IsClientType()](variant-isclienttype-method.md)|Indicates whether an AL variant contains a ClientType variable.|
|[IsObjectType()](variant-isobjecttype-method.md)|Indicates whether an AL variant contains an ObjectType variable.|
|[IsTextEncoding()](variant-istextencoding-method.md)|Indicates whether an AL variant contains a TextEncoding variable.|
|[IsReportFormat()](variant-isreportformat-method.md)|Indicates whether an AL variant contains a RecordFormat variable.|
|[IsDefaultLayout()](variant-isdefaultlayout-method.md)|Indicates whether an AL variant contains a DefaultLayout variable.|
|[IsTableConnectionType()](variant-istableconnectiontype-method.md)|Indicates whether an AL variant contains a TableConnectionType variable.|
|[IsSecurityFiltering()](variant-issecurityfiltering-method.md)|Indicates whether an AL variant contains a SecurityFiltering variable.|
|[IsDataClassificationType()](variant-isdataclassificationtype-method.md)|Indicates whether a AL variant contains a DataClassification variable.|
|[IsTextConstant()](variant-istextconstant-method.md)|Indicates whether an AL variant contains a Text constant.|
|[IsByte()](variant-isbyte-method.md)|Indicates whether an AL variant contains a Byte data type variable.|
|[IsNotification()](variant-isnotification-method.md)|Indicates whether an AL variant contains a Notification variable.|
|[IsTestPermissions()](variant-istestpermissions-method.md)|Indicates whether an AL variant contains a TestPermissions variable.|
|[IsJsonArray()](variant-isjsonarray-method.md)|Indicates whether an AL variant contains a JsonArray variable.|
|[IsJsonObject()](variant-isjsonobject-method.md)|Indicates whether an AL variant contains a JsonObject variable.|
|[IsJsonToken()](variant-isjsontoken-method.md)|Indicates whether an AL variant contains a JsonToken variable.|
|[IsJsonValue()](variant-isjsonvalue-method.md)|Indicates whether an AL variant contains a JsonValue variable.|
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
|[IsTextBuilder()](variant-istextbuilder-method.md)|Indicates whether an AL variant contains a TextBuilder variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  