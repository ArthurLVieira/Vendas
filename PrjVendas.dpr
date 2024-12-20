program PrjVendas;

uses
  Vcl.Forms,
  Vendas.View.Principal in 'View\Vendas.View.Principal.pas' {Form1},
  Vendas.Model.Interfaces in 'Model\Vendas.Model.Interfaces.pas',
  Vendas.Model.Produto in 'Model\Vendas.Model.Produto.pas',
  Vendas.Model.Consulta in 'Model\Vendas.Model.Consulta.pas',
  Vendas.Model.Venda in 'Model\Vendas.Model.Venda.pas',
  Vendas.Model.Cadastro.Produtos in 'Model\Vendas.Model.Cadastro.Produtos.pas',
  Vendas.Model.Venda.Produto in 'Model\Vendas.Model.Venda.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
