inherited fDialogPolicySetting: TfDialogPolicySetting
  Width = 385
  Height = 265
  ExplicitWidth = 385
  ExplicitHeight = 265
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 385
    Height = 265
    ExplicitWidth = 385
    ExplicitHeight = 265
    inherited btnSave: TcxButton
      Left = 111
      Top = 212
      Caption = #20445#23384
      TabOrder = 5
      OnClick = btnSaveClick
      ExplicitLeft = 111
      ExplicitTop = 212
    end
    inherited btnExit: TcxButton
      Left = 199
      Top = 212
      TabOrder = 6
      ExplicitLeft = 199
      ExplicitTop = 212
    end
    object cxTextEdit1: TcxTextEdit [2]
      Left = 210
      Top = 36
      Align = alRight
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Text = '5'
      Height = 21
      Width = 147
    end
    object cxTextEdit2: TcxTextEdit [3]
      Left = 210
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Text = '5'
      Height = 21
      Width = 147
    end
    object cxTextEdit3: TcxTextEdit [4]
      Left = 210
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Text = '60'
      Height = 21
      Width = 147
    end
    object cxTextEdit4: TcxTextEdit [5]
      Left = 210
      Top = 120
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Text = '60'
      Height = 21
      Width = 147
    end
    object cxTextEdit5: TcxTextEdit [6]
      Left = 210
      Top = 148
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Text = '30'
      Height = 21
      Width = 147
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #21442#25968#35774#32622
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21516#19968#29992#25143#26368#22823#30331#24405#37325#35797#27425#25968
      Control = cxTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21516#19968#32456#31471#26368#22823#30331#24405#37325#35797#27425#25968
      Control = cxTextEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #30331#24405#38145#23450#26102#38271'('#20998')'
      Control = cxTextEdit3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #19968#20998#38047#20869#26368#22823#35831#27714#27425#25968'('#39640#39057#35775#38382')'
      Control = cxTextEdit4
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36134#25143#26410#20351#29992#22825#25968'('#36134#25143#38271#26399#26410#20351#29992')'
      Control = cxTextEdit5
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
end
