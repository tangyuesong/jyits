object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 463
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 252
    Top = 29
    Width = 16
    Height = 13
    Caption = '-->'
  end
  object Memo1: TMemo
    Left = 21
    Top = 55
    Width = 729
    Height = 369
    Lines.Strings = (
      '{'
      '  "lddm":"1002",'
      '  "hphm":"'#31908'T75H06",'
      '  "wfxw":"1344",'
      '  "dllx":"22",'
      '  "xrms":"2",'
      '  "ddms":"1",'
      '  "scz":"0",'
      '  "jszh":"440181199502184214",'
      '  "hpzl":"02",'
      '  "jsjg":"'#31908'A",'
      '  "jllx":"2",'
      '  "zsxxdz":"'#24191#19996#30465#24191#24030#24066#30058#31162#21306#30707#30849#38215#33590#19996#36335#26690#38451#22823#34903#19968#24055'3'#21495'",'
      '  "bz":"'#30005#23376#30417#25511#31616#26131#22788#29702'('#25509#21475#22788#29702')",'
      '  "ysznj":"96",'
      '  "lrsj":"2018-02-24 20:51:47.0",'
      '  "jdsbh":"440126152902199",'
      '  "clsj":"2018-02-24 20:51:00.0",'
      '  "hcbj":"2",'
      '  "xxly":"2",'
      '  "jsjqbj":"00",'
      '  "xzqh":"440113",'
      '  "wsjyw":"5",'
      '  "fkje":"200",'
      '  "fsjg":"'#31908'A",'
      '  "cfzl":"2",'
      '  "clfl":"3",'
      '  "zdbj":"0",'
      '  "ylzz4":":",'
      '  "gxsj":"2018-02-24 20:51:54.0",'
      '  "dkbj":"0",'
      '  "fzjg":"'#31908'A",'
      '  "zqmj":"033003",'
      '  "jmznjbj":"0",'
      '  "bzz":"0",'
      '  '
      
        '"ywjyw":"4C1A090801010105090E030701070B0B0004080D0B094C50445C4A5' +
        '8050C39353032313834323134343430313630363432333735D4C141'
      '323031382D30322D303936353130393133343433323030323132",'
      '  "zdjlbj":"0",'
      '  "jbr1":"'#24191#24030#22909#26131#32456#31471'2AA1C02756926939",'
      '  "jkrq":"2018-02-24 00:00:00.0",'
      '  "jkbj":"1",'
      '  "ryfl":"4",'
      '  "zsxzqh":"440113",'
      '  "wfbh":"4401262018161529021991",'
      '  "fxjgmc":"'#24191#24030#24066#20844#23433#23616#20132#36890#35686#23519#25903#38431#30058#31162#22823#38431'",'
      '  "cljg":"440126000000",'
      '  "wfsj":"2018-02-09 19:17:12.0",'
      '  "cljgmc":"'#24191#24030#24066#20844#23433#23616#20132#36890#35686#23519#25903#38431#30058#31162#22823#38431'",'
      '  "dabh":"440160642375",'
      '  "wfjfs":"3",'
      '  "fxjg":"440126000000",'
      '  "wfdd":"65109",'
      '  "jtfs":"K33",'
      '  "zjcx":"C1",'
      '  "wfdz":"'#21306#25919#24220#21335#38376#36335#27573'",'
      '  "lrr":"'#25509#21475#24405#20837'",'
      '  "jdslb":"1",'
      '  "znj":"0",'
      '  "jdcsyr":"'#21171#35029#33391'",'
      '  "dsr":"'#21171#20255#33275'",'
      '  "cldxbj":"0",'
      '  "jkfs":"2",'
      '  "sgdj":"0",'
      '  "syxz":"A",'
      '  "code":"0"'
      '}')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 21
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 125
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 448
    Top = 24
    Width = 75
    Height = 25
    Caption = #36716#25442
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 274
    Top = 28
    Width = 168
    Height = 21
    TabOrder = 4
  end
  object Button3: TButton
    Left = 656
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 559
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 424
    Top = 430
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 7
    OnClick = Button5Click
  end
  object httpServer: TIdHTTPServer
    Bindings = <>
    IOHandler = IdServerIOHandlerSSLOpenSSL1
    MaximumHeaderLineCount = 1000
    OnCreatePostStream = httpServerCreatePostStream
    OnCommandGet = httpServerCommandGet
    Left = 16
    Top = 264
  end
  object Timer1: TTimer
    Enabled = False
    Left = 24
    Top = 136
  end
  object httpClient: TIdHTTP
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
    Left = 16
    Top = 208
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 376
    Top = 240
  end
  object IdUnixTime1: TIdUnixTime
    Left = 584
    Top = 432
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    OnGetPassword = IdServerIOHandlerSSLOpenSSL1GetPassword
    Left = 384
    Top = 248
  end
end
