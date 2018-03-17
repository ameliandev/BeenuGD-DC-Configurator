
Process RunAnalogExample()
Begin
	
    Repeat
	
        //UP-DOWN-LEFT-RIGHT for Analogic Pad
        If(joy_getaxis(PAD_PORT_A, 1) JA_UP)
            If(!keyDeny)
                keyDeny = true;
                infoText = "Analogic pad UP presed";
            End
		Elseif(joy_getaxis(PAD_PORT_A, 1) JA_DOWN)
			If(!keyDeny)
                keyDeny = true;
                infoText = "Analogic pad DOWN presed";
            End
		Elseif(joy_getaxis(PAD_PORT_A, 0) JA_LEFT)
			If(!keyDeny)
                keyDeny = true;
                infoText = "Analogic pad LEFT presed";
            End
		Elseif(joy_getaxis(PAD_PORT_A, 0) JA_RIGHT)
			If(!keyDeny)
                keyDeny = true;
                infoText = "Analogic pad RIGHT presed";
            End
        Else
			keyDeny = false;
		End

        frame;
		
    Until(key(dcGamePad.PAD_START))
    
End

Process RunDigitalExample()
Begin
	
	frame;
	
    Repeat
		
        //UP-DOWN-LEFT-RIGHT for Analogic Pad
        If(key(dcGamePad.PAD_UP))
            If(!keyDeny)
                keyDeny = true;
                infoText = "Digital pad UP presed";
            End
		Elseif(key(dcGamePad.PAD_DOWN))
			If(!keyDeny)
                keyDeny = true;
                infoText = "Digital pad DOWN presed";
            End
		Elseif(key(dcGamePad.PAD_LEFT))
			If(!keyDeny)
                keyDeny = true;
                infoText = "Digital pad LEFT presed";
            End
		Elseif(key(dcGamePad.PAD_RIGHT))
			If(!keyDeny)
                keyDeny = true;
                infoText = "Digital pad RIGHT presed";
            End
        Else
			keyDeny = false;
		End

        frame;
    Until(key(dcGamePad.PAD_START))
    
End

Process RunButtonExample()
Begin
	
	frame;
	
    Repeat
		
        //UP-DOWN-LEFT-RIGHT for Analogic Pad
        If(key(dcGamePad.PAD_A))
            If(!keyDeny)
                keyDeny = true;
                infoText = "A button pressed";
            End
		Elseif(key(dcGamePad.PAD_B))
			If(!keyDeny)
                keyDeny = true;
                infoText =  "B button pressed";
            End
		Elseif(key(dcGamePad.PAD_X))
			If(!keyDeny)
                keyDeny = true;
                infoText = "X button pressed";
            End
		Elseif(key(dcGamePad.PAD_Y))
			If(!keyDeny)
                keyDeny = true;
                infoText = "Y button pressed";
            End
		Elseif(key(dcGamePad.PAD_L))
			If(!keyDeny)
                keyDeny = true;
                infoText = "Left trigger button pressed";
            End
		Elseif(key(dcGamePad.PAD_R))
			If(!keyDeny)
                keyDeny = true;
                infoText = "Right trigger button pressed";
            End
		Elseif(key(dcGamePad.PAD_START))
			If(!keyDeny)
                keyDeny = true;
                infoText = "START button pressed";
            End
        Else
			keyDeny = false;
		End

        frame;
    Until(key(dcGamePad.PAD_START))
    
End

Process RunCombinedExample()
Begin
	If( (joy_getaxis(PAD_PORT_A, 1) JA_UP) || Key(dcGamePad.PAD_UP) )
		infoText = "UP for Digital or Analog pad";
	End
End