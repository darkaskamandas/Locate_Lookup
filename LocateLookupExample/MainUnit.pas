unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormMain = class(TForm)
    DBGridEmployees: TDBGrid;
    StatusBar: TStatusBar;
    GroupBoxLog: TGroupBox;
    SpeedButtonLogClear: TSpeedButton;
    SpeedButtonLogSave: TSpeedButton;
    SpeedButtonLogLoad: TSpeedButton;
    SpeedButtonDeleteLogItem: TSpeedButton;
    DBGridLog: TDBGrid;
    RadioGroupSearchMethod: TRadioGroup;
    GroupBoxLocateOptions: TGroupBox;
    CheckBoxPartialKey: TCheckBox;
    CheckBoxCaseInsensitive: TCheckBox;
    GroupBoxResult: TGroupBox;
    LabelResult: TLabel;
    GroupBoxSearch: TGroupBox;
    LabelFirstName: TLabel;
    LabelLastName: TLabel;
    LabelEmpNo: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    EditFirstName: TEdit;
    EditLastName: TEdit;
    BitBtnSearch: TBitBtn;
    EditEmpNo: TEdit;
    CheckBoxAddToLog: TCheckBox;
    CheckBoxRestrict: TCheckBox;
    TableEmployees: TClientDataSet;
    TableEmployeesEmpNo: TIntegerField;
    TableEmployeesLastName: TStringField;
    TableEmployeesFirstName: TStringField;
    TableEmployeesPhoneExt: TStringField;
    TableEmployeesHireDate: TDateTimeField;
    TableEmployeesSalary: TFloatField;
    DataSourceEmployees: TDataSource;
    ClientDataSetLog: TClientDataSet;
    ClientDataSetLogFirstName: TStringField;
    ClientDataSetLogLastName: TStringField;
    DataSourceLog: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TableEmployeesAfterScroll(DataSet: TDataSet);
    procedure RadioGroupSearchMethodClick(Sender: TObject);
    procedure SpeedButtonDeleteLogItemClick(Sender: TObject);
    procedure SpeedButtonLogClearClick(Sender: TObject);
    procedure SpeedButtonLogLoadClick(Sender: TObject);
    procedure SpeedButtonLogSaveClick(Sender: TObject);
    procedure DBGridLogDblClick(Sender: TObject);
    procedure EditEmpNoEnter(Sender: TObject);
    procedure EditEmpNoChange(Sender: TObject);
    procedure EditFirstNameEnter(Sender: TObject);
    procedure BitBtnSearchClick(Sender: TObject);
    procedure CheckBoxRestrictClick(Sender: TObject);
  private
    { Private declarations }
    MyCase: Integer;
    procedure UpdateStatusLine();
    procedure LocateSearch();
    procedure LookupSearch();
    procedure ManualSearch();
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

//--------------------------------------------------------------------------

procedure TFormMain.UpdateStatusLine;
begin
StatusBar.Panels.Items[0].Text :=
' Record Count := ' + IntToStr(TableEmployees.RecordCount);
StatusBar.Panels.Items[1].Text := ' Employee: ' +
TableEmployeesFirstName.AsString + ' ' +
TableEmployeesLastName.AsString + ' ' +
FloatToStrF(TableEmployeesSalary.AsFloat, ffCurrency, 15, 0);
if (LabelResult.Caption <> '') then LabelResult.Caption := '';

end;

//--------------------------------------------------------------------------

procedure TFormMain.LocateSearch;
var
Result: Boolean;
Options: TLocateOptions;
begin
Result := False; Options := [];

if CheckBoxPartialKey.Checked then Options := [loPartialKey];

if CheckBoxCaseInsensitive.Checked then Options := Options + [loPartialKey];

case MyCase of

0: Result :=
TableEmployees.Locate('EmpNo', EditEmpNo.Text, Options);

1: Result :=
TableEmployees.Locate('FirstName', VarArrayOf([EditFirstName.Text, EditLastName.Text]), Options);

2: Result :=
TableEmployees.Locate('FirstName', EditFirstName.Text, Options);

3: Result :=
TableEmployees.Locate('LastName', EditLastName.Text, Options);
end;
if(Result = True) then
begin
  LabelResult.Caption :=
  'EmpNo: ' + TableEmployeesEmpNo.AsString + ', ' +
  'FirstName: ' + TableEmployeesFirstName.AsString + ', ' +
  'LastName: ' + TableEmployeesLastName.AsString + ', ' +
  'PhoneExt: ' + TableEmployeesPhoneExt.AsString + ',' + #13#10 +
   'HireDate: ' + DateTimeToStr(TableEmployeesHireDate.AsDateTime) + ', Salary: ' +
   FloatToStrF(TableEmployeesSalary.AsFloat, ffCurrency, 15, 0);
end

else

begin
  LabelResult.Caption := 'No records found.';
  LabelResult.Color := RGB(255, 245, 245);
