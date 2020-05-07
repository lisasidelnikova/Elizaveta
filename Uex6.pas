{Trie-деревь€
¬ Trie-дереве определить количество слов, содержащих букву "a"}
unit Uex6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,UTrieTree, ComCtrls;

type
  TForm1 = class(TForm)
    inputPnl: TGroupBox;
    btnPanel: TPanel;
    memoPnl: TPanel;
    inputMemo: TMemo;
    checkBtn: TButton;
    clearBtn: TButton;
    resulPnl: TGroupBox;
    resultMemo: TMemo;
    tv1: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationIdle(Sender: TObject; var done: Boolean);
    procedure MainBtnClick(Sender: TObject);
    procedure edtInputKeyPress(Sender: TObject; var Key: Char);
    procedure clearBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnIdle:=ApplicationIdle;
end;

procedure  TForm1.ApplicationIdle(Sender: TObject; var done: Boolean);
var isNotEmpty: Boolean;
begin
  isNotEmpty:=inputMemo.Text <> '';
  clearBtn.Enabled:=isNotEmpty;
  checkBtn.Enabled:=isNotEmpty;
end;

Function NextWord(str:string; var i:integer):string;
var
  len:integer;
begin
  len:=length(str);
  //пропуск пробелов
  while (i<=len) and (str[i]=' ') do
    inc(i);
  //формирование слова
  result:='';
  while (i<=len) and (str[i]<>' ') do
    begin
      result:=result+str[i];
      inc(i);
    end;
end;

procedure TForm1.MainBtnClick(Sender: TObject);
var
  i,k:integer;
  root:TTrieTree;
  s:string;
begin
  resultMemo.lines.clear;
  root:=TTrieTree.Create;
  for i:=0 to inputMemo.lines.Count-1 do
    begin
      k:=1;
      if trim(inputMemo.Lines[i])<>'' then
        while k<=length(inputMemo.Lines[i]) do
            root.push(NextWord(inputMemo.Lines[i],k));
    end;
  if root.IsEmpty then
    resultMemo.Lines.Add('ƒерево пусто')
  else
    begin
      i:=root.res('a');
      str(i,s);
      resultMemo.Lines.Add('—лов, в которых содержитс€ буква "а" : ' + s);
    end;
    root.print(tv1);
end;

procedure TForm1.edtInputKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in['a'..'z']) and (Ord(Key)>32) then
     Key:=#0;
end;

procedure TForm1.clearBtnClick(Sender: TObject);
begin
  resultMemo.lines.clear;
  inputMemo.lines.clear;
end;

end.
