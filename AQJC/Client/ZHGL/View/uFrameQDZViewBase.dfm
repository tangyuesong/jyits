inherited FrameQDZViewBase: TFrameQDZViewBase
  inherited dxLayoutControl2: TdxLayoutControl
    object dxTileControl1: TdxTileControl [0]
      Left = 13
      Top = 13
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
    object txtID: TcxTextEdit [1]
      Left = 296
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Text = 'txtID'
      Height = 21
      Width = 142
    end
    object txtName: TcxTextEdit [2]
      Left = 296
      Top = 41
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Text = 'cxTextEdit1'
      Height = 21
      Width = 142
    end
    object txtOwner: TcxTextEdit [3]
      Left = 296
      Top = 69
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Text = 'cxTextEdit1'
      Height = 21
      Width = 142
    end
    object txtPhone: TcxTextEdit [4]
      Left = 296
      Top = 97
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Text = 'cxTextEdit1'
      Height = 21
      Width = 142
    end
    object txtAddress: TcxMemo [5]
      Left = 296
      Top = 125
      Style.HotTrack = False
      TabOrder = 5
      Height = 89
      Width = 142
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
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
      CaptionOptions.Text = #21149#23548#31449#32534#21495
      Control = txtID
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21149#23548#31449#21517#31216
      Control = txtName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #31649#29702#20154#21592
      Control = txtOwner
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = txtPhone
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.AlignVert = tavTop
      CaptionOptions.Text = #35814#32454#22320#22336
      Control = txtAddress
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
end
