inherited dxImportDialog: TdxImportDialog
  Height = 400
  ExplicitHeight = 400
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 400
    ExplicitHeight = 400
    inherited btnSave: TcxButton
      Top = 351
      TabOrder = 3
      OnClick = btnSaveClick
      ExplicitTop = 351
    end
    inherited btnExit: TcxButton
      Top = 351
      TabOrder = 4
      OnClick = btnExitClick
      ExplicitTop = 351
    end
    object cxGrid1: TcxGrid [2]
      Left = 20
      Top = 56
      Width = 570
      Height = 275
      TabOrder = 2
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
        Navigator.Visible = True
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssHorizontal
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupByBox = False
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GridView
      end
    end
    object btnBrower: TcxButton [3]
      Left = 515
      Top = 24
      Width = 75
      Height = 25
      Caption = #27983#35272
      TabOrder = 1
      OnClick = btnBrowerClick
    end
    object edtFile: TcxTextEdit [4]
      Left = 74
      Top = 24
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 434
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 166
      ControlOptions.OriginalWidth = 653
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnBrower
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      CaptionOptions.Text = #23548#20837#25991#20214
      Control = edtFile
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 488
    Top = 72
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 288
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 160
    Top = 192
  end
end
