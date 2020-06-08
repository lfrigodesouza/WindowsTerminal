Set-PSReadlineKeyHandler -Key Tab -Function Complete
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Import-Module oh-my-posh
[System.Environment]::SetEnvironmentVariable("SSH_AUTH_SOCK", $null)
[System.Environment]::SetEnvironmentVariable("SSH_AGENT_PID", $null)
Set-Theme Paradox
# Start-SshAgent
# Add-SshKey (Resolve-Path ~\.ssh\id_rsa.txt)
# $GitPromptSettings.DefaultForegroundColor = "DarkCyan"
# $GitPromptSettings.DefaultPromptSuffix = '`n$(''>'' * ($nestedPromptLevel + 1)) '
# $GitPromptSettings.DefaultPromptPrefix = '$env:USERNAME@$(hostname) '