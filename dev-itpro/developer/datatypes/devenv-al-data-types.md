---
title: "AL Data Types"
ms.custom: na
ms.date: 06/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 976c36b9-f2bf-4cd5-8ad7-ff3b5eb0cf26
caps.latest.revision: 44
author: SusanneWindfeldPedersen
---
# AL Data Types
AL uses variables to store data of various types. By declaring variables of the correct type, you do the following:  

-   Create faster code  

-   Save space

-   Avoid run-time errors because of overflow  

-   Avoid run-time errors that are caused by impossible type conversions  

 For example, if you know that a variable will always contain a number between 0 and 700, then you should use an integer variable instead of a decimal variable. Any calculations that are performed will be faster because four bytes per integer operation are used instead of twelve bytes per decimal operation. However, you must use a data type that can hold every possible value that is needed in your calculations. For example, if you try to store the value 1233.3456 in an integer variable, then the result will be an error.  

## AL data types  
 The following table shows the AL data types. All AL data types are either fundamental or complex. Some data types can also be divided into other categories.  

|Data type|Fundamental or complex|Other categories|  
|---------------|----------------------------|----------------------|  
|Action Data Type|Fundamental|Numeric|  
|[BigInteger Data Type](devenv-biginteger-data-type.md)|Fundamental|Numeric|  
|[Byte Data Type](devenv-byte-data-type.md)|Fundamental|Numeric|  
|[Char Data Type](devenv-char-data-type.md)|Fundamental|Numeric|  
|[Decimal Data Type](devenv-decimal-data-type.md)|Fundamental|Numeric|  
|[Duration Data Type](devenv-duration-data-type.md)|Fundamental|Numeric|  
|EXECUTIONMODE Data Type|Fundamental|Numeric|  
|FILTERPAGEBUILDER Data Type|Complex||  
|[Integer Data Type](devenv-integer-data-type.md)|Fundamental|Numeric|  
|[Option Data Type](devenv-option-data-type.md)|Fundamental|Numeric|  
|[Code Data Type](devenv-code-data-type.md)|Fundamental|String|  
|[Text Data Type](devenv-text-data-type.md)|Fundamental|String|  
|[Boolean Data Type](devenv-boolean-data-type.md)|Fundamental||  
|[Date Data Type](devenv-date-data-type.md)|Fundamental||  
|[DateTime Data Type](devenv-datetime-data-type.md)|Fundamental||  
|[Time Data Type](devenv-time-data-type.md)|Fundamental||  
|[Automation Data Type](Not%20supported/devenv-automation-data-type.md)|Complex||  
|[BigText Data Type](devenv-bigtext-data-type.md)|Complex||  
|[BLOB Data Type](devenv-blob-data-type.md)|Complex||  
|[Codeunit Data Type](devenv-codeunit-data-type.md)|Complex||  
|[DateFormula Data Type](devenv-date-formula-data-type.md)|Complex||  
|[Dialog Data Type](devenv-dialog-data-type.md)|Complex||  
|[File Data Type](devenv-file-data-type.md)|Complex||  
|[Fieldref Data Type](devenv-fieldref-data-type.md)|Complex||  
|[GUID Data Type](devenv-guid-data-type.md)|Complex||  
|[InStream and OutStream Data Types](devenv-instream-and-outstream-data-types.md)|Complex||  
|[KeyRef Data Type](devenv-keyref-data-type.md)|Complex||  
|[OCX Data Type](Not%20supported/devenv-ocx-data-type.md)|Complex||  
|[Page Data Type](devenv-page-data-type.md)|Complex||  
|[Query Data Type](devenv-query-data-type.md)|Complex||  
|[Record Data Type](devenv-record-data-type.md)|Complex||  
|[RecordID Data Type](devenv-recordid-data-type.md)|Complex||  
|[RecordRef Data Type](devenv-recordref-data-type.md)|Complex||  
|[Report Data Type](devenv-report-data-type.md)|Complex||  
|[System](devenv-system.md)|Complex||  
|[TableFilter Data Type](devenv-tablefilter-data-type.md)|Complex||  
|[Variant Data Type](devenv-variant-data-type.md)|Complex||  

