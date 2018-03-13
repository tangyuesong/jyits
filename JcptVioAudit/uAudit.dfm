object frmAudit: TfrmAudit
  Left = 0
  Top = 0
  Caption = #38598#25104#24179#21488#36829#27861#23457#26680
  ClientHeight = 462
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object spnl1: TsPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object btn5: TsSpeedButton
      Left = 75
      Top = 0
      Width = 75
      Height = 30
      Cursor = crHandPoint
      Align = alLeft
      Caption = #26381#21153#20572#27490
      Flat = True
      OnClick = btn5Click
      SkinData.SkinSection = 'TOOLBUTTON'
      ExplicitLeft = 649
      ExplicitHeight = 28
    end
    object btnReCheck: TsSpeedButton
      Tag = 3
      Left = 0
      Top = 0
      Width = 75
      Height = 30
      Cursor = crHandPoint
      Align = alLeft
      Caption = #25209#37327#22797#26680
      Flat = True
      OnClick = btnReCheckClick
      SkinData.SkinSection = 'TOOLBUTTON'
      ExplicitLeft = -6
      ExplicitTop = -2
    end
  end
  object sPageControl1: TsPageControl
    Left = 0
    Top = 30
    Width = 636
    Height = 432
    ActivePage = sTabSheet1
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    object sTabSheet1: TsTabSheet
      Caption = #30331#24405
      TabVisible = False
      object gbWebCaption: TsGroupBox
        Left = 0
        Top = 0
        Width = 628
        Height = 424
        Align = alClient
        Caption = #31995#32479#30331#24405':'
        TabOrder = 0
        object webtrff: TsWebBrowser
          Left = 2
          Top = 15
          Width = 624
          Height = 407
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 768
          ExplicitHeight = 379
          ControlData = {
            4C0000007E400000112A00000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E12620A000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
    object stbshtSH: TsTabSheet
      Caption = #22797#26680
      TabVisible = False
      object wbSJFH: TsWebBrowser
        Left = 0
        Top = 0
        Width = 628
        Height = 424
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 56
        ExplicitTop = -48
        ControlData = {
          4C000000E8400000D22B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620A000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object fdphysrcldrvrlnk1: TFDPhysOracleDriverLink
    Left = 71
    Top = 70
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 72
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 296
    Top = 75
  end
  object FOraQuery: TFDQuery
    Connection = FOraConn
    Left = 136
    Top = 136
  end
  object FOraConn: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=orcl'
      'Password=rm'
      'User_Name=rm')
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 64
    Top = 136
  end
end
