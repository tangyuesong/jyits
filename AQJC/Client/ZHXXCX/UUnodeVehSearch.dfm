inherited UnodeVehSearch: TUnodeVehSearch
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 825
      Height = 202
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 825
      ExplicitHeight = 202
    end
    object DtKssj: TcxDateEdit [1]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object DtJssj: TcxDateEdit [2]
      Left = 213
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object cbbZDCLLX: TcxComboBox [3]
      Left = 395
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 121
    end
    object cbbZT: TcxComboBox [4]
      Left = 553
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 121
    end
    object btnSearch: TcxButton [5]
      Left = 681
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object BtnExport: TcxButton [6]
      Left = 763
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = BtnExportClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 254
      TabOrder = 7
      ExplicitTop = 254
    end
    inherited btnFirstPage: TcxButton
      Top = 254
      TabOrder = 8
      ExplicitTop = 254
    end
    inherited btnPriorPage: TcxButton
      Top = 254
      TabOrder = 9
      ExplicitTop = 254
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 254
      TabOrder = 10
      ExplicitTop = 254
    end
    inherited btnnextPage: TcxButton
      Top = 254
      TabOrder = 11
      ExplicitTop = 254
    end
    inherited btnLastPage: TcxButton
      Top = 254
      TabOrder = 12
      ExplicitTop = 254
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = DtKssj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = DtJssj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = cbbZDCLLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29366#24577
      Control = cbbZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
end
