inherited FrameTjWfcl: TFrameTjWfcl
  Width = 867
  Height = 543
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 867
    Height = 543
    object RDYear: TcxRadioButton [0]
      Left = 13
      Top = 13
      Width = 38
      Height = 17
      Caption = #24180
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      OnClick = RDYearClick
      ParentBackground = False
      Transparent = True
    end
    object RDMonth: TcxRadioButton [1]
      Left = 58
      Top = 13
      Width = 38
      Height = 17
      Caption = #26376
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      OnClick = RDYearClick
      ParentBackground = False
      Transparent = True
    end
    object RDDate: TcxRadioButton [2]
      Left = 103
      Top = 13
      Width = 38
      Height = 17
      Caption = #26085
      Color = clBtnFace
      ParentColor = False
      TabOrder = 2
      OnClick = RDYearClick
      ParentBackground = False
      Transparent = True
    end
    object DTKSSJ: TcxDateEdit [3]
      Left = 383
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 107
    end
    object DTJSSJ: TcxDateEdit [4]
      Left = 515
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 103
    end
    object BtnSearch: TcxButton [5]
      Left = 625
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 7
      OnClick = BtnSearchClick
    end
    object BtnExport: TcxButton [6]
      Left = 707
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 8
      OnClick = BtnExportClick
    end
    object CbbYear: TcxComboBox [7]
      Left = 148
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 78
    end
    object CbbMonth: TcxComboBox [8]
      Left = 233
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 89
    end
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 841
      Height = 457
      TabOrder = 9
      ExplicitTop = 45
      ExplicitWidth = 841
      ExplicitHeight = 457
    end
    inherited cbbPagesize: TcxComboBox
      Top = 509
      TabOrder = 10
      ExplicitTop = 509
    end
    inherited btnFirstPage: TcxButton
      Top = 509
      TabOrder = 11
      ExplicitTop = 509
    end
    inherited btnPriorPage: TcxButton
      Top = 509
      TabOrder = 12
      ExplicitTop = 509
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 509
      TabOrder = 13
      ExplicitTop = 509
    end
    inherited btnnextPage: TcxButton
      Top = 509
      TabOrder = 14
      ExplicitTop = 509
    end
    inherited btnLastPage: TcxButton
      Top = 509
      TabOrder = 15
      ExplicitTop = 509
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      Index = 0
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton1'
      CaptionOptions.Visible = False
      Control = RDYear
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 38
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton2'
      CaptionOptions.Visible = False
      Control = RDMonth
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 38
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxRadioButton3'
      CaptionOptions.Visible = False
      Control = RDDate
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 38
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxDTKSSJ: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Visible = False
      Control = DTKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxDTJSSJ: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Visible = False
      Control = DTJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = BtnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxYEAR: TdxLayoutItem
      Parent = dxLayoutGroup2
      Visible = False
      Control = CbbYear
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 78
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxMonth: TdxLayoutItem
      Parent = dxLayoutGroup2
      Visible = False
      Control = CbbMonth
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actView
          ContentAlignment = taLeftJustify
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000040000000A000000100000001300000015000000140000
            00110000000C0000000500000001000000000000000000000000000000000000
            00030000000C070404263F271F836E4235CA7A4839DE915644FF774436DE693C
            30CE3A2019870704032B00000010000000040000000000000000000000030000
            0011442C2486976253F5BE998EFFD9C5BEFFE0CFCAFFEFE6E3FFDDCAC4FFD3BC
            B5FFB48B7FFF895140F540231B92000000180000000500000001010204145536
            2D9CC5A398FFF2E9E7FFF5EFEDFFBCAEA8FF71574CFF593A2DFF755B4EFFBEAE
            A7FFEBE2DEFFE5D8D3FFB79085FF4E2A21A90101021A000000032F23246BB58D
            80FFF9F5F4FFF7F3F2FFC1B3ADFF826555FFB19A85FFC2AC97FFB09783FF7F62
            51FFC0B0A9FFECE3DFFFECE2DFFFA37467FF28191A750000000A5E4F60E1BCB1
            ACFFF6F3F3FFF8F4F3FF7A5E50FFBEA995FF857162FF3F2A22FF746053FFB8A3
            8FFF806658FFEEE5E2FFECE2DFFFB1A29CFF503F50E40000000D182C4D885C63
            72FFB2B0B0FFF1EEEDFF725242FFDDD1B9FF806D5EFF493229FF493228FFCFC0
            A9FF745545FFEBE3E1FFABA6A3FF505566FF142A55AA0000000A05080F21395F
            9DFA697F9AFF626160FF55443CFFB2A894FFE4E0C1FF584135FF847466FFA498
            87FF58483FFF5F5C5CFF4E6586FF2F5191FF050B173C00000004000000031221
            3B685A7FB7FFA6C5E3FF7990ABFF444D59FF3E4248FF2B2A25FF3C4148FF3E48
            56FF627D9EFF789DC9FF3C609FFD0B172E630000000600000000000000000000
            00030F1B3159315593ED6F91C1FF9BB9DCFFB0CDE9FFCBE8FCFFA7C7E6FF87AA
            D3FF5A7EB3FF284B8BF10A152958000000060000000100000000000000000000
            0000000000020204071112223E6F1C3765B0213F76D0274C91FC1E3C74D01933
            62B40F1F3D750204081700000003000000000000000000000000000000000000
            0000000000000000000000000002000000030000000400000005000000050000
            0004000000020000000100000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
        end>
    end
  end
  inherited actlst1: TActionList
    inherited actView: TAction
      OnExecute = actViewExecute
    end
  end
end
