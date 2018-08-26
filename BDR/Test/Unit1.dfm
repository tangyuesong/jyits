object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 589
  ClientWidth = 853
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 853
    Height = 589
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    DefaultPort = 8088
    OnCreatePostStream = IdHTTPServer1CreatePostStream
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 32
    Top = 22
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 424
    Top = 304
  end
end
