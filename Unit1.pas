unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    //button1:TButton;
  private
    { Private declarations }
  public
    //Form1;
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure printTest(root:pnode;x:integer);
begin
 if root<>sentinel then
 begin
   Form1.Canvas.TextOut(50+x,20,IntToStr(root^.value));
  // write(root^.value,' ');
   printTest(root^.left,x+50);
   printTest(root^.right,x+50);
 end;
end;

{procedure TForm1.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Color:= clRed;
  Canvas.Rectangle(10, 10, 100, 100);
end;    }
procedure TForm1.btn1Click(Sender: TObject);
var i,x,y:Integer;
begin

 New(sentinel);
 sentinel^.left:=sentinel;
 sentinel^.right:=sentinel;
 sentinel^.parent:=nil;
 sentinel^.color:=BLACK;

 for i:=1 to 16 do //????????? ??????
 TreeInsert(root,i);
   printTest(root,20);
  x:=0;
  y:=0;
  for i:=0 to 0 do
  begin
    Form1.Canvas.Ellipse(280+x,10,320+x,50);   //зависимость первоначального х2-x1: 40
    Form1.Canvas.TextOut(290+x,20,'Tree');
    x:=x+50;
  end;
  
  Form1.Canvas.MoveTo(291,49);
  Form1.Canvas.LineTo(190,80);
  Form1.Canvas.MoveTo(309,47);
  Form1.Canvas.LineTo(375,75);

  x:=0;
  y:=50;
  for i:=1 to 2 do
  begin
    Form1.Canvas.Ellipse(190+x,10+y,230+x,50+y);  //+50y down
    Form1.Canvas.TextOut(200+x,20+y,'Tree');
    x:=x+185;
  end;

  Form1.Canvas.MoveTo(190,90);
  Form1.Canvas.LineTo(165,115);
  Form1.Canvas.MoveTo(225,90);
  Form1.Canvas.LineTo(265,115);


  Form1.Canvas.MoveTo(375,90);
  Form1.Canvas.LineTo(365,115);
  Form1.Canvas.MoveTo(410,90);
  Form1.Canvas.LineTo(435,115);
  
  x:=0;
  y:=100;
  for i:=3 to 6 do
  begin
    Form1.Canvas.Ellipse(140+x,10+y,180+x,50+y);  //+100y down
    Form1.Canvas.TextOut(150+x,20+y,'Tree');
    x:=x+95;
  end;

  Form1.Canvas.MoveTo(160,148);
  Form1.Canvas.LineTo(130,180);
  Form1.Canvas.MoveTo(160,148);
  Form1.Canvas.LineTo(175,180);


  Form1.Canvas.MoveTo(255,148);
  Form1.Canvas.LineTo(225,180);
  Form1.Canvas.MoveTo(255,148);
  Form1.Canvas.LineTo(275,180);


  Form1.Canvas.MoveTo(350,148);
  Form1.Canvas.LineTo(325,180);
  Form1.Canvas.MoveTo(350,148);
  Form1.Canvas.LineTo(375,180);

  Form1.Canvas.MoveTo(445,148);
  Form1.Canvas.LineTo(425,180);
  Form1.Canvas.MoveTo(445,148);
  Form1.Canvas.LineTo(475,180);

  x:=0;
  y:=160;
  for i:=7 to 14 do
  begin
    Form1.Canvas.Ellipse(110+x,10+y,150+x,50+y);  //+150y down
    Form1.Canvas.TextOut(120+x,20+y,'Tree');
    x:=x+50;
  end;
//Form1.Canvas.Brush.Color:=clBlack;
Form1.Canvas.Pen.Color:=clBlack;
//
//Form1.Canvas.LineTo(100,100);
//Form1.Canvas.Rectangle(10,10,100,100);

{Form1.Canvas.Ellipse(10,10,50,50);
Form1.Canvas.TextOut(20,20,'Tree');

Form1.Canvas.Pen.Color:=clRed;
Form1.Canvas.Ellipse(60,10,100,50);
Form1.Canvas.TextOut(70,20,'Tree');}

end;

end.
