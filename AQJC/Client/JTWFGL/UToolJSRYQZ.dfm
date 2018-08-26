inherited FToolJSRYQZ: TFToolJSRYQZ
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Height = 305
    AutoSize = True
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 696
      Height = 174
      TabOrder = 5
      ExplicitTop = 45
      ExplicitWidth = 696
      ExplicitHeight = 174
    end
    inherited cbbPagesize: TcxComboBox
      Top = 226
      TabOrder = 6
      ExplicitTop = 226
    end
    inherited btnFirstPage: TcxButton
      Top = 226
      TabOrder = 7
      ExplicitTop = 226
    end
    inherited btnPriorPage: TcxButton
      Top = 226
      TabOrder = 8
      ExplicitTop = 226
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 226
      TabOrder = 9
      ExplicitTop = 226
    end
    inherited btnnextPage: TcxButton
      Top = 226
      TabOrder = 10
      ExplicitTop = 226
    end
    inherited btnLastPage: TcxButton
      Top = 226
      TabOrder = 11
      ExplicitTop = 226
    end
    object DtKSSJ: TcxDateEdit [7]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 111
    end
    object DtJSSJ: TcxDateEdit [8]
      Left = 203
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 111
    end
    object Edtjdsbh: TcxTextEdit [9]
      Left = 387
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 203
    end
    object btnSearch: TcxButton [10]
      Left = 597
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object BtnAdd: TcxButton [11]
      Left = 679
      Top = 13
      Width = 30
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 4
      OnClick = BtnAddClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = DtKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = #33267
      Control = DtJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #36523#20221#35777#32534#21495
      Control = Edtjdsbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 203
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actView
          Default = True
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
            2000000000000004000000000000000000000000000000000000000000000000
            000000000000848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF000000000000000000000000000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000000000000000
            000000000000848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB882
            4DFFB8824DFFFFFFFFFF848484FF000000000000000000000000000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF0000000000000000000000005D5D5DB48484
            84FF848484FF848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB882
            4DFFB8824DFFFFFFFFFF848484FF848484FF848484FF5D5D5DB4848484FF8484
            84FF848484FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF00000000848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000848484FF848484FF848484FF8484
            84FF00000000848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF00000000848484FF848484FF848484FF8484
            84FF00000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF00000000848484FF848484FF616161BB8484
            84FF00000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF00000000848484FF616161BB000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF848484FF000000000000000000000000000000000000
            000000000000848484FF848484FF848484FF848484FF848484FF848484FF8484
            84FF848484FF848484FF848484FF000000000000000000000000}
          Kind = bkGlyph
        end>
      Properties.Images = DM.ilBarSmall
    end
  end
  inherited dlgSave: TsSaveDialog
    Left = 157
  end
  inherited actlst1: TActionList
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
    Left = 480
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
          ItemName = 'btnPrint'
        end
        item
          Visible = True
          ItemName = 'btnVideoSetup'
        end
        item
          Visible = True
          ItemName = 'btnFtpSetup'
        end>
      Visible = False
    end
    object btnInput: TdxBarLargeButton
      Caption = #21462#35777#24405#20837
      Category = 0
      Hint = #21462#35777#24405#20837
      Visible = ivAlways
      OnClick = btnInputClick
      LargeImageIndex = 158
    end
    object btnUpdate: TdxBarLargeButton
      Caption = #21462#35777#20462#25913
      Category = 0
      Hint = #21462#35777#20462#25913
      Visible = ivAlways
      OnClick = btnUpdateClick
      LargeImageIndex = 1806
    end
    object btnPrint: TdxBarLargeButton
      Caption = #34917#20805#25171#21360
      Category = 0
      Hint = #34917#20805#25171#21360
      Visible = ivAlways
      OnClick = btnPrintClick
      LargeImageIndex = 1397
    end
    object btnVideoSetup: TdxBarLargeButton
      Caption = #35270#39057#37197#32622
      Category = 0
      Hint = #35270#39057#37197#32622
      Visible = ivNever
      OnClick = btnVideoSetupClick
      LargeImageIndex = 1807
    end
    object btnFtpSetup: TdxBarLargeButton
      Caption = 'FTP'#37197#32622
      Category = 0
      Hint = 'FTP'#37197#32622
      Visible = ivNever
      LargeImageIndex = 1227
    end
  end
  object frxrprt1: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39924.688702256900000000
    ReportOptions.LastChange = 42870.754059953700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 205
    Top = 114
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Memo1: TfrxMemoView
        Align = baWidth
        Top = 22.677180000000000000
        Width = 718.110700000000000000
        Height = 34.015770000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = #40657#20307
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #39550#39542#20154#21464#26356#30830#35748#20070)
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 62.252010000000000000
        Top = 98.133890000000000000
        Width = 56.692950000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #26412#20154)
        ParentFont = False
        VAlign = vaCenter
      end
      object jszh: TfrxMemoView
        Left = 360.834880000000000000
        Top = 98.133889999999990000
        Width = 264.567100000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo4: TfrxMemoView
        Left = 229.196970000000000000
        Top = 98.133890000000000000
        Width = 139.842610000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #65288#39550#39542#35777#21495#65306)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo6: TfrxMemoView
        Left = 640.520100000000000000
        Top = 98.133890000000000000
        Width = 52.913420000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #65289#20110)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo10: TfrxMemoView
        Left = 73.590600000000000000
        Top = 151.047310000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #24180)
        ParentFont = False
        VAlign = vaCenter
      end
      object Line1: TfrxLineView
        Left = 124.724490000000000000
        Top = 128.370130000000000000
        Width = 105.826840000000000000
        Color = clBlack
        Diagonal = True
      end
      object Line3: TfrxLineView
        Left = 353.275820000000000000
        Top = 128.370130000000000000
        Width = 294.803340000000000000
        Color = clBlack
        Diagonal = True
      end
      object pic2: TfrxPictureView
        Left = 392.953000000000000000
        Top = 230.094620000000000000
        Width = 302.362400000000000000
        Height = 264.567100000000000000
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
      object pic1: TfrxPictureView
        Left = 18.779530000000000000
        Top = 233.874150000000000000
        Width = 302.362400000000000000
        Height = 264.567100000000000000
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
      object Line2: TfrxLineView
        Left = 18.897650000000000000
        Top = 181.417440000000000000
        Width = 52.913420000000000000
        Color = clBlack
        Frame.Typ = [ftTop]
      end
      object Line6: TfrxLineView
        Left = 109.606370000000000000
        Top = 181.417440000000000000
        Width = 30.236240000000000000
        Color = clBlack
        Frame.Typ = [ftTop]
      end
      object Memo3: TfrxMemoView
        Left = 139.842610000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #26376)
        ParentFont = False
        VAlign = vaCenter
      end
      object Line7: TfrxLineView
        Left = 177.637910000000000000
        Top = 181.417440000000000000
        Width = 30.236240000000000000
        Color = clBlack
        Frame.Typ = [ftTop]
      end
      object Memo18: TfrxMemoView
        Left = 207.874150000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #26085)
        ParentFont = False
        VAlign = vaCenter
      end
      object Line12: TfrxLineView
        Left = 245.669450000000000000
        Top = 181.417440000000000000
        Width = 30.236240000000000000
        Color = clBlack
        Frame.Typ = [ftTop]
      end
      object Memo19: TfrxMemoView
        Left = 275.905690000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #26102)
        ParentFont = False
        VAlign = vaCenter
      end
      object Line13: TfrxLineView
        Left = 313.700990000000000000
        Top = 181.417440000000000000
        Width = 30.236240000000000000
        Color = clBlack
        Frame.Typ = [ftTop]
      end
      object Memo20: TfrxMemoView
        Left = 343.937230000000000000
        Top = 151.181200000000000000
        Width = 94.488250000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #21040)
        ParentFont = False
        VAlign = vaCenter
      end
      object Line17: TfrxLineView
        Left = 442.205010000000000000
        Top = 188.976500000000000000
        Width = 275.905690000000000000
        Color = clBlack
        Frame.Typ = [ftTop]
      end
      object Memo25: TfrxMemoView
        Top = 195.874150000000000000
        Width = 506.457020000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #36827#34892#39550#39542#35777#25163#26426#21464#26356#65292#24050#21464#26356#30340#25163#26426#30830#35748#26080#35823#12290)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo14: TfrxMemoView
        Left = 45.354360000000000000
        Top = 944.882500000000000000
        Width = 71.811070000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #31614#21517#65306)
        ParentFont = False
        VAlign = vaCenter
      end
      object Memo15: TfrxMemoView
        Left = 498.897960000000000000
        Top = 944.882500000000000000
        Width = 147.401670000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = #20223#23435'_GB2312'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          #24180'   '#26376'   '#26085)
        ParentFont = False
        VAlign = vaCenter
      end
      object wfsjn: TfrxMemoView
        Left = 11.338590000000000000
        Top = 151.181200000000000000
        Width = 64.252010000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object wfsjy: TfrxMemoView
        Left = 105.826840000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object wfsjr: TfrxMemoView
        Left = 173.858380000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object wfsjs: TfrxMemoView
        Left = 241.889920000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object wfsjf: TfrxMemoView
        Left = 309.921460000000000000
        Top = 151.181200000000000000
        Width = 37.795300000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object cljgmc: TfrxMemoView
        Left = 445.984540000000000000
        Top = 151.181200000000000000
        Width = 268.346630000000000000
        Height = 30.236240000000000000
        DisplayFormat.DecimalSeparator = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
      object dsr: TfrxMemoView
        Left = 124.724490000000000000
        Top = 98.267780000000000000
        Width = 105.826840000000000000
        Height = 30.236240000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        HAlign = haCenter
        Memo.UTF8W = (
          '${km3_2.xm}')
        ParentFont = False
        VAlign = vaCenter
      end
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 304
    Top = 136
  end
end
