unit Vendas.Model.Venda;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelVenda = class(TInterfacedObject, iVenda)
  private
    FLista: TDictionary<Integer, iProdutoVenda>;
    FProduto: iProdutoVenda;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iVenda;
    function Add(Value: iProdutoVenda): iVenda;
    function Itens: TDictionary<Integer, iProdutoVenda>;
    function Remove(Value: Integer): iVenda;
    function Editar(Value: Integer): iProdutoVenda;
    function Clonar(Value: Integer): iVenda;
    function Cancelar: iVenda;
  end;

implementation

uses
  System.SysUtils, Vendas.Model.Venda.Produto;

{ TModelVenda }

function TModelVenda.Add(Value: iProdutoVenda): iVenda;
var
  LastKey: Integer;
begin
  Result := Self;
  FProduto := Value;
  LastKey := FLista.Keys.ToArray[High(FLista.Keys.ToArray)];
  FLista.Add((LastKey + 1), FProduto);
end;

function TModelVenda.Cancelar: iVenda;
begin
  Result := Self;
  FLista.Clear;
end;

function TModelVenda.Clonar(Value: Integer): iVenda;
var
  ProdutoVenda: iProdutoVenda;
  Clone: iProdutoVenda;
begin
  Result := Self;
  try
    FLista.TryGetValue(Value, ProdutoVenda);
    try
      Clone := TModelVendaProduto.New;
      Clone.SetProduto(ProdutoVenda.GetProduto);
      Clone.SetQuantidade(ProdutoVenda.GetQuantidade);
      Clone.SetPrecoVenda(ProdutoVenda.GetPrecoVenda);
    finally
       Self.Add(Clone);
    end;
  except
    raise Exception.Create('Item não localizado!');
  end;
end;

constructor TModelVenda.Create;
begin
  FLista := TDictionary<Integer, iProdutoVenda>.Create;
end;

destructor TModelVenda.Destroy;
begin
  FreeAndNil(FLista);

  inherited;
end;

function TModelVenda.Editar(Value: Integer): iProdutoVenda;
begin
  if not FLista.TryGetValue(Value, Result) then
    raise Exception.Create('Item não localizada!');
end;

function TModelVenda.Itens: TDictionary<Integer, iProdutoVenda>;
begin
  Result := FLista;
end;

class function TModelVenda.New: iVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.Remove(Value: Integer): iVenda;
begin
  Result := Self;
  try
    FLista.Remove(Value);
  except
    raise Exception.Create('Item não localizado!');
  end;
end;

end.
