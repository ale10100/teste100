@echo off

rem Defina as variáveis do FTP
set SERVER=192.168.100.159
set USERNAME=root
set PASSWORD=root
set REMOTE_PATH=/teste
set LOCAL_PATH=C:\Windows

rem Crie um arquivo de script temporário para o FTP
echo open %SERVER% > ftpcmd.txt
echo %USERNAME% >> ftpcmd.txt
echo %PASSWORD% >> ftpcmd.txt
echo cd %REMOTE_PATH% >> ftpcmd.txt
echo binary >> ftpcmd.txt

rem Adicione comandos para enviar todos os arquivos recursivamente
for /r "%LOCAL_PATH%" %%f in (*) do (
    echo put "%%f" >> ftpcmd.txt
)

echo quit >> ftpcmd.txt

rem Execute o FTP com o arquivo de script
ftp -n -s:ftpcmd.txt

rem Exclua o arquivo de script temporário
del ftpcmd.txt

echo Transferência concluída.
