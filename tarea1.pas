{ tarea1.pas - Implementación de los subprogramas solicitados }

Procedure readAndHashLn(semilla, paso, N: Natural; Var codigo: Natural);

Var 
  caracter: char;
  hash: Natural;
Begin
  hash := semilla;
  read(caracter);
  While (caracter <> '.') Do
    Begin
      hash := (hash * paso + ord(caracter)) Mod N;
      read(caracter);
    End;
  readln;
  codigo := hash;
End;

Procedure login(codigo: Natural; intentos: integer; Var ok: boolean);

Var 
  hash: Natural;
  i: integer;
Begin
  ok := false;
  i := 1;
  While (i <= intentos) And (Not ok) Do
    Begin
      readAndHashLn(SEMILLADJB, PASODJB, NDJB, hash);
      If hash = codigo Then
        ok := true
      Else
        Begin
          writeFallo(hash, i, intentos);
          i := i + 1;
        End;
    End;
End;
