unit UTreeNode;

interface
uses
  ComCtrls;

Type
  TIndex = 'a'..'z';
  PtrTrieTree = ^TNode;
  TNode = class
  private
    Ptrs: array [TIndex] of TNode;
    eow: boolean;
  public
  Constructor Create;
  procedure PushString (s: string; i:byte);
  procedure PrintString (s:string);
  procedure resString (s:string;var i:integer;chr:char);
  function IsEow: boolean;
  procedure SetEow(ok: boolean);
  function IsEmpty:boolean;
  procedure print(treeView: TTreeView; parent:TTreeNode);
  destructor Destroy;
end;

implementation

constructor TNode.Create;
var ch:char;
begin
  inherited;
  self.eow:=false;
  for ch:=low(TIndex) to High(TIndex) do

      Ptrs[ch]:=nil;
end;

Function TNode.IsEmpty: boolean;
var ch:char;
begin
  result:=true;
  ch:=Low(TIndex);
  repeat
    result:=Ptrs[ch]=nil;
    inc(ch);
  until (not result) or (ch = High(TIndex))
end;

function TNode.IsEow;
begin
  result:=eow;
end;

procedure TNode.SetEow(ok: boolean);
begin
  eow:=ok;
end;

procedure TNode.PushString (s: string; i:byte);
begin
  if ptrs[s[i]] = nil then
    ptrs[s[i]] := TNode.Create;
  if length(s)<=i then
     ptrs[s[i]].SetEow(true)
  else
    Ptrs[S[i]].PushString(s,i+1);
end;

procedure TNode.print(treeView: TTreeView; parent:TTreeNode);
var
  i:Char;
  newParent: TTreeNode;
begin
  for i:= Low(TIndex) to high(TIndex) do
      if ptrs[i]<>nil then
        begin
          newParent := treeView.Items.AddChild(parent, i);
          ptrs[i].print(treeView, newParent);
        end;
end;

procedure TNode.PrintString (s:string);
var ch: TIndex;
begin
  if eow then
    writeln(s);
  for ch:=Low(TIndex) to High(TIndex) do
    if Ptrs[ch]<>nil then
      Ptrs[ch].PrintString(s+ch)
end;

procedure TNode.resString (s:string;var i:integer;chr:char);
var
  k:integer;
  ch: TIndex;
  ok:boolean;
begin
  if eow then
    begin
      k:=1;
      ok:=false;
      while (not ok) and (k<=length(s)) do
        begin
          if s[k] = chr then
            ok:=true;
          inc(k);
        end;
      if ok then
        inc(i);
    end;

  for ch:=Low(TIndex) to High(TIndex) do
    if Ptrs[ch]<>nil then
      Ptrs[ch].resString(s+ch,i,chr)
end;

Destructor TNode.Destroy;
var ch: TIndex;
begin
  for ch:=low(TIndex) to High(TIndex) do
    if Ptrs[ch] <> nil then
      Ptrs[ch].Destroy;
    inherited;
end;

end.
