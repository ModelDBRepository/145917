//30posSec.g

str cellpath = "/cell"
setfield /data/soma overlay 1
reset

//start stim for 0 ms isi
	
	step 0.22 -time

	setfield {cellpath}/secdend1/spine_1/presyn_ext z {1/{getclock 0}}
	setfield {cellpath}/secdend1/spine_2/presyn_ext z {1/{getclock 0}}


	step 1

	setfield {cellpath}/secdend1/spine_1/presyn_ext z 0
	setfield {cellpath}/secdend1/spine_2/presyn_ext z 0

	step 0 -time
	setfield {cellpath}/soma inject 0.65e-9 
	step 0.03 -time
	setfield {cellpath}/soma inject 0
	step {0.47-0} -time
	reset
	
//for loop to run through rest	
	
float isi = 0.01
reset
int i
for (i=1; i<9; i=i+1)
	echo {isi}
	step 0.22 -time

	setfield {cellpath}/secdend1/spine_1/presyn_ext z {1/{getclock 0}}
	setfield {cellpath}/secdend1/spine_2/presyn_ext z {1/{getclock 0}}


	step 1

	setfield {cellpath}/secdend1/spine_1/presyn_ext z 0
	setfield {cellpath}/secdend1/spine_2/presyn_ext z 0


	step {isi} -time
	setfield {cellpath}/soma inject 0.65e-9 
	step 0.03 -time
	setfield {cellpath}/soma inject 0
	step {0.47-{isi}} -time
	isi = {isi}+0.01
	reset
end
