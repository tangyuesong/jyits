inherited FrameDeptTreeList: TFrameDeptTreeList
  inherited dxLayoutControl2: TdxLayoutControl
    inherited btnSave: TcxButton
      TabOrder = 1
      OnClick = btnExitClick
    end
    inherited btnExit: TcxButton
      TabOrder = 2
    end
    object tree: TcxTreeList [2]
      Left = 28
      Top = 36
      Width = 554
      Height = 395
      Bands = <
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.Headers = False
      TabOrder = 0
      OnDblClick = btnExitClick
      Data = {
        00000500400100000F00000044617461436F6E74726F6C6C6572310300000012
        000000546378537472696E6756616C7565547970651200000054637853747269
        6E6756616C75655479706512000000546378537472696E6756616C7565547970
        6504000000445855464D5400000100000061000001000000620001445855464D
        540000020000006100310000020000006100320001445855464D540000010000
        0063000001000000640001445855464D54000002000000610031000002000000
        62003100010300000000000000020409010000000000000001000000FFFFFFFF
        FFFFFFFFFFFFFFFF01000000080601000000000000000000000000FFFFFFFFFF
        FFFFFF020000000804010000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0300
        00000806010000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1A0C0803000000}
      object cxTreeList1Column2: TcxTreeListColumn
        Caption.Text = 'A'
        DataBinding.ValueType = 'String'
        Width = 300
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object cxTreeList1Column3: TcxTreeListColumn
        Caption.Text = 'B'
        DataBinding.ValueType = 'String'
        MinWidth = 1
        Width = 100
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object treeUserColumn4: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        MinWidth = 1
        Width = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #36873#25321#21333#20301
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = tree
      ControlOptions.OriginalHeight = 389
      ControlOptions.OriginalWidth = 429
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
