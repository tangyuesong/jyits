inherited FrameQDZViewDev: TFrameQDZViewDev
  Align = alNone
  AutoSize = True
  inherited dxLayoutControl2: TdxLayoutControl
    ExplicitWidth = 305
    ExplicitHeight = 451
    object dxTileControl1: TdxTileControl [0]
      Left = 28
      Top = 36
      Width = 210
      Height = 210
      Align = alNone
      OptionsView.IndentHorz = 0
      OptionsView.IndentVert = 0
      OptionsView.ItemHeight = 100
      OptionsView.ItemWidth = 100
      TabOrder = 0
      object dxTileControl1Group1: TdxTileControlGroup
        Index = 0
      end
      object dxTileControl1Item1: TdxTileControlItem
        GroupIndex = 0
        IndexInGroup = 0
        RowCount = 2
        Size = tcisExtraLarge
        Text1.AssignedValues = []
        Text2.AssignedValues = []
        Text3.AssignedValues = []
        Text4.AssignedValues = []
      end
    end
    object txtType: TcxTextEdit [1]
      Left = 299
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Text = 'txtType'
      Height = 21
      Width = 124
    end
    object txtID: TcxTextEdit [2]
      Left = 299
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Text = 'cxTextEdit1'
      Height = 21
      Width = 124
    end
    object txtName: TcxTextEdit [3]
      Left = 299
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Text = 'cxTextEdit1'
      Height = 21
      Width = 124
    end
    object txtMemo: TcxMemo [4]
      Left = 299
      Top = 120
      Style.HotTrack = False
      TabOrder = 4
      Height = 126
      Width = 124
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = dxTileControl1
      ControlOptions.OriginalHeight = 210
      ControlOptions.OriginalWidth = 210
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #35774#22791#31867#22411
      Control = txtType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #35774#22791#32534#21495
      Control = txtID
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #35774#22791#21517#31216
      Control = txtName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = #22791#27880
      Control = txtMemo
      ControlOptions.OriginalHeight = 126
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