### Fundamental data types  
 Fundamental data types are designed to store Boolean values, numbers, text, time, and dates.  

#### Action data type  
 The Action data type specifies what action a user performs on a page. The [PAGE.RUNMODAL method](../methods/devenv-page-runmodal-method.md) and the [RUNMODAL method (Page)](../methods/devenv-runmodal-method-page.md) return an Action data type value. The possible values are the following:  

-   OK  

-   Cancel  

-   LookupOK  

-   LookupCancel  

-   Yes  

-   No  

-   RunObject  

-   RunSystem  

#### BigInteger data type  
 The BigInteger data type stores very large whole numbers in range of 9,223,372,036,854,775,807 to 9,223,372,036,854,775,807.  

#### Byte data type  
 The Byte data type stores a single, 8-bit character as a value in the range 0 to 255. This data type can be converted between a number and a character. This means that you can use the same mathematical operators as you can with a variable of a numeric data type.  

 For example, you can assign a constant string of length 1 to a Byte variable.  

```  
B := "A";  
```  

 You can also assign a single character in a Text or Code data type variable to a Byte variable.  

```  
B := S[2];  
```  

 You can also assign a numeric value to a Byte variable. This will cause the Byte variable to contain the character from the ASCII character set that corresponds to the numeric ASCII code.  

```  
C := 65;  
```  

#### Char data type  
 The Char data type stores a single character. This data type can be converted between a number and a character. This means that you can use the same mathematical operators as you can with a variable of a numeric data type.  

#### Decimal data type  
 In the [!INCLUDE[d365_dev_short](../includes/d365_dev_short_md.md)], the Decimal data type represents decimal numbers ranging from -10+E63 to +10+E63. The exponent ranges from -63 to +63. Decimal numbers are held in memory with 18 significant digits. Although you can store decimal numbers ranging from -10+E63 to +10+E63, you cannot specify a number outside the range +/- 999,999,999,999,999.99 in the UI or in code.  

 In SQL Server, you can store a decimal number with up to 18 digits and 20 decimal place digits. However, if a number is more than 15 digits, then you cannot enter it in SQL Server or view it in the UI.  

 In the client, you can store a decimal number with up to 29 digits and precision of 18 digits.  

 In general, we recommend that you construct decimals that operate on numbers in the range of +/- 999,999,999,999,999.99. Although you can construct larger numbers in some cases, overflow, truncation, or loss of precision can occur.  

#### Duration data type  
 The Duration data type represents the difference between two DateTimes, in milliseconds. For example, you can calculate the difference between two DateTimes by running the following code. This example requires that you define the following variables.  

|Variable|Data type|  
|--------|---------|  
|DateTime1|DateTime|  
|Datetime2|DateTime|  
|Duration|Duration|  

 This example is run on a computer that has the **Current Format** in the **Regional and Language Options** set to English (United States).  

```  
DateTime1 := CREATEDATETIME(010109D, 080000T); // January 1, 2009 at 08:00:00 AM  
DateTime2 := CREATEDATETIME(050509D, 133001T); // May 5, 2009 at 1:30:01 PM  
Duration := DateTime2 - DateTime1;  
MESSAGE(FORMAT(Duration));  
```  

 The message window displays the following:  

 **124 days 4 hours 30 minutes 1 second**  

#### ExecutionMode data type  
 The ExecutionMode data type specifies the mode in which a session is running. The [CURRENTEXECUTIONMODE method (Sessions)](../methods/devenv-currentexecutionmode-method-sessions.md) returns an ExecutionMode data type value.  

 The execution mode is one of the following:  

-   Debug  

-   Standard  

#### Integer data type  
 The Integer data type stores integers between -2,147,483,647 and 2,147,483,647.  

