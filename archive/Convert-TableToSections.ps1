# Script to convert feature table to sections in whatsnew-update-28-0.md

$filePath = "c:\GitHub\dynamics365smb-devitpro\dev-itpro\whatsnew\whatsnew-update-28-0.md"
$content = Get-Content $filePath -Raw

# Find the table section - starts after "## Feature details" until the next ##
$pattern = '(?s)(## Feature details\r?\n)(\|.*?)(\r?\n##)'

if ($content -match $pattern) {
    $before = $matches[1]
    $tableContent = $matches[2]
    $after = $matches[3]
    
    # Parse table rows (skip header rows)
    $rows = $tableContent -split '\r?\n' | Where-Object { $_ -match '^\|' -and $_ -notmatch '^[\|\s\-]+$' }
    
    $sections = @()
    
    foreach ($row in $rows) {
        # Split by pipe and clean up
        $columns = $row -split '\|' | ForEach-Object { $_.Trim() }
        
        # Skip if not enough columns or if it's a header/separator row
        if ($columns.Count -lt 7 -or $columns[1] -match '^[\-\s]*$') {
            continue
        }
        
        $featureName = $columns[2]  # Feature Name column
        $featureDetail = $columns[7]  # Feature Detail column
        
        # Skip empty rows
        if ([string]::IsNullOrWhiteSpace($featureName) -or [string]::IsNullOrWhiteSpace($featureDetail)) {
            continue
        }
        
        # Create section
        $section = @"

### $featureName

$featureDetail
"@
        $sections += $section
    }
    
    # Combine all sections
    $allSections = $sections -join "`n"
    
    # Replace table with sections
    $newContent = $content -replace $pattern, "$before$allSections$after"
    
    # Save the file
    $newContent | Set-Content $filePath -NoNewline
    
    Write-Host "Successfully converted table to sections!"
    Write-Host "Processed $($sections.Count) features"
}
else {
    Write-Host "Could not find the table section in the file"
}
