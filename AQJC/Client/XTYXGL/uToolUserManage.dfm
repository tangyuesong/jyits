inherited ToolUserManage: TToolUserManage
  Width = 836
  Height = 499
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 836
    Height = 499
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 810
      Height = 385
      TabOrder = 5
      ExplicitTop = 45
      ExplicitWidth = 810
      ExplicitHeight = 385
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
      Left = 793
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
      Top = 437
      TabOrder = 6
      ExplicitTop = 437
    end
    inherited btnFirstPage: TcxButton
      Top = 437
      TabOrder = 7
      ExplicitTop = 437
    end
    inherited btnPriorPage: TcxButton
      Top = 437
      TabOrder = 8
      ExplicitTop = 437
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 437
      TabOrder = 9
      ExplicitTop = 437
    end
    inherited btnnextPage: TcxButton
      Top = 437
      TabOrder = 10
      ExplicitTop = 437
    end
    inherited btnLastPage: TcxButton
      Top = 437
      TabOrder = 11
      ExplicitTop = 437
    end
    inherited lbCount: TcxLabel
      Top = 465
      ExplicitTop = 465
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
      inherited edtYhbh: TcxTextEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtYhxm: TcxTextEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtYhmm: TcxTextEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtSfzh: TcxTextEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtSjhm: TcxTextEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited cbbYhzw: TcxComboBox
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtMac: TcxTextEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtQsip: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited cbbSH: TcxComboBox
        ExplicitWidth = 238
        Width = 238
      end
      inherited edtJsip: TcxTextEdit
        ExplicitWidth = 263
        Width = 263
      end
      inherited dtValidDate: TcxDateEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited dtPasswordValidDate: TcxDateEdit
        ExplicitWidth = 238
        Width = 238
      end
      inherited dtLoginTimeBegin: TcxTimeEdit
        ExplicitWidth = 115
        Width = 115
      end
      inherited dtLoginTimeEnd: TcxTimeEdit
        Left = 227
        ExplicitLeft = 227
      end
      inherited cbbDwdm: TcxComboBox
        ExplicitWidth = 238
        Width = 238
      end
      inherited cbManage: TcxCheckBox
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.SkinName = ''
      end
      inherited cbMJ: TcxCheckBox
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.SkinName = ''
      end
      inherited cbMM: TcxCheckBox
        Style.LookAndFeel.SkinName = ''
        StyleDisabled.LookAndFeel.SkinName = ''
        StyleFocused.LookAndFeel.SkinName = ''
        StyleHot.LookAndFeel.SkinName = ''
        ExplicitWidth = 182
      end
      inherited btnSave: TcxButton
        Left = 98
        OnClick = btnSaveClick
        ExplicitLeft = 98
      end
      inherited btnExit: TcxButton
        Left = 186
        OnClick = btnExitClick
        ExplicitLeft = 186
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
            00030000000C0000001300000015000000150000001600000016000000170000
            00170000001800000018000000170000000F0000000400000000000000000000
            000B2C517EC33C6BACFF3967A7FF3762A2FF345E9EFF335999FF315595FF2E51
            90FF2C4D8CFF2A4A88FF2A4685FF1D305DC70000000F00000000000000000000
            000F4176B5FF8DDDFEFF52C9FEFF4AC4FEFF40BEFDFF44C2FDFF60CFFEFF55CC
            FEFF2BB3FCFF19A8FCFF12A4FBFF294786FF0000001500000000000000000000
            000E437BBBFFA1E5FFFF5ED0FFFF57CCFFFF4BAAD3FF405357FF3C5156FF55AD
            D3FF2DB6FFFF26B0FEFF1DA9FCFF2C4B8AFF0000001400000000000000000000
            000D4680C0FFB4EBFFFF6BD7FFFF63D4FFFF5BCFFFFF48707DFF436D7CFF55CA
            FFFF3ABCFFFF31B9FFFF28B2FCFF2E5090FF0000001300000000000000000000
            000B4884C5FFC5F2FFFF78DDFFFF70D8FFFF69D5FFFF57A3BFFF529FBFFF78D9
            FFFF47C4FFFF3FBFFFFF35BAFDFF305594FF0000001100000000000000000000
            000A4A88C8FFD4F6FFFF81E3FFFF7CDFFFFF74DCFFFF527177FF4F6F76FF7CDB
            FFFF54CBFFFF4CC7FFFF43BFFDFF335B9AFF0000000F00000000000000000000
            00084C8BCBFFE0F9FFFF8CE6FFFF85E4FFFF7EE1FFFF5F8C95FF5B8995FF69D8
            FFFF62D2FFFF5ACFFFFF4FC7FDFF36609FFF0000000E00000000000000000000
            00064C8CCCFFE7FBFFFFE4FAFFFFDFF9FFFFD8F7FFFFD1F4FFFFC8F2FFFFBFEE
            FFFFB4EBFFFFA8E7FFFF99E0FDFF3966A5FF0000000C00000000000000000000
            0003386897C44C8CCCFF4C8CCCFF4B8ACAFF4A87C7FF4884C4FF4681C0FF447D
            BCFF4279B9FF4075B4FF3E70B0FF2C507FC80000000700000000000000000000
            000100000012564B3EFFD0CCC8FF665B4EFF0000001B00000007000000080000
            001F726A5FFFB6AFA9FF4B3F30FF0000001C0000000200000000000000000000
            00000000000D5E5447F3D8D3CFFF6D6256FF16130F5600000008000000091713
            105A6F6557FFB6AEA5FF4B3F31F4000000150000000000000000000000000000
            000000000008585046CBB9B3ACFFA0988FFF3D352BBA1613105616130F583A31
            28BC91877DFF958C81FF3E352ACE0000000E0000000000000000000000000000
            000000000003211F1C4D999187FDC3BEB8FFA19990FF72675BFF6F6557FF9289
            7FFFACA59DFF766C60FE14110E53000000050000000000000000000000000000
            00000000000000000005433F3A839E958CFFBDB7B0FFD9D5D1FFD6D2CDFFAFA8
            A0FF7E7569FF2B261F890000000A000000010000000000000000000000000000
            000000000000000000010000000524211F4A5B554CB96B6256E75B5144E8453D
            34BA1815124E0000000800000001000000000000000000000000}
          Hint = #35299#38500#38145#23450
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
