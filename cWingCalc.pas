unit cWingCalc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, System.Generics.Collections,
  Vcl.ExtCtrls, SynCommons;

type
  TForm1 = class(TForm)
    mmoOutput: TMemo;
    pnl1: TPanel;
    pnl2: TPanel;
    lblNoWings: TLabel;
    se1: TSpinEdit;
    btnCalculate: TButton;
    procedure btnCalculateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fWingPrice : TDictionary<integer, Float32>;
    KeyArray : TIntegerDynArray;
    function GetMinPrice : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalculateClick(Sender: TObject);
var
  Min : string;
begin
  Min := GetMinPrice;
  mmoOutput.Lines.Add(Min);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  SetLength(keyArray, 40);
  fWingPrice := TDictionary<Integer, Float32>.Create;
  fWingPrice.Add(150,1.112);
  fWingPrice.Add(125,1.112);
  fWingPrice.Add(50,1.112);
  fWingPrice.Add(25,1.112);
  fWingPrice.Add(200,1.113);
  fWingPrice.Add(100,1.113);
  fWingPrice.Add(75,1.113);
  fWingPrice.Add(26,1.113);
  fWingPrice.Add(80,1.114);
  fWingPrice.Add(28,1.114);
  fWingPrice.Add(27,1.115);
  fWingPrice.Add(90,1.116);
  fWingPrice.Add(29,1.116);
  fWingPrice.Add(60,1.117);
  fWingPrice.Add(30,1.117);
  fWingPrice.Add(70,1.119);
  fWingPrice.Add(35,1.119);
  fWingPrice.Add(40,1.120);
  fWingPrice.Add(45,1.122);
  fWingPrice.Add(21,1.133);
  fWingPrice.Add(18,1.133);
  fWingPrice.Add(15,1.133);
  fWingPrice.Add(12,1.133);
  fWingPrice.Add(9,1.133);
  fWingPrice.Add(6,1.133);
  fWingPrice.Add(22,1.134);
  fWingPrice.Add(19,1.134);
  fWingPrice.Add(16,1.134);
  fWingPrice.Add(24,1.135);
  fWingPrice.Add(23,1.135);
  fWingPrice.Add(20,1.135);
  fWingPrice.Add(17,1.135);
  fWingPrice.Add(13,1.135);
  fWingPrice.Add(10,1.135);
  fWingPrice.Add(14,1.136);
  fWingPrice.Add(11,1.136);
  fWingPrice.Add(7,1.136);
  fWingPrice.Add(8,1.138);
  fWingPrice.Add(4,1.138);
  fWingPrice.Add(5,1.140);
  keyArray[0] := 150;
  keyArray[1] := 125;
  keyArray[2] := 50;
  keyArray[3] := 25;
  keyArray[4] := 200;
  keyArray[5] := 100;
  keyArray[6] := 75;
  keyArray[7] := 26;
  keyArray[8] := 80;
  keyArray[9] := 28;
  keyArray[10] := 27;
  keyArray[11] := 90;
  keyArray[12] := 29;
  keyArray[13] := 60;
  keyArray[14] := 30;
  keyArray[15] := 70;
  keyArray[16] := 35;
  keyArray[17] := 40;
  keyArray[18] := 45;
  keyArray[19] := 21;
  keyArray[20] := 18;
  keyArray[21] := 15;
  keyArray[22] := 12;
  keyArray[23] := 9;
  keyArray[24] := 6;
  keyArray[25] := 22;
  keyArray[26] := 19;
  keyArray[27] := 16;
  keyArray[28] := 24;
  keyArray[29] := 23;
  keyArray[30] := 20;
  keyArray[31] := 17;
  keyArray[32] := 13;
  keyArray[33] := 10;
  keyArray[34] := 14;
  keyArray[35] := 11;
  keyArray[36] := 7;
  keyArray[37] := 8;
  keyArray[38] := 4;
  keyArray[39] := 5;
end;

function TForm1.GetMinPrice: string;
var
 I : integer;
 combo, index : TIntegerDynArray;
 comboDynArray, indexDynArray : TDynArray;
 current : integer;
 goal : integer;
 found, finished : bool;
 cost : Float32;
begin
  comboDynArray.Init(TypeInfo(TIntegerDynArray), combo);
  indexDynArray.Init(TypeInfo(TIntegerDynArray), index);
  found := false;
  finished := false;
  goal := se1.Value;
  I := 0;
  current := 0;
  cost := 0;
  while not finished do
  begin
    if current + keyArray[i] = goal then
    begin
      current := current + keyArray[I];
      comboDynArray.Add(keyArray[I]);
      finished := true;
      found := true;
    end
    else if current + keyArray[i] > goal then
      inc(I)
    else
    begin
      current := current + keyArray[I];
      comboDynArray.Add(keyArray[I]);
      indexDynArray.Add(I);
    end;

    if (I = length(keyArray)) and (not found) then
    begin
      current := current - keyArray[index[indexDynArray.Count - 1]];
      I := index[indexDynArray.Count - 1] + 1;
      if I = length(keyArray) then
      begin
        finished := true;
        exit;
      end;

      indexDynArray.Delete(indexDynArray.Count - 1);
      comboDynArray.Delete(comboDynArray.Count - 1);
    end;


  end;

  if found = false then
    result := 'No Valid Combination Found'
  else
  begin
    result := 'The cheapest combo for ' + goal.tostring + ' wings is: ';
    for I in combo do
    begin
      result := result + I.ToString + ' + ';
      cost := cost + ((fWingPrice[I]/goal) * I );
    end;
    result := copy(result, 0, length(result) - 2) + '@ ' + format('%.3f', [cost]) + ' per wing';

  end;

end;

end.
