MODULE Module1
	CONST robtarget AboveCrate:=[[765,2460,1400],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtCrate:=[[765,2460,1100],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AbovePallet:=[[1450,3350,1500],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_1:=[[1840,3330,400],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_2:=[[1580,3570,400],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_3:=[[1320,3770,400],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_4:=[[1640,3050,400],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_5:=[[1370,3260,400],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_6:=[[1100,3500,400],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_1:=[[1840,3330,645],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_2:=[[1580,3570,645],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_3:=[[1320,3770,645],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_4:=[[1640,3050,645],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_5:=[[1370,3260,645],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_6:=[[1100,3500,645],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_1:=[[1840,3330,890],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_2:=[[1580,3570,890],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_3:=[[1320,3770,890],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_4:=[[1640,3050,890],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_5:=[[1370,3260,890],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_6:=[[1100,3500,890],[0,0.961261696,-0.275637356,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
		PathRobot3;
        !Add your code here
    ENDPROC
	PROC PathRobot3()
	    MoveJ AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AtCrate,v2000,fine,Tool_3\WObj:=wobj0;
	    SetDO Do3Gripper,1;
	    WaitTime 0.3;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ Pallet1_1,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet1_2,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet1_3,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet1_4,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet1_5,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet1_6,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet2_1,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet2_2,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet2_3,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet2_4,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet2_5,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet2_6,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_1,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_2,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_3,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_4,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_5,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_6,v2000,fine,Tool_3\WObj:=wobj0;
	    SetDO Do3Gripper,0;
	    WaitTime 0.3;
	    MoveJ AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	ENDPROC
	PROC SubPath()
	    SetDO Do3Gripper,0;
	    WaitTime 0.3;
	    MoveJ AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AtCrate,v2000,fine,Tool_3\WObj:=wobj0;
	    SetDO Do3Gripper,1;
	    WaitTime 0.3;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	ENDPROC
ENDMODULE