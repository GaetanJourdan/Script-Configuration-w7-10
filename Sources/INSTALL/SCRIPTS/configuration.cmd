::Désactivation fonctionnalités
  start /wait %INSTALL%\SCRIPTS\disablefeatures.cmd

::Configuration diverses windows 7
  if %seven%==true (
   ::Cacher l'icone de langue 
    reg import %INSTALL%\REGWIN\w7_langbar.reg
   ::Cacher icone du centre de maintenance
    reg import %INSTALL%\REGWIN\w7_maintenancecenter.reg
   ::Cacher fichiers et extensions
    reg import %INSTALL%\REGWIN\w7_hideextfile.reg
   ::Configuration du menu démarrer
	reg import %INSTALL%\REGWIN\w7_confstartmenu.reg
   ::Désactivation de la proposition d'upgrade vers w10
	reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Gwx /v "DisableGwx" /t REG_DWORD /d 0x1
	reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v "DisableOSUpgrade" /t REG_DWORD /d 0x1
   )
  
 
::Configuration diverses Windows 10
  if %ten%==true (
      reg import %INSTALL%\REGWIN\w10_search.reg
      reg import %INSTALL%\REGWIN\w10_explorer_pc.reg
    ::Configuration Menu Démarrer
      powershell.exe -File %INSTALL%\SCRIPTS\w10_config_startmenu.ps1
      reg import %INSTALL%\REGWIN\w10_reset_startlayout.reg
	::Ajout des icones
      reg import %INSTALL%\REGWIN\w10_shortcut_startlayout.reg
	::Exclusion ISO dans 7-zip
      reg import %INSTALL%\REGWIN\w10_7z_excludeISO.reg
    ::Cacher icon application actives & contacts
      reg import %INSTALL%\REGWIN\w10_taskviewcontacticons.reg
  )

::Renommage disque dur
  label C: OS
  
::Ajout du raccourci de masquage de D:
  copy "%RESSOURCES%\RACCOURCIS\Executer pour cacher D.lnk" C:\Users\%username%\Desktop\
  
::Ajout du raccourci Ce PC
  copy "%RESSOURCES%\RACCOURCIS\Ce PC.lnk" C:\Users\%username%\Desktop\

::Redemarrage Explorer.exe pour application des changements
  taskkill /f /IM explorer.exe
  timeout /T 2 /NOBREAK 
  start %SystemRoot%\explorer.exe
  timeout /T 2 /NOBREAK


::Immunisation WannaCrypt
  start /wait %INSTALL%\SCRIPTS\locky.cmd

exit
