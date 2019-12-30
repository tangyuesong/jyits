inherited DialogZBEdit: TDialogZBEdit
  Width = 705
  Height = 369
  ExplicitWidth = 705
  ExplicitHeight = 369
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 705
    Height = 369
    AutoSize = True
    ExplicitWidth = 705
    ExplicitHeight = 369
    inherited btnSave: TcxButton
      Left = 271
      Top = 102
      TabOrder = 4
      OnClick = btnSaveClick
      ExplicitLeft = 271
      ExplicitTop = 102
    end
    inherited btnExit: TcxButton
      Left = 359
      Top = 102
      Caption = #20851#38381
      TabOrder = 5
      ExplicitLeft = 359
      ExplicitTop = 102
    end
    object cboType: TcxComboBox [2]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.Items.Strings = (
        #26085#24120#29677
        #26089#39640#23792
        #26202#39640#23792)
      Properties.OnChange = cboTypePropertiesChange
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object cboTime: TcxComboBox [3]
      Left = 264
      Top = 36
      AutoSize = False
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24')
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 64
    end
    object cboSwitchTime: TcxComboBox [4]
      Left = 389
      Top = 36
      AutoSize = False
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24')
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 64
    end
    object edtDD1: TcxTextEdit [5]
      Left = 490
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 110
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #29677#27425#20449#24687
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      Parent = lgBanCiAAA
      LayoutDirection = ldHorizontal
    end
    object lgBanCiAAA: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21220#21153#31867#22411
      Control = cboType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29677#27425#26102#38271
      Control = cboTime
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36718#25442#26102#38271
      Control = cboSwitchTime
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = lgBanCiAAA
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object liDD1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignVert = avClient
      CaptionOptions.Text = #22320#28857
      Control = edtDD1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lgBanCi: TdxLayoutGroup
      Parent = lgBanCiAAA
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
  end
end
