---
title: "Configure Context-Sensitive Help"
description: Learn about how to add context-sensitive Help to your Business Central solution.
author: edupont04
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 08/09/2019
---

# Configure Context-Sensitive Help

A key pillar of helping users help themselves is to give them access to Help for the particular corner of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] that they are working in.  

## App-level configuration

At an app level, you can specify where the Help for your functionality is published in the app.json file. For example, if you publish your content to `https://mysite.com/en-us/mysolution`, then you would specify that in the *contextSensitiveHelpUrl* property as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/documentation",

```

In this example, the *contextSensitiveHelpUrl* property specifies that the links to the Help must go to the *mysite.com* site when the user is using your app's functionality across all locales. When the user is using functionality from the base application, then the Help calls will go to the default location on the *docs.microsoft.com* site.  

If your app only supports a limited number of locales, you can specify that as well as shown in the following example:

```json
  "contextSensitiveHelpUrl": "https://mysite.com/{0}/documentation",
  "supportedLocales": [
    "en-GB", "en-IE
  ],
```

### Localization apps

Specifically for localization apps that bring [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to new markets, the properties in the app.json file can be set to take over the links to Help for specific languages as shown in the following example:

```json
  "helpBaseUrl": "https://mysite.com/{0}/documentation",
  "supportedLocales": [
    "ca-es"
  ],
```

In this example, the *helpBaseUrl* and *supportedLocales* properties specify that the links to the Help must go to the *mysite.com* site when the user is using the product in either English (Ireland) or English (United Kingdom). If the user switches the application language to English (US), then the Help calls will go to the default location on the *docs.microsoft.com* site.  

## Page-level configuration

Your target website is expected to have a default page that will display if nothing else is specified. But for each page or page extension, and for each field or field group on those pages, you can then specify the exact Help page that describes this page or field. You can do that using the *ContextSensitiveHelpPage* property as shown in the following example:

```
page 50101 "Reward Card"
{
    PageType = Card;
    SourceTable = Reward;
    ContextSensitiveHelpPage = 'sales-rewards';

}
```

In this example, the app contains a page object that is mapped to the *sales-rewards* Help file on the website that the app.json specifies. As a result, the *Learn more* link in the tooltips for this page will go to the equivalent of *https://mysite.com/documentation/sales-rewards*.  

You can use the *ContextSensitiveHelpPage* property to direct all Help calls to the same article, or to group the Help calls based on individual features or workflows. For example, Microsoft has chosen to group the context-sensitive links depending on the granularity of the Help for specific area in the base application. If the Help for a specific area is made more granular, then the context-sensitive Help mapping is updated accordingly.  

You can set the *ContextSensitiveHelpPage* property on all pages, or only on those that you don't want to get the default Help page for your website. For page extensions, the value of the *ContextSensitiveHelpPage* property will apply only to the controls that the page extension adds to the extended page objects. For example, if your page extension adds two new controls to the base application's Customer Card page, then the *Learn more* links in the tooltips for those two controls will go to the Help page that you have specified, and the *Learn more* links in the rest of the controls will go to the default Help that is specified in the base application. This way, multiple apps can extend the same page object and each apply their own content-sensitive Help link without overwriting the context-sensitive links for other apps.  

In contrast, the app.json file also contains a *help* property, but this specifies the link that describes the app or solution itself and is used by AppSource.  

### How it works for the base application

In the current version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], the context-sensitive links to Help for the base application works in a different way that is based on a UI-to-Help mapping that is stored in table 2000000198 **Page Documentation**. In this table, all page objects in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are listed, and have a target Help article associated with each of them. This means that multiple page objects can be associated with the same Help article, such as when a specific workflow involves multiple pages.  

The table associates page IDs with target articles, but the URL to where to find the target article is specified at the application level that defaults to the [https://docs.microsoft.com/dynamics365/business-central/](/dynamics365/business-central/) site. In an extension, you can overrule this URL so that all calls for Help go to your site instead, for example. This is especially important for localization apps where all context-sensitive Help calls for that app's language must go to that app provider's website. For more information, see [Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/configure-help.md).  

### Adding page-level UI-to-Help mapping to the system table

You can run a script that populates the **Page Documentation** table with a mapping for Microsoft's page objects and your own page objects. This is useful if you want to reuse legacy [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] deployment. In that case, you can choose to overwrite the mapping that Microsoft has made.  

> [!CAUTION]
> The following content is intended as an example. You can choose to do things differently, and while you can use these scripts as inspiration, reusing the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] legacy Help, the legacy [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help Server, and populating the system table, **Page Documentation**, is not the recommended path going forward. We recommend that you convert any existing content to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] format instead, and that you fork our GitHub repos. For more information, see [Extend, Customize, and Collaborate on the Help for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](contributor-guide.md) and [Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format](../upgrade/migrate-help.md).  

In this example, you have chosen not to apply context-sensitive Help links to your page objects, and you want to overwrite the UI-to-Help mapping that Microsoft has made in the system table.  

The way that Microsoft populates the system table is based on an Excel sheet in the following format:

|Page ID  |Page Name  |Region/Country  |Relative Path  |
|---------|-----------|----------------|---------------|
|4     |Payment Terms |W1              |sales-manage-sales|
|11300 |Financial Journal  |BE         |how-to-create-financial-journals |

In this example, you want to replace the values of the fields in the **Relative Path** column with classic page-level Help files:

|Page ID  |Page Name  |Region/Country  |Relative Path  |
|---------|-----------|----------------|---------------|
|4     |Payment Terms |W1              |N_4|
|11300 |Financial Journal  |BE         |N_11300 |

Once you have done this mapping, you can apply it to the **Page Documentation** table by using a script such as the following.

> [!NOTE]
> The following script requires access to the SQL Server database with your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises data. The script also requires the page objects to be in .TXT format, so you must be using [!INCLUDE [prodshort](../developer/includes/prodshort.md)] April'19 (version 14.x) or earlier.

```powershell
\#\# --------------------------------------------------------------------------
\#\# Copyright © Microsoft Corporation. All rights reserved.
\#\# --------------------------------------------------------------------------

