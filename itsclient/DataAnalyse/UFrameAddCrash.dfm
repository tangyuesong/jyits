inherited FrameAddCrash: TFrameAddCrash
  Width = 660
  ExplicitWidth = 660
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 660
    CustomizeFormTabbedView = True
    ExplicitWidth = 660
    object cxGrid1: TcxGrid [0]
      Left = 28
      Top = 96
      Width = 600
      Height = 307
      TabOrder = 5
      object GridView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.NoDataToDisplayInfoText = #27809#26377#25968#25454
        OptionsView.GroupByBox = False
        object GridViewColumn1: TcxGridDBColumn
          Caption = #24320#22987#26102#38388
          Width = 130
        end
        object GridViewColumn2: TcxGridDBColumn
          Caption = #32467#26463#26102#38388
          Width = 130
        end
        object GridViewColumn3: TcxGridDBColumn
          Caption = #36807#36710#22320#28857
          Width = 300
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
      Top = 64
      AutoSize = False
      Properties.DropDownListStyle = lsEditList
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'Name'
      Properties.Revertable = True
      TabOrder = 2
      Height = 21
      Width = 215
    end
    object cxDateEdit1: TcxDateEdit [4]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 160
    end
    object cxDateEdit3: TcxDateEdit [5]
      Left = 303
      Top = 36
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 160
    end
    object BtnAdd: TcxButton [6]
      Left = 304
      Top = 64
      Width = 75
      Height = 25
      Caption = #28155#21152#26465#20214
      OptionsImage.ImageIndex = 110
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 3
      OnClick = BtnAddClick
    end
    object cxButton2: TcxButton [7]
      Left = 386
      Top = 64
      Width = 75
      Height = 25
      Caption = #21024#38500#26465#20214
      OptionsImage.ImageIndex = 79
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object cxTextEdit1: TcxTextEdit [8]
      Left = 82
      Top = 410
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 253
    end
    object cxTextEdit2: TcxTextEdit [9]
      Left = 384
      Top = 410
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Text = '50'
      Height = 21
      Width = 44
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #28155#21152#20219#21153
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      Index = 2
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldVertical
      Index = 5
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = cboGCDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 215
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
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
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = cxDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 160
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #32467#26463#26102#38388
      Control = cxDateEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 160
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
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup1
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      CaptionOptions.Text = #20219#21153#21517#31216
      Control = cxTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 253
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      CaptionOptions.Text = #21629#20013#29575
      Control = cxTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 44
      ControlOptions.ShowBorder = False
      Index = 1
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
  end
end
