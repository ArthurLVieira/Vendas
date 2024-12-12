unit Vendas.Model.Venda;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelVenda = class(TInterfacedObject, iItemVenda)
  private
    FLista: TDictionary<Integer, iProduto>;
    FProduto: iProduto;
    FQuantidade: Double;
    FPrecoVenda: Currency;
    procedure VerificaProdutoNaVenda;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iItemVenda;
    function Add(Value: iProduto): iItemVenda;
    function Remove(Value: Integer): iItemVenda;
    function Itens: TDictionary<Integer, iProduto>;
    function SetQuantidade(Value: Double): iItemVenda;
    function SetPrecoVenda(Value: Currency): iItemVenda;
    function GetPrecoVenda: Currency;
  end;

implementation

uses
  System.SysUtils;

{ TModelVenda }

function TModelVenda.Add(Value: iProduto): iItemVenda;
var
  LastKey: Integer;
begin
  FProduto := Value;
  LastKey := FLista.Keys.ToArray[High(FLista.Keys.ToArray)];
  FLista.Add((LastKey + 1), FProduto)
end;

constructor TModelVenda.Create;
begin
  FLista := TDictionary<Integer, iProduto>.Create;
end;

destructor TModelVenda.Destroy;
begin
  FreeAndNil(FLista);

  inherited;
end;

function TModelVenda.Itens: TDictionary<Integer, iProduto>;
begin
  Result := FLista;
end;

class function TModelVenda.New: iItemVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.Remove(Value: Integer): iItemVenda;
begin
  try
    FLista.Remove(Value);
  except
    raise Exception.Create('Item n�o localizado!');
  end;
end;

function TModelVenda.SetQuantidade(Value: Double): iItemVenda;
begin
  Result := Self;
  VerificaProdutoNaVenda;
  if Value <= FProduto.GetQuantidade then
  begin
    FQuantidade := Value;
  end
  else
    raise Exception.Create('Quantidade insdisponivel no estoque!');
end;

procedure TModelVenda.VerificaProdutoNaVenda;
begin
  if not Assigned(FProduto) then
    raise Exception.Create('Venda sem Produto!');
end;

end.
