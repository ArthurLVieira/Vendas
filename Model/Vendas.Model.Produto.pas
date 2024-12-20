unit Vendas.Model.Produto;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelProduto = class(TInterfacedObject, iProduto)
  private
    FID: Integer;
    FDescricao: string;
    FQuantidade: Double;
    FPreco: Currency;
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    procedure SetDescricao(const Value: string);
    function GetDescricao: string;
    procedure SetQuantidade(const Value: Double);
    function GetQuantidade: Double;
    procedure SetPreco(const Value: Currency);
    function GetPreco: Currency;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iProduto;
    property ID: Integer read GetID write SetID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Preco: Currency read GetPreco write SetPreco;
  end;

implementation

uses
  System.SysUtils;

{ TModelProduto }

{ TModelProduto }

constructor TModelProduto.Create;
begin

end;

destructor TModelProduto.Destroy;
begin

  inherited;
end;

function TModelProduto.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TModelProduto.GetID: Integer;
begin
  Result := FID;
end;

function TModelProduto.GetPreco: Currency;
begin
  Result := FPreco;
end;

function TModelProduto.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

class function TModelProduto.New: iProduto;
begin
  Result := Self.Create;
end;

procedure TModelProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelProduto.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TModelProduto.SetPreco(const Value: Currency);
begin
  FPreco := Value;
end;

procedure TModelProduto.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

end.
