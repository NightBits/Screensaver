unit Main;

interface

// Created by NightBits (Jeroen Saey)

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg;

{$D SCRNSAVE }

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image2: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    FFirstMouseMove: Boolean;
    FOldMouseX: Integer;
    FOldMouseY: Integer;
    FLastCursor: TCursor;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FFirstMouseMove : boolean;
  FOldMouseX : integer;
  FOldMouseY : integer;
  I : integer;

implementation

{$R *.dfm}

type
  TScreenSaverMode = (ssPassword, ssPreview, ssConfigure, ssRun);
var
  ScreenSaverMode: TScreenSaverMode;
  ParentSaverHandle: THandle = 0;

procedure SetScreenSaverMode;
begin
SetScreenSaverMode;
if ScreenSaverMode = ssConfigure then
  begin
 {Do Nothing};
  end
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
Application.Terminate;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
image2.left := Random (Monitor.Width - image2.Width + 50);
image2.Top :=  Random (Monitor.Height - image2.Height + 50);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const Sensitivity = 2;
begin
 if FFirstMouseMove then
begin
    FFirstMouseMove := False;
    FOldMouseX := X;
    FOldMouseY := Y;
  end
  else
  begin
    if (Abs(FOldMouseX - X) > Sensitivity) or
       (Abs(FOldMouseY - Y) > Sensitivity) then
      Application.Terminate;
      end;
      end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FFirstMouseMove := True;
  FLastCursor := Screen.Cursor;
  Screen.Cursor := crNone;
  Top := 0;
  Left := 0;
  Width :=  Monitor.Width;
  Height :=  Monitor.Height;
  ShowCursor(False);
end;
end.



