ScriptName APPS_RSFW_Test3_MCM Extends SKI_ConfigBase
Import StorageUtil
APPS_FW_Relationship Property RSFW Auto
Actor Property SigridREF Auto
Quest Property Token Auto
Faction Property RelationshipRankFaction Auto

Event OnInit()
	If(!Self.IsRunning())
		Return
	Else
		Parent.OnInit()
	EndIf
EndEvent

Event OnPageReset(String asPage)
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	;convert SyncMode from Int to String
	String SyncMode

	If (RSFW.GetSyncMode(SigridREF, abNotifyIfGetGlobal = False) == 0)
		SyncMode = "$DISABLE"
	ElseIf (RSFW.GetSyncMode(SigridREF, abNotifyIfGetGlobal = False) == 1)
		SyncMode = "$VANILLA_TO_RS"
	ElseIf (RSFW.GetSyncMode(SigridREF, abNotifyIfGetGlobal = False) == 2)
		SyncMode = "$RS_TO_VANILLA"
	ElseIf (RSFW.GetSyncMode(SigridREF, abNotifyIfGetGlobal = False) == 3)
		SyncMode = "$BOTH_WAYS"
	EndIf

	AddHeaderOption(SigridREF.GetActorBase().GetName())
	AddEmptyOption()
	AddTextOption("SyncMode", SyncMode)
	AddTextOption("SyncMode Changes", RSFW.GetSyncModeChanges(SigridREF))
	AddTextOption("SyncMode Position", RSFW.GetSyncModePriority(Token, SigridREF))
	AddEmptyOption()
	AddTextOption("Current rank", SigridREF.GetFactionRank(RelationshipRankFaction) / 10)
	AddTextOption("RS Points", RSFW.GetRelationshipPoints(SigridREF))
	AddTextOption("To next rank", RSFW.GetRPForNextRank(SigridREF))
	AddTextOption("To previous rank", RSFW.GetRPForPreviousRank(SigridREF))
	
	SetCursorPosition(1)
	AddHeaderOption("RS Multipliers")
	AddEmptyOption()
	AddTextOption("$S0_S1", RSFW.GetRelationshipMulti(SigridREF, 0, 1, abNotifyIfGetGlobal = False))
	AddTextOption("$S1_S2", RSFW.GetRelationshipMulti(SigridREF, 1, 2, abNotifyIfGetGlobal = False))
	AddTextOption("$S2_S3", RSFW.GetRelationshipMulti(SigridREF, 2, 3, abNotifyIfGetGlobal = False))
	AddTextOption("$S3_S4", RSFW.GetRelationshipMulti(SigridREF, 3, 4, abNotifyIfGetGlobal = False))
	AddTextOption("$S4_S5", RSFW.GetRelationshipMulti(SigridREF, 4, 5, abNotifyIfGetGlobal = False))
	AddTextOption("$S5_S4", RSFW.GetRelationshipMulti(SigridREF, 5, 4, abNotifyIfGetGlobal = False))
	AddTextOption("$S4_S3", RSFW.GetRelationshipMulti(SigridREF, 4, 3, abNotifyIfGetGlobal = False))
	AddTextOption("$S3_S2", RSFW.GetRelationshipMulti(SigridREF, 3, 2, abNotifyIfGetGlobal = False))
	AddTextOption("$S2_S1", RSFW.GetRelationshipMulti(SigridREF, 2, 1, abNotifyIfGetGlobal = False))
	AddTextOption("$S1_S0", RSFW.GetRelationshipMulti(SigridREF, 1, 0, abNotifyIfGetGlobal = False))
	AddTextOption("$S0_S-1", RSFW.GetRelationshipMulti(SigridREF, 0, -1, abNotifyIfGetGlobal = False))
	AddTextOption("$S-1_S-2", RSFW.GetRelationshipMulti(SigridREF, -1, -2, abNotifyIfGetGlobal = False))
	AddTextOption("$S-2_S-3", RSFW.GetRelationshipMulti(SigridREF, -2, -3, abNotifyIfGetGlobal = False))
	AddTextOption("$S-3_S-4", RSFW.GetRelationshipMulti(SigridREF, -3, -4, abNotifyIfGetGlobal = False))
	AddTextOption("$S-4_S-5", RSFW.GetRelationshipMulti(SigridREF, -4, -5, abNotifyIfGetGlobal = False))
	AddTextOption("$S-5_S-4", RSFW.GetRelationshipMulti(SigridREF, -5, -4, abNotifyIfGetGlobal = False))
	AddTextOption("$S-4_S-3", RSFW.GetRelationshipMulti(SigridREF, -4, -3, abNotifyIfGetGlobal = False))
	AddTextOption("$S-3_S-2", RSFW.GetRelationshipMulti(SigridREF, -3, -2, abNotifyIfGetGlobal = False))
	AddTextOption("$S-2_S-1", RSFW.GetRelationshipMulti(SigridREF, -2, -1, abNotifyIfGetGlobal = False))
	AddTextOption("$S-1_S0", RSFW.GetRelationshipMulti(SigridREF, -1, 0, abNotifyIfGetGlobal = False))
EndEvent
