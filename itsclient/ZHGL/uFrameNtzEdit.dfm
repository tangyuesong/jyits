inherited FrameNtzEdit: TFrameNtzEdit
  Width = 830
  Height = 518
  AutoSize = False
  ExplicitWidth = 830
  ExplicitHeight = 518
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 830
    Height = 518
    Align = alClient
    ExplicitHeight = 518
    inherited btnSave: TcxButton
      Left = 333
      Top = 465
      TabOrder = 8
      OnClick = btnSaveClick
      ExplicitLeft = 333
      ExplicitTop = 465
    end
    inherited btnExit: TcxButton
      Left = 421
      Top = 465
      TabOrder = 9
      ExplicitLeft = 421
      ExplicitTop = 465
    end
    object edtHphm: TcxTextEdit [2]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object cbbHpzl: TcxComboBox [3]
      Left = 264
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object edtBz: TcxTextEdit [4]
      Left = 82
      Top = 76
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 720
    end
    object Panel1: TPanel [5]
      Left = 400
      Top = 104
      Width = 30
      Height = 341
      BevelOuter = bvNone
      TabOrder = 6
      object cxButton1: TcxButton
        Left = 3
        Top = 60
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 0
        OnClick = cxButton1Click
      end
      object cxButton2: TcxButton
        Left = 3
        Top = 100
        Width = 25
        Height = 25
        Caption = '>>'
        TabOrder = 1
        OnClick = cxButton2Click
      end
      object cxButton3: TcxButton
        Left = 3
        Top = 140
        Width = 25
        Height = 25
        Caption = '<'
        TabOrder = 2
        OnClick = cxButton3Click
      end
      object cxButton4: TcxButton
        Left = 3
        Top = 180
        Width = 25
        Height = 25
        Caption = '<<'
        TabOrder = 3
        OnClick = cxButton4Click
      end
    end
    object lsAllDev: TcxListBox [6]
      Left = 43
      Top = 127
      Width = 335
      Height = 303
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 5
      OnDblClick = lsAllDevDblClick
    end
    object lsSelectedDev: TcxListBox [7]
      Left = 452
      Top = 127
      Width = 335
      Height = 303
      ItemHeight = 17
      MultiSelect = True
      TabOrder = 7
    end
    object cxDateEdit1: TcxDateEdit [8]
      Left = 446
      Top = 36
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 147
    end
    object cxDateEdit2: TcxDateEdit [9]
      Left = 654
      Top = 36
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 147
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #29305#25209#20449#24687
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = edtHphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cbbHpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22791#27880
      Control = edtBz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignVert = avClient
      CaptionOptions.Text = 'Panel1'
      CaptionOptions.Visible = False
      Control = Panel1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 273
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #25152#26377#36335#21475
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      AlignVert = avClient
      Control = lsAllDev
      ControlOptions.OriginalHeight = 97
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #21487#36890#34892#36335#21475
      ButtonOptions.Buttons = <>
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      AlignVert = avClient
      Control = lsSelectedDev
      ControlOptions.OriginalHeight = 97
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignVert = avClient
      CaptionOptions.Text = #24320#22987#26085#26399
      Control = cxDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 147
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignVert = avClient
      CaptionOptions.Text = #32467#26463#26085#26399
      Control = cxDateEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 147
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
