//Autor: 	Adrian Melian (KeiDash)
//Web:      www.amelian.eu
//Date:  	13/03/2018
//Description: 	File to set the Dreamcast screen configuration

Function SetSystemConfig()
Begin
	
    define_region(1, 0, 0, 620, 480);

    set_mode(640, 480, 16);
	
    set_fps(60, 1);
	
End