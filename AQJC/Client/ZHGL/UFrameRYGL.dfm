inherited FrameRYGL: TFrameRYGL
  Width = 580
  Height = 380
  ExplicitWidth = 580
  ExplicitHeight = 380
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 580
    Height = 380
    CustomizeFormTabbedView = True
    ExplicitWidth = 580
    ExplicitHeight = 380
    inherited btnSave: TcxButton
      Left = 208
      Top = 327
      TabOrder = 8
      OnClick = btnSaveClick
      ExplicitLeft = 208
      ExplicitTop = 327
    end
    inherited btnExit: TcxButton
      Left = 296
      Top = 327
      TabOrder = 9
      ExplicitLeft = 296
      ExplicitTop = 327
    end
    object Img1: TImageEnView [2]
      Left = 29
      Top = 37
      Width = 199
      Height = 241
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      Align = alClient
      TabOrder = 0
    end
    object EdtSFZHM: TcxTextEdit [3]
      Left = 293
      Top = 59
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      OnKeyPress = EdtSFZHMKeyPress
      Height = 21
      Width = 244
    end
    object EdtXM: TcxTextEdit [4]
      Left = 293
      Top = 87
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 244
    end
    object EdtDW: TcxTextEdit [5]
      Left = 293
      Top = 115
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 244
    end
    object EdtDZ: TcxTextEdit [6]
      Left = 293
      Top = 143
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 244
    end
    object BtnPath: TcxButtonEdit [7]
      Left = 28
      Top = 286
      AutoSize = False
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000090101
            010E010101100101011001010110010101100101011001010111010101110101
            011101010111010101100101010B000000030000000000000000204780CA2B61
            ACFF2C63AEFF2C62AEFF2B61ADFF2B60ADFF2A5FACFF2A5FABFF2A5DABFF2A5D
            ABFF2A5CAAFF295BAAFF295AA8FF244D91E305091129000000022C65ACFF3972
            B4FF5F9FD5FF78C1EDFF4FAAE5FF4DA7E5FF4AA5E4FF48A3E3FF45A3E3FF44A1
            E2FF419FE1FF3F9FE1FF3E9DE1FF327BC4FF152D518B00000008326FB5FF518A
            C2FF4D8FCAFFA1DAF5FF6ABCECFF5DB3E9FF5AB2E9FF56B0E8FF54ACE7FF52AC
            E6FF50AAE5FF4DA8E5FF4AA5E4FF4296D9FF234E8BD50101010D3676BAFF73AB
            D4FF458DC9FFA4D6F0FF99D7F5FF6DC0EFFF6ABEEEFF67BCECFF65B9ECFF63B7
            EBFF5FB5EBFF5DB3EAFF59B2E8FF57AFE8FF336EB8FF060D162F397BBFFF94CA
            E7FF57A3D7FF85BFE3FFC6EFFCFF7ECCF3FF7BCAF2FF79C8F1FF76C7F1FF74C5
            F0FF70C3EFFF6DC0EFFF6ABEEEFF67BCECFF4990CCFF163051813C82C2FFB3E4
            F5FF7BCBEEFF5DA7D9FFD4F5FDFFD6F6FEFFD4F5FEFFCFF4FDFFCBF2FDFFC5EF
            FCFFBFECFBFFB8E8FAFFB1E4F9FFA9E1F8FF88C3E7FF26578CCB3F88C7FFCAF5
            FEFF9CE6FCFF69BEE8FF53A4D8FF53A2D7FF51A0D6FF509FD4FF4F9DD4FF4E9B
            D3FF4C99D1FF4B97D0FF377ABDFF3779BCFF3678BBFF316BAAEA3F8ECBFFCFF7
            FEFFAAEDFEFFA1E9FDFF98E5FBFF93E2FBFF8FE1FBFF8CE0FAFF87DBFAFF84D9
            F9FF81D9F9FF7FD8F9FF3272B8FF010101140000000A000000074293CDFFD2F8
            FEFFB2F1FEFFAEEFFEFFAAEEFEFFA9ECFDFFBEF3FDFFD6F9FEFFD7F9FEFFD5F8
            FEFFD3F8FEFFD0F7FDFF3D86C5FF0000000800000000000000004497D0FFD5F9
            FEFFB9F4FEFFB7F2FDFFB4F2FEFFBBEEFAFF4E9AD0FF4091CCFF4090CCFF3F8F
            CBFF3F8ECBFF408DC9FF306795C2000000050000000000000000469CD3FFE3FC
            FEFFE3FCFEFFE2FCFEFFD5F4FAFF4A93C3EC050B0F1B00000006000000060000
            000600000006000000080000000B0000000A000000070000000235769EBF479F
            D5FF479ED5FF479ED5FF479CD4FF173446590000000200000000000000000000
            00000000000000000005006233FF005F32FF005E2FFF00000006000000020000
            0003000000030000000400000003000000020000000000000001000000010000
            0001000000010000000400331A84006434FF006233FF00000006000000000000
            000000000000000000000000000000000000000000000000000100381E78001F
            11450000000400190D3E006435EB00381E8D006736FF00000004000000000000
            0000000000000000000000000000000000000000000000000000000302070040
            2386006E3CEA006A3DEA003A2187000301090000000200000001}
          Kind = bkGlyph
        end>
      Style.HotTrack = False
      TabOrder = 1
      OnClick = BtnPathClick
      Height = 21
      Width = 201
    end
    object EdtXL: TcxTextEdit [8]
      Left = 293
      Top = 199
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 244
    end
    object EdtSJ: TcxTextEdit [9]
      Left = 293
      Top = 171
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 244
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #20154#21592#31649#29702
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #22522#26412#20449#24687
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignVert = avClient
      CaptionOptions.Text = 'ImageEnView1'
      CaptionOptions.Visible = False
      SizeOptions.Width = 135
      Control = Img1
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 105
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'cxButtonEdit1'
      CaptionOptions.Visible = False
      Control = BtnPath
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 201
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36523#20221#35777
      Control = EdtSFZHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #22995#21517
      Control = EdtXM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21333#20301
      Control = EdtDW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #22320#22336
      Control = EdtDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #23398#21382
      Control = EdtXL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #25163#26426
      Control = EdtSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '*.jpg'
    Filter = '*.jpg'
    Left = 232
    Top = 32
  end
end
