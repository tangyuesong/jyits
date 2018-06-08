object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 326
  Width = 348
  object FDManager1: TFDManager
    ConnectionDefFileAutoLoad = False
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 88
    Top = 16
  end
  object FDConnection1: TFDConnection
    Left = 168
    Top = 16
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 88
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 88
    Top = 160
  end
end
