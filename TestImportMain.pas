unit TestImportMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, adsdata, adsfunc, adstable, StdCtrls, adscnnct;

type
  TForm1 = class(TForm)
    AdsTable1: TAdsTable;
    S_EXAM: TDataSource;
    MyPageControl: TPageControl;
    Button1: TButton;
    AdsConnection1: TAdsConnection;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses ScreenImport, CBSComponents;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with TScreenImporter.Create(Self,S_EXAM,MyPageControl) do
  begin
    try
      ImportScreen;
    finally
      Free;
    end;
  end;
end;

end.
