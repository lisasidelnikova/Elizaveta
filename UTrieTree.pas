unit UTrieTree;

interface

uses
  Windows,
  SysUtils,
  UTreeNode,
  ComCtrls;
  
Type
  TTrieTree = class
    private
      FTree: TNode;
    public
      Constructor Create;
      function IsEmpty: boolean;
      procedure Push (s: string);
      function res(chr:char):integer;
      procedure Clear;
      procedure print(treeView:TTreeView);
      destructor Destroy;
    end;

implementation

constructor TTrieTree.Create;
var ch:char;
begin
  Inherited Create;
  FTree:=TNode.Create;
end;

function TTrieTree.IsEmpty: boolean;
begin
  result:=Ftree.IsEmpty;
end;

procedure TTrieTree.Push(s: string);
var
  k:TIndex;

begin
  if Ftree= nil then
    begin
      {new(FTree);
      FTree.eow:=false;
      for k:='a' to 'z' do
        FTree.Ptrs[k]:=nil;}
      FTree := TNode.Create();
    end;

  if length(s)>0 then
    FTree.PushString(s,1);
end;

function TTrieTree.res(chr:char):integer;
begin
  result:=0;
  FTree.resString('',result,chr);
end;

procedure TTrieTree.print(treeView:TTreeView);
begin
  treeView.Items.Clear;
  Ftree.print(treeView, nil);
  treeView.FullExpand;
end;

procedure TTrieTree.Clear;
begin
  if not IsEmpty then
    FTree.Destroy;
end;

destructor TTrieTree.Destroy;
begin
  if FTree <> nil then
    Clear;
  inherited Destroy;
end;

end.
