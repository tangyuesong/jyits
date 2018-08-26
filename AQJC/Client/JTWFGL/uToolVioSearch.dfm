inherited ToolVioSearch: TToolVioSearch
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Height = 305
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 963
      Height = 174
      TabOrder = 8
      ExplicitTop = 45
      ExplicitWidth = 963
      ExplicitHeight = 174
    end
    object deLrB: TcxDateEdit [1]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 111
    end
    object deLrE: TcxDateEdit [2]
      Left = 203
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 111
    end
    object cbbSf: TcxComboBox [3]
      Left = 375
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 60
    end
    object edtHphm: TcxTextEdit [4]
      Left = 442
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 60
    end
    object cbbHpzl: TcxComboBox [5]
      Left = 509
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 121
    end
    object cbbType: TcxComboBox [6]
      Left = 691
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        #24405#20837#25968#25454
        #21024#38500#25968#25454
        #24050#19978#20256#25968#25454
        #19978#20256#26410#25104#21151#25968#25454)
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 121
    end
    object btnSearch: TcxButton [7]
      Left = 819
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 6
      OnClick = btnSearchClick
    end
    object BtnExport2: TcxButton [8]
      Left = 901
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = BtnExport2Click
    end
    inherited cbbPagesize: TcxComboBox
      Top = 226
      TabOrder = 9
      ExplicitTop = 226
    end
    inherited btnFirstPage: TcxButton
      Top = 226
      TabOrder = 10
      ExplicitTop = 226
    end
    inherited btnPriorPage: TcxButton
      Top = 226
      TabOrder = 11
      ExplicitTop = 226
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 226
      TabOrder = 12
      ExplicitTop = 226
    end
    inherited btnnextPage: TcxButton
      Top = 226
      TabOrder = 13
      ExplicitTop = 226
    end
    inherited btnLastPage: TcxButton
      Top = 226
      TabOrder = 14
      ExplicitTop = 226
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = deLrB
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = deLrE
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbSf
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 60
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edtHphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 60
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = cbbHpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #25968#25454#29366#24577
      Control = cbbType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExport2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
  end
  inline fVioEdit: TFrameVioEdit [1]
    Left = 0
    Top = 100
    Width = 1000
    Height = 695
    TabOrder = 5
    Visible = False
    ExplicitTop = 100
    ExplicitWidth = 1000
    inherited dxLayoutControl1: TdxLayoutControl
      Width = 1000
      ExplicitWidth = 1000
      inherited imgviopic: TImageEnVect
        Left = 14
        Top = 14
        Width = 620
        Height = 652
        ExplicitLeft = 14
        ExplicitTop = 14
        ExplicitWidth = 620
        ExplicitHeight = 652
      end
      inherited btnP1: TcxButton
        Left = 297
        Top = 674
        ExplicitLeft = 297
        ExplicitTop = 674
      end
      inherited btnP2: TcxButton
        Left = 312
        Top = 674
        ExplicitLeft = 312
        ExplicitTop = 674
      end
      inherited btnP3: TcxButton
        Left = 327
        Top = 674
        ExplicitLeft = 327
        ExplicitTop = 674
      end
      inherited btnVideo: TcxButton
        Left = 342
        Top = 674
        ExplicitLeft = 342
        ExplicitTop = 674
      end
      inherited img1: TImageEnView
        Left = 651
        Top = 14
        Width = 335
        ExplicitLeft = 651
        ExplicitTop = 14
        ExplicitWidth = 335
      end
      inherited cbbwfdd: TcxComboBox
        Left = 708
        Top = 282
        ExplicitLeft = 708
        ExplicitTop = 282
        ExplicitWidth = 279
        Width = 279
      end
      inherited dterq: TcxDateEdit
        Left = 708
        Top = 310
        ExplicitLeft = 708
        ExplicitTop = 310
      end
      inherited edtsj: TcxTimeEdit
        Left = 850
        Top = 310
        ExplicitLeft = 850
        ExplicitTop = 310
        ExplicitWidth = 137
        Width = 137
      end
      inherited cbbwfxw: TcxComboBox
        Left = 708
        Top = 338
        ExplicitLeft = 708
        ExplicitTop = 338
        ExplicitWidth = 279
        Width = 279
      end
      inherited cbbsf: TcxComboBox
        Left = 708
        Top = 366
        ExplicitLeft = 708
        ExplicitTop = 366
      end
      inherited edthphm: TcxTextEdit
        Left = 790
        Top = 366
        Style.IsFontAssigned = True
        ExplicitLeft = 790
        ExplicitTop = 366
      end
      inherited cbbhpzl: TcxComboBox
        Left = 867
        Top = 366
        ExplicitLeft = 867
        ExplicitTop = 366
      end
      inherited edtsyr: TcxTextEdit
        Left = 708
        Top = 394
        ExplicitLeft = 708
        ExplicitTop = 394
        ExplicitWidth = 279
        Width = 279
      end
      inherited edtcd: TcxTextEdit
        Left = 708
        Top = 422
        ExplicitLeft = 708
        ExplicitTop = 422
      end
      inherited edtxs: TcxTextEdit
        Left = 814
        Top = 422
        ExplicitLeft = 814
        ExplicitTop = 422
      end
      inherited edtcs: TcxTextEdit
        Left = 920
        Top = 422
        ExplicitLeft = 920
        ExplicitTop = 422
        ExplicitWidth = 67
        Width = 67
      end
      inherited edtclpp1: TcxTextEdit
        Left = 708
        Top = 450
        ExplicitLeft = 708
        ExplicitTop = 450
      end
      inherited edtclxh: TcxTextEdit
        Left = 708
        Top = 478
        ExplicitLeft = 708
        ExplicitTop = 478
      end
      inherited edtcsys: TcxTextEdit
        Left = 708
        Top = 506
        ExplicitLeft = 708
        ExplicitTop = 506
      end
      inherited edtyxqz: TcxTextEdit
        Left = 708
        Top = 534
        ExplicitLeft = 708
        ExplicitTop = 534
      end
      inherited edtclpp2: TcxTextEdit
        Left = 880
        Top = 450
        ExplicitLeft = 880
        ExplicitTop = 450
        ExplicitWidth = 107
        Width = 107
      end
      inherited edtcllx: TcxTextEdit
        Left = 880
        Top = 478
        ExplicitLeft = 880
        ExplicitTop = 478
        ExplicitWidth = 107
        Width = 107
      end
      inherited edtccdjrq: TcxTextEdit
        Left = 880
        Top = 506
        ExplicitLeft = 880
        ExplicitTop = 506
        ExplicitWidth = 107
        Width = 107
      end
      inherited edtqzbfqz: TcxTextEdit
        Left = 880
        Top = 534
        ExplicitLeft = 880
        ExplicitTop = 534
        ExplicitWidth = 107
        Width = 107
      end
      inherited btnBlack: TcxButton
        Left = 666
        Top = 652
        OnClick = btnBlackClick
        ExplicitLeft = 666
        ExplicitTop = 652
      end
      inherited btnDelete: TcxButton
        Left = 748
        Top = 652
        OnClick = btnDeleteClick
        ExplicitLeft = 748
        ExplicitTop = 652
      end
      inherited btnSave: TcxButton
        Left = 830
        Top = 652
        OnClick = btnSaveClick
        ExplicitLeft = 830
        ExplicitTop = 652
      end
      inherited btnBack: TcxButton
        Left = 912
        Top = 652
        OnClick = btnBackClick
        ExplicitLeft = 912
        ExplicitTop = 652
      end
      inherited lgCenter: TdxLayoutGroup
        AlignHorz = ahClient
        AlignVert = avClient
      end
      inherited dxLayoutSplitterItem2: TdxLayoutSplitterItem
        AlignHorz = ahRight
      end
      inherited lgRight: TdxLayoutGroup
        AlignHorz = ahRight
        AlignVert = avClient
      end
    end
    inherited cxImageList1: TcxImageList
      FormatVersion = 1
    end
  end
  inherited DataSource1: TDataSource [2]
    Left = 392
  end
  inherited FDMemTable1: TFDMemTable [3]
    Left = 456
    Top = 136
  end
  inherited cxdtrpstry1: TcxEditRepository [4]
    Left = 248
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actView
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
            2FC72121218D1010104600000000000000000000000000000000000000000000
            0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
            0820262626A33C3C3CFF262626A21414145320202088323232D5323232D52020
            208814141453262626A23C3C3CFF262626A30808082000000000000000002121
            218C3C3C3CFF1515155B020202071E1E1E803C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E80020202071515155B3C3C3CFF2121218C00000000101010463939
            39F3242424980000000100000000323232D53C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF323232D5000000000000000124242498393939F310101046303030CC3C3C
            3CFF282828A90000000000000000323232D53C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF323232D50000000000000000282828A93C3C3CFF303030CC101010463939
            39F33C3C3CFF242424980A0A0A2A1E1E1E803C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E800A0A0A2A242424983C3C3CFF393939F310101046000000002121
            218C3C3C3CFF3C3C3CFF303030CB2121218C2525259F333333D8333333D82525
            259F2121218C303030CB3C3C3CFF3C3C3CFF2121218C00000000000000000808
            0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
            0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
            00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
            2FC72121218D1010104600000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Hint = #26597#35810
          Kind = bkGlyph
        end
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
          Hint = #20462#25913
          Kind = bkGlyph
        end
        item
          Glyph.Data = {
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
          Hint = #23548#20986
          Kind = bkGlyph
        end>
    end
  end
  inherited dlgSave: TsSaveDialog [5]
  end
  inherited actlst1: TActionList [6]
    Left = 192
    inherited actnew: TAction
      OnExecute = actnewExecute
    end
    inherited actedit: TAction
      OnExecute = acteditExecute
    end
    inherited actView: TAction
      OnExecute = actViewExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
    Left = 352
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxBarManager1Bar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnUpdate'
        end
        item
          Visible = True
          ItemName = 'btnExport'
        end
        item
          Visible = True
          ItemName = 'btnInfo'
        end>
      Visible = False
    end
    object btnUpdate: TdxBarLargeButton
      Caption = #36829#27861#20462#25913
      Category = 0
      Hint = #36829#27861#20462#25913
      Visible = ivAlways
      OnClick = btnUpdateClick
      LargeImageIndex = 1806
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #36829#27861#21024#38500
      Category = 0
      Hint = #36829#27861#21024#38500
      Visible = ivAlways
      LargeImageIndex = 802
    end
    object btnExport: TdxBarLargeButton
      Caption = #36829#27861#23548#20986
      Category = 0
      Hint = #36829#27861#23548#20986
      Visible = ivAlways
      OnClick = btnExportClick
      LargeImageIndex = 816
    end
    object btnInfo: TdxBarLargeButton
      Caption = #35814#32454#20449#24687
      Category = 0
      Hint = #35814#32454#20449#24687
      Visible = ivAlways
      OnClick = btnInfoClick
      LargeImageIndex = 69
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 408
    Top = 240
  end
end