#### Option data type  
 The Option data type represents an option value. The Option type is a zero-based enumerator type. Therefore, you can convert option values to integers. For example, assume that *Number* is a numeric variable and that *Type* represents a field of type Option in the Purchase Header table. The following statement converts the option value to a number.  

```  
Number := "Purchase Header".Type;  
```  

 In another example, the following code shows how to use the possible values of an option field as constants.  

```  
"Purchase Header".Type := "Purchase Header".Type::Invoice;  
```  

#### Code data type  
 The Code data type represents a special type of text string. When a given text is assigned to a variable of data type Code, the text is changed to uppercase and any leading and trailing spaces are removed. You can index any character position in a string, for example, A[65]. The resulting values will be of the Char data type. The length of a variable of data type Code always corresponds to the number of characters in the text without leading and trailing spaces. If you do not specify the length of a Code variable, then the maximum length is 2GB, which is the limit imposed by Microsoft .NET Framework. The maximum length of a table field of data type Code is 250 characters.  <!-- //NAV .NET framework mentioning here -->

 The following table shows some typical examples of Code string assignments. In the following examples, it is assumed that the variable c is of data type Code, and has a maximum length of 4.  

|Assignment|Variable c contains|Length|  
|----------|-------------------|------|  
|c := 'AbC';|'ABC'|3|  
|c := '1';|'1'|1|  
|c := '';|'' (empty string)|0 (zero)|  
|c := '2';|'2'|1|  
|c := '1 2';|'1 2'|3|  

#### Text data type  
 The Text data type represents a text string. You can index any character position in a string, for example A[65] refers to the 65th character in the variable called A. The resulting values will be of data type Char. The length of a variable of data type Text corresponds to the number of characters in the text. For example, an empty text string has length 0. If you do not specify the length of a Text variable, then the maximum length is 2GB, which is the limit imposed by Microsoft .NET Framework. The maximum length of a table field of data type Text is 250 characters.  <!-- //NAV .NET framework mentioning here -->

 The following table shows some typical examples of text strings. In these examples, it is assumed that the variable t is of data type Text and has a maximum length of 6.  

|Assignment|Result|  
|----------------|------------|  
|t := 'AbC'|The variable t now contains "AbC"|  
|t := '123456abx';|Gives a run-time error because the length (9) exceeds the maximum length (6)|  

 When you use the Text and Code data types, make sure that you distinguish between the maximum length of the string and the actual length of the string. The maximum length is the upper limit for the number of characters in the string. The actual length describes the number of characters that are used in the string. The [STRLEN method (Code, Text)](../methods/devenv-strlen-method-code-text.md) and the [MAXSTRLEN method (Code, Text)](../methods/devenv-maxstrlen-method-code-text.md) illustrate this.  

```  
t := 'AbC';  
STRLEN(t); // Returns 3.  
MAXSTRLEN(t); // Returns 6.  
t := '12345';  
STRLEN(t); // Returns 5.  
MAXSTRLEN(t); // Returns 6.  
```  

#### Boolean data type  
 The possible values of Boolean data types are **true** or **false**.  

#### Date data type  
 The Date data type represents dates ranging from January 1, 1753 to December 31, 9999. An undefined date is expressed as 0D. The undefined date is considered to be before all other dates. When you work with dates, you must consider the case in which a date is undefined. For example, if the due date for an invoice is not specified and you create a report that displays all due invoices on a certain date, then you must handle the undefined date. Otherwise, the invoice with the unspecified date will appear to be long overdue, which may not be true.  

 All dates have a corresponding closing date. The closing date for a given date is regarded as a period following the given date but before the next regular date. A closing date is therefore sorted immediately after the corresponding regular date but before the next regular date.  

