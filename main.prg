//Autor: 	Adrian Melian (KeiDash)
//Web:      www.amelian.eu
//Date:  	13/03/2018
//Description: 	File to manage the Dreamcast pad configuration

import "mod_key"
import "mod_joy"
import "mod_say"
import "mod_proc"
import "mod_screen"
import "mod_video"
import "mod_string"
import "mod_text"

GLOBAL
	STRUCT dcGamePad
		int PAD_A = -1;
		int PAD_B = -1;
		int PAD_X = -1;
		int PAD_Y = -1;

		int PAD_L = -1;
		int PAD_R = -1;
		
		int PAD_LEFT = -1;
		int PAD_RIGHT = -1;
		int PAD_DOWN = -1;	
		int PAD_UP = -1;

		int PAD_SELECT = -1;
		int PAD_START = -1;
	END

    int PAD_PORT_A = 0;
    int PAD_PORT_B = 1;
    int PAD_PORT_C = 2;
    int PAD_PORT_D = 3;
	
	string infoText = "";
END

LOCAL
    byte keyDeny = false; //Used to block the continious key or button presed
END

#DEFINE JA_UP < -115
#DEFINE JA_DOWN > 115
#DEFINE JA_LEFT < -115
#DEFINE JA_RIGHT > 115

include "system.prg"
include "example.prg"

Process Main()
Private
    int configured = 0;
Begin
	
	//First of all:
	//NOTE 1: If you wish another port, simple change 'PAD_PORT_#' var to B, C or D
	//NOTE 2: 'keyDeny var', it's used to prevent continuous button pressing, 
	//	this mean that 'if you press the button or axis and you keep it pressed, only work one time (a non continuous shooting).
	//	If you want a continious shooting, disable this var.
	//NOTE 3: 'Process'. You can alternate between 4 example Process. Each one give you a different way to try the gamepad possibilities
	//	but you can combine them in your own Process or Functions (See on example.prg the Process named RunCombinedExample();
	
	write(0, 640/2, 30, ALIGN_CENTER, "*[DREAMCAST GAMEPAD AND SCREEN CONFIGURATOR]*");
	write(0, 10, 50, ALIGN_TOP_LEFT, "AUTHOR: AMELIAN (KEIDASH)");
	write(0, 10, 70, ALIGN_TOP_LEFT, "DATE: MARCH 3, 2018");
	write(0, 10, 90, ALIGN_TOP_LEFT, "MORE INFO: WWW.AMELIAN.EU");
	write(0, 10, 480 - 10, ALIGN_TOP_LEFT, "IF PRESS 'START' THE PROGRAM ENDS");
	
	SetSystemConfig();
	
    configured = ConfigurePads();
	
	WriteInformationOnScreen();
	
	infoText = "Ready - Press any button";
	
    if(configured == 0)
        infoText = "Some error has ocurred ";
        exit();
    end

    RunAnalogExample();
	RunDigitalExample();
	RunButtonExample();
	
    Loop
        frame;
    End

End

Process WriteInformationOnScreen()
Private
	string current = "";
Begin
	Loop
		If(current != infoText)
			current = infoText;
			write_var(0, 640/2, 480/2, ALIGN_CENTER, current);
		End
		
		frame;
	End
End

Function int ConfigurePads()
Begin
    
    If(joy_numjoysticks() <= 0) return 0; End //Check first if any pad exists.
    If(os_id != 5) return 0; End              //Only for Dreamcast!

    //Axis:
    dcGamePad.PAD_UP = _UP;
    dcGamePad.PAD_DOWN = _DOWN;
    dcGamePad.PAD_LEFT = _LEFT;
    dcGamePad.PAD_RIGHT = _RIGHT;

    //Butons:
    dcGamePad.PAD_A = _s;
    dcGamePad.PAD_B = _d;
    dcGamePad.PAD_X = _w;
    dcGamePad.PAD_Y = _a;

    dcGamePad.PAD_START = _ENTER;
    
    dcGamePad.PAD_L = _SPACE;
    dcGamePad.PAD_R = _ESC;

	return 1;
End
