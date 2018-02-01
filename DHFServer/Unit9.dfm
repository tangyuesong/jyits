object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'DHF'
  ClientHeight = 534
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 25
    Height = 13
    Caption = 'SBBH'
  end
  object Label2: TLabel
    Left = 24
    Top = 131
    Width = 25
    Height = 13
    Caption = 'FXBH'
  end
  object Label3: TLabel
    Left = 24
    Top = 158
    Width = 25
    Height = 13
    Caption = 'XZSD'
  end
  object Label4: TLabel
    Left = 24
    Top = 185
    Width = 24
    Height = 13
    Caption = 'CJJG'
  end
  object Label5: TLabel
    Left = 24
    Top = 224
    Width = 28
    Height = 13
    Caption = 'HPHM'
  end
  object Label6: TLabel
    Left = 24
    Top = 251
    Width = 24
    Height = 13
    Caption = 'HPZL'
  end
  object Label7: TLabel
    Left = 24
    Top = 278
    Width = 27
    Height = 13
    Caption = 'CDBH'
  end
  object Label8: TLabel
    Left = 24
    Top = 305
    Width = 25
    Height = 13
    Caption = 'CLSD'
  end
  object Label9: TLabel
    Left = 24
    Top = 344
    Width = 25
    Height = 13
    Caption = 'HPYS'
  end
  object Label10: TLabel
    Left = 24
    Top = 371
    Width = 25
    Height = 13
    Caption = 'CSYS'
  end
  object Label11: TLabel
    Left = 24
    Top = 398
    Width = 37
    Height = 13
    Caption = 'FWQDZ'
  end
  object Label12: TLabel
    Left = 24
    Top = 99
    Width = 26
    Height = 13
    Caption = 'BABH'
  end
  object Label13: TLabel
    Left = 24
    Top = 425
    Width = 18
    Height = 13
    Caption = 'TP1'
  end
  object Label14: TLabel
    Left = 24
    Top = 452
    Width = 25
    Height = 13
    Caption = 'GCSJ'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object btnInit: TButton
    Left = 344
    Top = 334
    Width = 75
    Height = 25
    Caption = #21021#22987#21270
    TabOrder = 2
    OnClick = btnInitClick
  end
  object btnWrite: TButton
    Left = 344
    Top = 365
    Width = 75
    Height = 25
    Caption = #19978#20256#36807#36710
    TabOrder = 3
    OnClick = btnWriteClick
  end
  object edtSBBH: TEdit
    Left = 80
    Top = 69
    Width = 209
    Height = 21
    TabOrder = 4
    Text = '445121203350034600445121A087'
  end
  object edtFXBH: TEdit
    Left = 80
    Top = 128
    Width = 209
    Height = 21
    TabOrder = 5
    Text = '1'
  end
  object edtXZSD: TEdit
    Left = 80
    Top = 155
    Width = 209
    Height = 21
    TabOrder = 6
    Text = '80'
  end
  object edtCJJG: TEdit
    Left = 80
    Top = 182
    Width = 209
    Height = 21
    TabOrder = 7
    Text = '445100000000'
  end
  object edtHPHM: TEdit
    Left = 80
    Top = 221
    Width = 209
    Height = 21
    TabOrder = 8
    Text = #31908'U03133'
  end
  object edtHPZL: TEdit
    Left = 80
    Top = 248
    Width = 209
    Height = 21
    TabOrder = 9
    Text = '01'
  end
  object edtCDBH: TEdit
    Left = 80
    Top = 275
    Width = 209
    Height = 21
    TabOrder = 10
    Text = '1'
  end
  object edtCLSD: TEdit
    Left = 80
    Top = 302
    Width = 209
    Height = 21
    TabOrder = 11
    Text = '20'
  end
  object edtHPYS: TEdit
    Left = 80
    Top = 341
    Width = 209
    Height = 21
    TabOrder = 12
    Text = '2'
  end
  object edtCSYS: TEdit
    Left = 80
    Top = 368
    Width = 209
    Height = 21
    TabOrder = 13
    Text = 'E'
  end
  object edtFWQDZ: TEdit
    Left = 80
    Top = 395
    Width = 209
    Height = 21
    TabOrder = 14
    Text = 'http://10.43.255.10/'
  end
  object edtBABH: TEdit
    Left = 80
    Top = 96
    Width = 209
    Height = 21
    TabOrder = 15
    Text = '445100100163'
  end
  object edtTP1: TEdit
    Left = 80
    Top = 422
    Width = 209
    Height = 21
    TabOrder = 16
  end
  object edtGCSJ: TEdit
    Left = 80
    Top = 449
    Width = 209
    Height = 21
    TabOrder = 17
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 400
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 400
    Top = 40
  end
end
