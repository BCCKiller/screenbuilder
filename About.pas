(*  GREATIS RUNTIME FUSION COMPLETE DEMO      *)
(*  Copyright (C) 2003-2004 Greatis Software  *)
(*  http://www.greatis.com/delphicb/runtime/  *)
(*  http://www.greatis.com/bteam.html         *)

unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ShellAPI;

type
  TfrmAbout = class(TForm)
    pnlName: TPanel;
    lblDescription: TLabel;
    pnlSpace: TPanel;
    lblFormDes: TLabel;
    btnClose: TButton;
    Products: TLabel;
    procedure lblLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}

procedure TfrmAbout.lblLinkClick(Sender: TObject);
begin
  with Sender as TLabel do
    ShellExecute(Application.Handle,nil,PChar(Hint),nil,nil,SW_SHOWDEFAULT);
end;

end.
