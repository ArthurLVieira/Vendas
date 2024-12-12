unit Vendas.Model.Produto;

interface

uses Vendas.Model.Interfaces, System.Generics.Collections;

type

  TModelProduto = class(TInterfacedObject, iProduto, iOperacoes)
  private
    FID: Integer;
    FLista: TDictionary<integer, iProduto>;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iProduto;
    function SetID(Value: Integer): iProduto;
    function GetID: Integer;
    function Operacoes: iOperacoes;
    function Add(Value: iProduto): iOperacoes;
    function Lista: TDictionary<integer, iProduto>;
    function &End: iProduto;
  end;

implementation

uses
  System.SysUtils;

{ TModelProduto }

function TModelProduto.Add(Value: iProduto): iOperacoes;
begin
  FLista.Add(Value.GetID, Value);
end;

function TModelProduto.&End: iProduto;
begin
  Result := Self;
end;

constructor TModelProduto.Create;
begin
  FLista := TDictionary<integer, iProduto>.Create;
end;

destructor TModelProduto.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TModelProduto.GetID: Integer;
begin
  Result := FID;
end;

function TModelProduto.Lista: TDictionary<integer, iProduto>;
begin
  Result := FLista;
end;

class function TModelProduto.New: iProduto;
begin
  Result := Self.Create;
end;

function TModelProduto.Operacoes: iOperacoes;
begin
  Result := Self;
end;

function TModelProduto.SetID(Value: Integer): iProduto;
begin
  Result := Self;
  FID := Value;
end;

end.
