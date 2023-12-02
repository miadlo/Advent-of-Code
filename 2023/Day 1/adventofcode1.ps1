$inputFile = get-content 'D:\projects\Advent of Code\adventofcode1input.txt'
$newInput = @()
$sanatizedInput = @()
$finalNumbers = @()

foreach ($value in $inputFile) {
    #Oh lordy, oh lordy, please please let this nastiness work.  It worked! So I have it replace the normal spelled ones with numbers, then I do a replace missing the last letter, then a replace missing the first letter
    $intValue = $value -replace "one", "1" -replace "two", "2" -replace "three", "3" -replace "four", "4" -replace "five", "5" -replace "six", "6" -replace "seven", "7" -replace "eight", "8" -replace "nine", "9" -replace "on", "1" -replace "tw", "2" -replace "thre", "3" -replace "fou", "4" -replace "fiv", "5" -replace "si", "6" -replace "seve", "7" -replace "eigh", "8" -replace "nin", "9" -replace "ne", "1" -replace "wo", "2" -replace "hree", "3" -replace "our", "4" -replace "ive", "5" -replace "ix", "6" -replace "even", "7" -replace "ight", "8" -replace "ine", "9"
    $sanatizedInput += $intValue
}

foreach ($value in $sanatizedInput){
    $tempValue = $value -replace "[^0-9]", ""
    $newInput += $tempValue
}

foreach ($newValue in $newInput){
    $num1 = [string]$newValue[0]
    $num2 = [string]$newValue[-1]
    [string]$num3 = [string]$num1 + [string]$num2
    $finalNumbers += $num3
}

$totaledNumber = 0

foreach ($number in $finalNumbers) {
    $totaledNumber = $totaledNumber + $number
}

write-host $totaledNumber