end;
end;

//--------------------------------------------------------------------------

procedure TFormMain.LookupSearch;

var
V: Variant;
begin
  case MyCase of
          0: V := TableEmployees.Lookup('EmpNo', EditEmpNo.Text,
          'EmpNo;FirstName;LastName;PhoneExt;HireDate;Salary');
          1: V := TableEmployees.Lookup('FirstName;LastName', VarArrayOf([EditFirstName.Text, EditLastName.Text]),
          'EmpNo;FirstName;LastName;PhoneExt;HireDate;Salary');
          2: V := TableEmployees.Lookup('FirstName', EditFirstName.Text,
          'EmpNo;FirstName;LastName;PhoneExt;HireDate;Salary');
          3: V := TableEmployees.Lookup('LastName', EditLastName.Text,
          'EmpNo;FirstName;LastName;PhoneExt;HireDate;Salary');

  end;
  if(not VarIsNull(V)) then
  begin

  LabelResult.Caption :=
  'EmpNo: ' + AnsiString(V[0]) + ', ' +
  'FirstName: ' + AnsiString(V[1]) + ', ' +
  'LastName: ' + AnsiString(V[2]) + ', ' +
  'PhoneExt: ' + AnsiString(V[3]) + ',' +  #13#10 +
  'HireDate: ' + DateTimeToStr(V[4]) + ', ' +
  'Salary: ' + FloatToStrF(Double(V[5]), ffCurrency, 15, 0);
  LabelResult.Color := RGB(245, 255, 245);
  end
  else
  begin
  LabelResult.Caption := 'No records found.';
  LabelResult.Color := RGB(255, 245, 245);
end;
end;

//--------------------------------------------------------------------------

procedure TFormMain.ManualSearch;
var
Found: Boolean;
Bookmark: TBookmark;
begin
Found := False;
Bookmark := TableEmployees.GetBookmark();
TableEmployees.DisableControls();
TableEmployees.First();
while (not TableEmployees.Eof) do
begin
  case MyCase of
  0: if (TableEmployeesEmpNo.AsString = EditEmpNo.Text) then
     Found := True;
  1: if ((TableEmployeesFirstName.AsString = EditFirstName.Text) and
     (TableEmployeesLastName.AsString = EditLastName.Text)) then
     Found := True;
  2: if (TableEmployeesFirstName.AsString = EditFirstName.Text) then
     Found := True;
  3: if (TableEmployeesLastname.AsString = EditLastName.Text) then
     Found := True;
  end;
  if Found then Break;
  TableEmployees.Next();
end;
if Found then
begin
  LabelResult.Color := RGB(245, 255, 245);
  LabelResult.Caption :=
  'EmpNo: ' + TableEmployeesEmpNo.AsString + ', ' +
  'FirstName: ' + TableEmployeesFirstName.AsString + ', ' +
  'LastName: ' + TableEmployeesLastName.AsString + ', ' +
  'PhoneExt: ' + TableEmployeesPhoneExt.AsString + ',' + #13#10 +
  'HireDate: ' + DateTimeToStr(TableEmployeesHireDate.AsDateTime) + ', Salary: ' +
  FloatToStrF(TableEmployeesSalary.AsFloat, ffCurrency, 15, 0);
  TableEmployees.FreeBookmark(Bookmark);
  TableEmployees.EnableConstraints();
end
else
begin
  LabelResult.Caption := 'No records found.';
  LabelResult.Color := RGB(255, 245, 245);
  TableEmployees.GotoBookmark(Bookmark);
  TableEmployees.FreeBookmark(Bookmark);
  TableEmployees.EnableControls();
end;
end;

//--------------------------------------------------------------------------

procedure TFormMain.FormCreate(Sender: TObject);
begin
if (TableEmployees.Active) then TableEmployees.Close();
TableEmployees.FileName :=
ExtractFilePath(Application.ExeName) + 'Employee.xml';
if (not TableEmployees.Active) then TableEmployees.Open();

end;

//--------------------------------------------------------------------------

procedure TFormMain.FormDestroy(Sender: TObject);
begin
if (TableEmployees.Active) then TableEmployees.Close();

end;

//--------------------------------------------------------------------------

procedure TFormMain.TableEmployeesAfterScroll(DataSet: TDataSet);
begin
UpdateStatusLine();
end;

//--------------------------------------------------------------------------

procedure TFormMain.RadioGroupSearchMethodClick(Sender: TObject);
begin
if (RadioGroupSearchMethod.ItemIndex = 0) then
begin
  CheckBoxCaseInsensitive.Enabled := True;
  CheckBoxPartialKey.Enabled := True;
end
else
begin
  CheckBoxCaseInsensitive.Enabled := False;
  CheckBoxPartialKey.Enabled := False;
end
end;

//--------------------------------------------------------------------------

procedure TFormMain.SpeedButtonDeleteLogItemClick(Sender: TObject);

