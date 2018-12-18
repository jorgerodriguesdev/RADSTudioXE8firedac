object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FireDac'
  ClientHeight = 397
  ClientWidth = 540
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
    Left = 32
    Top = 32
    Width = 73
    Height = 13
    Caption = 'DeptNo (Input)'
  end
  object Label2: TLabel
    Left = 32
    Top = 64
    Width = 69
    Height = 13
    Caption = 'Total (Output)'
  end
  object txtDEPT_NO: TEdit
    Left = 120
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object txtTOTAL: TEdit
    Left = 120
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnExecute: TButton
    Left = 32
    Top = 96
    Width = 121
    Height = 25
    Caption = 'Execute Stored Proc'
    TabOrder = 2
    OnClick = btnExecuteClick
  end
  object btnExecuteDirect: TButton
    Left = 174
    Top = 96
    Width = 99
    Height = 25
    Caption = 'Exec Direct'
    TabOrder = 3
    OnClick = btnExecuteDirectClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 208
    Width = 540
    Height = 189
    Align = alBottom
    DataSource = ds
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object con: TFDConnection
    Params.Strings = (
      'ConnectionDef=FBEMPLOYEE')
    Connected = True
    LoginPrompt = False
    Left = 288
    Top = 32
  end
  object cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 352
    Top = 32
  end
  object proc: TFDStoredProc
    Connection = con
    StoredProcName = 'DEPT_BUDGET'
    Left = 416
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'DNO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 2
        Name = 'TOT'
        DataType = ftFMTBcd
        Precision = 12
        NumericScale = 2
        ParamType = ptOutput
        Value = '0'
      end>
  end
  object MasterConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MASTER')
    Connected = True
    LoginPrompt = False
    Left = 52
    Top = 141
  end
  object Select_employeeProc: TFDStoredProc
    Active = True
    Connection = MasterConnection
    StoredProcName = 'master.dbo.SELECT_EMPLOYEE'
    Left = 172
    Top = 147
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end>
  end
  object ds: TDataSource
    DataSet = qry_proc
    Left = 272
    Top = 144
  end
  object qry_proc: TFDQuery
    Active = True
    Connection = MasterConnection
    SQL.Strings = (
      'EXEC SELECT_EMPLOYEE')
    Left = 360
    Top = 144
  end
end
