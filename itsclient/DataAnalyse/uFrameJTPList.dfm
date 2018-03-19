inherited FrameJTPList: TFrameJTPList
  Width = 802
  Height = 309
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 802
    Height = 309
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 776
      Height = 195
      TabOrder = 4
      ExplicitTop = 45
      ExplicitWidth = 776
      ExplicitHeight = 195
    end
    object DTKSSJ: TcxDateEdit [1]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object DTJSSJ: TcxDateEdit [2]
      Left = 195
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 99
    end
    object btnSearch: TcxButton [3]
      Left = 301
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
      TabOrder = 2
      OnClick = btnSearchClick
    end
    object btnAdd: TcxButton [4]
      Left = 756
      Top = 13
      Width = 33
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      OnClick = btnAddClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 247
      TabOrder = 5
      ExplicitTop = 247
    end
    inherited btnFirstPage: TcxButton
      Top = 247
      TabOrder = 6
      ExplicitTop = 247
    end
    inherited btnPriorPage: TcxButton
      Top = 247
      TabOrder = 7
      ExplicitTop = 247
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 247
      TabOrder = 8
      ExplicitTop = 247
    end
    inherited btnnextPage: TcxButton
      Top = 247
      TabOrder = 9
      ExplicitTop = 247
    end
    inherited btnLastPage: TcxButton
      Top = 247
      TabOrder = 10
      ExplicitTop = 247
    end
    inherited lbCount: TcxLabel
      Top = 275
      ExplicitTop = 275
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
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 33
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
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
      LargeImageIndex = 158
    end
    object btnUpdate: TdxBarLargeButton
      Caption = #24067#25511#20462#25913
      Category = 0
      Hint = #24067#25511#20462#25913
      Visible = ivAlways
      LargeImageIndex = 1806
    end
    object btnCheck: TdxBarLargeButton
      Caption = #24067#25511#23457#26680
      Category = 0
      Hint = #24067#25511#23457#26680
      Visible = ivAlways
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
      LargeImageIndex = 1087
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 600
    Top = 104
  end
end
