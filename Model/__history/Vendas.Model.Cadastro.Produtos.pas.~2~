unit Vendas.Model.Cadastro.Produtos;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelCadProdutos = class(TInterfacedObject, iCAdastroProduto)
  private
    FLista: TList<iProduto>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iCAdastroProduto;
    function Add(Value: iProduto): iCAdastroProduto;
    function Lista: TList<iProduto>;
  end;

implementation

uses
  System.SysUtils;

{ TModelCadProdutos }

function TModelCadProdutos.Add(Value: iProduto): iCAdastroProduto;
begin
  Result := Self;
  FLista.Add(Value);
end;

constructor TModelCadProdutos.Create;
begin
  FLista := TList<iProduto>.Create;
end;

destructor TModelCadProdutos.Destroy;
begin
  FreeAndNil(FLista);

  inherited;
end;

function TModelCadProdutos.Lista: TList<iProduto>;
begin
  Result := FLista;
end;

class function TModelCadProdutos.New: iCAdastroProduto;
begin
  Result := Self.Create;
end;

end.
