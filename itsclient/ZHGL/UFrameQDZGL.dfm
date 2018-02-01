inherited FrameQDZGL: TFrameQDZGL
  Height = 400
  ExplicitHeight = 400
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 400
    ExplicitHeight = 400
    inherited btnSave: TcxButton
      Top = 347
      TabOrder = 10
      OnClick = btnSaveClick
      ExplicitTop = 347
    end
    inherited btnExit: TcxButton
      Top = 347
      TabOrder = 11
      ExplicitTop = 347
    end
    object EdtQDZDM: TcxTextEdit [2]
      Left = 94
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 488
    end
    object EdtQDZMC: TcxTextEdit [3]
      Left = 94
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 488
    end
    object EDTJD: TcxTextEdit [4]
      Left = 94
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      OnKeyPress = EDTJDKeyPress
      Height = 21
      Width = 208
    end
    object EDTGLRY: TcxTextEdit [5]
      Left = 94
      Top = 120
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 208
    end
    object EDTWD: TcxTextEdit [6]
      Left = 375
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      OnKeyPress = EDTJDKeyPress
      Height = 21
      Width = 179
    end
    object EDTLXFS: TcxTextEdit [7]
      Left = 375
      Top = 120
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 207
    end
    object img1: TImageEnView [8]
      Left = 29
      Top = 149
      Width = 178
      Height = 177
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 7
      OnClick = img1Click
    end
    object img2: TImageEnView [9]
      Left = 216
      Top = 149
      Width = 178
      Height = 177
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 8
      OnClick = img1Click
    end
    object img3: TImageEnView [10]
      Left = 403
      Top = 149
      Width = 178
      Height = 177
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 9
      OnClick = img1Click
    end
    object btnMap: TcxButton [11]
      Left = 561
      Top = 92
      Width = 21
      Height = 21
      Hint = #25342#21462#32463#32428#24230
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000099A6B5CFF100B095C000000100000000100000010120E
        0D5CB48A7BFF100B096600000020000000080000000000000000000000000000
        0000000000000000000BB68C7DFF9A6B5DFF100B0A6500000036130E0D65B58B
        7CFFFFFFFFFF996B5BFF100B0972000000410000000000000000000000000000
        0000000000000000000AB68C7EFFFFFFFFFF9C6D5DFF231B1887B68C7DFFEADD
        D8FFE4C69AFFFFFFFFFF9C6B5CFF100B0A750000000300000000000000000000
        00000000000000000009B88E7FFFFFFFFFFFFFFFFFFFB78D7EFFEADDD8FFD8B1
        81FFE5C79AFFE4C79BFFFFFFFFFF9D6C5DFF0000000800000000000000000000
        00000000000000000008B98F80FFFFFFFFFFE5CBA2FFF9F9F9FFDCC5A9FFE2CA
        ADFFE5CAA1FFE5C89CFFFFFFFFFFB78D7EFF0000000900000000000000000000
        00000000000000000006B99182FFFEFEFEFFE9DAC3FFC0B8AEFF373C5FFF9677
        5EFFC19E78FFCDA97CFFF3ECE6FFB78E80FF0000000800000000000000000000
        00000000000000000005BB9384FFFAFAFAFFC8C0B3FF334D82FF3E95D2FF2336
        61FFA2886FFFD1B592FFF3ECE6FFB99081FF0000000700000000000000000000
        00000000000000000004CCAFA4FFE6E7E8FF395184FF53A9E2FF47BAFFFF3A9A
        DCFF2B3965FFC1AA8FFFF0E9E3FFB99183FF0000000600000000000000000000
        00000000000000000004D4C1BBFF6D81A8FF4F90C6FF4EBFFFFF4DBEFFFF4DBE
        FFFF307ABAFF5A617EFFE7E0DAFFC39F92FF0000000500000000000000000000
        0000000000000000000506112353376AA7FF67CBFFFF6CCCFFFF84D8FFFF83D7
        FFFF69CBFFFF205292FFA7A9B5FFD1B8AFFF0000000400000000000000000000
        0000000000000000000714396EC57BBBE3FF62C9FFFF519CD5FF1F66B2FF58A1
        D9FF8ADAFFFF48A1DDFF3C5280FFD4C0B8FF0000000300000000000000000000
        000000000000000000071C5194F49EDDFAFF6FD0FFFF225FA9FF081B31642265
        AFFF91DDFFFF5FC3F9FF163E7FF7E4D7D2FF0000000200000000000000000000
        000000000000000000051C518FE097D5F3FF8ADBFFFF4B93CEFF1A54A1FF5798
        D0FF7ED6FFFF61BCF1FF18437EE4000000080000000000000000000000000000
        00000000000000000002123459886AA8D6FFACE9FFFF93DEFFFF7ED6FFFF72D2
        FFFF7DD5FFFF589CD0FF0F2D518B000000030000000000000000000000000000
        000000000000000000000104060B20578DCE62A1D2FF93CFEFFFAFE9FFFF92CE
        EEFF63A1D1FF1D5088CF02040810000000010000000000000000000000000000
        000000000000000000000000000001020407102F4F731C558DCD236AB1FF1C54
        8DCD1031537A0102040800000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnMapClick
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #21149#23548#31449#31649#29702
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21149#23548#31449#32534#21495
      Control = EdtQDZDM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21149#23548#31449#21517#31216
      Control = EdtQDZMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #21149#23548#31449#32463#24230
      Control = EDTJD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 208
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = #31649#29702#20154#21592
      Control = EDTGLRY
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 208
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #21149#23548#31449#32428#24230
      Control = EDTWD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #32852#31995#26041#24335'   '
      Control = EDTLXFS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      Control = img1
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 105
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      Control = img2
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 105
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      Control = img3
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 105
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = btnMap
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '*.jpg'
    Filter = '*.jpg'
    Left = 320
    Top = 40
  end
end
