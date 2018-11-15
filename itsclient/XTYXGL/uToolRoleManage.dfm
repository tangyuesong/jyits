inherited ToolRoleManage: TToolRoleManage
  Width = 804
  Height = 532
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 0
    Width = 804
    Height = 532
    ExplicitTop = 0
    ExplicitHeight = 305
    inherited cxGrid1: TcxGrid
      Top = 113
      Width = 778
      Height = 406
      TabOrder = 8
      ExplicitTop = 113
      ExplicitWidth = 778
      ExplicitHeight = 406
    end
    object BtnInput: TcxButton [1]
      Left = 761
      Top = 13
      Width = 30
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = BtnInputClick
    end
    inherited cbbPagesize: TcxComboBox
      Top = 57
      ExplicitTop = 57
    end
    inherited btnFirstPage: TcxButton
      Top = 57
      ExplicitTop = 57
    end
    inherited btnPriorPage: TcxButton
      Top = 57
      ExplicitTop = 57
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 57
      ExplicitTop = 57
    end
    inherited btnnextPage: TcxButton
      Top = 57
      ExplicitTop = 57
    end
    inherited btnLastPage: TcxButton
      Top = 57
      ExplicitTop = 57
    end
    inherited lbCount: TcxLabel
      Top = 85
      ExplicitTop = 85
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
      Index = 1
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Index = 4
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahRight
      CaptionOptions.Visible = False
      Control = BtnInput
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  inline fRoleEdit: TFrameRoleEdit [1]
    Left = 0
    Top = 50
    Width = 600
    Height = 500
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    ExplicitTop = 50
    ExplicitWidth = 600
    ExplicitHeight = 500
    inherited dxLayoutControl2: TdxLayoutControl
      Width = 600
      Height = 500
      ExplicitWidth = 600
      ExplicitHeight = 500
      inherited edtRole: TcxTextEdit
        Left = 387
        ExplicitLeft = 387
      end
      inherited btnSave: TcxButton
        Left = 415
        Top = 447
        OnClick = btnSaveClick
        ExplicitLeft = 415
        ExplicitTop = 447
      end
      inherited btnCanel: TcxButton
        Left = 497
        Top = 447
        OnClick = btnCanelClick
        ExplicitLeft = 497
        ExplicitTop = 447
      end
      inherited Memobz: TcxMemo
        Left = 387
        ExplicitLeft = 387
      end
      inherited tlFunction: TcxTreeList
        Width = 298
        Height = 436
        Bands = <
          item
          end
          item
            Visible = False
          end>
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Headers = False
        ExplicitWidth = 298
        ExplicitHeight = 436
        inherited tlFunctionColumn2: TcxTreeListColumn
          Options.Footer = False
          Options.Editing = False
          Width = 209
        end
        inherited tlFunctionColumn3: TcxTreeListColumn
          Visible = False
        end
      end
    end
  end
  inline fRoleUserEdit: TFrameRoleUserEdit [2]
    Left = 0
    Top = 400
    Width = 750
    Height = 569
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    ExplicitTop = 400
    ExplicitWidth = 750
    inherited dxLayoutControl2: TdxLayoutControl
      Width = 750
      ExplicitWidth = 617
      inherited cxGrid1: TcxGrid
        Width = 694
        ExplicitWidth = 694
        inherited GridView: TcxGridDBTableView
          inherited GridViewColumn1: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
      inherited btnSave: TcxButton
        Left = 296
        OnClick = fRoleUserEditbtnSaveClick
        ExplicitLeft = 296
      end
      inherited btnCancel: TcxButton
        Left = 378
        OnClick = btnCancelClick
        ExplicitLeft = 378
      end
    end
  end
  inherited DataSource1: TDataSource [3]
  end
  inherited FDMemTable1: TFDMemTable [4]
  end
  inherited cxdtrpstry1: TcxEditRepository [5]
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
          Kind = bkGlyph
        end>
    end
  end
  inherited dlgSave: TsSaveDialog [6]
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
  end
  inherited dxBarManager1: TdxBarManager
    Left = 208
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
          ItemName = 'btnUser'
        end>
      Visible = False
    end
    object btnAdd: TdxBarLargeButton
      Caption = #35282#33394#28155#21152
      Category = 0
      Hint = #35282#33394#28155#21152
      Visible = ivAlways
      OnClick = btnAddClick
      LargeImageIndex = 158
    end
    object btnModify: TdxBarLargeButton
      Caption = #35282#33394#20462#25913
      Category = 0
      Hint = #35282#33394#20462#25913
      Visible = ivAlways
      OnClick = btnModifyClick
      LargeImageIndex = 1806
    end
    object btnDel: TdxBarLargeButton
      Caption = #35282#33394#21024#38500
      Category = 0
      Hint = #35282#33394#21024#38500
      Visible = ivAlways
      OnClick = btnDelClick
      LargeImageIndex = 802
    end
    object btnUser: TdxBarLargeButton
      Caption = #29992#25143#20998#37197
      Category = 0
      Hint = #29992#25143#20998#37197
      Visible = ivAlways
      OnClick = btnUserClick
      LargeImageIndex = 430
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 208
    Top = 136
  end
end
