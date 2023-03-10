## <a name="reportpayload"></a>Report payload

The report payload contains metadata for the report object and a list of attributes that identifies that current invocation. The payload consists of several attributes and has the following structure.

```json
{
    "filterviews":
    [
        {"name":"Header","tableid":112,"view":"VERSION(1) SORTING(Field3) WHERE(Field3=1(103027))"},
        {"name":"Line","tableid":113,"view":"VERSION(1) SORTING(Field3,Field4) WHERE(Field4=1(0..10000))"},
        {"name":"ShipmentLine","tableid":7190,"view":"VERSION(1) SORTING(Field1,Field2,Field3) WHERE(Field2=1(10000))"}
    ],
    "version":1,
    "objectname":"Standard Sales - Invoice",
    "objectid":1306,
    "documenttype":"application/pdf",
    "invokedby":"00000000-0000-0000-0000-000000000001",
    "invokeddatetime":"2020-01-17T15:33:52.48+01:00",
    "companyname":"CRONUS International Ltd.",
    "printername":"My Printer",
    "duplex":false,
    "color":false,
    "defaultcopies":1,
    "papertray":
    {
        "papersourcekind":257,
        "paperkind":0,
        "landscape":false,
        "units":0,
        "height":1268,
        "width":929
    },
    "intent":"Print",
    "layoutmodel": "Rdlc",
    "layoutname": "RDLCLayout",
    "layoutmimetype": "Application/ReportLayout/Rdlc",
    "layoutapplicationid": "f0f34810-9027-4288-9c6e-feddb557d057",
    "reportrunid": "6a3742c1-65ef-44a6-af58-3ef4a902932b"
}

```

<!--
{
    "filterviews":
    [
        {
            "name":"[DATA_ITEM_NAME]",
            "tableid":"[TABLE_ID]",
            "view":"[FILTER_VIEW]"
        }
    ],
    "version":1,
    "objectname":"[OBJECT_NAME]",
    "objectid":[REPORT_ID],
    "documenttype":"[MIME_TYPE]",
    "invokedby":"[SESSION_USER_ID]",
    "invokeddatetime":"[CLENT_LOCAL_DATETIME]", // for example, "2019-10-22T22:25:54.338+02:00"
    "printername":"[PRINTER_NAME]", 
    "companyname":"[COMPANY_NAME]", 
    "duplex":[default=false], 
    "color":[default=false], 
    "defaultcopies":[default=1], 
    "papertray": 
       { 
            "papersourcekind":"Upper" | 1, 
            "paperkind":"A4" | 9,
            "landscape":[default=false] 
            "units":[default="HI"], 
            "height":[default=0], 
            "width":[default=0]
        },
    "intent":"[REPORTINTENT]", // platform enum type serialized as string 'None|Print|Preview|Save|Schedule|Download|Parameters'
    "layoutmodel": "Rdlc",
    "layoutname": "RDLCLayout",
    "layoutmimetype": "Application/ReportLayout/Rdlc",
    "layoutapplicationid": "f0f34810-9027-4288-9c6e-feddb557d057",
    "reportrunid": "6a3742c1-65ef-44a6-af58-3ef4a902932b"
}

```
-->

### Attributes

#### *objectname*

Specifies the name of the object.

#### *objectid*

Specifies the ID of the object.

#### *documenttype*

Specifies the MIME type of the document. Currently only  `application/pdf` is supported for printing, other intents can have types specific to the report layout model and selected output target type.

#### *invokedby*

Specifies the ID of the user who invoked the print action.

#### *invokeddatetime*

Specifies the date and time that the print action was invoked, for example, `2019-10-22T22:25:54.338+02:00`. The value is the date and time on the client machine.

#### *companyname*

Specifies the Business Central company.

#### *version*

Specifies the version of the report payload. Currently, the only supported version for the payload is `1`.

#### *duplex*

Specifies whether to use duplex (2-sided) printing. `true` specifies duplex printing; otherwise `false`.

> [!NOTE]
>  `duplex` is currently not used and ignored at runtime.

#### *color*

Specifies whether color printing is set.  `true` specifies color printing; otherwise `false`.

> [!NOTE]
> `color` is currently not used and ignored at runtime.

#### *defaultcopies*

Specifies the number of copies to print by default. The default is `1`.

> [!NOTE]
>  `defaultcopies` is currently not used and ignored at runtime.

#### *filterviews*

Specifies views that are used on the document.

#### *name*

Specifies the name of data item that the filter view applies to.

#### *tableid*

Specifies the ID of the table for the view.

#### *view*

Specifies the name of the view.

#### *papertray*

Specifies the paper tray settings from the [printer payload](devenv-onaftersetupprinters-event.md#printpayload).

#### *papersourcekind*

Specifies a standard paper source for the paper tray. The value can be either the text representation (such as `AutomaticFeed`) or the corresponding number (such as `7`).

#### *paperkind*

Specifies the paper size. The value can be either the text representation (such as `A4`) or the corresponding number (such as `9`).

#### *landscape*

Specifies whether landscape orientation is used. `true` specifies landscape orientation; otherwise `false`.

#### *units*

Specifies the units of measurement for values in  `height` and `width` attributes. Valid values include:

- `HI` for hundredths of an inch (default value).
- `TI` for thousandths of an inch.
- `IN` for inches.
- `CM` for centimeters.
- `MM` for millimeters.
- `PC` for picas.
- `PT` for points.

#### *height*

Specifies the height of the paper. The values include positive integers up to 2,147,483,647.

#### *width*

Specifies the width of the paper. The values include positive integers up to 2,147,483,647.

#### *intent*

Specifies the intent of the current report invocation, which can be one of the following values.

- None
- Print
- Preview
- Save
- Schedule
- Download
- Parameters

#### *layoutmodel*

Specifies the layout model selected for teh current report invocation, which can be one of the following values.

- Rdlc
- Word
- Excel
- Custom

#### *layoutname*

Specifies the lauout name for the currently selected layout.

#### *layoutmimetype*

Specifies the lauout mimetype for the currently selected layout. The built-in layout types are:

- Application/ReportLayout/Rdlc
- Application/ReportLayout/Word
- Application/ReportLayout/Excel

#### *layoutapplicationid*

Specifies the id of the application that provides the selected layout.

#### *reportrunid*

Specifies a unique id of type `Guid` that identifies the current report invocation. This value can be used to correlate calls to report event that support `json` payloads. 
