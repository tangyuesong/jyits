inherited FrameAddFirstEnter: TFrameAddFirstEnter
  Width = 660
  ExplicitWidth = 660
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 660
    CustomizeFormTabbedView = True
    ExplicitWidth = 660
    object cxGrid1: TcxGrid [0]
      Left = 28
      Top = 109
      Width = 600
      Height = 294
      TabOrder = 6
      object GridView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.NoDataToDisplayInfoText = #27809#26377#25968#25454
        OptionsView.GroupByBox = False
        object GridViewColumn2: TcxGridDBColumn
          Caption = #21345#21475#32534#21495
          Width = 180
        end
        object GridViewColumn3: TcxGridDBColumn
          Caption = #21345#21475#21517#31216
          Width = 320
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GridView
      end
    end
    inherited btnSave: TcxButton
      Left = 246
      TabOrder = 8
      OnClick = btnSaveClick
      ExplicitLeft = 246
    end
    inherited btnExit: TcxButton
      Left = 334
      TabOrder = 9
      ExplicitLeft = 334
    end
    object cboGCDD: TcxComboBoxExt [3]
      Left = 82
      Top = 77
      AutoSize = False
      Properties.DropDownListStyle = lsEditList
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'Name'
      Properties.Revertable = True
      TabOrder = 3
      Height = 21
      Width = 367
    end
    object edtBeginDate: TcxDateEdit [4]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 183
    end
    object edtEndDate: TcxDateEdit [5]
      Left = 326
      Top = 36
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 183
    end
    object BtnAdd: TcxButton [6]
      Left = 456
      Top = 77
      Width = 75
      Height = 25
      Caption = #28155#21152
      OptionsImage.ImageIndex = 110
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = BtnAddClick
    end
    object btnDelete: TcxButton [7]
      Left = 538
      Top = 77
      Width = 75
      Height = 25
      Caption = #21024#38500
      OptionsImage.ImageIndex = 79
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = btnDeleteClick
    end
    object edtTaskName: TcxTextEdit [8]
      Left = 82
      Top = 410
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 546
    end
    object edtDays: TcxTextEdit [9]
      Left = 546
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Text = '30'
      Height = 21
      Width = 69
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #28155#21152#20219#21153
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      Index = 3
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldVertical
      Index = 6
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Index = 5
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36827#22478#21345#21475
      Control = cboGCDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 367
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #24320#22987#26085#26399
      Control = edtBeginDate
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 183
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #32467#26463#26085#26399
      Control = edtEndDate
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 183
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnDelete
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #20219#21153#21517#31216
      Control = edtTaskName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 546
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxGrid1
      ControlOptions.OriginalHeight = 136
      ControlOptions.OriginalWidth = 600
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignVert = avClient
      CaptionOptions.Text = #22825#25968
      Control = edtDays
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
  end
end
