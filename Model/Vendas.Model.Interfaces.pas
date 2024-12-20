unit Vendas.Model.Interfaces;

interface

uses
  System.Generics.Collections;

type

  iProduto = interface
    ['{F4C6022E-5175-490A-A067-17FCBA6F6FD7}']
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    procedure SetDescricao(const Value: string);
    function GetDescricao: string;
    procedure SetQuantidade(const Value: Double);
    function GetQuantidade: Double;
    procedure SetPreco(const Value: Currency);
    function GetPreco: Currency;
    property ID: Integer read GetID write SetID;
    property Descricao: string read GetDescricao write SetDescricao;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property Preco: Currency read GetPreco write SetPreco;
  end;

  iCAdastroProduto = interface
    ['{C34B34B9-A551-4532-A62F-A01293FC34CE}']
    function Add(Value: iProduto): iCAdastroProduto;
    function Lista: TList<iProduto>;
  end;

  iConsulta = interface
    ['{0FB718C9-85B5-42B3-A3E3-FBACBC7921B9}']
    function Add(Value: TList<iProduto>): iConsulta;
    function BuscarProdutoID(Value: Integer): iProduto;
  end;

  iProdutoVenda = interface
    ['{FEEDB0BF-FC29-4BF5-B580-B1E401CBABBF}']
    function SetProduto(Value: iProduto): iProdutoVenda;
    function GetProduto: iProduto;
    function SetQuantidade(Value: Double): iProdutoVenda;
    function GetQuantidade: Double;
    function SetPrecoVenda(Value: Currency): iProdutoVenda;
    function GetPrecoVenda: Currency;
  end;

  iVenda = interface
    ['{76D64B58-235E-471D-9E70-E85267355D06}']
    function Add(Value: iProdutoVenda): iVenda;
    function Itens: TDictionary<Integer, iProdutoVenda>;
    function Remove(Value: Integer): iVenda;
    function Editar(Value: Integer): iProdutoVenda;
    function Clonar(Value: Integer): iVenda;
    function Cancelar: iVenda;
  end;

implementation

end.
