inherited FrameSearchLJ: TFrameSearchLJ
  Visible = False
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 667
      Height = 202
      TabOrder = 5
      ExplicitTop = 45
      ExplicitWidth = 667
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
    object cbbZT: TcxComboBox [3]
      Left = 395
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 121
    end
    object BtnSearch: TcxButton [4]
      Left = 523
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 3
      OnClick = BtnSearchClick
    end
    object BtnExport: TcxButton [5]
      Left = 605
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = BtnExportClick
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 6
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 7
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 8
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 9
    end
    inherited btnnextPage: TcxButton
      TabOrder = 10
    end
    inherited btnLastPage: TcxButton
      TabOrder = 11
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
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
      CaptionOptions.Text = #26597#35810#31867#21035
      Control = cbbZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
end
