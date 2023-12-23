program dkr5;
const N = 20000;
type arr=array[1..N] of integer;
var i: integer;
input: text;
a,b,long_arr: arr;

function FileToArray(inputfile:string): arr;
var i: integer;
  input:text;
begin
  assign(input,inputfile);
  reset(input);
  i:=1;
  while not EOF(input) do
  begin
    readln(input, result[i]);
    i += 1;
  end;
  close(input);
end;

procedure ArrayToFile(a:arr; outputfile:string);
var i,len:integer;
output:text;
begin
  assign(output,outputfile);
  rewrite(output);
  for i:=1 to N do
    writeln(output,a[i]);
  close(output);
end;


procedure compar(a, b:arr);
var i,len1,len2:integer;
  t:boolean;
begin

  t:=True;
    for i:=1 to len1-1 do
      if (a[i] <> b[i]) and (a[i] > a[i+1]) then
      begin
        t:=False;
        break;
      end;
  if t then
    writeln('Массивы отсортированы')
  else
    writeln('Один из массивов отличается или не отсортирован')
end;

function counting_sort(a:arr): arr;
var i,j,k:integer;
  f:boolean;
begin
  for i:=1 to n do
    result[i]:=-1;
  for i:=1 to n do
   begin
    k:=0;
    for j:=1 to n do
    if a[j]<a[i] then k:=k+1;
    result[k+1]:=a[i];
   end;
 for i:=2 to n do
    if result[i]=-1 then 
      result[i]:=result[i-1];
end;
procedure HeapSort(var m: arr; Nmax:integer);
var
  i: integer;
 
  procedure Swap(var a,b:integer);
  var
    tmp: integer;
  begin
    tmp:=a;
    a:=b;
    b:=tmp;
  end;
 
  procedure Sort(Ns: integer);
  var
    i, tmp, pos, mid: integer;
  begin
    mid := Ns div 2;
    for i := mid downto 1 do
    begin
      pos := i;
      while pos<=mid do
      begin
        tmp := pos*2;
        if tmp<Ns then
        begin
          if m[tmp+1]>m[tmp] then
            tmp := tmp+1;
          if m[pos]<m[tmp] then
          begin
            Swap(m[pos], m[tmp]);
            pos := tmp;
          end
          else
            pos := Ns;
        end
        else
          if m[pos]>m[tmp] then
          begin
            Swap(m[pos], m[tmp]);
            pos := Ns;
          end
          else
            pos := Ns;
        end;
      end;
    end;
begin
  for i:=Nmax downto 2 do
  begin
    Sort(i);
    Swap(m[1], m[i]);
  end;
end;

Begin

  Long_arr := FileToArray('long_arr.txt');
  a:=long_arr;
  a:=counting_sort(a);
  writeln('массив a отсортирован');
  b:=long_arr;
  Heapsort(b,n);
  writeln('массив b отсортирован');

  ArrayToFile(a,'cou_sorted.txt');
  ArrayToFile(b,'heap_sorted.txt');
end.