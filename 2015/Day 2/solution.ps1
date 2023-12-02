$dimensions = get-content 'D:\Projects\Advent of Code\2015\Day 2\inputtest.txt'
$presents = @()
$presentNumber = 0

foreach ($present in $dimensions) {
    $present = $present.Split("x")
    $currentPresentData = @{
        present = $presentNumber
        length = $present[0]
        width = $present[1]
        height = $present[2]
        side1 = $null
        side2 = $null
        side3 = $null
        feet = $null
    }
    $currentPresent = New-Object -TypeName PSObject -Property $currentPresentData
    $side1 = ($currentPresent.length*$currentPresent.width)
    $side2 = ($currentPresent.Width*$currentPresent.Height)
    $side3 = ($currentPresent.height*$currentPresent.length)
    $currentPresent.feet = (2*$currentPresent.length*$currentPresent.width) + (2*$currentPresent.Width*$currentPresent.Height) + (2*$currentPresent.height*$currentPresent.length)
    $presents += $currentPresent
    $presentNumber++
}

$finalAnswer = 0

foreach ($finalPresent in $presents) {
    $tempArray = @($side1,$side2,$side3)
    $minimum = ($tempArray | Measure -Minimum).Minimum
    $currentPresentFeet = $minimum + $finalPresent.feet
    $finalAnswer += $currentPresentFeet
    write-host $currentPresentFeet $minimum
}

write-host $finalAnswer