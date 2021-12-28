unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Calendar,
  Buttons, EditBtn;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    FileButton: TBitBtn;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    folderNameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure FileButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FileButtonClick(Sender: TObject);
begin
  if SelectDirectoryDialog1.execute then
  begin
    folderNameEdit.Text := SelectDirectoryDialog1.FileName;
  end;
end;

end.

