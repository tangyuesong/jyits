inherited FrameWFXWEdit: TFrameWFXWEdit
  inherited dxLayoutControl2: TdxLayoutControl
    inherited btnSave: TcxButton
      TabOrder = 9
      OnClick = btnSaveClick
    end
    inherited btnExit: TcxButton
      TabOrder = 10
    end
    object EdtWfxwdm: TcxTextEdit [2]
      Left = 87
      Top = 36
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object edtfg: TcxMemo [3]
      Left = 87
      Top = 64
      Lines.Strings = (
        '')
      Style.HotTrack = False
      TabOrder = 2
      Height = 90
      Width = 495
    end
    object edttljc: TcxMemo [4]
      Left = 87
      Top = 161
      Lines.Strings = (
        '')
      Style.HotTrack = False
      TabOrder = 3
      Height = 89
      Width = 495
    end
    object edtje: TcxTextEdit [5]
      Left = 87
      Top = 257
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 56
    end
    object Edtwfxwmc: TcxTextEdit [6]
      Left = 274
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 308
    end
    object edtbz: TcxMemo [7]
      Left = 87
      Top = 285
      Lines.Strings = (
        '')
      Style.HotTrack = False
      TabOrder = 8
      Height = 146
      Width = 495
    end
    object edtjf: TcxTextEdit [8]
      Left = 180
      Top = 257
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 51
    end
    object edtyxqks: TcxDateEdit [9]
      Left = 292
      Top = 257
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 115
    end
    object edtyxqjs: TcxDateEdit [10]
      Left = 468
      Top = 257
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 114
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #36829#27861#34892#20026#31649#29702
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      CaptionOptions.Text = #20195#30721#32534#21495'*'
      Control = EdtWfxwdm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #27861#24459#27861#35268
      Control = edtfg
      ControlOptions.OriginalHeight = 90
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #27861#24459#26465#20363
      Control = edttljc
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxlytcrtdgrp3
      AlignHorz = ahClient
      CaptionOptions.Text = #32602#27454#37329#39069
      Control = edtje
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 46
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      AlignHorz = ahClient
      CaptionOptions.Text = #20013#25991#21517#31216'*'
      Control = Edtwfxwmc
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignVert = avClient
      CaptionOptions.Text = #22791#27880
      Control = edtbz
      ControlOptions.OriginalHeight = 89
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxlytcrtdgrp3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #35745#20998
      Control = edtjf
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 44
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxlytcrtdgrp3
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #21551#29992#26102#38388
      Control = edtyxqks
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 115
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxlytcrtdgrp3
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #32467#26463#26102#38388
      Control = edtyxqjs
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 114
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
