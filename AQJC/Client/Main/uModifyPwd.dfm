object frmModifyPwd: TfrmModifyPwd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20462#25913#23494#30721
  ClientHeight = 212
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl2: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 332
    Height = 212
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    ExplicitWidth = 338
    ExplicitHeight = 241
    object btnSave: TcxButton
      Left = 85
      Top = 177
      Width = 81
      Height = 25
      Caption = #30830#23450
      OptionsImage.ImageIndex = 56
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btnExit: TcxButton
      Left = 172
      Top = 177
      Width = 75
      Height = 25
      Caption = #21462#28040
      OptionsImage.ImageIndex = 57
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = btnExitClick
    end
    object edtOldPwd: TcxTextEdit
      Left = 92
      Top = 41
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 0
      Height = 25
      Width = 200
    end
    object edtNewPwd: TcxTextEdit
      Left = 92
      Top = 72
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 1
      Height = 25
      Width = 200
    end
    object edtConfirm: TcxTextEdit
      Left = 92
      Top = 103
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 2
      Height = 25
      Width = 200
    end
    object dxLayoutControl2Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignVert = avClient
      CaptionOptions.Text = #20462#25913#23494#30721
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 81
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahCenter
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Visible = False
      Control = btnExit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Separator'
      Index = 1
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
