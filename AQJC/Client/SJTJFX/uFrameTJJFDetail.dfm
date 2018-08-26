inherited FrameTJJFDetail: TFrameTJJFDetail
  Width = 860
  ExplicitWidth = 860
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 860
    ExplicitWidth = 860
    inherited btnSave: TcxButton
      Left = 348
      TabOrder = 1
      ExplicitLeft = 348
    end
    inherited btnExit: TcxButton
      Left = 436
      TabOrder = 2
      ExplicitLeft = 436
    end
    object cxGrid1: TcxGrid [2]
      Left = 28
      Top = 36
      Width = 804
      Height = 395
      TabOrder = 0
      object GridView: TcxGridDBTableView
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
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = #27809#26377#25968#25454
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupByBox = False
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GridView
      end
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 239
      ControlOptions.OriginalWidth = 425
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 344
    Top = 112
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 432
    Top = 112
  end
end
