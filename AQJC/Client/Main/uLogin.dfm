object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #31995#32479#30331#24405
  ClientHeight = 266
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameLogin: TFrameLogin
    Left = 0
    Top = 0
    Width = 413
    Height = 277
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    TabOrder = 0
    inherited cxImage3: TcxImage
      Left = -3
      ExplicitLeft = -3
      ExplicitWidth = 415
      ExplicitHeight = 215
      Height = 215
      Width = 415
    end
    inherited cxImage4: TcxImage
      Top = 95
      TabOrder = 5
      ExplicitTop = 95
    end
    inherited cxImage5: TcxImage
      Top = 144
      TabOrder = 6
      ExplicitTop = 144
    end
    inherited spnlTop: TcxGroupBox
      TabOrder = 7
      inherited cxLabel1: TcxLabel
        Caption = #29436#34523#25191#27861#21161#25163
        Style.IsFontAssigned = True
        ExplicitWidth = 136
      end
    end
    inherited btnLogin: TcxButton
      Top = 214
      Caption = #30331#24405
      LookAndFeel.SkinName = 'MetropolisDark'
      TabOrder = 3
      OnClick = sbtbtnLoginClick
      ExplicitTop = 214
    end
    inherited btnPIK: TcxButton
      Left = 298
      Top = 214
      Caption = #36864#20986
      LookAndFeel.Kind = lfFlat
      LookAndFeel.SkinName = 'MetropolisDark'
      TabOrder = 4
      OnClick = sbtbtnQuitClick
      ExplicitLeft = 298
      ExplicitTop = 214
    end
    inherited edtPwd: TcxTextEdit
      Top = 143
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Height = -14
      Style.Font.Name = #23435#20307
      Style.IsFontAssigned = True
      TabOrder = 2
      OnKeyPress = cbbUserKeyPress
      ExplicitTop = 143
    end
    inherited edtUser: TcxTextEdit
      Top = 95
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Height = -14
      Style.Font.Name = #23435#20307
      Style.IsFontAssigned = True
      TabOrder = 1
      OnKeyPress = cbbUserKeyPress
      ExplicitTop = 95
    end
  end
  object chk1: TcxCheckBox
    Left = 198
    Top = 185
    Caption = #20445#23384#29992#25143#24080#21495#21450#30331#24405#21475#20196
    TabOrder = 1
    Transparent = True
  end
  object dxSkinController1: TdxSkinController
    Kind = lfOffice11
    NativeStyle = False
    SkinName = 'Office2013White'
    TouchMode = True
    Left = 379
    Top = 16
  end
end
