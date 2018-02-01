object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Action Editor'
  ClientHeight = 637
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 629
    Height = 637
    ActivePage = Query
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Edit'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 621
        Height = 145
        Align = alTop
        Caption = 'Action'
        TabOrder = 0
        object Label1: TLabel
          Left = 20
          Top = 78
          Width = 19
          Height = 13
          Caption = 'SQL'
        end
        object Label3: TLabel
          Left = 20
          Top = 24
          Width = 54
          Height = 13
          Caption = 'ActionType'
        end
        object Label4: TLabel
          Left = 20
          Top = 51
          Width = 28
          Height = 13
          Caption = 'Memo'
        end
        object edtAction: TsEdit
          Left = 184
          Top = 21
          Width = 185
          Height = 21
          TabOrder = 0
          BoundLabel.Active = True
          BoundLabel.Caption = 'Action'
        end
        object edtTablename: TsEdit
          Left = 433
          Top = 21
          Width = 185
          Height = 21
          TabOrder = 1
          BoundLabel.Active = True
          BoundLabel.Caption = 'TableName'
        end
        object edtMemo: TsEdit
          Left = 80
          Top = 48
          Width = 538
          Height = 21
          TabOrder = 2
          BoundLabel.Caption = 'Memo'
        end
        object cmbActionType: TsComboBox
          Left = 80
          Top = 21
          Width = 57
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Caption = 'ActionType'
          VerticalAlignment = taAlignTop
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 3
          Text = 'A'
          Items.Strings = (
            'A'
            'M'
            'D'
            'Q'
            'P'
            'F')
        end
        object edtSQL: TMemo
          Left = 80
          Top = 75
          Width = 538
          Height = 60
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 145
        Width = 621
        Height = 309
        Align = alClient
        Caption = 'Params'
        TabOrder = 1
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 617
          Height = 66
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 18
            Top = 13
            Width = 30
            Height = 13
            Caption = 'Param'
          end
          object cmbType: TsComboBox
            Left = 333
            Top = 10
            Width = 68
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Type'
            VerticalAlignment = taAlignTop
            Style = csDropDownList
            ItemIndex = -1
            TabOrder = 0
            Items.Strings = (
              'string'
              'int'
              'datetime')
          end
          object cmbNonnull: TsComboBox
            Left = 450
            Top = 10
            Width = 68
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Nonnull'
            VerticalAlignment = taAlignTop
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = 'True'
            Items.Strings = (
              'True'
              'False')
          end
          object edtDefaultvalue: TsEdit
            Left = 78
            Top = 37
            Width = 185
            Height = 21
            TabOrder = 2
            BoundLabel.Active = True
            BoundLabel.Caption = 'DefaultValue'
          end
          object edtDbColName: TsEdit
            Left = 333
            Top = 37
            Width = 185
            Height = 21
            TabOrder = 3
            BoundLabel.Active = True
            BoundLabel.Caption = 'DBColName'
          end
          object Button6: TButton
            Left = 535
            Top = 36
            Width = 41
            Height = 24
            Caption = 'DEL'
            TabOrder = 4
            OnClick = Button6Click
          end
          object Button3: TButton
            Left = 535
            Top = 9
            Width = 41
            Height = 24
            Caption = 'ADD'
            TabOrder = 5
            OnClick = Button3Click
          end
          object edtParam: TEdit
            Left = 78
            Top = 10
            Width = 185
            Height = 21
            TabOrder = 6
          end
        end
        object dgParams: TDBGridEh
          Left = 2
          Top = 81
          Width = 617
          Height = 226
          Align = alClient
          DataSource = DataSource1
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Param'
              Footers = <>
              Title.Alignment = taCenter
              Width = 130
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Type'
              Footers = <>
              Title.Alignment = taCenter
              Width = 90
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Nonnull'
              Footers = <>
              Title.Alignment = taCenter
              Width = 90
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DefaultValue'
              Footers = <>
              Title.Alignment = taCenter
              Width = 130
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DbColName'
              Footers = <>
              Title.Alignment = taCenter
              Width = 130
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 454
        Width = 621
        Height = 155
        Align = alBottom
        Caption = 'Groups'
        TabOrder = 2
        object Panel1: TPanel
          Left = 2
          Top = 99
          Width = 617
          Height = 54
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Button1: TButton
            Left = 432
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Add'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 513
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Exit'
            TabOrder = 1
            OnClick = Button2Click
          end
          object edtActionSearch: TsEdit
            Left = 70
            Top = 21
            Width = 185
            Height = 21
            TabOrder = 2
            BoundLabel.Active = True
            BoundLabel.Caption = 'Action'
          end
          object Button5: TButton
            Left = 267
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Query'
            TabOrder = 3
            OnClick = Button5Click
          end
          object Button8: TButton
            Left = 351
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Delete'
            TabOrder = 4
            OnClick = Button8Click
          end
        end
        object lbGroups: TListBox
          Left = 2
          Top = 49
          Width = 617
          Height = 50
          Align = alClient
          ItemHeight = 13
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 2
          Top = 15
          Width = 617
          Height = 34
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object edtColName: TsEdit
            Left = 70
            Top = 7
            Width = 185
            Height = 21
            TabOrder = 0
            BoundLabel.Active = True
            BoundLabel.Caption = 'ColName'
          end
          object Button4: TButton
            Left = 267
            Top = 6
            Width = 41
            Height = 24
            Caption = 'ADD'
            TabOrder = 1
            OnClick = Button4Click
          end
          object Button7: TButton
            Left = 314
            Top = 6
            Width = 41
            Height = 24
            Caption = 'DEL'
            TabOrder = 2
            OnClick = Button7Click
          end
        end
      end
    end
    object Query: TTabSheet
      Caption = 'Query'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 129
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 16
          Width = 22
          Height = 13
          Caption = 'User'
        end
        object Label6: TLabel
          Left = 192
          Top = 16
          Width = 20
          Height = 13
          Caption = 'Pwd'
        end
        object Label7: TLabel
          Left = 371
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Home'
        end
        object Label8: TLabel
          Left = 8
          Top = 49
          Width = 30
          Height = 13
          Caption = 'Action'
        end
        object edtUser: TEdit
          Left = 44
          Top = 13
          Width = 140
          Height = 21
          TabOrder = 0
          Text = '250688'
        end
        object edtPwd: TEdit
          Left = 221
          Top = 13
          Width = 140
          Height = 21
          PasswordChar = '*'
          TabOrder = 1
          Text = 'lgm1224,./'
        end
        object edtHome: TEdit
          Left = 406
          Top = 13
          Width = 140
          Height = 21
          TabOrder = 2
          Text = 'http://127.0.0.1:17115/'
        end
        object edtQuery: TEdit
          Left = 44
          Top = 46
          Width = 502
          Height = 21
          TabOrder = 3
        end
        object Button9: TButton
          Left = 559
          Top = 21
          Width = 50
          Height = 46
          Caption = 'Request'
          TabOrder = 4
          OnClick = Button9Click
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 73
          Width = 621
          Height = 56
          Align = alBottom
          Caption = 'Datetime Convert'
          TabOrder = 5
          object Label9: TLabel
            Left = 8
            Top = 27
            Width = 23
            Height = 13
            Caption = 'Date'
          end
          object Label10: TLabel
            Left = 285
            Top = 27
            Width = 20
            Height = 13
            Caption = '<->'
          end
          object edtDateInt: TEdit
            Left = 44
            Top = 24
            Width = 230
            Height = 21
            TabOrder = 0
          end
          object edtDateStr: TEdit
            Left = 316
            Top = 24
            Width = 230
            Height = 21
            TabOrder = 1
          end
          object Button10: TButton
            Left = 559
            Top = 21
            Width = 50
            Height = 27
            Caption = 'Convert'
            TabOrder = 2
            OnClick = Button10Click
          end
        end
      end
      object Memo1: TMemo
        Left = 0
        Top = 129
        Width = 621
        Height = 480
        Align = alClient
        TabOrder = 1
      end
    end
  end
  object tbParams: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 249
  end
  object DataSource1: TDataSource
    DataSet = tbParams
    Left = 16
    Top = 248
  end
  object http: TIdHTTP
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
    Left = 104
    Top = 248
  end
end
