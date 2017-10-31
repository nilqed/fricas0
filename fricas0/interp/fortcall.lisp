 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; makeFort(name,args,decls,results,returnType,aspInfo) ==
;   -- Create an executable Fortran file to call a given library function,
;   -- and a stub Axiom function to process its arguments.
;   -- the following is a list of objects for which values need not be
;   -- passed by the user.
;   dummies := [SECOND(u) for u in args | EQUAL(car u,0)]
;   args := [untangle2(u) for u in args] -- lose spad Union representation
;     where untangle2 u ==
;       atom (v := rest(u)) => v
;       first(v)
;   userArgs := [u for u in args | not member(u,dummies)]  -- Temporary
;   decls := [untangle(u) for u in decls] -- lose spad Union representation
;     where untangle u ==
;       [if atom(rest(v)) then rest(v) else _
;         [if atom(w) then w else rest(w) for w in rest(v)] for v in u]
;   makeFort1(name,args,userArgs,dummies,decls,results,returnType,aspInfo)
 
(DEFUN |makeFort| (|name| |args| |decls| |results| |returnType| |aspInfo|)
  (PROG (|dummies| |userArgs|)
    (RETURN
     (PROGN
      (SETQ |dummies|
              ((LAMBDA (|bfVar#2| |bfVar#1| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |u| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1='T
                    (AND (EQUAL (CAR |u|) 0)
                         (SETQ |bfVar#2| (CONS (SECOND |u|) |bfVar#2|)))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |args| NIL))
      (SETQ |args|
              ((LAMBDA (|bfVar#4| |bfVar#3| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#3|)
                        (PROGN (SETQ |u| (CAR |bfVar#3|)) NIL))
                    (RETURN (NREVERSE |bfVar#4|)))
                   (#1#
                    (SETQ |bfVar#4|
                            (CONS (|makeFort,untangle2| |u|) |bfVar#4|))))
                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
               NIL |args| NIL))
      (SETQ |userArgs|
              ((LAMBDA (|bfVar#6| |bfVar#5| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#5|)
                        (PROGN (SETQ |u| (CAR |bfVar#5|)) NIL))
                    (RETURN (NREVERSE |bfVar#6|)))
                   (#1#
                    (AND (NULL (|member| |u| |dummies|))
                         (SETQ |bfVar#6| (CONS |u| |bfVar#6|)))))
                  (SETQ |bfVar#5| (CDR |bfVar#5|))))
               NIL |args| NIL))
      (SETQ |decls|
              ((LAMBDA (|bfVar#8| |bfVar#7| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#7|)
                        (PROGN (SETQ |u| (CAR |bfVar#7|)) NIL))
                    (RETURN (NREVERSE |bfVar#8|)))
                   (#1#
                    (SETQ |bfVar#8|
                            (CONS (|makeFort,untangle| |u|) |bfVar#8|))))
                  (SETQ |bfVar#7| (CDR |bfVar#7|))))
               NIL |decls| NIL))
      (|makeFort1| |name| |args| |userArgs| |dummies| |decls| |results|
       |returnType| |aspInfo|)))))
(DEFUN |makeFort,untangle| (|u|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#12| |bfVar#11| |v|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#11|) (PROGN (SETQ |v| (CAR |bfVar#11|)) NIL))
           (RETURN (NREVERSE |bfVar#12|)))
          (#1='T
           (SETQ |bfVar#12|
                   (CONS
                    (COND ((ATOM (CDR |v|)) (CDR |v|))
                          (#1#
                           ((LAMBDA (|bfVar#10| |bfVar#9| |w|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#9|)
                                     (PROGN (SETQ |w| (CAR |bfVar#9|)) NIL))
                                 (RETURN (NREVERSE |bfVar#10|)))
                                (#1#
                                 (SETQ |bfVar#10|
                                         (CONS
                                          (COND ((ATOM |w|) |w|)
                                                (#1# (CDR |w|)))
                                          |bfVar#10|))))
                               (SETQ |bfVar#9| (CDR |bfVar#9|))))
                            NIL (CDR |v|) NIL)))
                    |bfVar#12|))))
         (SETQ |bfVar#11| (CDR |bfVar#11|))))
      NIL |u| NIL))))
(DEFUN |makeFort,untangle2| (|u|)
  (PROG (|v|) (RETURN (COND ((ATOM (SETQ |v| (CDR |u|))) |v|) ('T (CAR |v|))))))
 
; makeFort1(name,args,userArgs,dummies,decls,results,returnType,aspInfo) ==
;   asps := [first(u) for u in aspInfo]
;   -- Now reorder the arguments so that all the scalars come first, so
;   -- that when we come to deal with arrays we know all the dimensions.
;   scalarArgs := [u for u in args | atom getFortranType(u,decls)]
;   arrayArgs := [u for u in args | not member(u,scalarArgs)]
;   orderedArgs := [:scalarArgs,:arrayArgs]
;   file := if $fortranDirectory then
;     STRCONC($fortranDirectory,"/",STRINGIMAGE name)
;   else
;     STRINGIMAGE name
;   makeFortranFun(name,orderedArgs,args,dummies,decls,results,file,
;                  $fortranDirectory,returnType,asps)
;   makeSpadFun(name,userArgs,orderedArgs,dummies,decls,results,returnType,asps,
;               aspInfo,file)
;   name
 
(DEFUN |makeFort1|
       (|name| |args| |userArgs| |dummies| |decls| |results| |returnType|
        |aspInfo|)
  (PROG (|asps| |scalarArgs| |arrayArgs| |orderedArgs| |file|)
    (RETURN
     (PROGN
      (SETQ |asps|
              ((LAMBDA (|bfVar#14| |bfVar#13| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#13|)
                        (PROGN (SETQ |u| (CAR |bfVar#13|)) NIL))
                    (RETURN (NREVERSE |bfVar#14|)))
                   (#1='T (SETQ |bfVar#14| (CONS (CAR |u|) |bfVar#14|))))
                  (SETQ |bfVar#13| (CDR |bfVar#13|))))
               NIL |aspInfo| NIL))
      (SETQ |scalarArgs|
              ((LAMBDA (|bfVar#16| |bfVar#15| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#15|)
                        (PROGN (SETQ |u| (CAR |bfVar#15|)) NIL))
                    (RETURN (NREVERSE |bfVar#16|)))
                   (#1#
                    (AND (ATOM (|getFortranType| |u| |decls|))
                         (SETQ |bfVar#16| (CONS |u| |bfVar#16|)))))
                  (SETQ |bfVar#15| (CDR |bfVar#15|))))
               NIL |args| NIL))
      (SETQ |arrayArgs|
              ((LAMBDA (|bfVar#18| |bfVar#17| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#17|)
                        (PROGN (SETQ |u| (CAR |bfVar#17|)) NIL))
                    (RETURN (NREVERSE |bfVar#18|)))
                   (#1#
                    (AND (NULL (|member| |u| |scalarArgs|))
                         (SETQ |bfVar#18| (CONS |u| |bfVar#18|)))))
                  (SETQ |bfVar#17| (CDR |bfVar#17|))))
               NIL |args| NIL))
      (SETQ |orderedArgs| (APPEND |scalarArgs| |arrayArgs|))
      (SETQ |file|
              (COND
               (|$fortranDirectory|
                (STRCONC |$fortranDirectory| '/ (STRINGIMAGE |name|)))
               (#1# (STRINGIMAGE |name|))))
      (|makeFortranFun| |name| |orderedArgs| |args| |dummies| |decls| |results|
       |file| |$fortranDirectory| |returnType| |asps|)
      (|makeSpadFun| |name| |userArgs| |orderedArgs| |dummies| |decls|
       |results| |returnType| |asps| |aspInfo| |file|)
      |name|))))
 
; makeFortranFun(name,args,fortranArgs,dummies,decls,results,file,dir,
;                returnType,asps) ==
;   -- Create a C file to call the library function, and compile it.
;   fp := MAKE_-OUTSTREAM(STRCONC(file,".c"))
;   writeCFile(name,args,fortranArgs,dummies,decls,results,returnType,asps,fp)
;   if null dir then dir := '"."
;   asps => SYSTEM STRCONC("cc -c ",file,".c ; mv ",file,".o ",dir)
;   SYSTEM STRCONC("cc ",file,".c -o ",file,".spadexe ",$fortranLibraries)
 
(DEFUN |makeFortranFun|
       (|name| |args| |fortranArgs| |dummies| |decls| |results| |file| |dir|
        |returnType| |asps|)
  (PROG (|fp|)
    (RETURN
     (PROGN
      (SETQ |fp| (MAKE-OUTSTREAM (STRCONC |file| '|.c|)))
      (|writeCFile| |name| |args| |fortranArgs| |dummies| |decls| |results|
       |returnType| |asps| |fp|)
      (COND ((NULL |dir|) (SETQ |dir| ".")))
      (COND
       (|asps|
        (SYSTEM (STRCONC '|cc -c | |file| '|.c ; mv | |file| '|.o | |dir|)))
       ('T
        (SYSTEM
         (STRCONC '|cc | |file| '|.c -o | |file| '|.spadexe |
          |$fortranLibraries|))))))))
 
; writeCFile(name,args,fortranArgs,dummies,decls,results,returnType,asps,fp) ==
;   WRITE_-LINE('"#include <stdio.h>",fp)
;   WRITE_-LINE('"#include <sys/select.h>",fp)
;   WRITE_-LINE('"#include <rpc/rpc.h>",fp)
;   WRITE_-LINE('"#ifndef NULL",fp)
;   WRITE_-LINE('"#define NULL 0",fp)
;   WRITE_-LINE('"#endif  NULL",fp)
;   WRITE_-LINE('"#define MAX__ARRAY(x) (x ? x :  20000)",fp)
;   WRITE_-LINE('"#define CHECK(x) if (!x) {fprintf(stderr,_"xdr failed_"); exit(1);}",fp)
;   WRITE_-LINE('"void main()",fp)
;   WRITE_-LINE('"{",fp)
;   WRITE_-LINE('"  XDR xdrs;",fp)
;   WRITE_-LINE('"  {",fp)
;   if $addUnderscoreToFortranNames then
;     routineName := STRCONC(name, UNDERBAR)
;   else
;     routineName := name
;   -- If it is a function then give it somewhere to stick its result:
;   if returnType then
;     returnName := INTERN STRCONC(name,"__result")
;     wl(['"    ",getCType returnType,'" ",returnName,'",",routineName,'"();"],fp)
;   -- print out type declarations for the Fortran parameters, and build an
;   -- ordered list of pairs [<parameter> , <type>]
;   argList := nil
;   for a in args repeat
;     argList := [[a, getCType getFortranType(a,decls)], :argList]
;     printDec(SECOND first argList,a,asps,fp)
;   argList := nreverse argList;
;   -- read in the data
;   WRITE_-LINE('"    xdrstdio__create(&xdrs, stdin, XDR__DECODE);",fp)
;   for a in argList repeat
;     if LISTP SECOND a then writeMalloc(first a,first SECOND a,rest SECOND a,fp)
;     not MEMQ(first a,[:dummies,:asps]) => writeXDR(a,'"&xdrs",fp)
;   -- now call the Library routine.  FORTRAN names may have an underscore
;   -- appended.
;   if returnType then
;     wt(['"    ",returnName,'"="],fp)
;   else
;     wt(['"    "],fp)
;   wt([routineName,'"("],fp)
;   if first fortranArgs then
;     printCName(first fortranArgs,isPointer?(first fortranArgs,decls),asps,fp)
;   for a in rest fortranArgs repeat
;     PRINC('",",fp)
;     printCName(a,isPointer?(a,decls),asps,fp)
;   writeStringLengths(fortranArgs,decls,fp)
;   WRITE_-LINE('");",fp)
;   -- now export the results.
;   WRITE_-LINE('"    xdrstdio__create(&xdrs, stdout, XDR__ENCODE);",fp)
;   if returnType then
;     writeXDR([returnName,getCType returnType],'"&xdrs",fp)
;   for r in results repeat
;     writeXDR([r,getCType getFortranType(r,decls)],'"&xdrs",fp)
;   WRITE_-LINE('"    exit(0);",fp)
;   WRITE_-LINE('"  }",fp)
;   WRITE_-LINE('"}",fp)
 
(DEFUN |writeCFile|
       (|name| |args| |fortranArgs| |dummies| |decls| |results| |returnType|
        |asps| |fp|)
  (PROG (|routineName| |returnName| |argList|)
    (RETURN
     (PROGN
      (WRITE-LINE "#include <stdio.h>" |fp|)
      (WRITE-LINE "#include <sys/select.h>" |fp|)
      (WRITE-LINE "#include <rpc/rpc.h>" |fp|)
      (WRITE-LINE "#ifndef NULL" |fp|)
      (WRITE-LINE "#define NULL 0" |fp|)
      (WRITE-LINE "#endif  NULL" |fp|)
      (WRITE-LINE "#define MAX_ARRAY(x) (x ? x :  20000)" |fp|)
      (WRITE-LINE
       "#define CHECK(x) if (!x) {fprintf(stderr,\"xdr failed\"); exit(1);}"
       |fp|)
      (WRITE-LINE "void main()" |fp|)
      (WRITE-LINE "{" |fp|)
      (WRITE-LINE "  XDR xdrs;" |fp|)
      (WRITE-LINE "  {" |fp|)
      (COND
       (|$addUnderscoreToFortranNames|
        (SETQ |routineName| (STRCONC |name| UNDERBAR)))
       (#1='T (SETQ |routineName| |name|)))
      (COND
       (|returnType| (SETQ |returnName| (INTERN (STRCONC |name| '|_result|)))
        (|wl|
         (LIST "    " (|getCType| |returnType|) " " |returnName| ","
               |routineName| "();")
         |fp|)))
      (SETQ |argList| NIL)
      ((LAMBDA (|bfVar#19| |a|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#19|) (PROGN (SETQ |a| (CAR |bfVar#19|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |argList|
                     (CONS
                      (LIST |a| (|getCType| (|getFortranType| |a| |decls|)))
                      |argList|))
             (|printDec| (SECOND (CAR |argList|)) |a| |asps| |fp|))))
          (SETQ |bfVar#19| (CDR |bfVar#19|))))
       |args| NIL)
      (SETQ |argList| (NREVERSE |argList|))
      (WRITE-LINE "    xdrstdio_create(&xdrs, stdin, XDR_DECODE);" |fp|)
      ((LAMBDA (|bfVar#20| |a|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#20|) (PROGN (SETQ |a| (CAR |bfVar#20|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (COND
              ((LISTP (SECOND |a|))
               (|writeMalloc| (CAR |a|) (CAR (SECOND |a|)) (CDR (SECOND |a|))
                |fp|)))
             (COND
              ((NULL (MEMQ (CAR |a|) (APPEND |dummies| |asps|)))
               (|writeXDR| |a| "&xdrs" |fp|))))))
          (SETQ |bfVar#20| (CDR |bfVar#20|))))
       |argList| NIL)
      (COND (|returnType| (|wt| (LIST "    " |returnName| "=") |fp|))
            (#1# (|wt| (LIST "    ") |fp|)))
      (|wt| (LIST |routineName| "(") |fp|)
      (COND
       ((CAR |fortranArgs|)
        (|printCName| (CAR |fortranArgs|)
         (|isPointer?| (CAR |fortranArgs|) |decls|) |asps| |fp|)))
      ((LAMBDA (|bfVar#21| |a|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#21|) (PROGN (SETQ |a| (CAR |bfVar#21|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (PRINC "," |fp|)
             (|printCName| |a| (|isPointer?| |a| |decls|) |asps| |fp|))))
          (SETQ |bfVar#21| (CDR |bfVar#21|))))
       (CDR |fortranArgs|) NIL)
      (|writeStringLengths| |fortranArgs| |decls| |fp|)
      (WRITE-LINE ");" |fp|)
      (WRITE-LINE "    xdrstdio_create(&xdrs, stdout, XDR_ENCODE);" |fp|)
      (COND
       (|returnType|
        (|writeXDR| (LIST |returnName| (|getCType| |returnType|)) "&xdrs"
         |fp|)))
      ((LAMBDA (|bfVar#22| |r|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#22|) (PROGN (SETQ |r| (CAR |bfVar#22|)) NIL))
            (RETURN NIL))
           (#1#
            (|writeXDR| (LIST |r| (|getCType| (|getFortranType| |r| |decls|)))
             "&xdrs" |fp|)))
          (SETQ |bfVar#22| (CDR |bfVar#22|))))
       |results| NIL)
      (WRITE-LINE "    exit(0);" |fp|)
      (WRITE-LINE "  }" |fp|)
      (WRITE-LINE "}" |fp|)))))
 
; writeStringLengths(fortranArgs,decls,fp) ==
;   for a in fortranArgs repeat
;     if isString?(a,decls) then wt(['",&",a,'"__length"],fp)
 
(DEFUN |writeStringLengths| (|fortranArgs| |decls| |fp|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#23| |a|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#23|) (PROGN (SETQ |a| (CAR |bfVar#23|)) NIL))
           (RETURN NIL))
          ('T
           (COND
            ((|isString?| |a| |decls|)
             (|wt| (LIST ",&" |a| "_length") |fp|)))))
         (SETQ |bfVar#23| (CDR |bfVar#23|))))
      |fortranArgs| NIL))))
 
; isString?(u,decls) ==
;   EQUAL(ty := getFortranType(u,decls),"character") or
;     LISTP(ty) and EQUAL(first ty,"character")
 
(DEFUN |isString?| (|u| |decls|)
  (PROG (|ty|)
    (RETURN
     (OR (EQUAL (SETQ |ty| (|getFortranType| |u| |decls|)) '|character|)
         (AND (LISTP |ty|) (EQUAL (CAR |ty|) '|character|))))))
 
; isPointer?(u,decls) ==
;   ty := getFortranType(u,decls)
;   LISTP(ty) or ty in ["character","complex","double complex"]
 
(DEFUN |isPointer?| (|u| |decls|)
  (PROG (|ty|)
    (RETURN
     (PROGN
      (SETQ |ty| (|getFortranType| |u| |decls|))
      (OR (LISTP |ty|)
          (|member| |ty| (LIST '|character| '|complex| '|double complex|)))))))
 
; printCName(u,ispointer,asps,fp) ==
;   member(u,asps) =>
;     PRINC(u,fp)
;     if $addUnderscoreToFortranNames then PRINC(UNDERBAR, fp)
;   if not ispointer then PRINC('"&",fp)
;   PRINC(u,fp)
 
(DEFUN |printCName| (|u| |ispointer| |asps| |fp|)
  (PROG ()
    (RETURN
     (COND
      ((|member| |u| |asps|)
       (PROGN
        (PRINC |u| |fp|)
        (COND (|$addUnderscoreToFortranNames| (PRINC UNDERBAR |fp|)))))
      ('T
       (PROGN
        (COND ((NULL |ispointer|) (PRINC "&" |fp|)))
        (PRINC |u| |fp|)))))))
 
; getFortranType(u,decls) ==
;   -- find u in decls, return the given (Fortran) type.
;   result := nil
;   for d in decls repeat for dec in rest d repeat
;     atom(dec) and dec=u =>
;       return( result := first d )
;     LISTP(dec) and first(dec)=u =>
;       return( result := [first d,:rest dec] )
;   result => result
;   error ['"Undeclared Fortran parameter: ",u]
 
(DEFUN |getFortranType| (|u| |decls|)
  (PROG (|result|)
    (RETURN
     (PROGN
      (SETQ |result| NIL)
      ((LAMBDA (|bfVar#24| |d|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#24|) (PROGN (SETQ |d| (CAR |bfVar#24|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#25| |dec|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#25|)
                      (PROGN (SETQ |dec| (CAR |bfVar#25|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (COND
                   ((AND (ATOM |dec|) (EQUAL |dec| |u|))
                    (RETURN (SETQ |result| (CAR |d|))))
                   ((AND (LISTP |dec|) (EQUAL (CAR |dec|) |u|))
                    (RETURN (SETQ |result| (CONS (CAR |d|) (CDR |dec|))))))))
                (SETQ |bfVar#25| (CDR |bfVar#25|))))
             (CDR |d|) NIL)))
          (SETQ |bfVar#24| (CDR |bfVar#24|))))
       |decls| NIL)
      (COND (|result| |result|)
            (#1# (|error| (LIST "Undeclared Fortran parameter: " |u|))))))))
 
; getCType t ==
;   -- Return the equivalent C type.
;   LISTP(t) =>
;     --[if first(t)="character" then '"char" else getCType first t,:rest t]
;     first(t)="character" => ['"char",:rest t]
;     first(t)="complex" => ['"float",2,:rest t]
;     first(t)="double complex" =>  ['"double",2,:rest t]
;     [getCType first t,:rest t]
;   t="double" => '"double"
;   t="double precision" => '"double"
;   t="integer" => '"int"
;   t="real" => '"float"
;   t="logical" => '"int"
;   t="character" => ['"char",1]
;   t="complex" => ['"float",2] --'"Complex" -- we use our own typedef
;   t="double complex" =>  ['"double",2] --'"DComplex" -- we use our own typedef
;   error ['"Unrecognised Fortran type: ",t]
 
(DEFUN |getCType| (|t|)
  (PROG ()
    (RETURN
     (COND
      ((LISTP |t|)
       (COND ((EQ (CAR |t|) '|character|) (CONS "char" (CDR |t|)))
             ((EQ (CAR |t|) '|complex|) (CONS "float" (CONS 2 (CDR |t|))))
             ((EQ (CAR |t|) '|double complex|)
              (CONS "double" (CONS 2 (CDR |t|))))
             (#1='T (CONS (|getCType| (CAR |t|)) (CDR |t|)))))
      ((EQ |t| '|double|) "double") ((EQ |t| '|double precision|) "double")
      ((EQ |t| '|integer|) "int") ((EQ |t| '|real|) "float")
      ((EQ |t| '|logical|) "int") ((EQ |t| '|character|) (LIST "char" 1))
      ((EQ |t| '|complex|) (LIST "float" 2))
      ((EQ |t| '|double complex|) (LIST "double" 2))
      (#1# (|error| (LIST "Unrecognised Fortran type: " |t|)))))))
 
; XDRFun t ==
;   LISTP(ty := SECOND t) =>
;     if first(ty)='"char" then '"wrapstring" else '"array"
;   ty
 
(DEFUN |XDRFun| (|t|)
  (PROG (|ty|)
    (RETURN
     (COND
      ((LISTP (SETQ |ty| (SECOND |t|)))
       (COND ((EQUAL (CAR |ty|) "char") "wrapstring") (#1='T "array")))
      (#1# |ty|)))))
 
; printDec(type,dec,asps,fp) ==
;   wt(['"    ",if LISTP(type) then first(type) else type,'" "],fp)
;   member(dec,asps) =>
;     if $addUnderscoreToFortranNames then
;       wl([dec, UNDERBAR,'"();"],fp)
;     else
;       wl([dec,'"();"],fp)
;   LISTP(type) =>
;     wl(['"*",dec,'" = NULL;"],fp)
;     wl(['"    u__int ",dec, '"__length = 0;"],fp)
;   type = '"char" =>
;     wl(['"*",dec,'" = NULL;"],fp)
;   wl([dec, '";"],fp)
 
(DEFUN |printDec| (|type| |dec| |asps| |fp|)
  (PROG ()
    (RETURN
     (PROGN
      (|wt|
       (LIST "    " (COND ((LISTP |type|) (CAR |type|)) (#1='T |type|)) " ")
       |fp|)
      (COND
       ((|member| |dec| |asps|)
        (COND
         (|$addUnderscoreToFortranNames|
          (|wl| (LIST |dec| UNDERBAR "();") |fp|))
         (#1# (|wl| (LIST |dec| "();") |fp|))))
       ((LISTP |type|)
        (PROGN
         (|wl| (LIST "*" |dec| " = NULL;") |fp|)
         (|wl| (LIST "    u_int " |dec| "_length = 0;") |fp|)))
       ((EQUAL |type| "char") (|wl| (LIST "*" |dec| " = NULL;") |fp|))
       (#1# (|wl| (LIST |dec| ";") |fp|)))))))
 
; writeXDR(v,str,fp) ==
;   -- Generate the calls to the filters which will read from the temp
;   -- file.  The CHECK macro ensures that the translation worked.
;   underscore := STRING CHAR('"__:",0) -- to avoid a compiler bug which won't
;                                      -- parse " ... __" properly.
;   wt(['"    CHECK(xdr",underscore, XDRFun(v), '"(", str, '",&", first(v)],fp)
;   if (LISTP (ty :=SECOND v)) and not EQUAL(first ty,'"char") then
;     wt(['",&",first(v),'"__length,MAX__ARRAY(",first(v),'"__length),"],fp)
;     wt(['"sizeof(",first(ty),'"),xdr",underscore,first ty],fp)
;   wl(['"));"],fp)
 
(DEFUN |writeXDR| (|v| |str| |fp|)
  (PROG (|underscore| |ty|)
    (RETURN
     (PROGN
      (SETQ |underscore| (STRING (CHAR "_:" 0)))
      (|wt|
       (LIST "    CHECK(xdr" |underscore| (|XDRFun| |v|) "(" |str| ",&"
             (CAR |v|))
       |fp|)
      (COND
       ((AND (LISTP (SETQ |ty| (SECOND |v|))) (NULL (EQUAL (CAR |ty|) "char")))
        (|wt| (LIST ",&" (CAR |v|) "_length,MAX_ARRAY(" (CAR |v|) "_length),")
         |fp|)
        (|wt| (LIST "sizeof(" (CAR |ty|) "),xdr" |underscore| (CAR |ty|))
         |fp|)))
      (|wl| (LIST "));") |fp|)))))
 
; prefix2Infix(l) ==
;   atom(l) => [l]
;   #l=2 => [first l,"(",:prefix2Infix SECOND l,")"]
;   #l=3 => ["(",:prefix2Infix SECOND l,first l,:prefix2Infix THIRD l,")"]
;   error '"Function in array dimensions with more than two arguments"
 
(DEFUN |prefix2Infix| (|l|)
  (PROG ()
    (RETURN
     (COND ((ATOM |l|) (LIST |l|))
           ((EQL (LENGTH |l|) 2)
            (CONS (CAR |l|)
                  (CONS '|(|
                        (APPEND (|prefix2Infix| (SECOND |l|))
                                (CONS '|)| NIL)))))
           ((EQL (LENGTH |l|) 3)
            (CONS '|(|
                  (APPEND (|prefix2Infix| (SECOND |l|))
                          (CONS (CAR |l|)
                                (APPEND (|prefix2Infix| (THIRD |l|))
                                        (CONS '|)| NIL))))))
           ('T
            (|error|
             "Function in array dimensions with more than two arguments"))))))
 
; writeMalloc(name,type,dims,fp) ==
;   -- Write out a malloc for array arguments
;   -- Need the size as well
;   wl(['"    ",name,'"__length=",prefix2Infix first dims,:[:["*",:prefix2Infix u]
;       for u in rest dims],'";"], fp)
;   type = '"char" =>
;     wl(['"    ",name,'"=(",type," *)malloc((1+",name,
;        '"__length)*sizeof(",type,'"));"],fp)
;   wl(['"    ",name,'"=(",type," *)malloc(",name,
;      '"__length*sizeof(",type,'"));"],fp)
 
(DEFUN |writeMalloc| (|name| |type| |dims| |fp|)
  (PROG ()
    (RETURN
     (PROGN
      (|wl|
       (CONS "    "
             (CONS |name|
                   (CONS "_length="
                         (CONS (|prefix2Infix| (CAR |dims|))
                               (APPEND
                                ((LAMBDA (|bfVar#27| |bfVar#26| |u|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#26|)
                                          (PROGN
                                           (SETQ |u| (CAR |bfVar#26|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#27|)))
                                     (#1='T
                                      (SETQ |bfVar#27|
                                              (APPEND
                                               (REVERSE
                                                (CONS '* (|prefix2Infix| |u|)))
                                               |bfVar#27|))))
                                    (SETQ |bfVar#26| (CDR |bfVar#26|))))
                                 NIL (CDR |dims|) NIL)
                                (CONS ";" NIL))))))
       |fp|)
      (COND
       ((EQUAL |type| "char")
        (|wl|
         (LIST "    " |name| "=(" |type| '| *)malloc((1+| |name|
               "_length)*sizeof(" |type| "));")
         |fp|))
       (#1#
        (|wl|
         (LIST "    " |name| "=(" |type| '| *)malloc(| |name| "_length*sizeof("
               |type| "));")
         |fp|)))))))
 
; wl (l,fp) ==
;   for u in l repeat PRINC(u,fp)
;   TERPRI(fp)
 
(DEFUN |wl| (|l| |fp|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#28| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#28|) (PROGN (SETQ |u| (CAR |bfVar#28|)) NIL))
            (RETURN NIL))
           ('T (PRINC |u| |fp|)))
          (SETQ |bfVar#28| (CDR |bfVar#28|))))
       |l| NIL)
      (TERPRI |fp|)))))
 
; wt (l,fp) ==
;   for u in l repeat PRINC(u,fp)
 
(DEFUN |wt| (|l| |fp|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#29| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#29|) (PROGN (SETQ |u| (CAR |bfVar#29|)) NIL))
           (RETURN NIL))
          ('T (PRINC |u| |fp|)))
         (SETQ |bfVar#29| (CDR |bfVar#29|))))
      |l| NIL))))
 
; spadTypeTTT u ==
;   -- Return the spad domain equivalent to the given Fortran type.
;   -- Changed by MCD 8/4/94 to reflect correct format for domains in
;   -- current system.
;   LISTP u =>
;     first(u)="character" => ["String"]
;     first(u)="logical" and #u=2 => ["List",["Boolean"]]
;     first(u)="logical" => ["List",["List",["Boolean"]]]
;     #u=2 => ["Matrix",spadTypeTTT first u]
;     #u=3 => ["Matrix",spadTypeTTT first u]
;     #u=4 => ["ThreeDimensionalMatrix",spadTypeTTT first u]
;     error '"Can only handle one-, two- and three-dimensional matrices"
;   u = "double" => ["DoubleFloat"]
;   u = "double precision" => ["DoubleFloat"]
;   u = "real" => ["DoubleFloat"]
;   u = "integer" => ["Integer"]
;   u = "logical" => ["Boolean"]
;   u = "character" => ["String"]
;   u = "complex" => ["Complex",["DoubleFloat"]]
;   u = "double complex" => ["Complex",["DoubleFloat"]]
;   error ['"Unrecognised Fortran type: ",u]
 
(DEFUN |spadTypeTTT| (|u|)
  (PROG ()
    (RETURN
     (COND
      ((LISTP |u|)
       (COND ((EQ (CAR |u|) '|character|) (LIST '|String|))
             ((AND (EQ (CAR |u|) '|logical|) (EQL (LENGTH |u|) 2))
              (LIST '|List| (LIST '|Boolean|)))
             ((EQ (CAR |u|) '|logical|)
              (LIST '|List| (LIST '|List| (LIST '|Boolean|))))
             ((EQL (LENGTH |u|) 2) (LIST '|Matrix| (|spadTypeTTT| (CAR |u|))))
             ((EQL (LENGTH |u|) 3) (LIST '|Matrix| (|spadTypeTTT| (CAR |u|))))
             ((EQL (LENGTH |u|) 4)
              (LIST '|ThreeDimensionalMatrix| (|spadTypeTTT| (CAR |u|))))
             (#1='T
              (|error|
               "Can only handle one-, two- and three-dimensional matrices"))))
      ((EQ |u| '|double|) (LIST '|DoubleFloat|))
      ((EQ |u| '|double precision|) (LIST '|DoubleFloat|))
      ((EQ |u| '|real|) (LIST '|DoubleFloat|))
      ((EQ |u| '|integer|) (LIST '|Integer|))
      ((EQ |u| '|logical|) (LIST '|Boolean|))
      ((EQ |u| '|character|) (LIST '|String|))
      ((EQ |u| '|complex|) (LIST '|Complex| (LIST '|DoubleFloat|)))
      ((EQ |u| '|double complex|) (LIST '|Complex| (LIST '|DoubleFloat|)))
      (#1# (|error| (LIST "Unrecognised Fortran type: " |u|)))))))
 
; mkQuote l ==
;  [addQuote(u)for u in l] where
;     addQuote u ==
;       atom u => ['QUOTE,u]
;       ["construct",:[addQuote(v) for v in u]]
 
(DEFUN |mkQuote| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#31| |bfVar#30| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#30|) (PROGN (SETQ |u| (CAR |bfVar#30|)) NIL))
           (RETURN (NREVERSE |bfVar#31|)))
          ('T (SETQ |bfVar#31| (CONS (|mkQuote,addQuote| |u|) |bfVar#31|))))
         (SETQ |bfVar#30| (CDR |bfVar#30|))))
      NIL |l| NIL))))
(DEFUN |mkQuote,addQuote| (|u|)
  (PROG ()
    (RETURN
     (COND ((ATOM |u|) (LIST 'QUOTE |u|))
           (#1='T
            (CONS '|construct|
                  ((LAMBDA (|bfVar#33| |bfVar#32| |v|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#32|)
                            (PROGN (SETQ |v| (CAR |bfVar#32|)) NIL))
                        (RETURN (NREVERSE |bfVar#33|)))
                       (#1#
                        (SETQ |bfVar#33|
                                (CONS (|mkQuote,addQuote| |v|) |bfVar#33|))))
                      (SETQ |bfVar#32| (CDR |bfVar#32|))))
                   NIL |u| NIL)))))))
 
; makeLispList(l) ==
;   outputList := []
;   for u in l repeat
;     outputList := [:outputList, _
;                   if atom(u) then ['QUOTE,u] else [["$elt","Lisp","construct"],_
;                   :makeLispList(u)]]
;   outputList
 
(DEFUN |makeLispList| (|l|)
  (PROG (|outputList|)
    (RETURN
     (PROGN
      (SETQ |outputList| NIL)
      ((LAMBDA (|bfVar#34| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#34|) (PROGN (SETQ |u| (CAR |bfVar#34|)) NIL))
            (RETURN NIL))
           (#1='T
            (SETQ |outputList|
                    (APPEND |outputList|
                            (CONS
                             (COND ((ATOM |u|) (LIST 'QUOTE |u|))
                                   (#1#
                                    (CONS (LIST '|$elt| '|Lisp| '|construct|)
                                          (|makeLispList| |u|))))
                             NIL)))))
          (SETQ |bfVar#34| (CDR |bfVar#34|))))
       |l| NIL)
      |outputList|))))
 
; makeSpadFun(name,userArgs,args,dummies,decls,results,returnType,asps,aspInfo,
;             file) ==
;   -- Create an interpreter function for the user to call.
; 
;   fType := ["List", ["Record" , [":","key","Symbol"], [":","entry","Any"]]]
; 
;   -- To make sure the spad interpreter isn't confused:
;   if returnType then
;     returnName := INTERN STRCONC(name,"Result")
;     decls := [[returnType,returnName], :decls]
;     results := [returnName, :results]
;   argNames := [INTERN STRCONC(STRINGIMAGE(u),'"__arg") for u in userArgs]
;   aType := [axiomType(a,decls,asps,aspInfo) for a in userArgs]
;   aspTypes := [SECOND NTH(POSITION(u,userArgs),aType) for u in asps]
;   nilLst := MAKE_-LIST(#args+1)
;   decPar := [["$elt","Lisp","construct"],:makeLispList decls]
;   fargNames := [INTERN STRCONC(STRINGIMAGE(u),'"__arg") for u in args |
;                  not (MEMQ(u,dummies) or MEMQ(u,asps)) ]
;   for u in asps repeat
;     fargNames := delete(INTERN STRCONC(STRINGIMAGE(u),'"__arg"),fargNames)
;   resPar := ["construct",["@",["construct",:fargNames],_
;              ["List",["Any"]]]]
;   call := [["$elt","Lisp","invokeFortran"],STRCONC(file,".spadexe"),_
;            [["$elt","Lisp","construct"],:mkQuote args],_
;            [["$elt","Lisp","construct"],:mkQuote union(asps,dummies)], decPar,_
;            [["$elt","Lisp","construct"],:mkQuote results],resPar]
;   if asps then
;     -- Make a unique(ish) id for asp files
;     aspId := STRCONC(getEnv('"SPADNUM"), GENTEMP('"NAG"))
;     body := ["SEQ",:makeAspGenerators(asps,aspTypes,aspId),_
;              makeCompilation(asps,file,aspId),_
;              ["pretend",call,fType] ]
;   else
;     body := ["pretend",call,fType]
;   interpret(["DEF",[name,:argNames],["Result",:aType],nilLst,_
;              [["$elt","Result","construct"],body]], nil)
 
(DEFUN |makeSpadFun|
       (|name| |userArgs| |args| |dummies| |decls| |results| |returnType|
        |asps| |aspInfo| |file|)
  (PROG (|fType| |returnName| |argNames| |aType| |aspTypes| |nilLst| |decPar|
         |fargNames| |resPar| |call| |aspId| |body|)
    (RETURN
     (PROGN
      (SETQ |fType|
              (LIST '|List|
                    (LIST '|Record| (LIST '|:| '|key| '|Symbol|)
                          (LIST '|:| '|entry| '|Any|))))
      (COND
       (|returnType| (SETQ |returnName| (INTERN (STRCONC |name| '|Result|)))
        (SETQ |decls| (CONS (LIST |returnType| |returnName|) |decls|))
        (SETQ |results| (CONS |returnName| |results|))))
      (SETQ |argNames|
              ((LAMBDA (|bfVar#36| |bfVar#35| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#35|)
                        (PROGN (SETQ |u| (CAR |bfVar#35|)) NIL))
                    (RETURN (NREVERSE |bfVar#36|)))
                   (#1='T
                    (SETQ |bfVar#36|
                            (CONS (INTERN (STRCONC (STRINGIMAGE |u|) "_arg"))
                                  |bfVar#36|))))
                  (SETQ |bfVar#35| (CDR |bfVar#35|))))
               NIL |userArgs| NIL))
      (SETQ |aType|
              ((LAMBDA (|bfVar#38| |bfVar#37| |a|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#37|)
                        (PROGN (SETQ |a| (CAR |bfVar#37|)) NIL))
                    (RETURN (NREVERSE |bfVar#38|)))
                   (#1#
                    (SETQ |bfVar#38|
                            (CONS (|axiomType| |a| |decls| |asps| |aspInfo|)
                                  |bfVar#38|))))
                  (SETQ |bfVar#37| (CDR |bfVar#37|))))
               NIL |userArgs| NIL))
      (SETQ |aspTypes|
              ((LAMBDA (|bfVar#40| |bfVar#39| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#39|)
                        (PROGN (SETQ |u| (CAR |bfVar#39|)) NIL))
                    (RETURN (NREVERSE |bfVar#40|)))
                   (#1#
                    (SETQ |bfVar#40|
                            (CONS
                             (SECOND (NTH (POSITION |u| |userArgs|) |aType|))
                             |bfVar#40|))))
                  (SETQ |bfVar#39| (CDR |bfVar#39|))))
               NIL |asps| NIL))
      (SETQ |nilLst| (MAKE-LIST (+ (LENGTH |args|) 1)))
      (SETQ |decPar|
              (CONS (LIST '|$elt| '|Lisp| '|construct|)
                    (|makeLispList| |decls|)))
      (SETQ |fargNames|
              ((LAMBDA (|bfVar#42| |bfVar#41| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#41|)
                        (PROGN (SETQ |u| (CAR |bfVar#41|)) NIL))
                    (RETURN (NREVERSE |bfVar#42|)))
                   (#1#
                    (AND (NULL (OR (MEMQ |u| |dummies|) (MEMQ |u| |asps|)))
                         (SETQ |bfVar#42|
                                 (CONS
                                  (INTERN (STRCONC (STRINGIMAGE |u|) "_arg"))
                                  |bfVar#42|)))))
                  (SETQ |bfVar#41| (CDR |bfVar#41|))))
               NIL |args| NIL))
      ((LAMBDA (|bfVar#43| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#43|) (PROGN (SETQ |u| (CAR |bfVar#43|)) NIL))
            (RETURN NIL))
           (#1#
            (SETQ |fargNames|
                    (|delete| (INTERN (STRCONC (STRINGIMAGE |u|) "_arg"))
                     |fargNames|))))
          (SETQ |bfVar#43| (CDR |bfVar#43|))))
       |asps| NIL)
      (SETQ |resPar|
              (LIST '|construct|
                    (LIST '@ (CONS '|construct| |fargNames|)
                          (LIST '|List| (LIST '|Any|)))))
      (SETQ |call|
              (LIST (LIST '|$elt| '|Lisp| '|invokeFortran|)
                    (STRCONC |file| '|.spadexe|)
                    (CONS (LIST '|$elt| '|Lisp| '|construct|)
                          (|mkQuote| |args|))
                    (CONS (LIST '|$elt| '|Lisp| '|construct|)
                          (|mkQuote| (|union| |asps| |dummies|)))
                    |decPar|
                    (CONS (LIST '|$elt| '|Lisp| '|construct|)
                          (|mkQuote| |results|))
                    |resPar|))
      (COND
       (|asps| (SETQ |aspId| (STRCONC (|getEnv| "SPADNUM") (GENTEMP "NAG")))
        (SETQ |body|
                (CONS 'SEQ
                      (APPEND (|makeAspGenerators| |asps| |aspTypes| |aspId|)
                              (CONS (|makeCompilation| |asps| |file| |aspId|)
                                    (CONS (LIST '|pretend| |call| |fType|)
                                          NIL))))))
       (#1# (SETQ |body| (LIST '|pretend| |call| |fType|))))
      (|interpret|
       (LIST 'DEF (CONS |name| |argNames|) (CONS '|Result| |aType|) |nilLst|
             (LIST (LIST '|$elt| '|Result| '|construct|) |body|))
       NIL)))))
 
; stripNil u ==
;   [first(u), ["construct", :CADR(u)], if CADDR(u) then "true" else "false"]
 
(DEFUN |stripNil| (|u|)
  (PROG ()
    (RETURN
     (LIST (CAR |u|) (CONS '|construct| (CADR |u|))
           (COND ((CADDR |u|) '|true|) ('T '|false|))))))
 
; makeUnion aspType ==
;   -- The argument is the type of the asp to be generated.  We would like to
;   -- allow the user to be able to provide a fileName as an alternative
;   -- argument, so this builds the Union of aspType and FileName.
;   ["Union",[":","fp",aspType],[":","fn","FileName"]]
 
(DEFUN |makeUnion| (|aspType|)
  (PROG ()
    (RETURN
     (LIST '|Union| (LIST '|:| '|fp| |aspType|)
           (LIST '|:| '|fn| '|FileName|)))))
 
; axiomType(a,decls,asps,aspInfo) ==
;   a in asps =>
;     entry := first [u for u in aspInfo | first(u) = a]
;     ftc := ["$elt","FortranType","construct"]
;     rc  := ["$elt", _
;              ["Record",[":","key","Symbol"],[":","entry","FortranType"]], _
;             "construct"]
;     makeUnion ["FortranProgram",_
;       a,_
;       CADR(entry),_
;       ["construct",:mkQuote CADDR entry], _
;       [ ["$elt", "SymbolTable","symbolTable"],_
;           ["construct",_
;             :[[rc,first(v),[ftc,:stripNil rest(v)]] for v in CADDDR entry]]_
;     ] ]
;   spadTypeTTT(getFortranType(a,decls))
 
(DEFUN |axiomType| (|a| |decls| |asps| |aspInfo|)
  (PROG (|entry| |ftc| |rc|)
    (RETURN
     (COND
      ((|member| |a| |asps|)
       (PROGN
        (SETQ |entry|
                (CAR
                 ((LAMBDA (|bfVar#45| |bfVar#44| |u|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#44|)
                           (PROGN (SETQ |u| (CAR |bfVar#44|)) NIL))
                       (RETURN (NREVERSE |bfVar#45|)))
                      (#1='T
                       (AND (EQUAL (CAR |u|) |a|)
                            (SETQ |bfVar#45| (CONS |u| |bfVar#45|)))))
                     (SETQ |bfVar#44| (CDR |bfVar#44|))))
                  NIL |aspInfo| NIL)))
        (SETQ |ftc| (LIST '|$elt| '|FortranType| '|construct|))
        (SETQ |rc|
                (LIST '|$elt|
                      (LIST '|Record| (LIST '|:| '|key| '|Symbol|)
                            (LIST '|:| '|entry| '|FortranType|))
                      '|construct|))
        (|makeUnion|
         (LIST '|FortranProgram| |a| (CADR |entry|)
               (CONS '|construct| (|mkQuote| (CADDR |entry|)))
               (LIST (LIST '|$elt| '|SymbolTable| '|symbolTable|)
                     (CONS '|construct|
                           ((LAMBDA (|bfVar#47| |bfVar#46| |v|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#46|)
                                     (PROGN (SETQ |v| (CAR |bfVar#46|)) NIL))
                                 (RETURN (NREVERSE |bfVar#47|)))
                                (#1#
                                 (SETQ |bfVar#47|
                                         (CONS
                                          (LIST |rc| (CAR |v|)
                                                (CONS |ftc|
                                                      (|stripNil| (CDR |v|))))
                                          |bfVar#47|))))
                               (SETQ |bfVar#46| (CDR |bfVar#46|))))
                            NIL (CADDDR |entry|) NIL)))))))
      (#1# (|spadTypeTTT| (|getFortranType| |a| |decls|)))))))
 
; makeAspGenerators(asps,types,aspId) ==
; -- The code generated here will manipulate the Fortran output stack and write
; -- the asps out as Fortran.
;   [:makeAspGenerators1(u,v,aspId) for u in asps for v in types]
 
(DEFUN |makeAspGenerators| (|asps| |types| |aspId|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#50| |bfVar#48| |u| |bfVar#49| |v|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#48|) (PROGN (SETQ |u| (CAR |bfVar#48|)) NIL)
               (ATOM |bfVar#49|) (PROGN (SETQ |v| (CAR |bfVar#49|)) NIL))
           (RETURN (NREVERSE |bfVar#50|)))
          ('T
           (SETQ |bfVar#50|
                   (APPEND (REVERSE (|makeAspGenerators1| |u| |v| |aspId|))
                           |bfVar#50|))))
         (SETQ |bfVar#48| (CDR |bfVar#48|))
         (SETQ |bfVar#49| (CDR |bfVar#49|))))
      NIL |asps| NIL |types| NIL))))
 
; makeAspGenerators1(asp,type,aspId) ==
;   [[["$elt","FOP","pushFortranOutputStack"] ,_
;     ["filename",'"",STRCONC(STRINGIMAGE asp,aspId),'"f"]] , _
;    makeOutputAsFortran INTERN STRCONC(STRINGIMAGE(asp),'"__arg"), _
;    [["$elt","FOP","popFortranOutputStack"]]   _
;   ]
 
(DEFUN |makeAspGenerators1| (|asp| |type| |aspId|)
  (PROG ()
    (RETURN
     (LIST
      (LIST (LIST '|$elt| 'FOP '|pushFortranOutputStack|)
            (LIST '|filename| "" (STRCONC (STRINGIMAGE |asp|) |aspId|) "f"))
      (|makeOutputAsFortran| (INTERN (STRCONC (STRINGIMAGE |asp|) "_arg")))
      (LIST (LIST '|$elt| 'FOP '|popFortranOutputStack|))))))
 
; makeOutputAsFortran arg ==
;   ["IF",["case",arg,"fn"],["outputAsFortran",[arg,"fn"]],_
;                           ["outputAsFortran",[arg,"fp"]] ]
 
(DEFUN |makeOutputAsFortran| (|arg|)
  (PROG ()
    (RETURN
     (LIST 'IF (LIST '|case| |arg| '|fn|)
           (LIST '|outputAsFortran| (LIST |arg| '|fn|))
           (LIST '|outputAsFortran| (LIST |arg| '|fp|))))))
 
; makeCompilation(asps,file,aspId) ==
;   [["$elt","Lisp","compileAndLink"],_
;    ["construct",:[STRCONC(STRINGIMAGE a,aspId,'".f") for a in asps]], _
;    $fortranCompilerName,_
;    STRCONC(file,'".o"),_
;    STRCONC(file,'".spadexe"),_
;    $fortranLibraries]
 
(DEFUN |makeCompilation| (|asps| |file| |aspId|)
  (PROG ()
    (RETURN
     (LIST (LIST '|$elt| '|Lisp| '|compileAndLink|)
           (CONS '|construct|
                 ((LAMBDA (|bfVar#52| |bfVar#51| |a|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#51|)
                           (PROGN (SETQ |a| (CAR |bfVar#51|)) NIL))
                       (RETURN (NREVERSE |bfVar#52|)))
                      ('T
                       (SETQ |bfVar#52|
                               (CONS (STRCONC (STRINGIMAGE |a|) |aspId| ".f")
                                     |bfVar#52|))))
                     (SETQ |bfVar#51| (CDR |bfVar#51|))))
                  NIL |asps| NIL))
           |$fortranCompilerName| (STRCONC |file| ".o")
           (STRCONC |file| ".spadexe") |$fortranLibraries|))))
 
; compileAndLink(fortFileList,fortCompiler,cFile,outFile,linkerArgs) ==
;   SYSTEM STRCONC (fortCompiler, addSpaces fortFileList,_
;                   cFile, " -o ",outFile," ",linkerArgs)
 
(DEFUN |compileAndLink|
       (|fortFileList| |fortCompiler| |cFile| |outFile| |linkerArgs|)
  (PROG ()
    (RETURN
     (SYSTEM
      (STRCONC |fortCompiler| (|addSpaces| |fortFileList|) |cFile| '| -o |
       |outFile| '| | |linkerArgs|)))))
 
; addSpaces(stringList) ==
;   l := " "
;   for s in stringList repeat l := STRCONC(l,s," ")
;   l
 
(DEFUN |addSpaces| (|stringList|)
  (PROG (|l|)
    (RETURN
     (PROGN
      (SETQ |l| '| |)
      ((LAMBDA (|bfVar#53| |s|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#53|) (PROGN (SETQ |s| (CAR |bfVar#53|)) NIL))
            (RETURN NIL))
           ('T (SETQ |l| (STRCONC |l| |s| '| |))))
          (SETQ |bfVar#53| (CDR |bfVar#53|))))
       |stringList| NIL)
      |l|))))
 
; complexRows z ==
; -- Take a list of lists of complexes (i.e. pairs of floats) and
; -- make them look like a Fortran vector!
;   [:[:pair2list(u.i) for u in z] for i in 0..#(z.0)-1]
 
(DEFUN |complexRows| (|z|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#57| |bfVar#56| |i|)
        (LOOP
         (COND ((> |i| |bfVar#56|) (RETURN (NREVERSE |bfVar#57|)))
               (#1='T
                (SETQ |bfVar#57|
                        (APPEND
                         (REVERSE
                          ((LAMBDA (|bfVar#55| |bfVar#54| |u|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#54|)
                                    (PROGN (SETQ |u| (CAR |bfVar#54|)) NIL))
                                (RETURN (NREVERSE |bfVar#55|)))
                               (#1#
                                (SETQ |bfVar#55|
                                        (APPEND
                                         (REVERSE (|pair2list| (ELT |u| |i|)))
                                         |bfVar#55|))))
                              (SETQ |bfVar#54| (CDR |bfVar#54|))))
                           NIL |z| NIL))
                         |bfVar#57|))))
         (SETQ |i| (+ |i| 1))))
      NIL (- (LENGTH (ELT |z| 0)) 1) 0))))
 
; pair2list u == [car u,cdr u]
 
(DEFUN |pair2list| (|u|) (PROG () (RETURN (LIST (CAR |u|) (CDR |u|)))))
 
; vec2Lists1 u == [ELT(u,i) for i in 0..#u-1]
 
(DEFUN |vec2Lists1| (|u|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#59| |bfVar#58| |i|)
        (LOOP
         (COND ((> |i| |bfVar#58|) (RETURN (NREVERSE |bfVar#59|)))
               ('T (SETQ |bfVar#59| (CONS (ELT |u| |i|) |bfVar#59|))))
         (SETQ |i| (+ |i| 1))))
      NIL (- (LENGTH |u|) 1) 0))))
 
; vec2Lists u == [vec2Lists1 ELT(u,i) for i in 0..#u-1]
 
(DEFUN |vec2Lists| (|u|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#61| |bfVar#60| |i|)
        (LOOP
         (COND ((> |i| |bfVar#60|) (RETURN (NREVERSE |bfVar#61|)))
               ('T
                (SETQ |bfVar#61|
                        (CONS (|vec2Lists1| (ELT |u| |i|)) |bfVar#61|))))
         (SETQ |i| (+ |i| 1))))
      NIL (- (LENGTH |u|) 1) 0))))
 
; spad2lisp(u) ==
;   -- Turn complexes into arrays of floats
;   first first(u)="Complex" =>
;     makeVector([makeVector([CADR u,CDDR u],'DOUBLE_-FLOAT)],NIL)
;   -- Turn arrays of complexes into arrays of floats so that tarnsposing
;   -- them puts them in the correct fortran order
;   first first(u)="Matrix" and first SECOND first(u) = "Complex" =>
;     makeVector([makeVector(complexRows vec2Lists rest u,'DOUBLE_-FLOAT)],NIL)
;   rest(u)
 
(DEFUN |spad2lisp| (|u|)
  (PROG ()
    (RETURN
     (COND
      ((EQ (CAR (CAR |u|)) '|Complex|)
       (|makeVector|
        (LIST (|makeVector| (LIST (CADR |u|) (CDDR |u|)) 'DOUBLE-FLOAT)) NIL))
      ((AND (EQ (CAR (CAR |u|)) '|Matrix|)
            (EQ (CAR (SECOND (CAR |u|))) '|Complex|))
       (|makeVector|
        (LIST
         (|makeVector| (|complexRows| (|vec2Lists| (CDR |u|))) 'DOUBLE-FLOAT))
        NIL))
      ('T (CDR |u|))))))
 
; invokeFortran(objFile,args,dummies,decls,results,actual) ==
;   actual := [spad2lisp(u) for u in first actual]
;   returnedValues := spadify( _
;         fortCall(objFile,prepareData(args,dummies,actual,decls),_
;                  prepareResults(results,args,dummies,actual,decls)),_
;                             results,decls,inFirstNotSecond(args,dummies),actual)
 
(DEFUN |invokeFortran| (|objFile| |args| |dummies| |decls| |results| |actual|)
  (PROG (|returnedValues|)
    (RETURN
     (PROGN
      (SETQ |actual|
              ((LAMBDA (|bfVar#63| |bfVar#62| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#62|)
                        (PROGN (SETQ |u| (CAR |bfVar#62|)) NIL))
                    (RETURN (NREVERSE |bfVar#63|)))
                   ('T (SETQ |bfVar#63| (CONS (|spad2lisp| |u|) |bfVar#63|))))
                  (SETQ |bfVar#62| (CDR |bfVar#62|))))
               NIL (CAR |actual|) NIL))
      (SETQ |returnedValues|
              (|spadify|
               (|fortCall| |objFile|
                (|prepareData| |args| |dummies| |actual| |decls|)
                (|prepareResults| |results| |args| |dummies| |actual| |decls|))
               |results| |decls| (|inFirstNotSecond| |args| |dummies|)
               |actual|))))))
 
; int2Bool u ==
;   -- Return something which looks like an axiom boolean
;   u=1 => "TRUE"
;   NIL
 
(DEFUN |int2Bool| (|u|) (PROG () (RETURN (COND ((EQL |u| 1) 'TRUE) ('T NIL)))))
 
; makeResultRecord(name,type,value) ==
;   -- Take an object returned by the NAG routine and make it into an AXIOM
;   -- object of type Record(key:Symbol,entry:Any) for use by Result.
;   CONS(name,CONS(spadTypeTTT type,value))
 
(DEFUN |makeResultRecord| (|name| |type| |value|)
  (PROG () (RETURN (CONS |name| (CONS (|spadTypeTTT| |type|) |value|)))))
 
; spadify(l,results,decls,names,actual) ==
;   -- The elements of list l are the output forms returned from the Fortran
;   -- code: integers, floats and vectors.  Return spad forms of these, of
;   -- type Record(key:Symbol,entry:Any) (for use with the Result domain).
;   SETQ(RESULTS,l)
;   spadForms := nil
;   for i in 0..(#l -1) repeat
;     fort := NTH(i,l)
;     name := NTH(i,results)
;     ty := getFortranType(name,decls)
;     -- Result is a string
;     STRINGP fort =>
;       spadForms := [makeResultRecord(name,ty,fort), :spadForms]
;     -- Result is a Complex Scalar
;     ty in ["double complex" , "complex"] =>
;        spadForms := [makeResultRecord(name,ty, _
;                                      CONS(ELT(fort,0),ELT(fort,1)) ),:spadForms]
;     -- Result is a Complex vector or array
;     LISTP(ty) and first(ty) in ["double complex" , "complex"] =>
;       dims := [getVal(u,names,actual) for u in rest ty]
;       els := nil
;       if #dims=1 then
;         els := [makeVector([CONS(ELT(fort,2*i),ELT(fort,2*i+1)) _
;                 for i in 0..(first(dims)-1)],nil)]
;       else if #dims=2 then
;         for r in 0..(first(dims) - 1) repeat
;           innerEls := nil
;           for c in 0..(SECOND(dims) - 1) repeat
;             offset := 2*(c*first(dims)+r)
;             innerEls := [CONS(ELT(fort,offset),ELT(fort,offset+1)),:innerEls]
;           els := [makeVector(NREVERSE innerEls,nil),:els]
;       else
;          error ['"Can't cope with complex output dimensions higher than 2"]
;       spadForms := [makeResultRecord(name,ty,makeVector(NREVERSE els,nil)),
;                     :spadForms]
;     -- Result is a Boolean vector or array
;     LISTP(ty) and first(ty)="logical" and #ty=2 =>
;       dim := getVal(first rest ty,names,actual)
;       spadForms := [makeResultRecord(name,ty,_
;                           [int2Bool ELT(fort,i) for i in 0..dim-1]), :spadForms]
;     LISTP(ty) and first(ty)="logical" =>
;       dims := [getVal(u,names,actual) for u in rest ty]
;       els := nil
;       if #dims=2 then
;         for r in 0..(first(dims) - 1) repeat
;           innerEls := nil
;           for c in 0..(SECOND(dims) - 1) repeat
;             innerEls := [int2Bool ELT(fort,c*first(dims)+r),:innerEls]
;           els := [NREVERSE innerEls,:els]
;       else
;          error ['"Can't cope with logical output dimensions higher than 2"]
;       spadForms := [makeResultRecord(name,ty,NREVERSE els), :spadForms]
;     -- Result is a vector or array
;     VECTORP fort =>
;       dims := [getVal(u,names,actual) for u in rest ty]
;       els := nil
;       -- Check to see whether we are dealing with a dummy (0-dimensional) array.
;       if MEMQ(0,dims) then
;         els := [[]]
;       else if #dims=1 then
;         els := [makeVector([ELT(fort,i) for i in 0..(first(dims)-1)],nil)]
;       else if #dims=2 then
;         for r in 0..(first(dims) - 1) repeat
;           innerEls := nil
;           for c in 0..(SECOND(dims) - 1) repeat
;             innerEls := [ELT(fort,c*first(dims)+r),:innerEls]
;           els := [makeVector(NREVERSE innerEls,nil),:els]
;       else if #dims=3 then
;         iDim := first(dims)
;         jDim := SECOND dims
;         kDim := THIRD dims
;         for r in 0..(iDim - 1) repeat
;           middleEls := nil
;           for c in 0..(jDim - 1) repeat
;             innerEls := nil
;             for p in 0..(kDim - 1) repeat
;               offset := p*jDim + c*kDim + r
;               innerEls := [ELT(fort,offset),:innerEls]
;             middleEls := [makeVector(NREVERSE innerEls,nil),:middleEls]
;           els := [makeVector(NREVERSE middleEls,nil),:els]
;       else
;          error ['"Can't cope with output dimensions higher than 3"]
;       if not MEMQ(0,dims) then els := makeVector(NREVERSE els,nil)
;       spadForms := [makeResultRecord(name,ty,els), :spadForms]
;     -- Result is a Boolean Scalar
;     atom fort and ty="logical" =>
;       spadForms := [makeResultRecord(name,ty,int2Bool fort), :spadForms]
;     -- Result is a Scalar
;     atom fort =>
;       spadForms := [makeResultRecord(name,ty,fort),:spadForms]
;     error ['"Unrecognised output format: ",fort]
;   NREVERSE spadForms
 
(DEFUN |spadify| (|l| |results| |decls| |names| |actual|)
  (PROG (|spadForms| |fort| |name| |ty| |dims| |els| |innerEls| |offset| |dim|
         |iDim| |jDim| |kDim| |middleEls|)
    (RETURN
     (PROGN
      (SETQ RESULTS |l|)
      (SETQ |spadForms| NIL)
      ((LAMBDA (|bfVar#64| |i|)
         (LOOP
          (COND ((> |i| |bfVar#64|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |fort| (NTH |i| |l|))
                  (SETQ |name| (NTH |i| |results|))
                  (SETQ |ty| (|getFortranType| |name| |decls|))
                  (COND
                   ((STRINGP |fort|)
                    (SETQ |spadForms|
                            (CONS (|makeResultRecord| |name| |ty| |fort|)
                                  |spadForms|)))
                   ((|member| |ty| (LIST '|double complex| '|complex|))
                    (SETQ |spadForms|
                            (CONS
                             (|makeResultRecord| |name| |ty|
                              (CONS (ELT |fort| 0) (ELT |fort| 1)))
                             |spadForms|)))
                   ((AND (LISTP |ty|)
                         (|member| (CAR |ty|)
                          (LIST '|double complex| '|complex|)))
                    (PROGN
                     (SETQ |dims|
                             ((LAMBDA (|bfVar#66| |bfVar#65| |u|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#65|)
                                       (PROGN (SETQ |u| (CAR |bfVar#65|)) NIL))
                                   (RETURN (NREVERSE |bfVar#66|)))
                                  (#1#
                                   (SETQ |bfVar#66|
                                           (CONS
                                            (|getVal| |u| |names| |actual|)
                                            |bfVar#66|))))
                                 (SETQ |bfVar#65| (CDR |bfVar#65|))))
                              NIL (CDR |ty|) NIL))
                     (SETQ |els| NIL)
                     (COND
                      ((EQL (LENGTH |dims|) 1)
                       (SETQ |els|
                               (LIST
                                (|makeVector|
                                 ((LAMBDA (|bfVar#68| |bfVar#67| |i|)
                                    (LOOP
                                     (COND
                                      ((> |i| |bfVar#67|)
                                       (RETURN (NREVERSE |bfVar#68|)))
                                      (#1#
                                       (SETQ |bfVar#68|
                                               (CONS
                                                (CONS (ELT |fort| (* 2 |i|))
                                                      (ELT |fort|
                                                           (+ (* 2 |i|) 1)))
                                                |bfVar#68|))))
                                     (SETQ |i| (+ |i| 1))))
                                  NIL (- (CAR |dims|) 1) 0)
                                 NIL))))
                      ((EQL (LENGTH |dims|) 2)
                       ((LAMBDA (|bfVar#69| |r|)
                          (LOOP
                           (COND ((> |r| |bfVar#69|) (RETURN NIL))
                                 (#1#
                                  (PROGN
                                   (SETQ |innerEls| NIL)
                                   ((LAMBDA (|bfVar#70| |c|)
                                      (LOOP
                                       (COND ((> |c| |bfVar#70|) (RETURN NIL))
                                             (#1#
                                              (PROGN
                                               (SETQ |offset|
                                                       (* 2
                                                          (+
                                                           (* |c| (CAR |dims|))
                                                           |r|)))
                                               (SETQ |innerEls|
                                                       (CONS
                                                        (CONS
                                                         (ELT |fort| |offset|)
                                                         (ELT |fort|
                                                              (+ |offset| 1)))
                                                        |innerEls|)))))
                                       (SETQ |c| (+ |c| 1))))
                                    (- (SECOND |dims|) 1) 0)
                                   (SETQ |els|
                                           (CONS
                                            (|makeVector| (NREVERSE |innerEls|)
                                             NIL)
                                            |els|)))))
                           (SETQ |r| (+ |r| 1))))
                        (- (CAR |dims|) 1) 0))
                      (#1#
                       (|error|
                        (LIST
                         "Can't cope with complex output dimensions higher than 2"))))
                     (SETQ |spadForms|
                             (CONS
                              (|makeResultRecord| |name| |ty|
                               (|makeVector| (NREVERSE |els|) NIL))
                              |spadForms|))))
                   ((AND (LISTP |ty|) (EQ (CAR |ty|) '|logical|)
                         (EQL (LENGTH |ty|) 2))
                    (PROGN
                     (SETQ |dim| (|getVal| (CAR (CDR |ty|)) |names| |actual|))
                     (SETQ |spadForms|
                             (CONS
                              (|makeResultRecord| |name| |ty|
                               ((LAMBDA (|bfVar#72| |bfVar#71| |i|)
                                  (LOOP
                                   (COND
                                    ((> |i| |bfVar#71|)
                                     (RETURN (NREVERSE |bfVar#72|)))
                                    (#1#
                                     (SETQ |bfVar#72|
                                             (CONS
                                              (|int2Bool| (ELT |fort| |i|))
                                              |bfVar#72|))))
                                   (SETQ |i| (+ |i| 1))))
                                NIL (- |dim| 1) 0))
                              |spadForms|))))
                   ((AND (LISTP |ty|) (EQ (CAR |ty|) '|logical|))
                    (PROGN
                     (SETQ |dims|
                             ((LAMBDA (|bfVar#74| |bfVar#73| |u|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#73|)
                                       (PROGN (SETQ |u| (CAR |bfVar#73|)) NIL))
                                   (RETURN (NREVERSE |bfVar#74|)))
                                  (#1#
                                   (SETQ |bfVar#74|
                                           (CONS
                                            (|getVal| |u| |names| |actual|)
                                            |bfVar#74|))))
                                 (SETQ |bfVar#73| (CDR |bfVar#73|))))
                              NIL (CDR |ty|) NIL))
                     (SETQ |els| NIL)
                     (COND
                      ((EQL (LENGTH |dims|) 2)
                       ((LAMBDA (|bfVar#75| |r|)
                          (LOOP
                           (COND ((> |r| |bfVar#75|) (RETURN NIL))
                                 (#1#
                                  (PROGN
                                   (SETQ |innerEls| NIL)
                                   ((LAMBDA (|bfVar#76| |c|)
                                      (LOOP
                                       (COND ((> |c| |bfVar#76|) (RETURN NIL))
                                             (#1#
                                              (SETQ |innerEls|
                                                      (CONS
                                                       (|int2Bool|
                                                        (ELT |fort|
                                                             (+
                                                              (* |c|
                                                                 (CAR |dims|))
                                                              |r|)))
                                                       |innerEls|))))
                                       (SETQ |c| (+ |c| 1))))
                                    (- (SECOND |dims|) 1) 0)
                                   (SETQ |els|
                                           (CONS (NREVERSE |innerEls|)
                                                 |els|)))))
                           (SETQ |r| (+ |r| 1))))
                        (- (CAR |dims|) 1) 0))
                      (#1#
                       (|error|
                        (LIST
                         "Can't cope with logical output dimensions higher than 2"))))
                     (SETQ |spadForms|
                             (CONS
                              (|makeResultRecord| |name| |ty| (NREVERSE |els|))
                              |spadForms|))))
                   ((VECTORP |fort|)
                    (PROGN
                     (SETQ |dims|
                             ((LAMBDA (|bfVar#78| |bfVar#77| |u|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#77|)
                                       (PROGN (SETQ |u| (CAR |bfVar#77|)) NIL))
                                   (RETURN (NREVERSE |bfVar#78|)))
                                  (#1#
                                   (SETQ |bfVar#78|
                                           (CONS
                                            (|getVal| |u| |names| |actual|)
                                            |bfVar#78|))))
                                 (SETQ |bfVar#77| (CDR |bfVar#77|))))
                              NIL (CDR |ty|) NIL))
                     (SETQ |els| NIL)
                     (COND ((MEMQ 0 |dims|) (SETQ |els| (LIST NIL)))
                           ((EQL (LENGTH |dims|) 1)
                            (SETQ |els|
                                    (LIST
                                     (|makeVector|
                                      ((LAMBDA (|bfVar#80| |bfVar#79| |i|)
                                         (LOOP
                                          (COND
                                           ((> |i| |bfVar#79|)
                                            (RETURN (NREVERSE |bfVar#80|)))
                                           (#1#
                                            (SETQ |bfVar#80|
                                                    (CONS (ELT |fort| |i|)
                                                          |bfVar#80|))))
                                          (SETQ |i| (+ |i| 1))))
                                       NIL (- (CAR |dims|) 1) 0)
                                      NIL))))
                           ((EQL (LENGTH |dims|) 2)
                            ((LAMBDA (|bfVar#81| |r|)
                               (LOOP
                                (COND ((> |r| |bfVar#81|) (RETURN NIL))
                                      (#1#
                                       (PROGN
                                        (SETQ |innerEls| NIL)
                                        ((LAMBDA (|bfVar#82| |c|)
                                           (LOOP
                                            (COND
                                             ((> |c| |bfVar#82|) (RETURN NIL))
                                             (#1#
                                              (SETQ |innerEls|
                                                      (CONS
                                                       (ELT |fort|
                                                            (+
                                                             (* |c|
                                                                (CAR |dims|))
                                                             |r|))
                                                       |innerEls|))))
                                            (SETQ |c| (+ |c| 1))))
                                         (- (SECOND |dims|) 1) 0)
                                        (SETQ |els|
                                                (CONS
                                                 (|makeVector|
                                                  (NREVERSE |innerEls|) NIL)
                                                 |els|)))))
                                (SETQ |r| (+ |r| 1))))
                             (- (CAR |dims|) 1) 0))
                           ((EQL (LENGTH |dims|) 3) (SETQ |iDim| (CAR |dims|))
                            (SETQ |jDim| (SECOND |dims|))
                            (SETQ |kDim| (THIRD |dims|))
                            ((LAMBDA (|bfVar#83| |r|)
                               (LOOP
                                (COND ((> |r| |bfVar#83|) (RETURN NIL))
                                      (#1#
                                       (PROGN
                                        (SETQ |middleEls| NIL)
                                        ((LAMBDA (|bfVar#84| |c|)
                                           (LOOP
                                            (COND
                                             ((> |c| |bfVar#84|) (RETURN NIL))
                                             (#1#
                                              (PROGN
                                               (SETQ |innerEls| NIL)
                                               ((LAMBDA (|bfVar#85| |p|)
                                                  (LOOP
                                                   (COND
                                                    ((> |p| |bfVar#85|)
                                                     (RETURN NIL))
                                                    (#1#
                                                     (PROGN
                                                      (SETQ |offset|
                                                              (+
                                                               (+
                                                                (* |p| |jDim|)
                                                                (* |c| |kDim|))
                                                               |r|))
                                                      (SETQ |innerEls|
                                                              (CONS
                                                               (ELT |fort|
                                                                    |offset|)
                                                               |innerEls|)))))
                                                   (SETQ |p| (+ |p| 1))))
                                                (- |kDim| 1) 0)
                                               (SETQ |middleEls|
                                                       (CONS
                                                        (|makeVector|
                                                         (NREVERSE |innerEls|)
                                                         NIL)
                                                        |middleEls|)))))
                                            (SETQ |c| (+ |c| 1))))
                                         (- |jDim| 1) 0)
                                        (SETQ |els|
                                                (CONS
                                                 (|makeVector|
                                                  (NREVERSE |middleEls|) NIL)
                                                 |els|)))))
                                (SETQ |r| (+ |r| 1))))
                             (- |iDim| 1) 0))
                           (#1#
                            (|error|
                             (LIST
                              "Can't cope with output dimensions higher than 3"))))
                     (COND
                      ((NULL (MEMQ 0 |dims|))
                       (SETQ |els| (|makeVector| (NREVERSE |els|) NIL))))
                     (SETQ |spadForms|
                             (CONS (|makeResultRecord| |name| |ty| |els|)
                                   |spadForms|))))
                   ((AND (ATOM |fort|) (EQ |ty| '|logical|))
                    (SETQ |spadForms|
                            (CONS
                             (|makeResultRecord| |name| |ty|
                              (|int2Bool| |fort|))
                             |spadForms|)))
                   ((ATOM |fort|)
                    (SETQ |spadForms|
                            (CONS (|makeResultRecord| |name| |ty| |fort|)
                                  |spadForms|)))
                   (#1#
                    (|error| (LIST "Unrecognised output format: " |fort|)))))))
          (SETQ |i| (+ |i| 1))))
       (- (LENGTH |l|) 1) 0)
      (NREVERSE |spadForms|)))))
 
; lispType u ==
;   -- Return the lisp type equivalent to the given Fortran type.
;   LISTP u => lispType first u
;   u = "real" => "SHORT-FLOAT"
;   u = "double" => "DOUBLE-FLOAT"
;   u = "double precision" => "DOUBLE-FLOAT"
;   u = "integer" => "FIXNUM"
;   u = "logical" => "BOOLEAN"
;   u = "character" => "CHARACTER"
;   u = "complex" => "SHORT-FLOAT"
;   u = "double complex" => "DOUBLE-FLOAT"
;   error ['"Unrecognised Fortran type: ",u]
 
(DEFUN |lispType| (|u|)
  (PROG ()
    (RETURN
     (COND ((LISTP |u|) (|lispType| (CAR |u|))) ((EQ |u| '|real|) 'SHORT-FLOAT)
           ((EQ |u| '|double|) 'DOUBLE-FLOAT)
           ((EQ |u| '|double precision|) 'DOUBLE-FLOAT)
           ((EQ |u| '|integer|) 'FIXNUM) ((EQ |u| '|logical|) 'BOOLEAN)
           ((EQ |u| '|character|) 'CHARACTER)
           ((EQ |u| '|complex|) 'SHORT-FLOAT)
           ((EQ |u| '|double complex|) 'DOUBLE-FLOAT)
           ('T (|error| (LIST "Unrecognised Fortran type: " |u|)))))))
 
; getVal(u,names,values) ==
;   -- if u is the i'th element of names, return the i'th element of values,
;   -- otherwise if it is an arithmetic expression evaluate it.
;   NUMBERP(u) => u
;   LISTP(u) => eval [first(u), :[getVal(v,names,values) for v in rest u]]
;   (place := POSITION(u,names)) => NTH(place,values)
;   error ['"No value found for parameter: ",u]
 
(DEFUN |getVal| (|u| |names| |values|)
  (PROG (|place|)
    (RETURN
     (COND ((NUMBERP |u|) |u|)
           ((LISTP |u|)
            (|eval|
             (CONS (CAR |u|)
                   ((LAMBDA (|bfVar#87| |bfVar#86| |v|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#86|)
                             (PROGN (SETQ |v| (CAR |bfVar#86|)) NIL))
                         (RETURN (NREVERSE |bfVar#87|)))
                        (#1='T
                         (SETQ |bfVar#87|
                                 (CONS (|getVal| |v| |names| |values|)
                                       |bfVar#87|))))
                       (SETQ |bfVar#86| (CDR |bfVar#86|))))
                    NIL (CDR |u|) NIL))))
           ((SETQ |place| (POSITION |u| |names|)) (NTH |place| |values|))
           (#1# (|error| (LIST "No value found for parameter: " |u|)))))))
 
; prepareData(args,dummies,values,decls) ==
; -- TTT: we don't
; -- writeData handles all the mess
;    [args,dummies,values,decls]
 
(DEFUN |prepareData| (|args| |dummies| |values| |decls|)
  (PROG () (RETURN (LIST |args| |dummies| |values| |decls|))))
 
; checkForBoolean u ==
;   u = "BOOLEAN" => "FIXNUM"
;   u
 
(DEFUN |checkForBoolean| (|u|)
  (PROG () (RETURN (COND ((EQ |u| 'BOOLEAN) 'FIXNUM) ('T |u|)))))
 
; prepareResults(results,args,dummies,values,decls) ==
;   -- Create the floating point zeros (boot doesn't like 0.0d0, 0.0D0 etc)
;   shortZero : fluid := COERCE(0.0,'SHORT_-FLOAT)
;   longZero : fluid := COERCE(0.0,'DOUBLE_-FLOAT)
;   data := nil
;   for u in results repeat
;     type := getFortranType(u,decls)
;     data := [defaultValue(type,inFirstNotSecond(args,dummies),values),:data]
;       where defaultValue(type,argNames,actual) ==
;         LISTP(type) and first(type)="character" => MAKE_-STRING(1)
;         LISTP(type) and first(type) in ["complex","double complex"] =>
;           makeVector(  makeList(
;             2*APPLY('_*,[getVal(tt,argNames,actual) for tt in rest(type)]),_
;             if first(type)="complex" then shortZero else longZero),_
;           if first(type)="complex" then "SHORT-FLOAT" else "DOUBLE-FLOAT" )
;         LISTP type => makeVector(_
;           makeList(
;             APPLY('_*,[getVal(tt,argNames,actual) for tt in rest(type)]),_
;             defaultValue(first type,argNames,actual)),_
;           checkForBoolean lispType first(type) )
;         type = "integer" => 0
;         type = "real" => shortZero
;         type = "double" => longZero
;         type = "double precision" => longZero
;         type = "logical" => 0
;         type = "character" => MAKE_-STRING(1)
;         type = "complex" => makeVector([shortZero,shortZero],'SHORT_-FLOAT)
;         type = "double complex" => makeVector([longZero,longZero],'DOUBLE_-FLOAT)
;         error ['"Unrecognised Fortran type: ",type]
;   NREVERSE data
 
(DEFUN |prepareResults| (|results| |args| |dummies| |values| |decls|)
  (PROG (|longZero| |shortZero| |type| |data|)
    (DECLARE (SPECIAL |longZero| |shortZero|))
    (RETURN
     (PROGN
      (SETQ |shortZero| (COERCE 0.0 'SHORT-FLOAT))
      (SETQ |longZero| (COERCE 0.0 'DOUBLE-FLOAT))
      (SETQ |data| NIL)
      ((LAMBDA (|bfVar#88| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#88|) (PROGN (SETQ |u| (CAR |bfVar#88|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |type| (|getFortranType| |u| |decls|))
             (SETQ |data|
                     (CONS
                      (|prepareResults,defaultValue| |type|
                       (|inFirstNotSecond| |args| |dummies|) |values|)
                      |data|)))))
          (SETQ |bfVar#88| (CDR |bfVar#88|))))
       |results| NIL)
      (NREVERSE |data|)))))
(DEFUN |prepareResults,defaultValue| (|type| |argNames| |actual|)
  (PROG ()
    (RETURN
     (COND
      ((AND (LISTP |type|) (EQ (CAR |type|) '|character|)) (MAKE-STRING 1))
      ((AND (LISTP |type|)
            (|member| (CAR |type|) (LIST '|complex| '|double complex|)))
       (|makeVector|
        (|makeList|
         (* 2
            (APPLY '*
                   ((LAMBDA (|bfVar#90| |bfVar#89| |tt|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#89|)
                             (PROGN (SETQ |tt| (CAR |bfVar#89|)) NIL))
                         (RETURN (NREVERSE |bfVar#90|)))
                        (#1='T
                         (SETQ |bfVar#90|
                                 (CONS (|getVal| |tt| |argNames| |actual|)
                                       |bfVar#90|))))
                       (SETQ |bfVar#89| (CDR |bfVar#89|))))
                    NIL (CDR |type|) NIL)))
         (COND ((EQ (CAR |type|) '|complex|) |shortZero|) (#1# |longZero|)))
        (COND ((EQ (CAR |type|) '|complex|) 'SHORT-FLOAT)
              (#1# 'DOUBLE-FLOAT))))
      ((LISTP |type|)
       (|makeVector|
        (|makeList|
         (APPLY '*
                ((LAMBDA (|bfVar#92| |bfVar#91| |tt|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#91|)
                          (PROGN (SETQ |tt| (CAR |bfVar#91|)) NIL))
                      (RETURN (NREVERSE |bfVar#92|)))
                     (#1#
                      (SETQ |bfVar#92|
                              (CONS (|getVal| |tt| |argNames| |actual|)
                                    |bfVar#92|))))
                    (SETQ |bfVar#91| (CDR |bfVar#91|))))
                 NIL (CDR |type|) NIL))
         (|prepareResults,defaultValue| (CAR |type|) |argNames| |actual|))
        (|checkForBoolean| (|lispType| (CAR |type|)))))
      ((EQ |type| '|integer|) 0) ((EQ |type| '|real|) |shortZero|)
      ((EQ |type| '|double|) |longZero|)
      ((EQ |type| '|double precision|) |longZero|) ((EQ |type| '|logical|) 0)
      ((EQ |type| '|character|) (MAKE-STRING 1))
      ((EQ |type| '|complex|)
       (|makeVector| (LIST |shortZero| |shortZero|) 'SHORT-FLOAT))
      ((EQ |type| '|double complex|)
       (|makeVector| (LIST |longZero| |longZero|) 'DOUBLE-FLOAT))
      (#1# (|error| (LIST "Unrecognised Fortran type: " |type|)))))))
 
; writeData(tmpFile,indata) ==
;   -- Write the elements of the list data to a temporary file.  Return the
;   -- name of that file.
;   --
;   str := MAKE_-OUTSTREAM(tmpFile)
;   xstr := xdrOpen(str,true)
;   [args,dummies,values,decls] := indata
;   for v in values repeat
;         -- the two Boolean values
;         v = "T" =>
;                 xdrWrite(xstr,1)
;         NULL v =>
;                 xdrWrite(xstr,0)
;         -- characters
;         STRINGP v =>
;                 xdrWrite(xstr,v)
;         -- some array
;         VECTORP v =>
;                 rows := first ARRAY_-DIMENSIONS(v)
;                 -- is it 2d or more (most likely) ?
;                 VECTORP ELT(v,0) =>
;                         cols := first ARRAY_-DIMENSIONS(ELT(v, 0))
;                         -- is it 3d ?
;                         VECTORP ELT(ELT(v,0),0) =>
;                                 planes := first
;                                     ARRAY_-DIMENSIONS(ELT(ELT(v, 0), 0))
;                                 -- write 3d array
;                                 xdrWrite(xstr,rows*cols*planes)
;                                 for k in 0..planes-1 repeat
;                                         for j in 0..cols-1 repeat
;                                                 for i in 0..rows-1 repeat
;                                                         xdrWrite(xstr,ELT(ELT(ELT(v,i),j),k))
;                         -- write 2d array
;                         xdrWrite(xstr,rows*cols)
;                         for j in 0..cols-1 repeat
;                                 for i in 0..rows-1 repeat xdrWrite(xstr,ELT(ELT(v,i),j))
;                 -- write 1d array
;                 xdrWrite(xstr,rows)
;                 for i in 0..rows-1 repeat xdrWrite(xstr,ELT(v,i))
;         -- this is used for lists of booleans apparently in f01
;         LISTP v =>
;                 xdrWrite(xstr,LENGTH v)
;                 for el in v repeat
;                         if el then xdrWrite(xstr,1) else xdrWrite(xstr,0)
;         -- integers
;         INTEGERP v =>
;                 xdrWrite(xstr,v)
;         -- floats
;         FLOATP v =>
;                 xdrWrite(xstr,v)
;   SHUT(str)
;   tmpFile
 
(DEFUN |writeData| (|tmpFile| |indata|)
  (PROG (|str| |xstr| |args| |dummies| |values| |decls| |rows| |cols| |planes|)
    (RETURN
     (PROGN
      (SETQ |str| (MAKE-OUTSTREAM |tmpFile|))
      (SETQ |xstr| (|xdrOpen| |str| T))
      (SETQ |args| (CAR |indata|))
      (SETQ |dummies| (CADR . #1=(|indata|)))
      (SETQ |values| (CADDR . #1#))
      (SETQ |decls| (CADDDR . #1#))
      ((LAMBDA (|bfVar#93| |v|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#93|) (PROGN (SETQ |v| (CAR |bfVar#93|)) NIL))
            (RETURN NIL))
           (#2='T
            (COND ((EQ |v| 'T) (|xdrWrite| |xstr| 1))
                  ((NULL |v|) (|xdrWrite| |xstr| 0))
                  ((STRINGP |v|) (|xdrWrite| |xstr| |v|))
                  ((VECTORP |v|)
                   (PROGN
                    (SETQ |rows| (CAR (ARRAY-DIMENSIONS |v|)))
                    (COND
                     ((VECTORP (ELT |v| 0))
                      (PROGN
                       (SETQ |cols| (CAR (ARRAY-DIMENSIONS (ELT |v| 0))))
                       (COND
                        ((VECTORP (ELT (ELT |v| 0) 0))
                         (PROGN
                          (SETQ |planes|
                                  (CAR (ARRAY-DIMENSIONS (ELT (ELT |v| 0) 0))))
                          (|xdrWrite| |xstr| (* (* |rows| |cols|) |planes|))
                          ((LAMBDA (|bfVar#94| |k|)
                             (LOOP
                              (COND ((> |k| |bfVar#94|) (RETURN NIL))
                                    (#2#
                                     ((LAMBDA (|bfVar#95| |j|)
                                        (LOOP
                                         (COND
                                          ((> |j| |bfVar#95|) (RETURN NIL))
                                          (#2#
                                           ((LAMBDA (|bfVar#96| |i|)
                                              (LOOP
                                               (COND
                                                ((> |i| |bfVar#96|)
                                                 (RETURN NIL))
                                                (#2#
                                                 (|xdrWrite| |xstr|
                                                  (ELT (ELT (ELT |v| |i|) |j|)
                                                       |k|))))
                                               (SETQ |i| (+ |i| 1))))
                                            (- |rows| 1) 0)))
                                         (SETQ |j| (+ |j| 1))))
                                      (- |cols| 1) 0)))
                              (SETQ |k| (+ |k| 1))))
                           (- |planes| 1) 0)))
                        (#2#
                         (PROGN
                          (|xdrWrite| |xstr| (* |rows| |cols|))
                          ((LAMBDA (|bfVar#97| |j|)
                             (LOOP
                              (COND ((> |j| |bfVar#97|) (RETURN NIL))
                                    (#2#
                                     ((LAMBDA (|bfVar#98| |i|)
                                        (LOOP
                                         (COND
                                          ((> |i| |bfVar#98|) (RETURN NIL))
                                          (#2#
                                           (|xdrWrite| |xstr|
                                            (ELT (ELT |v| |i|) |j|))))
                                         (SETQ |i| (+ |i| 1))))
                                      (- |rows| 1) 0)))
                              (SETQ |j| (+ |j| 1))))
                           (- |cols| 1) 0))))))
                     (#2#
                      (PROGN
                       (|xdrWrite| |xstr| |rows|)
                       ((LAMBDA (|bfVar#99| |i|)
                          (LOOP
                           (COND ((> |i| |bfVar#99|) (RETURN NIL))
                                 (#2# (|xdrWrite| |xstr| (ELT |v| |i|))))
                           (SETQ |i| (+ |i| 1))))
                        (- |rows| 1) 0))))))
                  ((LISTP |v|)
                   (PROGN
                    (|xdrWrite| |xstr| (LENGTH |v|))
                    ((LAMBDA (|bfVar#100| |el|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#100|)
                              (PROGN (SETQ |el| (CAR |bfVar#100|)) NIL))
                          (RETURN NIL))
                         (#2#
                          (COND (|el| (|xdrWrite| |xstr| 1))
                                (#2# (|xdrWrite| |xstr| 0)))))
                        (SETQ |bfVar#100| (CDR |bfVar#100|))))
                     |v| NIL)))
                  ((INTEGERP |v|) (|xdrWrite| |xstr| |v|))
                  ((FLOATP |v|) (|xdrWrite| |xstr| |v|)))))
          (SETQ |bfVar#93| (CDR |bfVar#93|))))
       |values| NIL)
      (SHUT |str|)
      |tmpFile|))))
 
; readData(tmpFile,results) ==
;   -- read in the results from tmpFile.  The list results is a list of
;   -- dummy objects of the correct type which will receive the data.
;   str := MAKE_-INSTREAM(tmpFile)
;   xstr := xdrOpen(str,false)
;   results := [xdrRead1(xstr,r) for r in results] where
;     xdrRead1(x,dummy) ==
;       VECTORP(dummy) and ZEROP(LENGTH dummy) => dummy
;       xdrRead(x,dummy)
;   SHUT(str)
;   results
 
(DEFUN |readData| (|tmpFile| |results|)
  (PROG (|str| |xstr|)
    (RETURN
     (PROGN
      (SETQ |str| (MAKE-INSTREAM |tmpFile|))
      (SETQ |xstr| (|xdrOpen| |str| NIL))
      (SETQ |results|
              ((LAMBDA (|bfVar#102| |bfVar#101| |r|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#101|)
                        (PROGN (SETQ |r| (CAR |bfVar#101|)) NIL))
                    (RETURN (NREVERSE |bfVar#102|)))
                   ('T
                    (SETQ |bfVar#102|
                            (CONS (|readData,xdrRead1| |xstr| |r|)
                                  |bfVar#102|))))
                  (SETQ |bfVar#101| (CDR |bfVar#101|))))
               NIL |results| NIL))
      (SHUT |str|)
      |results|))))
(DEFUN |readData,xdrRead1| (|x| |dummy|)
  (PROG ()
    (RETURN
     (COND ((AND (VECTORP |dummy|) (ZEROP (LENGTH |dummy|))) |dummy|)
           ('T (|xdrRead| |x| |dummy|))))))
 
; generateDataName()==STRCONC($fortranTmpDir,getEnv('"HOST"),
;     getEnv('"SPADNUM"), GENTEMP('"NAG"),'"data")
 
(DEFUN |generateDataName| #1=()
  (PROG #1#
    (RETURN
     (STRCONC |$fortranTmpDir| (|getEnv| "HOST") (|getEnv| "SPADNUM")
      (GENTEMP "NAG") "data"))))
 
; generateResultsName()==STRCONC($fortranTmpDir,getEnv('"HOST"),
;     getEnv('"SPADNUM"), GENTEMP('"NAG"),'"results")
 
(DEFUN |generateResultsName| #1=()
  (PROG #1#
    (RETURN
     (STRCONC |$fortranTmpDir| (|getEnv| "HOST") (|getEnv| "SPADNUM")
      (GENTEMP "NAG") "results"))))
 
; fortCall(objFile,data,results) ==
;   tmpFile1 := writeData(generateDataName(),data)
;   tmpFile2 := generateResultsName()
;   SYSTEM STRCONC(objFile," < ",tmpFile1," > ",tmpFile2)
;   results := readData(tmpFile2,results)
;   -- SYSTEM STRCONC("rm -f ",tmpFile1," ",tmpFile2)
;   PROBE_-FILE(tmpFile1) and DELETE_-FILE(tmpFile1)
;   PROBE_-FILE(tmpFile2) and DELETE_-FILE(tmpFile2)
;   results
 
(DEFUN |fortCall| (|objFile| |data| |results|)
  (PROG (|tmpFile1| |tmpFile2|)
    (RETURN
     (PROGN
      (SETQ |tmpFile1| (|writeData| (|generateDataName|) |data|))
      (SETQ |tmpFile2| (|generateResultsName|))
      (SYSTEM (STRCONC |objFile| '| < | |tmpFile1| '| > | |tmpFile2|))
      (SETQ |results| (|readData| |tmpFile2| |results|))
      (AND (PROBE-FILE |tmpFile1|) (DELETE-FILE |tmpFile1|))
      (AND (PROBE-FILE |tmpFile2|) (DELETE-FILE |tmpFile2|))
      |results|))))
 
; invokeNagman(objFiles,nfile,args,dummies,decls,results,actual) ==
;   actual := [spad2lisp(u) for u in first actual]
;   result := spadify(protectedNagCall(objFiles,nfile, _
;                  prepareData(args,dummies,actual,decls),_
;                  prepareResults(results,args,dummies,actual,decls)),_
;                  results,decls,inFirstNotSecond(args,dummies),actual)
;   -- Tidy up asps
;   -- if objFiles then SYSTEM STRCONC("rm -f ",addSpaces objFiles)
;   for fn in objFiles repeat PROBE_-FILE(fn) and DELETE_-FILE(fn)
;   result
 
(DEFUN |invokeNagman|
       (|objFiles| |nfile| |args| |dummies| |decls| |results| |actual|)
  (PROG (|result|)
    (RETURN
     (PROGN
      (SETQ |actual|
              ((LAMBDA (|bfVar#104| |bfVar#103| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#103|)
                        (PROGN (SETQ |u| (CAR |bfVar#103|)) NIL))
                    (RETURN (NREVERSE |bfVar#104|)))
                   (#1='T
                    (SETQ |bfVar#104| (CONS (|spad2lisp| |u|) |bfVar#104|))))
                  (SETQ |bfVar#103| (CDR |bfVar#103|))))
               NIL (CAR |actual|) NIL))
      (SETQ |result|
              (|spadify|
               (|protectedNagCall| |objFiles| |nfile|
                (|prepareData| |args| |dummies| |actual| |decls|)
                (|prepareResults| |results| |args| |dummies| |actual| |decls|))
               |results| |decls| (|inFirstNotSecond| |args| |dummies|)
               |actual|))
      ((LAMBDA (|bfVar#105| |fn|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#105|) (PROGN (SETQ |fn| (CAR |bfVar#105|)) NIL))
            (RETURN NIL))
           (#1# (AND (PROBE-FILE |fn|) (DELETE-FILE |fn|))))
          (SETQ |bfVar#105| (CDR |bfVar#105|))))
       |objFiles| NIL)
      |result|))))
 
; nagCall(objFiles,nfile,data,results,tmpFiled,tmpFiler) ==
;   nagMessagesString :=
;      $nagMessages => '"on"
;      '"off"
;   writeData(tmpFiled,data)
;   toSend:=STRCONC($nagHost," ",nfile," ",tmpFiler," ",tmpFiled," ",_
;       STRINGIMAGE($fortPersistence)," ", nagMessagesString," ",addSpaces objFiles)
;   sockSendString(8,toSend)
;   if sockGetInt(8)=1 then
;     results := readData(tmpFiler,results)
;   else
;     error ['"An error was detected while reading data: ", _
;            '"perhaps an incorrect array index was given ?"]
;   results
 
(DEFUN |nagCall| (|objFiles| |nfile| |data| |results| |tmpFiled| |tmpFiler|)
  (PROG (|nagMessagesString| |toSend|)
    (RETURN
     (PROGN
      (SETQ |nagMessagesString| (COND (|$nagMessages| "on") (#1='T "off")))
      (|writeData| |tmpFiled| |data|)
      (SETQ |toSend|
              (STRCONC |$nagHost| '| | |nfile| '| | |tmpFiler| '| | |tmpFiled|
               '| | (STRINGIMAGE |$fortPersistence|) '| | |nagMessagesString|
               '| | (|addSpaces| |objFiles|)))
      (|sockSendString| 8 |toSend|)
      (COND
       ((EQL (|sockGetInt| 8) 1)
        (SETQ |results| (|readData| |tmpFiler| |results|)))
       (#1#
        (|error|
         (LIST "An error was detected while reading data: "
               "perhaps an incorrect array index was given ?"))))
      |results|))))
 
; protectedNagCall(objFiles,nfile,data,results) ==
;  errors :=true
;  val:=NIL
;  td:=generateDataName()
;  tr:=generateResultsName()
;  UNWIND_-PROTECT( (val:=nagCall(objFiles,nfile,data,results,td,tr) ;errors :=NIL),
;         errors =>( resetStackLimits(); sendNagmanErrorSignal();cleanUpAfterNagman(td,tr,objFiles)))
;  val
 
(DEFUN |protectedNagCall| (|objFiles| |nfile| |data| |results|)
  (PROG (|errors| |val| |td| |tr|)
    (RETURN
     (PROGN
      (SETQ |errors| T)
      (SETQ |val| NIL)
      (SETQ |td| (|generateDataName|))
      (SETQ |tr| (|generateResultsName|))
      (UNWIND-PROTECT
          (PROGN
           (SETQ |val|
                   (|nagCall| |objFiles| |nfile| |data| |results| |td| |tr|))
           (SETQ |errors| NIL))
        (COND
         (|errors|
          (IDENTITY
           (PROGN
            (|resetStackLimits|)
            (|sendNagmanErrorSignal|)
            (|cleanUpAfterNagman| |td| |tr| |objFiles|))))))
      |val|))))
 
; cleanUpAfterNagman(f1,f2,listf)==
;   PROBE_-FILE(f1) and DELETE_-FILE(f1)
;   PROBE_-FILE(f2) and DELETE_-FILE(f2)
;   for fn in listf repeat PROBE_-FILE(fn) and DELETE_-FILE(fn)
 
(DEFUN |cleanUpAfterNagman| (|f1| |f2| |listf|)
  (PROG ()
    (RETURN
     (PROGN
      (AND (PROBE-FILE |f1|) (DELETE-FILE |f1|))
      (AND (PROBE-FILE |f2|) (DELETE-FILE |f2|))
      ((LAMBDA (|bfVar#106| |fn|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#106|) (PROGN (SETQ |fn| (CAR |bfVar#106|)) NIL))
            (RETURN NIL))
           ('T (AND (PROBE-FILE |fn|) (DELETE-FILE |fn|))))
          (SETQ |bfVar#106| (CDR |bfVar#106|))))
       |listf| NIL)))))
 
; sendNagmanErrorSignal()==
; -- excite nagman's signal handler!
;  sockSendSignal(8,15)
 
(DEFUN |sendNagmanErrorSignal| #1=()
  (PROG #1# (RETURN (|sockSendSignal| 8 15))))
 
; inFirstNotSecond(f,s)==
;  [i for i in f | not i in s]
 
(DEFUN |inFirstNotSecond| (|f| |s|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#108| |bfVar#107| |i|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#107|) (PROGN (SETQ |i| (CAR |bfVar#107|)) NIL))
           (RETURN (NREVERSE |bfVar#108|)))
          ('T
           (AND (|member| (NULL |i|) |s|)
                (SETQ |bfVar#108| (CONS |i| |bfVar#108|)))))
         (SETQ |bfVar#107| (CDR |bfVar#107|))))
      NIL |f| NIL))))
 
; multiToUnivariate f ==
;   -- Take an AnonymousFunction, replace the bound variables by references to
;   -- elements of a vector, and compile it.
;   (first f) ~= "+->" => error "in multiToUnivariate: not an AnonymousFunction"
;   if PAIRP CADR f then
;     vars := CDADR f -- throw away 'Tuple at start of variable list
;   else
;     vars := [CADR f]
;   body := COPY_-TREE CADDR f
;   newVariable := GENSYM()
;   for index in 0..#vars-1 repeat
;     -- Remember that AXIOM lists, vectors etc are indexed from 1
;     body := NSUBST(["elt",newVariable,index+1],vars.(index),body)
;   -- We want a Vector DoubleFloat -> DoubleFloat
;   target := [["DoubleFloat"],["Vector",["DoubleFloat"]]]
;   rest interpret(["ADEF",[newVariable],target,[[],[]],body], nil)
 
(DEFUN |multiToUnivariate| (|f|)
  (PROG (|vars| |body| |newVariable| |target|)
    (RETURN
     (COND
      ((NOT (EQ (CAR |f|) '+->))
       (|error| '|in multiToUnivariate: not an AnonymousFunction|))
      (#1='T
       (PROGN
        (COND ((CONSP (CADR |f|)) (SETQ |vars| (CDADR |f|)))
              (#1# (SETQ |vars| (LIST (CADR |f|)))))
        (SETQ |body| (COPY-TREE (CADDR |f|)))
        (SETQ |newVariable| (GENSYM))
        ((LAMBDA (|bfVar#109| |index|)
           (LOOP
            (COND ((> |index| |bfVar#109|) (RETURN NIL))
                  (#1#
                   (SETQ |body|
                           (NSUBST (LIST '|elt| |newVariable| (+ |index| 1))
                                   (ELT |vars| |index|) |body|))))
            (SETQ |index| (+ |index| 1))))
         (- (LENGTH |vars|) 1) 0)
        (SETQ |target|
                (LIST (LIST '|DoubleFloat|)
                      (LIST '|Vector| (LIST '|DoubleFloat|))))
        (CDR
         (|interpret|
          (LIST 'ADEF (LIST |newVariable|) |target| (LIST NIL NIL) |body|)
          NIL))))))))
 
; functionAndJacobian f ==
;   -- Take a mapping into n functions of n variables, produce code which will
;   -- evaluate function and jacobian values.
;   (first f) ~= "+->" => error "in functionAndJacobian: not an AnonymousFunction"
;   if PAIRP CADR f then
;     vars := CDADR f -- throw away 'Tuple at start of variable list
;   else
;     vars := [CADR f]
;   #(vars) ~= #(CDADDR f) =>
;     error "number of variables should equal number of functions"
;   funBodies := COPY_-TREE CDADDR f
;   jacBodies := [:[DF(f,v) for v in vars] for f in funBodies] where
;     DF(fn,var) ==
;       ["@",["convert",["differentiate",fn,var]],"InputForm"]
;   jacBodies := CDDR interpret(
;         [["$elt",["List",["InputForm"]],"construct"],:jacBodies], nil)
;   newVariable := GENSYM()
;   for index in 0..#vars-1 repeat
;     -- Remember that AXIOM lists, vectors etc are indexed from 1
;     funBodies := NSUBST(["elt",newVariable,index+1],vars.(index),funBodies)
;     jacBodies := NSUBST(["elt",newVariable,index+1],vars.(index),jacBodies)
;   target := [["Vector",["DoubleFloat"]],["Vector",["DoubleFloat"]],["Integer"]]
;   rest interpret(
;     ["ADEF",[newVariable,"flag"],target,[[],[],[]],_
;             ["IF", ["=","flag",1],_
;                    ["vector",["construct",:funBodies]],_
;                    ["vector",["construct",:jacBodies]]]], nil)
 
(DEFUN |functionAndJacobian| (|f|)
  (PROG (|vars| |funBodies| |jacBodies| |newVariable| |target|)
    (RETURN
     (COND
      ((NOT (EQ (CAR |f|) '+->))
       (|error| '|in functionAndJacobian: not an AnonymousFunction|))
      (#1='T
       (PROGN
        (COND ((CONSP (CADR |f|)) (SETQ |vars| (CDADR |f|)))
              (#1# (SETQ |vars| (LIST (CADR |f|)))))
        (COND
         ((NOT (EQL (LENGTH |vars|) (LENGTH (CDADDR |f|))))
          (|error| '|number of variables should equal number of functions|))
         (#1#
          (PROGN
           (SETQ |funBodies| (COPY-TREE (CDADDR |f|)))
           (SETQ |jacBodies|
                   ((LAMBDA (|bfVar#113| |bfVar#112| |f|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#112|)
                             (PROGN (SETQ |f| (CAR |bfVar#112|)) NIL))
                         (RETURN (NREVERSE |bfVar#113|)))
                        (#1#
                         (SETQ |bfVar#113|
                                 (APPEND
                                  (REVERSE
                                   ((LAMBDA (|bfVar#111| |bfVar#110| |v|)
                                      (LOOP
                                       (COND
                                        ((OR (ATOM |bfVar#110|)
                                             (PROGN
                                              (SETQ |v| (CAR |bfVar#110|))
                                              NIL))
                                         (RETURN (NREVERSE |bfVar#111|)))
                                        (#1#
                                         (SETQ |bfVar#111|
                                                 (CONS
                                                  (|functionAndJacobian,DF| |f|
                                                   |v|)
                                                  |bfVar#111|))))
                                       (SETQ |bfVar#110| (CDR |bfVar#110|))))
                                    NIL |vars| NIL))
                                  |bfVar#113|))))
                       (SETQ |bfVar#112| (CDR |bfVar#112|))))
                    NIL |funBodies| NIL))
           (SETQ |jacBodies|
                   (CDDR
                    (|interpret|
                     (CONS
                      (LIST '|$elt| (LIST '|List| (LIST '|InputForm|))
                            '|construct|)
                      |jacBodies|)
                     NIL)))
           (SETQ |newVariable| (GENSYM))
           ((LAMBDA (|bfVar#114| |index|)
              (LOOP
               (COND ((> |index| |bfVar#114|) (RETURN NIL))
                     (#1#
                      (PROGN
                       (SETQ |funBodies|
                               (NSUBST
                                (LIST '|elt| |newVariable| (+ |index| 1))
                                (ELT |vars| |index|) |funBodies|))
                       (SETQ |jacBodies|
                               (NSUBST
                                (LIST '|elt| |newVariable| (+ |index| 1))
                                (ELT |vars| |index|) |jacBodies|)))))
               (SETQ |index| (+ |index| 1))))
            (- (LENGTH |vars|) 1) 0)
           (SETQ |target|
                   (LIST (LIST '|Vector| (LIST '|DoubleFloat|))
                         (LIST '|Vector| (LIST '|DoubleFloat|))
                         (LIST '|Integer|)))
           (CDR
            (|interpret|
             (LIST 'ADEF (LIST |newVariable| '|flag|) |target|
                   (LIST NIL NIL NIL)
                   (LIST 'IF (LIST '= '|flag| 1)
                         (LIST '|vector| (CONS '|construct| |funBodies|))
                         (LIST '|vector| (CONS '|construct| |jacBodies|))))
             NIL)))))))))))
(DEFUN |functionAndJacobian,DF| (|fn| |var|)
  (PROG ()
    (RETURN
     (LIST '@ (LIST '|convert| (LIST '|differentiate| |fn| |var|))
           '|InputForm|))))
 
; vectorOfFunctions f ==
;   -- Take a mapping into n functions of m variables, produce code which will
;   -- evaluate function values.
;   (first f) ~= "+->" => error "in vectorOfFunctions: not an AnonymousFunction"
;   if PAIRP CADR f then
;     vars := CDADR f -- throw away 'Tuple at start of variable list
;   else
;     vars := [CADR f]
;   funBodies := COPY_-TREE CDADDR f
;   newVariable := GENSYM()
;   for index in 0..#vars-1 repeat
;     -- Remember that AXIOM lists, vectors etc are indexed from 1
;     funBodies := NSUBST(["elt",newVariable,index+1],vars.(index),funBodies)
;   target := [["Vector",["DoubleFloat"]],["Vector",["DoubleFloat"]]]
;   rest interpret(
;      ["ADEF",[newVariable],target,[[],[]],["vector",["construct",:funBodies]]],
;      nil)
 
(DEFUN |vectorOfFunctions| (|f|)
  (PROG (|vars| |funBodies| |newVariable| |target|)
    (RETURN
     (COND
      ((NOT (EQ (CAR |f|) '+->))
       (|error| '|in vectorOfFunctions: not an AnonymousFunction|))
      (#1='T
       (PROGN
        (COND ((CONSP (CADR |f|)) (SETQ |vars| (CDADR |f|)))
              (#1# (SETQ |vars| (LIST (CADR |f|)))))
        (SETQ |funBodies| (COPY-TREE (CDADDR |f|)))
        (SETQ |newVariable| (GENSYM))
        ((LAMBDA (|bfVar#115| |index|)
           (LOOP
            (COND ((> |index| |bfVar#115|) (RETURN NIL))
                  (#1#
                   (SETQ |funBodies|
                           (NSUBST (LIST '|elt| |newVariable| (+ |index| 1))
                                   (ELT |vars| |index|) |funBodies|))))
            (SETQ |index| (+ |index| 1))))
         (- (LENGTH |vars|) 1) 0)
        (SETQ |target|
                (LIST (LIST '|Vector| (LIST '|DoubleFloat|))
                      (LIST '|Vector| (LIST '|DoubleFloat|))))
        (CDR
         (|interpret|
          (LIST 'ADEF (LIST |newVariable|) |target| (LIST NIL NIL)
                (LIST '|vector| (CONS '|construct| |funBodies|)))
          NIL))))))))
