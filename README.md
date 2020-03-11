Experimental protocol
=====================
Eleven healthy subjects (n=11, age 20-29) participated in this study. The experiment incorporated 7 scenarios, (2-3 runs)

* Scenario 1: resting while sitting consists of 1 trial (15 s)
* Scenario 2: resting while standing consists of 1 trial (15 s)
* Scenario 3: sit to stand and stand to sit consist of 10 trials, odd are sit to stand tasks and even are stand to sit tasks
* Scenario 4: trying to stand consists of 5 trials
* Scenario 5: trying to stand consists of 5 trials
* Scenario 6: imagining to stand consists of 5 trials
* Scenario 7: imagining to sit consists of 5 trials

The timeline of each trial was shown in Fig. 1

* You can download raw data at [HDFS WebUI](http://10.204.161.9:50070/VISRA/WP1/BCI/raw_data)

<div style="text-align:center"><img src="figures/timing.png" width="600"/></div>

<p align="center"> 
<b>Fig. 1</b> Timeline of the protocol. The subject was instructed to perform the imaginarytask after beep sound within 4 s 
</p>

#### Note! This is the protocol for subject 4-11. In subject 1-3 are similar but each phase in Fig.1 are shorter than that. And subject 1 and 2 were not recorded the EOG signals.

Electroencephalography (EEG) Signals Collection
=====================
EEG signals were collected from gtec g.USBamp-RESEARCH with a sampling rate of 1200 Hz on 11 following positions: FCz, C3, Cz, C4, CP3, CPz, CP4, Pc, Pz, P4 and POz as shown in Fig 2. The 2 Electrooculogram (EOG) electrodes were recorded to remove eye movement artifacts [ica_EOG_remover.py]( ICA_EOG_remover/ica_EOG_remover.py) as shown in Fig 3.
### EEG file descriptions
* The The EEG and EOG were recorded to .csv file in block format.
There are 14 rows and 32 columns in each block. 
    * Column indicates data points.
    * The first row is the header of each block, consists of: 
        1) timestamp
        2) Phase number
        3) scenario number
        4) subject number
        5) gender
        6) age
        7) type number
        8) count number (trial number)
    * Row number 2-12 are EEG electrode positions: FCz, C3, Cz, C4, CP3, CPz, CP4, Pc, Pz, P4 and POz respectively.
    * Row 13-14 are EOG electrode positions: right VEOG and right HEOG respectively.


* The Example to extract EEG raw data from .csv file to time-domain raw data is in [extract_raw_EEG.ipynb](extract_raw_EEG.ipynb), channel 1-11 are EEG signals and 12-13 are EOG signals

<div style="text-align:center"><img src="figures/EEG.png" width="400"/></div>
<p align="center"> 
<b>Fig. 2</b> The position of 11 electrodes on the scalp 
</p>
<div style="text-align:center"><img src="figures/EOG.png" width="350"/></div>
<p align="center"> 
<b>Fig. 3</b> The position of EOG electrods
</p>

Electromyography (EMG) Signals Collection
=========================================
EMG signals were recorded using OpenBCI with a sampling rate of 250 Hz on the 8 lower limb muscles: Rectus Abdominis, 2 Recti Femoris, 2 Tibiales Anticus, Erector Spinae, and 2 Gastrocnemius Lateralis, whereas left and right Lateral Malleolus were used as reference and ground respectively as Fig. 4.

<div style="text-align:center"><img src="figures/EMG.png" width="450"/></div>
<p align="center"> 
<b>Fig. 4</b> The position of EMG electrods
</p>


### EMG file descriptions
* The EMG signals were recorded to .csv in time-domain format.
    * At the first row of each phase from Fig. 1, The header row was recorded, each column indicates:
        1) timestamp
        2) Phase number
        3) scenario number
        4) subject number
        5) gender
        6) age
        7) type number
        8) count number (trial number)
    * Other rows are time-domain EMG data, each column indicates:
        1) Column 1: Number of data points of 1 second (250 Hz)
        2) Column 2-9: EMG signals, the positions were shown as Fig.4 
        3) Column 10-12: 3 axis acceleration
        4) Column 13-14: timestamp of each datapoint
    * The Example to extract EMG raw data from .csv file to time-domain raw data is in [extract_raw_EMG.ipynb](extract_raw_EMG.ipynb)

#### Important: 
The code works with [Python 3.6](https://www.python.org/downloads/) and [MNE 0.18.1](https://mne.tools/stable/getting_started.html)