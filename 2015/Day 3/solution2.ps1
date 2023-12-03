class house {
    [int]$x
    [int]$y
    [int]$presents
}

$neighborhood = @()
$directions = (get-content '.\2015\Day 3\input.txt')
$directions = $directions.ToCharArray()

$currentX = [int]0
$currentY = [int]0
$place = 0
foreach ($step in $directions){
    $place++
    write-host $place
    $currentHouse = $null
    $currentHouse = $neighborhood | Where-Object {$_.X -eq $currentX -and $_.Y -eq $currentY}
    if ($null -eq $currentHouse){
        $newHouse = [house]::new()
        $newHouse.x = $currentX
        $newHouse.Y = $currentY
        $newHouse.presents++
        $neighborhood += $newHouse
    } else {
        $currentHouse.presents++
    }
    write-host $step
    switch ($step){
        "^"{
            $currentY++
            $currentHouse = $null
            $currentHouse = $neighborhood | Where-Object {$_.X -eq $currentX -and $_.Y -eq $currentY}
            if ($null -eq $currentHouse){
                $newHouse = [house]::new()
                $newHouse.x = $currentX
                $newHouse.y = $currentY
                $newHouse.presents++
                $neighborhood += $newHouse
            } else {
                $currentHouse.presents++
            }
        }
        "v"{
            $currentY--
            $currentHouse = $null
            $currentHouse = $neighborhood | Where-Object {$_.X -eq $currentX -and $_.Y -eq $currentY}
            if ($null -eq $currentHouse){
                $newHouse = [house]::new()
                $newHouse.x = $currentX
                $newHouse.y = $currentY
                $newHouse.presents++
                $neighborhood += $newHouse
            } else {
                $currentHouse.presents++
            }
        }
        "<"{
            $currentX--
            $currentHouse = $null
            $currentHouse = $neighborhood | Where-Object {$_.X -eq $currentX -and $_.Y -eq $currentY}
            if ($null -eq $currentHouse){
                $newHouse = [house]::new()
                $newHouse.x = $currentX
                $newHouse.y = $currentY
                $newHouse.presents++
                $neighborhood += $newHouse
            } else {
                $currentHouse.presents++
            }
        }
        ">"{
            $currentX++
            $currentHouse = $null
            $currentHouse = $neighborhood | Where-Object {$_.X -eq $currentX -and $_.Y -eq $currentY}
            if ($null -eq $currentHouse){
                $newHouse = [house]::new()
                $newHouse.x = $currentX
                $newHouse.y = $currentY
                $newHouse.presents++
                $neighborhood += $newHouse
            } else {
                $currentHouse.presents++
            }
        }
    }
}
$neighborhood | out-host
$neighborhood.count