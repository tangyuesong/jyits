inherited FrameAddZHPTFunction: TFrameAddZHPTFunction
  Width = 297
  Height = 284
  ExplicitWidth = 297
  ExplicitHeight = 284
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 297
    Height = 284
    ExplicitWidth = 297
    ExplicitHeight = 284
    inherited btnSave: TcxButton
      Left = 67
      Top = 212
      TabOrder = 5
      OnClick = btnSaveClick
      ExplicitLeft = 67
      ExplicitTop = 212
    end
    inherited btnExit: TcxButton
      Left = 155
      Top = 212
      TabOrder = 6
      ExplicitLeft = 155
      ExplicitTop = 212
    end
    object cbotype: TcxComboBox [2]
      Left = 58
      Top = 55
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #33756#21333
        #21151#33021)
      Properties.OnChange = cbotypePropertiesChange
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 211
    end
    object cboMenu: TcxComboBox [3]
      Left = 58
      Top = 83
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #33756#21333
        #21151#33021)
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 211
    end
    object edtID: TcxTextEdit [4]
      Left = 58
      Top = 111
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 211
    end
    object edtCaption: TcxTextEdit [5]
      Left = 58
      Top = 139
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 211
    end
    object cbMain: TcxCheckBox [6]
      Left = 28
      Top = 167
      Caption = #26680#24515#21151#33021
      Style.HotTrack = False
      TabOrder = 4
      Transparent = True
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avCenter
      CaptionOptions.Text = #28155#21152#21151#33021
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #31867#22411
      Control = cbotype
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liMenu: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #33756#21333
      Control = cboMenu
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'ID'
      Control = edtID
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21517#31216
      Control = edtCaption
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cbMain
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 67
      ControlOptions.ShowBorder = False
      Index = 4
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
    Left = 136
    Top = 96
  end
end
