# Arquivo de Configuração do Windows Terminal
## Configurações específicas

### Git
* Para funcionamento do Git-Bash é necessário adicionar o diretório `"%programfiles%\Git\Bin"` no PATH
* Alterar o diretório do parâmetro `--cd` para o diretório padrão de repositórios da máquins
* Instalar OpenSSH para utilizar o git-posh sem necessidade de informar a senha todas as vezes.
    * Também é necessário configurar o git para utilizar o OpenSSH
      * `git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe`
* Configurar o git para utilizar o gVim
  * `git config --global core.editor 'gvim -f'`

### Vim
* Para funcionamento do Vim é necessário adicionar o diretório `"%programfiles(x86)%\Vim\vim81"` no PATH

### Ubuntu
* Conferir a versõo da distribuição do Ubuntu que é passada no parâmetro `-d`
