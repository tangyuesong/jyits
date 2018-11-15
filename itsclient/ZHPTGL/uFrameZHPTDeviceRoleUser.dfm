inherited FrameZHPTDeviceRoleUser: TFrameZHPTDeviceRoleUser
  Width = 751
  Height = 569
  Align = alNone
  Visible = False
  ExplicitWidth = 751
  ExplicitHeight = 569
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 751
    Height = 569
    ExplicitWidth = 668
    ExplicitHeight = 569
    object edtYhxm: TcxTextEdit [0]
      Left = 391
      Top = 59
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 68
    end
    object edtYhbh: TcxTextEdit [1]
      Left = 262
      Top = 59
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 68
    end
    object btnSearch: TcxButton [2]
      Left = 631
      Top = 59
      Width = 75
      Height = 25
      Caption = #26597#25214
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object cxGrid1: TcxGrid [3]
      Left = 28
      Top = 106
      Width = 695
      Height = 403
      TabOrder = 5
      object GridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        object GridViewColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'bj'
          Options.Filtering = False
          Width = 35
          IsCaptionAssigned = True
        end
        object GridViewColumn2: TcxGridDBColumn
          Caption = #29992#25143#32534#21495
          DataBinding.FieldName = 'YHBH'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 110
        end
        object GridViewColumn4: TcxGridDBColumn
          Caption = #29992#25143#22995#21517
          DataBinding.FieldName = 'YHXM'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 96
        end
        object GridViewColumn3: TcxGridDBColumn
          Caption = #21333#20301#20195#30721
          DataBinding.FieldName = 'DWDM'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 123
        end
        object GridViewColumn6: TcxGridDBColumn
          Caption = #22791#27880
          DataBinding.FieldName = 'BZ'
          HeaderAlignmentHorz = taCenter
          Width = 106
        end
        object GridViewColumn7: TcxGridDBColumn
          Caption = #24405#20837#20154
          DataBinding.FieldName = 'LRR'
          HeaderAlignmentHorz = taCenter
          Width = 105
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GridView
      end
    end
    object btnSave: TcxButton [4]
      Left = 297
      Top = 516
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 8
      OnClick = btnSaveClick
    end
    object btnCancel: TcxButton [5]
      Left = 379
      Top = 516
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 9
    end
    object cxButton1: TcxButton [6]
      Left = 28
      Top = 516
      Width = 30
      Height = 25
      Caption = #20840#36873
      TabOrder = 6
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton [7]
      Left = 65
      Top = 516
      Width = 30
      Height = 25
      Caption = #21453#36873
      TabOrder = 7
      OnClick = cxButton2Click
    end
    object cbbDwdm: TcxComboBox [8]
      Left = 97
      Top = 59
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 104
    end
    object cbbRyll: TcxComboBox [9]
      Left = 520
      Top = 59
      AutoSize = False
      Properties.Items.Strings = (
        ''
        #20132#35686
        #27665#35686
        #21327#35686)
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 104
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #35282#33394#29992#25143
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29992#25143#22995#21517
      Control = edtYhxm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 68
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29992#25143#32534#21495
      Control = edtYhbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 68
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21333#20301#20195#30721
      Control = cbbDwdm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 104
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 484
      ControlOptions.OriginalWidth = 660
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahCenter
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #20154#21592#31867#22411
      Control = cbbRyll
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 104
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 256
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 312
    Top = 256
  end
end
