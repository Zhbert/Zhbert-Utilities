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
    SaveButton: TBitBtn;
    FileButton: TBitBtn;
    creationDateEdit: TDateEdit;
    GroupBox1: TGroupBox;
    pathLabel: TLabel;
    Memo1: TMemo;
    previewLabel: TLabel;
    modificationDateEdit: TDateEdit;
    postNameEdit: TEdit;
    categoriesNameEdit: TEdit;
    tagsNameEdit: TEdit;
    urlNameEdit: TEdit;
    folderNameEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FileButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Text := '';
  pathLabel.Caption := '';
end;

procedure TForm1.SaveButtonClick(Sender: TObject);
begin
  SaveButton.Enabled:=False;
  Memo1.Lines.SaveToFile(folderNameEdit.Text + '/' + pathLabel.Caption);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if postNameEdit.Text <> '' then
    begin
      if categoriesNameEdit.Text <> '' then
        begin
          if tagsNameEdit.Text <> '' then
            begin
              if folderNameEdit.Text <> '' then
                begin
                  Memo1.Text := '';
                  Memo1.Lines.Add('---');
                  Memo1.Lines.Add('layout: post');
                  Memo1.Lines.Add('title:  "' + postNameEdit.Text + '"');
                  Memo1.Lines.Add('date:   ' + creationDateEdit.Text);
                  Memo1.Lines.Add('last_modified_at: ' + modificationDateEdit.Text);
                  Memo1.Lines.Add('categories: [' + categoriesNameEdit.Text + ']');
                  Memo1.Lines.Add('tags: [' + tagsNameEdit.Text + ']');
                  Memo1.Lines.Add('---');
                  if urlNameEdit.Text <> '' then
                    begin
                      SaveButton.Enabled:=True;
                      urlNameEdit.Text := StringReplace(urlNameEdit.Text , ' ','_', [rfReplaceAll, rfIgnoreCase]);
                      urlNameEdit.Text := LowerCase(urlNameEdit.Text);
                      pathLabel.Caption := StringReplace(creationDateEdit.Text , '.','-', [rfReplaceAll, rfIgnoreCase])
                                        + '-' + urlNameEdit.Text + '.md';
                    end else ShowMessage('Please enter the url name!');
                end else ShowMessage('You need to select a directory!');
            end else ShowMessage('Fill in the field with tags!');
        end else ShowMessage('Fill in the field with categories!');
    end else ShowMessage('Fill in the field with the topic name!');
end;

end.

