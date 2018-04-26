inherited FrameGCPD: TFrameGCPD
  Width = 881
  Height = 303
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 881
    Height = 303
    inherited cxGrid1: TcxGrid
      Left = -138
      Top = 45
      Width = 1051
      Height = 200
      TabOrder = 8
      ExplicitLeft = -138
      ExplicitTop = 45
      ExplicitWidth = 1051
      ExplicitHeight = 200
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
      end
    end
    object DTKSSJ: TcxDateEdit [1]
      Left = -108
      Top = 13
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 158
    end
    object DTJSSJ: TcxDateEdit [2]
      Left = 75
      Top = 13
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 159
    end
    object cxButton1: TcxButton [3]
      Left = 838
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = cxButton1Click
    end
    inherited cbbPagesize: TcxComboBox
      Left = -138
      Top = 252
      TabOrder = 9
      ExplicitLeft = -138
      ExplicitTop = 252
    end
    inherited btnFirstPage: TcxButton
      Left = -61
      Top = 252
      TabOrder = 10
      ExplicitLeft = -61
      ExplicitTop = 252
    end
    inherited btnPriorPage: TcxButton
      Left = -24
      Top = 252
      TabOrder = 11
      ExplicitLeft = -24
      ExplicitTop = 252
    end
    inherited edtPageIndex: TcxTextEdit
      Left = 31
      Top = 252
      TabOrder = 12
      ExplicitLeft = 31
      ExplicitTop = 252
    end
    inherited btnnextPage: TcxButton
      Left = 108
      Top = 252
      TabOrder = 13
      ExplicitLeft = 108
      ExplicitTop = 252
    end
    inherited btnLastPage: TcxButton
      Left = 145
      Top = 252
      TabOrder = 14
      ExplicitLeft = 145
      ExplicitTop = 252
    end
    object edtNumMax: TcxTextEdit [10]
      Left = 553
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Text = '3'
      Height = 21
      Width = 40
    end
    object cboHPZL: TcxComboBox [11]
      Left = 295
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 121
    end
    object edtKDBH: TcxTextEdit [12]
      Left = 630
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      OnKeyPress = edtKDBHKeyPress
      Height = 21
      Width = 171
    end
    object btnKK: TcxButton [13]
      Left = 808
      Top = 13
      Width = 23
      Height = 21
      Caption = '...'
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 6
      OnClick = btnKKClick
    end
    object edtNumMin: TcxTextEdit [14]
      Left = 423
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Text = '1'
      Height = 21
      Width = 39
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26102#38388
      Control = DTKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 158
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = DTJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 159
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = '<'#38388#38548#20998#38047#25968'<'
      Control = edtNumMax
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 40
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cboHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21345#21475
      Control = edtKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 171
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnKK
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 23
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edtNumMin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 39
      ControlOptions.ShowBorder = False
      Index = 3
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
        end>
      Properties.ViewStyle = vsButtonsOnly
    end
  end
  object ActionList1: TActionList
    Left = 224
    Top = 112
    object ActionDetail: TAction
      Caption = #35814#32454#20449#24687
    end
  end
end