#### DateTime data type  
 The DateTime data type represents a date and the time of day. The DateTime is stored in the database as Coordinated Universal Time (UTC). UTC is the international time standard (formerly Greenwich Mean Time, or GMT). Zero hours UTC is midnight at 0 degrees longitude. The DateTime is always displayed as local time in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. Local time is determined by the time zone regional settings that are used by your computer. You must always enter DateTimes as local time. When you enter a DateTime as local time, it is converted to UTC using the current settings for the time zone and daylight saving time.  

 There is only one constant available when you use this data type: undefined datetime, which is expressed as 0DT.  

 The earliest permitted DateTime in Microsoft SQL Server is January 1, 1753, 00:00:00.000.  

 The latest permitted DateTime in Microsoft SQL Server is December 31, 9999, 23:59:59.999.  

 Any DateTimes that are not within this range and that you try to enter or construct by, for example, adding a DateTime to a Duration, are regarded as undefined DateTimes and give an error message.  

 Undefined dates in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] are stored as January 1, 1753, 00:00:00.000, which is the earliest permitted DateTime in SQL Server.  

#### Time data type  
 The Time data type represents a time ranging from 00:00:00 to 23:59:59.999. An undefined time is expressed as 0T.  

### Descriptive data types  
 The following table shows the relationship between the descriptive data types and the simple AL data types.  

|Descriptive data type|Included system data types|  
|---------------------------|--------------------------------|  
|Numeric|-   Byte<br />-   Char<br />-   Integer<br />-   BigInteger<br />-   Duration<br />-   Option<br />-   Decimal|  
|String|-   Text<br />-   Code|  

### Complex data types  
 Complex data types are used when you want to work with, for example, records in tables, pictures (bitmaps), or disk files. AL is object-based so each complex data type can include both member variables and member methods.  

 AL is not object-oriented but object-based. This is an important difference. In an object-oriented language or environment, you can create new types of objects that are based on the ones already in the system. In AL, you have the following application objects:  

-   Tables  

-   Reports  

-   Codeunits  

-   XMLports  

-   MenuSuites  

-   Pages  

-   Queries  

 You cannot create any other objects.  

#### Automation data type  
 <!-- For more information about the Automation data type, see [Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md).  -->

#### BigText data type  
 The BigText data type contains large text documents. Data of the BigText data type cannot be displayed in the debugger or in a message window. However, you can use the BigText methods to extract part of a big text and place it in a typical text string that can be displayed. The BigText methods are as follows:  

-   [ADDTEXT method (BigText)](../methods/devenv-addtext-method-bigtext.md)  

-   [GETSUBTEXT method (BigText)](../methods/devenv-getsubtext-method-bigtext.md)  

-   [LENGTH method (BigText)](../methods/devenv-length-method-bigtext.md)  

-   [READ method (BigText)](../methods/devenv-read-method-bigtext.md)  

-   [TEXTPOS method (BigText)](../methods/devenv-textpos-method-bigtext.md)  

-   [WRITE method (BigText)](../methods/devenv-write-method-bigtext.md)  

 The maximum length of a BigText variable is 2147483647 characters. This is the equivalent of 2 gigabytes (GB).  

#### BLOB data type  
 A BLOB is a Binary Large Object. Variables of this data type differ from typical numeric and string data type variables because they have a variable length. BLOBs are used to store memos (text), bitmaps (pictures), or user-defined types. The maximum size of a BLOB is often determined by your system’s disk storage capacity. The upper limit is 2GB.  

#### Codeunit data type  
 The Codeunit data type stores codeunits. A codeunit can contain several user-defined methods.  

#### DateFormula data type  
 The DateFormula data type contains a date formula that has the same capabilities as an ordinary input string for the [CALCDATE method (Date)](../methods/devenv-calcdate-method-date.md). The DateFormula data type is used to provide multilanguage capabilities to the CALCDATE method.  

#### Dialog data type  
 The Dialog data type stores dialog windows. A number of methods are available for manipulating dialogs.  

<!-- //NAV
#### DotNet data Type  
 For more information about the DotNet data type, see [Calling .NET Framework Members from AL](Calling-.NET-Framework-Members-from-C-AL.md).  
