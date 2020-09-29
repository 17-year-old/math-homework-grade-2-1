program MathHomework1;

{$APPTYPE CONSOLE}

{$R *.res}


uses
  System.SysUtils;

var
  i: Integer;
  j: Integer;
  k: Integer;
  r: Integer;
  e: string;
  operand1: Integer;
  operand2: Integer;
  oper: string;
  negative: BOolean;

begin
  try
    //
    for i := 0 to 6560 do
    begin
      k := i;
      e := '1';
      for j := 0 to 7 do
      begin
        r := k mod 3;
        k := k div 3;

        if r = 0 then //
        begin
          e := e + (j + 2).ToString;
        end;

        if r = 1 then
        begin
          e := e + '+' + (j + 2).ToString;
        end;

        if r = 2 then
        begin
          e := e + '-' + (j + 2).ToString;
        end;
      end;

      operand1 := 0;
      operand2 := 0;
      oper := '+';
      negative := False;
      for j := 1 to e.Length do
      begin
        if e[j] = '+' then
        begin
          if oper = '+' then
          begin
            operand1 := operand1 + operand2;
            oper := '+';
            operand2 := 0;
          end
          else
          begin
            operand1 := operand1 - operand2;
            oper := '+';
            operand2 := 0;
          end;
        end
        else if e[j] = '-' then
        begin
          if oper = '+' then
          begin
            operand1 := operand1 + operand2;
            oper := '-';
            operand2 := 0;
          end
          else
          begin
            operand1 := operand1 - operand2;
            oper := '-';
            operand2 := 0;
          end;
        end
        else
        begin
          operand2 := operand2 * 10 + StrToInt(e[j]);
          if j = e.Length then
          begin
            if oper = '+' then
            begin
              operand1 := operand1 + operand2;
              oper := '-';
              operand2 := 0;
            end
            else
            begin
              operand1 := operand1 - operand2;
              oper := '-';
              operand2 := 0;
            end;
          end;
        end;

        if operand1 < 0 then
          negative := True;
      end;

      if (operand1 = 90) and (not negative) then
        WriteLn(e + '=' + operand1.ToString);
    end;

    ReadLn;
  except
    on e: Exception do
      Writeln(e.ClassName, ': ', e.Message);
  end;

end.
