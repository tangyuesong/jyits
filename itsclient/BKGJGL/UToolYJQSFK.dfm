inherited ToolYJQSFK: TToolYJQSFK
  Width = 831
  Height = 494
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 831
    Height = 494
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Left = -287
      Top = 45
      Width = 1105
      Height = 363
      TabOrder = 9
      ExplicitLeft = -287
      ExplicitTop = 45
      ExplicitWidth = 1105
      ExplicitHeight = 363
    end
    object dtBegin: TcxDateEdit [1]
      Left = -233
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 100
    end
    object dtEnd: TcxDateEdit [2]
      Left = -108
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 100
    end
    object cboJC: TcxComboBox [3]
      Left = 249
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 71
    end
    object edtHPHM: TcxTextEdit [4]
      Left = 327
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 4
      OnKeyPress = edtHPHMKeyPress
      Height = 21
      Width = 77
    end
    object btnSearch: TcxButton [5]
      Left = 579
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 6
      OnClick = btnSearchClick
    end
    inherited cbbPagesize: TcxComboBox
      Left = -287
      Top = 415
      TabOrder = 10
      ExplicitLeft = -287
      ExplicitTop = 415
    end
    inherited btnFirstPage: TcxButton
      Left = -210
      Top = 415
      TabOrder = 11
      ExplicitLeft = -210
      ExplicitTop = 415
    end
    inherited btnPriorPage: TcxButton
      Left = -173
      Top = 415
      TabOrder = 12
      ExplicitLeft = -173
      ExplicitTop = 415
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -118
      Top = 415
      TabOrder = 13
      ExplicitLeft = -118
      ExplicitTop = 415
    end
    inherited btnnextPage: TcxButton
      Left = -41
      Top = 415
      TabOrder = 14
      ExplicitLeft = -41
      ExplicitTop = 415
    end
    inherited btnLastPage: TcxButton
      Left = -4
      Top = 415
      TabOrder = 15
      ExplicitLeft = -4
      ExplicitTop = 415
    end
    inherited lbCount: TcxLabel
      Left = -287
      Top = 443
      ExplicitLeft = -287
      ExplicitTop = 443
    end
    object BtnExport: TcxButton [13]
      Left = 661
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = BtnExportClick
    end
    object cmbSource: TcxComboBox [14]
      Left = 465
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        ''
        #26412#22320
        #38598#25104#24179#21488)
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 107
    end
    object cboYJLX: TcxCheckComboBox [15]
      Left = 53
      Top = 13
      AutoSize = False
      Properties.Items = <>
      Style.HotTrack = False
      TabOrder = 2
      Height = 25
      Width = 135
    end
    object btnExportAll: TcxButton [16]
      Left = 743
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986#20840#37096
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 8
      OnClick = btnExportAllClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = dtBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = dtEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cboJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 71
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 77
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #25968#25454#26469#28304
      Control = cmbSource
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = cboYJLX
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 135
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnExportAll'
      CaptionOptions.Visible = False
      Control = btnExportAll
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 8
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actnew
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000171717602B2B2BB83A3A3AF52B2B2BB81717176000000000000000000000
            0000000000000000000000000000000000000000000000000000000000001717
            17603A3A3AF83C3C3CFF000000003C3C3CFF3A3A3AF817171760000000000000
            00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000002B2B
            2BB83C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF2B2B2BB8000000000000
            00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000003A3A
            3AF500000000000000000000000000000000000000003A3A3AF5000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000002B2B
            2BB83C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF2B2B2BB8000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000001717
            17603A3A3AF83C3C3CFF000000003C3C3CFF3A3A3AF817171760000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
            0000171717602B2B2BB83A3A3AF52B2B2BB81717176000000000000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
            0000000000003C3C3CFF3C3C3CFF000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF000000000000000000000000000000003C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF000000000000000000000000000000003C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E80000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF000000000000000000000000000000003C3C3CFF3C3C
            3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E7E0000000000000000000000000000000000000000000000000000
            00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E
            1E7E000000000000000000000000000000000000000000000000}
          Hint = #31614#25910
          Kind = bkGlyph
        end
        item
          Action = actedit
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
          Kind = bkGlyph
        end>
    end
  end
  inherited actlst1: TActionList
    inherited actedit: TAction
      OnExecute = acteditExecute
    end
    inherited actView: TAction
      OnExecute = actViewExecute
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
          ItemName = 'btnSign'
        end
        item
          Visible = True
          ItemName = 'btnFeedback'
        end
        item
          Visible = True
          ItemName = 'btnDetail'
        end>
      Visible = False
    end
    object btnSign: TdxBarLargeButton
      Caption = #39044#35686#31614#25910
      Category = 0
      Hint = #39044#35686#31614#25910
      Visible = ivAlways
      LargeImageIndex = 67
    end
    object btnFeedback: TdxBarLargeButton
      Caption = #39044#35686#21453#39304
      Category = 0
      Hint = #39044#35686#21453#39304
      Visible = ivAlways
      LargeImageIndex = 804
    end
    object btnDetail: TdxBarLargeButton
      Caption = #35814#32454#20449#24687
      Category = 0
      Hint = #35814#32454#20449#24687
      Visible = ivAlways
      LargeImageIndex = 69
    end
  end
end
