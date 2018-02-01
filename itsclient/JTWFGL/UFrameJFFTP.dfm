inherited dxDialogBaseFrame3: TdxDialogBaseFrame3
  Height = 150
  ExplicitHeight = 150
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 150
    ExplicitHeight = 150
    inherited btnSave: TcxButton
      Top = 101
      TabOrder = 3
      ExplicitTop = 101
    end
    inherited btnExit: TcxButton
      Top = 101
      TabOrder = 4
      ExplicitTop = 101
    end
    object cxTextEdit1: TcxTextEdit [2]
      Left = 66
      Top = 47
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 159
    end
    object cxTextEdit2: TcxTextEdit [3]
      Left = 262
      Top = 47
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 33
    end
    object cxTextEdit3: TcxTextEdit [4]
      Left = 356
      Top = 47
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 234
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = 'FTP'#37197#32622
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      CaptionOptions.Text = 'ftp'#22320#22336
      Control = cxTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 159
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      CaptionOptions.Text = #31471#21475
      Control = cxTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 33
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      AlignHorz = ahClient
      CaptionOptions.Text = #19978#20256#22320#22336
      Control = cxTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
