unit Vendas.Model.Interfaces;

interface

uses
  System.Generics.Collections;

type

  iProduto = interface;

  iOperacoes = interface
    ['{E1EA3147-8BE7-4668-8C53-EC9CDF4476B9}']
    function Add(Value: iProduto): iOperacoes;
    function Lista: TDictionary<integer, iProduto>;
    function &End: iProduto;
  end;

  iProduto = interface
    ['{F4C6022E-5175-490A-A067-17FCBA6F6FD7}']
    function SetID(Value: integer): iProduto;
    function GetID: integer;
    function SetQuantidade(Value: Double): iProduto;
    function GetQuantidade: Double;
    function SetPreco(Value: Currency): iProduto;
    function GetPreco: Currency;
    function Operacoes: iOperacoes;
  end;

  iConsulta = interface
    ['{0FB718C9-85B5-42B3-A3E3-FBACBC7921B9}']
    function BuscarProdutoID(Value: integer): iProduto;
  end;

  iProdutoVenda = interface
    ['{FEEDB0BF-FC29-4BF5-B580-B1E401CBABBF}']
    function Add(Value: iProduto): iProdutoVenda;
    function Remove(Value: integer): iProdutoVenda;
    function Itens: TDictionary<integer, iProduto>;
    function SetQuantidade(Value: Double): iProdutoVenda;
    function GetQuantidade: Double;
    function SetPrecoVenda(Value: Currency): iProdutoVenda;
    function GetPrecoVenda: Currency;
  end;

implementation

end.
