 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; do_with_error_env0(f) ==
;     $fortError : fluid := nil
;     checkLines SPADCALL(f)
 
(DEFUN |do_with_error_env0| (|f|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN (PROGN (SETQ |$fortError| NIL) (|checkLines| (SPADCALL |f|))))))
 
; do_with_error_env2(int_to_floats?, f) ==
;     $fortInts2Floats : fluid := int_to_floats?
;     $fortError : fluid := nil
;     checkLines SPADCALL(f)
 
(DEFUN |do_with_error_env2| (|int_to_floats?| |f|)
  (PROG (|$fortError| |$fortInts2Floats|)
    (DECLARE (SPECIAL |$fortError| |$fortInts2Floats|))
    (RETURN
     (PROGN
      (SETQ |$fortInts2Floats| |int_to_floats?|)
      (SETQ |$fortError| NIL)
      (|checkLines| (SPADCALL |f|))))))
 
; do_with_error_env3(f) ==
;     $fortError : fluid := nil
;     $fortranSegment : fluid := nil
;     $fortInts2Floats : fluid := nil
;     SPADCALL(f)
 
(DEFUN |do_with_error_env3| (|f|)
  (PROG (|$fortInts2Floats| |$fortranSegment| |$fortError|)
    (DECLARE (SPECIAL |$fortInts2Floats| |$fortranSegment| |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (SETQ |$fortranSegment| NIL)
      (SETQ |$fortInts2Floats| NIL)
      (SPADCALL |f|)))))
 
; do_with_error_env4(nf, ints2floats?, f) ==
;   $fortInts2Floats : fluid := ints2floats?
;   $exp2FortTempVarIndex : local := 0
;   $fortName : fluid := SPADCALL(nf)
;   SPADCALL(f)
 
(DEFUN |do_with_error_env4| (|nf| |ints2floats?| |f|)
  (PROG (|$fortName| |$exp2FortTempVarIndex| |$fortInts2Floats|)
    (DECLARE (SPECIAL |$fortName| |$exp2FortTempVarIndex| |$fortInts2Floats|))
    (RETURN
     (PROGN
      (SETQ |$fortInts2Floats| |ints2floats?|)
      (SETQ |$exp2FortTempVarIndex| 0)
      (SETQ |$fortName| (SPADCALL |nf|))
      (SPADCALL |f|)))))
 
