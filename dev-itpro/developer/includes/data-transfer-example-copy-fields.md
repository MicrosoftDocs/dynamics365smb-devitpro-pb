---
author: jswymer
ms.topic: include
ms.date: 09/28/2022
ms.author: jswymer
---
In this example, you have two tables, **Source** and **Destination**. You're planning on obsoleting field **S3** in the **Source** table. But before you do, you want to copy some values of **S3** into the field **D3** of the **Destination** table. Specifically, you only want to copy field **S3** in rows where field **S2** is equal to *A*.

```AL
local procedure CopyRows()
var
    dt: DataTransfer;
    src: Record Source;
    dest : Record Destination;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFieldValue(src.FieldNo("PK"), dest.FieldNo("PK"));
    dt.AddFieldValue(src.FieldNo("S3"), dest.FieldNo("D3"));
    dt.AddConstantValue('X', dest.FieldNo(D2));
    dt.AddSourceFilter(src.FieldNo("S2"), '=%1', 'A');
    dt.CopyRows();
end;
```
