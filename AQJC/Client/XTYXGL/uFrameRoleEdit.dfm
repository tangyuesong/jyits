inherited FrameRoleEdit: TFrameRoleEdit
  Width = 537
  Height = 418
  Align = alNone
  ExplicitWidth = 537
  ExplicitHeight = 418
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 537
    Height = 418
    ExplicitWidth = 537
    ExplicitHeight = 418
    object edtRole: TcxTextEdit [0]
      Left = 324
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 185
    end
    object btnSave: TcxButton [1]
      Left = 352
      Top = 365
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 3
    end
    object btnCanel: TcxButton [2]
      Left = 434
      Top = 365
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
    end
    object Memobz: TcxMemo [3]
      Left = 324
      Top = 64
      Style.HotTrack = False
      TabOrder = 2
      Height = 42
      Width = 185
    end
    object tlFunction: TcxTreeList [4]
      Left = 28
      Top = 36
      Width = 235
      Height = 354
      Bands = <
        item
        end
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsView.CheckGroups = True
      TabOrder = 0
      object tlFunctionColumn2: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Width = 151
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object tlFunctionColumn3: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Width = 100
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
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
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup3
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
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnCanel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
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
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      Control = tlFunction
      ControlOptions.OriginalHeight = 150
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
