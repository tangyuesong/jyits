object FrameMainMap: TFrameMainMap
  Left = 0
  Top = 0
  Width = 623
  Height = 434
  TabOrder = 0
  object dxLayoutControl2: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 623
    Height = 434
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    ExplicitWidth = 451
    ExplicitHeight = 305
    object Chromium1: TChromium
      Left = 10
      Top = 10
      Width = 603
      Height = 414
      Color = clWhite
      TabOrder = 0
      Options.AcceleratedPaintingDisabled = False
      Options.AcceleratedFiltersDisabled = False
      Options.AcceleratedPluginsDisabled = False
    end
    object dxLayoutControl2Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      Control = Chromium1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 41
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object cboSBLX: TcxCheckComboBox
    Left = 72
    Top = 21
    Properties.Items = <
      item
        Description = #21345#21475
        ShortDescription = #21345#21475
      end
      item
        Description = #30005#35686
        ShortDescription = #30005#35686
      end
      item
        Description = #35270#39057
        ShortDescription = #35270#39057
      end
      item
        Description = #21149#23548#31449
        ShortDescription = #21149#23548#31449
      end>
    Properties.OnChange = cboSBLXPropertiesChange
    EditValue = 3
    TabOrder = 1
    Visible = False
    Width = 121
  end
  object cboDev: TcxComboBoxExt
    Left = 199
    Top = 22
    Properties.DropDownListStyle = lsEditList
    Properties.IncrementalFiltering = False
    Properties.KeyFieldNames = 'Name'
    Properties.Revertable = True
    Properties.OnCloseUp = cboDevPropertiesCloseUp
    EditValue = ''
    TabOrder = 2
    Visible = False
    Width = 210
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 320
    Top = 240
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 352
    Top = 240
  end
end
