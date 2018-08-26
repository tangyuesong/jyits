inherited FrameYJLKPH: TFrameYJLKPH
  Height = 436
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 436
    inherited cxGrid1: TcxGrid
      Left = -550
      Top = 45
      Width = 988
      Height = 333
      TabOrder = 6
      ExplicitLeft = -550
      ExplicitTop = 45
      ExplicitWidth = 988
      ExplicitHeight = 333
      inherited GridView: TcxGridDBTableView
        OnDblClick = GridViewDblClick
      end
    end
    object DTKSSJ: TcxDateEdit [1]
      Left = -496
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object DTJSSJ: TcxDateEdit [2]
      Left = -368
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 103
    end
    object cxButton1: TcxButton [3]
      Left = 281
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = cxButton1Click
    end
    object cbbYJLX: TcxCheckComboBox [4]
      Left = 88
      Top = 13
      AutoSize = False
      Properties.Items = <>
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 186
    end
    inherited cbbPagesize: TcxComboBox
      Left = -550
      Top = 385
      TabOrder = 7
      ExplicitLeft = -550
      ExplicitTop = 385
    end
    inherited btnFirstPage: TcxButton
      Left = -473
      Top = 385
      TabOrder = 8
      ExplicitLeft = -473
      ExplicitTop = 385
    end
    inherited btnPriorPage: TcxButton
      Left = -436
      Top = 385
      TabOrder = 9
      ExplicitLeft = -436
      ExplicitTop = 385
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -381
      Top = 385
      TabOrder = 10
      ExplicitLeft = -381
      ExplicitTop = 385
    end
    inherited btnnextPage: TcxButton
      Left = -304
      Top = 385
      TabOrder = 11
      ExplicitLeft = -304
      ExplicitTop = 385
    end
    inherited btnLastPage: TcxButton
      Left = -267
      Top = 385
      TabOrder = 12
      ExplicitLeft = -267
      ExplicitTop = 385
    end
    object BtnExport: TcxButton [11]
      Left = 363
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = BtnExportClick
    end
    object cbbwfdd: TcxComboBox [12]
      Left = -204
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      OnMouseUp = cboKDBHMouseUp
      Height = 21
      Width = 231
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #39044#35686#26102#38388
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
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #39044#35686#31867#22411
      Visible = False
      Control = cbbYJLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 186
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #39044#35686#36335#21475
      Control = cbbwfdd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 231
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
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
