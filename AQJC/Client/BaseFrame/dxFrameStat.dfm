inherited FrameStat: TFrameStat
  inherited dxLayoutControl2: TdxLayoutControl
    object RDYear: TcxRadioButton [0]
      Left = 13
      Top = 13
      Width = 38
      Height = 17
      Caption = #24180
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      OnClick = RDYearClick
      ParentBackground = False
      Transparent = True
    end
    object RDMonth: TcxRadioButton [1]
      Left = 58
      Top = 13
      Width = 38
      Height = 17
      Caption = #26376
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      OnClick = RDYearClick
      ParentBackground = False
      Transparent = True
    end
    object RDDate: TcxRadioButton [2]
      Left = 103
      Top = 13
      Width = 38
      Height = 17
      Caption = #26085
      Color = clBtnFace
      ParentColor = False
      TabOrder = 2
      OnClick = RDYearClick
      ParentBackground = False
      Transparent = True
    end
    object DTKSSJ: TcxDateEdit [3]
      Left = 383
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 107
    end
    object DTJSSJ: TcxDateEdit [4]
      Left = 515
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 103
    end
    object BtnSearch: TcxButton [5]
      Left = 625
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = BtnSearchClick
    end
    object BtnExport: TcxButton [6]
      Left = 707
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 8
      OnClick = BtnExportClick
    end
    object CbbYear: TcxComboBox [7]
      Left = 148
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 78
    end
    object CbbMonth: TcxComboBox [8]
      Left = 233
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 89
    end
    object cxGrid2: TcxGrid [9]
      Left = 13
      Top = 170
      Width = 769
      Height = 77
      TabOrder = 10
      object ChartView: TcxGridDBChartView
        DiagramColumn.Active = True
      end
      object cxGridLevel1: TcxGridLevel
        GridView = ChartView
      end
    end
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 769
      Height = 118
      TabOrder = 9
      ExplicitTop = 45
      ExplicitWidth = 769
      ExplicitHeight = 118
    end
    inherited cbbPagesize: TcxComboBox
      Top = 254
      TabOrder = 11
      ExplicitTop = 254
    end
    inherited btnFirstPage: TcxButton
      Top = 254
      TabOrder = 12
      ExplicitTop = 254
    end
    inherited btnPriorPage: TcxButton
      Top = 254
      TabOrder = 13
      ExplicitTop = 254
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 254
      TabOrder = 14
      ExplicitTop = 254
    end
    inherited btnnextPage: TcxButton
      Top = 254
      TabOrder = 15
      ExplicitTop = 254
    end
    inherited btnLastPage: TcxButton
      Top = 254
      TabOrder = 16
      ExplicitTop = 254
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      Index = 0
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton1'
      CaptionOptions.Visible = False
      Control = RDYear
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 38
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton2'
      CaptionOptions.Visible = False
      Control = RDMonth
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 38
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton3'
      CaptionOptions.Visible = False
      Control = RDDate
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 38
      ControlOptions.ShowBorder = False
      Index = 2
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
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 8
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
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid2
      ControlOptions.OriginalHeight = 164
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
