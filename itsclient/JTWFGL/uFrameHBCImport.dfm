inherited FrameImportHBC: TFrameImportHBC
  inherited OpenDialog1: TOpenDialog
    Filter = 'excel|*.xls;*.xlsx'
  end
  object con2: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 296
    Top = 112
  end
  object qy: TADOQuery
    Connection = con2
    Parameters = <>
    Left = 424
    Top = 152
  end
end
