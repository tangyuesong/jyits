inherited FrameHBCList: TFrameHBCList
  Width = 777
  Height = 495
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 777
    Height = 495
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 751
      Height = 381
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 751
      ExplicitHeight = 381
    end
    object cbbSF: TcxComboBox [1]
      Left = 67
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 71
    end
    object btnSearch: TcxButton [2]
      Left = 273
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 2
      OnClick = btnSearchClick
    end
    object edtHPHM: TcxTextEdit [3]
      Left = 145
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object btnImport2: TcxButton [4]
      Left = 355
      Top = 13
      Width = 75
      Height = 25
      Caption = #36710#36742#23548#20837
      OptionsImage.ImageIndex = 810
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 3
      OnClick = btnImportClick
    end
    object BtnExport2: TcxButton [5]
      Left = 437
      Top = 13
      Width = 75
      Height = 25
      Caption = #36829#27861#23548#20986
      OptionsImage.ImageIndex = 816
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = btnExportClick
    end
    object btnImportVio2: TcxButton [6]
      Left = 519
      Top = 13
      Width = 75
      Height = 25
      Caption = #36829#27861#23548#20837
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = btnImportVioClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 433
      TabOrder = 7
      ExplicitTop = 433
    end
    inherited btnFirstPage: TcxButton
      Top = 433
      TabOrder = 8
      ExplicitTop = 433
    end
    inherited btnPriorPage: TcxButton
      Top = 433
      TabOrder = 9
      ExplicitTop = 433
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 433
      TabOrder = 10
      ExplicitTop = 433
    end
    inherited btnnextPage: TcxButton
      Top = 433
      TabOrder = 11
      ExplicitTop = 433
    end
    inherited btnLastPage: TcxButton
      Top = 433
      TabOrder = 12
      ExplicitTop = 433
    end
    inherited lbCount: TcxLabel
      Top = 461
      ExplicitTop = 461
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbSF
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 71
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'a'
      CaptionOptions.Visible = False
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnImport2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Visible = False
      Control = BtnExport2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Visible = False
      Control = btnImportVio2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
  inherited DataSource1: TDataSource
    Left = 288
  end
  inherited FDMemTable1: TFDMemTable
    Left = 376
  end
  inherited cxdtrpstry1: TcxEditRepository
    Left = 336
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actdelete
          Default = True
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
          Hint = #21024#38500
          Kind = bkGlyph
        end>
    end
  end
  inherited dlgSave: TsSaveDialog
    Left = 173
  end
  inherited actlst1: TActionList
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
          ItemName = 'btnNew'
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
      Visible = False
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
      OnClick = btnDeleteClick
      LargeImageIndex = 802
    end
    object btnImport: TdxBarLargeButton
      Caption = #40644#26631#36710#23548#20837
      Category = 0
      Hint = #40644#26631#36710#23548#20837
      Visible = ivAlways
      OnClick = btnImportClick
      LargeImageIndex = 810
    end
    object btnExport: TdxBarLargeButton
      Caption = #36829#27861#23548#20986
      Category = 0
      Hint = #36829#27861#23548#20986
      Visible = ivAlways
      OnClick = btnExportClick
      LargeImageIndex = 816
    end
    object btnImportVio: TdxBarLargeButton
      Caption = #36829#27861#23548#20837
      Category = 0
      Hint = #36829#27861#23548#20837
      Visible = ivAlways
      OnClick = btnImportVioClick
      LargeImageIndex = 66
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'excel|*.xls;*.xlsx'
    Left = 104
    Top = 144
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Excel|*.xls;*xlsx'
    Left = 40
    Top = 144
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 424
    Top = 112
  end
end
