object frmSelfInfo: TfrmSelfInfo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20010#20154#30456#20851#20449#24687
  ClientHeight = 287
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl2: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 332
    Height = 287
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    ExplicitHeight = 212
    object btnSave: TcxButton
      Left = 125
      Top = 252
      Width = 81
      Height = 25
      Caption = #30830#23450
      OptionsImage.ImageIndex = 56
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = btnSaveClick
    end
    object cxTextEdit1: TcxTextEdit
      Left = 111
      Top = 30
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 211
    end
    object cxTextEdit2: TcxTextEdit
      Left = 111
      Top = 57
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 211
    end
    object cxTextEdit3: TcxTextEdit
      Left = 111
      Top = 111
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 211
    end
    object cxTextEdit4: TcxTextEdit
      Left = 111
      Top = 138
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 211
    end
    object cxTextEdit5: TcxTextEdit
      Left = 111
      Top = 165
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 211
    end
    object cxTextEdit6: TcxTextEdit
      Left = 111
      Top = 192
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 211
    end
    object cxTextEdit7: TcxTextEdit
      Left = 111
      Top = 84
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 211
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
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avCenter
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #29992#25143#32534#21495
      Control = cxTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #29992#25143#22995#21517
      Control = cxTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #19978#27425#25104#21151#30331#24405#26102#38388
      Control = cxTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #19978#27425#37492#21035#22833#36133#26102#38388
      Control = cxTextEdit4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #29992#25143#36317#31163#21040#26399#22825#25968
      Control = cxTextEdit5
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #23494#30721#36317#31163#21040#26399#22825#25968
      Control = cxTextEdit6
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21333#20301#21517#31216
      Control = cxTextEdit7
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 211
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
