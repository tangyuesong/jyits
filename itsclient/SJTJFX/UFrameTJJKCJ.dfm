inherited FrameTJJCCJ: TFrameTJJCCJ
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Left = -327
      Top = 45
      Width = 805
      Height = 177
      TabOrder = 9
      ExplicitLeft = -327
      ExplicitTop = 45
      ExplicitWidth = 805
      ExplicitHeight = 177
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
      end
    end
    object rbYear: TcxRadioButton [1]
      Left = -327
      Top = 13
      Width = 50
      Height = 17
      Caption = #24180
      TabOrder = 0
      OnClick = rbYearClick
      Transparent = True
    end
    object RBmonth: TcxRadioButton [2]
      Left = -270
      Top = 13
      Width = 50
      Height = 17
      Caption = #26376
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbYearClick
      Transparent = True
    end
    object RBDate: TcxRadioButton [3]
      Left = -213
      Top = 13
      Width = 50
      Height = 17
      Caption = #26085
      TabOrder = 2
      OnClick = rbYearClick
      Transparent = True
    end
    inherited cbbPagesize: TcxComboBox
      Left = -327
      Top = 229
      TabOrder = 10
      ExplicitLeft = -327
      ExplicitTop = 229
    end
    inherited btnFirstPage: TcxButton
      Left = -250
      Top = 229
      TabOrder = 11
      ExplicitLeft = -250
      ExplicitTop = 229
    end
    inherited btnPriorPage: TcxButton
      Left = -213
      Top = 229
      TabOrder = 12
      ExplicitLeft = -213
      ExplicitTop = 229
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -158
      Top = 229
      TabOrder = 13
      ExplicitLeft = -158
      ExplicitTop = 229
    end
    inherited btnnextPage: TcxButton
      Left = -81
      Top = 229
      TabOrder = 14
      ExplicitLeft = -81
      ExplicitTop = 229
    end
    inherited btnLastPage: TcxButton
      Left = -44
      Top = 229
      TabOrder = 15
      ExplicitLeft = -44
      ExplicitTop = 229
    end
    object CbbYear: TcxComboBox [10]
      Left = -156
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 78
    end
    object CbbMonth: TcxComboBox [11]
      Left = -71
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 89
    end
    object DTKSSJ: TcxDateEdit [12]
      Left = 79
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 107
    end
    object DTJSSJ: TcxDateEdit [13]
      Left = 211
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 103
    end
    object BtnSearch: TcxButton [14]
      Left = 321
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = BtnSearchClick
    end
    object BtnExport: TcxButton [15]
      Left = 403
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 8
      OnClick = BtnExportClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton1'
      CaptionOptions.Visible = False
      Control = rbYear
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton2'
      CaptionOptions.Visible = False
      Control = RBmonth
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton3'
      CaptionOptions.Visible = False
      Control = RBDate
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = #27880#65306#29616#22330#24320#20855#25991#20070' 6'#20998#65307#25509#21463#22788#29702' 3'#20998#65307#24050#22788#32602' 2'#20998#65307#25945#32946#21518#25918#34892' 1'#20998
      Index = 3
    end
    object dxYEAR: TdxLayoutItem
      Parent = dxLayoutGroup2
      Visible = False
      Control = CbbYear
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 78
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxMonth: TdxLayoutItem
      Parent = dxLayoutGroup2
      Visible = False
      Control = CbbMonth
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxDTKSSJ: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Visible = False
      Control = DTKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxDTJSSJ: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Visible = False
      Control = DTJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 8
    end
  end
end
