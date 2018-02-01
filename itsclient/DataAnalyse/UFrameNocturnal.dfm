inherited FrameNocturnal: TFrameNocturnal
  Width = 950
  Height = 588
  ExplicitWidth = 950
  ExplicitHeight = 588
  object sPanel2: TsPanel [0]
    Left = 0
    Top = 0
    Width = 950
    Height = 588
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object spnl1: TsPanel
      Left = 0
      Top = 0
      Width = 950
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = cl3DLight
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        950
        41)
      object dterq: TsDateEdit
        Left = 68
        Top = 8
        Width = 101
        Height = 19
        AutoSize = False
        EditMask = '!9999/99/99;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '    /  /  '
        BoundLabel.Active = True
        BoundLabel.Caption = #20219#21153#26102#38388':'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object dterq2: TsDateEdit
        Left = 197
        Top = 8
        Width = 105
        Height = 20
        AutoSize = False
        EditMask = '!9999/99/99;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '    /  /  '
        BoundLabel.Active = True
        BoundLabel.Caption = '-   '
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object btnSearch: TsButton
        Left = 308
        Top = 6
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = btnSearchClick
      end
      object btnAdd: TsButton
        Left = 707
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #28155#21152#20219#21153
        TabOrder = 3
        OnClick = btnAddClick
      end
      object btnDelete: TsButton
        Left = 788
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #21024#38500#20219#21153
        TabOrder = 4
        OnClick = btnDeleteClick
      end
      object btnRuleManage: TsButton
        Left = 868
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #35268#21017#31649#29702
        TabOrder = 5
        OnClick = btnRuleManageClick
      end
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 41
      Width = 950
      Height = 547
      Align = alClient
      TabOrder = 1
      LockedStateImageOptions.ShowText = True
      LookAndFeel.NativeStyle = False
      object GridViewTask: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = DataSourceTask
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        DataController.OnDetailExpanding = GridViewTaskDataControllerDetailExpanding
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object GridViewResult: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSourceResult
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
      end
      object cxGridLevel1: TcxGridLevel
        GridView = GridViewTask
        object cxGrid1Level2: TcxGridLevel
          GridView = GridViewResult
        end
      end
    end
  end
  object sGroupBox1: TsGroupBox [1]
    Left = 36
    Top = 63
    Width = 397
    Height = 169
    Caption = #28155#21152#20219#21153
    TabOrder = 1
    Visible = False
    object sDateEdit1: TsDateEdit
      Left = 86
      Top = 47
      Width = 277
      Height = 22
      AutoSize = False
      EditMask = '!9999/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    /  /  '
      BoundLabel.Active = True
      BoundLabel.Caption = #24320#22987#26102#38388':'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object sDateEdit2: TsDateEdit
      Left = 86
      Top = 75
      Width = 277
      Height = 22
      AutoSize = False
      EditMask = '!9999/99/99;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '    /  /  '
      BoundLabel.Active = True
      BoundLabel.Caption = #32467#26463#26102#38388':'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object btnCancel: TsButton
      Left = 207
      Top = 130
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnOK: TsButton
      Left = 126
      Top = 130
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 3
      OnClick = btnOKClick
    end
    object edtName: TsEdit
      Left = 86
      Top = 103
      Width = 277
      Height = 21
      TabOrder = 4
      BoundLabel.Active = True
      BoundLabel.Caption = #20219#21153#21517#31216':'
    end
    object sComboBoxEx3: TsComboBoxEx
      Left = 86
      Top = 19
      Width = 277
      Height = 22
      BoundLabel.Active = True
      BoundLabel.Caption = #35268#21017':'
      ItemsEx = <
        item
          Caption = #24120#35268#26172#20239#22812#20986
        end
        item
          Caption = #36830#32493#24615#26172#20239#22812#20986
        end
        item
          Caption = #25351#23450#26085#26399#26172#20239#22812#20986
        end>
      ItemIndex = 0
      TabOrder = 5
      Text = #24120#35268#26172#20239#22812#20986
    end
  end
  object sGroupBox2: TsGroupBox [2]
    Left = 259
    Top = 95
    Width = 669
    Height = 406
    Caption = #35268#21017#31649#29702
    TabOrder = 2
    Visible = False
    object cxGrid2: TcxGrid
      Left = 2
      Top = 57
      Width = 665
      Height = 347
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object GridViewRule: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSourceRule
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = GridViewRule
      end
    end
    object sPanel1: TsPanel
      Left = 2
      Top = 15
      Width = 665
      Height = 42
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        665
        42)
      object btnAddRule: TsButton
        Left = 413
        Top = 6
        Width = 75
        Height = 25
        Caption = #28155#21152#35268#21017
        TabOrder = 0
        OnClick = btnAddRuleClick
      end
      object btnClose: TsButton
        Left = 579
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #20851#38381
        TabOrder = 1
        OnClick = btnCloseClick
      end
      object sTimePicker1: TsTimePicker
        Left = 50
        Top = 8
        Width = 71
        Height = 21
        TabOrder = 2
        Text = '00:00:00'
        BoundLabel.Active = True
        BoundLabel.Caption = #26172#26102
      end
      object sTimePicker2: TsTimePicker
        Left = 136
        Top = 8
        Width = 71
        Height = 21
        TabOrder = 3
        Text = '00:00:00'
        BoundLabel.Active = True
        BoundLabel.Caption = '-'
      end
      object edtRuleName: TsEdit
        Left = 250
        Top = 8
        Width = 157
        Height = 21
        TabOrder = 4
        BoundLabel.Active = True
        BoundLabel.Caption = #21517#31216
      end
    end
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 872
    Top = 176
  end
  object FDQueryTask: TFDQuery
    Connection = DM.conServer
    Left = 775
    Top = 247
  end
  object DataSourceTask: TDataSource
    DataSet = FDQueryTask
    Left = 876
    Top = 248
  end
  object DataSourceResult: TDataSource
    DataSet = FDQueryResult
    Left = 876
    Top = 296
  end
  object FDQueryResult: TFDQuery
    Connection = DM.conServer
    Left = 775
    Top = 295
  end
  object FDQueryRule: TFDQuery
    Connection = DM.conServer
    Left = 503
    Top = 359
  end
  object DataSourceRule: TDataSource
    DataSet = FDQueryRule
    Left = 604
    Top = 360
  end
end
