::Creation des variables utilitaires
  cd /d %~dp0
  set RESSOURCES=%cd%\Sources\RESSOURCES\
  set INSTALL=%cd%\Sources\INSTALL\
  set SYSTEM32=C:\Windows\System32

  
::Détection de l'environnement
  start /wait %INSTALL%\SCRIPTS\check_version.cmd
  
  :: Si l'environnement est W8 
	if %eight%==true (
	@echo OFF
	echo "Ce script ne prend pas en charge Windows 8 & Windows 8.1"
	pause
	exit
	)  
 
::Installation des logiciels
  start /wait %INSTALL%\SCRIPTS\Intall_softs.cmd
  
:: Configuration
  start /wait %INSTALL%\SCRIPTS\configuration.cmd
  

  ::Immunisation WannaCrypt
  powershell.exe -File %INSTALL%\SCRIPTS\Get-WannaCryPatchState.ps1