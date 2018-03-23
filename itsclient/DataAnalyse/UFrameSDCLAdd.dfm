inherited FrameSDCLAdd: TFrameSDCLAdd
  Height = 289
  AutoSize = False
  ExplicitHeight = 289
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 289
    Align = alClient
    AutoSize = True
    ExplicitHeight = 289
    inherited btnSave: TcxButton
      Top = 236
      TabOrder = 10
      OnClick = btnSaveClick
      ExplicitTop = 236
    end
    inherited btnExit: TcxButton
      Top = 236
      TabOrder = 11
      ExplicitTop = 236
    end
    object tmBegin: TcxTimeEdit [2]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 86
    end
    object tmEnd: TcxTimeEdit [3]
      Left = 187
      Top = 64
      AutoSize = False
      EditValue = 0.999988425925926d
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 86
    end
    object edtBZ: TcxMemo [4]
      Left = 82
      Top = 120
      Style.HotTrack = False
      TabOrder = 9
      Height = 75
      Width = 496
    end
    object edtSJ: TcxTextEdit [5]
      Left = 334
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 244
    end
    object cboFZJG1: TcxComboBox [6]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 63
    end
    object cbbHPZL: TcxComboBox [7]
      Left = 279
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 131
    end
    object edtKDBH: TcxTextEdit [8]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      OnKeyPress = edtKDBHKeyPress
      Height = 21
      Width = 463
    end
    object btnKDBH: TcxButton [9]
      Left = 552
      Top = 92
      Width = 21
      Height = 21
      Caption = '...'
      OptionsImage.ImageIndex = 56
      TabOrder = 8
      OnClick = btnKDBHClick
    end
    object cbbBKLX: TcxComboBox [10]
      Left = 471
      Top = 36
      AutoSize = False
      Properties.Items.Strings = (
        #20551#22871#29260#36710
        #20840#37096)
      Style.HotTrack = False
      TabOrder = 3
      Text = #20551#22871#29260#36710
      Height = 21
      Width = 107
    end
    object cboFZJG2: TcxCheckComboBox [11]
      Left = 152
      Top = 36
      AutoSize = False
      Properties.Delimiter = ','
      Properties.DropDownRows = 12
      Properties.Items = <
        item
          Description = 'A'
          ShortDescription = 'A'
        end
        item
          Description = 'B'
          ShortDescription = 'B'
        end
        item
          Description = 'C'
          ShortDescription = 'C'
        end
        item
          Description = 'D'
          ShortDescription = 'D'
        end
        item
          Description = 'E'
          ShortDescription = 'E'
        end
        item
          Description = 'F'
          ShortDescription = 'F'
        end
        item
          Description = 'G'
          ShortDescription = 'G'
        end
        item
          Description = 'H'
          ShortDescription = 'H'
        end
        item
          Description = 'I'
          ShortDescription = 'I'
        end
        item
          Description = 'J'
          ShortDescription = 'J'
        end
        item
          Description = 'K'
          ShortDescription = 'K'
        end
        item
          Description = 'L'
          ShortDescription = 'L'
        end
        item
          Description = 'M'
          ShortDescription = 'M'
        end
        item
          Description = 'N'
          ShortDescription = 'N'
        end
        item
          Description = 'O'
          ShortDescription = 'O'
        end
        item
          Description = 'P'
          ShortDescription = 'P'
        end
        item
          Description = 'Q'
          ShortDescription = 'Q'
        end
        item
          Description = 'R'
          ShortDescription = 'R'
        end
        item
          Description = 'S'
          ShortDescription = 'S'
        end
        item
          Description = 'T'
          ShortDescription = 'T'
        end
        item
          Description = 'U'
          ShortDescription = 'U'
        end
        item
          Description = 'V'
          ShortDescription = 'V'
        end
        item
          Description = 'W'
          ShortDescription = 'W'
        end
        item
          Description = 'X'
          ShortDescription = 'X'
        end
        item
          Description = 'Y'
          ShortDescription = 'Y'
        end
        item
          Description = 'Z'
          ShortDescription = 'Z'
        end>
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 66
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #36861#36394#20449#24687#37319#38598
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Text = #22270#29255#39044#35272
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #30701#20449#26102#38388
      Control = tmBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = '-'
      Offsets.Left = 1
      Control = tmEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      CaptionOptions.Text = #36861#36394#35828#26126
      Control = edtBZ
      ControlOptions.OriginalHeight = 75
      ControlOptions.OriginalWidth = 496
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #30701#20449#25163#26426
      Control = edtSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 244
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = cboFZJG1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 63
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 131
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 463
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Visible = False
      Control = btnKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignVert = avClient
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = cbbBKLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignVert = avClient
      Control = cboFZJG2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 66
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
