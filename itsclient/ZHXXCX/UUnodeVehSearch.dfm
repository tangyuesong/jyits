inherited UnodeVehSearch: TUnodeVehSearch
  Width = 870
  Height = 540
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 870
    Height = 540
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 844
      Height = 454
      TabOrder = 4
      ExplicitTop = 45
      ExplicitWidth = 844
      ExplicitHeight = 454
    end
    object cbbZDCLLX: TcxComboBox [1]
      Left = 67
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object cbbZT: TcxComboBox [2]
      Left = 225
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object btnSearch: TcxButton [3]
      Left = 353
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 2
      OnClick = btnSearchClick
    end
    object BtnExport: TcxButton [4]
      Left = 435
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 3
      OnClick = BtnExportClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 506
      TabOrder = 5
      ExplicitTop = 506
    end
    inherited btnFirstPage: TcxButton
      Top = 506
      TabOrder = 6
      ExplicitTop = 506
    end
    inherited btnPriorPage: TcxButton
      Top = 506
      TabOrder = 7
      ExplicitTop = 506
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 506
      TabOrder = 8
      ExplicitTop = 506
    end
    inherited btnnextPage: TcxButton
      Top = 506
      TabOrder = 9
      ExplicitTop = 506
    end
    inherited btnLastPage: TcxButton
      Top = 506
      TabOrder = 10
      ExplicitTop = 506
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = cbbZDCLLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29366#24577
      Control = cbbZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
