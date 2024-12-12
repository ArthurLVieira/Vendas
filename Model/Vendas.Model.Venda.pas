unit Vendas.Model.Venda;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelVenda = class(TInterfacedObject, iItemVenda)
  private
    FLista: TDictionary<Integer, iProduto>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iItemVenda;
    function Add(Value: iProduto): iItemVenda;
    function Remove(Value: Integer): iItemVenda;
    function SetQuantidade(Value: Double): iItemVenda;
    function Itens: TDictionary<integer, iProduto>;
  end;

implementation

{ TModelVenda }

function TModelVenda.Add(Value: iProduto): iItemVenda;
var
  I: Integer;
begin
  for I := 0 to Pred(FLista.Count) do
    if FLista.Values.ToArray[High(FLista.Values.ToArray)] then
    
    FLista.Add((I + 1), Value);
end;

constructor TModelVenda.Create;
begin

end;

destructor TModelVenda.Destroy;
begin

  inherited;
end;

function TModelVenda.Itens: TDictionary<integer, iProduto>;
begin

end;

class function TModelVenda.New: iItemVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.Remove(Value: Integer): iItemVenda;
begin

end;

function TModelVenda.SetQuantidade(Value: Double): iItemVenda;
begin

end;

end.