\#\# Imports page-level UI-to-Help mapping to the system table.

\# Column name constants
Set-Variable pageIdColumn 'Page ID' -Option Constant # $pageIdColumn
Set-Variable pageNameColumn 'Page Name' -Option Constant # $pageNameColumn
Set-Variable regionColumn 'Region/Country' -Option Constant # $regionColumn
Set-Variable relativePathColumn 'Relative Path' -Option Constant # $relativePathColumn
Set-Variable existingColumn 'Existing' -Option Constant # $existingColumn

\# Spreadsheet configuration constants
Set-Variable spreadsheetPath (Join-Path $env:INETROOT \DOC\UIMapping\UItoHelpMapping.xlsx) -Option Constant # $spreadsheetPath
Set-Variable supportedSpreadsheetColumns @($pageIdColumn, $pageNameColumn, $regionColumn, $relativePathColumn, $existingColumn) -Option Constant # $supportedSpreadsheetColumns

\# Database configuration constants
Set-Variable tableName '[dbo].[Page Documentation]' -Option Constant # $tableName
Set-Variable supportedTableColumns @($pageIdColumn, $relativePathColumn) -Option Constant # $supportedTableColumns

# Enlistment configuration constants
Set-Variable w1CsideObjectPath (Join-Path $env:INETROOT \App\BaseApp\PAG*.txt) -Option Constant # $csideObjectPath
Set-Variable gdlCsideObjectPath (Join-Path $env:INETROOT GDL) -Option Constant # $gdlCsideObjectPath
<\#
.SYNOPSIS
Imports the UI-to-Help mapping to the database from an Excel file.

.DESCRIPTION
The Import-UItoHelpMapping function first clears out all existing mappings the documentation table. It then loads the Excel mapping file (\DOC\UIMapping\UItoHelpMapping.xlsx) and inserts it as-is to the [dbo].[Page Documentation] system table in the specified database.

.PARAMETER DatabaseName
The name of the database to import the page documentation mappings. This parameter is required.

.PARAMETER DatabaseServer
The database server address that the database and table exist in.
This is an optional parameter; if it is not included, the default local server of '.' will be used.

.EXAMPLE
From the enlistment PowerShell console:

Import-UItoHelpMapping

