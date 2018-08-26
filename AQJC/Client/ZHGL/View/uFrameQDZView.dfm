inherited FrameQDZView: TFrameQDZView
  inherited dxLayoutControl2: TdxLayoutControl
    object btnBack: TcxButton [0]
      Tag = 3
      Left = 187
      Top = 13
      Width = 25
      Height = 25
      Hint = #36820#22238
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = btnBackClick
    end
    object btnBase: TcxButton [1]
      Left = 243
      Top = 45
      Width = 21
      Height = 21
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = cxImageList1
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = btnBaseClick
    end
    object btnMember: TcxButton [2]
      Left = 243
      Top = 85
      Width = 21
      Height = 21
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = cxImageList1
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      OnClick = btnMemberClick
    end
    object btnVideo: TcxButton [3]
      Left = 243
      Top = 125
      Width = 21
      Height = 21
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = cxImageList1
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      OnClick = btnVideoClick
    end
    object btnDev: TcxButton [4]
      Left = 243
      Top = 165
      Width = 21
      Height = 21
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = cxImageList1
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 4
      OnClick = btnDevClick
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahCenter
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahLeft
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = 'BtnExit'
      CaptionOptions.Visible = False
      Control = btnBack
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #22522#26412#20449#24687
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup111: TdxLayoutGroup
      Parent = dxLayoutGroup11
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup111
      CaptionOptions.Text = #22522#26412#20449#24687
      CaptionOptions.Visible = True
      Index = 0
    end
    object liQDZ: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Visible = False
      Control = btnBase
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgQDZ: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = lgQDZ
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Offsets.Left = 16
      Offsets.Right = 16
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 305
      ControlOptions.OriginalWidth = 600
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #22522#26412#20449#24687
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup21: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup211: TdxLayoutGroup
      Parent = dxLayoutGroup21
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup211
      CaptionOptions.Text = #20154#21592#20449#24687
      CaptionOptions.Visible = True
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup21
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnMember
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgMember: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #22522#26412#20449#24687
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup31: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup311: TdxLayoutGroup
      Parent = dxLayoutGroup31
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem3: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup311
      CaptionOptions.Text = #35270#39057#35774#22791
      CaptionOptions.Visible = True
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup31
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnVideo
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgVideo: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #22522#26412#20449#24687
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup41: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup411: TdxLayoutGroup
      Parent = dxLayoutGroup41
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem4: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup411
      CaptionOptions.Text = #35774#22791#20449#24687
      CaptionOptions.Visible = True
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup41
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnDev
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgDev: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lgMember1: TdxLayoutGroup
      Parent = lgMember
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgMember2: TdxLayoutGroup
      Parent = lgMember
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object lgVideo1: TdxLayoutGroup
      Parent = lgVideo
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgVideo2: TdxLayoutGroup
      Parent = lgVideo
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object lgVideo3: TdxLayoutGroup
      Parent = lgVideo
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object lgDev1: TdxLayoutGroup
      Parent = lgDev
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgDev2: TdxLayoutGroup
      Parent = lgDev
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
  end
  object cxImageList1: TcxImageList
    FormatVersion = 1
    DesignInfo = 13107560
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000000000008484
          84FF848484FF848484FF848484FF000000000000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000848484FF8484
          84FF848484FF848484FF848484FF848484FF0000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000848484FF0000
          0000848484FF848484FF00000000848484FF0000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          0000B8824DFF00000000B8824DFFB8824DFF00000000B8824DFF000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          0000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          000000000000B8824DFFB8824DFFB8824DFFB8824DFF00000000000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
          0000848484FF848484FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
