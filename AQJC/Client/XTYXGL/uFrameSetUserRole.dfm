inherited FrameSetUserRole: TFrameSetUserRole
  Width = 676
  Height = 518
  Align = alNone
  Visible = False
  ExplicitWidth = 676
  ExplicitHeight = 518
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 676
    Height = 518
    ExplicitWidth = 676
    ExplicitHeight = 518
    object btnSave: TcxButton [0]
      Left = 259
      Top = 465
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
    end
    object btnCancel: TcxButton [1]
      Left = 341
      Top = 465
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
    end
    object tlFunction: TcxTreeList [2]
      Left = 334
      Top = 36
      Width = 314
      Height = 422
      Bands = <
        item
        end
        item
          Visible = False
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.CheckGroups = True
      OptionsView.Headers = False
      TabOrder = 2
      object tlFunctionColumn2: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object tlFunctionColumn3: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object lvOtherRole: TcxListView [3]
      Left = 28
      Top = 298
      Width = 299
      Height = 160
      Checkboxes = True
      Columns = <>
      ReadOnly = True
      TabOrder = 4
      ViewStyle = vsSmallIcon
      OnChange = lvOtherRoleChange
      OnSelectItem = lvOtherRoleSelectItem
    end
    object lvMineRole: TcxListView [4]
      Left = 28
      Top = 61
      Width = 299
      Height = 192
      Checkboxes = True
      Columns = <>
      ReadOnly = True
      TabOrder = 3
      ViewStyle = vsSmallIcon
      OnSelectItem = lvMineRoleSelectItem
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #21151#33021#35282#33394#20998#37197
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup4
      AlignHorz = ahCenter
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      AlignVert = avClient
      Control = tlFunction
      ControlOptions.OriginalHeight = 429
      ControlOptions.OriginalWidth = 314
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup2
      AlignVert = avBottom
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutLabeledItem1: TdxLayoutLabeledItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #20854#20182#31649#29702#21592#25480#20104#30340#35282#33394
      Index = 0
    end
    object lliCreator: TdxLayoutLabeledItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avBottom
      CaptionOptions.AlignVert = tavTop
      Control = lvOtherRole
      ControlOptions.OriginalHeight = 160
      ControlOptions.OriginalWidth = 354
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.AlignVert = tavTop
      Control = lvMineRole
      ControlOptions.OriginalHeight = 97
      ControlOptions.OriginalWidth = 354
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutLabeledItem2: TdxLayoutLabeledItem
      Parent = dxLayoutGroup2
      AlignVert = avTop
      CaptionOptions.Text = #26412#31649#29702#21592#21487#25480#20104#30340#35282#33394
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Separator'
      Index = 2
    end
  end
end
