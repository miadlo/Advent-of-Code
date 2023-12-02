$directions = get-content 'D:\Projects\Advent of Code\2015\Day 1\input.txt'
$directions = $directions.ToCharArray()

$floor = 0
$charPosition = 0

while ($floor -ge 0){
    $currentChar = $directions[$charPosition]
    write-host $floor $charPosition $directions[$charPosition] $currentChar
    if ($currentChar -match "\(" ){
        $floor++
        $charPosition++
    }
    elseif($currentChar -match "\)" ){
        $floor--
        $charPosition++
    }
}

write-host $floor $charPosition+1