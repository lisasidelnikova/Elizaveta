program Ex_6;

uses
  Forms,
  Uex6 in 'Uex6.pas' {Form1},
  UTreeNode in 'UTreeNode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
