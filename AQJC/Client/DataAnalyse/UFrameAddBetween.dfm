inherited FrameAddBetween: TFrameAddBetween
  Width = 930
  Height = 493
  ExplicitWidth = 930
  ExplicitHeight = 493
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 930
    Height = 493
    ExplicitWidth = 930
    ExplicitHeight = 493
    object btnToDelete: TcxButton [0]
      Left = 370
      Top = 59
      Width = 75
      Height = 25
      Caption = #21024#38500#26465#20214
      TabOrder = 2
      OnClick = btnToDeleteClick
    end
    inherited btnSave: TcxButton
      Left = 383
      Top = 440
      TabOrder = 12
      OnClick = btnSaveClick
      ExplicitLeft = 383
      ExplicitTop = 440
    end
    inherited btnExit: TcxButton
      Left = 471
      Top = 440
      TabOrder = 13
      ExplicitLeft = 471
      ExplicitTop = 440
    end
    object cboTo: TcxComboBoxExt [3]
      Left = 43
      Top = 59
      AutoSize = False
      Properties.DropDownListStyle = lsEditList
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'Name'
      Properties.Revertable = True
      TabOrder = 0
      Height = 25
      Width = 238
    end
    object btnToAdd: TcxButton [4]
      Left = 288
      Top = 59
      Width = 75
      Height = 25
      Caption = #28155#21152#26465#20214
      TabOrder = 1
      OnClick = btnToAddClick
    end
    object cxGrid2: TcxGrid [5]
      Left = 43
      Top = 91
      Width = 402
      Height = 286
      TabOrder = 3
      LookAndFeel.NativeStyle = False
      object GridTo: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
        object GridToColumn3: TcxGridColumn
          Caption = #21345#21475#32534#21495
          Width = 118
        end
        object GridToColumn1: TcxGridColumn
          Caption = #21345#21475#21517#31216
          Width = 251
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = GridTo
      end
    end
    object btnBackAdd: TcxButton [6]
      Left = 727
      Top = 59
      Width = 75
      Height = 25
      Caption = #28155#21152#26465#20214
      TabOrder = 5
      OnClick = btnBackAddClick
    end
    object btnBackDelete: TcxButton [7]
      Left = 809
      Top = 59
      Width = 75
      Height = 25
      Caption = #21024#38500#26465#20214
      TabOrder = 6
      OnClick = btnBackDeleteClick
    end
    object cxGrid3: TcxGrid [8]
      Left = 482
      Top = 91
      Width = 402
      Height = 286
      TabOrder = 7
      LookAndFeel.NativeStyle = False
      object GridBack: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
        object cxGridColumn1: TcxGridColumn
          Caption = #21345#21475#32534#21495
          Width = 118
        end
        object cxGridColumn2: TcxGridColumn
          Caption = #21345#21475#21517#31216
          Width = 240
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = GridBack
      end
    end
    object deBegin: TcxDateEdit [9]
      Left = 82
      Top = 399
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 140
    end
    object txtName: TcxTextEdit [10]
      Left = 607
      Top = 399
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 11
      Text = #20219#21153#21517#31216
      Height = 21
      Width = 295
    end
    object cboBack: TcxComboBoxExt [11]
      Left = 482
      Top = 59
      AutoSize = False
      Properties.DropDownListStyle = lsEditList
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'Name'
      Properties.Revertable = True
      TabOrder = 4
      Height = 25
      Width = 238
    end
    object deEnd: TcxDateEdit [12]
      Left = 247
      Top = 399
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 140
    end
    object txtInterval: TcxTextEdit [13]
      Left = 472
      Top = 399
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 10
      Text = '1'
      Height = 21
      Width = 74
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #28155#21152#20219#21153
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21435#24448#32463#36807#36335#21475
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup5
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      Control = cboTo
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnToAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid2
      ControlOptions.OriginalHeight = 86
      ControlOptions.OriginalWidth = 402
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36820#22238#32463#36807#36335#21475
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup7
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton4'
      CaptionOptions.Visible = False
      Control = btnBackAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnBackDelete
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid3
      ControlOptions.OriginalHeight = 166
      ControlOptions.OriginalWidth = 396
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = deBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 140
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      CaptionOptions.Text = #20219#21153#21517#31216
      Control = txtName
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 246
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnToDelete
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cboBack
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 238
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #33267
      Control = deEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 140
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #21333#27425#24448#36820#22825#25968
      Control = txtInterval
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 74
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
