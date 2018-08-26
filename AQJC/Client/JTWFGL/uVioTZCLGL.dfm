inherited fVioTZCLGL: TfVioTZCLGL
  Width = 611
  Height = 485
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 611
    Height = 485
    ExplicitTop = 0
    ExplicitHeight = 305
    object btnSearch: TcxButton [0]
      Left = 401
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object edthphm: TcxTextEdit [1]
      Left = 142
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 80
    end
    object Chk1: TcxCheckBox [2]
      Left = 336
      Top = 13
      Caption = #24453#23457#26680
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 3
      Transparent = True
    end
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 585
      Height = 399
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 585
      ExplicitHeight = 399
    end
    object cbbhpzl: TcxComboBox [4]
      Left = 229
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 100
    end
    object cbbJC: TcxComboBox [5]
      Left = 67
      Top = 13
      AutoSize = False
      Properties.Sorted = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 68
    end
    object Btnadd: TcxButton [6]
      Left = 568
      Top = 13
      Width = 30
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 5
      OnClick = BtnaddClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 451
      TabOrder = 7
      ExplicitTop = 451
    end
    inherited btnFirstPage: TcxButton
      Top = 451
      TabOrder = 8
      ExplicitTop = 451
    end
    inherited btnPriorPage: TcxButton
      Top = 451
      TabOrder = 9
      ExplicitTop = 451
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 451
      TabOrder = 10
      ExplicitTop = 451
    end
    inherited btnnextPage: TcxButton
      Top = 451
      TabOrder = 11
      ExplicitTop = 451
    end
    inherited btnLastPage: TcxButton
      Top = 451
      TabOrder = 12
      ExplicitTop = 451
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 80
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = Chk1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 58
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = cbbhpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 68
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = Btnadd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
  inline FrameWmd1: TFrameWmd [1]
    Left = 0
    Top = 100
    Width = 753
    Height = 409
    AutoSize = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnResize = FrameResize
    ExplicitTop = 100
    inherited dxLayoutControl2: TdxLayoutControl
      inherited btnSave: TcxButton
        OnClick = btnSaveClick
      end
      inherited btnExit: TcxButton
        OnClick = cxButton2Click
      end
      inherited cbbSYFW: TcxComboBox
        Properties.Items.Strings = (
          '1:'#25152#26377
          '2:'#36829#27861
          '3:'#36807#36710
          '4:'#32521#26597)
      end
      inherited cbbYJ: TcxComboBox
        Properties.Items.Strings = (
          '3:'#21516#24847
          '7:'#19981#21516#24847)
      end
      inherited edthphm: TcxTextEdit
        Properties.CharCase = ecUpperCase
      end
    end
  end
  inherited DataSource1: TDataSource [2]
    Left = 416
    Top = 184
  end
  inherited FDMemTable1: TFDMemTable [3]
    StoreDefs = True
    Left = 536
    Top = 192
  end
  inherited cxdtrpstry1: TcxEditRepository [4]
    Top = 192
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
          Hint = #23457#26680
          Kind = bkGlyph
        end>
    end
  end
  inherited dlgSave: TsSaveDialog [5]
  end
  inherited actlst1: TActionList [6]
    inherited actnew: TAction
      Hint = 'bbb'
      OnExecute = actnewExecute
    end
    inherited actedit: TAction
      Hint = 'aaaaa'
      OnExecute = acteditExecute
    end
    inherited actdelete: TAction
      Hint = 'sds'
      OnExecute = actdeleteExecute
    end
    inherited actView: TAction
      Hint = 'ggfg'
    end
  end
  inherited dxBarManager1: TdxBarManager
    Left = 184
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
          ItemName = 'btnDel'
        end
        item
          Visible = True
          ItemName = 'btnCheck'
        end>
      Visible = False
    end
    object btnInput: TdxBarLargeButton
      Caption = #29305#25209#24405#20837
      Category = 0
      Hint = #29305#25209#24405#20837
      Visible = ivAlways
      OnClick = btnInputClick
      LargeImageIndex = 158
    end
    object btnUpdate: TdxBarLargeButton
      Caption = #29305#25209#20462#25913
      Category = 0
      Hint = #29305#25209#20462#25913
      Visible = ivAlways
      OnClick = btnUpdateClick
      LargeImageIndex = 1806
    end
    object btnDel: TdxBarLargeButton
      Caption = #29305#25209#21024#38500
      Category = 0
      Hint = #29305#25209#21024#38500
      Visible = ivAlways
      OnClick = btnDelClick
      LargeImageIndex = 802
    end
    object btnCheck: TdxBarLargeButton
      Caption = #29305#25209#23457#26680
      Category = 0
      Hint = #29305#25209#23457#26680
      Visible = ivAlways
      OnClick = btnCheckClick
      LargeImageIndex = 1103
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 472
    Top = 184
  end
end
