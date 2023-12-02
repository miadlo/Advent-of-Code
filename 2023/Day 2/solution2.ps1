$dataImport = get-content 'D:\Projects\Advent of Code\2023\Day 2\input.txt'
$maxRed = [int]12
$maxBlue = [int]14
$maxGreen = [int]13
$gameSplit = $dataImport.split(":")
$gameData = @()
$gameNumber = $null
$red = @()
$blue = @()
$green = @()

foreach ($game in $gameSplit){
    $firstData = [pscustomobject]@{
        Game = $null
        SetData = $null
    }
    switch($game.Length){
        6 {
            $gameNumber = $game[-1]
        }
        7 {
            $gameNumber = $game[-2]+$game[-1]
        }
        8 {
            $gameNumber = $game[-3]+$game[-2]+$game[-1]
        }
        default {
            $firstData.Game = [int]$gameNumber
            $firstData.setData = $game
        }
    }
    if ($firstData.game -ne $null){
        $gameData += $firstData
    } 
}

$tempAnswer = $null
$answer = $null
$currentGame = $null

foreach ($game in $gameData){
    $currentGame = $game.Game
    $red = @()
    $blue = @()
    $green = @()
    $redCheck = $false
    $blueCheck = $false
    $greenCheck = $false
    $setSplit = ($game.setData).split(";")
    forEach($set in $setSplit){
        $itemSplit = $set.split(",")
        forEach($item in $itemSplit){
            $colorCheck = $item[-3]+$item[-2]+$item[-1]
            $number = $item[1]+$item[2]
            if ($colorCheck -eq "red"){
                $red += [int]$number
            } elseif ($colorCheck -eq "een"){
                $green += [int]$number
            } elseif ($colorCheck -eq "lue"){
                $blue += [int]$number
            }
        }
    }
    $finalRed = ($red | Measure-Object -Maximum).Maximum
    $finalBlue = ($blue | Measure-Object -Maximum).Maximum
    $finalGreen = ($green | Measure-Object -Maximum).Maximum
    $tempAnswer = $finalRed*$finalBlue*$finalGreen
    $answer = [int]$answer+[int]$tempAnswer
}
write-host $answer