inherited DcwfSearch: TDcwfSearch
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 821
      Height = 202
      TabOrder = 7
      ExplicitTop = 45
      ExplicitWidth = 821
      ExplicitHeight = 202
      inherited GridView: TcxGridDBTableView
        Navigator.Visible = True
      end
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 8
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 9
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 10
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 11
    end
    inherited btnnextPage: TcxButton
      TabOrder = 12
    end
    inherited btnLastPage: TcxButton
      TabOrder = 13
    end
    object cbbJC: TcxComboBox [7]
      Left = 67
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 64
    end
    object edthphm6: TcxTextEdit [8]
      Left = 138
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 88
    end
    object cbbhpzl: TcxComboBox [9]
      Left = 287
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 121
    end
    object btnSearch: TcxButton [10]
      Left = 677
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = btnSearchClick
    end
    object edtcs: TcxTextEdit [11]
      Left = 627
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Text = '30'
      OnKeyPress = edtcsKeyPress
      Height = 21
      Width = 43
    end
    object BtnExport: TcxButton [12]
      Left = 759
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 6
      OnClick = BtnExportClick
    end
    object cbbXzqh: TcxComboBox [13]
      Left = 469
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 121
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edthphm6
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 88
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cbbhpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #27425#25968
      Control = edtcs
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 43
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #31649#36758#21306#22495
      Control = cbbXzqh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actView
          ContentAlignment = taLeftJustify
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
        end>
    end
  end
  inherited actlst1: TActionList
    inherited actView: TAction
      OnExecute = actViewExecute
    end
  end
end
