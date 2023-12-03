$dimensions = get-content 'D:\Projects\Advent of Code\2015\Day 2\input.txt'
$presents = @()
$presentNumber = 0

foreach ($present in $dimensions) {
    $present = $present.Split("x")
    $currentPresentData = [ordered]@{
        present = [int]$presentNumber
        length = [int]$present[0]
        width = [int]$present[1]
        height = [int]$present[2]
        side1 = $null
        side2 = $null
        side3 = $null
        feet = $null
    }
    $currentPresent = New-Object -TypeName PSObject -Property $currentPresentData
    $currentPresent.side1 = ($currentPresent.length*$currentPresent.width)
    $currentPresent.side2 = ($currentPresent.Width*$currentPresent.Height)
    $currentPresent.side3 = ($currentPresent.height*$currentPresent.length)
    $currentPresent.feet = (2*$currentPresent.side1) + (2*$currentPresent.side2) + (2*$currentPresent.side3)
    $presents += $currentPresent
    $presentNumber++
}

$finalAnswer = 0

foreach ($finalPresent in $presents) {
    $length = [int]$finalPresent.length+[int]$finalPresent.length
    $width = [int]$finalPresent.width+[int]$finalPresent.width
    $height = [int]$finalPresent.height+[int]$finalPresent.height
    $tempArray = @($length,$width,$height)
    $sorted = $tempArray | Sort-Object
    $lowest = $sorted[0]
    $secondLowest = $sorted[1]
    $wrapAround = $lowest+$secondLowest
    $bow = $finalPresent.length*$finalPresent.width*$finalPresent.height
    $totalRibbon = [int]$wrapAround+[int]$bow
    $finalAnswer = $finalAnswer+$totalRibbon
    write-host "$wrapAround+$bow=$totalRibbon ===== $finalAnswer"
}

write-host $finalAnswer