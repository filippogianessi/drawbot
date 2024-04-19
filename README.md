# Drawbot x Spazio Spazio

# Script alza penna

Nota: Per fare fermare la penna al termine di un tracciato, inserire il codice `**G4 P0.5**` dopo ogni occorenza di `**M05 S0**`
⚠️ Disclaimer: questo script non è supportato su MacOS, consigliato eseguirlo direttamente dentro il raspberry, o macchina linux.

## Esiste uno scriptino che lo fa per te!


- Apri il Terminale
- Dirigiti nella cartella dei gcode generati (o comunque dov'è lo script)
    - `cd /Scrivania/gcode`
- Esegui il comando
    - `./add_pause.sh <nome file>`
- Verrà generato un file nuovo con la pausa incorporata!

Buon divertimento

p.s: se qualcuno ha cancellato il file add_pause.sh ovviamente non funzionerà la cosa

```bash
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
```

## Configurare lo scriptino

- Allora apri un editor di testo e incollaci lo scriptino qui sopra
- Crea una cartella sulla Scrivania per comodità
- Salva il file nella cartella cui sopra come `add_pause.sh`
- A questo punto apri il terminale e dirigiti nella cartella creata
    - Se c'è modo dal Gestore File fai "apri terminale in questa posizione" altrimenti:
    - Bisognerà digitare qualcosa tipo `cd /Scrivania/cartellacreata`
    - Ora digitare `sudo chmod 777 add_pause.sh`
    - Ora lo scriptino è eseguibile da chiunque
