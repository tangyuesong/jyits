inherited FrameInput: TFrameInput
  Width = 400
  Height = 350
  ExplicitWidth = 400
  ExplicitHeight = 350
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 400
    Height = 350
    ExplicitWidth = 400
    ExplicitHeight = 350
    inherited btnSave: TcxButton
      Left = 118
      Top = 297
      TabOrder = 1
      ExplicitLeft = 118
      ExplicitTop = 297
    end
    inherited btnExit: TcxButton
      Left = 206
      Top = 297
      TabOrder = 2
      ExplicitLeft = 206
      ExplicitTop = 297
    end
    object edtCZSJ: TcxMemo [2]
      Left = 28
      Top = 36
      Style.HotTrack = False
      TabOrder = 0
      Height = 241
      Width = 344
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
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #31614#25910#26102#38388
      CaptionOptions.Visible = False
      Control = edtCZSJ
      ControlOptions.OriginalHeight = 229
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
