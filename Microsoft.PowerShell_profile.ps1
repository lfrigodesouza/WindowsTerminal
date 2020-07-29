Set-PSReadlineKeyHandler -Key Tab -Function Complete
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

Import-Module oh-my-posh
[System.Environment]::SetEnvironmentVariable("SSH_AUTH_SOCK", $null)
[System.Environment]::SetEnvironmentVariable("SSH_AGENT_PID", $null)
Set-Theme Paradox

function Update-Repositories() {
    $basePath = 'C:\Repos\'
    $reposPath = Get-ChildItem -Path C:\Repos | Where-Object {$_.Name -Match 'easynvest.*' }

    ForEach($i in $reposPath){
        $curPath = "$($basePath)$($i.Name)"
            cd $curPath
            Write-Host "processando $($curPath)" -ForegroundColor Green
            git checkout develop
            git fetch -p
            git pull
            git branch -v | wsl grep 'gone' | %{$_.Split(' ')[2];} | %{git branch -D $_}
    }
    cd $basePath
}
