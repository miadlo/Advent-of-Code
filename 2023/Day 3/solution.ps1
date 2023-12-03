$partsLayout = Get-Content '.\2023\Day 3\inputtest.txt'
$parsedLines = New-Object System.Collections.ArrayList
$currentLine = New-Object System.Collections.ArrayList

$lineNumber = 0

foreach ($line in $partsLayout){
    $chars = $line.ToCharArray()
    $position = 0
    foreach ($char in $chars){
        $currentWorkingData = [PSCustomObject]@{
            lineNumber = $lineNumber
            linePosition = $position
            character = $char
        }
        $currentLine += $currentWorkingData
        $position++
    }
    $parsedLines.add($currentLine)
    $lineNumber++
}
$tempString
foreach ($line in $parsedLines){
    foreach ($temp in $line){
        $tempString += $temp.character
    }
    $tempstring += "`n"
}
write-host $tempString