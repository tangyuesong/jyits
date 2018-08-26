inherited FrameQDZSP: TFrameQDZSP
  Width = 650
  Height = 250
  ExplicitWidth = 650
  ExplicitHeight = 250
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 650
    Height = 250
    ExplicitWidth = 650
    ExplicitHeight = 250
    inherited btnSave: TcxButton
      Left = 243
      Top = 179
      TabOrder = 4
      OnClick = btnSaveClick
      ExplicitLeft = 243
      ExplicitTop = 179
    end
    inherited btnExit: TcxButton
      Left = 331
      Top = 179
      TabOrder = 5
      ExplicitLeft = 331
      ExplicitTop = 179
    end
    object ComSPMC: TcxComboBoxExt [2]
      Left = 127
      Top = 54
      AutoSize = False
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsEditList
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'Name'
      Properties.Revertable = True
      Properties.OnChange = ComSPMCPropertiesChange
      EditValue = ''
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 449
    end
    object EdtSPJD: TcxTextEdit [3]
      Left = 127
      Top = 110
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 449
    end
    object EdtSPWD: TcxTextEdit [4]
      Left = 127
      Top = 138
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 449
    end
    object EdtSPDM: TcxTextEdit [5]
      Left = 127
      Top = 82
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 449
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahCenter
      AlignVert = avCenter
      CaptionOptions.Text = #21149#23548#31449#35270#39057#31649#29702
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#21517#31216
      Control = ComSPMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 145
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#32534#21495
      Control = EdtSPDM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 449
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#32463#24230
      Control = EdtSPJD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#32428#24230
      Control = EdtSPWD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
