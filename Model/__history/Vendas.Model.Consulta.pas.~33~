unit Vendas.Model.Consulta;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelConsulta = class(TInterfacedObject, iConsulta)
  private
    Produto: iProduto;
    FLista: TDictionary<Integer, iProduto>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConsulta;
    function BuscarProdutoID(Value: Integer): iProduto;
  end;

implementation

uses
  System.SysUtils, Vendas.Model.Produto;

{ TModelConsulta }

function TModelConsulta.BuscarProdutoID(Value: Integer): iProduto;
var
  I: Integer;
begin
  try
    FLista.TryGetValue(Value, Result);
    try
      Produto.Operacoes.Lista.TryGetValue(Value, Result);
    except
      raise Exception.Create('Produto não encontrado!');
    end;
  finally
    FLista.Add(Value, Result);
  end;
end;

constructor TModelConsulta.Create;
begin
  Produto := TModelProduto.New;
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
