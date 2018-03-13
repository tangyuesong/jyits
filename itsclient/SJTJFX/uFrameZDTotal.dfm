inherited FrameZDTotal: TFrameZDTotal
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Height = 219
      TabOrder = 2
      ExplicitTop = 45
      ExplicitHeight = 219
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 3
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 4
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 5
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 6
    end
    inherited btnnextPage: TcxButton
      TabOrder = 7
    end
    inherited btnLastPage: TcxButton
      TabOrder = 8
    end
    object BtnExport: TcxButton [7]
      Left = 95
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 1
      OnClick = BtnExportClick
    end
    object btnBack: TcxButton [8]
      Left = 13
      Top = 13
      Width = 75
      Height = 25
      Caption = #36820#22238
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 0
      OnClick = btnBackClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnBack
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
