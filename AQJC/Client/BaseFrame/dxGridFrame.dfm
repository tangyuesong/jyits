inherited dxGridFrame: TdxGridFrame
  inherited dxLayoutControl2: TdxLayoutControl
    object cxGrid1: TcxGrid [0]
      Left = 13
      Top = 25
      Width = 425
      Height = 239
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
    object cbbPagesize: TcxComboBox [1]
      Left = 13
      Top = 271
      AutoSize = False
      Properties.Items.Strings = (
        '30'
        '60'
        '100'
        '500')
      Style.HotTrack = False
      TabOrder = 1
      Text = '30'
      Height = 21
      Width = 70
    end
    object btnFirstPage: TcxButton [2]
      Tag = 1
      Left = 90
      Top = 271
      Width = 30
      Height = 21
      Cursor = crHandPoint
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000003C3C
        3CFF000000000000000000000000000000001E1E1E8100000000000000000000
        0000000000001E1E1E8100000000000000000000000000000000000000003C3C
        3CFF0000000000000000000000001E1E1E813C3C3CFF00000000000000000000
        00001E1E1E813C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF00000000000000001E1E1E813C3C3CFF3C3C3CFF00000000000000001E1E
        1E813C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF000000001E1E1E813C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF1E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E813C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF1E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E3C3C3CFF3C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF000000001E1E1E7E3C3C
        3CFF3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF00000000000000001E1E1E7E3C3C3CFF3C3C3CFF00000000000000001E1E
        1E7E3C3C3CFF3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF0000000000000000000000001E1E1E7E3C3C3CFF00000000000000000000
        00001E1E1E7E3C3C3CFF00000000000000000000000000000000000000003C3C
        3CFF000000000000000000000000000000001E1E1E7E00000000000000000000
        0000000000001E1E1E7E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      OnClick = btnFirstPageClick
    end
    object btnPriorPage: TcxButton [3]
      Tag = 3
      Left = 127
      Top = 271
      Width = 30
      Height = 21
      Cursor = crHandPoint
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000001E1E
        1E81000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001E1E1E813C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1E1E813C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1E1E7E3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001E1E1E7E3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000001E1E
        1E7E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      OnClick = btnPriorPageClick
    end
    object edtPageIndex: TcxTextEdit [4]
      Left = 182
      Top = 271
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Text = '0'
      Height = 21
      Width = 52
    end
    object btnnextPage: TcxButton [5]
      Tag = 2
      Left = 259
      Top = 271
      Width = 30
      Height = 21
      Cursor = crHandPoint
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E8100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF1E1E1E81000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF1E1E1E810000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
        1E81000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF1E1E1E810000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF1E1E1E7E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
        1E7E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF1E1E1E7E0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF1E1E1E7E000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E7E00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 5
      OnClick = btnnextPageClick
    end
    object btnLastPage: TcxButton [6]
      Tag = 4
      Left = 296
      Top = 271
      Width = 30
      Height = 21
      Cursor = crHandPoint
      Caption = '>|'
      Enabled = False
      TabOrder = 6
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 250
      ControlOptions.OriginalWidth = 425
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroupPage: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItemPagesize: TdxLayoutItem
      Parent = dxLayoutGroupPage
      CaptionOptions.Visible = False
      Control = cbbPagesize
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItemFirstPage: TdxLayoutItem
      Parent = dxLayoutGroupPage
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnFirstPage
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItemPriorPage: TdxLayoutItem
      Parent = dxLayoutGroupPage
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnPriorPage
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItemIndex: TdxLayoutItem
      Parent = dxLayoutGroupPage
      CaptionOptions.Text = #31532
      Control = edtPageIndex
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 52
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItemnextPage: TdxLayoutItem
      Parent = dxLayoutGroupPage
      CaptionOptions.Text = #39029
      Control = btnnextPage
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItemBtnLastPage: TdxLayoutItem
      Parent = dxLayoutGroupPage
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Visible = False
      Control = btnLastPage
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 384
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
    Left = 424
    Top = 112
  end
  object cxdtrpstry1: TcxEditRepository
    Left = 328
    Top = 112
    object cxdtrpstry1HyperLinkItem1: TcxEditRepositoryHyperLinkItem
    end
    object cxdtrpstry1SparklineItem1: TcxEditRepositorySparklineItem
      Properties.Series = <>
    end
    object cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          ContentAlignment = taLeftJustify
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ViewStyle = vsButtonsAutoWidth
    end
  end
  object dlgSave: TsSaveDialog
    DefaultExt = '*.xls,*.xlsx,*.html,*.xml,*.txt'
    Filter = 'EXCEL|*.xls|EXCEL|*.xlsx|HTML|*.html|XML|*.xml|TEXT|*.txt'
    Title = #23548#20986#25968#25454
    Left = 293
    Top = 112
  end
  object actlst1: TActionList
    Left = 256
    Top = 112
    object actnew: TAction
      Caption = 'act1'
    end
    object actedit: TAction
      Caption = 'actedit'
    end
    object actdelete: TAction
      Caption = 'actdelete'
    end
    object actView: TAction
      Caption = 'actView'
    end
  end
end
