#!/bin/sh
#Author: Simone Romboli
echo "ciao, proverò ad aggiungere le pause nel gcode della DrawBot";
echo "nello specifico aggiungerò G4 P0.5 che fermerà la macchina per 500ms dopo ogni tracciato";
current_time=$(date "+%Y%m%d%H%M%S");
echo "Current Time : $current_time";

if [ -z $1 ]; then
	echo "manca file in ingresso";
  echo "utilizzo: ./add_pause.sh <nome file da modificare>";
else
	echo "{$1}";
  new_fileName=$current_time.$1;
  echo "New FileName: " "$new_fileName";
  sed '/^M05.*/a G4 P0.5' $1 > $new_fileName;
	echo "done";
fi;
echo "fine";
