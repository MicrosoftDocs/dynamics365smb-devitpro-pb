---
title: "AL Diagnostics"
description: ""
ms.author: solsen
ms.custom: na
ms.date: 08/31/2021
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
# AL Compiler Diagnostics


|Id|Description|Default Severity|
|--|-----------|----------------|
|[AL100](al-100.md)|Unterminated multiline comment.|Error|
|[AL101](al-101.md)|Constant value '{0}' is outside the range for a Decimal.|Error|
|[AL102](al-102.md)|Constant value '{0}' is outside the range for a BigInteger.|Error|
|[AL103](al-103.md)|Constant value '{0}' is outside the range for an Integer.|Error|
|[AL104](al-104.md)|Syntax error, '{0}' expected.|Error|
|[AL105](al-105.md)|Syntax error, identifier expected; '{1}' is a keyword.|Error|
|[AL106](al-106.md)|Syntax error, 'TO' or 'DOWNTO' expected.|Error|
|[AL107](al-107.md)|Syntax error, identifier expected.|Error|
|[AL108](al-108.md)|Indexers must have at least one value.|Error|
|[AL109](al-109.md)|Unexpected token.|Error|
|[AL110](al-110.md)|Orphaned ELSE statement. This is most likely because of an unnecessary semicolon placed just before the ELSE keyword.|Error|
|[AL111](al-111.md)|Semicolon expected.|Error|
|[AL112](al-112.md)|{0} is not a valid attribute.|Error|
|[AL113](al-113.md)|At least one dimension must be specified.|Error|
|[AL114](al-114.md)|Syntax error, integer literal expected.|Error|
|[AL115](al-115.md)|Object type expected.|Error|
|[AL116](al-116.md)|Invalid value for '{0}'. Allowed values are '{1}'.|Error|
|[AL117](al-117.md)|Illegal statement. Only assignment and method invocation can be used as a statement.|Error|
|[AL118](al-118.md)|The name '{0}' does not exist in the current context.|Error|
|[AL119](al-119.md)|The parameter name '{0}' is already defined.|Error|
|[AL120](al-120.md)|A local or parameter named '{0}' cannot be declared in this scope because that name is used in an enclosing local scope to define a local or parameter.|Error|
|[AL121](al-121.md)|The variable name '{0}' is already defined.|Error|
|[AL122](al-122.md)|Cannot implicitly convert type '{0}' to '{1}'.|Error|
|[AL123](al-123.md)|The return value name '{0}' is already defined.|Error|
|[AL124](al-124.md)|The property '{0}' cannot be used in this context.|Error|
|[AL125](al-125.md)|Method name expected.|Error|
|[AL126](al-126.md)|No overload for method '{0}' takes {1} arguments. Candidates: {2}.|Error|
|[AL127](al-127.md)|Member '{0}' cannot be used like a method.|Error|
|[AL128](al-128.md)|Language identifier expected.|Error|
|[AL129](al-129.md)|The left-hand side of an assignment must be a variable or field.|Error|
|[AL130](al-130.md)|A 'var' argument must be an assignable variable.|Error|
|[AL131](al-131.md)|The property CharAllowed must be specified in pairs of characters. The first character in the pair must be equal to or less than the second.|Error|
|[AL132](al-132.md)|'{0}' does not contain a definition for '{1}'.|Error|
|[AL133](al-133.md)|Argument {0}: cannot convert from '{1}' to '{2}'.|Error|
|[AL134](al-134.md)|'{0}' is not recognized as a valid type.|Error|
|[AL135](al-135.md)|There is no argument given that corresponds to the required formal parameter '{0}' of '{1}'.|Error|
|[AL136](al-136.md)|The loop variable in a 'for' statement must be a numeric type.|Error|
|[AL137](al-137.md)|No enclosing loop out of which to break.|Error|
|[AL138](al-138.md)|The case expression cannot be an array.|Error|
|[AL139](al-139.md)|Since '{0}' doesn't have a return value, EXIT cannot be called with a value.|Error|
|[AL140](al-140.md)|The expression is not valid for the WITH statement.|Error|
|[AL142](al-142.md)|Only variables of type record can be marked as TEMPORARY.|Error|
|[AL143](al-143.md)|Cannot apply indexing with [] to an expression of type '{0}'.|Error|
|[AL144](al-144.md)|Wrong number of indices inside []; expected {0}.|Error|
|[AL145](al-145.md)|Assignment is not valid for arrays.|Error|
|[AL146](al-146.md)|The maximum number of array elements is {0}. Actual number is {1}.|Error|
|[AL147](al-147.md)|An array dimension must be a positive number.|Error|
|[AL148](al-148.md)|The table filter is not valid.|Error|
|[AL149](al-149.md)|There is an 'ELSE' statement without an 'IF' in property {0}.|Error|
|[AL150](al-150.md)|Invalid CONST expression. A valid integer or an identifier is expected.|Error|
|[AL151](al-151.md)|Expression must be an Option.|Error|
|[AL152](al-152.md)|The value '{0}' is used more than once.|Error|
|[AL153](al-153.md)|The property '{0}' cannot be blank.|Error|
|[AL154](al-154.md)|The maximum length for a field of type '{0}' is {1}.|Error|
|[AL155](al-155.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.|Error|
|[AL156](al-156.md)|'{0}' is not a valid field type.|Error|
|[AL157](al-157.md)|'{0}' is not a valid variable type.|Error|
|[AL158](al-158.md)|'{0}' is not a valid parameter type.|Error|
|[AL159](al-159.md)|'{0}' is not a valid return type.|Error|
|[AL160](al-160.md)|'{0}' is not a valid language identifier.|Error|
|[AL161](al-161.md)|'{0}' is inaccessible due to its protection level.|Error|
|[AL162](al-162.md)|'{0}' is not a valid trigger.|Error|
|[AL163](al-163.md)|Wrong signature. Correct signature for '{0}' is '{1}'.|Error|
|[AL164](al-164.md)|The trigger '{0}' is already defined.|Error|
|[AL165](al-165.md)|Triggers cannot be called directly.|Error|
|[AL166](al-166.md)|Argument {0}: must be a member.|Error|
|[AL167](al-167.md)|The property '{0}' can only be set if the property '{1}' is set with any of the values of :'{2}'.|Error|
|[AL168](al-168.md)|The property '{0}' can only be set if the property '{1}' is set.|Error|
|[AL169](al-169.md)|The option value '{0}' is not valid.|Error|
|[AL170](al-170.md)|An '=' is expected for property {0}.|Error|
|[AL171](al-171.md)|The property value '{0}' on property '{1}' is not valid.|Error|
|[AL172](al-172.md)|Operator '{0}' is ambiguous on an operand of type '{1}'.|Error|
|[AL173](al-173.md)|Operator '{0}' cannot be applied to an operand of type '{1}'.|Error|
|[AL174](al-174.md)|Operator '{0}' is ambiguous on operands of type '{1}' and '{2}'.|Error|
|[AL175](al-175.md)|Operator '{0}' cannot be applied to operands of type '{1}' and '{2}'.|Error|
|[AL176](al-176.md)|Expected one of the calculation formula methods (Average,Count,Exist,Min,Max,Lookup,Sum).|Error|
|[AL177](al-177.md)|Invalid application object identifier. A number or an application object name is expected.|Error|
|[AL178](al-178.md)|A 'FILTER' keyword or an identifier is expected.|Error|
|[AL179](al-179.md)|An identifier or a member access expression is expected.|Error|
|[AL180](al-180.md)|A 'FILTER' keyword is expected.|Error|
|[AL181](al-181.md)|Invalid filter expression.|Error|
|[AL182](al-182.md)|An identifier or a literal is expected as the value of a filter expression.|Error|
|[AL183](al-183.md)|Unexpected character '{0}'.|Error|
|[AL184](al-184.md)|The expression '{0}' is not valid.|Error|
|[AL185](al-185.md)|{0} '{1}' is missing.|Error|
|[AL186](al-186.md)|Reference '{0}' in application object '{1}' does not exist.|Error|
|[AL187](al-187.md)|Attribute '{0}' is valid only for {1}.|Error|
|[AL189](al-189.md)|Attribute '{0}' cannot be specified, because '{1}' is already specified.|Error|
|[AL190](al-190.md)|Constant value '{0}' is outside the range for a Time.|Error|
|[AL191](al-191.md)|Constant value '{0}' is outside the range for a Date. The syntax for defining Date format is yyyymmddD, where D is a mandatory letter. For example, 20180325D, read as the 25th of March, 2018.|Error|
|[AL192](al-192.md)|The return value must be used for the method '{0}'.|Error|
|[AL193](al-193.md)|Argument {0}: cannot convert from '{1}' to the type of Argument 1 '{2}'.|Error|
|[AL195](al-195.md)|Invalid permission kind. Expected: '{0}'.|Error|
|[AL196](al-196.md)|The call is ambiguous between the method '{0}' defined in {1} '{2}' by the extension '{3}' and the method '{4}' defined in {5} '{6}' by the extension '{7}'.|Error|
|[AL197](al-197.md)|An application object of type '{0}' with name '{1}' is already declared by the extension '{2}'.|Error|
|[AL198](al-198.md)|Expected one of the application object keywords ({0}).|Error|
|[AL199](al-199.md)|The type of the sum index field '{0}' must be numeric(Decimal, BigInteger, Integer, or Duration) .|Error|
|[AL200](al-200.md)|Property '{0}' is obsolete and will be removed in a future version.|Warning|
|[AL201](al-201.md)|The {0} FlowField is not a Boolean field. If a FlowField CalcFormula starts with 'Exist', then the FlowField must be a Boolean type field.|Error|
|[AL202](al-202.md)|The {0} FlowField is not an Integer field. If a FlowField CalcFormula starts with 'Count', then the FlowField must be an Integer type field.|Error|
|[AL203](al-203.md)|Cannot calculate Sum or Average for the field {0} because it is not a numeric field (Decimal, BigInteger, Integer, or Duration data type).|Error|
|[AL204](al-204.md)|Field type {0} is not convertible to field type {1}.|Error|
|[AL206](al-206.md)|A field with ID {0} is already defined in {1} '{2}' by the extension '{3}'.|Error|
|[AL207](al-207.md)|The expression must be of Text type.|Error|
|[AL208](al-208.md)|The expression must be of Boolean type.|Error|
|[AL210](al-210.md)|A control with ID = {0} is already defined.|Error|
|[AL211](al-211.md)|Unknown area type '{0}'.|Error|
|[AL212](al-212.md)|An area of type '{0}' is already defined.|Error|
|[AL213](al-213.md)|An area of type '{0}' is only valid on pages of type '{1}'.|Error|
|[AL214](al-214.md)|An area of type 'FactBoxes' is not valid on Part type pages.|Error|
|[AL215](al-215.md)|A Part type page cannot contain other parts.|Error|
|[AL216](al-216.md)|Only parts are valid in an area of type 'FactBoxes'.|Error|
|[AL217](al-217.md)|Only parts and groups are valid in an area of type 'RoleCenter'.|Error|
|[AL218](al-218.md)|An integer literal value is expected for property {0}.|Error|
|[AL219](al-219.md)|Syntax error, string literal expected.|Error|
|[AL220](al-220.md)|Syntax error, boolean literal expected.|Error|
|[AL221](al-221.md)|The value '{0}' is not valid. The valid range is {1}..{2}.|Error|
|[AL222](al-222.md)|The ID '{0}' is not valid. ID's must be greater than zero.|Error|
|[AL223](al-223.md)|The property '{0}' can only be set if the property '{1}' is set to '{2}'.|Error|
|[AL224](al-224.md)|Expression expected.|Error|
|[AL227](al-227.md)|A key with ID {0} is already defined.|Error|
|[AL228](al-228.md)|A field group with ID {0} is already defined.|Error|
|[AL229](al-229.md)|The data type on the {0} field is not valid because the ExtendedDatatype property is set to Ratio. Valid data types are Integer, BigInteger and Decimal.|Error|
|[AL230](al-230.md)|The data type on the {0} field is not valid because the ExtendedDatatype property is set to PhoneNo, URL or Email. Valid data types are Code and Text.|Error|
|[AL231](al-231.md)|A member with ID '{0}' is already defined in {1} '{2}' by the extension '{3}'.|Error|
|[AL232](al-232.md)|The property value on field '{0}' must be positive or zero.|Error|
|[AL234](al-234.md)|An action with ID = {0} is already defined.|Error|
|[AL235](al-235.md)|The expression CONST() on the option value '{0}' is obsolete. Use CONST(" ") to refer to the empty option value.|Warning|
|[AL236](al-236.md)|An empty CONST() expression is not allowed on field '{0}' of type '{1}'.|Error|
|[AL238](al-238.md)|No overload for attribute '{0}' expects {1} arguments.|Error|
|[AL239](al-239.md)|Attribute {0} is specified multiple times.|Error|
|[AL240](al-240.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}': parameter {2} is expected to be of type '{3}' but found type '{4}'. The expected signature is: {5}.|Error|
|[AL241](al-241.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}'. The expected signature is: {2}.|Error|
|[AL242](al-242.md)|Invalid attribute argument syntax: '{0}'.|Error|
|[AL243](al-243.md)|Attribute {0} can only be used within a codeunit of subtype {1}.|Error|
|[AL244](al-244.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}': return value is expected to be of type '{2}' but found type '{3}'. The expected signature is: {4}.|Error|
|[AL245](al-245.md)|The signature of procedure '{0}' does not match the signature required by attribute '{1}': procedure cannot be local.|Error|
|[AL246](al-246.md)|The property '{0}' cannot be customized.|Error|
|[AL247](al-247.md)|The target {0} {1} for the extension object is not found.|Error|
|[AL249](al-249.md)|The Page '{0}' is not found.|Error|
|[AL250](al-250.md)|The data type on the {0} field is not valid because the ExtendedDatatype property is set to Person. Valid data types are Media and MediaSet.|Error|
|[AL251](al-251.md)|Application object '{0}' is missing.|Warning|
|[AL252](al-252.md)|Expected 'Ascending' or 'Descending' value.|Error|
|[AL254](al-254.md)|Sorting field '{0}' should be part of the keys for table '{1}'.|Warning|
|[AL255](al-255.md)|Property '{0}' requires an application object reference for the 'RunObject' property.|Error|
|[AL256](al-256.md)|The flowfield '{0}' cannot be part of the keys for table '{1}'.|Error|
|[AL257](al-257.md)|Constant value '{0}' is outside the range for a DateTime data type, only 0 is valid.|Error|
|[AL259](al-259.md)|A SQLIndex defined for the primary key must contain the same fields as the key for table '{0}'.    .|Error|
|[AL260](al-260.md)|The key '{0}' on table '{1}' cannot start with the fields defined for the primary key. The server will append these to any alternate key.    .|Error|
|[AL261](al-261.md)|The identifier '{0}' can only be specified in the list once.|Error|
|[AL262](al-262.md)|The clustered key '{0}' has already been defined for table '{1}'.    .|Error|
|[AL263](al-263.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must be enabled.    .|Error|
|[AL264](al-264.md)|An application object of type '{0}' with ID '{1}' is already declared by the extension '{2}'.|Error|
|[AL266](al-266.md)|Pages of types 'CardPart' and 'ListPart' can only contain Processing areas.|Error|
|[AL267](al-267.md)|Actions are not allowed on the control type.|Error|
|[AL268](al-268.md)|Grouping of actions is not allowed.|Error|
|[AL269](al-269.md)|The referenced page '{0}' should be a list part or a card part.|Warning (future error)|
|[AL270](al-270.md)|The control '{0}' is not found in the target '{1}'.|Error|
|[AL271](al-271.md)|The action '{0}' is not found in the target '{1}'.|Error|
|[AL272](al-272.md)|The anchoring symbol '{0}' must be a grouping symbol.|Error|
|[AL273](al-273.md)|The name '{0}' is an Area type. Using an Area type name may limit extensibility.|Warning|
|[AL274](al-274.md)|The anchoring symbol '{0}' cannot be an area.|Error|
|[AL275](al-275.md)|'{0}' is an ambiguous reference between '{1}' defined by the extension '{2}' and '{3}' defined by the extension '{4}'.|Error|
|[AL276](al-276.md)|A Time literal value is expected for property {0}.|Error|
|[AL277](al-277.md)|A Date literal value is expected for property {0}.|Error|
|[AL278](al-278.md)|A DateTime literal value is expected for property {0}.|Error|
|[AL279](al-279.md)|The key '{0}' on table '{1}' contains too many fields.|Error|
|[AL280](al-280.md)|The event '{0}' is not found in the target.|Error|
|[AL281](al-281.md)|Object member '{0}' is not an event.|Error|
|[AL282](al-282.md)|The member referenced by event subscriber '{0}' parameter '{1}' is not found.|Error|
|[AL283](al-283.md)|The event '{0}' must not have a return value.|Error|
|[AL284](al-284.md)|The type of the parameter '{1}' on the event subscriber '{0}' does not match the expected type '{2}'.|Error|
|[AL285](al-285.md)|The event '{0}' must not have a parameter name 'sender' when it specifies to include sender.|Error|
|[AL286](al-286.md)|The event '{0}' can't contain code.|Error|
|[AL287](al-287.md)|The event '{0}' can't contain local variables.|Error|
|[AL288](al-288.md)|Parameter '{0}' is only allowed to be 'var' if the publisher parameter is 'var'.|Error|
|[AL290](al-290.md)|Element name is not allowed for the event '{0}' and must be empty.|Error|
|[AL291](al-291.md)|Event trigger '{0}' can only be used if the page specifies the 'SourceTable' property.|Error|
|[AL292](al-292.md)|'FIELD', 'CONST' or 'FILTER' keyword is expected.|Error|
|[AL293](al-293.md)|Property value {0} is not in the field's OptionMembers.|Error|
|[AL294](al-294.md)|The type of property value {0} does not match the field’s type.|Error|
|[AL295](al-295.md)|The field '{0}' is not found in the target '{1}'.|Error|
|[AL296](al-296.md)|The application object or method '{0}' has scope '{1}' and cannot be used for '{2}' development. For more information, see: https://docs.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-compilation-scope-overview.|Error|
|[AL297](al-297.md)|The application object identifier '{0}' is not valid. It must be within the allowed ranges '{1}'.|Error|
|[AL298](al-298.md)|The data type of the expression assigned to the 'StyleExpr' property is not valid. Valid data types are Boolean, Text, or Code.|Error|
|[AL299](al-299.md)|Member name '{0}' is only allowed on triggers.|Warning (future error)|
|[AL300](al-300.md)|The property '{0}' is used as a method.|Error|
|[AL301](al-301.md)|A list must end with a member; not a separator {0}.|Error|
|[AL302](al-302.md)|Cannot use '{0}' in {1} '{2}' before it is declared.|Error|
|[AL303](al-303.md)|Attributes can only be defined on variables and methods.|Error|
|[AL304](al-304.md)|Length of the identifier '{0}' cannot exceed {1} characters.|Error|
|[AL305](al-305.md)|Length of the application object identifier '{0}' cannot exceed {1} characters.|Error|
|[AL306](al-306.md)|A field list has to contain at least one field.|Error|
|[AL307](al-307.md)|Property value cannot be validated because the source table is unreachable.|Error|
|[AL308](al-308.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must have the MaintainSqlIndex property set to true.    .|Error|
|[AL309](al-309.md)|Table '{0}' contains too many keys.|Error|
|[AL310](al-310.md)|An instance is required for the non-static member '{0}'.|Error|
|[AL311](al-311.md)|Member '{0}' cannot be accessed with an instance reference; qualify it with '{1}' instead.|Error|
|[AL313](al-313.md)|Attribute {0} can only be used within {1}.|Error|
|[AL314](al-314.md)|The property '{0}' is only valid in controls of type '{1}'.|Error|
|[AL315](al-315.md)|Control '{0}' does not exist in group '{1}'.|Error|
|[AL316](al-316.md)|The expression must be of Integer type.|Error|
|[AL317](al-317.md)|A property with the same name has already been declared.|Error|
|[AL318](al-318.md)|The value assigned to the 'RunObject' property is not valid. Valid object types are codeunit, page, xmlport, report, and query.|Error|
|[AL319](al-319.md)|At least one target has to be specified for the move.|Error|
|[AL320](al-320.md)|The referenced page '{0}' must specify a 'SourceTable'.|Error|
|[AL321](al-321.md)|Variable {0} cannot be included in the data set.|Error|
|[AL322](al-322.md)|{0} is not valid for client expressions.|Error|
|[AL323](al-323.md)|The value assigned to the SystemPart type is not valid. Valid values are {0}.|Error|
|[AL324](al-324.md)|The language {0} must only be specified one time.|Error|
|[AL325](al-325.md)|The field '{0}' in the table '{1}' cannot be included in a key because its type is '{2}'.|Error|
|[AL326](al-326.md)|'{0}' is not a valid column type.|Error|
|[AL327](al-327.md)|Missing file '{0}'.|Error|
|[AL329](al-329.md)|The {0} property must reference a top-level DataItem.|Error|
|[AL331](al-331.md)|The property 'DataItemLink' cannot be set on a top-level DataItem.|Error|
|[AL332](al-332.md)|The control {0} must be of type {1}.|Error|
|[AL333](al-333.md)|The syntax for accessing fields is not valid. Specify target field with 'tableName.fieldName' syntax.|Error|
|[AL334](al-334.md)|The extension object '{0}' cannot be declared. Another extension for target '{1}' or the target itself is already declared in this module.|Error|
|[AL335](al-335.md)|Attributes must be specified before elements inside of an element.|Error|
|[AL336](al-336.md)|There must be exactly one root node and it has to be an element.|Error|
|[AL337](al-337.md)|None of the specified parent table elements has the name {0}.|Error|
|[AL338](al-338.md)|Event trigger '{0}' can only be used if the page specifies 'SourceTable'. Table '{1}' is missing.|Error|
|[AL340](al-340.md)|Page '{0}' should be of type 'RoleCenter'.|Error|
|[AL341](al-341.md)|'{0}' property is missing.|Error|
|[AL342](al-342.md)|You cannot combine two DataItems at the same level because unions are not supported.|Error|
|[AL343](al-343.md)|Queries must define a top-level DataItem.|Error|
|[AL344](al-344.md)|The property 'DataItemLink' must be set.|Error|
|[AL345](al-345.md)|The source of a Column or Filter must be a field defined on the table referenced by its parent DataItem.|Error|
|[AL346](al-346.md)|The methods '{0}' can only be used on Columns that have a Date or DateTime type.|Error|
|[AL347](al-347.md)|The methods '{0}' can only be used on Columns that have a Decimal, BigInteger, Integer, or Duration type.|Error|
|[AL349](al-349.md)|Column '{0}' does not exist in application object '{1}'.|Error|
|[AL350](al-350.md)|The column '{0}' cannot be used multiple times when defining the order of the resulting dataset.|Error|
|[AL351](al-351.md)|The property 'DataItemLink' can only reference fields on ancestor data items.|Error|
|[AL352](al-352.md)|Queries must define at least one Column.|Error|
|[AL353](al-353.md)|A Column must have a valid data source or have the 'Method' property set to 'Count'.|Error|
|[AL354](al-354.md)|Cannot move element '{0}' relative to itself in page '{1}'.|Error|
|[AL355](al-355.md)|Cannot move the {0} '{1}' multiple times inside of a single move operation.|Error|
|[AL356](al-356.md)|Cannot modify the {0} '{1}' multiple times.|Error|
|[AL357](al-357.md)|Cannot add {0} '{1}' with the same name multiple times.|Error|
|[AL358](al-358.md)|Cannot move or modify the {0} '{1}' in the same '{2}' that you added.|Error|
|[AL359](al-359.md)|The XML node name is not valid. {0}.|Error|
|[AL360](al-360.md)|Text literal was not properly terminated. Use the character ' to terminate the literal.|Error|
|[AL361](al-361.md)|Identifier was not properly terminated. Use the character " to terminate the identifier.|Error|
|[AL362](al-362.md)|The path must be relative to the project root.|Error|
|[AL364](al-364.md)|Option members must be accessed with ::.|Error|
|[AL365](al-365.md)|The property '{0}' cannot be set if the property '{1}' is set to '{2}'.|Error|
|[AL366](al-366.md)|A table has to have at least one Normal field.|Error|
|[AL367](al-367.md)|An array must have at least one dimension.|Error|
|[AL368](al-368.md)|The maximum number of array dimensions is {0}.|Error|
|[AL369](al-369.md)|Constant value '{0}' cannot be converted to a '{1}'.|Error|
|[AL370](al-370.md)|Division by constant zero.|Error|
|[AL371](al-371.md)|The operation overflows at compile time.|Error|
|[AL372](al-372.md)|The length of the String constant exceeds the current memory limit.|Error|
|[AL373](al-373.md)|The XML name cannot be empty.|Error|
|[AL374](al-374.md)|The use of a unique ID has been deprecated and the ID can be removed.|Warning|
|[AL375](al-375.md)|Option members cannot contain comma.|Error|
|[AL376](al-376.md)|A control of type '{0}' is not allowed in a parent control of type '{1}'.|Error|
|[AL377](al-377.md)|'{0}' is not a valid value for the '{1}' attribute on variables of type '{2}'.|Error|
|[AL378](al-378.md)|A page of type Role Center cannot have triggers.|Error|
|[AL379](al-379.md)|The name '{0}' cannot be used as an identifier because it does not comply with the Common Language Specification.|Error|
|[AL380](al-380.md)|Cannot move symbol '{0}' from '{1}' area to '{2}' area.|Error|
|[AL381](al-381.md)|The keys '{0}' and '{1}' have an identical list of fields.|Error|
|[AL382](al-382.md)|The option value '{0}' is defined more than once on field '{1}'.|Error|
|[AL383](al-383.md)|The option value '{0}' is not defined on field '{1}'.|Error|
|[AL384](al-384.md)|The name of all the columns and all the labels defined in a report must be unique.|Error|
|[AL385](al-385.md)|IncludeCaption can be set to true only if the source of the column is a named field.|Error|
|[AL386](al-386.md)|A required package dependency could not be found. Make sure that you have downloaded all the referenced packages and their dependencies.|Error|
|[AL387](al-387.md)|Namespace '{0}' is already specified.|Error|
|[AL388](al-388.md)|The date formula '{0}' must include plus (+) or minus (-).|Error|
|[AL389](al-389.md)|The date formula '{0}' contains a number that is too large. The number must be in the range {1} - {2}.|Error|
|[AL390](al-390.md)|The date formula '{0}' must include a time unit. Time units can be: D,WD,W,M,Q, or Y. C specifies the current time unit based on date and can be used as a prefix to any of the time units.|Error|
|[AL391](al-391.md)|The date formula '{0}' must include a number.|Error|
|[AL392](al-392.md)|The input cannot be longer than {0}.|Error|
|[AL393](al-393.md)|Application object {0} is already referenced.|Error|
|[AL395](al-395.md)|You can only specify Move and Modify actions in the layout section of a page customization.|Error|
|[AL396](al-396.md)|Procedures and triggers are not allowed on page customizations.|Error|
|[AL397](al-397.md)|The name '{0}' clashes with '{1}' column's format column name.|Error|
|[AL398](al-398.md)|Constant value '{0}' is outside of the valid ordinal range for this {1} type.|Error|
|[AL399](al-399.md)|Global variables are not allowed on page customizations.|Error|
|[AL401](al-401.md)|Multiple page customizations have been specified for the same page {0} within the same profile.|Error|
|[AL402](al-402.md)|Expression {0} cannot be specified more than once in a case statement.|Error|
|[AL403](al-403.md)|To modify '{0}' you must add at least one property or trigger.|Error|
|[AL404](al-404.md)|Property '{0}' is not allowed on a table extension.|Error|
|[AL405](al-405.md)|An option value is expected.|Error|
|[AL406](al-406.md)|The type for {0} is not valid. Expected {1}, but found {2}.|Error|
|[AL407](al-407.md)|The generic '{0}' type expects {1} type arguments.|Error|
|[AL408](al-408.md)|The type '{0}' cannot be used as a type argument in this context.|Error|
|[AL409](al-409.md)|The '{0}' type is not a generic type.|Error|
|[AL410](al-410.md)|The report '{0}' doesn't contain a Request Page.|Error|
|[AL411](al-411.md)|{0} can be specified only once.|Error|
|[AL412](al-412.md)|Member '{0}' could not be declared in an object of type '{1}'.|Error|
|[AL413](al-413.md)|Procedure '{0}' cannot have a body.|Error|
|[AL414](al-414.md)|Procedure '{0}' must declare a body.|Error|
|[AL415](al-415.md)|Keyword 'local' cannot be specified for procedure '{0}'.|Error|
|[AL416](al-416.md)|Method '{0}' cannot have a return value.|Error|
|[AL417](al-417.md)|Control add-in '{0}' not found.|Error|
|[AL418](al-418.md)|The format of resource '{0}' is not valid. Resources in the control add-in should either be relative to the project root, or reference external files using the HTTP or HTTPS protocol.|Error|
|[AL419](al-419.md)|The event subscriber '{0}' is missing a parameter of type '{1}'.|Error|
|[AL420](al-420.md)|Parameter '{0}' cannot be 'var'.|Error|
|[AL421](al-421.md)|A ‘foreach’ statement can only be used with an expression of an enumerable type.|Error|
|[AL422](al-422.md)|Constant value {0} is not a valid value for APIVersion. Valid values are 'beta' or of type 'vX.Y' where X and Y represent positive integers.|Error|
|[AL423](al-423.md)|The property '{0}' can only be set if the specified fields are from the same table.|Error|
|[AL424](al-424.md)|The multilanguage syntax is being deprecated. Please update to the new syntax.|Warning|
|[AL425](al-425.md)|The '{0}' trigger can only be used on codeunits that have the Subtype property set to '{1}'.|Error|
|[AL426](al-426.md)|The APIVersion {0} is specified multiple times.|Error|
|[AL427](al-427.md)|Field {0} cannot be converted to type {1}.|Error|
|[AL428](al-428.md)|Cannot specify {0} and {1} property at the same time. Use only the {1} property.|Error|
|[AL429](al-429.md)|A repeater control can only be added to pages that have a source table.|Error|
|[AL430](al-430.md)|The parameter '{0}' has a type which is not serializable and therefore cannot be used in the given context.|Error|
|[AL432](al-432.md)|{0} '{1}' is marked for removal. {2}.|Warning|
|[AL433](al-433.md)|{0} '{1}' is removed. {2}.|Error|
|[AL434](al-434.md)|Syntax error, numeric literal expected.|Error|
|[AL435](al-435.md)|Syntax error, literal expected.|Error|
|[AL436](al-436.md)|The value of the property '{0}' cannot be empty.|Error|
|[AL437](al-437.md)|The value of the '{0}' property cannot include empty members.|Error|
|[AL438](al-438.md)|The type of value {0} does not match the field’s type.|Error|
|[AL439](al-439.md)|The label's property is not valid. Possible properties are: {0}.|Error|
|[AL440](al-440.md)|The '{0}' already defines a method called '{1}' with the same parameter types in '{2}'.|Error|
|[AL441](al-441.md)|Parameter {0} is only available when the page specifies a 'SourceTable'.|Error|
|[AL442](al-442.md)|Parameter {0} is only available when the page specifies a 'SourceTable'. Table '{1}' is missing.|Error|
|[AL443](al-443.md)|The system object provided is not one of the valid system objects.|Error|
|[AL444](al-444.md)|Malformed {0} report layout at location '{1}'. The issue is: '{2}'.|Error|
|[AL445](al-445.md)|The file '{0}' is opened in another application. Close the application to be able to compile.|Error|
|[AL447](al-447.md)|The value '{0}' for the property '{1}' cannot be used for '{2}' development.|Error|
|[AL448](al-448.md)|Member is not allowed in this context.|Error|
|[AL449](al-449.md)|The alias '{0}' is already declared.|Error|
|[AL450](al-450.md)|Field '{0}' is removed and cannot be used in an active key.|Error|
|[AL451](al-451.md)|An assembly named '{0}' could not be found in the assembly probing paths '{1}'.|Error|
|[AL452](al-452.md)|The type '{0}' could not be found in assembly '{1}'.|Error|
|[AL453](al-453.md)|This feature is under development. It can be enabled by using the '{0}' feature flag.|Error|
|[AL454](al-454.md)|The {0} {1} of type {2} cannot be extended.|Error|
|[AL455](al-455.md)|Option ordinal value '{0}' is not valid. Valid values are -1 and positive integers.|Error|
|[AL456](al-456.md)|The number of option ordinal values is not valid. There must be as many option ordinal values as there are option members.|Error|
|[AL457](al-457.md)|The label syntax is not correct. Please move the '{0}' to its designated attribute.|Warning|
|[AL458](al-458.md)|'{0}' is not a valid attribute on variables of type '{1}'.|Error|
|[AL459](al-459.md)|The attribute '{0}' is only allowed on global variables.|Error|
|[AL460](al-460.md)|Client-side events are supported only on pages and page extensions.|Error|
|[AL461](al-461.md)|'{0}' is not a valid event publisher.|Error|
|[AL462](al-462.md)|The publisher '{0}' does not have any public events named '{1}'.|Error|
|[AL463](al-463.md)|Parameter '{0}' must be 'var' if and only if the publisher parameter is 'var'.|Error|
|[AL464](al-464.md)|Could not determine a suitable default primary key for table '{0}'. Please specify a primary key for the table.|Error|
|[AL465](al-465.md)|The property '{0}' does not accept references to external files.|Error|
|[AL466](al-466.md)|Cannot access file '{0}'. The file is most likely read-only.|Error|
|[AL467](al-467.md)|Cannot access file '{0}'. The file is most likely read-only.|Warning|
|[AL468](al-468.md)|Length of the table field name '{0}' must not exceed {1} characters. Longer field names are prone to cause SQL errors.|Warning (future error)|
|[AL470](al-470.md)|The referenced page '{0}' of PageType 'HeadlinePart' is only allowed inside pages of PageType 'RoleCenter'.|Error|
|[AL471](al-471.md)|The format of link '{0}' is not valid. It should be using the HTTP or HTTPS protocol.|Error|
|[AL472](al-472.md)|The source of the translation item does not match the label value. Ignoring the translation item.|Warning|
|[AL473](al-473.md)|The translated string of the translation item is too long. Trimming the translated string.|Warning|
|[AL474](al-474.md)|The attribute '{0}' is only allowed on local variables.|Error|
|[AL475](al-475.md)|The attribute '{0}' cannot be used on variables of array type.|Error|
|[AL476](al-476.md)|The trigger '{0}' can only be used if the property '{1}' of '{2}' is set.|Error|
|[AL477](al-477.md)|The trigger '{0}' can only be used if the property '{1}' of '{2}' is set to '{3}'.|Error|
|[AL478](al-478.md)|The trigger '{0}' can only be used if the property '{1}' of '{2}' is set with any of the values of :'{3}'.|Error|
|[AL479](al-479.md)|There must be only one translation item for each ID.|Warning|
|[AL480](al-480.md)|Attributes cannot have nested elements.|Error|
|[AL481](al-481.md)|The property Image can only be used on fields that are contained in a CueGroup control.|Warning (future error)|
|[AL482](al-482.md)|The image {0} is not valid in this context.|Warning|
|[AL483](al-483.md)|The property Image cannot be used on nested Action Groups inside the 'Sections' area.|Warning|
|[AL484](al-484.md)|The property '{0}' must be alphanumeric.|Error|
|[AL485](al-485.md)|The property '{0}' is mandatory for objects of type API.|Error|
|[AL486](al-486.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.|Warning (future error)|
|[AL487](al-487.md)|The field '{0}' is not of field class 'Normal' and thus cannot be part of the {1} list.|Error|
|[AL488](al-488.md)|ControlAddIn name must not contain characters {0}.|Error|
|[AL489](al-489.md)|The property expression is not valid. A CONST or FILTER expression is expected. .|Error|
|[AL490](al-490.md)|The property expression is not valid. A CONST, FIELD, or FILTER expression is expected. .|Error|
|[AL491](al-491.md)|The property expression is not valid. One of the following expressions is expected : CONST,FIELD,FILTER,FIELD(FILTER(Identifier)),FIELD(UPPERLIMIT(Identifier)),or FIELD(UPPERLIMIT(FILTER(Identifier))).    .|Error|
|[AL492](al-492.md)|The RunObject property value of actions defined in the '{0}' area must only reference pages of type 'List'.|Error|
|[AL493](al-493.md)|The RunObject property value of actions defined in the '{0}' area must only reference pages of type 'List'.|Warning (future error)|
|[AL494](al-494.md)|The action area '{0}' can only directly contain groups.|Error|
|[AL495](al-495.md)|A member with ID '{0}' is already defined. Change the member name to generate a new ID.|Error|
|[AL496](al-496.md)|Attributes cannot be defined in this context. .|Error|
|[AL498](al-498.md)|The attribute '{0}' can only be used on procedures that have the attribute '{1}'.|Error|
|[AL499](al-499.md)|The handler function {0} was not found. Make sure the procedure is defined and has a handler attribute.|Error|
|[AL500](al-500.md)|The HandlerFunctions attribute only accepts a string representing a comma separated list of procedure names without spaces.|Error|
|[AL501](al-501.md)|Eventsubscribers in test codeunits must use manual binding. Set the property EventSubscriberInstance to Manual.|Error|
|[AL502](al-502.md)|The LinkTable property must reference a table element node of the current XMLPort.|Error|
|[AL503](al-503.md)|Reference '{0}' in application object '{1}' is ambiguous.|Error|
|[AL504](al-504.md)|The enum '{0}' is not extensible.|Error|
|[AL505](al-505.md)|Pages of type API must have the DelayedInsert property set to true, unless the 'Editable' property or the 'InsertAllowed' property is set to false.|Error|
|[AL509](al-509.md)|Constant value '{0}' is outside of the valid ordinal range for this {1} type.|Warning|
|[AL510](al-510.md)|The .NET type '{0}' is not a valid control add-in.|Error|
|[AL511](al-511.md)|The property 'IsControlAddIn' must be set on the .NET type '{0}' if the type represents a .NET control add-in.|Error|
|[AL512](al-512.md)|The manifest should define the 'supportedLocales' manifest property in order to use a placeholder in the '{0}' property.|Error|
|[AL513](al-513.md)|The FieldGroup '{0}' is not found in the target '{1}'.|Error|
|[AL514](al-514.md)|The symbol file is not valid. An enum with ID '{0}' is already defined with a different name in module '{1}'.|Error|
|[AL515](al-515.md)|The symbol file is not valid. An enum with name '{0}' is already defined with a different ID in module '{1}'.|Error|
|[AL516](al-516.md)|The symbol file is not valid. An enum with ID '{0}' and name '{1}' is already defined in module '{2}', but with different values (OptionString).|Error|
|[AL517](al-517.md)|The link '{0}' specified in the HelpLink property must either contain one placeholder with value 0 for the user locale, or no placeholders.|Error|
|[AL518](al-518.md)|A method with name '{0}' possessing one Handler attribute is already defined in this test codeunit.|Error|
|[AL519](al-519.md)|'{0}' is not valid value in this context.|Error|
|[AL520](al-520.md)|{0} '{1}' is removed. {2}.|Warning|
|[AL521](al-521.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must not have the Unique property set.    .|Error|
|[AL522](al-522.md)|Property value {0} is not in the values for enum '{1}'.|Error|
|[AL523](al-523.md)|The '{0}' already defines a method called '{1}' with the same parameter types in '{2}'.|Warning (future error)|
|[AL524](al-524.md)|The base type already defines a method called '{0}' with the same parameter types.|Warning (future error)|
|[AL525](al-525.md)|The system or virtual table '{0}' cannot be extended.|Error|
|[AL526](al-526.md)|The referenced page '{0}' of type 'API' is only allowed inside pages of PageType 'API'.|Error|
|[AL527](al-527.md)|The SQL timestamp field '{0}' cannot be part of the keys for table '{1}'.|Error|
|[AL528](al-528.md)|The name of field controls in pages of the type API must be alphanumeric.|Error|
|[AL529](al-529.md)|The name of columns in queries of the type API must be alphanumeric.|Error|
|[AL530](al-530.md)|The maximum length for the type '{0}' is {1}.|Error|
|[AL531](al-531.md)|The page '{1}' of type 'API' and its subpage '{2}' of type 'API' in the control '{0}' of type 'Part' must have the same value of property '{3}'.|Error|
|[AL532](al-532.md)|The page '{1}' of type 'API' and its control '{0}' of type 'Part' must have the same value of property '{2}'.|Error|
|[AL533](al-533.md)|The view '{0}' is not found in the target '{1}'.|Error|
|[AL534](al-534.md)|Length of the table key name '{0}' must not exceed {1} characters. Longer key names are prone to cause SQL errors.|Warning (future error)|
|[AL535](al-535.md)|The referenced page '{0}' must be a List part, a Card part, or an API page.|Error|
|[AL536](al-536.md)|Adding new controls in a view is not allowed.|Error|
|[AL537](al-537.md)|Declaring views is only supported on pages of type {0}.|Error|
|[AL538](al-538.md)|Views only support setting one sorting direction on table fields.|Error|
|[AL539](al-539.md)|The field '{0}' cannot be used multiple times when defining the order of the page view.|Error|
|[AL540](al-540.md)|The view name '{0}' is not valid.|Error|
|[AL541](al-541.md)|The use of the variable '{0}' in the property value of '{1}' in view '{2}' is not allowed.|Error|
|[AL542](al-542.md)|The property {0} cannot be used on page '{1}' because this page does not have a source table.|Error|
|[AL543](al-543.md)|The manifest property 'contextSensitiveHelpUrl' must be set in order to use the property 'ContextSensitiveHelpPage'.|Error|
|[AL544](al-544.md)|The property 'ContextSensitiveHelpPage' cannot contain a placeholder.|Error|
|[AL545](al-545.md)|An area of type '{0}' is not valid on pages of type '{1}'.|Warning (future error)|
|[AL546](al-546.md)|The control '{0}' cannot be modified in a view context because views only support modifying controls defined in the Content area.|Error|
|[AL547](al-547.md)|The event '{0}' should not expose global variables.|Warning (future error)|
|[AL548](al-548.md)|Cannot move symbol '{0}' from '{1}' area to '{2}' area.|Warning (future error)|
|[AL549](al-549.md)|Procedures and triggers are not allowed on page views.|Error|
|[AL550](al-550.md)|Groups defined in the action area '{0}' should only contain actions.|Warning (future error)|
|[AL551](al-551.md)|The action area '{0}' can only contain actions.|Warning (future error)|
|[AL552](al-552.md)|The action area '{0}' can only directly contain groups.|Warning (future error)|
|[AL553](al-553.md)|You can only specify Move and Modify actions in the '{0}' area of the actions section of a page customization.|Error|
|[AL554](al-554.md)|You can only specify Move and Modify actions in the actions section of a page customization.|Error|
|[AL555](al-555.md)|The RunObject property value of actions defined in the '{0}' area must only reference objects of type {1}.|Error|
|[AL556](al-556.md)|The RunObject property value of actions defined in the '{0}' area must only reference objects of type {1}.|Warning (future error)|
|[AL557](al-557.md)|The name of the codeunit local variable '{0}' is identical to a field in table '{1}' and will shadow that table field.|Warning|
|[AL558](al-558.md)|The name of the codeunit global variable '{0}' is identical to a field in table '{1}'.|Warning|
|[AL559](al-559.md)|A Part type page cannot contain other parts.|Warning (future error)|
|[AL560](al-560.md)|Only parts and groups are valid in an area of type 'RoleCenter'.|Warning (future error)|
|[AL561](al-561.md)|Only parts are valid in an area of type 'FactBoxes'.|Warning (future error)|
|[AL562](al-562.md)|The value assigned to the SystemPart type is not valid. Valid values are {0}.|Warning (future error)|
|[AL563](al-563.md)|A control of type '{0}' is not allowed in a parent control of type '{1}'.|Warning (future error)|
|[AL564](al-564.md)|The object {0} '{1}' is not extensible.|Error|
|[AL565](al-565.md)|Fast publishing requires a built application file to be present. The '{0}' application file contains a manifest which is not valid. Please rebuild the application file before continuing with fast publishing.|Error|
|[AL566](al-566.md)|The field '{0}' is using an Id {1} that is reserved for system fields.|Error|
|[AL567](al-567.md)|The field '{0}' is using the same name as a system-provided field and will shadow that field.|Warning|
|[AL568](al-568.md)|Groups defined in the action area '{0}' should only contain actions or groups.|Warning (future error)|
|[AL569](al-569.md)|A page of type Role Center cannot have procedures.|Warning (future error)|
|[AL570](al-570.md)|The symbol '{0}' results in the same translation ID as one or more other symbols. Rename symbol to resolve the problem.|Error|
|[AL571](al-571.md)|The property 'Description' should only be used for internal comments. Use the property 'Caption' or 'CaptionML' in order to specify the profile caption displayed to end users.|Warning (future error)|
|[AL572](al-572.md)|I/O operations on the file or folder '{0}' resulted in an exception with the Windows 32 error code '{1}'.|Error|
|[AL573](al-573.md)|{0} is not valid for client expressions.|Warning (future error)|
|[AL574](al-574.md)|This feature is under development and cannot be used in an extension.|Error|
|[AL575](al-575.md)|You cannot modify the {0} '{1}' because it is defined in the page customization '{2}'.|Error|
|[AL576](al-576.md)|The profile name '{0}' is not valid because it contains leading or trailing spaces.|Error|
|[AL577](al-577.md)|The view '{0}' cannot define layout changes because its property '{1}' is not set to false.|Error|
|[AL578](al-578.md)|The value for the property '{0}' is not valid because its length exceeds {1} characters ({2} characters).|Error|
|[AL579](al-579.md)|The value for the property '{0}' for the language code '{1}' is not valid because its length exceeds {2} characters ({3} characters).|Error|
|[AL580](al-580.md)|The field '{0}' is used by the system and cannot be specified as a table key.|Error|
|[AL581](al-581.md)|The length for the type '{0}' must be positive.|Error|
|[AL582](al-582.md)|'{0}' does not implement the interface member '{1}'.|Error|
|[AL584](al-584.md)|An interface member cannot have any variables.|Error|
|[AL585](al-585.md)|An interface cannot have any variables.|Error|
|[AL586](al-586.md)|The identifier contains characters that are not valid: {0}.|Warning (future error)|
|[AL587](al-587.md)|'{0}' is already listed in the interface list.|Error|
|[AL588](al-588.md)|The type of parameter '{1}' on event subscriber '{0}' is of type 'Option', but the expected type is '{2}'. Please update the subscriber type to match the publisher.|Warning|
|[AL589](al-589.md)|The name '{0}' is used across multiple columns and data items. This will prevent extensibility of this column or data item.|Warning (future error)|
|[AL590](al-590.md)|The property {0} is only supported on {1}.|Warning (future error)|
|[AL591](al-591.md)|The property {0} is only supported on {1}.|Error|
|[AL592](al-592.md)|Compatibility: {0}.|Warning|
|[AL593](al-593.md)|The type of the parameter '{0}' on the event subscriber '{1}' has a smaller capacity than the parameter type '{2}' on the publisher.|Warning (future error)|
|[AL594](al-594.md)|An error occurred during XML serialization of metadata for symbol: '{0}'. Error: {1}.|Error|
|[AL595](al-595.md)|'{0}' does not implement {1}.|Error|
|[AL596](al-596.md)|Value '{0}' does not implement interface '{1}' and there is no default implementation for the mentioned interface.|Error|
|[AL598](al-598.md)|Cannot move or modify the {0} '{1}' in the same '{2}' that you added.|Warning (future error)|
|[AL599](al-599.md)|A control add-in with the same internal name '{0}' is already defined.|Error|
|[AL600](al-600.md)|The property '{0}' can only be set on elements of type Option.|Warning (future error)|
|[AL601](al-601.md)|{0} '{1}' is removed. {2}.|Warning (future error)|
|[AL602](al-602.md)|'{0}' is inaccessible due to its protection level.|Warning (future error)|
|[AL603](al-603.md)|An implicit conversion is being performed from a value of type '{0}' to a value of type '{1}'. This conversion can lead to unexpected runtime issues.|Warning (future error)|
|[AL604](al-604.md)|Use of implicit 'with' will be removed in the future. Qualify with '{0}.'.|Warning (future error)|
|[AL605](al-605.md)|Use of implicit 'with' will be removed in the future. Qualify with '{0}.'.|Hidden|
|[AL606](al-606.md)|The 'with' statement is deprecated and will be removed for cloud development in a future release.|Warning (future error)|
|[AL607](al-607.md)|The 'with' statement is deprecated and will be removed for cloud development in a future release.|Hidden|
|[AL608](al-608.md)|The OrderBy property must specify at least one field on which to sort the data.|Warning (future error)|
|[AL609](al-609.md)|Adding actions to CueGroups is not supported.|Warning|
|[AL610](al-610.md)|Moving actions in CueGroups is not supported.|Warning|
|[AL611](al-611.md)|Modifying actions in CueGroups is not supported.|Warning|
|[AL612](al-612.md)|An interface member must be a 'procedure'.|Error|
|[AL613](al-613.md)|Wrong signature. Correct signature for '{0}' is '{1}'.|Warning (future error)|
|[AL614](al-614.md)|The value '{0}' is not allowed for property '{1}'.|Warning (future error)|
|[AL615](al-615.md)|Field '{0}' is not specified as a source expression on page '{1}'. All fields specified in ODataKeyFields must be used as the source expression in a page control.|Warning (future error)|
|[AL616](al-616.md)|Defining the contract '{0}' on interface '{1}' is not allowed because it is matching a built-in procedure for codeunits.|Error|
|[AL617](al-617.md)|Event trigger 'OnBeforeActionEvent' cannot be used because the action '{0}' specifies the 'RunObject' property.|Warning (future error)|
|[AL619](al-619.md)|The attribute '{0}' on procedure '{1}' is not allowed. Add attribute 'ServiceEnabled' to the procedure or move it into an application object of type API.|Error|
|[AL620](al-620.md)|Preprocessor directives must appear as the first non-whitespace character on a line.|Error|
|[AL621](al-621.md)|Preprocessor directive expected.|Error|
|[AL622](al-622.md)|#endregion directive expected.|Error|
|[AL623](al-623.md)|#endif directive expected.|Error|
|[AL624](al-624.md)|Unexpected preprocessor directive.|Error|
|[AL625](al-625.md)|Cannot define/undefine preprocessor symbols after first token in file.|Error|
|[AL626](al-626.md)|Expected identifier or numeric literal.|Warning|
|[AL627](al-627.md)|Expected 'disable' or 'restore' keyword.|Warning|
|[AL628](al-628.md)|Unrecognized #pragma directive.|Warning|
|[AL629](al-629.md)|Preprocessor expression is not valid.|Error|
|[AL630](al-630.md)|Unrecognized escape sequence.|Error|
|[AL631](al-631.md)|Single-line comment or end-of-line expected.|Error|
|[AL632](al-632.md)|Closing parenthesis ')' expected.|Error|
|[AL633](al-633.md)|Expected 'disable', 'enable' or 'restore' keyword.|Warning|
|[AL634](al-634.md)|Single-line comment or end-of-line expected.|Warning|
|[AL635](al-635.md)|A method with 'OnPrem' scope cannot be used as event subscriber. It will fail at runtime when the publisher has 'Cloud' scope.|Warning (future error)|
|[AL636](al-636.md)|The data type on the field '{0}' is not valid because the ExtendedDatatype property is set to RichText. Valid data types are Text, BigText and Blob.|Error|
|[AL637](al-637.md)|The property 'NavigationPageId' must be defined on a page of pagetype 'API'.|Error|
|[AL638](al-638.md)|'Variant' is not a valid column type for column '{0}' in report '{1}'.|Error|
|[AL639](al-639.md)|'Variant' is not a valid column type for column '{0}' in report '{1}'.|Warning (future error)|
|[AL640](al-640.md)|XML comment has badly formed XML -- '{0}'.|Warning|
|[AL641](al-641.md)|Parameter '{0}' has no matching param tag in the XML comment for '{1}' (but other parameters do).|Warning|
|[AL642](al-642.md)|Missing XML comment for publicly visible type or member '{0}'.|Warning|
|[AL643](al-643.md)|XML comment is not placed on a valid language element.|Warning|
|[AL644](al-644.md)|XML comment has a param tag for '{0}', but there is no parameter by that name.|Warning|
|[AL645](al-645.md)|XML comment on '{1}' has a paramref tag for '{0}', but there is no parameter by that name.|Warning|
|[AL646](al-646.md)|XML comment has a duplicate param tag for '{0}'.|Warning|
|[AL647](al-647.md)|{0}. See also error AL{1}.|Warning|
|[AL648](al-648.md)|End-of-file found, '*/' expected.|Error|
|[AL649](al-649.md)|Comma is not supported in enum value names or in captions. Enum Value = '{0}', Property = '{1}'.|Warning (future error)|
|[AL650](al-650.md)|The text with a length of {0} is longer than the MaxLength of {1} which means that the text will be trimmed.|Warning (future error)|
|[AL651](al-651.md)|'{0}' cannot be contained since it causes a circular reference.|Error|
|[AL652](al-652.md)|The permission set '{0}' cannot contain itself.|Error|
|[AL653](al-653.md)|Ids are not supported as object reference.|Error|
|[AL654](al-654.md)|The property value contains an unexpected file extension: {0}. The expected extensions are {1}.|Error|
|[AL655](al-655.md)|The property DataItemLinkReference can only refer to an ancestor DataItem.|Warning (future error)|
|[AL656](al-656.md)|The {0} '{1}' cannot be used as an anchor because it is already defined in the same '{2}'.|Error|
|[AL657](al-657.md)|The property {0} is mandatory for ListParts and PageParts.|Error|
|[AL658](al-658.md)|Member name '{0}' is only allowed on triggers.|Error|
|[AL659](al-659.md)|Length of the application object identifier '{0}' cannot exceed {1} characters.|Warning (future error)|
|[AL665](al-665.md)|'{0}' is not a valid return type in runtime version '{1}'. The supported runtime versions are: {2}.|Error|
|[AL666](al-666.md)|'{0}' is not available in runtime version '{1}'. The supported runtime versions are: {2}.|Error|
|[AL667](al-667.md)|'{0}' is being deprecated in the versions: {1} {2}.|Warning (future error)|
|[AL668](al-668.md)|This feature is not available on cross-platform builds of the AL compiler.|Error|
|[AL670](al-670.md)|Fast publishing failed because the RAD file has specified a non-existing application object of type : '{0}' name: '{1}' ID: '{2}' to be added or modified. Please do a full publishing before issuing a fast publishing again.|Error|
|[AL671](al-671.md)|Fast publishing failed because the RAD file has specified an existing application object of type: '{0}' name: '{1}' ID: '{2}' to be deleted. Please do a full publishing before issuing a fast publishing again.|Error|
|[AL672](al-672.md)|Filtering is only allowed on fields where FieldClass is set to Normal. Create a Filter column and specify the filter by using the 'ColumnFilter' property.|Error|
|[AL673](al-673.md)|The property '{0}' is required.|Error|
|[AL674](al-674.md)|The property '{0}' is required when property '{1}' is set to '{2}'.|Error|
|[AL675](al-675.md)|An implementation for the interface '{0}' is already specified in this list.|Error|
|[AL679](al-679.md)|The application object '{0}' is not included in any entitlement and will therefore not be accessible in the cloud.|Warning|
|[AL680](al-680.md)|Cannot use addBefore or addAfter on a top-level data item. The anchor {0} is a top level data item.|Error|
|[AL681](al-681.md)|A DataItem with name '{0}' could not be found in the target {1}.|Error|
|[AL682](al-682.md)|A DataItem or Column with name '{0}' could not be found in the target {1}.|Error|
|[AL683](al-683.md)|The permissionset '{0}' belongs to a different module and cannot be used when defining entitlements.|Error|
|[AL684](al-684.md)|The permissionset '{0}' contains permissionsets or permission for objects from other module. Permissions on objects from other modules will be ignored.|Warning|
|[AL685](al-685.md)|The length '{0}' of the calculation formula's target field '{1}' is greater than the length '{2}' of the source flow field '{3}'. This could result in a runtime error. Please make sure that the target field's length is less than equal to the source field length. .|Warning (future error)|
|[AL686](al-686.md)|The base type already defines a method called '{0}' with the same parameter types.|Error|
|[AL687](al-687.md)|The key '{0}' on table '{1}' cannot contain the fields defined for the primary key in the IncludeFields property.    .|Error|
|[AL688](al-688.md)|The key '{0}' on table '{1}' cannot contain the fields defined for the key in the IncludeFields property.    .|Error|
|[AL689](al-689.md)|The key '{0}' on table '{1}' cannot contain the fields defined for the SqlIndex in the IncludeFields property.    .|Error|
|[AL690](al-690.md)|The primary key '{0}' on table '{1}' (the first one in the key list) must not have the IncludedFields property set.    .|Error|
|[AL999](al-999.md)|Internal error: {0}.|Error|
|[AL1000](al-1000.md)|Ignoring /noconfig option because it was specified in a response file.|Warning|
|[AL1001](al-1001.md)|Source file '{0}' could not be found.|Error|
|[AL1002](al-1002.md)|Error opening response file '{0}'.|Error|
|[AL1003](al-1003.md)|An instance of analyzer {0} cannot be created from {1} : {2}.|Warning|
|[AL1004](al-1004.md)|The assembly {0} does not contain any analyzers.|Warning|
|[AL1005](al-1005.md)|Unable to load Analyzer assembly {0} : {1}.|Warning|
|[AL1006](al-1006.md)|Metadata file '{0}' could not be found.|Error|
|[AL1007](al-1007.md)|Missing file specification for '{0}' option.|Error|
|[AL1008](al-1008.md)|Command-line syntax error: Missing '{0}' for '{1}' option.|Error|
|[AL1009](al-1009.md)|Unrecognized option: '{0}'.|Error|
|[AL1010](al-1010.md)|Command-line syntax error: Missing ':<number>' for '{0}' option.|Error|
|[AL1011](al-1011.md)|Source file '{0}' specified multiple times.|Warning|
|[AL1012](al-1012.md)|Could not write to output file '{0}' -- '{1}'.|Error|
|[AL1013](al-1013.md)|'{0}' is a binary file instead of a text file.|Error|
|[AL1014](al-1014.md)|Source file '{0}' could not be opened -- {1}.|Error|
|[AL1015](al-1015.md)|Compilation canceled by user.|Error|
|[AL1017](al-1017.md)|The manifest file is not valid. {0}.|Error|
|[AL1018](al-1018.md)|Directory '{0}' could not be found.|Error|
|[AL1019](al-1019.md)|One or more dependencies defined in the project manifest are not valid. One or more of the required attributes: 'publisher', 'name', 'version', and 'id' are either missing or not valid.|Error|
|[AL1021](al-1021.md)|The package cache path has not been specified.|Error|
|[AL1022](al-1022.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be found in the package cache folder '{3}'.|Error|
|[AL1023](al-1023.md)|The package file {0} is not valid.|Error|
|[AL1024](al-1024.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be loaded. {3}.|Error|
|[AL1025](al-1025.md)|The file at location '{0}' does not match any definition.|Warning|
|[AL1026](al-1026.md)|A warning occurred during XML validation: '{0}'.|Warning|
|[AL1028](al-1028.md)|An IO exception has happened when trying to write to output file '{0}' -- '{1}'.|Error|
|[AL1029](al-1029.md)|Translation file '{0}' has invalid target language '{1}'.|Warning|
|[AL1030](al-1030.md)|Translation file '{0}' is missing a target language.|Warning|
|[AL1031](al-1031.md)|Successfully included translations for: {0}.|Information|
|[AL1032](al-1032.md)|Translation file '{0}' has the same target language as another translation file.|Error|
|[AL1033](al-1033.md)|An error occurred while loading the included rule set file {0} - {1}.|Error|
|[AL1034](al-1034.md)|The link '{0}' must contain a placeholder with value 0 for the user locale.|Error|
|[AL1035](al-1035.md)|The manifest properties 'baseHelpUrl' and 'supportedLocales' must both be specified and have values.|Error|
|[AL1036](al-1036.md)|The locale '{0}' is not valid.|Error|
|[AL1037](al-1037.md)|The locale '{0}' is already defined.|Error|
|[AL1038](al-1038.md)|The version number '{0}' for the property '{1}' does not match the expected format: W.X.Y.Z where W, X, Y, and Z represent positive integers.|Error|
|[AL1039](al-1039.md)|The version number '{0}' for the property '{1}' does not match the expected format: X.Y where X and Y represent positive integers.|ERR_InvalidManifestVersion|
|[AL1040](al-1040.md)|The guid number '{0}' does not match the expected pattern: "^[0-9a-fA-F]{{8}}-[0-9a-fA-F]{{4}}-[0-9a-fA-F]{{4}}-[0-9a-fA-F]{{4}}-[0-9a-fA-F]{{12}}$".|Error|
|[AL1041](al-1041.md)|The property '{0}' must be defined in the manifest.|Error|
|[AL1042](al-1042.md)|The id '{0}' for the package with publisher '{1}', name '{2}', and version '{3}' specified in the project manifest does not match the id '{4}' of the package with the same name, publisher, and version found in the package cache folder.|Error|
|[AL1043](al-1043.md)|The runtime version '{0}' is not supported by the AL compiler.|Error|
|[AL1044](al-1044.md)|The value for the manifest property '{0}' is not valid. Expected type: {1}.|Error|
|[AL1045](al-1045.md)|The package cache {0} could not be found.|Error|
|[AL1046](al-1046.md)|The application ID ranges {0} are overlapping.|Error|
|[AL1047](al-1047.md)|The application ID range {0} is not valid.|Error|
|[AL1048](al-1048.md)|Both 'idRange' and 'idRanges' properties are added. You should use the 'idRanges' property and remove the 'idRange' property.|Error|
|[AL1049](al-1049.md)|A project without a manifest must have the /out option specified.|Error|
|[AL1050](al-1050.md)|Fast publishing requires an application file '{0}' to be build and published. .|Error|
|[AL1051](al-1051.md)|Fast publishing requires that there are no manifest changes for the application '{0}'. .|Error|
|[AL1052](al-1052.md)|The link '{0}' can only contain one placeholder with value 0 for the user locale. No other placeholder values are allowed.|Error|
|[AL1053](al-1053.md)|The value '{0}' is not valid for the manifest property '{1}'.|Error|
|[AL1054](al-1054.md)|Invalid reference module: {0}.|Error|
|[AL1055](al-1055.md)|Invalid reference module: {0}.|Warning|
|[AL1056](al-1056.md)|A package with publisher '{0}', name '{1}', and a version compatible with '{2}' could not be loaded. {3}.|Warning|
|[AL1057](al-1057.md)|The module specification is not valid. One or more of the required attributes: 'publisher', 'name', and 'id' are either missing or not valid.|Error|
|[AL1058](al-1058.md)|appId and Id are both specified for a dependency property. The appId value will be ignored.|Warning|
|[AL1059](al-1059.md)|Feature '{0}' can only be enabled, if feature '{1}' is also enabled.|Warning|
|[AL1060](al-1060.md)|The max degree of parallelism must be -1 or positive.|Error|
|[AL1061](al-1061.md)|An error occurred during file validation: '{0}'.|Error|
|[AL1062](al-1062.md)|Too many key vault URLs specified.|ERR_KeyVaultUrls|
|[AL1063](al-1063.md)|Key vault URL is too long.|ERR_KeyVaultUrls|
|[AL1064](al-1064.md)|Key vault URL is not a valid URL.|ERR_KeyVaultUrls|
|[AL1065](al-1065.md)|Key vault URL should not have a path or query string.|ERR_KeyVaultUrls|
|[AL1066](al-1066.md)|Duplicate package dependency with application ID '{0}', publisher '{1}', and name '{2}'. Remove duplicate dependencies in the application manifest.|ERR_DuplicatePackageDependency|
|[AL1067](al-1067.md)|Duplicate package dependency with publisher '{0}', and name '{1}'. Remove duplicate dependencies in the application manifest.|ERR_DuplicatePackageDependency|
|[AL1068](al-1068.md)|Duplicate package dependency with application ID '{0}', and publisher '{1}'. Remove duplicate dependencies in the application manifest.|ERR_DuplicatePackageDependency|
|[AL1069](al-1069.md)|Duplicate package dependency with application ID '{0}', and name '{1}'. Remove duplicate dependencies in the application manifest.|ERR_DuplicatePackageDependency|
|[AL1070](al-1070.md)|Duplicate package dependency with application ID '{0}'. Remove duplicate dependencies in the application manifest.|ERR_DuplicatePackageDependency|
|[AL1071](al-1071.md)|Error writing to XML documentation file: {0}.|Error|
|[AL1072](al-1072.md)|The name for the preprocessing symbol is not valid; '{0}' is not a valid identifier.|Warning|
|[AL1073](al-1073.md)|The procedure with name {0} has the same name as a declared trigger.|Error|
|[AL1074](al-1074.md)|Both 'applicationInsightsKey' and 'applicationInsightsConnectionString' are added. You should use the 'applicationInsightsConnectionString' property and remove the 'applicationInsightsKey' property.|Error|
|[AL1075](al-1075.md)|Both 'ShowMyCode' and 'ResourceExposurePolicy' properties are added. You should use the 'ResourceExposurePolicy' property and remove the 'ShowMyCode' property.|Error|
|[AL1076](al-1076.md)|A package that satisfies the dependency on app with ID {0} with name '{1}' and publisher '{2}' was found, but the name or publisher has changed. New name '{3}' and new publisher '{4}'. Consider updating the dependency reference to the new name/publisher.|Information|
|[AL1100](al-1100.md)|File name '{0}' is empty, contains invalid characters, has a drive specification without an absolute path, or is too long.|Fatal error|
|[AL1101](al-1101.md)|Target must specify one of: 'internal', 'solution', 'extension'.|Fatal error|
|[AL1130](al-1130.md)|The format of property '{0}' must be a timeout duration specified as '[d.]hh:mm:ss[.fffffff]'.|Error|
|[AL1150](al-1150.md)|The link in parameter '{0}' ({1}) is not valid. {2}.|Error|
|[AL1151](al-1151.md)|Cannot create a manifest for Extension "{0}" because the Name and Publisher are the same as one or more dependencies.|Error|
|[AL1401](al-1401.md)|Reference '{0}' in application object '{1}' does not exist.|Personalization warning|
|[AL1402](al-1402.md)|{0} '{1}' is missing.|Personalization warning|
|[AL1403](al-1403.md)|'{0}' is an ambiguous reference between '{1}' defined by the extension '{2}' and '{3}' defined by the extension '{4}'.|Personalization warning|
|[AL1404](al-1404.md)|The action '{0}' is not found in the target '{1}'.|Personalization warning|
|[AL1405](al-1405.md)|The control '{0}' is not found in the target '{1}'.|Personalization warning|
|[AL1406](al-1406.md)|The view '{0}' is not found in the target '{1}'.|Personalization warning|
|[AL1407](al-1407.md)|At least one target has to be specified for the move.|Personalization warning|
|[AL1408](al-1408.md)|Invalid application object identifier. A number or an application object name is expected.|Personalization warning|
|[AL1409](al-1409.md)|Page '{0}' should be of type 'RoleCenter'.|Personalization warning|
|[AL1410](al-1410.md)|The target {0} {1} for the extension object is not found.|Personalization warning|
|[AL1411](al-1411.md)|Multiple page customizations have been specified for the same page {0} within the same profile.|Personalization warning|
|[AL1412](al-1412.md)|{0} '{1}' is marked for removal. {2}.|Personalization warning|
|[AL1413](al-1413.md)|A member of type {0} with name '{1}' is already defined in {2} '{3}' by the extension '{4}'.|Personalization warning|
|[AL1414](al-1414.md)|The page customization for page '{0}' does not make any modifications, so it can be removed without affecting any profiles or user personalization.|Personalization information|
|[AL1415](al-1415.md)|{0} '{1}' is removed. {2}.|Personalization warning|
|[AL1416](al-1416.md)|The {0} '{1}' cannot be moved relatively to '{2}' because '{2}' is missing. This move is ignored.|Personalization information|
|[AL1417](al-1417.md)|The {0} '{1}' cannot be added relatively to '{2}' because '{2}' is missing. '{1}' is added at a default location instead.|Personalization information|
|[AL1418](al-1418.md)|A DataItem with name '{0}' could not be found in the target {1}.|Personalization warning|
|[AL1419](al-1419.md)|A DataItem or Column with name '{0}' could not be found in the target {1}.|Personalization warning|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  