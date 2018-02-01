inherited fDialogModifyPwd: TfDialogModifyPwd
  Width = 337
  Height = 241
  Visible = False
  ExplicitWidth = 337
  ExplicitHeight = 241
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 337
    Height = 241
    ExplicitWidth = 337
    ExplicitHeight = 241
    inherited btnSave: TcxButton
      Left = 87
      Top = 192
      TabOrder = 3
      ExplicitLeft = 87
      ExplicitTop = 192
    end
    inherited btnExit: TcxButton
      Left = 175
      Top = 192
      TabOrder = 4
      ExplicitLeft = 175
      ExplicitTop = 192
    end
    object edtOldPwd: TcxTextEdit [2]
      Left = 95
      Top = 65
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 0
      Height = 25
      Width = 200
    end
    object edtNewPwd: TcxTextEdit [3]
      Left = 95
      Top = 97
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 1
      Height = 25
      Width = 200
    end
    object edtConfirm: TcxTextEdit [4]
      Left = 95
      Top = 129
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 2
      Height = 25
      Width = 200
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #20462#25913#23494#30721
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahCenter
      AlignVert = avCenter
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21407#23494#30721
      Control = edtOldPwd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #26032#23494#30721
      Control = edtNewPwd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #30830#35748#23494#30721
      Control = edtConfirm
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
