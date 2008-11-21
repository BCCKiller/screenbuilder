unit DrawingGridCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Grids;

const
  UM_INVALIDATEROW = WM_USER+321;
type
  TForm1 = class(TForm)
    StatusBar: TStatusBar;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1Enter(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
  private
    { Private declarations }
    FGridActive: Boolean;
    Procedure UMInvalidateRow( var msg: TMessage ); message UM_INVALIDATEROW;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  dummy: Integer;

implementation

{$R *.DFM}

type
  TGridCracker = class( TStringgrid ); // gives access to protected methods

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  // Task: color the current row
  grid:= Sender as TStringgrid;
  if FGridActive and (aRow = grid.Row) and (aCol >= grid.FixedCols) then
begin
    grid.Canvas.brush.Color := clBlue;
    grid.canvas.font.color := clWhite;
    grid.canvas.FillRect( Rect );
    InflateRect( rect, -2, -2 );
    grid.Canvas.TextRect( Rect, rect.left, rect.top, grid.cells[aCol, aRow]);
  end
  else if (gdSelected In State) and not grid.Focused then Begin
    grid.Canvas.brush.Color := grid.color;
    grid.canvas.font.color := grid.font.color;
    grid.canvas.FillRect( Rect );
    InflateRect( rect, -2, -2 );
    grid.Canvas.TextRect( Rect, rect.left, rect.top, grid.cells[aCol, aRow]);
  End;
end;

procedure TForm1.StringGrid1Enter(Sender: TObject);
begin
  if sender is TStringgrid then
    With TGridCracker( sender ) do
      POstMessage( self.handle, UM_INVALIDATEROW, Row, Integer(sender));
  FGridActive := true;
  { Cannot rely on grid.focused here, it is not yet true when the
    message send above is processed for some reason. }
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  grid: TStringgrid;
begin
  grid:= Sender as TStringgrid;
  If grid.Row <> aRow Then
    PostMessage( handle, UM_INVALIDATEROW, grid.Row, Integer(grid));
  PostMessage( handle, UM_INVALIDATEROW, aRow, Integer(grid));
end;

procedure TForm1.UMInvalidateRow(var msg: TMessage);
begin
  TGridCracker( msg.lparam ).InvalidateRow( msg.wparam );
end;

procedure TForm1.StringGrid1Exit(Sender: TObject);
begin
  if sender is TStringgrid then
    With TGridCracker( sender ) do
      POstMessage( self.handle, UM_INVALIDATEROW, Row, Integer(sender));
    FGridActive := false;
end;
********
type
  TGridCracker = Class( TStringgrid );
  // required to access protected method Invalidaterow

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  With TGridCracker( Sender As TStringgrid ) Do Begin
    InvalidateRow( Row );
    InvalidateRow( aRow );
  End;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  grid: TStringgrid;
begin
  If gdFixed In State Then Exit;

  grid := Sender As TStringgrid;
  If grid.Row = aRow Then Begin
    With Grid.Canvas.Brush Do Begin
      Color := $C0FFFF;  // pale yellow
      Style := bsSolid;
    End;
    grid.Canvas.FillRect( Rect );
    grid.Canvas.Font.Color := clBlack;
    grid.Canvas.TextRect( Rect, Rect.Left+2, Rect.Top+2, grid.Cells[acol,
arow]);
    Grid.Canvas.Brush := grid.Brush;
  End;
end;
end.
