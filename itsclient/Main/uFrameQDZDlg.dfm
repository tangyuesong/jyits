inherited FrameQDZDlg: TFrameQDZDlg
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
      Left = 77
      Top = 337
      Caption = #35814#32454#20449#24687
      TabOrder = 1
      OnClick = btnSaveClick
      ExplicitLeft = 77
      ExplicitTop = 337
    end
    inherited btnExit: TcxButton
      Left = 247
      Top = 337
      Caption = #20851#38381
      TabOrder = 3
      ExplicitLeft = 247
      ExplicitTop = 337
    end
    object cxPageControl1: TcxPageControl [2]
      Left = 28
      Top = 36
      Width = 344
      Height = 281
      TabOrder = 0
      Properties.ActivePage = cxTabSheet3
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
    object btnSMS: TcxButton [3]
      Left = 165
      Top = 337
      Width = 75
      Height = 25
      Caption = #30701#20449#20998#20139
      OptionsImage.ImageIndex = 56
      TabOrder = 2
      OnClick = btnSMSClick
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = 'QDZ'
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Index = 2
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
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Visible = False
      Control = btnSMS
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
