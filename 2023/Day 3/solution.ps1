$partsLayout = Get-Content '.\2023\Day 3\input.txt'
$parsedLines = New-Object System.Collections.ArrayList

$lineNumber = 0

foreach ($line in $partsLayout){
    $chars = $line.ToCharArray()
    $position = 0
    $currentLine = New-Object System.Collections.ArrayList
    foreach ($char in $chars){
        $currentWorkingData = [PSCustomObject]@{
            lineNumber = $lineNumber
            linePosition = $position
            character = $char
        }
        $currentLine += $currentWorkingData
        $position++
    }
    $parsedLines.add($currentLine) | out-null
    $linenumber++
}

$lineNumber = 0

for ($lineNumber;$lineNumber -le (($parsedLines[-1].lineNumber)[0]);$lineNumber++){
    $stringTest = $null
    $workingLine = $parsedLines | Where-Object {$_.lineNumber -eq $lineNumber}
    foreach ($character in $workingLine){
        $stringTest += $character.character
    }
    write-host $stringTest
}