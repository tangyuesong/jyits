object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'QTZ'
  ClientHeight = 435
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 15
    Width = 26
    Height = 13
    Caption = 'KDBH'
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 23
    Height = 13
    Caption = 'FXLX'
  end
  object Label3: TLabel
    Left = 24
    Top = 79
    Width = 21
    Height = 13
    Caption = 'CDH'
  end
  object Label4: TLabel
    Left = 24
    Top = 112
    Width = 28
    Height = 13
    Caption = 'HPHM'
  end
  object Label5: TLabel
    Left = 24
    Top = 143
    Width = 24
    Height = 13
    Caption = 'HPZL'
  end
  object Label6: TLabel
    Left = 24
    Top = 200
    Width = 25
    Height = 13
    Caption = 'GCSJ'
  end
  object Label7: TLabel
    Left = 24
    Top = 231
    Width = 18
    Height = 13
    Caption = 'TP1'
  end
  object Label8: TLabel
    Left = 24
    Top = 173
    Width = 25
    Height = 13
    Caption = 'HPYS'
  end
  object Button1: TButton
    Left = 247
    Top = 29
    Width = 75
    Height = 32
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 616
    Top = 15
    Width = 169
    Height = 386
    Lines.Strings = (
      'kkbh: string;'
      '  fxlx: string;'
      '  cdh: Int64;'
      '  hphm: string;'
      '  hpzl: string;'
      '  gcsj: string;'
      '  clsd: Int64;'
      '  clxs: Int64;'
      '  wfdm: string;'
      '  cwkc: Int64;'
      '  hpys: string;'
      '  cllx: string;'
      '  fzhpzl: string;'
      '  fzhphm: string;'
      '  fzhpys: string;'
      '  clpp: string;'
      '  clwx: string;'
      '  csys: string;'
      '  tplj: string;'
      '  tp1: string;'
      '  tp2: string;'
      '  tp3: string;'
      '  tztp: string')
    TabOrder = 1
  end
  object edtKDBH: TEdit
    Left = 56
    Top = 12
    Width = 161
    Height = 21
    TabOrder = 2
  end
  object edtFXLX: TEdit
    Left = 56
    Top = 49
    Width = 161
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object edtCDH: TEdit
    Left = 56
    Top = 76
    Width = 161
    Height = 21
    TabOrder = 4
    Text = '1'
  end
  object edtHPHM: TEdit
    Left = 56
    Top = 109
    Width = 161
    Height = 21
    TabOrder = 5
    Text = #31908
  end
  object edtHPZL: TEdit
    Left = 56
    Top = 136
    Width = 161
    Height = 21
    TabOrder = 6
    Text = '02'
  end
  object edtGCSJ: TEdit
    Left = 56
    Top = 197
    Width = 161
    Height = 21
    TabOrder = 7
    Text = '1'
  end
  object edtTP1: TEdit
    Left = 56
    Top = 228
    Width = 161
    Height = 21
    TabOrder = 8
  end
  object edtHPYS: TEdit
    Left = 56
    Top = 170
    Width = 161
    Height = 21
    TabOrder = 9
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 528
    Top = 192
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    Left = 520
    Top = 312
  end
  object Timer1: TTimer
    Enabled = False
    Left = 496
    Top = 256
  end
end
