inherited FrameZHPTDeviceRoleEdit: TFrameZHPTDeviceRoleEdit
  Width = 824
  Height = 509
  Align = alNone
  ExplicitWidth = 824
  ExplicitHeight = 509
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 824
    Height = 509
    ExplicitWidth = 824
    ExplicitHeight = 509
    object edtRole: TcxTextEdit [0]
      Left = 595
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 201
    end
    object Memobz: TcxMemo [1]
      Left = 595
      Top = 64
      Style.HotTrack = False
      TabOrder = 2
      Height = 42
      Width = 201
    end
    object btnSave: TcxButton [2]
      Left = 639
      Top = 456
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object btnCanel: TcxButton [3]
      Left = 721
      Top = 456
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 6
    end
    object cxButton1: TcxButton [4]
      Left = 541
      Top = 456
      Width = 42
      Height = 25
      Caption = #20840#36873
      TabOrder = 3
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton [5]
      Left = 590
      Top = 456
      Width = 42
      Height = 25
      Caption = #21453#36873
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object lvDevice: TcxListView [6]
      Left = 28
      Top = 36
      Width = 506
      Height = 433
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = #35774#22791'ID'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = #35774#22791#21517#31216
        end
        item
          Width = 0
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #21151#33021#35282#33394#20449#24687
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #35282#33394#21517#31216
      Control = edtRole
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = #22791#27880
      Control = Memobz
      ControlOptions.OriginalHeight = 42
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup4
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnCanel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup4
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 42
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 42
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avClient
      Control = lvDevice
      ControlOptions.OriginalHeight = 97
      ControlOptions.OriginalWidth = 300
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
  end
end
