inherited ToolVioGZGL: TToolVioGZGL
  Width = 673
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 673
    Height = 305
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 647
      Height = 219
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 647
      ExplicitHeight = 219
      inherited GridView: TcxGridDBTableView
        Navigator.Visible = True
      end
    end
    object cxDateEdit1: TcxDateEdit [1]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.InputKind = ikRegExpr
      Properties.View = cavClassic
      Style.HotTrack = False
      StyleDisabled.ButtonStyle = btsDefault
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit [2]
      Left = 213
      Top = 13
      AutoSize = False
      Properties.InputKind = ikRegExpr
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object ChkJm: TcxCheckBox [3]
      Left = 424
      Top = 13
      Caption = #21551#21160#21152#23494
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 3
      Transparent = True
    end
    object btnSearch: TcxButton [4]
      Left = 501
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object BtnExport2: TcxButton [5]
      Left = 583
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      OptionsImage.ImageIndex = 66
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = BtnExport2Click
    end
    object cbblx: TcxComboBox [6]
      Left = 341
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #26410#23548#20986
        #24050#23548#20986)
      Style.HotTrack = False
      TabOrder = 2
      Text = #26410#23548#20986
      Height = 21
      Width = 76
    end
    inherited cbbPagesize: TcxComboBox
      Top = 271
      TabOrder = 7
      ExplicitTop = 271
    end
    inherited btnFirstPage: TcxButton
      Top = 271
      TabOrder = 8
      ExplicitTop = 271
    end
    inherited btnPriorPage: TcxButton
      Top = 271
      TabOrder = 9
      ExplicitTop = 271
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 271
      TabOrder = 10
      ExplicitTop = 271
    end
    inherited btnnextPage: TcxButton
      Top = 271
      TabOrder = 11
      ExplicitTop = 271
    end
    inherited btnLastPage: TcxButton
      Top = 271
      TabOrder = 12
      ExplicitTop = 271
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = cxDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = cxDateEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxCheckBox2'
      CaptionOptions.Visible = False
      Control = ChkJm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExport2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = cbblx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  inline FrameWFGZ1: TFrameWFGZ [1]
    Left = 200
    Top = 100
    Width = 449
    Height = 250
    AutoSize = True
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    OnResize = FrameResize
    ExplicitLeft = 200
    ExplicitTop = 100
    ExplicitWidth = 449
    inherited dxLayoutControl2: TdxLayoutControl
      Width = 449
      ExplicitWidth = 449
      inherited btnSave: TcxButton
        OnClick = btnSaveClick
      end
      inherited btnExit: TcxButton
        OnClick = btnExitClick
      end
      inherited EdtZSXXDZ: TcxTextEdit
        ExplicitWidth = 339
        Width = 339
      end
      inherited EdtSYR: TcxTextEdit
        ExplicitWidth = 339
        Width = 339
      end
      inherited Edtyzbm: TcxTextEdit
        ExplicitWidth = 339
        Width = 339
      end
    end
  end
  inherited DataSource1: TDataSource [2]
  end
  inherited FDMemTable1: TFDMemTable [3]
    Left = 416
  end
  inherited cxdtrpstry1: TcxEditRepository [4]
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
          Hint = #20462#25913
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
          Hint = #21024#38500
          Kind = bkGlyph
        end
        item
          Hint = #23548#20986
          Kind = bkGlyph
        end>
    end
  end
  inherited dlgSave: TsSaveDialog [5]
  end
  inherited actlst1: TActionList [6]
    Left = 208
    inherited actedit: TAction
      OnExecute = acteditExecute
    end
    inherited actdelete: TAction
      OnExecute = actdeleteExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
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
          ItemName = 'btnDel'
        end
        item
          Visible = True
          ItemName = 'btnExport'
        end>
      Visible = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #36864#20449#24405#20837
      Category = 0
      Hint = #36864#20449#24405#20837
      Visible = ivAlways
    end
    object btnUpdate: TdxBarLargeButton
      Caption = #23492#20449#20462#25913
      Category = 0
      Hint = #23492#20449#20462#25913
      Visible = ivAlways
      OnClick = btnUpdateClick
      LargeImageIndex = 1806
    end
    object btnDel: TdxBarLargeButton
      Caption = #23492#20449#21024#38500
      Category = 0
      Hint = #23492#20449#21024#38500
      Visible = ivAlways
      OnClick = btnDelClick
      LargeImageIndex = 802
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = #37038#32534#21516#27493
      Category = 0
      Hint = #37038#32534#21516#27493
      Visible = ivAlways
      LargeImageIndex = 1112
      SyncImageIndex = False
      ImageIndex = 1112
    end
    object btnExport: TdxBarLargeButton
      Caption = #23492#20449#23548#20986
      Category = 0
      Hint = #23492#20449#23548#20986
      Visible = ivAlways
      OnClick = btnExportClick
      LargeImageIndex = 66
    end
  end
end
