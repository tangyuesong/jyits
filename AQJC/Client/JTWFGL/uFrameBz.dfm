inherited frameBz: TframeBz
  Width = 337
  Height = 169
  ExplicitWidth = 337
  ExplicitHeight = 169
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 337
    Height = 169
    ExplicitWidth = 337
    ExplicitHeight = 169
    inherited btnSave: TcxButton
      Left = 87
      Top = 116
      TabOrder = 1
      ExplicitLeft = 87
      ExplicitTop = 116
    end
    inherited btnExit: TcxButton
      Left = 175
      Top = 116
      TabOrder = 2
      ExplicitLeft = 175
      ExplicitTop = 116
    end
    object cbbBz: TcxComboBox [2]
      Left = 85
      Top = 53
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #20551#29260
        #22871#29260
        #36974#25377
        #22810#27425#36829#27861
        #25253#24223
        #26410#24180#26816)
      Style.HotTrack = False
      TabOrder = 0
      Height = 25
      Width = 200
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #40657#21517#21333#36710#36742
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahCenter
      AlignVert = avCenter
      CaptionOptions.Text = #22791#27880':'
      Control = cbbBz
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
