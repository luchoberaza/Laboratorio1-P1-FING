Procedure readAndHashLn(semilla, paso, N : Natural; Var codigo : Natural);

Var 
  hash : Natural;
  letra : Char;
Begin
  hash := semilla;
  read(letra);
  While (letra <> '.') Do
    Begin
      hash := hash*paso + ord(letra);
      read(letra);
    End;
  readln;
  codigo := hash Mod N;
End;

Procedure login(codigo : Natural; intentos : integer; Var ok : boolean);

Var 
  i : integer;
  hash : Natural;
Begin
  For i := 1 To intentos Do
    Begin
      readAndHashLn(SEMILLADJB, PASODJB, NDJB, hash);
      If (hash = codigo) Then
        Begin
          ok := true;
          break;
        End
      Else
        Begin
          writeFallo(hash, i, intentos);
        End;
    End;
End;
