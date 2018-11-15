inherited FrameAddZHPTDevice: TFrameAddZHPTDevice
  Width = 369
  Height = 225
  ExplicitWidth = 369
  ExplicitHeight = 225
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 369
    Height = 225
    Align = alClient
    ExplicitWidth = 369
    ExplicitHeight = 225
    inherited btnSave: TcxButton
      Left = 103
      Top = 152
      TabOrder = 3
      OnClick = btnSaveClick
      ExplicitLeft = 103
      ExplicitTop = 152
    end
    inherited btnExit: TcxButton
      Left = 191
      Top = 152
      TabOrder = 4
      ExplicitLeft = 191
      ExplicitTop = 152
    end
    object edtID: TcxTextEdit [2]
      Left = 82
      Top = 55
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 259
    end
    object edtCaption: TcxTextEdit [3]
      Left = 82
      Top = 83
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 259
    end
    object edtSBDD: TcxTextEdit [4]
      Left = 82
      Top = 111
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 259
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avCenter
      CaptionOptions.Text = #28155#21152#35774#22791
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791'ID'
      Control = edtID
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#21517#31216
      Control = edtCaption
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#22320#28857
      Control = edtSBDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 211
      ControlOptions.ShowBorder = False
      Index = 2
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
