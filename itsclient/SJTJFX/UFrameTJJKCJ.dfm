inherited FrameTJJCCJ: TFrameTJJCCJ
  Width = 717
  Height = 423
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 717
    Height = 423
    inherited cxGrid1: TcxGrid
      Left = 0
      Top = 45
      Width = 959
      Height = 295
      TabOrder = 10
      ExplicitLeft = 0
      ExplicitTop = 45
      ExplicitWidth = 959
      ExplicitHeight = 295
    end
    object rbYear: TcxRadioButton [1]
      Left = 0
      Top = 13
      Width = 50
      Height = 17
      Caption = #24180
      TabOrder = 0
      OnClick = rbYearClick
      Transparent = True
    end
    object RBmonth: TcxRadioButton [2]
      Left = 57
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
      Left = 114
      Top = 13
      Width = 50
      Height = 17
      Caption = #26085
      TabOrder = 2
      OnClick = rbYearClick
      Transparent = True
    end
    inherited cbbPagesize: TcxComboBox
      Left = 0
      Top = 347
      TabOrder = 11
      ExplicitLeft = 0
      ExplicitTop = 347
    end
    inherited btnFirstPage: TcxButton
      Left = 77
      Top = 347
      TabOrder = 12
      ExplicitLeft = 77
      ExplicitTop = 347
    end
    inherited btnPriorPage: TcxButton
      Left = 114
      Top = 347
      TabOrder = 13
      ExplicitLeft = 114
      ExplicitTop = 347
    end
    inherited edtPageIndex: TcxTextEdit
      Left = 169
      Top = 347
      TabOrder = 14
      ExplicitLeft = 169
      ExplicitTop = 347
    end
    inherited btnnextPage: TcxButton
      Left = 246
      Top = 347
      TabOrder = 15
      ExplicitLeft = 246
      ExplicitTop = 347
    end
    inherited btnLastPage: TcxButton
      Left = 283
      Top = 347
      TabOrder = 16
      ExplicitLeft = 283
      ExplicitTop = 347
    end
    object CbbYear: TcxComboBox [10]
      Left = 171
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 78
    end
    object CbbMonth: TcxComboBox [11]
      Left = 256
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 89
    end
    object DTKSSJ: TcxDateEdit [12]
      Left = 406
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 107
    end
    object DTJSSJ: TcxDateEdit [13]
      Left = 538
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 103
    end
    object cmbDeptType: TcxComboBox [14]
      Left = 702
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #22823#38431
        #20013#38431)
      Style.HotTrack = False
      TabOrder = 7
      Text = #22823#38431
      Height = 21
      Width = 93
    end
    object BtnSearch: TcxButton [15]
      Left = 802
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 8
      OnClick = BtnSearchClick
    end
    object BtnExport: TcxButton [16]
      Left = 884
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 9
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
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21333#20301#32423#21035
      Control = cmbDeptType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 9
    end
  end
end
