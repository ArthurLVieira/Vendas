unit Vendas.Model.Venda.Produto;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelVendaProduto = class(TInterfacedObject, iProdutoVenda)
  private
    FProdutoVenda: iProduto;
    FPrecoVenda: Currency;
    FQuantidadeVenda: Double;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iProdutoVenda;
    function SetProduto(Value: iProduto): iProdutoVenda;
    function GetProduto: iProduto;
    function SetQuantidade(Value: Double): iProdutoVenda;
    function GetQuantidade: Double;
    function SetPrecoVenda(Value: Currency): iProdutoVenda;
    function GetPrecoVenda: Currency;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TModelVendaProduto }

constructor TModelVendaProduto.Create;
begin
  FPrecoVenda := FProdutoVenda.Preco;
  if FProdutoVenda.Quantidade <= 0 then
    raise Exception.Create('Produto sem estoque!');
  FQuantidadeVenda := 1;
end;

destructor TModelVendaProduto.Destroy;
begin
  inherited;
end;

function TModelVendaProduto.GetPrecoVenda: Currency;
begin
  Result := FPrecoVenda;
end;

function TModelVendaProduto.GetProduto: iProduto;
begin
  Result := FProdutoVenda;
end;

function TModelVendaProduto.GetQuantidade: Double;
begin
  Result := FQuantidadeVenda;
end;

class function TModelVendaProduto.New: iProdutoVenda;
begin
  Result := Self.Create;
end;

function TModelVendaProduto.SetPrecoVenda(Value: Currency): iProdutoVenda;
begin
  if Value.ToString <> '' then
  begin
    if Value < FProdutoVenda.Preco then
      ShowMessage('Valor de venda menor que o valor do produto!');
    FPrecoVenda := Value;
  end;

end;

function TModelVendaProduto.SetProduto(Value: iProduto): iProdutoVenda;
begin
  FProdutoVenda := Value;
end;

function TModelVendaProduto.SetQuantidade(Value: Double): iProdutoVenda;
begin
  if Value > FProdutoVenda.Quantidade then
    raise Exception.Create('Quantidade de venda: ' + FloatToStr(Value) +
      ', menor que em estoque: ' + FloatToStr(FProdutoVenda.Quantidade));
  FQuantidadeVenda := Value;
end;

end.
