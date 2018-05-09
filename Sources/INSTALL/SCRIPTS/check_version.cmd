::Détection de l'environnement
ver | find /i "version 10.0." > nul
if %errorlevel%==0 set ten=true
ver | find /i "version 6.3." > nul
if %errorlevel%==0 set eight=true
ver | find /i "version 6.2." > nul
if %errorlevel%==0 set eight=true
ver | find /i "version 6.1." > nul
if %errorlevel%==0 set seven=true

exit
