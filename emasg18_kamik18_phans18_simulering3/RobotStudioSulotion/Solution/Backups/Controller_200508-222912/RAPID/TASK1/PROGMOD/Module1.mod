MODULE Module1
	CONST robtarget AtRobot1:=[[-150,0,1400],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeer:=[[-15,-130,1030],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate1_1:=[[-125,425,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate1_2:=[[-125,370,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate1_3:=[[-125,315,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate1_4:=[[-125,260,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate1_5:=[[-125,205,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate2_1:=[[-70,425,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate2_2:=[[-70,370,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate2_3:=[[-70,315,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate2_4:=[[-70,260,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate2_5:=[[-70,205,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate3_1:=[[-15,425,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate3_2:=[[-15,370,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate3_3:=[[-15,315,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate3_4:=[[-15,260,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtBeerCrate3_5:=[[-15,205,1300],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author: Bruger
    !
    ! Version: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedure main
    !
    !   This is the entry point of your program
    !
    !***********************************************************
    PROC main()
		PathRobot1;
        !Add your code here
    ENDPROC
	PROC PathRobot1()
	    SetDO DoCrateComplete,0;
	    WaitDI Di1CrateReadyForFilling,1;
	    MoveJ AtRobot1,v2000,z100,Tool1\WObj:=wobj0;
	    MoveL AtBeer,v2000,fine,Tool1\WObj:=wobj0;
	    SetDO Do1Gripper,1;
	    WaitTime 0.3;
	    MoveJ AtRobot1,v2000,z100,Tool1\WObj:=wobj0;
	    MoveL AtBeerCrate1_1,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate1_2,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate1_3,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate1_4,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate1_5,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate2_1,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate2_2,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate2_3,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate2_4,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate2_5,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate3_1,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate3_2,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate3_3,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate3_4,v2000,fine,Tool1\WObj:=wobj0;
	    SubPath;
	    MoveL AtBeerCrate3_5,v2000,fine,Tool1\WObj:=wobj0;
		SetDO Do1Gripper,0;
		WaitTime 0.3;
		MoveJ AtRobot1,v2000,z100,Tool1\WObj:=wobj0;
		SetDO DoCrateComplete,1;
		WaitTime 0.3;
	ENDPROC
	PROC SubPath()
	    SetDO Do1Gripper,0;
	    WaitTime 0.3;
	    MoveJ AtRobot1,v2000,z100,Tool1\WObj:=wobj0;
	    MoveL AtBeer,v2000,fine,Tool1\WObj:=wobj0;
	    SetDO Do1Gripper,1;
	    WaitTime 0.3;
	    MoveJ AtRobot1,v2000,z100,Tool1\WObj:=wobj0;
	ENDPROC
ENDMODULE