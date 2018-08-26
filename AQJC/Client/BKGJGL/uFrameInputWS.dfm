inherited FrameInputWS: TFrameInputWS
  Width = 350
  Height = 200
  ExplicitWidth = 350
  ExplicitHeight = 200
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 350
    Height = 200
    ExplicitWidth = 350
    ExplicitHeight = 200
    inherited btnSave: TcxButton
      Left = 93
      Top = 147
      TabOrder = 3
      ExplicitLeft = 93
      ExplicitTop = 147
    end
    inherited btnExit: TcxButton
      Left = 181
      Top = 147
      TabOrder = 4
      ExplicitLeft = 181
      ExplicitTop = 147
    end
    object edtWSBH: TcxMemo [2]
      Left = 82
      Top = 36
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 240
    end
    object edtCZDW: TcxComboBox [3]
      Left = 82
      Top = 64
      AutoSize = False
      Properties.OnChange = edtCZDWPropertiesChange
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 240
    end
    object edtCZMJ: TcxComboBox [4]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 240
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #25163#26426#21495#30721#65288#36887#21495#20998#38548#65289
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #25991#20070#32534#21495
      Control = edtWSBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22788#32622#37096#38376
      Control = edtCZDW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 239
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22788' '#32622' '#20154
      Control = edtCZMJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 239
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
