inherited SearchYJCLKJ: TSearchYJCLKJ
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 969
      Height = 202
      TabOrder = 8
      ExplicitTop = 45
      ExplicitWidth = 969
      ExplicitHeight = 202
    end
    object DTKSSJ: TcxDateEdit [1]
      Left = -477
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object DTJSSJ: TcxDateEdit [2]
      Left = -349
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 103
    end
    object cbbJC: TcxComboBox [3]
      Left = -185
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 71
    end
    object edthphm: TcxTextEdit [4]
      Left = -107
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 77
    end
    object cbbHPZL: TcxComboBox [5]
      Left = -23
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 113
    end
    object cxButton1: TcxButton [6]
      Left = 281
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 6
      OnClick = cxButton1Click
    end
    object cbbYJLX: TcxComboBox [7]
      Left = 151
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 123
    end
    inherited cbbPagesize: TcxComboBox
      Top = 254
      TabOrder = 9
      ExplicitTop = 254
    end
    inherited btnFirstPage: TcxButton
      Top = 254
      TabOrder = 10
      ExplicitTop = 254
    end
    inherited btnPriorPage: TcxButton
      Top = 254
      TabOrder = 11
      ExplicitTop = 254
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 254
      TabOrder = 12
      ExplicitTop = 254
    end
    inherited btnnextPage: TcxButton
      Top = 254
      TabOrder = 13
      ExplicitTop = 254
    end
    inherited btnLastPage: TcxButton
      Top = 254
      TabOrder = 14
      ExplicitTop = 254
    end
    object btnExport: TcxButton [14]
      Left = 363
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 7
      OnClick = btnExportClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = DTKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = DTJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 71
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 77
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 113
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #39044#35686#31867#22411
      Control = cbbYJLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 123
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = ActionDetail
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
            2FC72121218D1010104600000000000000000000000000000000000000000000
            0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
            0820262626A33C3C3CFF262626A21414145320202088323232D5323232D52020
            208814141453262626A23C3C3CFF262626A30808082000000000000000002121
            218C3C3C3CFF1515155B020202071E1E1E803C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E80020202071515155B3C3C3CFF2121218C00000000101010463939
            39F3242424980000000100000000323232D53C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF323232D5000000000000000124242498393939F310101046303030CC3C3C
            3CFF282828A90000000000000000323232D53C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF323232D50000000000000000282828A93C3C3CFF303030CC101010463939
            39F33C3C3CFF242424980A0A0A2A1E1E1E803C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E800A0A0A2A242424983C3C3CFF393939F310101046000000002121
            218C3C3C3CFF3C3C3CFF303030CB2121218C2525259F333333D8333333D82525
            259F2121218C303030CB3C3C3CFF3C3C3CFF2121218C00000000000000000808
            0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
            0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
            00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
            2FC72121218D1010104600000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
          LeftAlignment = True
          Stretchable = False
        end
        item
          Action = ActionSMS
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            00000000000000000000404040B7595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF404040B7000000000000000000000000000000000000
            00000000000000000000595959FF595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF00000000595959FF000000005959
            59FF00000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF00000000595959FF000000005959
            59FF00000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            000000000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            000000000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            000000000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            000000000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            000000000000595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF595959FF000000000000000000000000000000000000
            00000000000000000000595959FF595959FF595959FF595959FF595959FF5959
            59FF595959FF595959FF424242BD000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000595959FF595959FF0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
        end>
      Properties.ViewStyle = vsButtonsOnly
    end
  end
  inherited actlst1: TActionList
    Left = 240
    Top = 88
  end
  object ActionList1: TActionList
    Left = 168
    Top = 88
    object ActionDetail: TAction
      Caption = #35814#32454#20449#24687
      OnExecute = ActionDetailExecute
    end
    object ActionSMS: TAction
      Caption = #28155#21152#25163#26426
      OnExecute = ActionSMSExecute
    end
  end
end
