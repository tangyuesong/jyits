inherited ToolYJQSFK: TToolYJQSFK
  Width = 885
  Height = 422
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 885
    Height = 422
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 77
      Width = 909
      Height = 259
      TabOrder = 10
      ExplicitTop = 77
      ExplicitWidth = 909
      ExplicitHeight = 259
    end
    inherited cbbPagesize: TcxComboBox
      Top = 343
      TabOrder = 11
      ExplicitTop = 343
    end
    inherited btnFirstPage: TcxButton
      Top = 343
      TabOrder = 12
      ExplicitTop = 343
    end
    inherited btnPriorPage: TcxButton
      Top = 343
      TabOrder = 13
      ExplicitTop = 343
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 343
      TabOrder = 14
      ExplicitTop = 343
    end
    inherited btnnextPage: TcxButton
      Top = 343
      TabOrder = 15
      ExplicitTop = 343
    end
    inherited btnLastPage: TcxButton
      Top = 343
      TabOrder = 16
      ExplicitTop = 343
    end
    inherited lbCount: TcxLabel
      Top = 371
      ExplicitTop = 371
    end
    object dtBegin: TcxDateEdit [8]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 100
    end
    object dtEnd: TcxDateEdit [9]
      Left = 192
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 100
    end
    object cboJC: TcxComboBox [10]
      Left = 353
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 71
    end
    object edtHPHM: TcxTextEdit [11]
      Left = 431
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 3
      OnKeyPress = edtHPHMKeyPress
      Height = 21
      Width = 77
    end
    object cmbSource: TcxComboBox [12]
      Left = 569
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        ''
        #26412#22320
        #38598#25104#24179#21488)
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 107
    end
    object btnSearch: TcxButton [13]
      Left = 683
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = btnSearchClick
    end
    object BtnExport: TcxButton [14]
      Left = 765
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 6
      OnClick = BtnExportClick
    end
    object btnExportAll: TcxButton [15]
      Left = 847
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986#20840#37096
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = btnExportAllClick
    end
    object cbbwfdd: TcxComboBox [16]
      Left = 67
      Top = 45
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      OnMouseUp = cbbwfddMouseUp
      Height = 21
      Width = 225
    end
    object cboYJLX: TcxCheckComboBox [17]
      Left = 353
      Top = 45
      AutoSize = False
      Properties.Items = <>
      Style.HotTrack = False
      TabOrder = 9
      Height = 25
      Width = 155
    end
    inherited dxLayoutItem3: TdxLayoutItem [19]
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup [20]
    end
    inherited dxLayoutItemPagesize: TdxLayoutItem [21]
    end
    inherited dxLayoutItemFirstPage: TdxLayoutItem [22]
    end
    inherited dxLayoutItemPriorPage: TdxLayoutItem [23]
    end
    inherited dxLayoutItemIndex: TdxLayoutItem [24]
    end
    inherited dxLayoutItemnextPage: TdxLayoutItem [25]
    end
    inherited dxLayoutItemBtnLastPage: TdxLayoutItem [26]
    end
    inherited dxLGCount: TdxLayoutGroup [27]
    end
    inherited dxLICount: TdxLayoutItem [28]
    end
    object dxLayoutGroup1: TdxLayoutGroup [29]
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    inherited dxLayoutGroup2: TdxLayoutGroup [30]
      Parent = dxLayoutGroup1
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
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 77
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #25968#25454#26469#28304
      Control = cmbSource
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
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
      Index = 5
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'btnExportAll'
      CaptionOptions.Visible = False
      Control = btnExportAll
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21345#21475#21517#31216
      Control = cbbwfdd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 225
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = cboYJLX
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 155
      ControlOptions.ShowBorder = False
      Index = 1
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
