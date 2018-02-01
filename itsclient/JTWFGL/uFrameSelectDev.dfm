inherited FrameSelectDev: TFrameSelectDev
  Width = 700
  Height = 500
  ExplicitWidth = 700
  ExplicitHeight = 500
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 700
    Height = 500
    ExplicitWidth = 700
    ExplicitHeight = 500
    inherited btnSave: TcxButton
      Left = 268
      Top = 447
      TabOrder = 1
      ExplicitLeft = 268
      ExplicitTop = 447
    end
    inherited btnExit: TcxButton
      Left = 356
      Top = 447
      TabOrder = 2
      ExplicitLeft = 356
      ExplicitTop = 447
    end
    object cxGrid1: TcxGrid [2]
      Left = 28
      Top = 36
      Width = 644
      Height = 391
      TabOrder = 0
      LookAndFeel.SkinName = 'Office2013White'
      object tvDev: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        FindPanel.DisplayMode = fpdmAlways
        FindPanel.InfoText = #36755#20837#26597#25214#20851#38190#23383'...'
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        object tvDevColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'bj'
          Options.Filtering = False
          Width = 47
          IsCaptionAssigned = True
        end
        object tvDevColumn2: TcxGridDBColumn
          Caption = #36829#27861#22320#28857
          DataBinding.FieldName = 'WFDD'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 187
        end
        object tvDevColumn3: TcxGridDBColumn
          Caption = #36829#27861#22320#28857#21517#31216
          DataBinding.FieldName = 'SBDDMC'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 313
        end
        object ColWfxw: TcxGridDBColumn
          Caption = #36829#27861#34892#20026
          DataBinding.FieldName = 'WFXW'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 187
        end
        object tvDevColumn4: TcxGridDBColumn
          Caption = #25968#37327
          DataBinding.FieldName = 'C1'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 111
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = tvDev
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #36873#25321#35774#22791
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 250
      ControlOptions.OriginalWidth = 425
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object tb: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 424
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = tb
    Left = 384
    Top = 112
  end
end
