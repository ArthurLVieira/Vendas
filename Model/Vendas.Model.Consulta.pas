unit Vendas.Model.Consulta;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelConsulta = class(TInterfacedObject, iConsulta)
  private
    Produtos: iCAdastroProduto;
    FListaProdutos: TList<iProduto>;
    FLista: TDictionary<Integer, iProduto>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConsulta;
    function BuscarProdutoID(Value: Integer): iProduto;
    function Add(Value: TList<iProduto>): iConsulta;
  end;

implementation

uses
  System.SysUtils, Vendas.Model.Cadastro.Produtos;

{ TModelConsulta }

function TModelConsulta.Add(Value: TList<iProduto>): iConsulta;
begin
  Result := Self;
  FListaProdutos.AddRange(Value);
end;

function TModelConsulta.BuscarProdutoID(Value: Integer): iProduto;
var
  I: Integer;
begin
  if not FLista.TryGetValue(Value, Result) then
  begin
    for I := 0 to Pred(FListaProdutos.Count) do
      if Value = FListaProdutos.Items[I].ID then
        Result := FListaProdutos.Items[I];

    if not Assigned(Result) then
      raise Exception.Create('Item n�o encontrado!');

    FLista.Add(Value, Result);
  end;
end;

constructor TModelConsulta.Create;
begin
  FLista := TDictionary<Integer, iProduto>.Create;
end;

destructor TModelConsulta.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

class function TModelConsulta.New: iConsulta;
begin
  Result := Self.Create;
end;

end.
