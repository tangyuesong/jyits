inherited FToolBKCJ: TFToolBKCJ
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Height = 305
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Left = -688
      Top = 45
      Width = 1134
      Height = 174
      TabOrder = 11
      ExplicitLeft = -688
      ExplicitTop = 45
      ExplicitWidth = 1134
      ExplicitHeight = 174
    end
    object DTKSSJ: TcxDateEdit [1]
      Left = -634
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object DTJSSJ: TcxDateEdit [2]
      Left = -506
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 99
    end
    object cbbJC: TcxComboBox [3]
      Left = -346
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 67
    end
    object edthphm: TcxTextEdit [4]
      Left = -272
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 3
      OnKeyPress = edthphmKeyPress
      Height = 21
      Width = 65
    end
    object cbbHPZL: TcxComboBox [5]
      Left = -200
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 113
    end
    object cbbZT: TcxComboBox [6]
      Left = 169
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        #24453#23457#26680
        #21516#24847
        #19981#21516#24847)
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 78
    end
    object btnSearch: TcxButton [7]
      Left = 254
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      LookAndFeel.SkinName = 'HybridApp'
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 7
      OnClick = btnSearchClick
    end
    object cxButton1: TcxButton [8]
      Left = 413
      Top = 13
      Width = 33
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 10
      OnClick = cxButton1Click
    end
    inherited cbbPagesize: TcxComboBox
      Left = -688
      Top = 226
      TabOrder = 12
      ExplicitLeft = -688
      ExplicitTop = 226
    end
    inherited btnFirstPage: TcxButton
      Left = -611
      Top = 226
      TabOrder = 13
      ExplicitLeft = -611
      ExplicitTop = 226
    end
    inherited btnPriorPage: TcxButton
      Left = -574
      Top = 226
      TabOrder = 14
      ExplicitLeft = -574
      ExplicitTop = 226
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -519
      Top = 226
      TabOrder = 15
      ExplicitLeft = -519
      ExplicitTop = 226
    end
    inherited btnnextPage: TcxButton
      Left = -442
      Top = 226
      TabOrder = 16
      ExplicitLeft = -442
      ExplicitTop = 226
    end
    inherited btnLastPage: TcxButton
      Left = -405
      Top = 226
      TabOrder = 17
      ExplicitLeft = -405
      ExplicitTop = 226
    end
    inherited lbCount: TcxLabel
      Left = -688
      Top = 254
      ExplicitLeft = -688
      ExplicitTop = 254
    end
    object cboBKLX: TcxComboBox [16]
      Left = -26
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 158
    end
    object btnImport: TcxButton [17]
      Left = 374
      Top = 13
      Width = 32
      Height = 25
      Hint = #23548#20837
      LookAndFeel.SkinName = 'HybridApp'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000020000
        00090000000E0000000F00000010000000100000001100000011000000110000
        001200000012000000110000000C000000030000000000000000000000087B50
        43C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D59FFAA6C
        59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000000CAD73
        5FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1EDFFF8F1
        ECFFF8F0EBFFF8F0EAFFD5B6ADFF0000001100000000000000000000000CB077
        62FFFDFBFAFFF7EDE6FF53A46CFF058131FF048030FF047F30FF037E2FFF037D
        2EFF027C2EFF027B2DFF02792CFF01792CFF00782BFF00511DAD0000000BB079
        66FFFDFBFBFFF8EEE8FF068332FFFAF6F6FF058131FFF9F5F3FF047F2FFFF8F2
        F1FFF7F2EFFF7DB68EFFF7EFEDFFF6EEEBFF7BB48BFF01782BFF0000000AB37C
        69FFFEFCFBFFF8F0EAFF068433FFFBF7F6FF058231FFF9F5F4FF048030FFF8F4
        F2FF037E2FFF037D2FFF027C2EFF7DB68DFFF6EEEBFF01792CFF00000009B67F
        6CFFFEFDFCFFF9F0EBFF078533FF81BE95FFFBF7F6FF80BD94FF048131FFF9F5
        F2FF047F30FF037E2FFF7EB88FFFF6F1EEFF037B2DFF017A2DFF00000009B983
        71FFFEFDFCFFFAF3EEFF068634FFFCF8F8FF068433FFFBF7F6FF068231FFFAF5
        F3FF048030FF047F30FFF8F3F0FF037D2EFF027C2EFF027A2DFF00000008BC88
        77FFFEFEFDFFFBF4EFFF078634FFFBFAF9FF078533FFFAF8F7FF068333FFFAF7
        F5FF058131FF058030FF7EB991FFF8F2F0FFF7F2EFFF027C2DFF00000007BF8C
        7AFFFEFEFDFFFBF6F1FF55AA71FF078634FF078534FF068534FF068433FF0683
        32FF058332FF058131FF058030FF047F30FF037E2FFF025420AD00000006C18F
        7FFFFEFEFEFFFAF6F3FFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
        EFFFFAF4EEFFFDF9F8FFDEC3BAFF0000000B000000000000000000000006C493
        82FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
        F1FFFBF5F0FFFDFBF9FFBF8C7BFF0000000B000000000000000000000005C799
        85FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
        F3FFFCF6F2FFFDFCFAFFC28F7FFF0000000A000000000000000000000004C99A
        89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFE
        FDFFFEFDFDFFFEFDFDFFC49382FF000000080000000000000000000000029775
        67C0CA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A88FFC999
        87FFC79887FFC89886FF927163C2000000050000000000000000000000010000
        0002000000030000000400000004000000050000000500000005000000060000
        0006000000060000000600000005000000010000000000000000}
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 9
      OnClick = btnImportClick
    end
    object btnExport: TcxButton [18]
      Left = 336
      Top = 13
      Width = 31
      Height = 25
      Hint = #23548#20986#27169#26495
      LookAndFeel.SkinName = 'HybridApp'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0002000000090000000E0000000F000000100000001000000011000000110000
        00110000001200000012000000110000000C0000000300000000000000000000
        00087B5043C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D
        59FFAA6C59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000
        000CAD735FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1
        EDFFF8F1ECFFF8F0EBFFF8F0EAFFD5B6ADFF00000011000000003E5803AD5D81
        05FF5C8004FF5B7F04FF5A7E03FF5A7D03FF587C02FF577B02FF567902FF5679
        01FF557800FF537700FF547700FF537600FF537600FF385000AD5E8306FFFAF6
        F6FF5D8105FFF9F5F3FF5C7F04FFF8F2F1FFF7F2EFFFA7B678FFF7EFEDFFF6EE
        EBFFA6B476FF557801FFF4ECE7FF547700FFF3EAE5FF537600FF5F8406FFFBF7
        F6FF5D8205FFF9F5F4FF5C8004FFF8F4F2FF5A7E03FF597D03FF587C02FFA8B6
        78FFF6EEEBFF567901FFF5EDE8FF537700FFF4EBE6FF537600FF618507FFADBE
        7FFFFBF7F6FFACBD7DFF5B8104FFF9F5F2FF5B7F04FF5A7E03FFA9B879FFF6F1
        EEFF597B03FF557A01FFA6B376FFF5EDE8FFA4B274FF547700FF608606FFFCF8
        F8FF5F8406FFFBF7F6FF5F8206FFFAF5F3FF5C8004FF5B7F04FFF8F3F0FF5A7D
        03FF587C02FF577A02FFF6EEEAFF547801FFF4ECE8FF537700FF618607FFFBFA
        F9FF618507FFFAF8F7FF5D8306FFFAF7F5FF5D8105FF5D8005FFAAB97BFFF8F2
        F0FFF7F2EFFF597C02FFF6EFECFF557A01FFF5EDE9FF557801FF425B05AD6186
        07FF608507FF5F8506FF5F8406FF5E8306FF5E8305FF5D8105FF5D8005FF5B7F
        04FF5A7E03FF577C03FF567B02FF577B02FF567A01FF3A5201AD000000000000
        0006C18F7FFFFEFEFEFFFAF6F3FFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5
        F0FFFAF4EFFFFAF4EEFFFDF9F8FFDEC3BAFF0000000B00000000000000000000
        0006C49382FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4
        F2FFFBF5F1FFFBF5F0FFFDFBF9FFBF8C7BFF0000000B00000000000000000000
        0005C79985FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6
        F4FFFCF6F3FFFCF6F2FFFDFCFAFFC28F7FFF0000000A00000000000000000000
        0004C99A89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
        FDFFFEFEFDFFFEFDFDFFFEFDFDFFC49382FF0000000800000000000000000000
        0002977567C0CA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A
        88FFC99987FFC79887FFC89886FF927163C20000000500000000000000000000
        0001000000020000000300000004000000040000000500000005000000050000
        0006000000060000000600000006000000050000000100000000}
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 8
      OnClick = btnExportClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = DTKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = DTJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 99
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 67
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 65
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 113
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29366#24577
      Control = cbbZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 78
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 33
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = cboBKLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 158
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = btnImport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 32
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 31
      ControlOptions.ShowBorder = False
      Index = 8
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actedit
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF000000000000000000000000000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000003C3C3CFF2D2D2DBE00000000000000001E1E1E7E3C3C3CFF0000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000002D2D2DBE040404101E1E1E811E1E1E81000000001E1E1E7E0000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            000000000000040404101E1E1E813C3C3CFF3C3C3CFF1E1E1E81000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
            00001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E00000000000000000000
            000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000001A1A
            1A703C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E0000000000000000000000000000
            000000000000000000003C3C3CFF3C3C3CFF00000000000000001A1A1A703C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E7E040404100000000000000000000000003C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000353535E03C3C
            3CFF3C3C3CFF1A1A1A700A0A0A2C000000000000000000000000000000003C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E00000000000000001A1A1A703535
            35E01A1A1A700A0A0A2C3C3C3CFF000000000000000000000000000000003C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E7E0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
        end
        item
          Action = actnew
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000003333
            33FF333333FF333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF333333FF333333FF00000000000000003333
            33FF333333FF333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000333333FF333333FF00000000000000003333
            33FF333333FF000000001F1F1F991F1F1F991F1F1F991F1F1F991F1F1F991F1F
            1F991F1F1F991F1F1F9900000000333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000333333FF333333FF00000000000000003333
            33FF333333FF000000001F1F1F991F1F1F991F1F1F991F1F1F991F1F1F991F1F
            1F991F1F1F991F1F1F9900000000333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000333333FF333333FF00000000000000003333
            33FF333333FF000000001F1F1F991F1F1F991F1F1F991F1F1F99000000003333
            33FF00000000333333FF00000000333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000003333
            33FF333333FF333333FF00000000333333FF333333FF00000000000000003333
            33FF333333FF000000001F1F1F991F1F1F991F1F1F991F1F1F99000000003333
            33FF333333FF333333FF00000000333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000003333
            33FF333333FF333333FF00000000333333FF333333FF00000000000000003333
            33FF333333FF000000001F1F1F991F1F1F991F1F1F991F1F1F99000000003333
            33FF333333FF333333FF00000000333333FF333333FF00000000000000003333
            33FF333333FF0000000000000000000000000000000000000000000000003333
            33FF333333FF333333FF00000000333333FF333333FF00000000000000003333
            33FF333333FF333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF333333FF333333FF00000000000000003333
            33FF333333FF333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF333333FF333333FF00000000}
          Kind = bkGlyph
        end
        item
          Action = actdelete
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000F0F0F41000000000000000000000000000000000000
            0000000000000F0F0F4100000000000000000000000000000000000000000000
            0000000000001E1E1E813C3C3CFF1E1E1E810000000000000000000000000000
            00001E1E1E813C3C3CFF1E1E1E81000000000000000000000000000000000000
            00000F0F0F403C3C3CFF3C3C3CFF3C3C3CFF1E1E1E8100000000000000001E1E
            1E813C3C3CFF3C3C3CFF3C3C3CFF0F0F0F400000000000000000000000000000
            0000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E811E1E1E813C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000000000000000000000000000
            000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
            00000000000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E7E0000000000000000000000000000000000000000000000000000
            00000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E810000000000000000000000000000000000000000000000000000
            000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF1E1E1E8100000000000000000000000000000000000000000000
            0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E1E1E1E7E3C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
            00000F0F0F403C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E00000000000000001E1E
            1E7E3C3C3CFF3C3C3CFF3C3C3CFF0F0F0F400000000000000000000000000000
            0000000000001E1E1E7E3C3C3CFF1E1E1E7E0000000000000000000000000000
            00001E1E1E7E3C3C3CFF1E1E1E7E000000000000000000000000000000000000
            000000000000000000000F0F0F3E000000000000000000000000000000000000
            0000000000000F0F0F3E00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
        end>
    end
  end
  inherited actlst1: TActionList
    inherited actnew: TAction
      OnExecute = actnewExecute
    end
    inherited actedit: TAction
      OnExecute = acteditExecute
    end
    inherited actdelete: TAction
      OnExecute = actdeleteExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
    Left = 216
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxBarManager1Bar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnInput'
        end
        item
          Visible = True
          ItemName = 'btnUpdate'
        end
        item
          Visible = True
          ItemName = 'btnCheck'
        end
        item
          Visible = True
          ItemName = 'btnDel'
        end>
      Visible = False
    end
    object btnInput: TdxBarLargeButton
      Caption = #24067#25511#24405#20837
      Category = 0
      Hint = #24067#25511#24405#20837
      Visible = ivAlways
      OnClick = btnInputClick
      LargeImageIndex = 158
    end
    object btnUpdate: TdxBarLargeButton
      Caption = #24067#25511#20462#25913
      Category = 0
      Hint = #24067#25511#20462#25913
      Visible = ivAlways
      OnClick = btnUpdateClick
      LargeImageIndex = 1806
    end
    object btnCheck: TdxBarLargeButton
      Caption = #24067#25511#23457#26680
      Category = 0
      Hint = #24067#25511#23457#26680
      Visible = ivAlways
      OnClick = btnCheckClick
      LargeImageIndex = 1103
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = #23244#30097#23457#26680
      Category = 0
      Hint = #23244#30097#23457#26680
      Visible = ivAlways
      LargeImageIndex = 1101
    end
    object btnDel: TdxBarLargeButton
      Caption = #24067#25511#25764#38144
      Category = 0
      Hint = #24067#25511#25764#38144
      Visible = ivAlways
      OnClick = btnDelClick
      LargeImageIndex = 1087
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 472
    Top = 120
  end
end
