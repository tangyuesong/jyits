inherited FrameHBCList: TFrameHBCList
  Width = 833
  Height = 553
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 42
    Width = 833
    Height = 511
    ExplicitTop = 42
    ExplicitHeight = 263
    inherited cxGrid1: TcxGrid
      Top = 67
      Width = 807
      Height = 431
      TabOrder = 6
      ExplicitTop = 67
      ExplicitWidth = 807
      ExplicitHeight = 431
    end
    object deBegin: TcxDateEdit [1]
      Left = 74
      Top = 24
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object deEnd: TcxDateEdit [2]
      Left = 220
      Top = 24
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object cbbSF: TcxComboBox [3]
      Left = 402
      Top = 24
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 71
    end
    object btnQuery: TcxButton [4]
      Left = 736
      Top = 24
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 5
    end
    object cbbHPZL: TcxComboBox [5]
      Left = 608
      Top = 24
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 121
    end
    object edtHPHM: TcxTextEdit [6]
      Left = 480
      Top = 24
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 121
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24405#20837#26102#38388
      Control = deBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = deEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbSF
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 71
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnQuery
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'a'
      CaptionOptions.Visible = False
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  inherited dxBarManager1: TdxBarManager
    DockControlHeights = (
      0
      0
      42
      0)
    inherited dxBarManager1Bar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnNew'
        end
        item
          Visible = True
          ItemName = 'btnModify'
        end
        item
          Visible = True
          ItemName = 'btnDelete'
        end
        item
          Visible = True
          ItemName = 'btnImport'
        end
        item
          Visible = True
          ItemName = 'btnExport'
        end
        item
          Visible = True
          ItemName = 'btnImportVio'
        end>
    end
    object btnNew: TdxBarLargeButton
      Caption = #26032#22686#40644#26631#36710
      Category = 0
      Hint = #24405#20837
      Visible = ivAlways
      OnClick = btnNewClick
      LargeImageIndex = 158
    end
    object btnModify: TdxBarLargeButton
      Caption = #20462#25913#40644#26631#36710
      Category = 0
      Hint = #20462#25913#40644#26631#36710
      Visible = ivAlways
      LargeImageIndex = 1806
    end
    object btnDelete: TdxBarLargeButton
      Caption = #40644#26631#36710#21024#38500
      Category = 0
      Hint = #40644#26631#36710#21024#38500
      Visible = ivAlways
      LargeImageIndex = 802
    end
    object btnImport: TdxBarLargeButton
      Caption = #40644#26631#36710#23548#20837
      Category = 0
      Hint = #40644#26631#36710#23548#20837
      Visible = ivAlways
      LargeImageIndex = 810
    end
    object btnExport: TdxBarLargeButton
      Caption = #36829#27861#23548#20986
      Category = 0
      Hint = #36829#27861#23548#20986
      Visible = ivAlways
      LargeImageIndex = 816
    end
    object btnImportVio: TdxBarLargeButton
      Caption = #36829#27861#23548#20837
      Category = 0
      Hint = #36829#27861#23548#20837
      Visible = ivAlways
      LargeImageIndex = 66
    end
  end
end
