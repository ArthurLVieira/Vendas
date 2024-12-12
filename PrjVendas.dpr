program PrjVendas;

uses
  Vcl.Forms,
  Vendas.View.Principal in 'View\Vendas.View.Principal.pas' {Form1},
  Vendas.Model.Interfaces in 'Model\Vendas.Model.Interfaces.pas',
  Vendas.Model.Produto in 'Model\Vendas.Model.Produto.pas',
  Vendas.Model.Consulta in 'Model\Vendas.Model.Consulta.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
