[System.Environment]::SetEnvironmentVariable("SSH_AUTH_SOCK", $null)
[System.Environment]::SetEnvironmentVariable("SSH_AGENT_PID", $null)
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Import-Module oh-my-posh
Set-PoshPrompt -Theme ~/.poshthemes/lsz.omp.json

Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
                dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
                               [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
                                       }
}

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete

function Update-Repositories() {
    $basePath = 'C:\Repos\'
    $reposPath = Get-ChildItem -Path C:\Repos | Where-Object {$_.Name -Match 'repo.*' }

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