; newFortranTempVar() ==
;     ff := getFunctionFromDomain("newFortranTempVar", ['FortranCodeTools],
;                                 [])
;     SPADCALL(ff)
 
(DEFUN |newFortranTempVar| ()
  (PROG (|ff|)
    (RETURN
     (PROGN
      (SETQ |ff|
              (|getFunctionFromDomain| '|newFortranTempVar|
               (LIST '|FortranCodeTools|) NIL))
      (SPADCALL |ff|)))))
 
; exp2FortOptimize e ==
;   -- $fortranOptimizationLevel means:
;   --   0         just extract arrays
;   --   >         extract common subexpressions
;   $exprStack : local := NIL
;   atom e => [e]
;   $fortranOptimizationLevel = 0 =>
;     e1 := exp2FortOptimizeArray e
;     NREVERSE [e1,:$exprStack]
;   e := minimalise e
;   for e1 in exp2FortOptimizeCS  e repeat
;     e2 := exp2FortOptimizeArray e1
;     $exprStack := [e2,:$exprStack]
;   NREVERSE $exprStack
 
(DEFUN |exp2FortOptimize| (|e|)
  (PROG (|$exprStack| |e2| |e1|)
    (DECLARE (SPECIAL |$exprStack|))
    (RETURN
     (PROGN
      (SETQ |$exprStack| NIL)
      (COND ((ATOM |e|) (LIST |e|))
            ((EQL |$fortranOptimizationLevel| 0)
             (PROGN
              (SETQ |e1| (|exp2FortOptimizeArray| |e|))
              (NREVERSE (CONS |e1| |$exprStack|))))
            (#1='T
             (PROGN
              (SETQ |e| (|minimalise| |e|))
              ((LAMBDA (|bfVar#1| |e1|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |e1| (CAR |bfVar#1|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (PROGN
                     (SETQ |e2| (|exp2FortOptimizeArray| |e1|))
                     (SETQ |$exprStack| (CONS |e2| |$exprStack|)))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               (|exp2FortOptimizeCS| |e|) NIL)
              (NREVERSE |$exprStack|))))))))
 
; exp2FortOptimizeCS e ==
;   $fortCsList : local := NIL
;   $fortCsHash : local := MAKE_-HASHTABLE 'EQ
;   f := exp2FortOptimizeCS1(e, nil)
;   NREVERSE [f,:$fortCsList]
 
(DEFUN |exp2FortOptimizeCS| (|e|)
  (PROG (|$fortCsHash| |$fortCsList| |f|)
    (DECLARE (SPECIAL |$fortCsHash| |$fortCsList|))
    (RETURN
     (PROGN
      (SETQ |$fortCsList| NIL)
      (SETQ |$fortCsHash| (MAKE-HASHTABLE 'EQ))
      (SETQ |f| (|exp2FortOptimizeCS1| |e| NIL))
      (NREVERSE (CONS |f| |$fortCsList|))))))
 
; beenHere(e,n) ==
;   n.0 := n.0 + 1                      -- increase count (initially 1)
;   n.0 = 2 =>                          -- first time back again
;     var := n.1 := newFortranTempVar() -- stuff n.1 with new var
;     loc := n.2                    -- get expression
;     if loc then
; -- using COPY-TREE : RPLAC does not smash $fortCsList
; -- which led to inconsistencies in assignment of temp. vars.
;       $fortCsList := COPY_-TREE [["=",var,e], :$fortCsList]
;       RPLACA(loc, var)
;     var
;   n.1                     -- been here before, so just get variable
 
(DEFUN |beenHere| (|e| |n|)
  (PROG (|var| |loc|)
    (RETURN
     (PROGN
      (SETF (ELT |n| 0) (+ (ELT |n| 0) 1))
      (COND
       ((EQL (ELT |n| 0) 2)
        (PROGN
         (SETQ |var| (SETF (ELT |n| 1) (|newFortranTempVar|)))
         (SETQ |loc| (ELT |n| 2))
         (COND
          (|loc|
           (SETQ |$fortCsList|
                   (COPY-TREE (CONS (LIST '= |var| |e|) |$fortCsList|)))
           (RPLACA |loc| |var|)))
         |var|))
       ('T (ELT |n| 1)))))))
 
; exp2FortOptimizeCS1(e, e0) ==
;   -- we do nothing with atoms or simple lists containing atoms
;   atom(e) or (atom first e and null rest e) => e
;   e is [op,arg] and object2Identifier op = "-" and atom arg => e
; 
;   -- see if we have been here before
;   not (object2Identifier QCAR e in '(ROW AGGLST)) and
;     (n := HGET($fortCsHash,e)) => beenHere(e,n) -- where
; 
;   -- descend sucessive CARs of CDRs of e
;   f := e
;   while f repeat
;     RPLACA(f, exp2FortOptimizeCS1(QCAR f, f))
;     g := QCDR f
;     -- check to see of we have an non-NIL atomic CDR
;     g and atom g => f := NIL
;     f := g
; 
;   MEMQ(object2Identifier QCAR e,'(ROW AGGLST)) => e
; 
;   -- see if we have already seen this expression
;   n := HGET($fortCsHash,e)
;   null n =>
;     n := VECTOR(1, NIL, e0)
;     HPUT($fortCsHash, e, n)
;     e
;   beenHere(e, n)
 
(DEFUN |exp2FortOptimizeCS1| (|e| |e0|)
  (PROG (|op| |ISTMP#1| |arg| |n| |f| |g|)
    (RETURN
     (COND ((OR (ATOM |e|) (AND (ATOM (CAR |e|)) (NULL (CDR |e|)))) |e|)
           ((AND (CONSP |e|)
                 (PROGN
                  (SETQ |op| (CAR |e|))
                  (SETQ |ISTMP#1| (CDR |e|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |arg| (CAR |ISTMP#1|)) #1='T)))
                 (EQ (|object2Identifier| |op|) '-) (ATOM |arg|))
            |e|)
           ((AND
             (NULL (|member| (|object2Identifier| (QCAR |e|)) '(ROW AGGLST)))
             (SETQ |n| (HGET |$fortCsHash| |e|)))
            (|beenHere| |e| |n|))
           (#1#
            (PROGN
             (SETQ |f| |e|)
             ((LAMBDA ()
                (LOOP
                 (COND ((NOT |f|) (RETURN NIL))
                       (#1#
                        (PROGN
                         (RPLACA |f| (|exp2FortOptimizeCS1| (QCAR |f|) |f|))
                         (SETQ |g| (QCDR |f|))
                         (COND ((AND |g| (ATOM |g|)) (SETQ |f| NIL))
                               (#1# (SETQ |f| |g|)))))))))
             (COND ((MEMQ (|object2Identifier| (QCAR |e|)) '(ROW AGGLST)) |e|)
                   (#1#
                    (PROGN
                     (SETQ |n| (HGET |$fortCsHash| |e|))
                     (COND
                      ((NULL |n|)
                       (PROGN
                        (SETQ |n| (VECTOR 1 NIL |e0|))
                        (HPUT |$fortCsHash| |e| |n|)
                        |e|))
                      (#1# (|beenHere| |e| |n|))))))))))))
 
; exp2FortOptimizeArray e ==
;   -- this handles arrays
;   atom e => e
;   [op,:args] := e
;   op1 := object2Identifier op
;   op1 in '(BRACE BRACKET) =>
;     args is [['AGGLST,:elts]] =>
;       LISTP first elts and first first elts in '(BRACE BRACKET) => fortError1 e
;       -- var := newFortranTempVar()
;       var := $fortName
;       $exprStack := [[op,var,['AGGLST,:exp2FortOptimizeArray elts]],
;         :$exprStack]
;       var
;   EQ(op1,'MATRIX) =>
;     -- var := newFortranTempVar()
;     var := $fortName
;     -- args looks like [NIL,[ROW,...],[ROW,...]]
;     $exprStack := [[op,var,:exp2FortOptimizeArray args],:$exprStack]
;     var
;   [exp2FortOptimizeArray op,:exp2FortOptimizeArray args]
 
(DEFUN |exp2FortOptimizeArray| (|e|)
  (PROG (|op| |args| |op1| |ISTMP#1| |elts| |var|)
    (RETURN
     (COND ((ATOM |e|) |e|)
           (#1='T
            (PROGN
             (SETQ |op| (CAR |e|))
             (SETQ |args| (CDR |e|))
             (SETQ |op1| (|object2Identifier| |op|))
             (COND
              ((|member| |op1| '(BRACE BRACKET))
               (COND
                ((AND (CONSP |args|) (EQ (CDR |args|) NIL)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |args|))
                       (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'AGGLST)
                            (PROGN (SETQ |elts| (CDR |ISTMP#1|)) #1#))))
                 (IDENTITY
                  (COND
                   ((AND (LISTP (CAR |elts|))
                         (|member| (CAR (CAR |elts|)) '(BRACE BRACKET)))
                    (|fortError1| |e|))
                   (#1#
                    (PROGN
                     (SETQ |var| |$fortName|)
                     (SETQ |$exprStack|
                             (CONS
                              (LIST |op| |var|
                                    (CONS 'AGGLST
                                          (|exp2FortOptimizeArray| |elts|)))
                              |$exprStack|))
                     |var|)))))))
              ((EQ |op1| 'MATRIX)
               (PROGN
                (SETQ |var| |$fortName|)
                (SETQ |$exprStack|
                        (CONS
                         (CONS |op|
                               (CONS |var| (|exp2FortOptimizeArray| |args|)))
                         |$exprStack|))
                |var|))
              (#1#
               (CONS (|exp2FortOptimizeArray| |op|)
                     (|exp2FortOptimizeArray| |args|))))))))))
 
; fortError1 u ==
;   $fortError := "t"
;   sayErrorly("Fortran translation error",
;              "   No corresponding Fortran structure for:")
;   mathPrint u
 
(DEFUN |fortError1| (|u|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$fortError| '|t|)
      (|sayErrorly| '|Fortran translation error|
       '|   No corresponding Fortran structure for:|)
      (|mathPrint| |u|)))))
 
; fortError(u,v) ==
;   $fortError := "t"
;   msg := STRCONC("   ",STRINGIMAGE u);
;   sayErrorly("Fortran translation error",msg)
;   mathPrint v
 
(DEFUN |fortError| (|u| |v|)
  (PROG (|msg|)
    (RETURN
     (PROGN
      (SETQ |$fortError| '|t|)
      (SETQ |msg| (STRCONC '|   | (STRINGIMAGE |u|)))
      (|sayErrorly| '|Fortran translation error| |msg|)
      (|mathPrint| |v|)))))
 
; fortexp0 x ==
;   e_to_f := getFunctionFromDomain("expression2Fortran", ['FortranCodeTools],
;                                  [$OutputForm])
;   f := SPADCALL(x, e_to_f)
;   p := position('"%l",f)
;   p < 0 => f
;   l := NIL
;   while p < 0 repeat
;     [t,:f] := f
;     l := [t,:l]
;   NREVERSE ['"...",:l]
 
(DEFUN |fortexp0| (|x|)
  (PROG (|e_to_f| |f| |p| |l| |LETTMP#1| |t|)
    (RETURN
     (PROGN
      (SETQ |e_to_f|
              (|getFunctionFromDomain| '|expression2Fortran|
               (LIST '|FortranCodeTools|) (LIST |$OutputForm|)))
      (SETQ |f| (SPADCALL |x| |e_to_f|))
      (SETQ |p| (|position| "%l" |f|))
      (COND ((MINUSP |p|) |f|)
            (#1='T
             (PROGN
              (SETQ |l| NIL)
              ((LAMBDA ()
                 (LOOP
                  (COND ((NOT (MINUSP |p|)) (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |LETTMP#1| |f|)
                          (SETQ |t| (CAR |LETTMP#1|))
                          (SETQ |f| (CDR |LETTMP#1|))
                          (SETQ |l| (CONS |t| |l|))))))))
              (NREVERSE (CONS "..." |l|)))))))))
 
; displayLines1 lines ==
;   for l in lines repeat
;     PRINTEXP(l,$fortranOutputStream)
;     TERPRI($fortranOutputStream)
 
(DEFUN |displayLines1| (|lines|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#2| |l|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#2|) (PROGN (SETQ |l| (CAR |bfVar#2|)) NIL))
           (RETURN NIL))
          ('T
           (PROGN
            (PRINTEXP |l| |$fortranOutputStream|)
            (TERPRI |$fortranOutputStream|))))
         (SETQ |bfVar#2| (CDR |bfVar#2|))))
      |lines| NIL))))
 
; displayLines lines ==
;   if not $fortError then displayLines1 lines
 
(DEFUN |displayLines| (|lines|)
  (PROG () (RETURN (COND ((NULL |$fortError|) (|displayLines1| |lines|))))))
 
; checkLines lines ==
;   $fortError => []
;   lines
 
(DEFUN |checkLines| (|lines|)
  (PROG () (RETURN (COND (|$fortError| NIL) ('T |lines|)))))
 
; changeExprLength(i) ==
;   $maximumFortranExpressionLength := $maximumFortranExpressionLength + i
 
(DEFUN |changeExprLength| (|i|)
  (PROG ()
    (RETURN
     (SETQ |$maximumFortranExpressionLength|
             (+ |$maximumFortranExpressionLength| |i|)))))
