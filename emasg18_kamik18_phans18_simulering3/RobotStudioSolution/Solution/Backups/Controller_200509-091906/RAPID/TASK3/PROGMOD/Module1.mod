MODULE Module1
	CONST robtarget AboveCrate:=[[1445,2460,1400],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AtCrate:=[[1445,2460,1100],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget AbovePallet:=[[1000,3500,1500],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_1:=[[2540,3330,510],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_2:=[[2260,3580,510],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_3:=[[2000,3840,510],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_4:=[[2320,3050,510],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_5:=[[2040,3280,510],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet1_6:=[[1760,3530,510],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_1:=[[2540,3330,755],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_2:=[[2260,3580,755],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_3:=[[2000,3840,755],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_4:=[[2320,3050,755],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_5:=[[2040,3280,755],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet2_6:=[[1760,3530,755],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_1:=[[2540,3330,1000],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_2:=[[2260,3580,1000],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_3:=[[2000,3840,1000],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_4:=[[2320,3050,1000],[0,-0.48480962,0.874619707,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_5:=[[2040,3280,1000],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget Pallet3_6:=[[1760,3530,1000],[0,0.275637356,0.961261696,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget AbovePalletRotated:=[[1000,3500,1500],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
	    SetDO DoPalletComplete,0;
	    MoveJ AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    WaitDI Di2CrateReadyForPacking,1;
	    MoveL AtCrate,v2000,fine,Tool_3\WObj:=wobj0;
	    SetDO Do3Gripper,1;
	    WaitTime 0.3;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ Pallet1_1,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet1_2,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ AbovePalletRotated,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ Pallet1_3,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ AbovePalletRotated,v2000,z100,Tool_3\WObj:=wobj0;
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
	    MoveJ AbovePalletRotated,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ Pallet2_3,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ AbovePalletRotated,v2000,z100,Tool_3\WObj:=wobj0;
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
	    MoveJ AbovePalletRotated,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ Pallet3_3,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ AbovePalletRotated,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ Pallet3_4,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_5,v2000,fine,Tool_3\WObj:=wobj0;
	    SubPath;
	    MoveJ Pallet3_6,v2000,fine,Tool_3\WObj:=wobj0;
	    SetDO Do3Gripper,0;
	    WaitTime 0.3;
	    MoveL AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveJ AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
		SetDO DoPalletComplete,1;
        WaitTime 0.5;
	ENDPROC
	PROC SubPath()
	    SetDO Do3Gripper,0;
	    WaitTime 0.3;
	    MoveJ AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    WaitDI Di2CrateReadyForPacking,1;
	    MoveL AtCrate,v2000,fine,Tool_3\WObj:=wobj0;
	    SetDO Do3Gripper,1;
	    WaitTime 0.3;
	    MoveL AboveCrate,v2000,z100,Tool_3\WObj:=wobj0;
	    MoveL AbovePallet,v2000,z100,Tool_3\WObj:=wobj0;
	ENDPROC
ENDMODULE