unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, Vcl.Grids, Vcl.DBGrids;

type
  TFrmMain = class(TForm)
    con: TFDConnection;
    cursor: TFDGUIxWaitCursor;
    proc: TFDStoredProc;
    Label1: TLabel;
    txtDEPT_NO: TEdit;
    Label2: TLabel;
    txtTOTAL: TEdit;
    btnExecute: TButton;
    btnExecuteDirect: TButton;
    MasterConnection: TFDConnection;
    Select_employeeProc: TFDStoredProc;
    ds: TDataSource;
    DBGrid1: TDBGrid;
    qry_proc: TFDQuery;
    procedure btnExecuteClick(Sender: TObject);
    procedure btnExecuteDirectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnExecuteClick(Sender: TObject);
begin
  proc.ParamByName('DNO').AsString := txtDEPT_NO.Text;
  if not proc.Prepared then
    proc.Prepare();
  proc.ExecProc();
  txtTOTAL.Text := proc.ParamByName('TOT').AsString;
end;

procedure TFrmMain.btnExecuteDirectClick(Sender: TObject);
begin
  proc.ExecProc('DELETE_EMPLOYEE',[145]);
end;

end.
