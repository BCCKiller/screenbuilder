unit TestImageMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImageHandlerInt, adscnnct, jpeg, CBSComponents;

type
  TForm1 = class(TForm)
    Button1: TButton;
    AdsConnection1: TAdsConnection;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MyImage: TCBSDBImage;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  MyImage := TCBSDBImage.Create(Self);
  MyImage.Parent := Self;
  MyImage.Left := 20;
  MyImage.Top := 5;
  MyImage.BaseImage := 'RetinaOD1';
  MyImage.Visible := True;
  MyImage.Refresh;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  HandleImage(MyImage.BaseImage, '', '', 1234 );
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  HandleImage2(MyImage);

end;

end.