-->

#### File data type  
 The File data type provides access to operating system files.  

#### FieldRef ata type  
 The FieldRef data type identifies a field in a table and gives you access to this field. The FieldRef object can refer to any field in any table in the database.  

#### GUID data type  
 The GUID data type gives a unique identifying number to any database object.  

 The GUID data type is a 16-byte binary data type. This data type is used for the global identification of objects, programs, records, and so on. The most important property of a GUID is that each value is globally unique. The value is generated by an algorithm, developed by Microsoft, which guarantees this uniqueness.  

 The GUID is a 16-byte binary data type and can be logically grouped into the following subgroups: 4byte-2byte-2byte-2byte-6byte. The standard text representation is {12345678-1234-1234-1234-1234567890AB}.  

#### InStream and OutStream data types  
 The InStream and OutStream data types enable you to read from or write to files and BLOBs. In addition, you can use InStream and OutStream to read from and write to objects of the Automation and OCX data types.  

#### KeyRef data type
 The KeyRef data type identifies a key in a table and the fields in this key. This gives you access to the key and the fields it contains. The KeyRef object can refer to any key in any table in the database.  

<!-- //NAV
#### OCX data type  
 For more information about the OCX data type, see [Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md).  
 -->

#### Page data type  
 The Page data type stores pages that can contain several simpler elements called controls.  

#### Query data type
 The Query data type stores queries, which enable you to retrieve data from tables in the database and combine the data in a single dataset.  

#### Record data type  
 The Record data type consists of several simpler elements called fields. A record corresponds to a row in a table. Each field in the record is used to store values of a certain data type. The fields are accessed by using the variable name of the record (often the same as the name of the corresponding table), a dot (a period), and the field name. A record is typically used to hold information about a fixed number of properties.  

#### RecordID data type  
 The RecordID data type contains the table number and the primary key of a table. You can store a RecordID in the database but you cannot set filters on a RecordID.  

#### RecordRef data type  
 The RecordRef data type references a record in a table. Typically you use a RecordRef in methods that must apply to all tables, not to a specific table.  

 If one RecordRef variable is assigned to another RecordRef variable, then they both refer to the same table instance.  

#### Report data type  
 The Report data type stores reports.  

#### TableFilter data type  
 The TableFilter data type applies a filter to another table. This data type can only be used when you are setting security filters from the Permission table.  

#### Variant data type  
 The Variant data type can contain the following AL data types:  

-   Record  

-   File  

-   Action  

-   Codeunit  

-   Automation  

-   Boolean  

-   Option  

-   Integer  

-   Decimal  

-   Byte  

-   Char  

-   Text  

-   Code  

-   Date  

-   Time  

-   DateFormula  

-   TransactionType  

-   InStream  

-   OutStream  

## Arrays of variables  
 You can create 10-dimensional variables using the simple and complex data types. There are no limitations on how many elements a dimension can contain but an array variable can never have more than 1,000,000 elements. The physical size of an array is limited to 2 GB (or available memory). Arrays are always indexed with a number for each dimension that ranges from 1 to (and including) the size of the dimension. If you accidentally index outside the range of the dimensions of an array, then a run-time error occurs.  

 For example, assume that SampleArrayVariable is a one-dimensional array variable of data type Integer, with the dimension 10. To index the first element, use SampleArrayVariable[1]. To index the last element, use SampleArrayVariable[10].  

 As another example, assume that SampleArrayVariable2 is an array variable of data type Date with the dimensions 2x3x4. SampleArrayVariable2 has 24 elements. To index the first element, use SampleArrayVariable2[1,1,1]. To index the last element, use SampleArrayVariable2[2,3,4].  

 To declare a variable as an array, open the **Properties** window for the variable and then set the **Dimensions** property. For more information, see [Dimensions Property](../properties/devenv-dimensions-property.md).

## See Also
[AL Method Reference](../methods/devenv-al-method-reference.md)  