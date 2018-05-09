::Installation des prérequis
::Microsoft .NET 4.7.1
  call %RESSOURCES%\SOFTS\dotNET_4.7.1.exe /q /norestart
::Flash Player Active X
  start /wait msiexec /I %RESSOURCES%\SOFTS\install_flash_player_ax.msi /passive /norestart
::Flash Player Plugin
  start /wait msiexec /I %RESSOURCES%\SOFTS\install_flash_player_plugin.msi /passive /norestart

::Lancement du script d'installation des logiciels via Ninite
  start /wait "Ninite" "%RESSOURCES%\SOFTS\install_softs.exe"
  timeout /T 800
  taskkill /im "install_softs.exe"
exit