var Msg: AnsiString;
begin
  if(ClientDataSetLog.RecordCount > 0) then
  begin
   Msg := 'Are you sure you want to delete record?';
   if(MessageDlg(Msg, mtConfirmation, mbYesNo, 0) = mrYes) then
   begin
     ClientDataSetLog.Delete();
   end
end
else
begin
  ShowMessage('No record to be deleted!');
end;
end;

//--------------------------------------------------------------------------

procedure TFormMain.SpeedButtonLogClearClick(Sender: TObject);
var Msg: AnsiString;
begin
  if(ClientDataSetLog.RecordCount > 0) then
  begin
   Msg := 'Are you sure you want to clear Log?';
   if(MessageDlg(Msg, mtConfirmation, mbYesNo, 0) = mrYes) then
   begin
     ClientDataSetLog.EmptyDataSet();
   end
end
else
begin
  ShowMessage('No records to deleted!');
    end
end;

//--------------------------------------------------------------------------

procedure TFormMain.SpeedButtonLogLoadClick(Sender: TObject);
begin
if(FileExists('Log.xml')) then
begin
  ClientDataSetLog.LoadFromFile('Log.xml');
end
else
begin
  ShowMessage('The [Log.xml] is not exists! First save the file.');
end
end;

//--------------------------------------------------------------------------

procedure TFormMain.SpeedButtonLogSaveClick(Sender: TObject);
begin
ClientDataSetLog.SaveToFile('Log.xml', dfXML);
ShowMessage('The [Log.xml] was successfully saved!');
end;

//--------------------------------------------------------------------------

procedure TFormMain.DBGridLogDblClick(Sender: TObject);
begin
if(ClientDataSetLog.RecordCount > 0) then
begin
  EditFirstNameEnter(Self);
  EditFirstName.Text := ClientDataSetLogFirstName.AsString;
   EditLastName.Text := ClientDataSetLogLastName.AsString;
end
end;

//--------------------------------------------------------------------------

procedure TFormMain.EditEmpNoEnter(Sender: TObject);
begin
EditEmpNo.Color := clWindow;
EditFirstName.Color := clBtnFace;
EditLastName.Color := clBtnFace;
EditFirstName.Text := '';
EditLastName.Text := '';
end;

//--------------------------------------------------------------------------

procedure TFormMain.EditEmpNoChange(Sender: TObject);
begin
if (LabelResult.Caption <> '') then
begin
  LabelResult.Caption := '';
  LabelResult.Color := RGB(245, 245, 245);
end;
BitBtnSearch.Enabled :=
((EditEmpNo.Text <> '') and
((EditFirstName.Text = '') and (EditLastName.Text = ''))) or
((EditEmpNo.Text = '') and
((EditFirstName.Text <> '') or (EditLastName.Text <> '')));
end;

//--------------------------------------------------------------------------

procedure TFormMain.EditFirstNameEnter(Sender: TObject);
begin
EditFirstName.Color := clWindow;
EditLastName.Color := clWindow;
EditEmpNo.Color := clWindow;
EditEmpNo.Text := '';
end;

//--------------------------------------------------------------------------

procedure TFormMain.BitBtnSearchClick(Sender: TObject);
var S, E: Int64;
begin
LabelResult.Caption := '';
if(EditEmpNo.Text <> '') then MyCase := 0 else
if((EditFirstName.Text <> '') and
   (EditLastName.Text <> '')) then MyCase := 1 else
if((EditFirstName.Text <> '') and
   (EditLastName.Text = '')) then MyCase := 2 else
   if ((EditFirstname.Text = '') and
   (EditLastName.Text <> '')) then MyCase := 3;

   if((MyCase > 0) and (CheckBoxAddToLog.Checked)) then
   begin
     if(not ClientDataSetLog.Locate('FirstName;LastName', VarArrayOf([EditFirstName.Text, EditLastName.Text]), [])) then
     begin
       ClientDataSetLog.Append();
       ClientDataSetLogFirstName.AsString := EditFirstName.Text;
       ClientDataSetLogLastName.AsString := EditLastName.Text;;
       ClientDataSetLog.Post();
     end;
   end;
   case RadioGroupSearchMethod.ItemIndex of
    0: begin
      S := GetTickCount();
      LocateSearch();
      E := GetTickCount();
    end;
    1: begin
      S := GetTickCount();
      LookupSearch();
      E := GetTickCount();
    end;
    2: begin
      S := GetTickCount();
      ManualSearch();
      E := GetTickCount();
    end;
   end;
   StatusBar.Panels.Items[2].Text := ' Time: ' + IntToStr(E-S) + ' ms';
end;

//--------------------------------------------------------------------------

procedure TFormMain.CheckBoxRestrictClick(Sender: TObject);
begin
EditEmpNo.NumbersOnly := CheckBoxRestrict.Checked;
end;

//--------------------------------------------------------------------------

end.
