object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'WriteVio'
  ClientHeight = 326
  ClientWidth = 398
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
  object Label8: TLabel
    Left = 8
    Top = 21
    Width = 23
    Height = 13
    Caption = 'sbbh'
  end
  object Label1: TLabel
    Left = 8
    Top = 237
    Width = 27
    Height = 13
    Caption = 'result'
  end
  object Label2: TLabel
    Left = 8
    Top = 210
    Width = 13
    Height = 13
    Caption = 'Pic'
  end
  object Label3: TLabel
    Left = 205
    Top = 21
    Width = 22
    Height = 13
    Caption = 'zqmj'
  end
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 13
    Height = 13
    Caption = 'clfl'
  end
  object Label9: TLabel
    Left = 205
    Top = 48
    Width = 19
    Height = 13
    Caption = 'hpzl'
  end
  object Label10: TLabel
    Left = 8
    Top = 75
    Width = 26
    Height = 13
    Caption = 'hphm'
  end
  object Label11: TLabel
    Left = 205
    Top = 75
    Width = 23
    Height = 13
    Caption = 'xzqh'
  end
  object Label12: TLabel
    Left = 8
    Top = 102
    Width = 24
    Height = 13
    Caption = 'wfdd'
  end
  object Label13: TLabel
    Left = 205
    Top = 102
    Width = 22
    Height = 13
    Caption = 'lddm'
  end
  object Label14: TLabel
    Left = 8
    Top = 129
    Width = 25
    Height = 13
    Caption = 'ddms'
  end
  object Label15: TLabel
    Left = 205
    Top = 129
    Width = 23
    Height = 13
    Caption = 'wfdz'
  end
  object Label16: TLabel
    Left = 8
    Top = 156
    Width = 20
    Height = 13
    Caption = 'wfsj'
  end
  object Label17: TLabel
    Left = 205
    Top = 156
    Width = 26
    Height = 13
    Caption = 'wfxw'
  end
  object Label5: TLabel
    Left = 8
    Top = 183
    Width = 15
    Height = 13
    Caption = 'scz'
  end
  object Label6: TLabel
    Left = 205
    Top = 183
    Width = 16
    Height = 13
    Caption = 'bzz'
  end
  object Button9: TButton
    Left = 315
    Top = 269
    Width = 50
    Height = 46
    Caption = 'Request'
    TabOrder = 0
    OnClick = Button9Click
  end
  object edtSBBH: TEdit
    Left = 44
    Top = 18
    Width = 140
    Height = 21
    TabOrder = 1
    Text = '445200000000021007'
  end
  object edtResult: TEdit
    Left = 44
    Top = 234
    Width = 337
    Height = 21
    TabOrder = 2
  end
  object edtPic: TEdit
    Left = 44
    Top = 207
    Width = 337
    Height = 21
    TabOrder = 3
    OnClick = edtPicClick
  end
  object edtZqmj: TEdit
    Left = 241
    Top = 18
    Width = 140
    Height = 21
    TabOrder = 4
  end
  object edtClfl: TEdit
    Left = 44
    Top = 45
    Width = 140
    Height = 21
    TabOrder = 5
    Text = '3'
  end
  object edtHpzl: TEdit
    Left = 241
    Top = 45
    Width = 140
    Height = 21
    TabOrder = 6
    Text = '02'
  end
  object edtHphm: TEdit
    Left = 44
    Top = 72
    Width = 140
    Height = 21
    TabOrder = 7
    Text = #31908'V88122'
  end
  object edtXzqh: TEdit
    Left = 241
    Top = 72
    Width = 140
    Height = 21
    TabOrder = 8
    Text = '445202'
  end
  object edtWfdd: TEdit
    Left = 44
    Top = 99
    Width = 140
    Height = 21
    TabOrder = 9
    Text = '206'#22269#36947
  end
  object edtlddm: TEdit
    Left = 241
    Top = 99
    Width = 140
    Height = 21
    TabOrder = 10
    Text = '22'
  end
  object edtDdms: TEdit
    Left = 44
    Top = 126
    Width = 140
    Height = 21
    TabOrder = 11
    Text = '22'
  end
  object edtWfdz: TEdit
    Left = 241
    Top = 126
    Width = 140
    Height = 21
    TabOrder = 12
    Text = '206'#22269#36947'22'#20844#37324'22'#31859
  end
  object edtWfsj: TEdit
    Left = 44
    Top = 153
    Width = 140
    Height = 21
    TabOrder = 13
  end
  object edtWfxw: TEdit
    Left = 241
    Top = 153
    Width = 140
    Height = 21
    TabOrder = 14
    Text = '13441'
  end
  object edtScz: TEdit
    Left = 44
    Top = 180
    Width = 140
    Height = 21
    TabOrder = 15
    Text = '0'
  end
  object edtBzz: TEdit
    Left = 241
    Top = 180
    Width = 140
    Height = 21
    TabOrder = 16
    Text = '0'
  end
  object picDialog: TOpenPictureDialog
    Left = 237
    Top = 272
  end
end
