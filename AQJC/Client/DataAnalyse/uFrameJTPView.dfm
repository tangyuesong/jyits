inherited FrameJTPView: TFrameJTPView
  Width = 628
  Height = 417
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 628
    Height = 417
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 821
      Height = 314
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 821
      ExplicitHeight = 314
    end
    inherited cbbPagesize: TcxComboBox
      Top = 366
      TabOrder = 7
      ExplicitTop = 366
    end
    inherited btnFirstPage: TcxButton
      Top = 366
      TabOrder = 8
      ExplicitTop = 366
    end
    inherited btnPriorPage: TcxButton
      Top = 366
      TabOrder = 9
      ExplicitTop = 366
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 366
      TabOrder = 10
      ExplicitTop = 366
    end
    inherited btnnextPage: TcxButton
      Top = 366
      TabOrder = 11
      ExplicitTop = 366
    end
    inherited btnLastPage: TcxButton
      Top = 366
      TabOrder = 12
      ExplicitTop = 366
    end
    object cboJC: TcxComboBox [7]
      Left = -152
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 76
    end
    object edtHPHM: TcxTextEdit [8]
      Left = -69
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 89
    end
    object cboHPZL: TcxComboBox [9]
      Left = 81
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 110
    end
    object cbbBklx: TcxComboBox [10]
      Left = 252
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        #26080#29260
        #20551#29260
        #22871#29260)
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 110
    end
    object cbbStatus: TcxComboBox [11]
      Left = 423
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        #24453#23457#26680
        #24050#24067#25511
        #24050#21024#38500)
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 110
    end
    object btnQuery: TcxButton [12]
      Left = 540
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 5
      OnClick = btnQueryClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cboJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cboHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = cbbBklx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #25968#25454#29366#24577
      Control = cbbStatus
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnQuery
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actView
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000020000
            000A0000000F0000001100000011000000110000001100000012000000120000
            0012000000120000001300000013000000120000000C00000003000000090449
            96C10464D0FF0563D0FF0464D0FF0463D0FF0461CFFF0460CEFF035FCEFF045F
            CEFF035FCEFF035ECDFF035DCDFF025DCCFF024391C30000000B0000000D086A
            D3FF1081DBFF148CEFFF148CEFFF148CEFFF148BEFFF1188EEFF1188EEFF1188
            EEFF1188EEFF1188EEFF1188EEFF0970D6FF035ECDFF000000110000000D086D
            D4FF229BF2FF0B85E7FF007DDFFF007DDFFF007DDFFF0078DDFF0077DDFF0077
            DDFF0077DDFF0077DDFF0980E6FF138AEFFF0461CFFF000000110000000C0B72
            D8FF2AA0F3FF0381E1FFFFFFFFFFE2F0FBFF0381E1FF8BC2F0FFF8FBFEFF0279
            DFFF85BEF0FFFBFDFEFF0279DFFF168DF0FF0564D1FF000000100000000B0D76
            DAFF31A5F5FF0986E5FFE4F0FCFF7DBCF0FF0986E5FFBEDDF7FFC7E2F9FF067D
            E3FFA5D0F5FFDDEDFBFF067DE3FF1990F2FF0766D2FF0000000F0000000A107D
            DBFF39AAF7FF108CEAFF108CEAFF108CEAFF82BFF3FFFFFFFFFF80BEF3FF0A81
            E7FFDAECFBFFAAD4F7FF0A81E7FF1C93F4FF076AD4FF0000000E0000000A1281
            DFFF42AFF8FF1893EEFF9ACDF7FFC5E2FBFFFFFFFFFFB3D9F9FF2E96EEFF6EB6
            F4FFFFFFFFFF6CB5F3FF0F86ECFF2097F6FF096DD6FF0000000D000000091586
            E1FF4BB5F9FF1F99F2FFFAFCFFFFD1E9FCFF94CAF8FF43A6F4FF5EB0F4FFD5EA
            FCFFB6DBFAFF2694F1FF138AF0FF249BF7FF0A71D8FF0000000C00000008198A
            E3FF53BAFBFF289FF7FF289FF7FF289FF7FF289FF7FF85C5FAFFD9EDFDFFCEE7
            FDFF55ACF8FF188FF5FF188FF5FF289FF9FF0C74DAFF0000000C000000071B8F
            E5FF59BEFCFF2FA4FAFFA3D4FCFFBADFFDFFE2F1FEFFFFFFFFFFC1E2FDFF58AF
            FBFF1C93F9FF1C93F9FF1C93F9FF2BA2FBFF0E79DCFF0000000B000000061E94
            E8FF61C3FDFF36A9FDFFFCFDFFFFE6F4FFFFC0E2FEFF8DCBFEFF48AFFDFF2097
            FDFF2097FDFF2097FDFF2097FDFF2EA5FDFF0F7DDEFF0000000A000000052398
            E9FF66C6FEFF43B2FFFF3BACFFFF3BACFFFF3BACFFFF3BACFFFF3BACFFFF259B
            FFFF2299FFFF2299FFFF29A0FFFF31A8FEFF1180E1FF0000000900000004249B
            ECFF58BCF9FF6BC9FFFF6AC9FFFF6AC8FFFF69C8FFFF69C8FFFF68C8FFFF55BD
            FFFF4AB8FFFF4AB8FFFF49B8FFFF36A8F7FF1384E3FF00000007000000031C75
            AFC0269FECFF269EECFF269EECFF249DECFF269CEBFF249BEBFF249BEBFF1D93
            E9FF158AE7FF158AE6FF1489E5FF1588E6FF0E65AAC100000005000000010000
            0002000000030000000400000004000000040000000500000005000000050000
            0005000000050000000500000006000000060000000400000001}
          Hint = #20551#22871#29260#36710#36742#20449#24687
          Kind = bkGlyph
        end
        item
          Action = actedit
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0002000000090000000E0000000F0000000F0000000F00000010000000100000
            00100000001100000011000000100000000B0000000300000000000000000000
            0008285B8FC0357DC6FF327AC4FF3077C2FF2D75C1FF2B73C0FF2870BEFF266E
            BDFF256DBCFF226BBBFF216AB9FF154B84C20000000A00000000000000000000
            000C3C82CAFF77C2EEFF64B7EAFF61B5EAFF5DB4E9FF5AB2E8FF58B0E7FF54AF
            E7FF51ACE7FF50ABE6FF4DAAE6FF216ABAFF0000000F00000000000000000000
            000C3F85CBFF80C7EFFF3F8BCBFF3C88CBFF3986C8FF3583C7FF3381C6FF307F
            C4FF2F7FC4FF2D7DC3FF50ACE7FF246CBBFF0000000F00000000000000000000
            000B4288CDFF88CBF0FF4490CEFFF3ECEAFFEDE6E4FFEFEAE7FFE6E1DEFFE9E4
            E1FFECE5E1FF3181C5FF55AFE7FF256EBDFF0000000F00000000000000000000
            000B458BD0FF91D0F1FF4A95D1FFF5F1EFFFEFECE9FFA8B7AFFF125838FF6688
            77FFE7E2DFFF4D91CDFF59B1E8FF2971BEFF0000000E00000000000000000000
            000A498ED2FF99D4F3FF65A5D8FFF5F3F2FFAEBFB5FF1E825BFF2EE1AAFF1574
            4FFFA2B0A7FF8BB5DAFF63B6E9FF2B73C0FF0000000D00000000000000000000
            00094C92D3FFADDDF5FFA3C8E6FFB6C9C0FF258863FF40ECB9FF38ECB7FF2BD1
            9CFF236749FF87ACC6FF95CCEDFF2F76C2FF0000000D00000000000000000000
            00094E95D5FFB8E1F7FF84B2BEFF34906CFF5EF2C9FF71F9D7FF77F7D7FF41EB
            B9FF23B081FF326D5FFFA7CDE3FF6499D1FF0000000C00000000000000000000
            00085397D7FFBEE4F7FF78AFB3FF4AAA89FF77DBBEFF419E7EFF237956FF6ADF
            C1FF41E9B8FF1D9A6FFF52867FFF92B4D6FF0000000D00000000000000000000
            0007559AD9FFC5E8F9FFAFD2ECFFA3C5B7FF52967BFF98B8A9FFC5D1CBFF408D
            6FFF6DE1C3FF48ECBDFF18855CFF5B8891FF0000001500000001000000000000
            0007589DDAFFBDE6F9FF84BCE4FFF8F8F8FFF0F0EEFFEEEEECFFEDEBEAFFD1D9
            D4FF3D896BFF62D0B3FF66EFCCFF1C6F4DFF0000001B00000002000000000000
            00065B9FDCFFC2E7F7FF6AA6D2FFA5A3A1FF7D7976FF645E5DFF696462FFABA8
            A8FFB2B7B3FF3B826DFF359170FF6D95A5FF0000001300000000000000000000
            00055DA1DEFFC5E6F5FF767C80FFB3AEACFFD2CDCAFFE5E0DDFFCFC6C1FFB8AF
            AAFFC1BEBDFFA6ABAFFFC3D9E6FF9BBDDEFF0000000A00000000000000000000
            00034778A6C05DA0DBFF918987FF8D8682FF88817FFFD0CCCAFFC8C3C1FF6C66
            64FF76726FFF837F7DFF5C95CBFF4E7BA6CA0000000500000000000000000000
            00010000000300000004000000050000000525232243716C6ACA605B59CA1D1B
            1B44000000060000000600000006000000040000000100000000}
          Hint = #20219#21153#36816#34892#32467#26524
          Kind = bkGlyph
        end
        item
          Action = actdelete
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000200000008000000100000
            0012000000100000000900000002000000000000000000000000000000000000
            000000000000000000000000000000000004000101140A1B388A193C74DA1E49
            8EFF183B73DA0D21418B00010215000000040000000000000000000000000000
            00000000000000000000000000030102041A153264D2477FB5FF4CA1DBFF4DA9
            E3FF4BA1DBFF3E7FBDFF183B73D50103051A0000000300000000000000000000
            00000000000000000000000000090D2043986190BEFF59B1E7FF4FAAE4FF4FAA
            E4FF4FAAE3FF55AEE6FF4486C2FF11274B970000000900000000000000000000
            00000000000000000002000102161B417DF681C7EFFF54ACE5FF52ACE4FF51AB
            E4FF51ABE4FF52ACE4FF62B1E4FF1D457FE50000000E00000000000000000000
            00000000000200010211132D55AF4C8DC4FF75C6F1FF5FB4E8FF54ADE5FF54AD
            E4FF54ACE4FF5BB2E8FF6EC0EFFF235090FA0000000F00000000000000000000
            000200010210152F59AD4F90C6FF51ABE4FF8ACCF1FF77C5F1FF62B6E9FF58AF
            E5FF60B5E9FF72C3F1FF76C6F2FF24508EF20000000E00000000000000000000
            0007132C529F6199C7FF54ADE5FF4C8CC3FFBAE4F9FF8BD1F5FF8BD0F5FF8AD0
            F5FF88D0F5FF88CFF5FF88CFF4FF275698FD0000000D00000000000000000000
            00092E5F9DF5B9E1F4FF83AED4FF2E61A2FFCCEEFCFFABE2FCFFABE2FCFFABE2
            FCFFB4E5FCFFABE2FCFFC8EDFDFF2A5A9DFF0000000D00000000000000000000
            00052445638F4684BEFF284C6DA23065A5FFD2F1FDFFB6E8FDFFD7F3FEFF95C8
            E7FFD7F3FEFF4E81B7FFD7F3FEFF2C5EA0FF0000000C00000000000000000000
            00010000000500000008000000104785BFFFD3F1FDFF3166A6FFD7F3FEFF3064
            A5FFD7F3FEFF2F63A4FFD7F3FEFF2E62A2FF0000000B00000000000000000000
            00000000000000000000000000094988C1FFD3F1FEFF3469A9FFD7F3FEFF3268
            A8FFD7F3FEFF3166A7FFD7F3FEFF3165A5FF0000000A00000000000000000000
            00000000000000000000000000084A89C3FFD4F2FEFF356CABFFD7F3FEFF356B
            AAFFD7F3FEFF346AAAFFEAF9FEFF3266A4FA0000000800000000000000000000
            00000000000000000000000000064A87C0FAE5F5FCFF376FAEFFD7F3FEFF376D
            ADFFEAF9FEFF356BA9FC4988C2FF2646648C0000000400000000000000000000
            00000000000000000000000000032749668B4C8CC5FF4B8AC3FCEAF9FEFF376F
            ADFC4B8BC4FF2747658C00000009000000040000000100000000000000000000
            000000000000000000000000000100000003000000072849668B4C8CC6FF2749
            668B000000070000000300000001000000000000000000000000}
          Hint = #20572#27490#20316#19994
          Kind = bkGlyph
        end>
    end
  end
  inherited actlst1: TActionList
    inherited actedit: TAction
      OnExecute = acteditExecute
    end
    inherited actdelete: TAction
      OnExecute = actdeleteExecute
    end
    inherited actView: TAction
      OnExecute = actViewExecute
    end
  end
end