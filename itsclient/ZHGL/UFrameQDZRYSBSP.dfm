inherited FrameQDZRYSBSP: TFrameQDZRYSBSP
  Width = 751
  Height = 481
  Align = alNone
  ExplicitWidth = 751
  ExplicitHeight = 481
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 751
    Height = 481
    ExplicitWidth = 751
    ExplicitHeight = 481
    object btnAdd: TcxButton [0]
      Tag = 4
      Left = 695
      Top = 36
      Width = 28
      Height = 25
      OptionsImage.ImageIndex = 42
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = btnAddClick
    end
    object BtnRY: TcxButton [1]
      Left = 28
      Top = 36
      Width = 25
      Height = 25
      Hint = #20154#21592#31649#29702#13#10
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = BtnRYClick
    end
    object BtnSP: TcxButton [2]
      Tag = 1
      Left = 60
      Top = 36
      Width = 25
      Height = 25
      Hint = #35270#39057#31649#29702
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      OnClick = BtnSPClick
    end
    object BtnSB: TcxButton [3]
      Tag = 2
      Left = 92
      Top = 36
      Width = 25
      Height = 25
      Hint = #35774#22791#31649#29702
      OptionsImage.ImageIndex = 24
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      OnClick = BtnSBClick
    end
    object BtnExit: TcxButton [4]
      Tag = 3
      Left = 124
      Top = 36
      Width = 25
      Height = 25
      Hint = #36820#22238
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 4
      OnClick = BtnExitClick
    end
    object cxGrid1: TcxGrid [5]
      Left = 28
      Top = 68
      Width = 695
      Height = 385
      TabOrder = 5
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
        FindPanel.DisplayMode = fpdmAlways
        FindPanel.InfoText = #36755#20837#26597#25214#20851#38190#23383'...'
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
      object cxGrid1DBLayoutView1: TcxGridDBLayoutView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.NoDataToDisplayInfoText = #27809#26377#25968#25454
        OptionsView.MinValueWidth = 200
        object sfzhm: TcxGridDBLayoutViewItem
          Caption = #36523#20221#35777
          DataBinding.FieldName = 'sfzhm'
          LayoutItem = cxGrid1DBLayoutView1LayoutItem1
        end
        object xm: TcxGridDBLayoutViewItem
          Caption = #22995#21517
          DataBinding.FieldName = 'xm'
          LayoutItem = cxGrid1DBLayoutView1LayoutItem2
        end
        object xl: TcxGridDBLayoutViewItem
          Caption = #23398#21382
          DataBinding.FieldName = 'xl'
          LayoutItem = cxGrid1DBLayoutView1LayoutItem4
        end
        object dw: TcxGridDBLayoutViewItem
          Caption = #21333#20301
          DataBinding.FieldName = 'dw'
          LayoutItem = cxGrid1DBLayoutView1LayoutItem5
        end
        object lxdz: TcxGridDBLayoutViewItem
          Caption = #21333#20301
          DataBinding.FieldName = 'lxdz'
          LayoutItem = cxGrid1DBLayoutView1LayoutItem7
        end
        object lxfs: TcxGridDBLayoutViewItem
          Caption = #25163#26426
          DataBinding.FieldName = 'lxfs'
          LayoutItem = cxGrid1DBLayoutView1LayoutItem8
        end
        object btninfo: TcxGridDBLayoutViewItem
          Caption = 'd'
          RepositoryItem = cxdtrpstry1ButtonItem1
          LayoutItem = cxGrid1DBLayoutView1LayoutItem9
          Options.ShowEditButtons = isebAlways
        end
        object btnimage: TcxGridDBLayoutViewItem
          Caption = 'btnimage'
          RepositoryItem = cxdtrpstry1ButtonItem2
          LayoutItem = cxGrid1DBLayoutView1LayoutItem10
          Options.ShowEditButtons = isebAlways
        end
        object tp1: TcxGridDBLayoutViewItem
          DataBinding.FieldName = 'tp1'
          RepositoryItem = cxdtrpstry1ImageItem1
          LayoutItem = cxGrid1DBLayoutView1LayoutItem11
        end
        object cxGrid1DBLayoutView1Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = 'Template Card'
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = -1
        end
        object cxGrid1DBLayoutView1LayoutItem1: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          AlignHorz = ahLeft
          SizeOptions.Height = 30
          SizeOptions.Width = 219
          Index = 0
        end
        object cxGrid1DBLayoutView1LayoutItem2: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          SizeOptions.Height = 25
          SizeOptions.Width = 176
          Index = 1
        end
        object cxGrid1DBLayoutView1LayoutItem4: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          Index = 2
        end
        object cxGrid1DBLayoutView1LayoutItem5: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          SizeOptions.Width = 67
          Index = 3
        end
        object cxGrid1DBLayoutView1LayoutItem7: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          SizeOptions.Width = 204
          Index = 5
        end
        object cxGrid1DBLayoutView1LayoutItem8: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          Index = 4
        end
        object cxGrid1DBLayoutView1LayoutItem9: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group8
          CaptionOptions.Visible = False
          Index = 6
        end
        object cxGrid1DBLayoutView1Group7: TdxLayoutGroup
          Parent = cxGrid1DBLayoutView1Group_Root
          AlignHorz = ahLeft
          AlignVert = avClient
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          SizeOptions.Height = 246
          ButtonOptions.Buttons = <>
          ItemIndex = 1
          Index = 0
        end
        object cxGrid1DBLayoutView1Group8: TdxLayoutGroup
          Parent = cxGrid1DBLayoutView1Group1
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = 'New Group'
          CaptionOptions.Visible = False
          SizeOptions.Width = 329
          ButtonOptions.Buttons = <>
          Index = 1
        end
        object cxGrid1DBLayoutView1LayoutItem10: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group7
          CaptionOptions.Visible = False
          SizeOptions.Width = 165
          Index = 1
        end
        object cxGrid1DBLayoutView1LayoutItem11: TcxGridLayoutItem
          Parent = cxGrid1DBLayoutView1Group1
          AlignVert = avClient
          CaptionOptions.Visible = False
          SizeOptions.Height = 216
          SizeOptions.Width = 215
          Index = 0
        end
        object cxGrid1DBLayoutView1Group1: TdxLayoutAutoCreatedGroup
          Parent = cxGrid1DBLayoutView1Group7
          AlignVert = avTop
          LayoutDirection = ldHorizontal
          Index = 0
          AutoCreated = True
        end
      end
      object cxGrid1DBWinExplorerView1: TcxGridDBWinExplorerView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid1DBWinExplorerView1Item1: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'SBBH'
        end
        object cxGrid1DBWinExplorerView1Item2: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'SBMC'
        end
        object cxGrid1DBWinExplorerView1Item3: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'BZ'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBLayoutView1
      end
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton5'
      CaptionOptions.Visible = False
      Control = btnAdd
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 28
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnRY
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = BtnSP
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = BtnSB
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = BtnExit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxGrid1
      ControlOptions.OriginalHeight = 239
      ControlOptions.OriginalWidth = 561
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 408
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 336
    Top = 168
  end
  object cxdtrpstry1: TcxEditRepository
    Left = 280
    Top = 168
    object cxdtrpstry1HyperLinkItem1: TcxEditRepositoryHyperLinkItem
    end
    object cxdtrpstry1SparklineItem1: TcxEditRepositorySparklineItem
      Properties.Series = <>
    end
    object cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = actedit
          ContentAlignment = taLeftJustify
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
          Kind = bkGlyph
        end>
      Properties.ViewStyle = vsButtonsAutoWidth
    end
    object cxdtrpstry1ImageItem1: TcxEditRepositoryImageItem
    end
    object cxdtrpstry1ButtonItem2: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000090101
            010E010101100101011001010110010101100101011001010111010101110101
            011101010111010101100101010B000000030000000000000000204780CA2B61
            ACFF2C63AEFF2C62AEFF2B61ADFF2B60ADFF2A5FACFF2A5FABFF2A5DABFF2A5D
            ABFF2A5CAAFF295BAAFF295AA8FF244D91E305091129000000022C65ACFF3972
            B4FF5F9FD5FF78C1EDFF4FAAE5FF4DA7E5FF4AA5E4FF48A3E3FF45A3E3FF44A1
            E2FF419FE1FF3F9FE1FF3E9DE1FF327BC4FF152D518B00000008326FB5FF518A
            C2FF4D8FCAFFA1DAF5FF6ABCECFF5DB3E9FF5AB2E9FF56B0E8FF54ACE7FF52AC
            E6FF50AAE5FF4DA8E5FF4AA5E4FF4296D9FF234E8BD50101010D3676BAFF73AB
            D4FF458DC9FFA4D6F0FF99D7F5FF6DC0EFFF6ABEEEFF67BCECFF65B9ECFF63B7
            EBFF5FB5EBFF5DB3EAFF59B2E8FF57AFE8FF336EB8FF060D162F397BBFFF94CA
            E7FF57A3D7FF85BFE3FFC6EFFCFF7ECCF3FF7BCAF2FF79C8F1FF76C7F1FF74C5
            F0FF70C3EFFF6DC0EFFF6ABEEEFF67BCECFF4990CCFF163051813C82C2FFB3E4
            F5FF7BCBEEFF5DA7D9FFD4F5FDFFD6F6FEFFD4F5FEFFCFF4FDFFCBF2FDFFC5EF
            FCFFBFECFBFFB8E8FAFFB1E4F9FFA9E1F8FF88C3E7FF26578CCB3F88C7FFCAF5
            FEFF9CE6FCFF69BEE8FF53A4D8FF53A2D7FF51A0D6FF509FD4FF4F9DD4FF4E9B
            D3FF4C99D1FF4B97D0FF377ABDFF3779BCFF3678BBFF316BAAEA3F8ECBFFCFF7
            FEFFAAEDFEFFA1E9FDFF98E5FBFF93E2FBFF8FE1FBFF8CE0FAFF87DBFAFF84D9
            F9FF81D9F9FF7FD8F9FF3272B8FF010101140000000A000000074293CDFFD2F8
            FEFFB2F1FEFFAEEFFEFFAAEEFEFFA9ECFDFFBEF3FDFFD6F9FEFFD7F9FEFFD5F8
            FEFFD3F8FEFFD0F7FDFF3D86C5FF0000000800000000000000004497D0FFD5F9
            FEFFB9F4FEFFB7F2FDFFB4F2FEFFBBEEFAFF4E9AD0FF4091CCFF4090CCFF3F8F
            CBFF3F8ECBFF408DC9FF306795C2000000050000000000000000469CD3FFE3FC
            FEFFE3FCFEFFE2FCFEFFD5F4FAFF4A93C3EC050B0F1B00000006000000060000
            000600000006000000080000000B0000000A000000070000000235769EBF479F
            D5FF479ED5FF479ED5FF479CD4FF173446590000000200000000000000000000
            00000000000000000005006233FF005F32FF005E2FFF00000006000000020000
            0003000000030000000400000003000000020000000000000001000000010000
            0001000000010000000400331A84006434FF006233FF00000006000000000000
            000000000000000000000000000000000000000000000000000100381E78001F
            11450000000400190D3E006435EB00381E8D006736FF00000004000000000000
            0000000000000000000000000000000000000000000000000000000302070040
            2386006E3CEA006A3DEA003A2187000301090000000200000001}
          Kind = bkGlyph
        end>
    end
  end
  object actlst1: TActionList
    Left = 224
    Top = 168
    object actnew: TAction
      Caption = 'act1'
    end
    object actedit: TAction
      Caption = 'actedit'
      OnExecute = acteditExecute
    end
    object actdelete: TAction
      Caption = 'actdelete'
      OnExecute = actdeleteExecute
    end
    object actView: TAction
      Caption = 'actView'
    end
  end
end
