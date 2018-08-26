inherited FrameSpotSearch: TFrameSpotSearch
  Width = 994
  Height = 295
  Visible = False
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 994
    Height = 295
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 968
      Height = 209
      TabOrder = 5
      ExplicitTop = 45
      ExplicitWidth = 968
      ExplicitHeight = 209
    end
    object DtKssj: TcxDateEdit [1]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object DtJssj: TcxDateEdit [2]
      Left = 213
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object cbbZT: TcxComboBox [3]
      Left = 395
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        #24378#21046#22788#32602
        #31616#26131#22788#32602
        #36829#20572#22788#32602)
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 121
    end
    object BtnSearch: TcxButton [4]
      Left = 768
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = BtnSearchClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 261
      TabOrder = 6
      ExplicitTop = 261
    end
    inherited btnFirstPage: TcxButton
      Top = 261
      TabOrder = 7
      ExplicitTop = 261
    end
    inherited btnPriorPage: TcxButton
      Top = 261
      TabOrder = 8
      ExplicitTop = 261
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 261
      TabOrder = 9
      ExplicitTop = 261
    end
    inherited btnnextPage: TcxButton
      Top = 261
      TabOrder = 10
      ExplicitTop = 261
    end
    inherited btnLastPage: TcxButton
      Top = 261
      TabOrder = 11
      ExplicitTop = 261
    end
    object txtCondition: TcxTextEdit [11]
      Left = 577
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 184
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = DtKssj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = DtJssj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26597#35810#31867#21035
      Control = cbbZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26597#35810#26465#20214
      Control = txtCondition
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 184
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
