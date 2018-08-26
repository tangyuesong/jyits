inherited ToolGridFrame: TToolGridFrame
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 27
    Height = 278
    ExplicitTop = 27
    ExplicitHeight = 278
    inherited cxGrid1: TcxGrid
      Height = 184
      ExplicitHeight = 184
    end
    inherited cbbPagesize: TcxComboBox
      Top = 216
      ExplicitTop = 216
    end
    inherited btnFirstPage: TcxButton
      Top = 216
      ExplicitTop = 216
    end
    inherited btnPriorPage: TcxButton
      Top = 216
      ExplicitTop = 216
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 216
      ExplicitTop = 216
    end
    inherited btnnextPage: TcxButton
      Top = 216
      ExplicitTop = 216
    end
    inherited btnLastPage: TcxButton
      Top = 216
      ExplicitTop = 216
    end
    object lbCount: TcxLabel [7]
      Left = 13
      Top = 244
      Caption = 'lbCount'
      Style.HotTrack = False
      Transparent = True
    end
    object dxLGCount: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLICount: TdxLayoutItem
      Parent = dxLGCount
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = lbCount
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 49
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Microsoft YaHei UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = DM.ilBarSmall
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2010Blue'
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 256
    Top = 112
    DockControlHeights = (
      0
      0
      27
      0)
    object dxBarManager1Bar1: TdxBar
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = #24037#20855#26639
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 461
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
  end
end