.NOTES
This function communicates directly with the database, and therefore requires the permissions necessary to truncate and insert to [dbo].[Page Documentation]
\#>
function UItoHelpMapping
(
    [Parameter(Mandatory=$true)][string]$DatabaseName,
    [string]$DatabaseServer = '.',
    [alias('ns')][switch]$NoSync
)
{
    $location = Get-Location

    if (Test-Path $spreadsheetPath)
    {
        EnsureClosedXmlIsLoaded

        \# read spreadsheet to memory
        Write-Log "[Import]: Loading mappings from $spreadsheetPath..." -ForegroundColor Cyan
        $spreadsheet =  ReadExcelFile $spreadsheetPath

        \# prepare spreadsheet data to be pushed to system table
        Write-Log '[Import]: Preparing data for SQL bulk insert...' -ForegroundColor Cyan
        $dataTable = ConvertToDataTable $spreadsheet

        \# clear existing mapping system table
        Write-Log "[Import]: Truncating $tableName in $DatabaseName..." -ForegroundColor Cyan
        Invoke-Sqlcmd "TRUNCATE TABLE $tableName" -ServerInstance $DatabaseServer -Database $DatabaseName -SuppressProviderContextWarning

        \# push spreadsheet data to system table
        Write-Log "[Import]: Bulk-inserting data to $tableName in $DatabaseName..." -ForegroundColor Cyan
        BulkInsertPageDocumentation $dataTable $DatabaseServer $DatabaseName

        \# Verify that the spreadsheet contents were imported into the database
        $result = Invoke-Sqlcmd "SELECT COUNT(1) [rows] FROM $tableName" -ServerInstance $DatabaseServer -Database $DatabaseName
        if ($result.rows -eq $spreadsheet.Count)
        {
            Write-Log "[Import]: Successfully imported $($spreadsheet.Count) rows into $tableName." -ForegroundColor Green
        }
        else
        {
            Write-Log "[Import]: Import was not successful, found $($result.rows) rows but was expecting $($spreadsheet.Count)." -ForegroundColor Red
        }
    }
    else
    {
        Write-Log "[Import]: Mapping spreadsheet was not found, import skipped. Expected spreadsheet path: $spreadsheetPath" -ForegroundColor Yellow
    }

    Write-Log '[Import]: Import-UItoHelpMapping has completed.' -ForegroundColor Green

    \# this is a workaround for an issue where the SQL Cmdlet changes the location
    Set-Location $location
}

function ConvertToDataTable([hashtable[]]$spreadsheet)
{
    $dataTable = $null

    if ($spreadsheet -and $spreadsheet.Count -gt 0)
    {
        $dataTable = New-Object Data.DataTable
        $first = $true  

        foreach ($object in $spreadsheet)
        {
            $dataRow = $dataTable.NewRow()

            foreach($property in $object.GetEnumerator())
            {
                if ($supportedTableColumns.Contains($property.Name))
                {
                    if ($first)
                    {
                        $dataColumn = New-Object Data.DataColumn
                        $dataColumn.ColumnName = $property.Name
                        $dataColumn.DataType = [System.Type]::GetType('System.String')
                        $dataTable.Columns.Add($dataColumn)
                    }

                    $dataRow.Item($property.Name) = if ($property.Value -eq $null) { '' } else { $property.Value }
                }
            }

            $dataTable.Rows.Add($dataRow)
            $first = $false
        }
    }

    return $dataTable
}

function BulkInsertPageDocumentation($pageDocumentationDataTable, [string]$databaseServer, [string]$databaseName)
{
    if ($pageDocumentationDataTable -ne $null -and $pageDocumentationDataTable.Rows.Count -gt 0)
    {
        try
        {
            \# Build the connection string
            $connectionstring = "Data Source=$databaseServer;Integrated Security=true;Initial Catalog=$databaseName;"

            \# Instantiate a new .NET SqlBulkCopy object
            $bulkcopy = New-Object Data.SqlClient.SqlBulkCopy($connectionstring, [System.Data.SqlClient.SqlBulkCopyOptions]::TableLock)
            $bulkcopy.DestinationTableName = $tableName

            \# only load the supported columns so any timestamp column receives a default value
            foreach ($column in $supportedTableColumns)
            {
                $null = $bulkcopy.ColumnMappings.Add($column, $column)
            }

            \# Bulk-copy the data to the table
            $bulkcopy.WriteToServer($pageDocumentationDataTable)
        }
        catch
        {
            throw
        }
        finally
        {
            if ($bulkcopy)
            {
                \# Clean up
                $bulkcopy.Close()
                $bulkcopy.Dispose()
            }
        }
    }
}

