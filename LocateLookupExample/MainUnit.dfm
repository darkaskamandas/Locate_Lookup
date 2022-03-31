object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Locate and Lookup Example'
  ClientHeight = 451
  ClientWidth = 604
  Color = clBtnFace
  Constraints.MinHeight = 490
  Constraints.MinWidth = 620
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    604
    451)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEmployees: TDBGrid
    Left = 8
    Top = 200
    Width = 588
    Height = 221
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSourceEmployees
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'EmpNo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PhoneExt'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HireDate'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Salary'
        Width = 81
        Visible = True
      end>
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 426
    Width = 604
    Height = 25
    Panels = <
      item
        Text = ' Record Count =  '
        Width = 140
      end
      item
        Text = ' Employee'
        Width = 300
      end
      item
        Text = ' Time: 0 ms'
        Width = 50
      end>
  end
  object GroupBoxLog: TGroupBox
    Left = 416
    Top = 8
    Width = 180
    Height = 182
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Log '
    TabOrder = 2
    DesignSize = (
      180
      182)
    object SpeedButtonLogClear: TSpeedButton
      Left = 131
      Top = 151
      Width = 41
      Height = 25
      Caption = 'Clear'
      Flat = True
      OnClick = SpeedButtonLogClearClick
    end
    object SpeedButtonLogSave: TSpeedButton
      Left = 8
      Top = 151
      Width = 41
      Height = 25
      Caption = 'Save'
      Flat = True
      OnClick = SpeedButtonLogSaveClick
    end
    object SpeedButtonLogLoad: TSpeedButton
      Left = 49
      Top = 151
      Width = 41
      Height = 25
      Caption = 'Load'
      Flat = True
      OnClick = SpeedButtonLogLoadClick
    end
    object SpeedButtonDeleteLogItem: TSpeedButton
      Left = 90
      Top = 151
      Width = 41
      Height = 25
      Caption = 'Delete'
      Flat = True
      OnClick = SpeedButtonDeleteLogItemClick
    end
    object DBGridLog: TDBGrid
      Left = 8
      Top = 16
      Width = 164
      Height = 131
      Anchors = [akLeft, akTop, akRight]
      Ctl3D = True
      DataSource = DataSourceLog
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridLogDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'FirstName'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LastName'
          Width = 62
          Visible = True
        end>
    end
  end
  object RadioGroupSearchMethod: TRadioGroup
    Left = 8
    Top = 8
    Width = 201
    Height = 49
    Caption = ' Search Method '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Locate'
      'Lookup'
      'Manual')
    TabOrder = 3
    OnClick = RadioGroupSearchMethodClick
  end
  object GroupBoxLocateOptions: TGroupBox
    Left = 216
    Top = 8
    Width = 193
    Height = 49
    Caption = ' Locate Options '
    TabOrder = 4
    object CheckBoxPartialKey: TCheckBox
      Left = 9
      Top = 21
      Width = 73
      Height = 17
      Caption = 'Partial Key'
      TabOrder = 0
    end
    object CheckBoxCaseInsensitive: TCheckBox
      Left = 87
      Top = 21
      Width = 98
      Height = 17
      Caption = 'Case Insensitive'
      TabOrder = 1
    end
  end
  object GroupBoxResult: TGroupBox
    Left = 8
    Top = 137
    Width = 401
    Height = 53
    Caption = ' Result '
    Color = clBtnFace
    ParentColor = False
    TabOrder = 5
    object LabelResult: TLabel
      Left = 8
      Top = 15
      Width = 385
      Height = 31
      AutoSize = False
      Caption = ' Info:'
      Color = 16119285
      ParentColor = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object GroupBoxSearch: TGroupBox
    Left = 8
    Top = 60
    Width = 401
    Height = 73
    TabOrder = 6
    object LabelFirstName: TLabel
      Left = 86
      Top = 10
      Width = 55
      Height = 13
      Caption = 'First Name:'
    end
    object LabelLastName: TLabel
      Left = 198
      Top = 10
      Width = 54
      Height = 13
      Caption = 'Last Name:'
    end
    object LabelEmpNo: TLabel
      Left = 9
      Top = 10
      Width = 33
      Height = 13
      Caption = 'EmpNo'
    end
    object Bevel1: TBevel
      Left = 76
      Top = 6
      Width = 5
      Height = 65
      Shape = bsLeftLine
    end
    object Bevel2: TBevel
      Left = 309
      Top = 6
      Width = 5
      Height = 65
      Shape = bsLeftLine
    end
    object EditFirstName: TEdit
      Left = 85
      Top = 26
      Width = 105
      Height = 21
      MaxLength = 15
      TabOrder = 1
      OnChange = EditEmpNoChange
      OnEnter = EditFirstNameEnter
    end
    object EditLastName: TEdit
      Left = 197
      Top = 26
      Width = 105
      Height = 21
      MaxLength = 20
      TabOrder = 2
      OnChange = EditEmpNoChange
      OnEnter = EditFirstNameEnter
    end
    object BitBtnSearch: TBitBtn
      Left = 317
      Top = 14
      Width = 75
      Height = 49
      Caption = 'Search'
      Enabled = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF777777BDBDBDFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5084B20F6FE1
        325F8CB87E7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFABABAB9797978B8B8BC1C1C1FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB8B8B8BCBCBC9898988A8A8AC0C0C0FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF37A4FE
        379FFF0E6DDE355F89BB7F79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFBBBBBBBCBCBC9595958B8B8BC2C2C2FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFBBBBBBBABABA9696968C8C8CBABABAFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF38A5FE329DFF156DCE444F5BFF00FF9C6B65AF887BAF887EAA8075FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCB9B9B99494947E7E7EFF
        00FF979797AAAAAAABABABA5A5A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
        9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBED1D1D1A8A8A8A3
        A3A3D4D4D4F1F1F1F2F2F2EBEBEBC5C5C59D9D9DFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC0917DFCE9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFF
        FAE3D3D1996965FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1DD
        DDDDEBEBEBECECECEDEDEDF2F2F2FDFDFDE3E3E3969696FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
        FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D1
        D1D1E7E7E7EDEDEDF1F1F1FBFBFBFEFEFEFEFEFEB1B1B1FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB08978FEDA97EDB478FBEEBBFFFFD3FFFFDCFFFFF4FFFF
        F4FFFFE2E9DDBCA67B73FF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5C1
        C1C1E3E3E3EEEEEEF1F1F1FBFBFBFBFBFBF4F4F4DCDCDCA2A2A2FF00FFFF00FF
        FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
        DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D6D6D6B7
        B7B7D2D2D2EBEBEBEFEFEFF1F1F1F1F1F1EFEFEFE2E2E2A4A4A4FF00FFFF00FF
        FF00FFFF00FFFF00FFAA7F73FAE0A4F0B778EEBA7BF6DDA6FEFBCCFFFFD3FFFF
        D1FFFFD7D9C5A7A3756CFF00FFFF00FFFF00FFFF00FFFF00FFA4A4A4D9D9D9C2
        C2C2C3C3C3D8D8D8EBEBEBEEEEEEEDEDEDEFEFEFCECECE9E9E9EFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
        BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1F2
        F2F2D7D7D7C3C3C3CDCDCDDBDBDBE3E3E3E9E9E99F9F9FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFA1746BE1D4D3FFFEEEF7CC8CF0B473F7C788FCE3
        A5C2A088A5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9DE2
        E2E2F8F8F8CECECEC0C0C0CCCCCCDADADAB7B7B79F9F9FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
        6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96
        9696B3B3B3D3D3D3D0D0D0C9C9C99F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA77E70A98073A4786EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA2A2A2A3A3A39F9F9FFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtnSearchClick
    end
    object EditEmpNo: TEdit
      Left = 9
      Top = 26
      Width = 61
      Height = 21
      MaxLength = 8
      NumbersOnly = True
      TabOrder = 0
      OnChange = EditEmpNoChange
      OnEnter = EditEmpNoEnter
    end
    object CheckBoxAddToLog: TCheckBox
      Left = 85
      Top = 50
      Width = 221
      Height = 17
      Caption = 'Add First Name and Last Name to Log File'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CheckBoxRestrict: TCheckBox
      Left = 9
      Top = 50
      Width = 60
      Height = 17
      Caption = 'Restrict'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = CheckBoxRestrictClick
    end
  end
  object TableEmployees: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = TableEmployeesAfterScroll
    Left = 168
    Top = 272
    object TableEmployeesEmpNo: TIntegerField
      FieldName = 'EmpNo'
    end
    object TableEmployeesLastName: TStringField
      FieldName = 'LastName'
    end
    object TableEmployeesFirstName: TStringField
      FieldName = 'FirstName'
      Size = 15
    end
    object TableEmployeesPhoneExt: TStringField
      FieldName = 'PhoneExt'
      Size = 4
    end
    object TableEmployeesHireDate: TDateTimeField
      FieldName = 'HireDate'
    end
    object TableEmployeesSalary: TFloatField
      FieldName = 'Salary'
    end
  end
  object DataSourceEmployees: TDataSource
    DataSet = TableEmployees
    Left = 168
    Top = 326
  end
  object ClientDataSetLog: TClientDataSet
    PersistDataPacket.Data = {
      550000009619E0BD010000001800000002000000000003000000550009466972
      73744E616D650100490000000100055749445448020002000F00084C6173744E
      616D6501004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FirstName'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LastName'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 496
    Top = 56
    object ClientDataSetLogFirstName: TStringField
      FieldName = 'FirstName'
      Size = 15
    end
    object ClientDataSetLogLastName: TStringField
      FieldName = 'LastName'
    end
  end
  object DataSourceLog: TDataSource
    DataSet = ClientDataSetLog
    Left = 496
    Top = 104
  end
end
