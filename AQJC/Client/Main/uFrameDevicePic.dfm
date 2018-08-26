inherited FrameDevicePic: TFrameDevicePic
  Width = 400
  Height = 390
  ExplicitWidth = 400
  ExplicitHeight = 390
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 400
    Height = 390
    ExplicitWidth = 400
    ExplicitHeight = 390
    inherited btnSave: TcxButton
      Left = 36
      Top = 337
      Caption = #35270#39057
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitLeft = 36
      ExplicitTop = 337
    end
    inherited btnExit: TcxButton
      Left = 288
      Top = 337
      Caption = #36820#22238
      TabOrder = 4
      ExplicitLeft = 288
      ExplicitTop = 337
    end
    object cxPageControl1: TcxPageControl [2]
      Left = 28
      Top = 36
      Width = 344
      Height = 281
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      ClientRectBottom = 281
      ClientRectRight = 344
      ClientRectTop = 0
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        ImageIndex = 0
        object cxImage1: TcxImage
          Left = 0
          Top = 0
          Align = alClient
          Style.HotTrack = False
          TabOrder = 0
          Height = 281
          Width = 344
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'cxTabSheet2'
        ImageIndex = 1
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxImage2: TcxImage
          Left = 0
          Top = 0
          Align = alClient
          Style.HotTrack = False
          TabOrder = 0
          Height = 281
          Width = 344
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'cxTabSheet3'
        ImageIndex = 2
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxImage3: TcxImage
          Left = 0
          Top = 0
          Align = alClient
          Style.HotTrack = False
          TabOrder = 0
          Height = 281
          Width = 344
        end
      end
    end
    object cxButton2: TcxButton [3]
      Left = 206
      Top = 337
      Width = 75
      Height = 25
      Caption = #24067#25511
      OptionsImage.ImageIndex = 57
      TabOrder = 3
      OnClick = cxButton2Click
    end
    object cxButton1: TcxButton [4]
      Left = 124
      Top = 337
      Width = 75
      Height = 25
      Caption = #24405#20837
      OptionsImage.ImageIndex = 57
      TabOrder = 2
      OnClick = cxButton1Click
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #31614#25910
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxPageControl1'
      CaptionOptions.Visible = False
      Control = cxPageControl1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 193
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 184
    Top = 184
  end
end
