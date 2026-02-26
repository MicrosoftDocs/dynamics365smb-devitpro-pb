# Robust TSV parser that handles multi-line cells
$ErrorActionPreference = 'Stop'

Write-Host "Reading clipboard..." -ForegroundColor Cyan
$raw = Get-Clipboard -Raw

if (-not $raw) {
    Write-Host "ERROR: Clipboard empty" -ForegroundColor Red
    exit 1
}

Write-Host "Parsing TSV data..." -ForegroundColor Yellow

# Parse TSV with quoted multi-line cells
$rows = @()
$currentRow = @()
$currentCell = ""
$inQuotes = $false
$chars = $raw.ToCharArray()

for ($i = 0; $i -lt $chars.Length; $i++) {
    $ch = $chars[$i]
    
    if ($ch -eq '"') {
        # Toggle quote state
        # Check for escaped quote ("")
        if ($i + 1 -lt $chars.Length -and $chars[$i + 1] -eq '"') {
            $currentCell += '"'
            $i++  # Skip next quote
        } else {
            $inQuotes = -not $inQuotes
        }
    }
    elseif ($ch -eq "`t" -and -not $inQuotes) {
        # Tab outside quotes = column separator
        $currentRow += $currentCell
        $currentCell = ""
    }
    elseif (($ch -eq "`r" -or $ch -eq "`n") -and -not $inQuotes) {
        # Newline outside quotes = row separator
        # Skip if preceded by other newline char
        if ($ch -eq "`n" -and $i -gt 0 -and $chars[$i-1] -eq "`r") {
            continue
        }
        
        # End current row
        if ($currentCell -or $currentRow.Count -gt 0) {
            $currentRow += $currentCell
            if ($currentRow.Count -gt 1) {  # Skip empty rows
                $rows += ,@($currentRow)
            }
            $currentRow = @()
            $currentCell = ""
        }
    }
    else {
        $currentCell += $ch
    }
}

# Add last row
if ($currentCell -or $currentRow.Count -gt 0) {
    $currentRow += $currentCell
    if ($currentRow.Count > 1) {
        $rows += ,@($currentRow)
    }
}

Write-Host "Parsed $($rows.Count) rows" -ForegroundColor Yellow

# Process rows (skip header)
$sections = @()
$count = 0

for ($i = 1; $i -lt $rows.Count; $i++) {
    $row = $rows[$i]
    
    if ($row.Count -ge 7) {
        $featureName = $row[1].Trim()
        $featureDetail = $row[6].Trim()
        
        if ($featureName -and $featureDetail) {
            # Process detail
            $featureDetail = $featureDetail -replace '<br/><br/>', "`n`n"
            $featureDetail = $featureDetail -replace '<br/>', "`n"
            $featureDetail = $featureDetail -replace '(?m)^### ', '#### '
            $featureDetail = $featureDetail -replace '(?m)^## ', '#### '
            
            # Add section
            $sections += "### $featureName"
            $sections += ""
            $sections += $featureDetail 
            $sections += ""
            $sections += ""
            
            $count++
            if ($count % 10 -eq 0) {
                Write-Host "  Processed $count features..." -ForegroundColor Gray
            }
        }
    }
}

# Build output
$output = @"
---
title: Feature details  
description: Feature details for Business Central 2026 release wave 1
---

# Feature details

$($sections -join "`n")
"@

# Save
$outFile = "C:\Users\jswymer\feature-sections-output.md"
$output | Set-Content $outFile -NoNewline -Encoding UTF8

Write-Host ""
Write-Host "SUCCESS!" -ForegroundColor Green
Write-Host "Created $count feature sections" -ForegroundColor Cyan
Write-Host "Output: $outFile" -ForegroundColor Cyan

# Stats
$h3 = ($sections | Where-Object { $_ -match '^### ' }).Count
$h4 = ($sections | Where-Object { $_ -match '^#### ' }).Count

Write-Host ""
Write-Host "Heading summary:" -ForegroundColor Yellow
Write-Host "  ### feature headings: $h3"
Write-Host "  #### subsection headings: $h4"

# Open
code $outFile
