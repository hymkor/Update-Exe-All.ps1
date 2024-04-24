Set-PSDebug -Strict

function Update-Exe($source){
    if ( -not (Test-Path $source) ){
        Write-Host "$source not found"
        Exit 1
    }

    $name = (Split-Path $source -Leaf)

    Get-Command $name -All | ForEach-Object {
        $target = $_.Source
        $dir = (Split-Path -Parent $target)
        $answer = (Read-Host "Update `"${target}`" ? [y|n]")
        if ( $answer -ieq "y" ){
            Try{
                Copy-Item $source -Destination $dir -PassThru -ErrorAction Stop
            }
            Catch{
                $backup = (Join-Path $dir ($name + "-" + (Get-Random)))
                Move-Item $target $backup -PassThru
                Copy-Item $source -Destination $dir -PassThru
            }
        }
    }
}

if ( $args.Length -lt 1 ){
    Write-Host "Update-Exe-All.ps1 EXECUTABLE-NAME"
    Exit 1
}

foreach ( $source in $args ){
    Update-Exe $source
}

