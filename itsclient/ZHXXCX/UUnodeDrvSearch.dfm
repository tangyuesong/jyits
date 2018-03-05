inherited UnodeDrvSearch: TUnodeDrvSearch
  Width = 750
  Height = 516
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 750
    Height = 516
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 724
      Height = 430
      TabOrder = 3
      ExplicitTop = 45
      ExplicitWidth = 724
      ExplicitHeight = 430
    end
    object cbbZT: TcxComboBox [1]
      Left = 43
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object btnSearch: TcxButton [2]
      Left = 171
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object btnExport: TcxButton [3]
      Left = 253
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 2
      OnClick = btnExportClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 482
      TabOrder = 4
      ExplicitTop = 482
    end
    inherited btnFirstPage: TcxButton
      Top = 482
      TabOrder = 5
      ExplicitTop = 482
    end
    inherited btnPriorPage: TcxButton
      Top = 482
      TabOrder = 6
      ExplicitTop = 482
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 482
      TabOrder = 7
      ExplicitTop = 482
    end
    inherited btnnextPage: TcxButton
      Top = 482
      TabOrder = 8
      ExplicitTop = 482
    end
    inherited btnLastPage: TcxButton
      Top = 482
      TabOrder = 9
      ExplicitTop = 482
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29366#24577
      Control = cbbZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
