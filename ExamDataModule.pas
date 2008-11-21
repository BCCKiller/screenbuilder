unit ExamDataModule;

interface

uses
  SysUtils, Classes, DB, adsdata, adsfunc, adstable;

type
  TExamData = class(TDataModule)
    ExamTable: TAdsTable;
    S_EXAMSURG: TDataSource;
    S_EXAM: TDataSource;
    S_EXAMALG: TDataSource;
    ExamALGTable: TAdsTable;
    ExamALRTTable: TAdsTable;
    S_EXAMALRT: TDataSource;
    ExamCLTable: TAdsTable;
    S_EXAMCL: TDataSource;
    ExamDiagTable: TAdsTable;
    S_EXAMDIAG: TDataSource;
    ExamImagTable: TAdsTable;
    S_EXAMIMAG: TDataSource;
    ExamIOPTable: TAdsTable;
    S_EXAMIOP: TDataSource;
    ExamMedTable: TAdsTable;
    S_EXAMMED: TDataSource;
    ExamRefrTable: TAdsTable;
    S_EXAMREFR: TDataSource;
    ExamSurgTable: TAdsTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExamData: TExamData;

implementation

{$R *.dfm}

end.
