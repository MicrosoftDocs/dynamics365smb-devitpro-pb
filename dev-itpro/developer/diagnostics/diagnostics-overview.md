---
title: "AL Diagnostics"
description: ""
ms.author: solsen
ms.custom: na
ms.date: 08/04/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AL Compiler Diagnostics


|Id|Message|Default Severity|
|--|-----------|----------------|
|[AL0100](diagnostic-al100.md)|Unterminated multiline comment.|Error|
|[AL0101](diagnostic-al101.md)|Constant value '{0}' is outside the range for a Decimal.|Error|
|[AL0102](diagnostic-al102.md)|Constant value '{0}' is outside the range for a BigInteger.|Error|
|[AL0103](diagnostic-al103.md)|Constant value '{0}' is outside the range for an Integer.|Error|
|[AL0104](diagnostic-al104.md)|Syntax error, '{0}' expected.|Error|
|[AL0105](diagnostic-al105.md)|Syntax error, identifier expected; '{1}' is a keyword.|Error|
|[AL0106](diagnostic-al106.md)|Syntax error, 'TO' or 'DOWNTO' expected.|Error|
|[AL0107](diagnostic-al107.md)|Syntax error, identifier expected.|Error|
|[AL0108](diagnostic-al108.md)|Indexers must have at least one value.|Error|
|[AL0109](diagnostic-al109.md)|Unexpected token.|Error|
|[AL0110](diagnostic-al110.md)|Orphaned ELSE statement. This is most likely because of an unnecessary semicolon placed just before the ELSE keyword.|Error|
|[AL0111](diagnostic-al111.md)|Semicolon expected.|Error|
|[AL0112](diagnostic-al112.md)|{0} is not a valid attribute.|Error|
|[AL0113](diagnostic-al113.md)|At least one dimension must be specified.|Error|
|[AL0114](diagnostic-al114.md)|Syntax error, integer literal expected.|Error|
|[AL0115](diagnostic-al115.md)|Object type expected.|Error|
|[AL0116](diagnostic-al116.md)|Invalid value for '{0}'. Allowed values are '{1}'.|Error|
|[AL0117](diagnostic-al117.md)|Illegal statement. Only assignment and method invocation can be used as a statement.|Error|
|[AL0118](diagnostic-al118.md)|The name '{0}' does not exist in the current context.|Error|
|[AL0119](diagnostic-al119.md)|The parameter name '{0}' is already defined.|Error|
|[AL0120](diagnostic-al120.md)|A local or parameter named '{0}' cannot be declared in this scope because that name is used in an enclosing local scope to define a local or parameter.|Error|
|[AL0121](diagnostic-al121.md)|The variable name '{0}' is already defined.|Error|
|[AL0122](diagnostic-al122.md)|Cannot implicitly convert type '{0}' to '{1}'.|Error|
|[AL0123](diagnostic-al123.md)|The return value name '{0}' is already defined.|Error|
|[AL0124](diagnostic-al124.md)|The property '{0}' cannot be used in this context.|Error|
|[AL0125](diagnostic-al125.md)|Method name expected.|Error|
|[AL0126](diagnostic-al126.md)|No overload for method '{0}' takes {1} arguments. Candidates: {2}.|Error|
|[AL0127](diagnostic-al127.md)|Member '{0}' cannot be used like a method.|Error|
|[AL0128](diagnostic-al128.md)|Language identifier expected.|Error|
|[AL0129](diagnostic-al129.md)|The left-hand side of an assignment must be a variable or field.|Error|
|[AL0130](diagnostic-al130.md)|A 'var' argument must be an assignable variable.|Error|
|[AL0131](diagnostic-al131.md)|The property CharAllowed must be specified in pairs of characters. The first character in the pair must be equal to or less than the second.|Error|
|[AL0132](diagnostic-al132.md)|'{0}' does not contain a definition for '{1}'.|Error|
|[AL0133](diagnostic-al133.md)|Argument {0}: cannot convert from '{1}' to '{2}'.|Error|
|[AL0134](diagnostic-al134.md)|'{0}' is not recognized as a valid type.|Error|
|[AL0135](diagnostic-al135.md)|There is no argument given that corresponds to the required formal parameter '{0}' of '{1}'.|Error|
|[AL0136](diagnostic-al136.md)|The loop variable in a 'for' statement must be a numeric type.|Error|
|[AL0137](diagnostic-al137.md)|No enclosing loop out of which to break.|Error|
|[AL0138](diagnostic-al138.md)|The case expression cannot be an array.|Error|
|[AL0139](diagnostic-al139.md)|Since '{0}' doesn't have a return value, EXIT cannot be called with a value.|Error|
|[AL0140](diagnostic-al140.md)|The expression is not valid for the WITH statement.|Error|
|[AL0142](diagnostic-al142.md)|Only variables of type record can be marked as TEMPORARY.|Error|
|[AL0143](diagnostic-al143.md)|Cannot apply indexing with [] to an expression of type '{0}'.|Error|
|[AL0144](diagnostic-al144.md)|Wrong number of indices inside []; expected {0}.|Error|
|[AL0145](diagnostic-al145.md)|Assignment is not valid for arrays.|Error|
|[AL0146](diagnostic-al146.md)|The maximum number of array elements is {0}. Actual number is {1}.|Error|
|[AL0147](diagnostic-al147.md)|An array dimension must be a positive number.|Error|
|[AL0148](diagnostic-al148.md)|The table filter is not valid.|Error|
|[AL0149](diagnostic-al149.md)|There is an 'ELSE' statement without an 'IF' in property {0}.|Error|
|[AL0150](diagnostic-al150.md)|Invalid CONST expression. A valid integer or an identifier is expected.|Error|
|[AL0151](diagnostic-al151.md)|Expression must be an Option.|Error|
|[AL0152](diagnostic-al152.md)|The value '{0}' is used more than once.|Error|
|[AL0153](diagnostic-al153.md)|The property '{0}' cannot be blank.|Error|
|[AL0154](diagnostic-al154.md)|The maximum length for a field of type '{0}' is {1}.|Error|
|[AL0155](diagnostic-al155.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.|Error|
|[AL0156](diagnostic-al156.md)|'{0}' is not a valid field type.|Error|
|[AL0157](diagnostic-al157.md)|'{0}' is not a valid variable type.|Error|
|[AL0158](diagnostic-al158.md)|'{0}' is not a valid parameter type.|Error|
|[AL0159](diagnostic-al159.md)|'{0}' is not a valid return type.|Error|
|[AL0160](diagnostic-al160.md)|'{0}' is not a valid language identifier.|Error|
|[AL0161](diagnostic-al161.md)|'{0}' is inaccessible due to its protection level.|Error|
|[AL0162](diagnostic-al162.md)|'{0}' is not a valid trigger.|Error|
|[AL0163](diagnostic-al163.md)|Wrong signature. Correct signature for '{0}' is '{1}'.|Error|
|[AL0164](diagnostic-al164.md)|The trigger '{0}' is already defined.|Error|
|[AL0165](diagnostic-al165.md)|Triggers cannot be called directly.|Error|
|[AL0166](diagnostic-al166.md)|Argument {0}: must be a member.|Error|
|[AL0167](diagnostic-al167.md)|The property '{0}' can only be set if the property '{1}' is set with any of the values of: '{2}'.|Error|
|[AL0168](diagnostic-al168.md)|The property '{0}' can only be set if the property '{1}' is set.|Error|
|[AL0169](diagnostic-al169.md)|The option value '{0}' is not valid.|Error|
|[AL0170](diagnostic-al170.md)|An '=' is expected for property {0}.|Error|
|[AL0171](diagnostic-al171.md)|The property value '{0}' on property '{1}' is not valid.|Error|
|[AL0172](diagnostic-al172.md)|Operator '{0}' is ambiguous on an operand of type '{1}'.|Error|
|[AL0173](diagnostic-al173.md)|Operator '{0}' cannot be applied to an operand of type '{1}'.|Error|
|[AL0174](diagnostic-al174.md)|Operator '{0}' is ambiguous on operands of type '{1}' and '{2}'.|Error|
|[AL0175](diagnostic-al175.md)|Operator '{0}' cannot be applied to operands of type '{1}' and '{2}'.|Error|
|[AL0176](diagnostic-al176.md)|Expected one of the calculation formula methods (Average,Count,Exist,Min,Max,Lookup,Sum).|Error|
|[AL0177](diagnostic-al177.md)|Invalid application object identifier. A number or an application object name is expected.|Error|
|[AL0178](diagnostic-al178.md)|A 'FILTER' keyword or an identifier is expected.|Error|
|[AL0179](diagnostic-al179.md)|An identifier or a member access expression is expected.|Error|
|[AL0180](diagnostic-al180.md)|A 'FILTER' keyword is expected.|Error|
|[AL0181](diagnostic-al181.md)|Invalid filter expression.|Error|
|[AL0182](diagnostic-al182.md)|An identifier or a literal is expected as the value of a filter expression.|Error|
|[AL0183](diagnostic-al183.md)|Unexpected character '{0}'.|Error|
|[AL0184](diagnostic-al184.md)|The expression '{0}' is not valid.|Error|
|[AL0185](diagnostic-al185.md)|{0} '{1}' is missing.|Error|
|[AL0186](diagnostic-al186.md)|Reference '{0}' in application object '{1}' does not exist.|Error|
|[AL0187](diagnostic-al187.md)|Attribute '{0}' is valid only for {1}.|Error|
|[AL0189](diagnostic-al189.md)|Attribute '{0}' cannot be specified, because '{1}' is already specified.|Error|
|[AL0190](diagnostic-al190.md)|Constant value '{0}' is outside the range for a Time.|Error|
|[AL0191](diagnostic-al191.md)|Constant value '{0}' is outside the range for a Date. The syntax for defining Date format is yyyymmddD, where D is a mandatory letter. For example, 20180325D, read as the 25th of March, 2018.|Error|
|[AL0192](diagnostic-al192.md)|The return value must be used for the method '{0}'.|Error|
|[AL0193](diagnostic-al193.md)|Argument {0}: cannot convert from '{1}' to the type of Argument 1 '{2}'.|Error|
|[AL0195](diagnostic-al195.md)|Invalid permission kind. Expected: '{0}'.|Error|
|[AL0196](diagnostic-al196.md)|The call is ambiguous between the method '{0}' defined in {1} '{2}' by the extension '{3}' and the method '{4}' defined in {5} '{6}' by the extension '{7}'.|Error|
|[AL0197](diagnostic-al197.md)|An application object of type '{0}' with name '{1}' is already declared by the extension '{2}'.|Error|
|[AL0198](diagnostic-al198.md)|Expected one of the application object keywords ({0}).|Error|
|[AL0199](diagnostic-al199.md)|The type of the sum index field '{0}' must be numeric (Decimal, BigInteger, Integer, or Duration).|Error|
|[AL0200](diagnostic-al200.md)|Property '{0}' is obsolete and will be removed in a future version.|Warning|
|[AL0201](diagnostic-al201.md)|The {0} FlowField is not a Boolean field. If a FlowField CalcFormula starts with 'Exist', then the FlowField must be a Boolean type field.|Error|
|[AL0202](diagnostic-al202.md)|The {0} FlowField is not an Integer field. If a FlowField CalcFormula starts with 'Count', then the FlowField must be an Integer type field.|Error|
|[AL0203](diagnostic-al203.md)|Cannot calculate Sum or Average for the field {0} because it is not a numeric field (Decimal, BigInteger, Integer, or Duration data type).|Error|
|[AL0204](diagnostic-al204.md)|Field type {0} is not convertible to field type {1}.|Error|
|[AL0206](diagnostic-al206.md)|A field with ID {0} is already defined in {1} '{2}' by the extension '{3}'.|Error|
|[AL0207](diagnostic-al207.md)|The expression must be of Text type.|Error|
|[AL0208](diagnostic-al208.md)|The expression must be of Boolean type.|Error|
|[AL0210](diagnostic-al210.md)|A control with ID = {0} is already defined.|Error|
|[AL0211](diagnostic-al211.md)|Unknown area type '{0}'.|Error|
|[AL0212](diagnostic-al212.md)|An area of type '{0}' is already defined.|Error|
|[AL0213](diagnostic-al213.md)|An area of type '{0}' is only valid on pages of type '{1}'.|Error|
|[AL0214](diagnostic-al214.md)|An area of type 'FactBoxes' is not valid on Part type pages.|Error|
|[AL0215](diagnostic-al215.md)|A Part type page cannot contain other parts.|Error|
|[AL0216](diagnostic-al216.md)|Only parts are valid in an area of type 'FactBoxes'.|Error|
|[AL0217](diagnostic-al217.md)|Only parts and groups are valid in an area of type 'RoleCenter'.|Error|
|[AL0218](diagnostic-al218.md)|An integer literal value is expected for property {0}.|Error|
|[AL0219](diagnostic-al219.md)|Syntax error, string literal expected.|Error|
|[AL0220](diagnostic-al220.md)|Syntax error, boolean literal expected.|Error|
|[AL0221](diagnostic-al221.md)|The value '{0}' is not valid. The valid range is {1}..{2}.|Error|
|[AL0222](diagnostic-al222.md)|The ID '{0}' is not valid. ID's must be greater than zero.|Error|
|[AL0223](diagnostic-al223.md)|The property '{0}' can only be set if the property '{1}' is set to '{2}'.|Error|
|[AL0224](diagnostic-al224.md)|Expression expected.|Error|
|[AL0227](diagnostic-al227.md)|A key with ID {0} is already defined.|Error|
|[AL0228](diagnostic-al228.md)|A field group with ID {0} is already defined.|Error|
|[AL0229](diagnostic-al229.md)|The data type on the {0} field is not valid because the ExtendedDatatype property is set to Ratio. Valid data types are Integer, BigInteger and Decimal.|Error|
|[AL0230](diagnostic-al230.md)|The data type on the {0} field is not valid because the ExtendedDatatype property is set to PhoneNo, URL or Email. Valid data types are Code and Text.|Error|
|[AL0231](diagnostic-al231.md)|A member with ID '{0}' is already defined in {1} '{2}' by the extension '{3}'.|Error|
|[AL0232](diagnostic-al232.md)|The property value on field '{0}' must be positive or zero.|Error|
|[AL0234](diagnostic-al234.md)|An action with ID = {0} is already defined.|Error|
|[AL0235](diagnostic-al235.md)|The expression CONST() on the option value '{0}' is obsolete. Use CONST(" ") to refer to the empty option value.|Warning|
|[AL0236](diagnostic-al236.md)|An empty CONST() expression is not allowed on field '{0}' of type '{1}'.|Error|
|[AL0238](diagnostic-al238.md)|No overload for attribute '{0}' expects {1} arguments.|Error|
|[AL0239](diagnostic-al239.md)|Attribute {0} is specified multiple times.|Error|
|[AL0240](diagnostic-al240.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}': parameter {2} is expected to be of type '{3}' but found type '{4}'. The expected signature is: {5}.|Error|
|[AL0241](diagnostic-al241.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}'. The expected signature is: {2}.|Error|
|[AL0242](diagnostic-al242.md)|Invalid attribute argument syntax: '{0}'.|Error|
|[AL0243](diagnostic-al243.md)|Attribute {0} can only be used within a codeunit of subtype {1}.|Error|
|[AL0244](diagnostic-al244.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}': return value is expected to be of type '{2}' but found type '{3}'. The expected signature is: {4}.|Error|
|[AL0245](diagnostic-al245.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}': procedure cannot be local.|Error|
|[AL0246](diagnostic-al246.md)|The property '{0}' cannot be customized.|Error|
|[AL0247](diagnostic-al247.md)|The target {0} {1} for the extension object is not found.|Error|
|[AL0249](diagnostic-al249.md)|The Page '{0}' is not found.|Error|
|[AL0250](diagnostic-al250.md)|The data type on the {0} field is not valid because the ExtendedDatatype property is set to Person. Valid data types are Media and MediaSet.|Error|
|[AL0251](diagnostic-al251.md)|Application object '{0}' is missing.|Warning|
|[AL0252](diagnostic-al252.md)|Expected 'Ascending' or 'Descending' value.|Error|
|[AL0254](diagnostic-al254.md)|Sorting field '{0}' should be part of the keys for table '{1}'.|Warning|
|[AL0255](diagnostic-al255.md)|Property '{0}' requires an application object reference for the 'RunObject' property.|Error|
|[AL0256](diagnostic-al256.md)|The flowfield '{0}' cannot be part of the keys for table '{1}'.|Error|
|[AL0257](diagnostic-al257.md)|Constant value '{0}' is outside the range for a DateTime data type, only 0 is valid.|Error|
|[AL0259](diagnostic-al259.md)|A SQLIndex defined for the primary key must contain the same fields as the key for table '{0}'.|Error|
|[AL0260](diagnostic-al260.md)|The key '{0}' on table '{1}' cannot start with the fields defined for the primary key. The server will append these to any alternate key.|Error|
|[AL0261](diagnostic-al261.md)|The identifier '{0}' can only be specified in the list once.|Error|
|[AL0262](diagnostic-al262.md)|The clustered key '{0}' has already been defined for table '{1}'.|Error|
|[AL0263](diagnostic-al263.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must be enabled.|Error|
|[AL0264](diagnostic-al264.md)|An application object of type '{0}' with ID '{1}' is already declared by the extension '{2}'.|Error|
|[AL0266](diagnostic-al266.md)|Pages of types 'CardPart' and 'ListPart' can only contain Processing areas.|Error|
|[AL0267](diagnostic-al267.md)|Actions are not allowed on the control type.|Error|
|[AL0268](diagnostic-al268.md)|Grouping of actions is not allowed.|Error|
|[AL0269](diagnostic-al269.md)|The referenced page '{0}' should be a list part or a card part.|Warning (Future Error)|
|[AL0270](diagnostic-al270.md)|The control '{0}' is not found in the target '{1}'.|Error|
|[AL0271](diagnostic-al271.md)|The action '{0}' is not found in the target '{1}'.|Error|
|[AL0272](diagnostic-al272.md)|The anchoring symbol '{0}' must be a grouping symbol.|Error|
|[AL0273](diagnostic-al273.md)|The name '{0}' is an Area type. Using an Area type name will limit extensibility as dependent extension won't be able to reference it.|Warning (Future Error)|
|[AL0274](diagnostic-al274.md)|The anchoring symbol '{0}' cannot be an area.|Error|
|[AL0275](diagnostic-al275.md)|'{0}' is an ambiguous reference between '{1}' defined by the extension '{2}' and '{3}' defined by the extension '{4}'.|Error|
|[AL0276](diagnostic-al276.md)|A Time literal value is expected for property {0}.|Error|
|[AL0277](diagnostic-al277.md)|A Date literal value is expected for property {0}.|Error|
|[AL0278](diagnostic-al278.md)|A DateTime literal value is expected for property {0}.|Error|
|[AL0279](diagnostic-al279.md)|The key '{0}' on table '{1}' contains too many fields.|Error|
|[AL0280](diagnostic-al280.md)|The event '{0}' is not found in the target.|Error|
|[AL0281](diagnostic-al281.md)|Object member '{0}' is not an event.|Error|
|[AL0282](diagnostic-al282.md)|The member referenced by event subscriber '{0}' parameter '{1}' is not found.|Error|
|[AL0283](diagnostic-al283.md)|The event '{0}' must not have a return value.|Error|
|[AL0284](diagnostic-al284.md)|The type of the parameter '{1}' on the event subscriber '{0}' does not match the expected type '{2}'.|Error|
|[AL0285](diagnostic-al285.md)|The event '{0}' must not have a parameter name 'sender' when it specifies to include sender.|Error|
|[AL0286](diagnostic-al286.md)|The event '{0}' can't contain code.|Error|
|[AL0287](diagnostic-al287.md)|The event '{0}' can't contain local variables.|Error|
|[AL0288](diagnostic-al288.md)|Parameter '{0}' is only allowed to be 'var' if the publisher parameter is 'var'.|Error|
|[AL0290](diagnostic-al290.md)|Element name is not allowed for the event '{0}' and must be empty.|Error|
|[AL0291](diagnostic-al291.md)|Event trigger '{0}' can only be used if the page specifies the 'SourceTable' property.|Error|
|[AL0292](diagnostic-al292.md)|'FIELD', 'CONST' or 'FILTER' keyword is expected.|Error|
|[AL0293](diagnostic-al293.md)|Property value {0} is not in the field's OptionMembers.|Error|
|[AL0294](diagnostic-al294.md)|The type of property value {0} does not match the field’s type.|Error|
|[AL0295](diagnostic-al295.md)|The field '{0}' is not found in the target '{1}'.|Error|
|[AL0296](diagnostic-al296.md)|The application object or method '{0}' has scope '{1}' and cannot be used for '{2}' development.|Error|
|[AL0297](diagnostic-al297.md)|The application object identifier '{0}' is not valid. It must be within the allowed ranges '{1}'.|Error|
|[AL0298](diagnostic-al298.md)|The data type of the expression assigned to the 'StyleExpr' property is not valid. Valid data types are Boolean, Text, or Code.|Error|
|[AL0299](diagnostic-al299.md)|Member name '{0}' is only allowed on triggers.|Warning (Future Error)|
|[AL0300](diagnostic-al300.md)|The property '{0}' is used as a method.|Error|
|[AL0301](diagnostic-al301.md)|A list must end with a member; not a separator {0}.|Error|
|[AL0302](diagnostic-al302.md)|Cannot use '{0}' in {1} '{2}' before it is declared.|Error|
|[AL0303](diagnostic-al303.md)|Attributes can only be defined on variables and methods.|Error|
|[AL0304](diagnostic-al304.md)|Length of the identifier '{0}' cannot exceed {1} characters.|Error|
|[AL0305](diagnostic-al305.md)|The length of the application object identifier '{0}' cannot exceed {1} characters.|Error|
|[AL0306](diagnostic-al306.md)|A field list has to contain at least one field.|Error|
|[AL0307](diagnostic-al307.md)|Property value cannot be validated because the source table is unreachable.|Error|
|[AL0308](diagnostic-al308.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must have the MaintainSqlIndex property set to true.|Error|
|[AL0309](diagnostic-al309.md)|Table '{0}' contains too many keys.|Error|
|[AL0310](diagnostic-al310.md)|An instance is required for the non-static member '{0}'.|Error|
|[AL0311](diagnostic-al311.md)|Member '{0}' cannot be accessed with an instance reference; qualify it with '{1}' instead.|Error|
|[AL0313](diagnostic-al313.md)|Attribute {0} can only be used within {1}.|Error|
|[AL0314](diagnostic-al314.md)|The property '{0}' is only valid in controls of type '{1}'.|Error|
|[AL0315](diagnostic-al315.md)|Control '{0}' does not exist in group '{1}'.|Error|
|[AL0316](diagnostic-al316.md)|The expression must be of Integer type.|Error|
|[AL0317](diagnostic-al317.md)|A property with the same name has already been declared.|Error|
|[AL0318](diagnostic-al318.md)|The value assigned to the 'RunObject' property is not valid. Valid object types are codeunit, page, xmlport, report, and query.|Error|
|[AL0319](diagnostic-al319.md)|At least one target has to be specified for the move.|Error|
|[AL0320](diagnostic-al320.md)|The referenced page '{0}' must specify a 'SourceTable'.|Error|
|[AL0321](diagnostic-al321.md)|Variable {0} cannot be included in the data set.|Error|
|[AL0322](diagnostic-al322.md)|{0} is not valid for client expressions.|Error|
|[AL0323](diagnostic-al323.md)|The value assigned to the SystemPart type is not valid. Valid values are {0}.|Error|
|[AL0324](diagnostic-al324.md)|The language {0} must only be specified one time.|Error|
|[AL0325](diagnostic-al325.md)|The field '{0}' in the table '{1}' cannot be included in a key because its type is '{2}'.|Error|
|[AL0326](diagnostic-al326.md)|'{0}' is not a valid column type.|Error|
|[AL0327](diagnostic-al327.md)|Missing file '{0}'.|Error|
|[AL0329](diagnostic-al329.md)|The {0} property must reference a top-level DataItem.|Error|
|[AL0331](diagnostic-al331.md)|The property 'DataItemLink' cannot be set on a top-level DataItem.|Error|
|[AL0332](diagnostic-al332.md)|The control {0} must be of type {1}.|Error|
|[AL0333](diagnostic-al333.md)|The syntax for accessing fields is not valid. Specify target field with 'tableName.fieldName' syntax.|Error|
|[AL0334](diagnostic-al334.md)|The extension object '{0}' cannot be declared. Another extension for target '{1}' or the target itself is already declared in this module.|Error|
|[AL0335](diagnostic-al335.md)|Attributes must be specified before elements inside of an element.|Error|
|[AL0336](diagnostic-al336.md)|There must be exactly one root node and it has to be an element.|Error|
|[AL0337](diagnostic-al337.md)|None of the specified parent table elements has the name {0}.|Error|
|[AL0338](diagnostic-al338.md)|Event trigger '{0}' can only be used if the page specifies 'SourceTable'. Table '{1}' is missing.|Error|
|[AL0340](diagnostic-al340.md)|Page '{0}' should be of type 'RoleCenter'.|Error|
|[AL0341](diagnostic-al341.md)|'{0}' property is missing.|Error|
|[AL0342](diagnostic-al342.md)|You cannot combine two DataItems at the same level because unions are not supported.|Error|
|[AL0343](diagnostic-al343.md)|Queries must define a top-level DataItem.|Error|
|[AL0344](diagnostic-al344.md)|The property 'DataItemLink' must be set.|Error|
|[AL0345](diagnostic-al345.md)|The source of a Column or Filter must be a field defined on the table referenced by its parent DataItem.|Error|
|[AL0346](diagnostic-al346.md)|The methods '{0}' can only be used on Columns that have a Date or DateTime type.|Error|
|[AL0347](diagnostic-al347.md)|The methods '{0}' can only be used on Columns that have a Decimal, BigInteger, Integer, or Duration type.|Error|
|[AL0349](diagnostic-al349.md)|Column '{0}' does not exist in application object '{1}'.|Error|
|[AL0350](diagnostic-al350.md)|The column '{0}' cannot be used multiple times when defining the order of the resulting dataset.|Error|
|[AL0351](diagnostic-al351.md)|The property 'DataItemLink' can only reference fields on ancestor data items.|Error|
|[AL0352](diagnostic-al352.md)|Queries must define at least one Column.|Error|
|[AL0353](diagnostic-al353.md)|A Column must have a valid data source or have the 'Method' property set to 'Count'.|Error|
|[AL0354](diagnostic-al354.md)|Cannot move element '{0}' relative to itself in page '{1}'.|Error|
|[AL0355](diagnostic-al355.md)|Cannot move the {0} '{1}' multiple times inside of a single move operation.|Error|
|[AL0356](diagnostic-al356.md)|Cannot modify the {0} '{1}' multiple times.|Error|
|[AL0357](diagnostic-al357.md)|Cannot add {0} '{1}' with the same name multiple times.|Error|
|[AL0358](diagnostic-al358.md)|Cannot move or modify the {0} '{1}' in the same '{2}' that you added.|Error|
|[AL0359](diagnostic-al359.md)|The XML node name is not valid. {0}.|Error|
|[AL0360](diagnostic-al360.md)|Text literal was not properly terminated. Use the character ' to terminate the literal.|Error|
|[AL0361](diagnostic-al361.md)|Identifier was not properly terminated. Use the character " to terminate the identifier.|Error|
|[AL0362](diagnostic-al362.md)|The path must be relative to the project root.|Error|
|[AL0363](diagnostic-al363.md)|The directory separator used in this property value is not compatible with the current operating system.|Error|
|[AL0364](diagnostic-al364.md)|Option members must be accessed with ::.|Error|
|[AL0365](diagnostic-al365.md)|The property '{0}' cannot be set if the property '{1}' is set to '{2}'.|Error|
|[AL0366](diagnostic-al366.md)|A table has to have at least one Normal field.|Error|
|[AL0367](diagnostic-al367.md)|An array must have at least one dimension.|Error|
|[AL0368](diagnostic-al368.md)|The maximum number of array dimensions is {0}.|Error|
|[AL0369](diagnostic-al369.md)|Constant value '{0}' cannot be converted to a '{1}'.|Error|
|[AL0370](diagnostic-al370.md)|Division by constant zero.|Error|
|[AL0371](diagnostic-al371.md)|The operation overflows at compile time.|Error|
|[AL0372](diagnostic-al372.md)|The length of the String constant exceeds the current memory limit.|Error|
|[AL0373](diagnostic-al373.md)|The XML name cannot be empty.|Error|
|[AL0374](diagnostic-al374.md)|The use of a unique ID has been deprecated and the ID can be removed.|Warning|
|[AL0375](diagnostic-al375.md)|Option members cannot contain comma.|Error|
|[AL0376](diagnostic-al376.md)|A control of type '{0}' is not allowed in a parent control of type '{1}'.|Error|
|[AL0377](diagnostic-al377.md)|'{0}' is not a valid value for the '{1}' attribute on variables of type '{2}'.|Error|
|[AL0378](diagnostic-al378.md)|A page of type Role Center cannot have triggers.|Error|
|[AL0379](diagnostic-al379.md)|The name '{0}' cannot be used as an identifier because it does not comply with the Common Language Specification.|Error|
|[AL0380](diagnostic-al380.md)|Cannot move symbol '{0}' from '{1}' area to '{2}' area.|Error|
|[AL0381](diagnostic-al381.md)|The keys '{0}' and '{1}' have an identical list of fields.|Error|
|[AL0382](diagnostic-al382.md)|The option value '{0}' is defined more than once on field '{1}'.|Error|
|[AL0383](diagnostic-al383.md)|The option value '{0}' is not defined on field '{1}'.|Error|
|[AL0384](diagnostic-al384.md)|The name of all the columns and all the labels defined in a report must be unique.|Error|
|[AL0385](diagnostic-al385.md)|IncludeCaption can be set to true only if the source of the column is a named field.|Error|
|[AL0386](diagnostic-al386.md)|A required package dependency could not be found. Make sure that you have downloaded all the referenced packages and their dependencies.|Error|
|[AL0387](diagnostic-al387.md)|Namespace '{0}' is already specified.|Error|
|[AL0388](diagnostic-al388.md)|The date formula '{0}' must include plus (+) or minus (-).|Error|
|[AL0389](diagnostic-al389.md)|The date formula '{0}' contains a number that is too large. The number must be in the range {1} - {2}.|Error|
|[AL0390](diagnostic-al390.md)|The date formula '{0}' must include a time unit. Time units can be: D,WD,W,M,Q, or Y. C specifies the current time unit based on date and can be used as a prefix to any of the time units.|Error|
|[AL0391](diagnostic-al391.md)|The date formula '{0}' must include a number.|Error|
|[AL0392](diagnostic-al392.md)|The input cannot be longer than {0}.|Error|
|[AL0393](diagnostic-al393.md)|Application object {0} is already referenced.|Error|
|[AL0395](diagnostic-al395.md)|You can only specify Move and Modify actions in the layout section of a page customization.|Error|
|[AL0396](diagnostic-al396.md)|Procedures and triggers are not allowed on page customizations.|Error|
|[AL0397](diagnostic-al397.md)|The name '{0}' clashes with '{1}' column's format column name.|Error|
|[AL0398](diagnostic-al398.md)|Constant value '{0}' is outside of the valid ordinal range for this {1} type.|Error|
|[AL0399](diagnostic-al399.md)|Global variables are not allowed on page customizations.|Error|
|[AL0401](diagnostic-al401.md)|Multiple page customizations have been specified for the same page {0} within the same profile.|Error|
|[AL0402](diagnostic-al402.md)|Expression {0} cannot be specified more than once in a 'case' statement.|Error|
|[AL0403](diagnostic-al403.md)|To modify '{0}' you must add at least one property or trigger.|Error|
|[AL0404](diagnostic-al404.md)|Property '{0}' is not allowed on a table extension.|Error|
|[AL0405](diagnostic-al405.md)|An option value is expected.|Error|
|[AL0406](diagnostic-al406.md)|The type for {0} is not valid. Expected {1}, but found {2}.|Error|
|[AL0407](diagnostic-al407.md)|The generic '{0}' type expects {1} type arguments.|Error|
|[AL0408](diagnostic-al408.md)|The type '{0}' cannot be used as a type argument in this context.|Error|
|[AL0409](diagnostic-al409.md)|The '{0}' type is not a generic type.|Error|
|[AL0410](diagnostic-al410.md)|The report '{0}' doesn't contain a Request Page.|Error|
|[AL0411](diagnostic-al411.md)|{0} can be specified only once.|Error|
|[AL0412](diagnostic-al412.md)|Member '{0}' could not be declared in an object of type '{1}'.|Error|
|[AL0413](diagnostic-al413.md)|Procedure '{0}' cannot have a body.|Error|
|[AL0414](diagnostic-al414.md)|Procedure '{0}' must declare a body.|Error|
|[AL0415](diagnostic-al415.md)|Keyword 'local' cannot be specified for procedure '{0}'.|Error|
|[AL0416](diagnostic-al416.md)|Method '{0}' cannot have a return value.|Error|
|[AL0417](diagnostic-al417.md)|Control add-in '{0}' not found.|Error|
|[AL0418](diagnostic-al418.md)|The format of resource '{0}' is not valid. Resources in the control add-in should either be relative to the project root, or reference external files using the HTTP or HTTPS protocol.|Error|
|[AL0419](diagnostic-al419.md)|The event subscriber '{0}' is missing a parameter of type '{1}'.|Error|
|[AL0420](diagnostic-al420.md)|Parameter '{0}' cannot be 'var'.|Error|
|[AL0421](diagnostic-al421.md)|A ‘foreach’ statement can only be used with an expression of an enumerable type.|Error|
|[AL0422](diagnostic-al422.md)|Constant value {0} is not a valid value for APIVersion. Valid values are 'beta' or of type 'vX.Y' where X and Y represent positive integers.|Error|
|[AL0423](diagnostic-al423.md)|The property '{0}' can only be set if the specified fields are from the same table.|Error|
|[AL0424](diagnostic-al424.md)|The multilanguage syntax is being deprecated. Please update to the new syntax.|Warning|
|[AL0425](diagnostic-al425.md)|The '{0}' trigger can only be used on codeunits that have the Subtype property set to '{1}'.|Error|
|[AL0426](diagnostic-al426.md)|The APIVersion {0} is specified multiple times.|Error|
|[AL0427](diagnostic-al427.md)|Field {0} cannot be converted to type {1}.|Error|
|[AL0428](diagnostic-al428.md)|Cannot specify {0} and {1} property at the same time. Use only the {1} property.|Error|
|[AL0429](diagnostic-al429.md)|A repeater control can only be added to pages that have a source table.|Error|
|[AL0430](diagnostic-al430.md)|The parameter '{0}' has a type which is not serializable and therefore cannot be used in the given context.|Error|
|[AL0432](diagnostic-al432.md)|{0} '{1}' is marked for removal. {2}.|Warning|
|[AL0433](diagnostic-al433.md)|{0} '{1}' is removed. {2}.|Error|
|[AL0434](diagnostic-al434.md)|Syntax error, numeric literal expected.|Error|
|[AL0435](diagnostic-al435.md)|Syntax error, literal expected.|Error|
|[AL0436](diagnostic-al436.md)|The value of the property '{0}' cannot be empty.|Error|
|[AL0437](diagnostic-al437.md)|The value of the '{0}' property cannot include empty members.|Error|
|[AL0438](diagnostic-al438.md)|The type of value {0} does not match the field’s type.|Error|
|[AL0439](diagnostic-al439.md)|The label's property is not valid. Possible properties are: {0}.|Error|
|[AL0440](diagnostic-al440.md)|The '{0}' already defines a method called '{1}' with the same parameter types in '{2}'.|Error|
|[AL0441](diagnostic-al441.md)|Parameter {0} is only available when the page specifies a 'SourceTable'.|Error|
|[AL0442](diagnostic-al442.md)|Parameter {0} is only available when the page specifies a 'SourceTable'. Table '{1}' is missing.|Error|
|[AL0443](diagnostic-al443.md)|The system object provided is not one of the valid system objects.|Error|
|[AL0444](diagnostic-al444.md)|Malformed {0} report layout at location '{1}'. The issue is: '{2}'.|Error|
|[AL0445](diagnostic-al445.md)|The file '{0}' is opened in another application. Close the application to be able to compile.|Error|
|[AL0447](diagnostic-al447.md)|The value '{0}' for the property '{1}' cannot be used for '{2}' development.|Error|
|[AL0448](diagnostic-al448.md)|Member is not allowed in this context.|Error|
|[AL0449](diagnostic-al449.md)|The alias '{0}' is already declared.|Error|
|[AL0450](diagnostic-al450.md)|Field '{0}' is removed and cannot be used in an active key.|Error|
|[AL0451](diagnostic-al451.md)|An assembly named '{0}' could not be found in the assembly probing paths '{1}'.|Error|
|[AL0452](diagnostic-al452.md)|The type '{0}' could not be found in assembly '{1}'.|Error|
|[AL0453](diagnostic-al453.md)|This feature is under development. It can be enabled by using the '{0}' feature flag.|Error|
|[AL0454](diagnostic-al454.md)|The {0} {1} of type {2} cannot be extended.|Error|
|[AL0455](diagnostic-al455.md)|Option ordinal value '{0}' is not valid. Valid values are -1 and positive integers.|Error|
|[AL0456](diagnostic-al456.md)|The number of option ordinal values is not valid. There must be as many option ordinal values as there are option members.|Error|
|[AL0457](diagnostic-al457.md)|The label syntax is not correct. Please move the '{0}' to its designated attribute.|Warning|
|[AL0458](diagnostic-al458.md)|'{0}' is not a valid attribute on variables of type '{1}'.|Error|
|[AL0459](diagnostic-al459.md)|The attribute '{0}' is only allowed on global variables.|Error|
|[AL0460](diagnostic-al460.md)|Client-side events are supported only on pages and page extensions.|Error|
|[AL0461](diagnostic-al461.md)|'{0}' is not a valid event publisher.|Error|
|[AL0462](diagnostic-al462.md)|The publisher '{0}' does not have any public events named '{1}'.|Error|
|[AL0463](diagnostic-al463.md)|Parameter '{0}' must be 'var' if and only if the publisher parameter is 'var'.|Error|
|[AL0464](diagnostic-al464.md)|Could not determine a suitable default primary key for table '{0}'. Please specify a primary key for the table.|Error|
|[AL0465](diagnostic-al465.md)|The property '{0}' does not accept references to external files.|Error|
|[AL0466](diagnostic-al466.md)|Cannot access file '{0}'. The file is most likely read-only.|Error|
|[AL0467](diagnostic-al467.md)|Cannot access file '{0}'. The file is most likely read-only.|Warning|
|[AL0468](diagnostic-al468.md)|Length of the table field name '{0}' must not exceed {1} characters. Longer field names are prone to cause SQL errors.|Warning (Future Error)|
|[AL0470](diagnostic-al470.md)|The referenced page '{0}' of PageType 'HeadlinePart' is only allowed inside pages of PageType 'RoleCenter'.|Error|
|[AL0471](diagnostic-al471.md)|The format of link '{0}' is not valid. It should be using the HTTP or HTTPS protocol.|Error|
|[AL0472](diagnostic-al472.md)|The source of the translation item does not match the label value. Ignoring the translation item.|Warning|
|[AL0473](diagnostic-al473.md)|The translated string of the translation item is too long. Trimming the translated string.|Warning|
|[AL0474](diagnostic-al474.md)|The attribute '{0}' is only allowed on local variables.|Error|
|[AL0475](diagnostic-al475.md)|The attribute '{0}' cannot be used on variables of array type.|Error|
|[AL0476](diagnostic-al476.md)|The trigger '{0}' can only be used if the property '{1}' of '{2}' is set.|Error|
|[AL0477](diagnostic-al477.md)|The trigger '{0}' can only be used if the property '{1}' of '{2}' is set to '{3}'.|Error|
|[AL0478](diagnostic-al478.md)|The trigger '{0}' can only be used if the property '{1}' of '{2}' is set with any of the values of :'{3}'.|Error|
|[AL0479](diagnostic-al479.md)|There must be only one translation item for each ID.|Warning|
|[AL0480](diagnostic-al480.md)|Attributes cannot have nested elements.|Error|
|[AL0481](diagnostic-al481.md)|The property Image can only be used on fields that are contained in a CueGroup control.|Warning (Future Error)|
|[AL0482](diagnostic-al482.md)|The image {0} is not valid in this context.|Warning|
|[AL0483](diagnostic-al483.md)|The property Image cannot be used on nested Action Groups inside the 'Sections' area.|Warning|
|[AL0484](diagnostic-al484.md)|The property '{0}' must be alphanumeric.|Error|
|[AL0485](diagnostic-al485.md)|The property '{0}' is mandatory for objects of type API.|Error|
|[AL0486](diagnostic-al486.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.|Warning (Future Error)|
|[AL0487](diagnostic-al487.md)|The field '{0}' is not of field class 'Normal' and thus cannot be part of the {1} list.|Error|
|[AL0488](diagnostic-al488.md)|ControlAddIn name must not contain characters {0}.|Error|
|[AL0489](diagnostic-al489.md)|The property expression is not valid. A CONST or FILTER expression is expected.|Error|
|[AL0490](diagnostic-al490.md)|The property expression is not valid. A CONST, FIELD, or FILTER expression is expected.|Error|
|[AL0491](diagnostic-al491.md)|The property expression is not valid. One of the following expressions is expected : CONST,FIELD,FILTER,FIELD(FILTER(Identifier)),FIELD(UPPERLIMIT(Identifier)),or FIELD(UPPERLIMIT(FILTER(Identifier))).|Error|
|[AL0492](diagnostic-al492.md)|The RunObject property value of actions defined in the '{0}' area must only reference pages of type 'List'.|Error|
|[AL0493](diagnostic-al493.md)|The RunObject property value of actions defined in the '{0}' area must only reference pages of type 'List'.|Warning (Future Error)|
|[AL0494](diagnostic-al494.md)|The action area '{0}' can only directly contain groups.|Error|
|[AL0495](diagnostic-al495.md)|A member with ID '{0}' is already defined. Change the member name to generate a new ID.|Error|
|[AL0496](diagnostic-al496.md)|Attributes cannot be defined in this context.|Error|
|[AL0498](diagnostic-al498.md)|The attribute '{0}' can only be used on procedures that have the attribute '{1}'.|Error|
|[AL0499](diagnostic-al499.md)|The handler function {0} was not found. Make sure the procedure is defined and has a handler attribute.|Error|
|[AL0500](diagnostic-al500.md)|The HandlerFunctions attribute only accepts a string representing a comma separated list of procedure names without spaces.|Error|
|[AL0501](diagnostic-al501.md)|Eventsubscribers in test codeunits must use manual binding. Set the property EventSubscriberInstance to Manual.|Error|
|[AL0502](diagnostic-al502.md)|The LinkTable property must reference a table element node of the current XMLPort.|Error|
|[AL0503](diagnostic-al503.md)|Reference '{0}' in application object '{1}' is ambiguous.|Error|
|[AL0504](diagnostic-al504.md)|The enum '{0}' is not extensible.|Error|
|[AL0505](diagnostic-al505.md)|Pages of type API must have the DelayedInsert property set to true, unless the 'Editable' property or the 'InsertAllowed' property is set to false.|Error|
|[AL0509](diagnostic-al509.md)|Constant value '{0}' is outside of the valid ordinal range for this option type.|Warning|
|[AL0510](diagnostic-al510.md)|The .NET type '{0}' is not a valid control add-in.|Error|
|[AL0511](diagnostic-al511.md)|The property 'IsControlAddIn' must be set on the .NET type '{0}' if the type represents a .NET control add-in.|Error|
|[AL0512](diagnostic-al512.md)|The manifest should define the 'supportedLocales' manifest property in order to use a placeholder in the '{0}' property.|Error|
|[AL0513](diagnostic-al513.md)|The FieldGroup '{0}' is not found in the target '{1}'.|Error|
|[AL0514](diagnostic-al514.md)|The symbol file is not valid. An enum with ID '{0}' is already defined with a different name in module '{1}'.|Error|
|[AL0515](diagnostic-al515.md)|The symbol file is not valid. An enum with name '{0}' is already defined with a different ID in module '{1}'.|Error|
|[AL0516](diagnostic-al516.md)|The symbol file is not valid. An enum with ID '{0}' and name '{1}' is already defined in module '{2}', but with different values (OptionString).|Error|
|[AL0517](diagnostic-al517.md)|The link '{0}' specified in the HelpLink property must either contain one placeholder with value 0 for the user locale, or no placeholders.|Error|
|[AL0518](diagnostic-al518.md)|A method with name '{0}' possessing one Handler attribute is already defined in this test codeunit.|Error|
|[AL0519](diagnostic-al519.md)|'{0}' is not valid value in this context.|Error|
|[AL0520](diagnostic-al520.md)|{0} '{1}' is removed. {2}.|Warning|
|[AL0521](diagnostic-al521.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must not have the Unique property set.|Error|
|[AL0522](diagnostic-al522.md)|Property value {0} is not in the values for enum '{1}'.|Error|
|[AL0523](diagnostic-al523.md)|The '{0}' already defines a method called '{1}' with the same parameter types in '{2}'.|Warning (Future Error)|
|[AL0524](diagnostic-al524.md)|The base type already defines a method called '{0}' with the same parameter types.|Warning (Future Error)|
|[AL0525](diagnostic-al525.md)|The system or virtual table '{0}' cannot be extended.|Error|
|[AL0526](diagnostic-al526.md)|The referenced page '{0}' of type 'API' is only allowed inside pages of PageType 'API'.|Error|
|[AL0527](diagnostic-al527.md)|The SQL timestamp field '{0}' cannot be part of the keys for table '{1}'.|Error|
|[AL0528](diagnostic-al528.md)|The name of field controls in pages of the type API must be alphanumeric.|Error|
|[AL0529](diagnostic-al529.md)|The name of columns in queries of the type API must be alphanumeric.|Error|
|[AL0530](diagnostic-al530.md)|The maximum length for the type '{0}' is {1}.|Error|
|[AL0531](diagnostic-al531.md)|The page '{1}' of type 'API' and its subpage '{2}' of type 'API' in the control '{0}' of type 'Part' must have the same value of property '{3}'.|Error|
|[AL0532](diagnostic-al532.md)|The page '{1}' of type 'API' and its control '{0}' of type 'Part' must have the same value of property '{2}'.|Error|
|[AL0533](diagnostic-al533.md)|The view '{0}' is not found in the target '{1}'.|Error|
|[AL0534](diagnostic-al534.md)|Length of the table key name '{0}' must not exceed {1} characters. Longer key names are prone to cause SQL errors.|Warning (Future Error)|
|[AL0535](diagnostic-al535.md)|The referenced page '{0}' must be a List part, a Card part, or an API page.|Error|
|[AL0536](diagnostic-al536.md)|Adding new controls in a view is not allowed.|Error|
|[AL0537](diagnostic-al537.md)|Declaring views is only supported on pages of type {0}.|Error|
|[AL0538](diagnostic-al538.md)|Views only support setting one sorting direction on table fields.|Error|
|[AL0539](diagnostic-al539.md)|The field '{0}' cannot be used multiple times when defining the order of the page view.|Error|
|[AL0540](diagnostic-al540.md)|The view name '{0}' is not valid.|Error|
|[AL0541](diagnostic-al541.md)|The use of the variable '{0}' in the property value of '{1}' in view '{2}' is not allowed.|Error|
|[AL0542](diagnostic-al542.md)|The property {0} cannot be used on page '{1}' because this page does not have a source table.|Error|
|[AL0543](diagnostic-al543.md)|The manifest property 'contextSensitiveHelpUrl' must be set in order to use the property 'ContextSensitiveHelpPage'.|Error|
|[AL0544](diagnostic-al544.md)|The property 'ContextSensitiveHelpPage' cannot contain a placeholder.|Error|
|[AL0545](diagnostic-al545.md)|An area of type '{0}' is not valid on pages of type '{1}'.|Warning (Future Error)|
|[AL0546](diagnostic-al546.md)|The control '{0}' cannot be modified in a view context because views only support modifying controls defined in the Content area.|Error|
|[AL0547](diagnostic-al547.md)|The event '{0}' should not expose global variables.|Warning (Future Error)|
|[AL0548](diagnostic-al548.md)|Cannot move symbol '{0}' from '{1}' area to '{2}' area.|Warning (Future Error)|
|[AL0549](diagnostic-al549.md)|Procedures and triggers are not allowed on page views.|Error|
|[AL0550](diagnostic-al550.md)|Groups defined in the action area '{0}' should only contain actions.|Warning (Future Error)|
|[AL0551](diagnostic-al551.md)|The action area '{0}' can only contain actions.|Warning (Future Error)|
|[AL0552](diagnostic-al552.md)|The action area '{0}' can only directly contain groups.|Warning (Future Error)|
|[AL0553](diagnostic-al553.md)|You cannot add actions of type '{0}' in the action area '{1}' from a page customization. You can only add actions of type '{2}'.|Error|
|[AL0554](diagnostic-al554.md)|You can only specify Move and Modify actions in the actions section of a page customization.|Error|
|[AL0555](diagnostic-al555.md)|The RunObject property value of actions defined in the '{0}' area must only reference objects of type {1}.|Error|
|[AL0556](diagnostic-al556.md)|The RunObject property value of actions defined in the '{0}' area must only reference objects of type {1}.|Warning (Future Error)|
|[AL0557](diagnostic-al557.md)|The name of the codeunit local variable '{0}' is identical to a field in table '{1}' and will shadow that table field.|Warning|
|[AL0558](diagnostic-al558.md)|The name of the codeunit global variable '{0}' is identical to a field in table '{1}'.|Warning|
|[AL0559](diagnostic-al559.md)|A Part type page cannot contain other parts.|Warning (Future Error)|
|[AL0560](diagnostic-al560.md)|Only parts and groups are valid in an area of type 'RoleCenter'.|Warning (Future Error)|
|[AL0561](diagnostic-al561.md)|Only parts are valid in an area of type 'FactBoxes'.|Warning (Future Error)|
|[AL0562](diagnostic-al562.md)|The value assigned to the SystemPart type is not valid. Valid values are {0}.|Warning (Future Error)|
|[AL0563](diagnostic-al563.md)|A control of type '{0}' is not allowed in a parent control of type '{1}'.|Warning (Future Error)|
|[AL0564](diagnostic-al564.md)|The object {0} '{1}' is not extensible.|Error|
|[AL0565](diagnostic-al565.md)|Fast publishing requires a built application file to be present. The '{0}' application file contains a manifest which is not valid. Please rebuild the application file before continuing with fast publishing.|Error|
|[AL0566](diagnostic-al566.md)|The field '{0}' is using an Id {1} that is reserved for system fields.|Error|
|[AL0567](diagnostic-al567.md)|The field '{0}' is using the same name as a system-provided field and will shadow that field.|Warning|
|[AL0568](diagnostic-al568.md)|Groups defined in the action area '{0}' should only contain actions or groups.|Warning (Future Error)|
|[AL0569](diagnostic-al569.md)|A page of type Role Center cannot have procedures.|Warning (Future Error)|
|[AL0570](diagnostic-al570.md)|The symbol '{0}' results in the same translation ID as one or more other symbols. Rename symbol to resolve the problem.|Error|
|[AL0571](diagnostic-al571.md)|The property 'Description' should only be used for internal comments. Use the property 'Caption' or 'CaptionML' in order to specify the profile caption displayed to end users.|Warning (Future Error)|
|[AL0572](diagnostic-al572.md)|I/O operations on the file or folder '{0}' resulted in an exception with the Windows 32 error code '{1}'.|Error|
|[AL0573](diagnostic-al573.md)|{0} is not valid for client expressions.|Warning (Future Error)|
|[AL0574](diagnostic-al574.md)|This feature is under development and cannot be used in an extension.|Error|
|[AL0575](diagnostic-al575.md)|You cannot modify the {0} '{1}' because it is defined in the page customization '{2}'.|Error|
|[AL0576](diagnostic-al576.md)|The profile name '{0}' is not valid because it contains leading or trailing spaces.|Error|
|[AL0577](diagnostic-al577.md)|The view '{0}' cannot define layout changes because its property '{1}' is not set to false.|Error|
|[AL0578](diagnostic-al578.md)|The value for the property '{0}' is not valid because its length exceeds {1} characters ({2} characters).|Error|
|[AL0579](diagnostic-al579.md)|The value for the property '{0}' for the language code '{1}' is not valid because its length exceeds {2} characters ({3} characters).|Error|
|[AL0580](diagnostic-al580.md)|The field '{0}' is used by the system and cannot be specified as a table key.|Error|
|[AL0581](diagnostic-al581.md)|The length for the type '{0}' must be positive.|Error|
|[AL0582](diagnostic-al582.md)|'{0}' does not implement the interface member '{1}'.|Error|
|[AL0584](diagnostic-al584.md)|An interface member cannot have any variables.|Error|
|[AL0585](diagnostic-al585.md)|An interface cannot have any variables.|Error|
|[AL0586](diagnostic-al586.md)|The identifier contains characters that are not valid: {0}.|Warning (Future Error)|
|[AL0587](diagnostic-al587.md)|'{0}' is already listed in the interface list.|Error|
|[AL0588](diagnostic-al588.md)|The type of parameter '{1}' on event subscriber '{0}' is of type 'Option', but the expected type is '{2}'. Please update the subscriber type to match the publisher.|Warning|
|[AL0589](diagnostic-al589.md)|The name '{0}' is used across multiple columns and data items. This will prevent extensibility of this column or data item.|Warning (Future Error)|
|[AL0590](diagnostic-al590.md)|The property {0} is only supported on {1}.|Warning (Future Error)|
|[AL0591](diagnostic-al591.md)|The property {0} is only supported on {1}.|Error|
|[AL0592](diagnostic-al592.md)|Compatibility: {0}.|Warning|
|[AL0593](diagnostic-al593.md)|The type of the parameter '{0}' on the event subscriber '{1}' has a smaller capacity than the parameter type '{2}' on the publisher.|Warning (Future Error)|
|[AL0594](diagnostic-al594.md)|An error occurred during XML serialization of metadata for symbol: '{0}'. Error: {1}.|Error|
|[AL0595](diagnostic-al595.md)|'{0}' does not implement {1}.|Error|
|[AL0596](diagnostic-al596.md)|Value '{0}' does not implement interface '{1}' and there is no default implementation for the mentioned interface.|Error|
|[AL0598](diagnostic-al598.md)|Cannot move or modify the {0} '{1}' in the same '{2}' that you added.|Warning (Future Error)|
|[AL0599](diagnostic-al599.md)|A control add-in with the same internal name '{0}' is already defined.|Error|
|[AL0600](diagnostic-al600.md)|The property '{0}' can only be set on elements of type Option.|Warning (Future Error)|
|[AL0601](diagnostic-al601.md)|{0} '{1}' is removed. {2}.|Warning (Future Error)|
|[AL0602](diagnostic-al602.md)|'{0}' is inaccessible due to its protection level.|Warning (Future Error)|
|[AL0603](diagnostic-al603.md)|An implicit conversion is being performed from a value of type '{0}' to a value of type '{1}'. This conversion can lead to unexpected runtime issues.|Warning (Future Error)|
|[AL0604](diagnostic-al604.md)|Use of implicit 'with' will be removed in the future. Qualify with '{0}'.|Warning (Future Error)|
|[AL0605](diagnostic-al605.md)|Use of implicit 'with' will be removed in the future. Qualify with '{0}'.|Hidden|
|[AL0606](diagnostic-al606.md)|The 'with' statement is deprecated and will be removed for cloud development in a future release.|Warning (Future Error)|
|[AL0607](diagnostic-al607.md)|The 'with' statement is deprecated and will be removed for cloud development in a future release.|Hidden|
|[AL0608](diagnostic-al608.md)|The OrderBy property must specify at least one field on which to sort the data.|Warning (Future Error)|
|[AL0609](diagnostic-al609.md)|Adding actions to CueGroups is not supported.|Warning|
|[AL0610](diagnostic-al610.md)|Moving actions in CueGroups is not supported.|Warning|
|[AL0611](diagnostic-al611.md)|Modifying actions in CueGroups is not supported.|Warning|
|[AL0612](diagnostic-al612.md)|An interface member must be a 'procedure'.|Error|
|[AL0613](diagnostic-al613.md)|Wrong signature. Correct signature for '{0}' is '{1}'.|Warning (Future Error)|
|[AL0614](diagnostic-al614.md)|The value '{0}' is not allowed for property '{1}'.|Warning (Future Error)|
|[AL0615](diagnostic-al615.md)|Field '{0}' is not specified as a source expression on page '{1}'. All fields specified in ODataKeyFields must be used as the source expression in a page control.|Warning (Future Error)|
|[AL0616](diagnostic-al616.md)|Defining the contract '{0}' on interface '{1}' is not allowed because it is matching a built-in procedure for codeunits.|Error|
|[AL0617](diagnostic-al617.md)|Event trigger 'OnBeforeActionEvent' cannot be used because the action '{0}' specifies the 'RunObject' property.|Warning (Future Error)|
|[AL0619](diagnostic-al619.md)|The attribute '{0}' on procedure '{1}' is not allowed. Add attribute 'ServiceEnabled' to the procedure or move it into an application object of type API.|Error|
|[AL0620](diagnostic-al620.md)|Preprocessor directives must appear as the first non-whitespace character on a line.|Error|
|[AL0621](diagnostic-al621.md)|Preprocessor directive expected.|Error|
|[AL0622](diagnostic-al622.md)|#endregion directive expected.|Error|
|[AL0623](diagnostic-al623.md)|#endif directive expected.|Error|
|[AL0624](diagnostic-al624.md)|Unexpected preprocessor directive.|Error|
|[AL0625](diagnostic-al625.md)|Cannot define/undefine preprocessor symbols after first token in file.|Error|
|[AL0626](diagnostic-al626.md)|Expected identifier or numeric literal.|Warning|
|[AL0627](diagnostic-al627.md)|Expected 'disable' or 'restore' keyword.|Warning|
|[AL0628](diagnostic-al628.md)|Unrecognized #pragma directive.|Warning|
|[AL0629](diagnostic-al629.md)|Preprocessor expression is not valid.|Error|
|[AL0630](diagnostic-al630.md)|Unrecognized escape sequence.|Error|
|[AL0631](diagnostic-al631.md)|Single-line comment or end-of-line expected.|Error|
|[AL0632](diagnostic-al632.md)|Closing parenthesis ')' expected.|Error|
|[AL0633](diagnostic-al633.md)|Expected 'disable', 'enable' or 'restore' keyword.|Warning|
|[AL0634](diagnostic-al634.md)|Single-line comment or end-of-line expected.|Warning|
|[AL0635](diagnostic-al635.md)|A method with 'OnPrem' scope cannot be used as event subscriber. It will fail at runtime when the publisher has 'Cloud' scope.|Warning (Future Error)|
|[AL0636](diagnostic-al636.md)|The data type on the field '{0}' is not valid because the ExtendedDatatype property is set to RichText. Valid data types are Text, BigText and Blob.|Error|
|[AL0637](diagnostic-al637.md)|The property 'NavigationPageId' must be defined on a page of pagetype 'API'.|Error|
|[AL0638](diagnostic-al638.md)|'Variant' is not a valid column type for column '{0}' in report '{1}'.|Error|
|[AL0639](diagnostic-al639.md)|'Variant' is not a valid column type for column '{0}' in report '{1}'.|Warning (Future Error)|
|[AL0640](diagnostic-al640.md)|XML comment has badly formed XML -- '{0}'.|Warning|
|[AL0641](diagnostic-al641.md)|Parameter '{0}' has no matching param tag in the XML comment for '{1}' (but other parameters do).|Warning|
|[AL0642](diagnostic-al642.md)|Missing XML comment for publicly visible type or member '{0}'.|Warning|
|[AL0643](diagnostic-al643.md)|XML comment is not placed on a valid language element.|Warning|
|[AL0644](diagnostic-al644.md)|XML comment has a param tag for '{0}', but there is no parameter by that name.|Warning|
|[AL0645](diagnostic-al645.md)|XML comment on '{1}' has a paramref tag for '{0}', but there is no parameter by that name.|Warning|
|[AL0646](diagnostic-al646.md)|XML comment has a duplicate param tag for '{0}'.|Warning|
|[AL0647](diagnostic-al647.md)|{0}. See also error AL{1}.|Warning|
|[AL0648](diagnostic-al648.md)|End-of-file found, '*/' expected.|Error|
|[AL0649](diagnostic-al649.md)|Comma is not supported in enum value names or in captions. Enum Value = '{0}', Property = '{1}'.|Warning (Future Error)|
|[AL0650](diagnostic-al650.md)|The text with a length of {0} is longer than the MaxLength of {1} which means that the text will be trimmed.|Warning (Future Error)|
|[AL0651](diagnostic-al651.md)|'{0}' cannot be contained since it causes a circular reference.|Error|
|[AL0652](diagnostic-al652.md)|The permission set '{0}' cannot contain itself.|Error|
|[AL0653](diagnostic-al653.md)|Ids are not supported as object reference.|Error|
|[AL0654](diagnostic-al654.md)|The property value contains an unexpected file extension: {0}. The expected extensions are {1}.|Error|
|[AL0655](diagnostic-al655.md)|The property DataItemLinkReference can only refer to an ancestor DataItem.|Warning (Future Error)|
|[AL0656](diagnostic-al656.md)|The {0} '{1}' cannot be used as an anchor because it is already defined in the same '{2}'.|Error|
|[AL0657](diagnostic-al657.md)|The property {0} is mandatory for ListParts and PageParts.|Error|
|[AL0658](diagnostic-al658.md)|Member name '{0}' is only allowed on triggers.|Error|
|[AL0659](diagnostic-al659.md)|The length of the enum identifier '{0}' should not exceed {1} characters as it may result in runtime issues in cases where there are other enums with the same first {1} characters.|Warning|
|[AL0660](diagnostic-al660.md)|The property '{0}' cannot be customized.|Warning (Future Error)|
|[AL0665](diagnostic-al665.md)|'{0}' is not a valid return type in runtime version '{1}'. The supported runtime versions are: {2}.|Error|
|[AL0666](diagnostic-al666.md)|'{0}' is not available in runtime version '{1}'. The supported runtime versions are: {2}.|Error|
|[AL0667](diagnostic-al667.md)|'{0}' is being deprecated in the versions: {1} {2}.|Warning (Future Error)|
|[AL0668](diagnostic-al668.md)|This feature is not available on cross-platform builds of the AL compiler.|Error|
|[AL0670](diagnostic-al670.md)|Fast publishing failed because the RAD file has specified a non-existing application object of type : '{0}' name: '{1}' ID: '{2}' to be added or modified. Please do a full publishing before issuing a fast publishing again.|Error|
|[AL0671](diagnostic-al671.md)|Fast publishing failed because the RAD file has specified an existing application object of type: '{0}' name: '{1}' ID: '{2}' to be deleted. Please do a full publishing before issuing a fast publishing again.|Error|
|[AL0672](diagnostic-al672.md)|Filtering is only allowed on fields where FieldClass is set to Normal. Create a Filter column and specify the filter by using the 'ColumnFilter' property.|Error|
|[AL0673](diagnostic-al673.md)|The property '{0}' is required.|Error|
|[AL0674](diagnostic-al674.md)|The property '{0}' is required when property '{1}' is set to '{2}'.|Error|
|[AL0675](diagnostic-al675.md)|An implementation for the interface '{0}' is already specified in this list.|Error|
|[AL0676](diagnostic-al676.md)|The member '{0}' in object '{1}' cannot be declared as protected in object type '{2}'.|Error|
|[AL0677](diagnostic-al677.md)|The member '{0}' in object '{1}' cannot be declared as protected in object type '{2}'.|Warning (Future Error)|
|[AL0679](diagnostic-al679.md)|The application object '{0}' is not included in any entitlement and will therefore not be accessible in the cloud.|Warning|
|[AL0680](diagnostic-al680.md)|Cannot use addBefore or addAfter on a top-level data item. The anchor {0} is a top level data item.|Error|
|[AL0681](diagnostic-al681.md)|A DataItem with name '{0}' could not be found in the target {1}.|Error|
|[AL0682](diagnostic-al682.md)|A DataItem or Column with name '{0}' could not be found in the target {1}.|Error|
|[AL0683](diagnostic-al683.md)|The permissionset '{0}' belongs to a different module and cannot be used when defining entitlements.|Error|
|[AL0684](diagnostic-al684.md)|The permissionset '{0}' contains permissionsets or permission for objects from other module. Permissions on objects from other modules will be ignored.|Warning|
|[AL0685](diagnostic-al685.md)|The length '{0}' of the calculation formula's target field '{1}' is greater than the length '{2}' of the source flow field '{3}'. This could result in a runtime error. Please make sure that the target field's length is less than equal to the source field length.|Warning (Future Error)|
|[AL0686](diagnostic-al686.md)|The base type already defines a method called '{0}' with the same parameter types.|Error|
|[AL0687](diagnostic-al687.md)|The key '{0}' on table '{1}' cannot contain the fields defined for the primary key in the IncludeFields property.|Error|
|[AL0688](diagnostic-al688.md)|The key '{0}' on table '{1}' cannot contain the fields defined for the key in the IncludeFields property.|Error|
|[AL0689](diagnostic-al689.md)|The key '{0}' on table '{1}' cannot contain the fields defined for the SqlIndex in the IncludeFields property.|Error|
|[AL0690](diagnostic-al690.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must not have the IncludedFields property set.|Error|
|[AL0691](diagnostic-al691.md)|The primary key '{0}' on table '{1}' cannot be obsolete. All related properties will have no effect.|Error|
|[AL0692](diagnostic-al692.md)|The primary key '{0}' on table '{1}' cannot be obsolete. All related properties will have no effect.|Warning (Future Error)|
|[AL0693](diagnostic-al693.md)|The field '{0}' which is part of the primary key of table '{1}' cannot be obsolete. All related properties will have no effect.|Error|
|[AL0694](diagnostic-al694.md)|The field '{0}' which is part of the primary key of table '{1}' cannot be obsolete. All related properties will have no effect.|Warning (Future Error)|
|[AL0695](diagnostic-al695.md)|The method {0} will only be available for {1} development for runtime version {2}.|Warning (Future Error)|
|[AL0696](diagnostic-al696.md)|Argument {0}: The argument should be a valid Field type.|Error|
|[AL0697](diagnostic-al697.md)|Argument {0}: The argument should be a valid Field type.|Warning (Future Error)|
|[AL0698](diagnostic-al698.md)|Type {0} cannot be used in a 'case' statement.|Error|
|[AL0700](diagnostic-al700.md)|Dependency '{0}' should be referenced in the property '{1}' rather than as an explicit dependency.|Warning|
|[AL0702](diagnostic-al702.md)|Dependency '{0}' is referenced in the property '{1}' and as an explicit dependency. Remove the explicit dependency.|Warning|
|[AL0704](diagnostic-al704.md)|A layout must be specified through the 'ExcelLayout' property when the default layout type for a report is 'Excel'.|Error|
|[AL0705](diagnostic-al705.md)|Another layout with name '{0}' already exists.|Error|
|[AL0706](diagnostic-al706.md)|The property '{0}' cannot be used while also specifying the rendering section.|Error|
|[AL0707](diagnostic-al707.md)|Layouts of type '{0}' must specify a LayoutFile with one of the following extensions: {1}.|Error|
|[AL0708](diagnostic-al708.md)|MimeType values must be less than {0} characters in length.|Error|
|[AL0709](diagnostic-al709.md)|The layout file at path '{0}' specified in layout '{1}' in {2} {3} does not exist.|Error|
|[AL0710](diagnostic-al710.md)|The DefaultRenderingLayout property can only be used with layouts specified in the report's rendering section.|Error|
|[AL0711](diagnostic-al711.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'. Duplicate member names are not allowed when defining CueActions.|Warning (Future Error)|
|[AL0712](diagnostic-al712.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'. Duplicate member names are not allowed when defining CueActions.|Error|
|[AL0713](diagnostic-al713.md)|Events in control add-ins should be implemented as triggers.|Error|
|[AL0714](diagnostic-al714.md)|The name '{0}' is an Area type. Using an Area type name will limit extensibility as dependent extension won't be able to reference it.|Error|
|[AL0715](diagnostic-al715.md)|The {0} name '{1}' is reserved for future AL language features.|Warning (Future Error)|
|[AL0716](diagnostic-al716.md)|The {0} name '{1}' is reserved for future AL language features.|Error|
|[AL0717](diagnostic-al717.md)|The property 'TableRelation' or the property 'CalcFormula' is required for the field '{0}' in {1} '{2}' because the field's property 'FieldClass' is set to 'FlowField'.|Warning|
|[AL0718](diagnostic-al718.md)|Report layouts must have a name.|Error|
|[AL0719](diagnostic-al719.md)|Argument {0}: The argument should be a valid Field type. An argument of type Joker or Variant might have an underlying type that is not a valid Field type.|Information|
|[AL0720](diagnostic-al720.md)|An application object '{0} {1}' could not be found in the extension.|Error|
|[AL0721](diagnostic-al721.md)|Reports that use the rendering syntax must also define the DefaultRenderingLayout property.|Error|
|[AL0722](diagnostic-al722.md)|The property '{0}' is not allowed on {1} '{2}' because the {3} '{4}' is using the ActionRef syntax.|Error|
|[AL0723](diagnostic-al723.md)|The {0} '{1}' cannot be used as target of the ActionRef '{2}'. ActionRefs can only target Actions.|Error|
|[AL0724](diagnostic-al724.md)|An area of type '{0}' is not valid on pages of type '{1}'.|Error|
|[AL0725](diagnostic-al725.md)|The action type '{0}' is not allowed in area '{1}'.|Error|
|[AL0726](diagnostic-al726.md)|An identifier, a literal, or an option access is expected as the value of a filter expression.|Error|
|[AL0727](diagnostic-al727.md)|The property '{0}' can only be set if the property '{1}' is set.|Warning (Future Error)|
|[AL0728](diagnostic-al728.md)|The property '{0}' can only be set if the property '{1}' is set to '{2}'.|Warning (Future Error)|
|[AL0729](diagnostic-al729.md)|The property '{0}' can only be set if the property '{1}' is set with any of the values of: '{2}'.|Warning (Future Error)|
|[AL0730](diagnostic-al730.md)|The field '{0}' cannot be used in a sum index.|Error|
|[AL0731](diagnostic-al731.md)|The name '{0}' does not exist in the current context.|Warning (Future Error)|
|[AL0732](diagnostic-al732.md)|Access modifier '{0}' is not allowed for member '{1}' in the context of object type '{2}'.|Error|
|[AL0733](diagnostic-al733.md)|Access modifier '{0}' is not allowed for member '{1}' in the context of object type '{2}'.|Warning (Future Error)|
|[AL0734](diagnostic-al734.md)|The value '{0}' of the property '{1}' is not a valid GUID.|Error|
|[AL0735](diagnostic-al735.md)|The custom action '{0}' cannot be defined in {1} '{2}' because '{2}' uses promoted action properties. Convert the promoted properties into ActionRefs in oder to use custom actions.|Error|
|[AL0736](diagnostic-al736.md)|The value '{0}' of the property 'FlowEnvironmentId' is not a valid. It must either be a GUID or must match the pattern 'Default-<GUID>'.|Error|
|[AL0737](diagnostic-al737.md)|The {0} '{1}' cannot be referenced in {2} '{3}' because '{1}' is defined in the promoted part of the action part while '{3}' uses promoted action properties.|Error|
|[AL0738](diagnostic-al738.md)|The name of {0} '{1}' cannot be empty.|Error|
|[AL0739](diagnostic-al739.md)|The name of {0} '{1}' cannot be empty.|Warning|
|[AL0740](diagnostic-al740.md)|The permission set '{0}' cannot be excluded and included in the same permission set.|Error|
|[AL0741](diagnostic-al741.md)|The permission set '{0}' cannot exclude itself.|Error|
|[AL0742](diagnostic-al742.md)|The property '{0}' is not valid for the cue action '{1}'.|Error|
|[AL0743](diagnostic-al743.md)|The property '{0}' is not valid for the cue action '{1}'.|Warning (Future Error)|
|[AL0999](diagnostic-al999.md)|Internal error: {0}.|Error|
|[AL1000](diagnostic-al1000.md)|Ignoring /noconfig option because it was specified in a response file.|Warning|
|[AL1001](diagnostic-al1001.md)|Source file '{0}' could not be found.|Error|
|[AL1002](diagnostic-al1002.md)|Error opening response file '{0}'.|Error|
|[AL1003](diagnostic-al1003.md)|An instance of analyzer {0} cannot be created from {1} : {2}.|Warning|
|[AL1004](diagnostic-al1004.md)|The assembly {0} does not contain any analyzers.|Warning|
|[AL1005](diagnostic-al1005.md)|Unable to load Analyzer assembly {0} : {1}.|Warning|
|[AL1006](diagnostic-al1006.md)|Metadata file '{0}' could not be found.|Error|
|[AL1007](diagnostic-al1007.md)|Missing file specification for '{0}' option.|Error|
|[AL1008](diagnostic-al1008.md)|Command-line syntax error: Missing '{0}' for '{1}' option.|Error|
|[AL1009](diagnostic-al1009.md)|Unrecognized option: '{0}'.|Error|
|[AL1010](diagnostic-al1010.md)|Command-line syntax error: Missing `:<number>` for '{0}' option.|Error|
|[AL1011](diagnostic-al1011.md)|Source file '{0}' specified multiple times.|Warning|
|[AL1012](diagnostic-al1012.md)|Could not write to output file '{0}' -- '{1}'.|Error|
|[AL1013](diagnostic-al1013.md)|'{0}' is a binary file instead of a text file.|Error|
|[AL1014](diagnostic-al1014.md)|Source file '{0}' could not be opened -- {1}.|Error|
|[AL1015](diagnostic-al1015.md)|Compilation canceled by user.|Error|
|[AL1017](diagnostic-al1017.md)|The manifest file is not valid. {0}.|Error|
|[AL1018](diagnostic-al1018.md)|Directory '{0}' could not be found.|Error|
|[AL1019](diagnostic-al1019.md)|One or more dependencies defined in the project manifest are not valid. One or more of the required attributes: 'publisher', 'name', 'version', and 'id' are either missing or not valid.|Error|
|[AL1021](diagnostic-al1021.md)|The package cache path has not been specified.|Error|
|[AL1022](diagnostic-al1022.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be found in the package cache folder '{3}'.|Error|
|[AL1023](diagnostic-al1023.md)|The package file {0} is not valid.|Error|
|[AL1024](diagnostic-al1024.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be loaded. {3}.|Error|
|[AL1025](diagnostic-al1025.md)|The file at location '{0}' does not match any definition.|Warning|
|[AL1026](diagnostic-al1026.md)|A warning occurred during XML validation: '{0}'.|Warning|
|[AL1028](diagnostic-al1028.md)|An IO exception has happened when trying to write to output file '{0}' -- '{1}'.|Error|
|[AL1029](diagnostic-al1029.md)|Translation file '{0}' has invalid target language '{1}'.|Warning|
|[AL1030](diagnostic-al1030.md)|Translation file '{0}' is missing a target language.|Warning|
|[AL1031](diagnostic-al1031.md)|Successfully included translations for: {0}.|Information|
|[AL1032](diagnostic-al1032.md)|Translation file '{0}' has the same target language as another translation file.|Error|
|[AL1033](diagnostic-al1033.md)|An error occurred while loading the included rule set file {0} - {1}.|Error|
|[AL1034](diagnostic-al1034.md)|The link '{0}' must contain a placeholder with value 0 for the user locale.|Error|
|[AL1035](diagnostic-al1035.md)|The manifest properties 'baseHelpUrl' and 'supportedLocales' must both be specified and have values.|Error|
|[AL1036](diagnostic-al1036.md)|The locale '{0}' is not valid.|Error|
|[AL1037](diagnostic-al1037.md)|The locale '{0}' is already defined.|Error|
|[AL1038](diagnostic-al1038.md)|The version number '{0}' for the property '{1}' does not match the expected format: W.X.Y.Z where W, X, Y, and Z represent positive integers.|Error|
|[AL1039](diagnostic-al1039.md)|The version number '{0}' for the property '{1}' does not match the expected format: X.Y where X and Y represent positive integers.|Error|
|[AL1040](diagnostic-al1040.md)|The guid number '{0}' does not match the expected pattern: "^[0-9a-fA-F]{{8}}-[0-9a-fA-F]{{4}}-[0-9a-fA-F]{{4}}-[0-9a-fA-F]{{4}}-[0-9a-fA-F]{{12}}$".|Error|
|[AL1041](diagnostic-al1041.md)|The property '{0}' must be defined in the manifest.|Error|
|[AL1042](diagnostic-al1042.md)|The id '{0}' for the package with publisher '{1}', name '{2}', and version '{3}' specified in the project manifest does not match the id '{4}' of the package with the same name, publisher, and version found in the package cache folder.|Error|
|[AL1043](diagnostic-al1043.md)|The runtime version '{0}' is not supported by the AL compiler.|Error|
|[AL1044](diagnostic-al1044.md)|The value for the manifest property '{0}' is not valid. Expected type: {1}.|Error|
|[AL1045](diagnostic-al1045.md)|The package cache {0} could not be found.|Error|
|[AL1046](diagnostic-al1046.md)|The application ID ranges {0} are overlapping.|Error|
|[AL1047](diagnostic-al1047.md)|The application ID range {0} is not valid.|Error|
|[AL1048](diagnostic-al1048.md)|Both 'idRange' and 'idRanges' properties are added. You should use the 'idRanges' property and remove the 'idRange' property.|Error|
|[AL1049](diagnostic-al1049.md)|A project without a manifest must have the /out option specified.|Error|
|[AL1050](diagnostic-al1050.md)|Fast publishing requires an application file '{0}' to be build and published.|Error|
|[AL1051](diagnostic-al1051.md)|Fast publishing requires that there are no manifest changes for the application '{0}'.|Error|
|[AL1052](diagnostic-al1052.md)|The link '{0}' can only contain one placeholder with value 0 for the user locale. No other placeholder values are allowed.|Error|
|[AL1053](diagnostic-al1053.md)|The value '{0}' is not valid for the manifest property '{1}'.|Error|
|[AL1054](diagnostic-al1054.md)|Invalid reference module: {0}.|Error|
|[AL1055](diagnostic-al1055.md)|Invalid reference module: {0}.|Warning|
|[AL1056](diagnostic-al1056.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be loaded. {3}.|Warning|
|[AL1057](diagnostic-al1057.md)|The module specification is not valid. One or more of the required attributes: 'publisher', 'name', and 'id' are either missing or not valid.|Error|
|[AL1058](diagnostic-al1058.md)|appId and Id are both specified for a dependency property. The appId value will be ignored.|Warning|
|[AL1059](diagnostic-al1059.md)|Feature '{0}' can only be enabled, if feature '{1}' is also enabled.|Warning|
|[AL1060](diagnostic-al1060.md)|The max degree of parallelism must be -1 or positive.|Error|
|[AL1061](diagnostic-al1061.md)|An error occurred during file validation: '{0}'.|Error|
|[AL1062](diagnostic-al1062.md)|Too many key vault URLs specified.|Error|
|[AL1063](diagnostic-al1063.md)|Key vault URL is too long.|Error|
|[AL1064](diagnostic-al1064.md)|Key vault URL is not a valid URL.|Error|
|[AL1065](diagnostic-al1065.md)|Key vault URL should not have a path or query string.|Error|
|[AL1066](diagnostic-al1066.md)|Duplicate package dependency with application ID '{0}', publisher '{1}', and name '{2}'. Remove duplicate dependencies in the application manifest.|Error|
|[AL1067](diagnostic-al1067.md)|Duplicate package dependency with publisher '{0}', and name '{1}'. Remove duplicate dependencies in the application manifest.|Error|
|[AL1068](diagnostic-al1068.md)|Duplicate package dependency with application ID '{0}', and publisher '{1}'. Remove duplicate dependencies in the application manifest.|Error|
|[AL1069](diagnostic-al1069.md)|Duplicate package dependency with application ID '{0}', and name '{1}'. Remove duplicate dependencies in the application manifest.|Error|
|[AL1070](diagnostic-al1070.md)|Duplicate package dependency with application ID '{0}'. Remove duplicate dependencies in the application manifest.|Error|
|[AL1071](diagnostic-al1071.md)|Error writing to XML documentation file: {0}.|Error|
|[AL1072](diagnostic-al1072.md)|The name for the preprocessing symbol is not valid; '{0}' is not a valid identifier.|Warning|
|[AL1073](diagnostic-al1073.md)|The procedure with name {0} has the same name as a declared trigger.|Error|
|[AL1074](diagnostic-al1074.md)|Both 'applicationInsightsKey' and 'applicationInsightsConnectionString' are added. You should use the 'applicationInsightsConnectionString' property and remove the 'applicationInsightsKey' property.|Error|
|[AL1075](diagnostic-al1075.md)|Both 'ShowMyCode' and 'ResourceExposurePolicy' properties are added. You should use the 'ResourceExposurePolicy' property and remove the 'ShowMyCode' property.|Error|
|[AL1076](diagnostic-al1076.md)|A package that satisfies the dependency on app with ID {0} with name '{1}' and publisher '{2}' was found, but the name or publisher has changed. New name '{3}' and new publisher '{4}'. Consider updating the dependency reference to the new name/publisher.|Information|
|[AL1077](diagnostic-al1077.md)|An error was encountered when trying to load the workspace: {0}.|Error|
|[AL1100](diagnostic-al1100.md)|File name '{0}' is empty, contains invalid characters, has a drive specification without an absolute path, or is too long.|Fatal Error|
|[AL1101](diagnostic-al1101.md)|Target must specify one of: 'internal', 'solution', 'extension'.|Fatal Error|
|[AL1130](diagnostic-al1130.md)|The format of property '{0}' must be a timeout duration specified as '[d.]hh:mm:ss[.fffffff]'.|Error|
|[AL1150](diagnostic-al1150.md)|The link in parameter '{0}' ({1}) is not valid. {2}.|Error|
|[AL1151](diagnostic-al1151.md)|Cannot create a manifest for Extension "{0}" because the Name and Publisher match the current application. Remove this dependency from the application manifest.|Error|
|[AL1152](diagnostic-al1152.md)|Dependency with ID '{0}' matches the current application ID. Remove this dependency from the application manifest.|Error|
|[AL1401](diagnostic-al1401.md)|Reference '{0}' in application object '{1}' does not exist.|Designer Customization Warning|
|[AL1402](diagnostic-al1402.md)|{0} '{1}' is missing.|Designer Customization Warning|
|[AL1403](diagnostic-al1403.md)|'{0}' is an ambiguous reference between '{1}' defined by the extension '{2}' and '{3}' defined by the extension '{4}'.|Designer Customization Warning|
|[AL1404](diagnostic-al1404.md)|The action '{0}' is not found in the target '{1}'.|Designer Customization Warning|
|[AL1405](diagnostic-al1405.md)|The control '{0}' is not found in the target '{1}'.|Designer Customization Warning|
|[AL1406](diagnostic-al1406.md)|The view '{0}' is not found in the target '{1}'.|Designer Customization Warning|
|[AL1407](diagnostic-al1407.md)|At least one target has to be specified for the move.|Designer Customization Warning|
|[AL1408](diagnostic-al1408.md)|Invalid application object identifier. A number or an application object name is expected.|Designer Customization Warning|
|[AL1409](diagnostic-al1409.md)|Page '{0}' should be of type 'RoleCenter'.|Designer Customization Warning|
|[AL1410](diagnostic-al1410.md)|The target {0} {1} for the extension object is not found.|Designer Customization Warning|
|[AL1411](diagnostic-al1411.md)|Multiple page customizations have been specified for the same page {0} within the same profile.|Designer Customization Warning|
|[AL1412](diagnostic-al1412.md)|{0} '{1}' is marked for removal. {2}.|Designer Customization Warning|
|[AL1413](diagnostic-al1413.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.|Designer Customization Warning|
|[AL1414](diagnostic-al1414.md)|The page customization for page '{0}' does not make any modifications, so it can be removed without affecting any profiles or user personalization.|Designer Customization Information|
|[AL1415](diagnostic-al1415.md)|{0} '{1}' is removed. {2}.|Designer Customization Warning|
|[AL1416](diagnostic-al1416.md)|The {0} '{1}' cannot be moved relatively to '{2}' because '{2}' is missing. This move is ignored.|Designer Customization Information|
|[AL1417](diagnostic-al1417.md)|The {0} '{1}' cannot be added relatively to '{2}' because '{2}' is missing. '{1}' is added at a default location instead.|Designer Customization Information|
|[AL1418](diagnostic-al1418.md)|A DataItem with name '{0}' could not be found in the target {1}.|Designer Customization Warning|
|[AL1419](diagnostic-al1419.md)|A DataItem or Column with name '{0}' could not be found in the target {1}.|Designer Customization Warning|
|[AL1420](diagnostic-al1420.md)|The {0} '{1}' cannot be used as target of the ActionRef '{2}'. ActionRefs can only target Actions. Ignoring the ActionRef.|Designer Customization Warning|
|[AL1421](diagnostic-al1421.md)|The {0} '{1}' is using the '{2}' property. This will be automatically converted to the new syntax when customizing the related page in the webclient.|Designer Customization Warning|
|[AL1422](diagnostic-al1422.md)|The target action '{0}' cannot be resolved in page '{1}'. Ignoring the ActionRef.|Designer Customization Warning|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  