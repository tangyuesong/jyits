inherited FrameAddZHPTFunction: TFrameAddZHPTFunction
  Width = 297
  Height = 225
  ExplicitWidth = 297
  ExplicitHeight = 225
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 297
    Height = 225
    ExplicitWidth = 297
    ExplicitHeight = 225
    inherited btnSave: TcxButton
      Left = 67
      Top = 166
      TabOrder = 4
      OnClick = btnSaveClick
      ExplicitLeft = 67
      ExplicitTop = 166
    end
    inherited btnExit: TcxButton
      Left = 155
      Top = 166
      TabOrder = 5
      ExplicitLeft = 155
      ExplicitTop = 166
    end
    object cbotype: TcxComboBox [2]
      Left = 58
      Top = 41
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
      Top = 69
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
      Top = 97
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 211
    end
    object edtCaption: TcxTextEdit [5]
      Left = 58
      Top = 125
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 211
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
