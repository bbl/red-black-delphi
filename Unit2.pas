unit Unit2;

interface

uses
  SysUtils;

type TreeColor = (RED, BLACK);

     pnode = ^node;

     node = record
     value:Integer;
     left:pnode;
     right:pnode;
     parent:pnode;
     color:TreeColor;
     end;

procedure TreeInsert(var Troot:pnode;val:integer);
var i:Integer;
    Tree,tmp,root:pnode;
    sentinel:pnode;
    arr:array of pnode;

implementation

procedure rotateLeft(x:pnode);
var y:pnode;
begin
    {/****************************
    *  rotate node x to right  *
    ****************************/}
    y:= x^.right;
    {/* establish x^.left link */}
    x^.right:=y^.left;
    if (y^.left <> NIL) then
	  	y^.left^.parent:=x;
    //* establish y^.parent link */
    if (y <> NIL) then
    	y^.parent:= x^.parent;
    if (x^.parent<>nil)then
	    begin
        if (x = x^.parent^.left)then
            x^.parent^.left:= y
        else
            x^.parent^.right:= y;
      end
	  else
      begin
        root:= y;
      end;
    {/* link x and y */}
    y^.left:= x;
    if (x <> NIL)then x^.parent:= y;
end; 
procedure rotateRight(x:pnode); 
var y:pnode;
begin
    {/****************************
    *  rotate node x to right  *
    ****************************/}
    y:= x^.left;
    {/* establish x^.left link */}
    x^.left:=y^.right;         
    if (y^.right <> NIL) then
	  	y^.right^.parent:=x;
    //* establish y^.parent link */
    if (y <> NIL) then
    	y^.parent:= x^.parent;
    if (x^.parent<>nil)then
	    begin
        if (x = x^.parent^.right)then
            x^.parent^.right:= y
        else
            x^.parent^.left:= y;
      end
	  else
      begin
        root:= y;
      end;
    {/* link x and y */}
    y^.right:= x;
    if (x <> NIL)then x^.parent:= y;
end;

procedure insertFixup(x:pnode);
var y:pnode;
begin
  while ((x <> root) and (x^.parent^.color = RED)) do
	begin
        {/* we have a violation */ }
    if (x^.parent = x^.parent^.parent^.left) then
		begin
      y:= x^.parent^.parent^.right;    /////!!!!!!!!!!!!!!!!
      if (y^.color = RED) then
        begin
          //* uncle is RED */
          x^.parent^.color:=BLACK;
          y^.color:=BLACK;
          x^.parent^.parent^.color:=RED;
           x:= x^.parent^.parent;
        end
      else
			  begin
          // /* uncle is BLACK */
          if (x = x^.parent^.right) then
				    begin
              //* make x a left child */
              x:= x^.parent;
              rotateLeft(x);
            end;

          //* recolor and rotate */
          x^.parent^.color:= BLACK;
          x^.parent^.parent^.color:=RED;
          rotateRight(x^.parent^.parent);
        end;
    end
    else
			begin
        //* mirror image of above code */
        y:= x^.parent^.parent^.left;
        if (y^.color = RED) then
			    begin
            //* uncle is RED */
            x^.parent^.color:= BLACK;
            y^.color:= BLACK;
            x^.parent^.parent^.color:=RED;
            x:= x^.parent^.parent;
          end
        else
				  begin
					  //* uncle is BLACK */
					  if (x = x^.parent^.left) then
					    begin
                x:= x^.parent;
						    rotateRight(x);
					    end;
					  x^.parent^.color:=BLACK;
					  x^.parent^.parent^.color:=RED;
					  rotateLeft(x^.parent^.parent);
				  end;
      end;
  end;
    root^.color:= BLACK;
end;

procedure TreeInsert(var Troot:pnode;val:integer);
begin
if (Troot=nil)or(Troot=sentinel) then
	begin
		New(Troot);
		Troot^.value:=val;
		Troot^.left:=sentinel;
		Troot^.right:=sentinel;
    Troot^.color:=RED;
    Troot^.parent:=tmp;
    insertFixup(Troot);
	end
else
	begin
		if(val>=Troot.value)then
      begin
        tmp:=Troot;
			  TreeInsert(Troot.right,val);
      end
		else
      begin
        tmp:=Troot;
			  TreeInsert(Troot.left,val);
      end;
  end;
end;



end.
 