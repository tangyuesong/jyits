inherited ToolUserManage: TToolUserManage
  Width = 816
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 816
    Height = 305
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 790
      Height = 219
      TabOrder = 5
      ExplicitTop = 45
      ExplicitWidth = 790
      ExplicitHeight = 219
    end
    object edtYhbh: TcxTextEdit [1]
      Left = 228
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 100
    end
    object edtYhxm: TcxTextEdit [2]
      Left = 389
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 100
    end
    object btnSearch: TcxButton [3]
      Left = 496
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object edtDwdm: TcxTextEdit [4]
      Left = 67
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 100
    end
    object BtnInput: TcxButton [5]
      Left = 773
      Top = 13
      Width = 30
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 4
      OnClick = BtnInputClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 271
      TabOrder = 6
      ExplicitTop = 271
    end
    inherited btnFirstPage: TcxButton
      Top = 271
      TabOrder = 7
      ExplicitTop = 271
    end
    inherited btnPriorPage: TcxButton
      Top = 271
      TabOrder = 8
      ExplicitTop = 271
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 271
      TabOrder = 9
      ExplicitTop = 271
    end
    inherited btnnextPage: TcxButton
      Top = 271
      TabOrder = 10
      ExplicitTop = 271
    end
    inherited btnLastPage: TcxButton
      Top = 271
      TabOrder = 11
      ExplicitTop = 271
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #29992#25143#32534#21495
      Control = edtYhbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = #29992#25143#22995#21517
      Control = edtYhxm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21333#20301#20195#30721
      Control = edtDwdm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = BtnInput
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  inline fUserEdit: TfDialogUserEdit [1]
    Left = 0
    Top = 100
    Width = 377
    Height = 435
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    ExplicitTop = 100
    ExplicitWidth = 377
    ExplicitHeight = 435
    inherited dxLayoutControl2: TdxLayoutControl
      Width = 377
      Height = 435
      ExplicitWidth = 377
      ExplicitHeight = 435
      inherited btnSave: TcxButton
        Left = 107
        Top = 382
        OnClick = btnSaveClick
        ExplicitLeft = 107
        ExplicitTop = 382
      end
      inherited btnExit: TcxButton
        Left = 195
        Top = 382
        OnClick = btnExitClick
        ExplicitLeft = 195
        ExplicitTop = 382
      end
      inherited edtYhbh: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtYhxm: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtYhmm: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtSfzh: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtSjhm: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited cbbYhzw: TcxComboBox
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtMac: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtQsip: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited edtJsip: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited cbbDwdm: TcxComboBox
        ExplicitWidth = 263
        Width = 263
      end
      inherited cbManage: TcxCheckBox
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.SkinName = ''
      end
    end
  end
  inline fSetUserRole: TFrameSetUserRole [2]
    Left = 0
    Top = 50
    Width = 676
    Height = 584
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    ExplicitTop = 50
    ExplicitHeight = 584
    inherited dxLayoutControl2: TdxLayoutControl
      Height = 584
      ExplicitHeight = 584
      inherited btnSave: TcxButton
        Top = 531
        OnClick = fSetUserRolebtnSaveClick
        ExplicitTop = 531
      end
      inherited btnCancel: TcxButton
        Top = 531
        OnClick = btnCancelClick
        ExplicitTop = 531
      end
      inherited tlFunction: TcxTreeList
        Height = 488
        ExplicitHeight = 488
        inherited tlFunctionColumn2: TcxTreeListColumn
          Width = 200
        end
      end
      inherited lvOtherRole: TcxListView
        Top = 364
        ExplicitTop = 364
      end
      inherited lvMineRole: TcxListView
        Height = 258
        Align = alClient
        ExplicitHeight = 258
      end
    end
  end
  inline fSetUserDataRole: TFrameSetUserDataRole [3]
    Left = 0
    Top = 200
    Width = 676
    Height = 519
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
    ExplicitTop = 200
    inherited dxLayoutControl2: TdxLayoutControl
      inherited btnSave: TcxButton
        OnClick = fSetUserDataRolebtnSaveClick
      end
      inherited btnCancel: TcxButton
        OnClick = fSetUserDataRolebtnCancelClick
      end
      inherited lvMineRole: TcxListView
        StyleDisabled.BorderStyle = cbsNone
      end
    end
  end
  inherited DataSource1: TDataSource [4]
  end
  inherited FDMemTable1: TFDMemTable [5]
  end
  inherited cxdtrpstry1: TcxEditRepository [6]
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
          Hint = #21151#33021#26435#38480
          Kind = bkGlyph
        end
        item
          Action = actView
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000003C3C3CFF1E1E1E7E0000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000030303101212125A1F1F1F9A000000001E1E1E7E000000001E1E
            1E811E1E1E810000000000000000000000000000000000000000000000000000
            00000A0A0A32212121A5333333FF333333FF0D0D0D41000000001E1E1E813C3C
            3CFF3C3C3CFF1E1E1E8100000000000000000000000000000000000000000000
            00001F1F1F9C333333FF333333FF333333FF333333FF0D0D0D401E1E1E7E3C3C
            3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
            0000303030EE2D2D2DE01F1F1F9A1313135E0909092D01010106000000001E1E
            1E7E3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E810000000000000000000000000000
            0000141414660F0F0F491212125A1F1F1F9A292929CE303030F21818187A0000
            00001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E8100000000000000000000
            00000B0B0B36212121A5333333FF333333FF333333FF333333FF333333FF1A1A
            1A81000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF1A1A1A70000000000000
            00001F1F1F9C333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF1A1A1A81000000001E1E1E7E3C3C3CFF3C3C3CFF353535E0000000000000
            0000303030EE2D2D2DE01F1F1F9A1313135E0909092D0202020C0202020C0909
            092D1313135E1010104E000000001A1A1A70353535E01A1A1A70000000000000
            0000141414660F0F0F491212125A1F1F1F9A292929CE303030F2303030F22929
            29CE1F1F1F9A1212125A080808290202020C0000000000000000000000000000
            00000B0B0B36212121A5333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF212121A50B0B0B360000000000000000000000000000
            00001F1F1F9C333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF1F1F1F9C0000000000000000000000000000
            0000303030EE333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF303030EE0000000000000000000000000000
            00001F1F1F9C333333FF333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF333333FF1F1F1F9C0000000000000000000000000000
            00000A0A0A32212121A5333333FF333333FF333333FF333333FF333333FF3333
            33FF333333FF333333FF212121A50A0A0A320000000000000000000000000000
            000000000000030303101212125A1F1F1F9A292929CE303030F2303030F22929
            29CE1F1F1F9A1212125A03030310000000000000000000000000}
          Hint = #25968#25454#26435#38480
          Kind = bkGlyph
        end>
    end
  end
  inherited actlst1: TActionList
    inherited actnew: TAction
      OnExecute = actnewExecute
    end
    inherited actedit: TAction
      OnExecute = acteditExecute
    end
    inherited actdelete: TAction
      OnExecute = actdeleteExecute
    end
    inherited actView: TAction
      OnExecute = actViewExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
    Left = 200
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxBarManager1Bar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnAdd'
        end
        item
          Visible = True
          ItemName = 'btnModify'
        end
        item
          Visible = True
          ItemName = 'btnDel'
        end
        item
          Visible = True
          ItemName = 'btnFunction'
        end
        item
          Visible = True
          ItemName = 'btnData'
        end>
      Visible = False
    end
    object btnAdd: TdxBarLargeButton
      Caption = #29992#25143#28155#21152
      Category = 0
      Hint = #29992#25143#28155#21152
      Visible = ivAlways
      OnClick = btnAddClick
      LargeImageIndex = 158
    end
    object btnModify: TdxBarLargeButton
      Caption = #29992#25143#20462#25913
      Category = 0
      Hint = #29992#25143#20462#25913
      Visible = ivAlways
      OnClick = btnModifyClick
      LargeImageIndex = 1806
    end
    object btnDel: TdxBarLargeButton
      Caption = #29992#25143#21024#38500
      Category = 0
      Hint = #29992#25143#21024#38500
      Visible = ivAlways
      OnClick = btnDelClick
      LargeImageIndex = 802
    end
    object btnFunction: TdxBarLargeButton
      Caption = #21151#33021#35282#33394
      Category = 0
      Hint = #21151#33021#35282#33394
      Visible = ivAlways
      OnClick = btnFunctionClick
      LargeImageIndex = 1362
    end
    object btnData: TdxBarLargeButton
      Caption = #25968#25454#35282#33394
      Category = 0
      Hint = #25968#25454#35282#33394
      Visible = ivAlways
      OnClick = btnDataClick
      LargeImageIndex = 1365
    end
  end
end