function GetPagesFromDisk
{
    \# $pages = @{}
    [hashtable[]]$pages = @()
    $w1RegionName = "W1"

    $headerRegex = [regex]'(?m)^\s*OBJECT\s+Page\s+(?<id>\d+)\s+(?<name>.+)$'
    $w1Items = Get-ChildItem $w1CsideObjectPath | Where { $_.Length -gt 0} | Select Name, FullName,  @{Name=$regionColumn;Expression={$w1RegionName}}
    $gdlItems = GetGDLPagesFromDisk $w1Items

    \# Combine W1 and GDL
    $items = $w1Items + $gdlItems
    $length = $items.Length
    [int]$progressStep = $length / 20

    for ($i = 0; $i -lt $length; $i++)
    {
        $item = $items[$i]

        \# Calling Write-Progress for every file was slowing down the console significantly. Instead only write every ~5%
        if (($i % $progressStep) -eq 0)
        {
            Write-Progress -Activity 'Getting pages from disk' -PercentComplete ($i / $length * 100)
        }

        $definition = Get-Content $item.FullName -First 1

        if ($definition -match $headerRegex)
        {
            $pages +=
                @{
                    $pageIdColumn = [int]$matches['id'];
                    $pageNameColumn = $matches['name'];
                    $regionColumn = $item.$regionColumn
                }
        }
    }

    Write-Progress -Activity 'Completed getting pages from disk.' -Completed

    return $pages
}

function GetGDLPagesFromDisk($w1pages) {
    $pages = $null

    $directories = Get-ChildItem -Directory $gdlCsideObjectPath | Select-Object Name, FullName
    foreach ($directory in $directories) {
        $gdlCsidePagePath = Join-Path $directory.FullName \DevBase\BaseApp\PAG*.txt

        \# get gdl pages while excluding those common to W1
        $pages += Get-ChildItem $gdlCsidePagePath | Where-Object { $_.Length -gt 0} `
            | Select-Object Name, FullName, @{Name = $regionColumn; Expression = {($directory.Name).ToUpper()}} `
            | Where-Object -FilterScript {$w1pages.Name -notcontains $_.Name}
    }

    \# only return unique pages across all countries. observed that some pages are duplicated across NA, MX, CA
    return $pages | Sort-Object Name -Unique
}

function GetPagesFromSpreadsheet([string]$path)
{
    [hashtable[]]$existingPages = @()

    \# get all existing doc mappings from source of truth (spreadsheet)
    $contents = ReadExcelFile $path

    foreach ($row in $contents)
    {
        $existingPages +=
        @{
            $pageIdColumn = [int]$row.$pageIdColumn;
            $regionColumn = $row.$regionColumn;
            $relativePathColumn = $row.$relativePathColumn
        }
    }

    return $existingPages
}

function MergeSourceWithPageMappings([hashtable[]]$source, [hashtable[]]$mappings)
{
    [hashtable[]]$merged = @()
    $idRelativePathmappings = @{}
    $mappings | ForEach-Object { $idRelativePathmappings.Add($_.$pageIdColumn,$_.$relativePathColumn) }

    foreach ($sourceItem in $source.GetEnumerator())
    {
        $merged +=
        @{
            $pageIdColumn = $sourceItem.$pageIdColumn;
            $pageNameColumn = $sourceItem.$pageNameColumn;
            $regionColumn = $sourceItem.$regionColumn;
            $relativePathColumn = $idRelativePathmappings[$sourceItem.$pageIdColumn];
            $existingColumn = $idRelativePathmappings.ContainsKey($sourceItem.$pageIdColumn)
        }
    }

    return ($merged | Sort-Object {$_.$pageIdColumn})
}

function EnsureClosedXmlIsLoaded()
{
    $closedXmlPath = "$env:PkgClosedXML\lib\net40-client\closedXML.dll"
    if(!(Test-Path $closedXmlPath))
    {
        throw "Could not locate $closedXmlPath"
    }

    try
    {
        \# Ensure that the ClosedXML .NET dependency is loaded
        Add-Type -Path $closedXmlPath
    }
    catch
    {
        Write-Warning "Unable to load ClosedXML, please ensure that Open XML SDK v2.5 (https://www.microsoft.com/en-us/download/details.aspx?id=30425) is installed on this machine and that the ClosedXML DLL exists ($closedXmlPath) and try again."
        Write-Warning "Exception Message: $($_.Exception.Message)"
    }
}

\#\# Excel I/O

function ReadExcelFile([string]$path)
{
    [hashtable[]]$excelFile = @()

    if (Test-Path $path)
    {
        $workbook = New-Object ClosedXML.Excel.XLWorkbook $path

        if ($workbook.Worksheets.Count -eq 1)
        {
            $worksheet = $workbook.Worksheet(1); # worksheets are 1-indexed
            $columnMap = GetExcelColumnMapping $worksheet

            $first = $true

            foreach ($row in $worksheet.RowsUsed($false, $null))
            {
                $rowObject = @{}

                if ($first)
                {
                    $first = $false
                    continue # skip the first row since it contains column headers
                }

                foreach ($map in $columnMap.GetEnumerator())
                {
                    $rowObject.Add($map.Name, $row.Cell([int]$map.Value).Value)
                }

                $excelFile += $rowObject
            }
        }
    }

    return $excelFile
}

function WriteExcelFile([string]$path, [hashtable[]]$contents)
{
    $columnMap

    $existingWorksheet = $null

    if (Test-Path $path)
    {
        $existingWorkbook = New-Object ClosedXML.Excel.XLWorkbook $path
        $existingWorksheet = if ($existingWorkbook.Worksheets.Count -eq 1) { $existingWorkbook.Worksheet(1) } else { $null }
    }

    $columnMap = GetExcelColumnMapping $existingWorksheet

    $workbook = New-Object ClosedXML.Excel.XLWorkbook # create in-memory and use the .SaveAs() method to save to disk
    $worksheet = $workbook.AddWorksheet([IO.Path]::GetFileNameWithoutExtension($path), 1)

    \# write column headers
    foreach ($map in $columnMap.GetEnumerator())
    {
        $worksheet.Cell(1, [int]$map.Value).Value = $map.Name
    }

    $i = 2
    foreach ($row in $contents)
    {
        foreach ($map in $columnMap.GetEnumerator())
        {
            $worksheet.Cell($i, [int]$map.Value).Value = $row.($map.Name)
        }

        $i++
    }

    $workbook.SaveAs($path);
}

function GetExcelColumnMapping([ClosedXML.Excel.IXLWorksheet]$worksheet)
{
    $columnMap = @{}

    if ($worksheet)
    {
        \# get existing column order
        foreach ($column in $worksheet.ColumnsUsed($false, $null))
        {
            $cell = $column.Cell(1) # cells are 1-indexed
            $columnName = $cell.Value

            if ($supportedSpreadsheetColumns.Contains($columnName) -and -not $columnMap.ContainsKey($columnName))
            {
                $columnMap.Add($columnName, $cell.Address.ColumnNumber)
            }
        }

        if ($columnMap.Count -ne $supportedSpreadsheetColumns.Count)
        {
            throw 'Worksheet is not in correct format: missing columns'
        }
    }
    else
    {
        \# create default column order based off of the order of the supported columns
        for($i = 0; $i -lt $supportedSpreadsheetColumns.Count; $i++)
        {
            $columnMap.Add($supportedSpreadsheetColumns[$i], $i + 1)
        }
    }

    return $columnMap
}

Export-ModuleMember -Function Export-NavSaaSDocumentationMapping
Export-ModuleMember -Function Import-NavSaaSDocumentationMapping

```

## See also

[User Assistance Model](../user-assistance.md)  
[Resources for Help and Support for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../help-and-support.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[Blog post: Extending and customizing the Help](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/11/extending-and-customizing-help)  
[Blog post: Collaborate on content for Business Central](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/12/15/collaborate-on-content-for-business-central)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
