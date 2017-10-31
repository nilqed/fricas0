 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; DEFPARAMETER($currentFunctionLevel, 0)
 
(DEFPARAMETER |$currentFunctionLevel| 0)
 
; DEFPARAMETER($tryRecompileArguments, true)
 
(DEFPARAMETER |$tryRecompileArguments| T)
 
; DEFPARAMETER($insideCompTypeOf, false)
 
(DEFPARAMETER |$insideCompTypeOf| NIL)
 
; DEFPARAMETER($locVarsTypes, nil)
 
(DEFPARAMETER |$locVarsTypes| NIL)
 
; initEnvHashTable(l) ==
;   for u in first(first(l)) repeat
;       for v in rest(u) repeat
;             HPUT($envHashTable, [first u, first v], true)
 
(DEFUN |initEnvHashTable| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#1| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#1|) (PROGN (SETQ |u| (CAR |bfVar#1|)) NIL))
           (RETURN NIL))
          (#1='T
           ((LAMBDA (|bfVar#2| |v|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#2|) (PROGN (SETQ |v| (CAR |bfVar#2|)) NIL))
                 (RETURN NIL))
                (#1# (HPUT |$envHashTable| (LIST (CAR |u|) (CAR |v|)) T)))
               (SETQ |bfVar#2| (CDR |bfVar#2|))))
            (CDR |u|) NIL)))
         (SETQ |bfVar#1| (CDR |bfVar#1|))))
      (CAR (CAR |l|)) NIL))))
 
; compTopLevel(x,m,e) ==
;   $killOptimizeIfTrue: local:= false
;   $forceAdd: local:= false
;   $compTimeSum: local := 0
;   $resolveTimeSum: local := 0
;   $envHashTable: local := MAKE_-HASHTABLE 'EQUAL
;   initEnvHashTable(e)
;   initEnvHashTable($CategoryFrame)
;   -- The next line allows the new compiler to be tested interactively.
;   compFun := 'compOrCroak
;   x is ["DEF",:.] or x is ["where",["DEF",:.],:.] =>
;     ([val,mode,.]:= FUNCALL(compFun,x,m,e); [val,mode,e])
;         --keep old environment after top level function defs
;   FUNCALL(compFun,x,m,e)
 
(DEFUN |compTopLevel| (|x| |m| |e|)
  (PROG (|$envHashTable| |$resolveTimeSum| |$compTimeSum| |$forceAdd|
         |$killOptimizeIfTrue| |mode| |val| |LETTMP#1| |ISTMP#2| |ISTMP#1|
         |compFun|)
    (DECLARE
     (SPECIAL |$envHashTable| |$resolveTimeSum| |$compTimeSum| |$forceAdd|
      |$killOptimizeIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$killOptimizeIfTrue| NIL)
      (SETQ |$forceAdd| NIL)
      (SETQ |$compTimeSum| 0)
      (SETQ |$resolveTimeSum| 0)
      (SETQ |$envHashTable| (MAKE-HASHTABLE 'EQUAL))
      (|initEnvHashTable| |e|)
      (|initEnvHashTable| |$CategoryFrame|)
      (SETQ |compFun| '|compOrCroak|)
      (COND
       ((OR (AND (CONSP |x|) (EQ (CAR |x|) 'DEF))
            (AND (CONSP |x|) (EQ (CAR |x|) '|where|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) 'DEF)))))))
        (PROGN
         (SETQ |LETTMP#1| (FUNCALL |compFun| |x| |m| |e|))
         (SETQ |val| (CAR |LETTMP#1|))
         (SETQ |mode| (CADR |LETTMP#1|))
         (LIST |val| |mode| |e|)))
       ('T (FUNCALL |compFun| |x| |m| |e|)))))))
 
; compUniquely(x,m,e) ==
;   $compUniquelyIfTrue: local:= true
;   CATCH("compUniquely",comp(x,m,e))
 
(DEFUN |compUniquely| (|x| |m| |e|)
  (PROG (|$compUniquelyIfTrue|)
    (DECLARE (SPECIAL |$compUniquelyIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$compUniquelyIfTrue| T)
      (CATCH '|compUniquely| (|comp| |x| |m| |e|))))))
 
; compOrCroak(x,m,e) == compOrCroak1(x,m,e,'comp)
 
(DEFUN |compOrCroak| (|x| |m| |e|)
  (PROG () (RETURN (|compOrCroak1| |x| |m| |e| '|comp|))))
 
; compOrCroak1(x,m,e,compFn) ==
;   fn(x,m,e,nil,nil,compFn) where
;     fn(x,m,e,$compStack,$compErrorMessageStack,compFn) ==
;       T:= CATCH("compOrCroak",FUNCALL(compFn,x,m,e)) => T
;       --stackAndThrow here and moan in UT LISP K does the appropriate THROW
;       $compStack:= [[x,m,e,$exitModeStack],:$compStack]
;       $s:=
;         compactify $compStack where
;           compactify al ==
;             null al => nil
;             LASSOC(first first al,rest al) => compactify rest al
;             [first al,:compactify rest al]
;       $level:= #$s
;       errorMessage:=
;         if $compErrorMessageStack
;            then first $compErrorMessageStack
;            else "unspecified error"
;       $scanIfTrue =>
;         stackSemanticError(errorMessage,mkErrorExpr $level)
;         ["failedCompilation",m,e]
;       displaySemanticErrors()
;       SAY("****** comp fails at level ",$level," with expression: ******")
;       displayComp $level
;       userError errorMessage
 
(DEFUN |compOrCroak1| (|x| |m| |e| |compFn|)
  (PROG () (RETURN (|compOrCroak1,fn| |x| |m| |e| NIL NIL |compFn|))))
(DEFUN |compOrCroak1,fn|
       (|x| |m| |e| |$compStack| |$compErrorMessageStack| |compFn|)
  (DECLARE (SPECIAL |$compStack| |$compErrorMessageStack|))
  (PROG (T$ |errorMessage|)
    (RETURN
     (COND ((SETQ T$ (CATCH '|compOrCroak| (FUNCALL |compFn| |x| |m| |e|))) T$)
           (#1='T
            (PROGN
             (SETQ |$compStack|
                     (CONS (LIST |x| |m| |e| |$exitModeStack|) |$compStack|))
             (SETQ |$s| (|compOrCroak1,compactify| |$compStack|))
             (SETQ |$level| (LENGTH |$s|))
             (SETQ |errorMessage|
                     (COND
                      (|$compErrorMessageStack| (CAR |$compErrorMessageStack|))
                      (#1# '|unspecified error|)))
             (COND
              (|$scanIfTrue|
               (PROGN
                (|stackSemanticError| |errorMessage| (|mkErrorExpr| |$level|))
                (LIST '|failedCompilation| |m| |e|)))
              (#1#
               (PROGN
                (|displaySemanticErrors|)
                (SAY '|****** comp fails at level | |$level|
                 '| with expression: ******|)
                (|displayComp| |$level|)
                (|userError| |errorMessage|))))))))))
(DEFUN |compOrCroak1,compactify| (|al|)
  (PROG ()
    (RETURN
     (COND ((NULL |al|) NIL)
           ((LASSOC (CAR (CAR |al|)) (CDR |al|))
            (|compOrCroak1,compactify| (CDR |al|)))
           ('T (CONS (CAR |al|) (|compOrCroak1,compactify| (CDR |al|))))))))
 
; tc() ==
;   comp($x,$m,$f)
 
(DEFUN |tc| #1=() (PROG #1# (RETURN (|comp| |$x| |$m| |$f|))))
 
; comp(x,m,e) ==
;   T:= compNoStacking(x,m,e) => ($compStack:= nil; T)
;   $compStack:= [[x,m,e,$exitModeStack],:$compStack]
;   nil
 
(DEFUN |comp| (|x| |m| |e|)
  (PROG (T$)
    (RETURN
     (COND
      ((SETQ T$ (|compNoStacking| |x| |m| |e|))
       (PROGN (SETQ |$compStack| NIL) T$))
      ('T
       (PROGN
        (SETQ |$compStack|
                (CONS (LIST |x| |m| |e| |$exitModeStack|) |$compStack|))
        NIL))))))
 
; compNoStacking(x,m,e) ==
;   T:= comp2(x,m,e) =>
;     (m=$EmptyMode and T.mode=$Representation => [T.expr,"$",T.env]; T)
;          --$Representation is bound in compDefineFunctor, set by doIt
;          --this hack says that when something is undeclared, $ is
;          --preferred to the underlying representation -- RDJ 9/12/83
;   compNoStacking1(x,m,e,$compStack)
 
(DEFUN |compNoStacking| (|x| |m| |e|)
  (PROG (T$)
    (RETURN
     (COND
      ((SETQ T$ (|comp2| |x| |m| |e|))
       (COND
        ((AND (EQUAL |m| |$EmptyMode|) (EQUAL (CADR T$) |$Representation|))
         (LIST (CAR T$) '$ (CADDR T$)))
        (#1='T T$)))
      (#1# (|compNoStacking1| |x| |m| |e| |$compStack|))))))
 
; compNoStacking1(x,m,e,$compStack) ==
;   u:= get(if m="$" then "Rep" else m,"value",e) =>
;     (T:= comp2(x,u.expr,e) => [T.expr,m,T.env]; nil)
;   nil
 
(DEFUN |compNoStacking1| (|x| |m| |e| |$compStack|)
  (DECLARE (SPECIAL |$compStack|))
  (PROG (|u| T$)
    (RETURN
     (COND
      ((SETQ |u| (|get| (COND ((EQ |m| '$) '|Rep|) (#1='T |m|)) '|value| |e|))
       (COND
        ((SETQ T$ (|comp2| |x| (CAR |u|) |e|)) (LIST (CAR T$) |m| (CADDR T$)))
        (#1# NIL)))
      (#1# NIL)))))
 
; comp2(x,m,e) ==
;   [y,m',e]:= comp3(x,m,e) or return nil
;   --if null atom y and isDomainForm(y,e) then e := addDomain(x,e)
;         --line commented out to prevent adding derived domain forms
;   m~=m' and ($bootStrapMode or isDomainForm(m',e))=>[y,m',addDomain(m',e)]
;         --isDomainForm test needed to prevent error while compiling Ring
;         --$bootStrapMode-test necessary for compiling Ring in $bootStrapMode
;   [y,m',e]
 
(DEFUN |comp2| (|x| |m| |e|)
  (PROG (|LETTMP#1| |y| |m'|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (OR (|comp3| |x| |m| |e|) (RETURN NIL)))
      (SETQ |y| (CAR |LETTMP#1|))
      (SETQ |m'| (CADR . #1=(|LETTMP#1|)))
      (SETQ |e| (CADDR . #1#))
      (COND
       ((AND (NOT (EQUAL |m| |m'|))
             (OR |$bootStrapMode| (|isDomainForm| |m'| |e|)))
        (LIST |y| |m'| (|addDomain| |m'| |e|)))
       ('T (LIST |y| |m'| |e|)))))))
 
; comp3(x,m,$e) ==
;   --returns a Triple or else nil to signal can't do
;   $e:= addDomain(m,$e)
;   e:= $e --for debugging purposes
;   m is ["Mapping",:.] => compWithMappingMode(x,m,e)
;   m is ["QUOTE",a] => (x=a => [x,m,$e]; nil)
;   STRINGP m => (atom x => (m=x or m=STRINGIMAGE x => [m,m,e]; nil); nil)
;   not x or atom x => compAtom(x,m,e)
;   op:= first x
;   getmode(op,e) is ["Mapping",:ml] and (u:= applyMapping(x,m,e,ml)) => u
;   op=":" => compColon(x,m,e)
;   op="::" => compCoerce(x,m,e)
;   not ($insideCompTypeOf=true) and stringPrefix?('"TypeOf",PNAME op) =>
;     compTypeOf(x,m,e)
;   t:= compExpression(x,m,e)
;   t is [x',m',e'] and not member(m',getDomainsInScope e') =>
;     [x',m',addDomain(m',e')]
;   t
 
(DEFUN |comp3| (|x| |m| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|e| |ISTMP#1| |a| |op| |ml| |u| |t| |x'| |m'| |ISTMP#2| |e'|)
    (RETURN
     (PROGN
      (SETQ |$e| (|addDomain| |m| |$e|))
      (SETQ |e| |$e|)
      (COND
       ((AND (CONSP |m|) (EQ (CAR |m|) '|Mapping|))
        (|compWithMappingMode| |x| |m| |e|))
       ((AND (CONSP |m|) (EQ (CAR |m|) 'QUOTE)
             (PROGN
              (SETQ |ISTMP#1| (CDR |m|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1='T))))
        (COND ((EQUAL |x| |a|) (LIST |x| |m| |$e|)) (#1# NIL)))
       ((STRINGP |m|)
        (COND
         ((ATOM |x|)
          (COND
           ((OR (EQUAL |m| |x|) (EQUAL |m| (STRINGIMAGE |x|)))
            (LIST |m| |m| |e|))
           (#1# NIL)))
         (#1# NIL)))
       ((OR (NULL |x|) (ATOM |x|)) (|compAtom| |x| |m| |e|))
       (#1#
        (PROGN
         (SETQ |op| (CAR |x|))
         (COND
          ((AND
            (PROGN
             (SETQ |ISTMP#1| (|getmode| |op| |e|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
                  (PROGN (SETQ |ml| (CDR |ISTMP#1|)) #1#)))
            (SETQ |u| (|applyMapping| |x| |m| |e| |ml|)))
           |u|)
          ((EQ |op| '|:|) (|compColon| |x| |m| |e|))
          ((EQ |op| '|::|) (|compCoerce| |x| |m| |e|))
          ((AND (NULL (EQUAL |$insideCompTypeOf| T))
                (|stringPrefix?| "TypeOf" (PNAME |op|)))
           (|compTypeOf| |x| |m| |e|))
          (#1#
           (PROGN
            (SETQ |t| (|compExpression| |x| |m| |e|))
            (COND
             ((AND (CONSP |t|)
                   (PROGN
                    (SETQ |x'| (CAR |t|))
                    (SETQ |ISTMP#1| (CDR |t|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |m'| (CAR |ISTMP#1|))
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN (SETQ |e'| (CAR |ISTMP#2|)) #1#)))))
                   (NULL (|member| |m'| (|getDomainsInScope| |e'|))))
              (LIST |x'| |m'| (|addDomain| |m'| |e'|)))
             (#1# |t|))))))))))))
 
; compTypeOf(x:=[op,:argl],m,e) ==
;   $insideCompTypeOf: local := true
;   newModemap:= EQSUBSTLIST(argl,$FormalMapVariableList,get(op,'modemap,e))
;   e:= put(op,'modemap,newModemap,e)
;   comp3(x,m,e)
 
(DEFUN |compTypeOf| (|x| |m| |e|)
  (PROG (|$insideCompTypeOf| |newModemap| |argl| |op|)
    (DECLARE (SPECIAL |$insideCompTypeOf|))
    (RETURN
     (PROGN
      (SETQ |op| (CAR |x|))
      (SETQ |argl| (CDR |x|))
      (SETQ |$insideCompTypeOf| T)
      (SETQ |newModemap|
              (EQSUBSTLIST |argl| |$FormalMapVariableList|
               (|get| |op| '|modemap| |e|)))
      (SETQ |e| (|put| |op| '|modemap| |newModemap| |e|))
      (|comp3| |x| |m| |e|)))))
 
; hasFormalMapVariable(x, vl) ==
;   $formalMapVariables: local := vl
;   null vl => false
;   ScanOrPairVec(function hasone?, x) where
;      hasone? x == MEMQ(x,$formalMapVariables)
 
(DEFUN |hasFormalMapVariable| (|x| |vl|)
  (PROG (|$formalMapVariables|)
    (DECLARE (SPECIAL |$formalMapVariables|))
    (RETURN
     (PROGN
      (SETQ |$formalMapVariables| |vl|)
      (COND ((NULL |vl|) NIL)
            ('T (|ScanOrPairVec| #'|hasFormalMapVariable,hasone?| |x|)))))))
(DEFUN |hasFormalMapVariable,hasone?| (|x|)
  (PROG () (RETURN (MEMQ |x| |$formalMapVariables|))))
 
; argsToSig(args) ==
;     args is [":", v, t] => [[v], [t]]
;     sig1 := []
;     arg1 := []
;     bad := false
;     for arg in args repeat
;         arg is [":", v, t] =>
;              sig1 := [t, :sig1]
;              arg1 := [v, :arg1]
;         bad := true
;     bad => [nil, nil]
;     [REVERSE(arg1), REVERSE(sig1)]
 
(DEFUN |argsToSig| (|args|)
  (PROG (|ISTMP#1| |v| |ISTMP#2| |t| |sig1| |arg1| |bad|)
    (RETURN
     (COND
      ((AND (CONSP |args|) (EQ (CAR |args|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |args|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |v| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1='T))))))
       (LIST (LIST |v|) (LIST |t|)))
      (#1#
       (PROGN
        (SETQ |sig1| NIL)
        (SETQ |arg1| NIL)
        (SETQ |bad| NIL)
        ((LAMBDA (|bfVar#3| |arg|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#3|) (PROGN (SETQ |arg| (CAR |bfVar#3|)) NIL))
              (RETURN NIL))
             (#1#
              (COND
               ((AND (CONSP |arg|) (EQ (CAR |arg|) '|:|)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |arg|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |v| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1#))))))
                (PROGN
                 (SETQ |sig1| (CONS |t| |sig1|))
                 (SETQ |arg1| (CONS |v| |arg1|))))
               (#1# (SETQ |bad| T)))))
            (SETQ |bfVar#3| (CDR |bfVar#3|))))
         |args| NIL)
        (COND (|bad| (LIST NIL NIL))
              (#1# (LIST (REVERSE |arg1|) (REVERSE |sig1|))))))))))
 
; compLambda(x is ["+->", vl, body], m, e) ==
;     vl is [":", args, target] =>
;         args :=
;              args is ["@Tuple", :a1] => a1
;              args
;         LISTP(args) =>
;              [arg1, sig1] := argsToSig(args)
;              sig1 or NULL(args) =>
;                  ress := compAtSign(["@", ["+->", arg1, body],
;                                   ["Mapping", target, :sig1]], m, e)
;                  ress
;              stackAndThrow ["compLambda: malformed argument list", x]
;         stackAndThrow ["compLambda: malformed argument list", x]
;     stackAndThrow ["compLambda: signature needed", x]
 
(DEFUN |compLambda| (|x| |m| |e|)
  (PROG (|vl| |body| |ISTMP#1| |args| |ISTMP#2| |target| |a1| |LETTMP#1| |arg1|
         |sig1| |ress|)
    (RETURN
     (PROGN
      (SETQ |vl| (CADR . #1=(|x|)))
      (SETQ |body| (CADDR . #1#))
      (COND
       ((AND (CONSP |vl|) (EQ (CAR |vl|) '|:|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |vl|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |args| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |target| (CAR |ISTMP#2|)) #2='T))))))
        (PROGN
         (SETQ |args|
                 (COND
                  ((AND (CONSP |args|) (EQ (CAR |args|) '|@Tuple|)
                        (PROGN (SETQ |a1| (CDR |args|)) #2#))
                   |a1|)
                  (#2# |args|)))
         (COND
          ((LISTP |args|)
           (PROGN
            (SETQ |LETTMP#1| (|argsToSig| |args|))
            (SETQ |arg1| (CAR |LETTMP#1|))
            (SETQ |sig1| (CADR |LETTMP#1|))
            (COND
             ((OR |sig1| (NULL |args|))
              (PROGN
               (SETQ |ress|
                       (|compAtSign|
                        (LIST '@ (LIST '+-> |arg1| |body|)
                              (CONS '|Mapping| (CONS |target| |sig1|)))
                        |m| |e|))
               |ress|))
             (#2#
              (|stackAndThrow|
               (LIST '|compLambda: malformed argument list| |x|))))))
          (#2#
           (|stackAndThrow|
            (LIST '|compLambda: malformed argument list| |x|))))))
       (#2# (|stackAndThrow| (LIST '|compLambda: signature needed| |x|))))))))
 
; getFreeList(u, bound, free, e) ==
;     atom u =>
;         not IDENTP u => free
;         MEMQ(u,bound) => free
;         v := ASSQ(u, free) =>
;             RPLACD(v, 1 + CDR v)
;             free
;         not getmode(u, e) => free
;         [[u, :1], :free]
;     op := first u
;     MEMQ(op, '(QUOTE GO function)) => free
;     EQ(op, 'LAMBDA) =>
;         lvl := CADR u
;         avl := []
;         for evl in lvl repeat
;             el :=
;                 ATOM(evl) => evl
;                 first(evl)
;             avl := [el, :avl]
;         bound := UNIONQ(bound, avl)
;         for v in CDDR u repeat
;             free := getFreeList(v, bound, free, e)
;         free
;     EQ(op, 'PROG) =>
;         bound := UNIONQ(bound, CADR u)
;         for v in CDDR u | NOT ATOM v repeat
;             free := getFreeList(v, bound, free, e)
;         free
;     EQ(op, 'SPROG) =>
;         bound := UNIONQ(bound, [first uu for uu in CADR u])
;         for v in CDDR u | NOT ATOM v repeat
;             free := getFreeList(v, bound, free, e)
;         free
;     EQ(op, 'SEQ) =>
;         for v in rest u | NOT ATOM v repeat
;             free := getFreeList(v, bound, free, e)
;         free
;     EQ(op, 'COND) =>
;         for v in rest u repeat
;             for vv in v repeat
;                 free := getFreeList(vv, bound, free, e)
;         free
;     if ATOM op then u := rest u  --Atomic functions aren't descended
;     for v in u repeat
;         free := getFreeList(v, bound, free, e)
;     free
 
(DEFUN |getFreeList| (|u| |bound| |free| |e|)
  (PROG (|v| |op| |lvl| |avl| |el|)
    (RETURN
     (COND
      ((ATOM |u|)
       (COND ((NULL (IDENTP |u|)) |free|) ((MEMQ |u| |bound|) |free|)
             ((SETQ |v| (ASSQ |u| |free|))
              (PROGN (RPLACD |v| (+ 1 (CDR |v|))) |free|))
             ((NULL (|getmode| |u| |e|)) |free|)
             (#1='T (CONS (CONS |u| 1) |free|))))
      (#1#
       (PROGN
        (SETQ |op| (CAR |u|))
        (COND ((MEMQ |op| '(QUOTE GO |function|)) |free|)
              ((EQ |op| 'LAMBDA)
               (PROGN
                (SETQ |lvl| (CADR |u|))
                (SETQ |avl| NIL)
                ((LAMBDA (|bfVar#4| |evl|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#4|)
                          (PROGN (SETQ |evl| (CAR |bfVar#4|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (PROGN
                       (SETQ |el|
                               (COND ((ATOM |evl|) |evl|) (#1# (CAR |evl|))))
                       (SETQ |avl| (CONS |el| |avl|)))))
                    (SETQ |bfVar#4| (CDR |bfVar#4|))))
                 |lvl| NIL)
                (SETQ |bound| (UNIONQ |bound| |avl|))
                ((LAMBDA (|bfVar#5| |v|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#5|)
                          (PROGN (SETQ |v| (CAR |bfVar#5|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (SETQ |free| (|getFreeList| |v| |bound| |free| |e|))))
                    (SETQ |bfVar#5| (CDR |bfVar#5|))))
                 (CDDR |u|) NIL)
                |free|))
              ((EQ |op| 'PROG)
               (PROGN
                (SETQ |bound| (UNIONQ |bound| (CADR |u|)))
                ((LAMBDA (|bfVar#6| |v|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#6|)
                          (PROGN (SETQ |v| (CAR |bfVar#6|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (NULL (ATOM |v|))
                           (SETQ |free|
                                   (|getFreeList| |v| |bound| |free| |e|)))))
                    (SETQ |bfVar#6| (CDR |bfVar#6|))))
                 (CDDR |u|) NIL)
                |free|))
              ((EQ |op| 'SPROG)
               (PROGN
                (SETQ |bound|
                        (UNIONQ |bound|
                         ((LAMBDA (|bfVar#8| |bfVar#7| |uu|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#7|)
                                   (PROGN (SETQ |uu| (CAR |bfVar#7|)) NIL))
                               (RETURN (NREVERSE |bfVar#8|)))
                              (#1#
                               (SETQ |bfVar#8| (CONS (CAR |uu|) |bfVar#8|))))
                             (SETQ |bfVar#7| (CDR |bfVar#7|))))
                          NIL (CADR |u|) NIL)))
                ((LAMBDA (|bfVar#9| |v|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#9|)
                          (PROGN (SETQ |v| (CAR |bfVar#9|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (NULL (ATOM |v|))
                           (SETQ |free|
                                   (|getFreeList| |v| |bound| |free| |e|)))))
                    (SETQ |bfVar#9| (CDR |bfVar#9|))))
                 (CDDR |u|) NIL)
                |free|))
              ((EQ |op| 'SEQ)
               (PROGN
                ((LAMBDA (|bfVar#10| |v|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#10|)
                          (PROGN (SETQ |v| (CAR |bfVar#10|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (NULL (ATOM |v|))
                           (SETQ |free|
                                   (|getFreeList| |v| |bound| |free| |e|)))))
                    (SETQ |bfVar#10| (CDR |bfVar#10|))))
                 (CDR |u|) NIL)
                |free|))
              ((EQ |op| 'COND)
               (PROGN
                ((LAMBDA (|bfVar#11| |v|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#11|)
                          (PROGN (SETQ |v| (CAR |bfVar#11|)) NIL))
                      (RETURN NIL))
                     (#1#
                      ((LAMBDA (|bfVar#12| |vv|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#12|)
                                (PROGN (SETQ |vv| (CAR |bfVar#12|)) NIL))
                            (RETURN NIL))
                           (#1#
                            (SETQ |free|
                                    (|getFreeList| |vv| |bound| |free| |e|))))
                          (SETQ |bfVar#12| (CDR |bfVar#12|))))
                       |v| NIL)))
                    (SETQ |bfVar#11| (CDR |bfVar#11|))))
                 (CDR |u|) NIL)
                |free|))
              (#1#
               (PROGN
                (COND ((ATOM |op|) (SETQ |u| (CDR |u|))))
                ((LAMBDA (|bfVar#13| |v|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#13|)
                          (PROGN (SETQ |v| (CAR |bfVar#13|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (SETQ |free| (|getFreeList| |v| |bound| |free| |e|))))
                    (SETQ |bfVar#13| (CDR |bfVar#13|))))
                 |u| NIL)
                |free|)))))))))
 
; compWithMappingMode(x, m, oldE) ==
;   compWithMappingMode1(x, m, oldE, $formalArgList)
 
(DEFUN |compWithMappingMode| (|x| |m| |oldE|)
  (PROG () (RETURN (|compWithMappingMode1| |x| |m| |oldE| |$formalArgList|))))
 
; compWithMappingMode1(x, m is ["Mapping", m', :sl], oldE, $formalArgList) ==
;   $killOptimizeIfTrue: local:= true
;   e:= oldE
;   isFunctor x =>
;     if get(x,"modemap",$CategoryFrame) is [[[.,target,:argModeList],.],:.] and
;       (and/[extendsCategoryForm("$",s,mode) for mode in argModeList for s in sl]
;         ) and extendsCategoryForm("$",target,m') then return [x,m,e]
;   if STRINGP x then x:= INTERN x
;   ress := nil
;   old_style := true
;   if x is ["+->", vl, nx] then
;       old_style := false
;       vl is [":", :.] =>
;          ress := compLambda(x,m,oldE)
;          -- In case Boot gets fixed
;          ress
;       vl :=
;           vl is ["@Tuple", :vl1] => vl1
;           vl
;       vl :=
;          IDENTP(vl) => [vl]
;          LISTP(vl) and (and/[SYMBOLP(v) for v in vl])=> vl
;          stackAndThrow ["bad +-> arguments:", vl]
;       $formalArgList := [:vl, :$formalArgList]
;       #sl ~= #vl =>
;          stackAndThrow [_
;            "number of arguments to +-> does not match, expected:", #sl]
;       x := nx
;   else
;       vl:= take(#sl,$FormalMapVariableList)
;   ress => ress
;   $returnMode : local := m'
;   $currentFunctionLevel : local := #$exitModeStack
;   old_style and not null vl and not hasFormalMapVariable(x, vl) =>
;       vln := [GENSYM() for v in vl]
;       $formalArgList := [:vln, :$formalArgList]
;       for m in sl for v in vln repeat
;           [.,.,e]:= compMakeDeclaration([":",v,m],$EmptyMode,e)
;       [u,.,.] := comp([x,:vln],m',e) or return nil
;       extractCodeAndConstructTriple(u, m, oldE)
;   null vl and (t := comp([x], m', e)) =>
;     [u,.,.] := t
;     extractCodeAndConstructTriple(u, m, oldE)
;   for m in sl for v in vl repeat
;       [.,.,e]:= compMakeDeclaration([":",v,m],$EmptyMode,e)
;   [u,.,.]:= comp(x,m',e) or return nil
;   (uu := simpleCall(u, vl, m, oldE)) => uu
;   catchTag:= MKQ GENSYM()
;   u := replaceExitEtc(u, catchTag, "TAGGEDreturn", $returnMode)
;   u := ["CATCH", catchTag, u]
;   uu := optimizeFunctionDef [nil, ['LAMBDA, vl, u]]
;   --  At this point, we have a function that we would like to pass.
;   --  Unfortunately, it makes various free variable references outside
;   --  itself.  So we build a mini-vector that contains them all, and
;   --  pass this as the environment to our inner function.
;   $FUNNAME :local := nil
;   $FUNNAME_TAIL : local := [nil]
;   expandedFunction := compTranDryRun CADR uu
;   frees := getFreeList(expandedFunction, vl, nil, e)
;   expandedFunction :=
;             --One free can go by itself, more than one needs a vector
;          --An A-list name . number of times used
;     #frees = 0 =>
;         ['LAMBDA, addNilTypesToArgs [:vl, "$$"], :CDDR expandedFunction]
;     #frees = 1 =>
;       vec:=first first frees
;       ['LAMBDA, addNilTypesToArgs [:vl, vec], :CDDR expandedFunction]
;     scode:=nil
;     vec:=nil
;     locals:=nil
;     i:=-1
;     for v in frees repeat
;       i:=i+1
;       vec:=[first v,:vec]
;       scode:=[['SETQ, first v, [($QuickCode => 'QREFELT;'ELT),"$$",i]], :scode]
;       locals:=[first v, :locals]
;     body:= CDDR expandedFunction
;     if locals then
;       if body is [['DECLARE,:.],:.] then
;         body := [first body, ['PROG, locals, :scode,
;                               ['RETURN, ['PROGN, :rest body]]]]
;       else body:=[['PROG,locals,:scode,['RETURN,['PROGN,:body]]]]
;     vec:=['VECTOR,:NREVERSE vec]
;     ['LAMBDA, addNilTypesToArgs [:vl, "$$"], :body]
;   fname:=['CLOSEDFN,expandedFunction]
;          --Like QUOTE, but gets compiled
;   uu:=
;     frees => ['CONS,fname,vec]
;     ['LIST,fname]
;   [uu,m,oldE]
 
(DEFUN |compWithMappingMode1| (|x| |m| |oldE| |$formalArgList|)
  (DECLARE (SPECIAL |$formalArgList|))
  (PROG ($FUNNAME_TAIL $FUNNAME |$currentFunctionLevel| |$returnMode|
         |$killOptimizeIfTrue| |fname| |body| |i| |locals| |scode| |vec|
         |frees| |expandedFunction| |catchTag| |uu| |t| |u| |LETTMP#1| |vln|
         |vl1| |nx| |vl| |old_style| |ress| |ISTMP#5| |argModeList| |target|
         |ISTMP#4| |ISTMP#3| |ISTMP#2| |ISTMP#1| |e| |sl| |m'|)
    (DECLARE
     (SPECIAL $FUNNAME_TAIL $FUNNAME |$currentFunctionLevel| |$returnMode|
      |$killOptimizeIfTrue|))
    (RETURN
     (PROGN
      (SETQ |m'| (CADR . #1=(|m|)))
      (SETQ |sl| (CDDR . #1#))
      (SETQ |$killOptimizeIfTrue| T)
      (SETQ |e| |oldE|)
      (COND
       ((|isFunctor| |x|)
        (COND
         ((AND
           (PROGN
            (SETQ |ISTMP#1| (|get| |x| '|modemap| |$CategoryFrame|))
            (AND (CONSP |ISTMP#1|)
                 (PROGN
                  (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                  (AND (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                        (AND (CONSP |ISTMP#3|)
                             (PROGN
                              (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                              (AND (CONSP |ISTMP#4|)
                                   (PROGN
                                    (SETQ |target| (CAR |ISTMP#4|))
                                    (SETQ |argModeList| (CDR |ISTMP#4|))
                                    #2='T)))))
                       (PROGN
                        (SETQ |ISTMP#5| (CDR |ISTMP#2|))
                        (AND (CONSP |ISTMP#5|) (EQ (CDR |ISTMP#5|) NIL)))))))
           ((LAMBDA (|bfVar#16| |bfVar#14| |mode| |bfVar#15| |s|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#14|)
                     (PROGN (SETQ |mode| (CAR |bfVar#14|)) NIL)
                     (ATOM |bfVar#15|) (PROGN (SETQ |s| (CAR |bfVar#15|)) NIL))
                 (RETURN |bfVar#16|))
                (#2#
                 (PROGN
                  (SETQ |bfVar#16| (|extendsCategoryForm| '$ |s| |mode|))
                  (COND ((NOT |bfVar#16|) (RETURN NIL))))))
               (SETQ |bfVar#14| (CDR |bfVar#14|))
               (SETQ |bfVar#15| (CDR |bfVar#15|))))
            T |argModeList| NIL |sl| NIL)
           (|extendsCategoryForm| '$ |target| |m'|))
          (RETURN (LIST |x| |m| |e|)))))
       (#2#
        (PROGN
         (COND ((STRINGP |x|) (SETQ |x| (INTERN |x|))))
         (SETQ |ress| NIL)
         (SETQ |old_style| T)
         (COND
          ((AND (CONSP |x|) (EQ (CAR |x|) '+->)
                (PROGN
                 (SETQ |ISTMP#1| (CDR |x|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |vl| (CAR |ISTMP#1|))
                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                       (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                            (PROGN (SETQ |nx| (CAR |ISTMP#2|)) #2#))))))
           (SETQ |old_style| NIL)
           (COND
            ((AND (CONSP |vl|) (EQ (CAR |vl|) '|:|))
             (PROGN (SETQ |ress| (|compLambda| |x| |m| |oldE|)) |ress|))
            (#2#
             (PROGN
              (SETQ |vl|
                      (COND
                       ((AND (CONSP |vl|) (EQ (CAR |vl|) '|@Tuple|)
                             (PROGN (SETQ |vl1| (CDR |vl|)) #2#))
                        |vl1|)
                       (#2# |vl|)))
              (SETQ |vl|
                      (COND ((IDENTP |vl|) (LIST |vl|))
                            ((AND (LISTP |vl|)
                                  ((LAMBDA (|bfVar#18| |bfVar#17| |v|)
                                     (LOOP
                                      (COND
                                       ((OR (ATOM |bfVar#17|)
                                            (PROGN
                                             (SETQ |v| (CAR |bfVar#17|))
                                             NIL))
                                        (RETURN |bfVar#18|))
                                       (#2#
                                        (PROGN
                                         (SETQ |bfVar#18| (SYMBOLP |v|))
                                         (COND
                                          ((NOT |bfVar#18|) (RETURN NIL))))))
                                      (SETQ |bfVar#17| (CDR |bfVar#17|))))
                                   T |vl| NIL))
                             |vl|)
                            (#2#
                             (|stackAndThrow|
                              (LIST '|bad +-> arguments:| |vl|)))))
              (SETQ |$formalArgList| (APPEND |vl| |$formalArgList|))
              (COND
               ((NOT (EQL (LENGTH |sl|) (LENGTH |vl|)))
                (|stackAndThrow|
                 (LIST '|number of arguments to +-> does not match, expected:|
                       (LENGTH |sl|))))
               (#2# (SETQ |x| |nx|)))))))
          (#2# (SETQ |vl| (TAKE (LENGTH |sl|) |$FormalMapVariableList|))))
         (COND (|ress| |ress|)
               (#2#
                (PROGN
                 (SETQ |$returnMode| |m'|)
                 (SETQ |$currentFunctionLevel| (LENGTH |$exitModeStack|))
                 (COND
                  ((AND |old_style| (NULL (NULL |vl|))
                        (NULL (|hasFormalMapVariable| |x| |vl|)))
                   (PROGN
                    (SETQ |vln|
                            ((LAMBDA (|bfVar#20| |bfVar#19| |v|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#19|)
                                      (PROGN (SETQ |v| (CAR |bfVar#19|)) NIL))
                                  (RETURN (NREVERSE |bfVar#20|)))
                                 (#2#
                                  (SETQ |bfVar#20|
                                          (CONS (GENSYM) |bfVar#20|))))
                                (SETQ |bfVar#19| (CDR |bfVar#19|))))
                             NIL |vl| NIL))
                    (SETQ |$formalArgList| (APPEND |vln| |$formalArgList|))
                    ((LAMBDA (|bfVar#21| |m| |bfVar#22| |v|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#21|)
                              (PROGN (SETQ |m| (CAR |bfVar#21|)) NIL)
                              (ATOM |bfVar#22|)
                              (PROGN (SETQ |v| (CAR |bfVar#22|)) NIL))
                          (RETURN NIL))
                         (#2#
                          (PROGN
                           (SETQ |LETTMP#1|
                                   (|compMakeDeclaration| (LIST '|:| |v| |m|)
                                    |$EmptyMode| |e|))
                           (SETQ |e| (CADDR |LETTMP#1|))
                           |LETTMP#1|)))
                        (SETQ |bfVar#21| (CDR |bfVar#21|))
                        (SETQ |bfVar#22| (CDR |bfVar#22|))))
                     |sl| NIL |vln| NIL)
                    (SETQ |LETTMP#1|
                            (OR (|comp| (CONS |x| |vln|) |m'| |e|)
                                (RETURN NIL)))
                    (SETQ |u| (CAR |LETTMP#1|))
                    (|extractCodeAndConstructTriple| |u| |m| |oldE|)))
                  ((AND (NULL |vl|) (SETQ |t| (|comp| (LIST |x|) |m'| |e|)))
                   (PROGN
                    (SETQ |u| (CAR |t|))
                    (|extractCodeAndConstructTriple| |u| |m| |oldE|)))
                  (#2#
                   (PROGN
                    ((LAMBDA (|bfVar#23| |m| |bfVar#24| |v|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#23|)
                              (PROGN (SETQ |m| (CAR |bfVar#23|)) NIL)
                              (ATOM |bfVar#24|)
                              (PROGN (SETQ |v| (CAR |bfVar#24|)) NIL))
                          (RETURN NIL))
                         (#2#
                          (PROGN
                           (SETQ |LETTMP#1|
                                   (|compMakeDeclaration| (LIST '|:| |v| |m|)
                                    |$EmptyMode| |e|))
                           (SETQ |e| (CADDR |LETTMP#1|))
                           |LETTMP#1|)))
                        (SETQ |bfVar#23| (CDR |bfVar#23|))
                        (SETQ |bfVar#24| (CDR |bfVar#24|))))
                     |sl| NIL |vl| NIL)
                    (SETQ |LETTMP#1| (OR (|comp| |x| |m'| |e|) (RETURN NIL)))
                    (SETQ |u| (CAR |LETTMP#1|))
                    (COND ((SETQ |uu| (|simpleCall| |u| |vl| |m| |oldE|)) |uu|)
                          (#2#
                           (PROGN
                            (SETQ |catchTag| (MKQ (GENSYM)))
                            (SETQ |u|
                                    (|replaceExitEtc| |u| |catchTag|
                                     '|TAGGEDreturn| |$returnMode|))
                            (SETQ |u| (LIST 'CATCH |catchTag| |u|))
                            (SETQ |uu|
                                    (|optimizeFunctionDef|
                                     (LIST NIL (LIST 'LAMBDA |vl| |u|))))
                            (SETQ $FUNNAME NIL)
                            (SETQ $FUNNAME_TAIL (LIST NIL))
                            (SETQ |expandedFunction|
                                    (|compTranDryRun| (CADR |uu|)))
                            (SETQ |frees|
                                    (|getFreeList| |expandedFunction| |vl| NIL
                                     |e|))
                            (SETQ |expandedFunction|
                                    (COND
                                     ((EQL (LENGTH |frees|) 0)
                                      (CONS 'LAMBDA
                                            (CONS
                                             (|addNilTypesToArgs|
                                              (APPEND |vl| (CONS '$$ NIL)))
                                             (CDDR |expandedFunction|))))
                                     ((EQL (LENGTH |frees|) 1)
                                      (PROGN
                                       (SETQ |vec| (CAR (CAR |frees|)))
                                       (CONS 'LAMBDA
                                             (CONS
                                              (|addNilTypesToArgs|
                                               (APPEND |vl| (CONS |vec| NIL)))
                                              (CDDR |expandedFunction|)))))
                                     (#2#
                                      (PROGN
                                       (SETQ |scode| NIL)
                                       (SETQ |vec| NIL)
                                       (SETQ |locals| NIL)
                                       (SETQ |i| (- 1))
                                       ((LAMBDA (|bfVar#25| |v|)
                                          (LOOP
                                           (COND
                                            ((OR (ATOM |bfVar#25|)
                                                 (PROGN
                                                  (SETQ |v| (CAR |bfVar#25|))
                                                  NIL))
                                             (RETURN NIL))
                                            (#2#
                                             (PROGN
                                              (SETQ |i| (+ |i| 1))
                                              (SETQ |vec|
                                                      (CONS (CAR |v|) |vec|))
                                              (SETQ |scode|
                                                      (CONS
                                                       (LIST 'SETQ (CAR |v|)
                                                             (LIST
                                                              (COND
                                                               (|$QuickCode|
                                                                'QREFELT)
                                                               (#2# 'ELT))
                                                              '$$ |i|))
                                                       |scode|))
                                              (SETQ |locals|
                                                      (CONS (CAR |v|)
                                                            |locals|)))))
                                           (SETQ |bfVar#25| (CDR |bfVar#25|))))
                                        |frees| NIL)
                                       (SETQ |body| (CDDR |expandedFunction|))
                                       (COND
                                        (|locals|
                                         (COND
                                          ((AND (CONSP |body|)
                                                (PROGN
                                                 (SETQ |ISTMP#1| (CAR |body|))
                                                 (AND (CONSP |ISTMP#1|)
                                                      (EQ (CAR |ISTMP#1|)
                                                          'DECLARE))))
                                           (SETQ |body|
                                                   (LIST (CAR |body|)
                                                         (CONS 'PROG
                                                               (CONS |locals|
                                                                     (APPEND
                                                                      |scode|
                                                                      (CONS
                                                                       (LIST
                                                                        'RETURN
                                                                        (CONS
                                                                         'PROGN
                                                                         (CDR
                                                                          |body|)))
                                                                       NIL)))))))
                                          (#2#
                                           (SETQ |body|
                                                   (LIST
                                                    (CONS 'PROG
                                                          (CONS |locals|
                                                                (APPEND |scode|
                                                                        (CONS
                                                                         (LIST
                                                                          'RETURN
                                                                          (CONS
                                                                           'PROGN
                                                                           |body|))
                                                                         NIL))))))))))
                                       (SETQ |vec|
                                               (CONS 'VECTOR (NREVERSE |vec|)))
                                       (CONS 'LAMBDA
                                             (CONS
                                              (|addNilTypesToArgs|
                                               (APPEND |vl| (CONS '$$ NIL)))
                                              |body|))))))
                            (SETQ |fname| (LIST 'CLOSEDFN |expandedFunction|))
                            (SETQ |uu|
                                    (COND (|frees| (LIST 'CONS |fname| |vec|))
                                          (#2# (LIST 'LIST |fname|))))
                            (LIST |uu| |m| |oldE|)))))))))))))))))
 
; simpleCall(u, vl, m, oldE) ==
;     u is ["call", fn, :avl] and avl = vl =>
;         if fn is ["applyFun", a] then fn := a
;         fn = "mkRecord" => nil
;         [fn,m,oldE]
;     nil
 
(DEFUN |simpleCall| (|u| |vl| |m| |oldE|)
  (PROG (|ISTMP#1| |fn| |avl| |a|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) '|call|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |fn| (CAR |ISTMP#1|))
                   (SETQ |avl| (CDR |ISTMP#1|))
                   #1='T)))
            (EQUAL |avl| |vl|))
       (PROGN
        (COND
         ((AND (CONSP |fn|) (EQ (CAR |fn|) '|applyFun|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |fn|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1#))))
          (SETQ |fn| |a|)))
        (COND ((EQ |fn| '|mkRecord|) NIL) (#1# (LIST |fn| |m| |oldE|)))))
      (#1# NIL)))))
 
; extractCodeAndConstructTriple(u, m, oldE) ==
;   u is ["call",fn,:.] =>
;     if fn is ["applyFun",a] then fn := a
;     [fn,m,oldE]
;   [op,:.,env] := u
;   [["CONS",["function",op],env],m,oldE]
 
(DEFUN |extractCodeAndConstructTriple| (|u| |m| |oldE|)
  (PROG (|ISTMP#1| |fn| |a| |op| |LETTMP#1| |env|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) '|call|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |fn| (CAR |ISTMP#1|)) #1='T))))
       (PROGN
        (COND
         ((AND (CONSP |fn|) (EQ (CAR |fn|) '|applyFun|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |fn|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1#))))
          (SETQ |fn| |a|)))
        (LIST |fn| |m| |oldE|)))
      (#1#
       (PROGN
        (SETQ |op| (CAR |u|))
        (SETQ |LETTMP#1| (REVERSE (CDR |u|)))
        (SETQ |env| (CAR |LETTMP#1|))
        (LIST (LIST 'CONS (LIST '|function| |op|) |env|) |m| |oldE|)))))))
 
; compExpression(x,m,e) ==
;   $insideExpressionIfTrue: local:= true
;   SYMBOLP(first x) and (fn := GET(first x, "SPECIAL")) =>
;     FUNCALL(fn,x,m,e)
;   compForm(x,m,e)
 
(DEFUN |compExpression| (|x| |m| |e|)
  (PROG (|$insideExpressionIfTrue| |fn|)
    (DECLARE (SPECIAL |$insideExpressionIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$insideExpressionIfTrue| T)
      (COND
       ((AND (SYMBOLP (CAR |x|)) (SETQ |fn| (GET (CAR |x|) 'SPECIAL)))
        (FUNCALL |fn| |x| |m| |e|))
       ('T (|compForm| |x| |m| |e|)))))))
 
; compAtom(x, m, e) ==
;     res := compAtom1(x, m, e) => res
;     compAtomWithModemap(x, m, e, get(x, "modemap", e))
 
(DEFUN |compAtom| (|x| |m| |e|)
  (PROG (|res|)
    (RETURN
     (COND ((SETQ |res| (|compAtom1| |x| |m| |e|)) |res|)
           ('T
            (|compAtomWithModemap| |x| |m| |e| (|get| |x| '|modemap| |e|)))))))
 
; compAtom1(x, m, e) ==
;   t:=
;     isSymbol x =>
;       compSymbol(x,m,e) or return nil
;     m = $OutputForm and primitiveType x => [x,m,e]
;     STRINGP x => [x,x,e]
;     [x,primitiveType x or return nil,e]
;   convert(t,m)
 
(DEFUN |compAtom1| (|x| |m| |e|)
  (PROG (|t|)
    (RETURN
     (PROGN
      (SETQ |t|
              (COND
               ((|isSymbol| |x|) (OR (|compSymbol| |x| |m| |e|) (RETURN NIL)))
               ((AND (EQUAL |m| |$OutputForm|) (|primitiveType| |x|))
                (LIST |x| |m| |e|))
               ((STRINGP |x|) (LIST |x| |x| |e|))
               ('T (LIST |x| (OR (|primitiveType| |x|) (RETURN NIL)) |e|))))
      (|convert| |t| |m|)))))
 
; primitiveType x ==
;   x is nil => $EmptyMode
;   STRINGP x => $String
;   INTEGERP x =>
;     x=0 => $NonNegativeInteger
;     x>0 => $PositiveInteger
;     true => $NegativeInteger
;   FLOATP x => $DoubleFloat
;   nil
 
(DEFUN |primitiveType| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) |$EmptyMode|) ((STRINGP |x|) |$String|)
           ((INTEGERP |x|)
            (COND ((EQL |x| 0) |$NonNegativeInteger|)
                  ((< 0 |x|) |$PositiveInteger|) (T |$NegativeInteger|)))
           ((FLOATP |x|) |$DoubleFloat|) ('T NIL)))))
 
; DEFPARAMETER($compForModeIfTrue, false)
 
(DEFPARAMETER |$compForModeIfTrue| NIL)
 
; compSymbol(s,m,e) ==
;   s="$NoValue" => ["$NoValue",$NoValueMode,e]
;   isFluid s => [s,getmode(s,e) or return nil,e]
;   s="true" => ['(QUOTE T),$Boolean,e]
;   s="false" => [false,$Boolean,e]
;   s = m => [["QUOTE", s], s, e]
;   v:= get(s,"value",e) =>
; --+
;     MEMQ(s,$functorLocalParameters) =>
;         NRTgetLocalIndex s
;         [s,v.mode,e] --s will be replaced by an ELT form in beforeCompile
;     [s,v.mode,e] --s has been SETQd
;   m':= getmode(s,e) =>
;     if not member(s,$formalArgList) and not MEMQ(s,$FormalMapVariableList) and
;       not isFunction(s,e) and null ($compForModeIfTrue=true) then errorRef s
;     [s,m',e] --s is a declared argument
;   MEMQ(s,$FormalMapVariableList) => stackMessage ["no mode found for",s]
;   not isFunction(s,e) => errorRef s
 
(DEFUN |compSymbol| (|s| |m| |e|)
  (PROG (|v| |m'|)
    (RETURN
     (COND ((EQ |s| '|$NoValue|) (LIST '|$NoValue| |$NoValueMode| |e|))
           ((|isFluid| |s|)
            (LIST |s| (OR (|getmode| |s| |e|) (RETURN NIL)) |e|))
           ((EQ |s| '|true|) (LIST ''T |$Boolean| |e|))
           ((EQ |s| '|false|) (LIST NIL |$Boolean| |e|))
           ((EQUAL |s| |m|) (LIST (LIST 'QUOTE |s|) |s| |e|))
           ((SETQ |v| (|get| |s| '|value| |e|))
            (COND
             ((MEMQ |s| |$functorLocalParameters|)
              (PROGN (|NRTgetLocalIndex| |s|) (LIST |s| (CADR |v|) |e|)))
             ('T (LIST |s| (CADR |v|) |e|))))
           ((SETQ |m'| (|getmode| |s| |e|))
            (PROGN
             (COND
              ((AND (NULL (|member| |s| |$formalArgList|))
                    (NULL (MEMQ |s| |$FormalMapVariableList|))
                    (NULL (|isFunction| |s| |e|))
                    (NULL (EQUAL |$compForModeIfTrue| T)))
               (|errorRef| |s|)))
             (LIST |s| |m'| |e|)))
           ((MEMQ |s| |$FormalMapVariableList|)
            (|stackMessage| (LIST '|no mode found for| |s|)))
           ((NULL (|isFunction| |s| |e|)) (|errorRef| |s|))))))
 
; convertOrCroak(T,m) ==
;   u:= convert(T,m) => u
;   userError ["CANNOT CONVERT: ",T.expr,"%l"," OF MODE: ",T.mode,"%l",
;     " TO MODE: ",m,"%l"]
 
(DEFUN |convertOrCroak| (T$ |m|)
  (PROG (|u|)
    (RETURN
     (COND ((SETQ |u| (|convert| T$ |m|)) |u|)
           ('T
            (|userError|
             (LIST '|CANNOT CONVERT: | (CAR T$) '|%l| '| OF MODE: | (CADR T$)
                   '|%l| '| TO MODE: | |m| '|%l|)))))))
 
; convert(T,m) ==
;   coerce(T,resolve(T.mode,m) or return nil)
 
(DEFUN |convert| (T$ |m|)
  (PROG () (RETURN (|coerce| T$ (OR (|resolve| (CADR T$) |m|) (RETURN NIL))))))
 
; maxSuperType(m,e) ==
;   typ:= get(m,"SuperDomain",e) => maxSuperType(typ,e)
;   m
 
(DEFUN |maxSuperType| (|m| |e|)
  (PROG (|typ|)
    (RETURN
     (COND
      ((SETQ |typ| (|get| |m| '|SuperDomain| |e|)) (|maxSuperType| |typ| |e|))
      ('T |m|)))))
 
; hasType(x,e) ==
;   fn get(x,"condition",e) where
;     fn x ==
;       null x => nil
;       x is [["case",.,y],:.] => y
;       fn rest x
 
(DEFUN |hasType| (|x| |e|)
  (PROG () (RETURN (|hasType,fn| (|get| |x| '|condition| |e|)))))
(DEFUN |hasType,fn| (|x|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |y|)
    (RETURN
     (COND ((NULL |x|) NIL)
           ((AND (CONSP |x|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |x|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|case|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |y| (CAR |ISTMP#3|))
                                    #1='T))))))))
            |y|)
           (#1# (|hasType,fn| (CDR |x|)))))))
 
; compForm(form,m,e) ==
;   T:=
;     compForm1(form,m,e) or compArgumentsAndTryAgain(form,m,e) or return
;       stackMessageIfNone ["cannot compile","%b",form,"%d"]
;   T
 
(DEFUN |compForm| (|form| |m| |e|)
  (PROG (T$)
    (RETURN
     (PROGN
      (SETQ T$
              (OR (|compForm1| |form| |m| |e|)
                  (|compArgumentsAndTryAgain| |form| |m| |e|)
                  (RETURN
                   (|stackMessageIfNone|
                    (LIST '|cannot compile| '|%b| |form| '|%d|)))))
      T$))))
 
; compArgumentsAndTryAgain(form is [.,:argl],m,e) ==
;   not($tryRecompileArguments) or null(argl) => nil
;   -- used in case: f(g(x)) where f is in domain introduced by
;   -- comping g, e.g. for (ELT (ELT x a) b), environment can have no
;   -- modemap with selector b
;   form is ["Sel", a, .] => nil
;   u:= for x in argl repeat [.,.,e]:= comp(x,$EmptyMode,e) or return "failed"
;   u="failed" => nil
;   compForm1(form,m,e)
 
(DEFUN |compArgumentsAndTryAgain| (|form| |m| |e|)
  (PROG (|argl| |ISTMP#1| |a| |ISTMP#2| |LETTMP#1| |u|)
    (RETURN
     (PROGN
      (SETQ |argl| (CDR |form|))
      (COND ((OR (NULL |$tryRecompileArguments|) (NULL |argl|)) NIL)
            ((AND (CONSP |form|) (EQ (CAR |form|) '|Sel|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |form|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |a| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL))))))
             NIL)
            (#1='T
             (PROGN
              (SETQ |u|
                      ((LAMBDA (|bfVar#26| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#26|)
                                (PROGN (SETQ |x| (CAR |bfVar#26|)) NIL))
                            (RETURN NIL))
                           (#1#
                            (PROGN
                             (SETQ |LETTMP#1|
                                     (OR (|comp| |x| |$EmptyMode| |e|)
                                         (RETURN '|failed|)))
                             (SETQ |e| (CADDR |LETTMP#1|))
                             |LETTMP#1|)))
                          (SETQ |bfVar#26| (CDR |bfVar#26|))))
                       |argl| NIL))
              (COND ((EQ |u| '|failed|) NIL)
                    (#1# (|compForm1| |form| |m| |e|))))))))))
 
; outputComp(x,e) ==
;   u:=comp(['_:_:, x, $OutputForm], $OutputForm, e) => u
;   x is ['construct,:argl] =>
;     [['LIST, ['QUOTE, 'CONCAT], :[([.,.,e] := outputComp(x, e)).expr
;         for x in argl]], $OutputForm, e]
;   (v:= get(x,"value",e)) and (v.mode is ['Union,:l]) =>
;     [['coerceUn2E, x, v.mode], $OutputForm, e]
;   SAY ["outputComp strange x ", x]
;   nil
 
(DEFUN |outputComp| (|x| |e|)
  (PROG (|u| |argl| |LETTMP#1| |v| |ISTMP#1| |l|)
    (RETURN
     (COND
      ((SETQ |u| (|comp| (LIST '|::| |x| |$OutputForm|) |$OutputForm| |e|))
       |u|)
      ((AND (CONSP |x|) (EQ (CAR |x|) '|construct|)
            (PROGN (SETQ |argl| (CDR |x|)) #1='T))
       (LIST
        (CONS 'LIST
              (CONS (LIST 'QUOTE 'CONCAT)
                    ((LAMBDA (|bfVar#28| |bfVar#27| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#27|)
                              (PROGN (SETQ |x| (CAR |bfVar#27|)) NIL))
                          (RETURN (NREVERSE |bfVar#28|)))
                         (#1#
                          (SETQ |bfVar#28|
                                  (CONS
                                   (CAR
                                    (PROGN
                                     (SETQ |LETTMP#1| (|outputComp| |x| |e|))
                                     (SETQ |e| (CADDR |LETTMP#1|))
                                     |LETTMP#1|))
                                   |bfVar#28|))))
                        (SETQ |bfVar#27| (CDR |bfVar#27|))))
                     NIL |argl| NIL)))
        |$OutputForm| |e|))
      ((AND (SETQ |v| (|get| |x| '|value| |e|))
            (PROGN
             (SETQ |ISTMP#1| (CADR |v|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Union|)
                  (PROGN (SETQ |l| (CDR |ISTMP#1|)) #1#))))
       (LIST (LIST '|coerceUn2E| |x| (CADR |v|)) |$OutputForm| |e|))
      (#1# (PROGN (SAY (LIST '|outputComp strange x | |x|)) NIL))))))
 
; compSel1(domain, op, argl, m, e) ==
;     domain="Lisp" =>
;         [[op, :[([., ., e] := compOrCroak(x, $EmptyMode, e)).expr
;            for x in argl]], m, e]
;     (op = "COLLECT") and coerceable(domain, m, e) =>
;       (T := comp([op, :argl], domain, e) or return nil; coerce(T, m))
;     -- Next clause added JHD 8/Feb/94: the clause after doesn't work
;     -- since addDomain refuses to add modemaps from Mapping
;     e :=
;         domain is ['Mapping, :.] =>
;             augModemapsFromDomain1(domain, domain, e)
;         addDomain(domain, e)
;     mml := [x for x in getFormModemaps([op, :argl], e)
;               | x is [[ =domain, :.], :.]]
;     (ans := compForm2([op, :argl], m, e, mml)) => ans
;     op = "construct" and coerceable(domain, m, e) =>
;         (T := comp([op, :argl], domain, e) or return nil; coerce(T, m))
;     nil
 
(DEFUN |compSel1| (|domain| |op| |argl| |m| |e|)
  (PROG (|LETTMP#1| T$ |ISTMP#1| |mml| |ans|)
    (RETURN
     (COND
      ((EQ |domain| '|Lisp|)
       (LIST
        (CONS |op|
              ((LAMBDA (|bfVar#30| |bfVar#29| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#29|)
                        (PROGN (SETQ |x| (CAR |bfVar#29|)) NIL))
                    (RETURN (NREVERSE |bfVar#30|)))
                   (#1='T
                    (SETQ |bfVar#30|
                            (CONS
                             (CAR
                              (PROGN
                               (SETQ |LETTMP#1|
                                       (|compOrCroak| |x| |$EmptyMode| |e|))
                               (SETQ |e| (CADDR |LETTMP#1|))
                               |LETTMP#1|))
                             |bfVar#30|))))
                  (SETQ |bfVar#29| (CDR |bfVar#29|))))
               NIL |argl| NIL))
        |m| |e|))
      ((AND (EQ |op| 'COLLECT) (|coerceable| |domain| |m| |e|))
       (PROGN
        (SETQ T$ (OR (|comp| (CONS |op| |argl|) |domain| |e|) (RETURN NIL)))
        (|coerce| T$ |m|)))
      (#1#
       (PROGN
        (SETQ |e|
                (COND
                 ((AND (CONSP |domain|) (EQ (CAR |domain|) '|Mapping|))
                  (|augModemapsFromDomain1| |domain| |domain| |e|))
                 (#1# (|addDomain| |domain| |e|))))
        (SETQ |mml|
                ((LAMBDA (|bfVar#32| |bfVar#31| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#31|)
                          (PROGN (SETQ |x| (CAR |bfVar#31|)) NIL))
                      (RETURN (NREVERSE |bfVar#32|)))
                     (#1#
                      (AND (CONSP |x|)
                           (PROGN
                            (SETQ |ISTMP#1| (CAR |x|))
                            (AND (CONSP |ISTMP#1|)
                                 (EQUAL (CAR |ISTMP#1|) |domain|)))
                           (SETQ |bfVar#32| (CONS |x| |bfVar#32|)))))
                    (SETQ |bfVar#31| (CDR |bfVar#31|))))
                 NIL (|getFormModemaps| (CONS |op| |argl|) |e|) NIL))
        (COND
         ((SETQ |ans| (|compForm2| (CONS |op| |argl|) |m| |e| |mml|)) |ans|)
         ((AND (EQ |op| '|construct|) (|coerceable| |domain| |m| |e|))
          (PROGN
           (SETQ T$ (OR (|comp| (CONS |op| |argl|) |domain| |e|) (RETURN NIL)))
           (|coerce| T$ |m|)))
         (#1# NIL))))))))
 
; compForm1(form is [op,:argl],m,e) ==
;   op="error" =>
;       #argl = 1 =>
;           arg := first(argl)
;           u := comp(arg, $String, e) =>
;               [[op, u.expr], m, e]
;           SAY ["compiling call to error ", argl]
;           u := outputComp(arg, e) =>
;               [[op, ['LIST, ['QUOTE, 'mathprint], u.expr]], m, e]
;           nil
;       SAY ["compiling call to error ", argl]
;       nil
;   op is ["Sel", domain, op'] => compSel1(domain, op', argl, m, e)
; 
;   e:= addDomain(m,e) --???unneccessary because of comp2's call???
;   (mmList:= getFormModemaps(form,e)) and (T:= compForm2(form,m,e,mmList)) => T
;   compToApply(op,argl,m,e)
 
(DEFUN |compForm1| (|form| |m| |e|)
  (PROG (|op| |argl| |arg| |u| |ISTMP#1| |domain| |ISTMP#2| |op'| |mmList| T$)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (COND
       ((EQ |op| '|error|)
        (COND
         ((EQL (LENGTH |argl|) 1)
          (PROGN
           (SETQ |arg| (CAR |argl|))
           (COND
            ((SETQ |u| (|comp| |arg| |$String| |e|))
             (LIST (LIST |op| (CAR |u|)) |m| |e|))
            (#1='T
             (PROGN
              (SAY (LIST '|compiling call to error | |argl|))
              (COND
               ((SETQ |u| (|outputComp| |arg| |e|))
                (LIST
                 (LIST |op| (LIST 'LIST (LIST 'QUOTE '|mathprint|) (CAR |u|)))
                 |m| |e|))
               (#1# NIL)))))))
         (#1# (PROGN (SAY (LIST '|compiling call to error | |argl|)) NIL))))
       ((AND (CONSP |op|) (EQ (CAR |op|) '|Sel|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |op|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |domain| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |op'| (CAR |ISTMP#2|)) #1#))))))
        (|compSel1| |domain| |op'| |argl| |m| |e|))
       (#1#
        (PROGN
         (SETQ |e| (|addDomain| |m| |e|))
         (COND
          ((AND (SETQ |mmList| (|getFormModemaps| |form| |e|))
                (SETQ T$ (|compForm2| |form| |m| |e| |mmList|)))
           T$)
          (#1# (|compToApply| |op| |argl| |m| |e|))))))))))
 
; compExpressionList(argl,m,e) ==
;   Tl := [[.,.,e] := comp(x, $OutputForm, e) or return "failed" for x in argl]
;   Tl="failed" => nil
;   convert([["LIST", :[y.expr for y in Tl]], $OutputForm, e], m)
 
(DEFUN |compExpressionList| (|argl| |m| |e|)
  (PROG (|LETTMP#1| |Tl|)
    (RETURN
     (PROGN
      (SETQ |Tl|
              ((LAMBDA (|bfVar#34| |bfVar#33| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#33|)
                        (PROGN (SETQ |x| (CAR |bfVar#33|)) NIL))
                    (RETURN (NREVERSE |bfVar#34|)))
                   (#1='T
                    (SETQ |bfVar#34|
                            (CONS
                             (PROGN
                              (SETQ |LETTMP#1|
                                      (OR (|comp| |x| |$OutputForm| |e|)
                                          (RETURN '|failed|)))
                              (SETQ |e| (CADDR |LETTMP#1|))
                              |LETTMP#1|)
                             |bfVar#34|))))
                  (SETQ |bfVar#33| (CDR |bfVar#33|))))
               NIL |argl| NIL))
      (COND ((EQ |Tl| '|failed|) NIL)
            (#1#
             (|convert|
              (LIST
               (CONS 'LIST
                     ((LAMBDA (|bfVar#36| |bfVar#35| |y|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#35|)
                               (PROGN (SETQ |y| (CAR |bfVar#35|)) NIL))
                           (RETURN (NREVERSE |bfVar#36|)))
                          (#1# (SETQ |bfVar#36| (CONS (CAR |y|) |bfVar#36|))))
                         (SETQ |bfVar#35| (CDR |bfVar#35|))))
                      NIL |Tl| NIL))
               |$OutputForm| |e|)
              |m|)))))))
 
; compForm2(form is [op,:argl],m,e,modemapList) ==
;   sargl:= TAKE(# argl, $TriangleVariableList)
;   aList:= [[sa,:a] for a in argl for sa in sargl]
;   modemapList:= SUBLIS(aList,modemapList)
;   deleteList:=[]
;   newList := []
;   -- now delete any modemaps that are subsumed by something else, provided the conditions
;   -- are right (i.e. subsumer true whenever subsumee true)
;   for u in modemapList repeat
;     if u is [[dc,:.],[cond,["Subsumed",.,nsig]]] and
;        (v:=assoc([dc,:nsig],modemapList)) and v is [.,[ncond,:.]] then
;            deleteList:=[u,:deleteList]
;            if not PredImplies(ncond,cond) then
;                newList := [[first u, [cond, ['ELT, dc, nil]]], :newList]
;   if deleteList then modemapList:=[u for u in modemapList | not MEMQ(u,deleteList)]
;   -- We can use MEMQ since deleteList was built out of members of modemapList
;   -- its important that subsumed ops (newList) be considered last
;   if newList then modemapList := append(modemapList,newList)
;   Tl:=
;     [[.,.,e]:= T
;       for x in argl while (isSimple x and (T:= compUniquely(x,$EmptyMode,e)))]
;   or/[x for x in Tl] =>
;     partialModeList:= [(x => x.mode; nil) for x in Tl]
;     compFormPartiallyBottomUp(form,m,e,modemapList,partialModeList) or
;       compForm3(form,m,e,modemapList)
;   compForm3(form,m,e,modemapList)
 
(DEFUN |compForm2| (|form| |m| |e| |modemapList|)
  (PROG (|op| |argl| |sargl| |aList| |deleteList| |newList| |ISTMP#1| |dc|
         |ISTMP#2| |ISTMP#3| |cond| |ISTMP#4| |ISTMP#5| |ISTMP#6| |ISTMP#7|
         |nsig| |v| |ncond| T$ |Tl| |partialModeList|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (SETQ |sargl| (TAKE (LENGTH |argl|) |$TriangleVariableList|))
      (SETQ |aList|
              ((LAMBDA (|bfVar#39| |bfVar#37| |a| |bfVar#38| |sa|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#37|)
                        (PROGN (SETQ |a| (CAR |bfVar#37|)) NIL)
                        (ATOM |bfVar#38|)
                        (PROGN (SETQ |sa| (CAR |bfVar#38|)) NIL))
                    (RETURN (NREVERSE |bfVar#39|)))
                   (#1='T (SETQ |bfVar#39| (CONS (CONS |sa| |a|) |bfVar#39|))))
                  (SETQ |bfVar#37| (CDR |bfVar#37|))
                  (SETQ |bfVar#38| (CDR |bfVar#38|))))
               NIL |argl| NIL |sargl| NIL))
      (SETQ |modemapList| (SUBLIS |aList| |modemapList|))
      (SETQ |deleteList| NIL)
      (SETQ |newList| NIL)
      ((LAMBDA (|bfVar#40| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#40|) (PROGN (SETQ |u| (CAR |bfVar#40|)) NIL))
            (RETURN NIL))
           (#1#
            (COND
             ((AND (CONSP |u|)
                   (PROGN
                    (SETQ |ISTMP#1| (CAR |u|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN (SETQ |dc| (CAR |ISTMP#1|)) #1#)))
                   (PROGN
                    (SETQ |ISTMP#2| (CDR |u|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN
                          (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|)
                               (PROGN
                                (SETQ |cond| (CAR |ISTMP#3|))
                                (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                                     (PROGN
                                      (SETQ |ISTMP#5| (CAR |ISTMP#4|))
                                      (AND (CONSP |ISTMP#5|)
                                           (EQ (CAR |ISTMP#5|) '|Subsumed|)
                                           (PROGN
                                            (SETQ |ISTMP#6| (CDR |ISTMP#5|))
                                            (AND (CONSP |ISTMP#6|)
                                                 (PROGN
                                                  (SETQ |ISTMP#7|
                                                          (CDR |ISTMP#6|))
                                                  (AND (CONSP |ISTMP#7|)
                                                       (EQ (CDR |ISTMP#7|) NIL)
                                                       (PROGN
                                                        (SETQ |nsig|
                                                                (CAR
                                                                 |ISTMP#7|))
                                                        #1#)))))))))))))
                   (SETQ |v| (|assoc| (CONS |dc| |nsig|) |modemapList|))
                   (CONSP |v|)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |v|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN
                          (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|)
                               (PROGN (SETQ |ncond| (CAR |ISTMP#2|)) #1#))))))
              (SETQ |deleteList| (CONS |u| |deleteList|))
              (COND
               ((NULL (|PredImplies| |ncond| |cond|))
                (SETQ |newList|
                        (CONS
                         (LIST (CAR |u|) (LIST |cond| (LIST 'ELT |dc| NIL)))
                         |newList|))))))))
          (SETQ |bfVar#40| (CDR |bfVar#40|))))
       |modemapList| NIL)
      (COND
       (|deleteList|
        (SETQ |modemapList|
                ((LAMBDA (|bfVar#42| |bfVar#41| |u|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#41|)
                          (PROGN (SETQ |u| (CAR |bfVar#41|)) NIL))
                      (RETURN (NREVERSE |bfVar#42|)))
                     (#1#
                      (AND (NULL (MEMQ |u| |deleteList|))
                           (SETQ |bfVar#42| (CONS |u| |bfVar#42|)))))
                    (SETQ |bfVar#41| (CDR |bfVar#41|))))
                 NIL |modemapList| NIL))))
      (COND (|newList| (SETQ |modemapList| (APPEND |modemapList| |newList|))))
      (SETQ |Tl|
              ((LAMBDA (|bfVar#44| |bfVar#43| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#43|)
                        (PROGN (SETQ |x| (CAR |bfVar#43|)) NIL)
                        (NOT
                         (AND (|isSimple| |x|)
                              (SETQ T$
                                      (|compUniquely| |x| |$EmptyMode| |e|)))))
                    (RETURN (NREVERSE |bfVar#44|)))
                   (#1#
                    (SETQ |bfVar#44|
                            (CONS (PROGN (SETQ |e| (CADDR T$)) T$)
                                  |bfVar#44|))))
                  (SETQ |bfVar#43| (CDR |bfVar#43|))))
               NIL |argl| NIL))
      (COND
       (((LAMBDA (|bfVar#46| |bfVar#45| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#45|) (PROGN (SETQ |x| (CAR |bfVar#45|)) NIL))
              (RETURN |bfVar#46|))
             (#1#
              (PROGN
               (SETQ |bfVar#46| |x|)
               (COND (|bfVar#46| (RETURN |bfVar#46|))))))
            (SETQ |bfVar#45| (CDR |bfVar#45|))))
         NIL |Tl| NIL)
        (PROGN
         (SETQ |partialModeList|
                 ((LAMBDA (|bfVar#48| |bfVar#47| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#47|)
                           (PROGN (SETQ |x| (CAR |bfVar#47|)) NIL))
                       (RETURN (NREVERSE |bfVar#48|)))
                      (#1#
                       (SETQ |bfVar#48|
                               (CONS (COND (|x| (CADR |x|)) (#1# NIL))
                                     |bfVar#48|))))
                     (SETQ |bfVar#47| (CDR |bfVar#47|))))
                  NIL |Tl| NIL))
         (OR
          (|compFormPartiallyBottomUp| |form| |m| |e| |modemapList|
           |partialModeList|)
          (|compForm3| |form| |m| |e| |modemapList|))))
       (#1# (|compForm3| |form| |m| |e| |modemapList|)))))))
 
; compFormPartiallyBottomUp(form,m,e,modemapList,partialModeList) ==
;   mmList:= [mm for mm in modemapList | compFormMatch(mm,partialModeList)] =>
;     compForm3(form,m,e,mmList)
 
(DEFUN |compFormPartiallyBottomUp|
       (|form| |m| |e| |modemapList| |partialModeList|)
  (PROG (|mmList|)
    (RETURN
     (COND
      ((SETQ |mmList|
               ((LAMBDA (|bfVar#50| |bfVar#49| |mm|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#49|)
                         (PROGN (SETQ |mm| (CAR |bfVar#49|)) NIL))
                     (RETURN (NREVERSE |bfVar#50|)))
                    ('T
                     (AND (|compFormMatch| |mm| |partialModeList|)
                          (SETQ |bfVar#50| (CONS |mm| |bfVar#50|)))))
                   (SETQ |bfVar#49| (CDR |bfVar#49|))))
                NIL |modemapList| NIL))
       (IDENTITY (|compForm3| |form| |m| |e| |mmList|)))))))
 
; compFormMatch(mm,partialModeList) ==
;   mm is [[.,.,:argModeList],:.] and match(argModeList,partialModeList) where
;     match(a,b) ==
;       null b => true
;       null first b => match(rest a,rest b)
;       first a=first b and match(rest a,rest b)
 
(DEFUN |compFormMatch| (|mm| |partialModeList|)
  (PROG (|ISTMP#1| |ISTMP#2| |argModeList|)
    (RETURN
     (AND (CONSP |mm|)
          (PROGN
           (SETQ |ISTMP#1| (CAR |mm|))
           (AND (CONSP |ISTMP#1|)
                (PROGN
                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|)
                      (PROGN (SETQ |argModeList| (CDR |ISTMP#2|)) 'T)))))
          (|compFormMatch,match| |argModeList| |partialModeList|)))))
(DEFUN |compFormMatch,match| (|a| |b|)
  (PROG ()
    (RETURN
     (COND ((NULL |b|) T)
           ((NULL (CAR |b|)) (|compFormMatch,match| (CDR |a|) (CDR |b|)))
           ('T
            (AND (EQUAL (CAR |a|) (CAR |b|))
                 (|compFormMatch,match| (CDR |a|) (CDR |b|))))))))
 
; compForm3(form is [op,:argl],m,e,modemapList) ==
;   T:=
;     or/
;       [compFormWithModemap(form,m,e,first (mml:= ml))
;         for ml in tails modemapList]
;   $compUniquelyIfTrue =>
;     or/[compFormWithModemap(form,m,e,mm) for mm in rest mml] =>
;       THROW("compUniquely",nil)
;     T
;   T
 
(DEFUN |compForm3| (|form| |m| |e| |modemapList|)
  (PROG (|op| |argl| |mml| T$)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (SETQ T$
              ((LAMBDA (|bfVar#51| |ml|)
                 (LOOP
                  (COND ((ATOM |ml|) (RETURN |bfVar#51|))
                        (#1='T
                         (PROGN
                          (SETQ |bfVar#51|
                                  (|compFormWithModemap| |form| |m| |e|
                                   (CAR (SETQ |mml| |ml|))))
                          (COND (|bfVar#51| (RETURN |bfVar#51|))))))
                  (SETQ |ml| (CDR |ml|))))
               NIL |modemapList|))
      (COND
       (|$compUniquelyIfTrue|
        (COND
         (((LAMBDA (|bfVar#53| |bfVar#52| |mm|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#52|) (PROGN (SETQ |mm| (CAR |bfVar#52|)) NIL))
                (RETURN |bfVar#53|))
               (#1#
                (PROGN
                 (SETQ |bfVar#53| (|compFormWithModemap| |form| |m| |e| |mm|))
                 (COND (|bfVar#53| (RETURN |bfVar#53|))))))
              (SETQ |bfVar#52| (CDR |bfVar#52|))))
           NIL (CDR |mml|) NIL)
          (THROW '|compUniquely| NIL))
         (#1# T$)))
       (#1# T$))))))
 
; getFormModemaps(form is [op,:argl],e) ==
;   op is ["Sel", domain, op1] =>
;     [x for x in getFormModemaps([op1,:argl],e) | x is [[ =domain,:.],:.]]
;   null atom op => nil
;   modemapList:= get(op,"modemap",e)
;   if $insideCategoryPackageIfTrue then
;     modemapList := [x for x in modemapList | x is [[dom,:.],:.] and dom ~= '$]
;   if op = "elt" and #argl = 2 or op = "setelt!" and #argl = 3 then
;       modemapList := eltModemapFilter(argl.1, modemapList, e) or return nil
;   nargs:= #argl
;   finalModemapList:= [mm for (mm:= [[.,.,:sig],:.]) in modemapList | #sig=nargs]
;   modemapList and null finalModemapList =>
;     stackMessage ["no modemap for","%b",op,"%d","with ",nargs," arguments"]
;   finalModemapList
 
(DEFUN |getFormModemaps| (|form| |e|)
  (PROG (|op| |argl| |ISTMP#1| |domain| |ISTMP#2| |op1| |modemapList| |dom|
         |nargs| |sig| |finalModemapList|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (COND
       ((AND (CONSP |op|) (EQ (CAR |op|) '|Sel|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |op|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |domain| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |op1| (CAR |ISTMP#2|)) #1='T))))))
        ((LAMBDA (|bfVar#55| |bfVar#54| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#54|) (PROGN (SETQ |x| (CAR |bfVar#54|)) NIL))
              (RETURN (NREVERSE |bfVar#55|)))
             (#1#
              (AND (CONSP |x|)
                   (PROGN
                    (SETQ |ISTMP#1| (CAR |x|))
                    (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |domain|)))
                   (SETQ |bfVar#55| (CONS |x| |bfVar#55|)))))
            (SETQ |bfVar#54| (CDR |bfVar#54|))))
         NIL (|getFormModemaps| (CONS |op1| |argl|) |e|) NIL))
       ((NULL (ATOM |op|)) NIL)
       (#1#
        (PROGN
         (SETQ |modemapList| (|get| |op| '|modemap| |e|))
         (COND
          (|$insideCategoryPackageIfTrue|
           (SETQ |modemapList|
                   ((LAMBDA (|bfVar#57| |bfVar#56| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#56|)
                             (PROGN (SETQ |x| (CAR |bfVar#56|)) NIL))
                         (RETURN (NREVERSE |bfVar#57|)))
                        (#1#
                         (AND (CONSP |x|)
                              (PROGN
                               (SETQ |ISTMP#1| (CAR |x|))
                               (AND (CONSP |ISTMP#1|)
                                    (PROGN (SETQ |dom| (CAR |ISTMP#1|)) #1#)))
                              (NOT (EQ |dom| '$))
                              (SETQ |bfVar#57| (CONS |x| |bfVar#57|)))))
                       (SETQ |bfVar#56| (CDR |bfVar#56|))))
                    NIL |modemapList| NIL))))
         (COND
          ((OR (AND (EQ |op| '|elt|) (EQL (LENGTH |argl|) 2))
               (AND (EQ |op| '|setelt!|) (EQL (LENGTH |argl|) 3)))
           (SETQ |modemapList|
                   (OR (|eltModemapFilter| (ELT |argl| 1) |modemapList| |e|)
                       (RETURN NIL)))))
         (SETQ |nargs| (LENGTH |argl|))
         (SETQ |finalModemapList|
                 ((LAMBDA (|bfVar#59| |bfVar#58| |mm|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#58|)
                           (PROGN (SETQ |mm| (CAR |bfVar#58|)) NIL))
                       (RETURN (NREVERSE |bfVar#59|)))
                      (#1#
                       (AND (CONSP |mm|)
                            (PROGN
                             (SETQ |ISTMP#1| (CAR |mm|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (PROGN
                                         (SETQ |sig| (CDR |ISTMP#2|))
                                         #1#)))))
                            (EQL (LENGTH |sig|) |nargs|)
                            (SETQ |bfVar#59| (CONS |mm| |bfVar#59|)))))
                     (SETQ |bfVar#58| (CDR |bfVar#58|))))
                  NIL |modemapList| NIL))
         (COND
          ((AND |modemapList| (NULL |finalModemapList|))
           (|stackMessage|
            (LIST '|no modemap for| '|%b| |op| '|%d| '|with | |nargs|
                  '| arguments|)))
          (#1# |finalModemapList|)))))))))
 
; eltModemapFilter(name,mmList,e) ==
;   isConstantId(name,e) =>
;     l:= [mm for mm in mmList | mm is [[.,.,.,sel,:.],:.] and sel=name] => l
;             -- setelt! has extra parameter
;     stackMessage ["selector variable: ",name," is undeclared and unbound"]
;     nil
;   mmList
 
(DEFUN |eltModemapFilter| (|name| |mmList| |e|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |sel| |l|)
    (RETURN
     (COND
      ((|isConstantId| |name| |e|)
       (COND
        ((SETQ |l|
                 ((LAMBDA (|bfVar#61| |bfVar#60| |mm|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#60|)
                           (PROGN (SETQ |mm| (CAR |bfVar#60|)) NIL))
                       (RETURN (NREVERSE |bfVar#61|)))
                      (#1='T
                       (AND (CONSP |mm|)
                            (PROGN
                             (SETQ |ISTMP#1| (CAR |mm|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (PROGN
                                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                         (AND (CONSP |ISTMP#3|)
                                              (PROGN
                                               (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                               (AND (CONSP |ISTMP#4|)
                                                    (PROGN
                                                     (SETQ |sel|
                                                             (CAR |ISTMP#4|))
                                                     #1#)))))))))
                            (EQUAL |sel| |name|)
                            (SETQ |bfVar#61| (CONS |mm| |bfVar#61|)))))
                     (SETQ |bfVar#60| (CDR |bfVar#60|))))
                  NIL |mmList| NIL))
         |l|)
        (#1#
         (PROGN
          (|stackMessage|
           (LIST '|selector variable: | |name| '| is undeclared and unbound|))
          NIL))))
      (#1# |mmList|)))))
 
; substituteIntoFunctorModemap(argl,modemap is [[dc,:sig],:.],e) ==
;   #dc~=#sig =>
;     keyedSystemError("S2GE0016",['"substituteIntoFunctorModemap",
;       '"Incompatible maps"])
;   #argl=#rest sig =>
;                         --here, we actually have a functor form
;     sig:= EQSUBSTLIST(argl,rest dc,sig)
;       --make new modemap, subst. actual for formal parametersinto modemap
;     Tl:= [[.,.,e]:= compOrCroak(a,m,e) for a in argl for m in rest sig]
;     substitutionList:= [[x,:T.expr] for x in rest dc for T in Tl]
;     [SUBLIS(substitutionList,modemap),e]
;   nil
 
(DEFUN |substituteIntoFunctorModemap| (|argl| |modemap| |e|)
  (PROG (|dc| |sig| |LETTMP#1| |Tl| |substitutionList|)
    (RETURN
     (PROGN
      (SETQ |dc| (CAAR . #1=(|modemap|)))
      (SETQ |sig| (CDAR . #1#))
      (COND
       ((NOT (EQL (LENGTH |dc|) (LENGTH |sig|)))
        (|keyedSystemError| 'S2GE0016
         (LIST "substituteIntoFunctorModemap" "Incompatible maps")))
       ((EQL (LENGTH |argl|) (LENGTH (CDR |sig|)))
        (PROGN
         (SETQ |sig| (EQSUBSTLIST |argl| (CDR |dc|) |sig|))
         (SETQ |Tl|
                 ((LAMBDA (|bfVar#64| |bfVar#62| |a| |bfVar#63| |m|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#62|)
                           (PROGN (SETQ |a| (CAR |bfVar#62|)) NIL)
                           (ATOM |bfVar#63|)
                           (PROGN (SETQ |m| (CAR |bfVar#63|)) NIL))
                       (RETURN (NREVERSE |bfVar#64|)))
                      (#2='T
                       (SETQ |bfVar#64|
                               (CONS
                                (PROGN
                                 (SETQ |LETTMP#1| (|compOrCroak| |a| |m| |e|))
                                 (SETQ |e| (CADDR |LETTMP#1|))
                                 |LETTMP#1|)
                                |bfVar#64|))))
                     (SETQ |bfVar#62| (CDR |bfVar#62|))
                     (SETQ |bfVar#63| (CDR |bfVar#63|))))
                  NIL |argl| NIL (CDR |sig|) NIL))
         (SETQ |substitutionList|
                 ((LAMBDA (|bfVar#67| |bfVar#65| |x| |bfVar#66| T$)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#65|)
                           (PROGN (SETQ |x| (CAR |bfVar#65|)) NIL)
                           (ATOM |bfVar#66|)
                           (PROGN (SETQ T$ (CAR |bfVar#66|)) NIL))
                       (RETURN (NREVERSE |bfVar#67|)))
                      (#2#
                       (SETQ |bfVar#67|
                               (CONS (CONS |x| (CAR T$)) |bfVar#67|))))
                     (SETQ |bfVar#65| (CDR |bfVar#65|))
                     (SETQ |bfVar#66| (CDR |bfVar#66|))))
                  NIL (CDR |dc|) NIL |Tl| NIL))
         (LIST (SUBLIS |substitutionList| |modemap|) |e|)))
       (#2# NIL))))))
 
; compSetq(["LET",form,val],m,E) == compSetq1(form,val,m,E)
 
(DEFUN |compSetq| (|bfVar#68| |m| E)
  (PROG (|form| |val|)
    (RETURN
     (PROGN
      (SETQ |form| (CADR . #1=(|bfVar#68|)))
      (SETQ |val| (CADDR . #1#))
      (|compSetq1| |form| |val| |m| E)))))
 
; compSetq1(form,val,m,E) ==
;   IDENTP form => setqSingle(form,val,m,E)
;   form is [":",x,y] =>
;     [.,.,E']:= compMakeDeclaration(form,$EmptyMode,E)
;     compSetq(["LET",x,val],m,E')
;   form is [op,:l] =>
;     op="CONS"  => setqMultiple(uncons form,val,m,E)
;     op = "@Tuple" => setqMultiple(l, val, m, E)
;     setqSetelt(form,val,m,E)
 
(DEFUN |compSetq1| (|form| |val| |m| E)
  (PROG (|ISTMP#1| |x| |ISTMP#2| |y| |LETTMP#1| |E'| |op| |l|)
    (RETURN
     (COND ((IDENTP |form|) (|setqSingle| |form| |val| |m| E))
           ((AND (CONSP |form|) (EQ (CAR |form|) '|:|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |form|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |x| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1='T))))))
            (PROGN
             (SETQ |LETTMP#1| (|compMakeDeclaration| |form| |$EmptyMode| E))
             (SETQ |E'| (CADDR |LETTMP#1|))
             (|compSetq| (LIST 'LET |x| |val|) |m| |E'|)))
           ((AND (CONSP |form|)
                 (PROGN (SETQ |op| (CAR |form|)) (SETQ |l| (CDR |form|)) #1#))
            (COND
             ((EQ |op| 'CONS) (|setqMultiple| (|uncons| |form|) |val| |m| E))
             ((EQ |op| '|@Tuple|) (|setqMultiple| |l| |val| |m| E))
             (#1# (|setqSetelt| |form| |val| |m| E))))))))
 
; compMakeDeclaration(x,m,e) ==
;   $insideExpressionIfTrue: local := false
;   compColon(x,m,e)
 
(DEFUN |compMakeDeclaration| (|x| |m| |e|)
  (PROG (|$insideExpressionIfTrue|)
    (DECLARE (SPECIAL |$insideExpressionIfTrue|))
    (RETURN
     (PROGN (SETQ |$insideExpressionIfTrue| NIL) (|compColon| |x| |m| |e|)))))
 
; setqSetelt([v,:s],val,m,E) ==
;     comp(["setelt!", v, :s, val], m, E)
 
(DEFUN |setqSetelt| (|bfVar#69| |val| |m| E)
  (PROG (|v| |s|)
    (RETURN
     (PROGN
      (SETQ |v| (CAR |bfVar#69|))
      (SETQ |s| (CDR |bfVar#69|))
      (|comp| (CONS '|setelt!| (CONS |v| (APPEND |s| (CONS |val| NIL)))) |m|
       E)))))
 
; setqSingle(id,val,m,E) ==
;   $insideSetqSingleIfTrue: local:= true
;     --used for comping domain forms within functions
;   currentProplist:= getProplist(id,E)
;   m'':=
;     get(id,'mode,E) or getmode(id,E) or
;        (if m=$NoValueMode then $EmptyMode else m)
; -- m'':= LASSOC("mode",currentProplist) or $EmptyMode
;        --for above line to work, line 3 of compNoStackingis required
;   T:=
;     eval or return nil where
;       eval() ==
;         T:= comp(val,m'',E) => T
;         not get(id,"mode",E) and m'' ~= (maxm'':=maxSuperType(m'',E)) and
;            (T:=comp(val,maxm'',E)) => T
;         (T:= comp(val,$EmptyMode,E)) and getmode(T.mode,E) =>
;           assignError(val,T.mode,id,m'')
;   m'' = $EmptyMode and T.mode = $EmptyMode =>
;       stackMessage ["No mode in assignment to: ", id]
;   finish_setq_single(T, m, id, val, currentProplist)
 
(DEFUN |setqSingle| (|id| |val| |m| E)
  (PROG (|$insideSetqSingleIfTrue| |maxm''| T$ |m''| |currentProplist|)
    (DECLARE (SPECIAL |$insideSetqSingleIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$insideSetqSingleIfTrue| T)
      (SETQ |currentProplist| (|getProplist| |id| E))
      (SETQ |m''|
              (OR (|get| |id| '|mode| E) (|getmode| |id| E)
                  (COND ((EQUAL |m| |$NoValueMode|) |$EmptyMode|)
                        (#1='T |m|))))
      (SETQ T$
              (OR
               (COND ((SETQ T$ (|comp| |val| |m''| E)) T$)
                     ((AND (NULL (|get| |id| '|mode| E))
                           (NOT
                            (EQUAL |m''|
                                   (SETQ |maxm''| (|maxSuperType| |m''| E))))
                           (SETQ T$ (|comp| |val| |maxm''| E)))
                      T$)
                     ((AND (SETQ T$ (|comp| |val| |$EmptyMode| E))
                           (|getmode| (CADR T$) E))
                      (|assignError| |val| (CADR T$) |id| |m''|)))
               (RETURN NIL)))
      (COND
       ((AND (EQUAL |m''| |$EmptyMode|) (EQUAL (CADR T$) |$EmptyMode|))
        (|stackMessage| (LIST '|No mode in assignment to: | |id|)))
       (#1# (|finish_setq_single| T$ |m| |id| |val| |currentProplist|)))))))
 
; finish_setq_single(T, m, id, val, currentProplist) ==
;   T' := [x, m', e'] := convert(T, m) or return nil
;   if $profileCompiler = true then
;     null IDENTP id => nil
;     key :=
;       MEMQ(id,rest $form) => 'arguments
;       'locals
;     profileRecord(key,id,T.mode)
;   newProplist:= consProplistOf(id,currentProplist,"value",removeEnv [val,:rest T])
;   e':= (PAIRP id => e'; addBinding(id,newProplist,e'))
;   if isDomainForm(val,e') then
;     if isDomainInScope(id,e') then
;       stackWarning ["domain valued variable","%b",id,"%d",
;         "has been reassigned within its scope"]
;     e':= augModemapsFromDomain1(id,val,e')
;       --all we do now is to allocate a slot number for lhs
;       --e.g. the LET form below will be changed by putInLocalDomainReferences
; --+
;   saveLocVarsTypeDecl(x, id, e')
; 
;   if (k:=NRTassocIndex(id))
;      then form:=['SETELT,"$",k,x]
;      else form:=
;          $QuickLet => ["LET",id,x]
;          ["LET",id,x,
;             (isDomainForm(x, e') => ['ELT, id, 0]; first outputComp(id, e'))]
;   [form,m',e']
 
(DEFUN |finish_setq_single| (T$ |m| |id| |val| |currentProplist|)
  (PROG (|LETTMP#1| |x| |m'| |e'| |T'| |key| |newProplist| |k| |form|)
    (RETURN
     (PROGN
      (SETQ |T'|
              (PROGN
               (SETQ |LETTMP#1| (OR (|convert| T$ |m|) (RETURN NIL)))
               (SETQ |x| (CAR |LETTMP#1|))
               (SETQ |m'| (CADR . #1=(|LETTMP#1|)))
               (SETQ |e'| (CADDR . #1#))
               |LETTMP#1|))
      (COND
       ((EQUAL |$profileCompiler| T)
        (COND ((NULL (IDENTP |id|)) NIL)
              (#2='T
               (PROGN
                (SETQ |key|
                        (COND ((MEMQ |id| (CDR |$form|)) '|arguments|)
                              (#2# '|locals|)))
                (|profileRecord| |key| |id| (CADR T$)))))))
      (SETQ |newProplist|
              (|consProplistOf| |id| |currentProplist| '|value|
               (|removeEnv| (CONS |val| (CDR T$)))))
      (SETQ |e'|
              (COND ((CONSP |id|) |e'|)
                    (#2# (|addBinding| |id| |newProplist| |e'|))))
      (COND
       ((|isDomainForm| |val| |e'|)
        (COND
         ((|isDomainInScope| |id| |e'|)
          (|stackWarning|
           (LIST '|domain valued variable| '|%b| |id| '|%d|
                 '|has been reassigned within its scope|))))
        (SETQ |e'| (|augModemapsFromDomain1| |id| |val| |e'|))))
      (|saveLocVarsTypeDecl| |x| |id| |e'|)
      (COND
       ((SETQ |k| (|NRTassocIndex| |id|))
        (SETQ |form| (LIST 'SETELT '$ |k| |x|)))
       (#2#
        (SETQ |form|
                (COND (|$QuickLet| (LIST 'LET |id| |x|))
                      (#2#
                       (LIST 'LET |id| |x|
                             (COND
                              ((|isDomainForm| |x| |e'|) (LIST 'ELT |id| 0))
                              (#2# (CAR (|outputComp| |id| |e'|))))))))))
      (LIST |form| |m'| |e'|)))))
 
; saveLocVarsTypeDecl(x, id, e) ==
;     t := getmode(id, e) =>
;         t := (t = '$EmptyMode => nil; ATOM(t) => [t]; t)
;         typeDecl := ASSOC(id, $locVarsTypes)
;         null typeDecl =>
;             if null t then
;                 SAY("Local variable ", id, " lacks type.")
;             else $locVarsTypes := ACONS(id, t, $locVarsTypes)
;         t' := CDR(typeDecl)
;         not EQUAL(t, t') =>
;             if not null t' then
;                 SAY("Local variable ", id, " type redefined: ", t, " to ", t')
;             RPLACD(typeDecl, t)
 
(DEFUN |saveLocVarsTypeDecl| (|x| |id| |e|)
  (PROG (|t| |typeDecl| |t'|)
    (RETURN
     (COND
      ((SETQ |t| (|getmode| |id| |e|))
       (IDENTITY
        (PROGN
         (SETQ |t|
                 (COND ((EQ |t| '|$EmptyMode|) NIL) ((ATOM |t|) (LIST |t|))
                       (#1='T |t|)))
         (SETQ |typeDecl| (ASSOC |id| |$locVarsTypes|))
         (COND
          ((NULL |typeDecl|)
           (COND ((NULL |t|) (SAY '|Local variable | |id| '| lacks type.|))
                 (#1#
                  (SETQ |$locVarsTypes| (ACONS |id| |t| |$locVarsTypes|)))))
          (#1#
           (PROGN
            (SETQ |t'| (CDR |typeDecl|))
            (COND
             ((NULL (EQUAL |t| |t'|))
              (PROGN
               (COND
                ((NULL (NULL |t'|))
                 (SAY '|Local variable | |id| '| type redefined: | |t| '| to |
                  |t'|)))
               (RPLACD |typeDecl| |t|))))))))))))))
 
; assignError(val,m',form,m) ==
;   message:=
;     val =>
;       ["CANNOT ASSIGN: ",val,"%l","   OF MODE: ",m',"%l","   TO: ",form,"%l",
;         "   OF MODE: ",m]
;     ["CANNOT ASSIGN: ",val,"%l","   TO: ",form,"%l","   OF MODE: ",m]
;   stackMessage message
 
(DEFUN |assignError| (|val| |m'| |form| |m|)
  (PROG (|message|)
    (RETURN
     (PROGN
      (SETQ |message|
              (COND
               (|val|
                (LIST '|CANNOT ASSIGN: | |val| '|%l| '|   OF MODE: | |m'| '|%l|
                      '|   TO: | |form| '|%l| '|   OF MODE: | |m|))
               ('T
                (LIST '|CANNOT ASSIGN: | |val| '|%l| '|   TO: | |form| '|%l|
                      '|   OF MODE: | |m|))))
      (|stackMessage| |message|)))))
 
; MKPROGN(l) == MKPF(l, "PROGN")
 
(DEFUN MKPROGN (|l|) (PROG () (RETURN (MKPF |l| 'PROGN))))
 
; setqMultiple(nameList,val,m,e) ==
;   val is ["CONS",:.] and m=$NoValueMode =>
;     setqMultipleExplicit(nameList,uncons val,m,e)
;   val is ["@Tuple", :l] and m = $NoValueMode =>
;       setqMultipleExplicit(nameList,l,m,e)
;   -- 1 create a gensym, add to local environment, compile and assign rhs
;   g:= genVariable()
;   e:= addBinding(g,nil,e)
;   T:= [.,m1,.]:= compSetq1(g,val,$EmptyMode,e) or return nil
;   e:= put(g,"mode",m1,e)
;   [x,m',e]:= convert(T,m) or return nil
;   -- 1.1 exit if result is a list
;   m1 is ["List",D] =>
;     g2 := genVariable()
;     e := addBinding(g2, nil, e)
;     e := put(g2, "mode", m1, e)
;     T := compSetq1(g2, g, m1, e) or return nil
;     [x2, ., e] := convert(T, m1) or return nil
;     ass_list := []
;     for y in nameList repeat
;         e := put(y, "value", [genSomeVariable(), D, $noEnv], e)
;         ass_list := cons(["LET", y, ["SPADfirst", g2]], ass_list)
;         ass_list := cons(["LET", g2, ["CDR", g2]], ass_list)
;     ass_list := nreverse(rest(ass_list))
;     convert([["PROGN",x, x2, :ass_list, g], m', e], m)
;   -- 2 verify that the #nameList = number of parts of right-hand-side
;   selectorModePairs:=
;                                                 --list of modes
;     decompose(m1,#nameList,e) or return nil where
;       decompose(t,length,e) ==
;         t is ["Record",:l] => [[name,:mode] for [":",name,mode] in l]
;         comp(t,$EmptyMode,e) is [.,["RecordCategory",:l],.] =>
;           [[name,:mode] for [":",name,mode] in l]
;         stackMessage ["no multiple assigns to mode: ",t]
;   #nameList~=#selectorModePairs =>
;     stackMessage [val," must decompose into ",#nameList," components"]
;   -- 3 generate code; return
;   assignList:=
;     [([.,.,e]:= compSetq1(x,["elt",g,y],z,e) or return "failed").expr
;       for x in nameList for [y,:z] in selectorModePairs]
;   if assignList="failed" then NIL
;   else [MKPROGN [x,:assignList,g],m',e]
 
(DEFUN |setqMultiple| (|nameList| |val| |m| |e|)
  (PROG (|l| |g| |LETTMP#1| |m1| T$ |x| |m'| |ISTMP#1| D |g2| |x2| |ass_list|
         |selectorModePairs| |y| |z| |assignList|)
    (RETURN
     (COND
      ((AND (CONSP |val|) (EQ (CAR |val|) 'CONS) (EQUAL |m| |$NoValueMode|))
       (|setqMultipleExplicit| |nameList| (|uncons| |val|) |m| |e|))
      ((AND (CONSP |val|) (EQ (CAR |val|) '|@Tuple|)
            (PROGN (SETQ |l| (CDR |val|)) #1='T) (EQUAL |m| |$NoValueMode|))
       (|setqMultipleExplicit| |nameList| |l| |m| |e|))
      (#1#
       (PROGN
        (SETQ |g| (|genVariable|))
        (SETQ |e| (|addBinding| |g| NIL |e|))
        (SETQ T$
                (PROGN
                 (SETQ |LETTMP#1|
                         (OR (|compSetq1| |g| |val| |$EmptyMode| |e|)
                             (RETURN NIL)))
                 (SETQ |m1| (CADR |LETTMP#1|))
                 |LETTMP#1|))
        (SETQ |e| (|put| |g| '|mode| |m1| |e|))
        (SETQ |LETTMP#1| (OR (|convert| T$ |m|) (RETURN NIL)))
        (SETQ |x| (CAR |LETTMP#1|))
        (SETQ |m'| (CADR . #2=(|LETTMP#1|)))
        (SETQ |e| (CADDR . #2#))
        (COND
         ((AND (CONSP |m1|) (EQ (CAR |m1|) '|List|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |m1|))
                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                     (PROGN (SETQ D (CAR |ISTMP#1|)) #1#))))
          (PROGN
           (SETQ |g2| (|genVariable|))
           (SETQ |e| (|addBinding| |g2| NIL |e|))
           (SETQ |e| (|put| |g2| '|mode| |m1| |e|))
           (SETQ T$ (OR (|compSetq1| |g2| |g| |m1| |e|) (RETURN NIL)))
           (SETQ |LETTMP#1| (OR (|convert| T$ |m1|) (RETURN NIL)))
           (SETQ |x2| (CAR |LETTMP#1|))
           (SETQ |e| (CADDR |LETTMP#1|))
           (SETQ |ass_list| NIL)
           ((LAMBDA (|bfVar#70| |y|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#70|) (PROGN (SETQ |y| (CAR |bfVar#70|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |e|
                          (|put| |y| '|value|
                           (LIST (|genSomeVariable|) D |$noEnv|) |e|))
                  (SETQ |ass_list|
                          (CONS (LIST 'LET |y| (LIST '|SPADfirst| |g2|))
                                |ass_list|))
                  (SETQ |ass_list|
                          (CONS (LIST 'LET |g2| (LIST 'CDR |g2|))
                                |ass_list|)))))
               (SETQ |bfVar#70| (CDR |bfVar#70|))))
            |nameList| NIL)
           (SETQ |ass_list| (NREVERSE (CDR |ass_list|)))
           (|convert|
            (LIST
             (CONS 'PROGN
                   (CONS |x| (CONS |x2| (APPEND |ass_list| (CONS |g| NIL)))))
             |m'| |e|)
            |m|)))
         (#1#
          (PROGN
           (SETQ |selectorModePairs|
                   (OR (|setqMultiple,decompose| |m1| (LENGTH |nameList|) |e|)
                       (RETURN NIL)))
           (COND
            ((NOT (EQL (LENGTH |nameList|) (LENGTH |selectorModePairs|)))
             (|stackMessage|
              (LIST |val| '| must decompose into | (LENGTH |nameList|)
                    '| components|)))
            (#1#
             (PROGN
              (SETQ |assignList|
                      ((LAMBDA
                           (|bfVar#80| |bfVar#77| |x| |bfVar#79| |bfVar#78|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#77|)
                                (PROGN (SETQ |x| (CAR |bfVar#77|)) NIL)
                                (ATOM |bfVar#79|)
                                (PROGN (SETQ |bfVar#78| (CAR |bfVar#79|)) NIL))
                            (RETURN (NREVERSE |bfVar#80|)))
                           (#1#
                            (AND (CONSP |bfVar#78|)
                                 (PROGN
                                  (SETQ |y| (CAR |bfVar#78|))
                                  (SETQ |z| (CDR |bfVar#78|))
                                  #1#)
                                 (SETQ |bfVar#80|
                                         (CONS
                                          (CAR
                                           (PROGN
                                            (SETQ |LETTMP#1|
                                                    (OR
                                                     (|compSetq1| |x|
                                                      (LIST '|elt| |g| |y|) |z|
                                                      |e|)
                                                     (RETURN '|failed|)))
                                            (SETQ |e| (CADDR |LETTMP#1|))
                                            |LETTMP#1|))
                                          |bfVar#80|)))))
                          (SETQ |bfVar#77| (CDR |bfVar#77|))
                          (SETQ |bfVar#79| (CDR |bfVar#79|))))
                       NIL |nameList| NIL |selectorModePairs| NIL))
              (COND ((EQ |assignList| '|failed|) NIL)
                    (#1#
                     (LIST
                      (MKPROGN (CONS |x| (APPEND |assignList| (CONS |g| NIL))))
                      |m'| |e|)))))))))))))))
(DEFUN |setqMultiple,decompose| (|t| |length| |e|)
  (PROG (|l| |ISTMP#1| |name| |ISTMP#2| |mode| |ISTMP#3| |ISTMP#4|)
    (RETURN
     (COND
      ((AND (CONSP |t|) (EQ (CAR |t|) '|Record|)
            (PROGN (SETQ |l| (CDR |t|)) #1='T))
       ((LAMBDA (|bfVar#73| |bfVar#72| |bfVar#71|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#72|)
                 (PROGN (SETQ |bfVar#71| (CAR |bfVar#72|)) NIL))
             (RETURN (NREVERSE |bfVar#73|)))
            (#1#
             (AND (CONSP |bfVar#71|) (EQ (CAR |bfVar#71|) '|:|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |bfVar#71|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |name| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |mode| (CAR |ISTMP#2|)) #1#)))))
                  (SETQ |bfVar#73| (CONS (CONS |name| |mode|) |bfVar#73|)))))
           (SETQ |bfVar#72| (CDR |bfVar#72|))))
        NIL |l| NIL))
      ((PROGN
        (SETQ |ISTMP#1| (|comp| |t| |$EmptyMode| |e|))
        (AND (CONSP |ISTMP#1|)
             (PROGN
              (SETQ |ISTMP#2| (CDR |ISTMP#1|))
              (AND (CONSP |ISTMP#2|)
                   (PROGN
                    (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                    (AND (CONSP |ISTMP#3|)
                         (EQ (CAR |ISTMP#3|) '|RecordCategory|)
                         (PROGN (SETQ |l| (CDR |ISTMP#3|)) #1#)))
                   (PROGN
                    (SETQ |ISTMP#4| (CDR |ISTMP#2|))
                    (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)))))))
       ((LAMBDA (|bfVar#76| |bfVar#75| |bfVar#74|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#75|)
                 (PROGN (SETQ |bfVar#74| (CAR |bfVar#75|)) NIL))
             (RETURN (NREVERSE |bfVar#76|)))
            (#1#
             (AND (CONSP |bfVar#74|) (EQ (CAR |bfVar#74|) '|:|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |bfVar#74|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |name| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |mode| (CAR |ISTMP#2|)) #1#)))))
                  (SETQ |bfVar#76| (CONS (CONS |name| |mode|) |bfVar#76|)))))
           (SETQ |bfVar#75| (CDR |bfVar#75|))))
        NIL |l| NIL))
      (#1# (|stackMessage| (LIST '|no multiple assigns to mode: | |t|)))))))
 
; setqMultipleExplicit(nameList,valList,m,e) ==
;   #nameList~=#valList =>
;     stackMessage ["Multiple assignment error; # of items in: ",nameList,
;       "must = # in: ",valList]
;   gensymList:= [genVariable() for name in nameList]
;   assignList:=
;              --should be fixed to declare genVar when possible
;     [[.,.,e]:= compSetq1(g,val,$EmptyMode,e) or return "failed"
;       for g in gensymList for val in valList]
;   assignList="failed" => nil
;   reAssignList:=
;     [[.,.,e]:= compSetq1(name,g,$EmptyMode,e) or return "failed"
;       for g in gensymList for name in nameList]
;   reAssignList="failed" => nil
;   [["PROGN",:[T.expr for T in assignList],:[T.expr for T in reAssignList]],
;     $NoValueMode, (last reAssignList).env]
 
(DEFUN |setqMultipleExplicit| (|nameList| |valList| |m| |e|)
  (PROG (|gensymList| |LETTMP#1| |assignList| |reAssignList|)
    (RETURN
     (COND
      ((NOT (EQL (LENGTH |nameList|) (LENGTH |valList|)))
       (|stackMessage|
        (LIST '|Multiple assignment error; # of items in: | |nameList|
              '|must = # in: | |valList|)))
      (#1='T
       (PROGN
        (SETQ |gensymList|
                ((LAMBDA (|bfVar#82| |bfVar#81| |name|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#81|)
                          (PROGN (SETQ |name| (CAR |bfVar#81|)) NIL))
                      (RETURN (NREVERSE |bfVar#82|)))
                     (#1# (SETQ |bfVar#82| (CONS (|genVariable|) |bfVar#82|))))
                    (SETQ |bfVar#81| (CDR |bfVar#81|))))
                 NIL |nameList| NIL))
        (SETQ |assignList|
                ((LAMBDA (|bfVar#85| |bfVar#83| |g| |bfVar#84| |val|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#83|)
                          (PROGN (SETQ |g| (CAR |bfVar#83|)) NIL)
                          (ATOM |bfVar#84|)
                          (PROGN (SETQ |val| (CAR |bfVar#84|)) NIL))
                      (RETURN (NREVERSE |bfVar#85|)))
                     (#1#
                      (SETQ |bfVar#85|
                              (CONS
                               (PROGN
                                (SETQ |LETTMP#1|
                                        (OR
                                         (|compSetq1| |g| |val| |$EmptyMode|
                                          |e|)
                                         (RETURN '|failed|)))
                                (SETQ |e| (CADDR |LETTMP#1|))
                                |LETTMP#1|)
                               |bfVar#85|))))
                    (SETQ |bfVar#83| (CDR |bfVar#83|))
                    (SETQ |bfVar#84| (CDR |bfVar#84|))))
                 NIL |gensymList| NIL |valList| NIL))
        (COND ((EQ |assignList| '|failed|) NIL)
              (#1#
               (PROGN
                (SETQ |reAssignList|
                        ((LAMBDA (|bfVar#88| |bfVar#86| |g| |bfVar#87| |name|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#86|)
                                  (PROGN (SETQ |g| (CAR |bfVar#86|)) NIL)
                                  (ATOM |bfVar#87|)
                                  (PROGN (SETQ |name| (CAR |bfVar#87|)) NIL))
                              (RETURN (NREVERSE |bfVar#88|)))
                             (#1#
                              (SETQ |bfVar#88|
                                      (CONS
                                       (PROGN
                                        (SETQ |LETTMP#1|
                                                (OR
                                                 (|compSetq1| |name| |g|
                                                  |$EmptyMode| |e|)
                                                 (RETURN '|failed|)))
                                        (SETQ |e| (CADDR |LETTMP#1|))
                                        |LETTMP#1|)
                                       |bfVar#88|))))
                            (SETQ |bfVar#86| (CDR |bfVar#86|))
                            (SETQ |bfVar#87| (CDR |bfVar#87|))))
                         NIL |gensymList| NIL |nameList| NIL))
                (COND ((EQ |reAssignList| '|failed|) NIL)
                      (#1#
                       (LIST
                        (CONS 'PROGN
                              (APPEND
                               ((LAMBDA (|bfVar#90| |bfVar#89| T$)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#89|)
                                         (PROGN
                                          (SETQ T$ (CAR |bfVar#89|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#90|)))
                                    (#1#
                                     (SETQ |bfVar#90|
                                             (CONS (CAR T$) |bfVar#90|))))
                                   (SETQ |bfVar#89| (CDR |bfVar#89|))))
                                NIL |assignList| NIL)
                               ((LAMBDA (|bfVar#92| |bfVar#91| T$)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#91|)
                                         (PROGN
                                          (SETQ T$ (CAR |bfVar#91|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#92|)))
                                    (#1#
                                     (SETQ |bfVar#92|
                                             (CONS (CAR T$) |bfVar#92|))))
                                   (SETQ |bfVar#91| (CDR |bfVar#91|))))
                                NIL |reAssignList| NIL)))
                        |$NoValueMode|
                        (CADDR (|last| |reAssignList|))))))))))))))
 
; compWhere([.,form,:exprList],m,eInit) ==
;   $insideExpressionIfTrue: local:= false
;   $insideWhereIfTrue: local:= true
;   e:= eInit
;   u:=
;     for item in exprList repeat
;       [.,.,e]:= comp(item,$EmptyMode,e) or return "failed"
;   u="failed" => return nil
;   $insideWhereIfTrue:= false
;   [x,m,eAfter]:= comp(macroExpand(form,eBefore:= e),m,e) or return nil
;   eFinal:=
;     del:= deltaContour(eAfter,eBefore) => addContour(del,eInit)
;     eInit
;   [x,m,eFinal]
 
(DEFUN |compWhere| (|bfVar#94| |m| |eInit|)
  (PROG (|$insideWhereIfTrue| |$insideExpressionIfTrue| |eFinal| |del| |eAfter|
         |x| |eBefore| |u| |LETTMP#1| |e| |exprList| |form|)
    (DECLARE (SPECIAL |$insideWhereIfTrue| |$insideExpressionIfTrue|))
    (RETURN
     (PROGN
      (SETQ |form| (CADR . #1=(|bfVar#94|)))
      (SETQ |exprList| (CDDR . #1#))
      (SETQ |$insideExpressionIfTrue| NIL)
      (SETQ |$insideWhereIfTrue| T)
      (SETQ |e| |eInit|)
      (SETQ |u|
              ((LAMBDA (|bfVar#93| |item|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#93|)
                        (PROGN (SETQ |item| (CAR |bfVar#93|)) NIL))
                    (RETURN NIL))
                   (#2='T
                    (PROGN
                     (SETQ |LETTMP#1|
                             (OR (|comp| |item| |$EmptyMode| |e|)
                                 (RETURN '|failed|)))
                     (SETQ |e| (CADDR |LETTMP#1|))
                     |LETTMP#1|)))
                  (SETQ |bfVar#93| (CDR |bfVar#93|))))
               |exprList| NIL))
      (COND ((EQ |u| '|failed|) (RETURN NIL))
            (#2#
             (PROGN
              (SETQ |$insideWhereIfTrue| NIL)
              (SETQ |LETTMP#1|
                      (OR
                       (|comp| (|macroExpand| |form| (SETQ |eBefore| |e|)) |m|
                        |e|)
                       (RETURN NIL)))
              (SETQ |x| (CAR |LETTMP#1|))
              (SETQ |m| (CADR . #3=(|LETTMP#1|)))
              (SETQ |eAfter| (CADDR . #3#))
              (SETQ |eFinal|
                      (COND
                       ((SETQ |del| (|deltaContour| |eAfter| |eBefore|))
                        (|addContour| |del| |eInit|))
                       (#2# |eInit|)))
              (LIST |x| |m| |eFinal|))))))))
 
; compConstruct(form is ["construct",:l],m,e) ==
;   y:= modeIsAggregateOf("List",m,e) =>
;     T:= compList(l,["List",CADR y],e) => convert(T,m)
;     compForm(form,m,e)
;   y:= modeIsAggregateOf("Vector",m,e) =>
;     T:= compVector(l,["Vector",CADR y],e) => convert(T,m)
;     compForm(form,m,e)
;   T:= compForm(form,m,e) => T
;   for D in getDomainsInScope e repeat
;     (y:=modeIsAggregateOf("List",D,e)) and
;       (T:= compList(l,["List",CADR y],e)) and (T':= convert(T,m)) =>
;          return T'
;     (y:=modeIsAggregateOf("Vector",D,e)) and
;       (T:= compVector(l,["Vector",CADR y],e)) and (T':= convert(T,m)) =>
;          return T'
 
(DEFUN |compConstruct| (|form| |m| |e|)
  (PROG (|l| |y| T$ |T'|)
    (RETURN
     (PROGN
      (SETQ |l| (CDR |form|))
      (COND
       ((SETQ |y| (|modeIsAggregateOf| '|List| |m| |e|))
        (COND
         ((SETQ T$ (|compList| |l| (LIST '|List| (CADR |y|)) |e|))
          (|convert| T$ |m|))
         (#1='T (|compForm| |form| |m| |e|))))
       ((SETQ |y| (|modeIsAggregateOf| '|Vector| |m| |e|))
        (COND
         ((SETQ T$ (|compVector| |l| (LIST '|Vector| (CADR |y|)) |e|))
          (|convert| T$ |m|))
         (#1# (|compForm| |form| |m| |e|))))
       ((SETQ T$ (|compForm| |form| |m| |e|)) T$)
       (#1#
        ((LAMBDA (|bfVar#95| D)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#95|) (PROGN (SETQ D (CAR |bfVar#95|)) NIL))
              (RETURN NIL))
             (#1#
              (COND
               ((AND (SETQ |y| (|modeIsAggregateOf| '|List| D |e|))
                     (SETQ T$ (|compList| |l| (LIST '|List| (CADR |y|)) |e|))
                     (SETQ |T'| (|convert| T$ |m|)))
                (RETURN |T'|))
               ((AND (SETQ |y| (|modeIsAggregateOf| '|Vector| D |e|))
                     (SETQ T$
                             (|compVector| |l| (LIST '|Vector| (CADR |y|))
                              |e|))
                     (SETQ |T'| (|convert| T$ |m|)))
                (RETURN |T'|)))))
            (SETQ |bfVar#95| (CDR |bfVar#95|))))
         (|getDomainsInScope| |e|) NIL)))))))
 
; compQuote(expr is [QUOTE, e1], m, e) ==
;   SYMBOLP(e1) => [expr, ["Symbol"], e]
;   stackAndThrow ["Strange argument to QUOTE", expr]
 
(DEFUN |compQuote| (|expr| |m| |e|)
  (PROG (QUOTE |e1|)
    (RETURN
     (PROGN
      (SETQ QUOTE (CAR |expr|))
      (SETQ |e1| (CADR |expr|))
      (COND ((SYMBOLP |e1|) (LIST |expr| (LIST '|Symbol|) |e|))
            ('T
             (|stackAndThrow| (LIST '|Strange argument to QUOTE| |expr|))))))))
 
; compList(l,m is ["List",mUnder],e) ==
;   null l => [NIL,m,e]
;   Tl:= [[.,mUnder,e]:= comp(x,mUnder,e) or return "failed" for x in l]
;   Tl="failed" => nil
;   T:= [["LIST",:[T.expr for T in Tl]],["List",mUnder],e]
 
(DEFUN |compList| (|l| |m| |e|)
  (PROG (|mUnder| |LETTMP#1| |Tl| T$)
    (RETURN
     (PROGN
      (SETQ |mUnder| (CADR |m|))
      (COND ((NULL |l|) (LIST NIL |m| |e|))
            (#1='T
             (PROGN
              (SETQ |Tl|
                      ((LAMBDA (|bfVar#97| |bfVar#96| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#96|)
                                (PROGN (SETQ |x| (CAR |bfVar#96|)) NIL))
                            (RETURN (NREVERSE |bfVar#97|)))
                           (#1#
                            (SETQ |bfVar#97|
                                    (CONS
                                     (PROGN
                                      (SETQ |LETTMP#1|
                                              (OR (|comp| |x| |mUnder| |e|)
                                                  (RETURN '|failed|)))
                                      (SETQ |mUnder| (CADR . #2=(|LETTMP#1|)))
                                      (SETQ |e| (CADDR . #2#))
                                      |LETTMP#1|)
                                     |bfVar#97|))))
                          (SETQ |bfVar#96| (CDR |bfVar#96|))))
                       NIL |l| NIL))
              (COND ((EQ |Tl| '|failed|) NIL)
                    (#1#
                     (SETQ T$
                             (LIST
                              (CONS 'LIST
                                    ((LAMBDA (|bfVar#99| |bfVar#98| T$)
                                       (LOOP
                                        (COND
                                         ((OR (ATOM |bfVar#98|)
                                              (PROGN
                                               (SETQ T$ (CAR |bfVar#98|))
                                               NIL))
                                          (RETURN (NREVERSE |bfVar#99|)))
                                         (#1#
                                          (SETQ |bfVar#99|
                                                  (CONS (CAR T$) |bfVar#99|))))
                                        (SETQ |bfVar#98| (CDR |bfVar#98|))))
                                     NIL |Tl| NIL))
                              (LIST '|List| |mUnder|) |e|)))))))))))
 
; compVector(l,m is ["Vector",mUnder],e) ==
;   null l => [$EmptyVector,m,e]
;   Tl:= [[.,mUnder,e]:= comp(x,mUnder,e) or return "failed" for x in l]
;   Tl="failed" => nil
;   [["VECTOR",:[T.expr for T in Tl]],m,e]
 
(DEFUN |compVector| (|l| |m| |e|)
  (PROG (|mUnder| |LETTMP#1| |Tl|)
    (RETURN
     (PROGN
      (SETQ |mUnder| (CADR |m|))
      (COND ((NULL |l|) (LIST |$EmptyVector| |m| |e|))
            (#1='T
             (PROGN
              (SETQ |Tl|
                      ((LAMBDA (|bfVar#101| |bfVar#100| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#100|)
                                (PROGN (SETQ |x| (CAR |bfVar#100|)) NIL))
                            (RETURN (NREVERSE |bfVar#101|)))
                           (#1#
                            (SETQ |bfVar#101|
                                    (CONS
                                     (PROGN
                                      (SETQ |LETTMP#1|
                                              (OR (|comp| |x| |mUnder| |e|)
                                                  (RETURN '|failed|)))
                                      (SETQ |mUnder| (CADR . #2=(|LETTMP#1|)))
                                      (SETQ |e| (CADDR . #2#))
                                      |LETTMP#1|)
                                     |bfVar#101|))))
                          (SETQ |bfVar#100| (CDR |bfVar#100|))))
                       NIL |l| NIL))
              (COND ((EQ |Tl| '|failed|) NIL)
                    (#1#
                     (LIST
                      (CONS 'VECTOR
                            ((LAMBDA (|bfVar#103| |bfVar#102| T$)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#102|)
                                      (PROGN (SETQ T$ (CAR |bfVar#102|)) NIL))
                                  (RETURN (NREVERSE |bfVar#103|)))
                                 (#1#
                                  (SETQ |bfVar#103|
                                          (CONS (CAR T$) |bfVar#103|))))
                                (SETQ |bfVar#102| (CDR |bfVar#102|))))
                             NIL |Tl| NIL))
                      |m| |e|))))))))))
 
; compMacro(form,m,e) ==
;   ["MDEF",lhs,signature,specialCases,rhs]:= form
;   prhs :=
;     rhs is ['CATEGORY,:.] => ['"-- the constructor category"]
;     rhs is ['Join,:.]     => ['"-- the constructor category"]
;     rhs is ['CAPSULE,:.]  => ['"-- the constructor capsule"]
;     rhs is ['add,:.]      => ['"-- the constructor capsule"]
;     formatUnabbreviated rhs
;   sayBrightly ['"   processing macro definition",'%b,
;     :formatUnabbreviated lhs,'" ==> ",:prhs,'%d]
;   ATOM(lhs) => userError("Malformed macro definition")
;   nrhs :=
;       (margs := rest(lhs)) => [rhs, :margs]
;       [rhs]
;   m=$EmptyMode or m=$NoValueMode =>
;     ["/throwAway", $NoValueMode, put(first lhs, "macro", nrhs, e)]
 
(DEFUN |compMacro| (|form| |m| |e|)
  (PROG (|lhs| |signature| |specialCases| |rhs| |prhs| |margs| |nrhs|)
    (RETURN
     (PROGN
      (SETQ |lhs| (CADR . #1=(|form|)))
      (SETQ |signature| (CADDR . #1#))
      (SETQ |specialCases| (CADDDR . #1#))
      (SETQ |rhs| (CAR (CDDDDR . #1#)))
      (SETQ |prhs|
              (COND
               ((AND (CONSP |rhs|) (EQ (CAR |rhs|) 'CATEGORY))
                (LIST "-- the constructor category"))
               ((AND (CONSP |rhs|) (EQ (CAR |rhs|) '|Join|))
                (LIST "-- the constructor category"))
               ((AND (CONSP |rhs|) (EQ (CAR |rhs|) 'CAPSULE))
                (LIST "-- the constructor capsule"))
               ((AND (CONSP |rhs|) (EQ (CAR |rhs|) '|add|))
                (LIST "-- the constructor capsule"))
               (#2='T (|formatUnabbreviated| |rhs|))))
      (|sayBrightly|
       (CONS "   processing macro definition"
             (CONS '|%b|
                   (APPEND (|formatUnabbreviated| |lhs|)
                           (CONS " ==> " (APPEND |prhs| (CONS '|%d| NIL)))))))
      (COND ((ATOM |lhs|) (|userError| '|Malformed macro definition|))
            (#2#
             (PROGN
              (SETQ |nrhs|
                      (COND ((SETQ |margs| (CDR |lhs|)) (CONS |rhs| |margs|))
                            (#2# (LIST |rhs|))))
              (COND
               ((OR (EQUAL |m| |$EmptyMode|) (EQUAL |m| |$NoValueMode|))
                (LIST '|/throwAway| |$NoValueMode|
                      (|put| (CAR |lhs|) '|macro| |nrhs| |e|)))))))))))
 
; compSeq(["SEQ",:l],m,e) == compSeq1(l,[m,:$exitModeStack],e)
 
(DEFUN |compSeq| (|bfVar#104| |m| |e|)
  (PROG (|l|)
    (RETURN
     (PROGN
      (SETQ |l| (CDR |bfVar#104|))
      (|compSeq1| |l| (CONS |m| |$exitModeStack|) |e|)))))
 
; compSeq1(l,$exitModeStack,e) ==
;   $insideExpressionIfTrue: local := false
;   $finalEnv: local := false
;            --used in replaceExitEtc.
;   c:=
;     [([.,.,e]:=
; 
; 
;       --this used to be compOrCroak-- but changed so we can back out
; 
;         ($insideExpressionIfTrue:= NIL; compSeqItem(x,$NoValueMode,e) or return
;           "failed")).expr for x in l]
;   if c="failed" then return nil
;   catchTag:= MKQ GENSYM()
;   form:= ["SEQ",:replaceExitEtc(c,catchTag,"TAGGEDexit",$exitModeStack.(0))]
;   [["CATCH",catchTag,form],$exitModeStack.(0),$finalEnv]
 
(DEFUN |compSeq1| (|l| |$exitModeStack| |e|)
  (DECLARE (SPECIAL |$exitModeStack|))
  (PROG (|$finalEnv| |$insideExpressionIfTrue| |form| |catchTag| |c|
         |LETTMP#1|)
    (DECLARE (SPECIAL |$finalEnv| |$insideExpressionIfTrue|))
    (RETURN
     (PROGN
      (SETQ |$insideExpressionIfTrue| NIL)
      (SETQ |$finalEnv| NIL)
      (SETQ |c|
              ((LAMBDA (|bfVar#106| |bfVar#105| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#105|)
                        (PROGN (SETQ |x| (CAR |bfVar#105|)) NIL))
                    (RETURN (NREVERSE |bfVar#106|)))
                   ('T
                    (SETQ |bfVar#106|
                            (CONS
                             (CAR
                              (PROGN
                               (SETQ |LETTMP#1|
                                       (PROGN
                                        (SETQ |$insideExpressionIfTrue| NIL)
                                        (OR
                                         (|compSeqItem| |x| |$NoValueMode| |e|)
                                         (RETURN '|failed|))))
                               (SETQ |e| (CADDR |LETTMP#1|))
                               |LETTMP#1|))
                             |bfVar#106|))))
                  (SETQ |bfVar#105| (CDR |bfVar#105|))))
               NIL |l| NIL))
      (COND ((EQ |c| '|failed|) (RETURN NIL)))
      (SETQ |catchTag| (MKQ (GENSYM)))
      (SETQ |form|
              (CONS 'SEQ
                    (|replaceExitEtc| |c| |catchTag| '|TAGGEDexit|
                     (ELT |$exitModeStack| 0))))
      (LIST (LIST 'CATCH |catchTag| |form|) (ELT |$exitModeStack| 0)
            |$finalEnv|)))))
 
; compSeqItem(x,m,e) == comp(macroExpand(x,e),m,e)
 
(DEFUN |compSeqItem| (|x| |m| |e|)
  (PROG () (RETURN (|comp| (|macroExpand| |x| |e|) |m| |e|))))
 
; replaceExitEtc(x,tag,opFlag,opMode) ==
;   (fn(x,tag,opFlag,opMode); x) where
;     fn(x,tag,opFlag,opMode) ==
;       atom x => nil
;       x is ["QUOTE",:.] => nil
;       x is [ =opFlag,n,t] =>
;         rplac(first t,replaceExitEtc(first t, tag, opFlag, opMode))
;         n = 0 =>
;           $finalEnv:=
;                   --bound in compSeq1 and compDefineCapsuleFunction
;             $finalEnv => intersectionEnvironment($finalEnv,t.env)
;             t.env
;           rplac(first x,"THROW")
;           rplac(CADR x,tag)
;           rplac(CADDR x,(convertOrCroak(t,opMode)).expr)
;         true => rplac(CADR x,CADR x-1)
;       x is [key,n,t] and MEMQ(key,'(TAGGEDreturn TAGGEDexit)) =>
;         rplac(first t,replaceExitEtc(first t,tag,opFlag,opMode))
;       replaceExitEtc(first x,tag,opFlag,opMode)
;       replaceExitEtc(rest x,tag,opFlag,opMode)
 
(DEFUN |replaceExitEtc| (|x| |tag| |opFlag| |opMode|)
  (PROG ()
    (RETURN (PROGN (|replaceExitEtc,fn| |x| |tag| |opFlag| |opMode|) |x|))))
(DEFUN |replaceExitEtc,fn| (|x| |tag| |opFlag| |opMode|)
  (PROG (|ISTMP#1| |n| |ISTMP#2| |t| |key|)
    (RETURN
     (COND ((ATOM |x|) NIL) ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)) NIL)
           ((AND (CONSP |x|) (EQUAL (CAR |x|) |opFlag|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |n| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1='T))))))
            (PROGN
             (|rplac| (CAR |t|)
              (|replaceExitEtc| (CAR |t|) |tag| |opFlag| |opMode|))
             (COND
              ((EQL |n| 0)
               (PROGN
                (SETQ |$finalEnv|
                        (COND
                         (|$finalEnv|
                          (|intersectionEnvironment| |$finalEnv| (CADDR |t|)))
                         (#1# (CADDR |t|))))
                (|rplac| (CAR |x|) 'THROW)
                (|rplac| (CADR |x|) |tag|)
                (|rplac| (CADDR |x|) (CAR (|convertOrCroak| |t| |opMode|)))))
              (T (|rplac| (CADR |x|) (- (CADR |x|) 1))))))
           ((AND (CONSP |x|)
                 (PROGN
                  (SETQ |key| (CAR |x|))
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |n| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1#)))))
                 (MEMQ |key| '(|TAGGEDreturn| |TAGGEDexit|)))
            (|rplac| (CAR |t|)
             (|replaceExitEtc| (CAR |t|) |tag| |opFlag| |opMode|)))
           (#1#
            (PROGN
             (|replaceExitEtc| (CAR |x|) |tag| |opFlag| |opMode|)
             (|replaceExitEtc| (CDR |x|) |tag| |opFlag| |opMode|)))))))
 
; comp_try(["try", expr, catcher, finallizer], m, e) ==
;     $exitModeStack : local := [m, :$exitModeStack]
;     $insideExpressionIfTrue : local := false
;     if catcher then
;         stackAndThrow ["comp_try: catch unimplemented"]
;     ([c1, m1, .] := comp(expr, m, e)) or return nil
;     ([c2, ., .] := comp(finallizer, $EmptyMode, e)) or return nil
;     [["finally", c1, c2], m1, e]
 
(DEFUN |comp_try| (|bfVar#107| |m| |e|)
  (PROG (|$insideExpressionIfTrue| |$exitModeStack| |c2| |m1| |c1| |LETTMP#1|
         |finallizer| |catcher| |expr|)
    (DECLARE (SPECIAL |$insideExpressionIfTrue| |$exitModeStack|))
    (RETURN
     (PROGN
      (SETQ |expr| (CADR . #1=(|bfVar#107|)))
      (SETQ |catcher| (CADDR . #1#))
      (SETQ |finallizer| (CADDDR . #1#))
      (SETQ |$exitModeStack| (CONS |m| |$exitModeStack|))
      (SETQ |$insideExpressionIfTrue| NIL)
      (COND
       (|catcher| (|stackAndThrow| (LIST '|comp_try: catch unimplemented|))))
      (OR
       (PROGN
        (SETQ |LETTMP#1| (|comp| |expr| |m| |e|))
        (SETQ |c1| (CAR |LETTMP#1|))
        (SETQ |m1| (CADR |LETTMP#1|))
        |LETTMP#1|)
       (RETURN NIL))
      (OR
       (PROGN
        (SETQ |LETTMP#1| (|comp| |finallizer| |$EmptyMode| |e|))
        (SETQ |c2| (CAR |LETTMP#1|))
        |LETTMP#1|)
       (RETURN NIL))
      (LIST (LIST '|finally| |c1| |c2|) |m1| |e|)))))
 
; compSuchthat([.,x,p],m,e) ==
;   [x',m',e]:= comp(x,m,e) or return nil
;   [p',.,e]:= comp(p,$Boolean,e) or return nil
;   e:= put(x',"condition",p',e)
;   [x',m',e]
 
(DEFUN |compSuchthat| (|bfVar#108| |m| |e|)
  (PROG (|x| |p| |LETTMP#1| |x'| |m'| |p'|)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#108|)))
      (SETQ |p| (CADDR . #1#))
      (SETQ |LETTMP#1| (OR (|comp| |x| |m| |e|) (RETURN NIL)))
      (SETQ |x'| (CAR |LETTMP#1|))
      (SETQ |m'| (CADR . #2=(|LETTMP#1|)))
      (SETQ |e| (CADDR . #2#))
      (SETQ |LETTMP#1| (OR (|comp| |p| |$Boolean| |e|) (RETURN NIL)))
      (SETQ |p'| (CAR |LETTMP#1|))
      (SETQ |e| (CADDR |LETTMP#1|))
      (SETQ |e| (|put| |x'| '|condition| |p'| |e|))
      (LIST |x'| |m'| |e|)))))
 
; compExit(["exit",level,x],m,e) ==
;   index:= level-1
;   $exitModeStack = [] => comp(x,m,e)
;   m1:= $exitModeStack.index
;   [x',m',e']:=
;     u:=
;       comp(x,m1,e) or return
;         stackMessageIfNone ["cannot compile exit expression",x,"in mode",m1]
;   modifyModeStack(m',index)
;   [["TAGGEDexit",index,u],m,e]
 
(DEFUN |compExit| (|bfVar#109| |m| |e|)
  (PROG (|level| |x| |index| |m1| |u| |x'| |m'| |e'|)
    (RETURN
     (PROGN
      (SETQ |level| (CADR . #1=(|bfVar#109|)))
      (SETQ |x| (CADDR . #1#))
      (SETQ |index| (- |level| 1))
      (COND ((NULL |$exitModeStack|) (|comp| |x| |m| |e|))
            ('T
             (PROGN
              (SETQ |m1| (ELT |$exitModeStack| |index|))
              (SETQ |u|
                      (OR (|comp| |x| |m1| |e|)
                          (RETURN
                           (|stackMessageIfNone|
                            (LIST '|cannot compile exit expression| |x|
                                  '|in mode| |m1|)))))
              (SETQ |x'| (CAR |u|))
              (SETQ |m'| (CADR . #2=(|u|)))
              (SETQ |e'| (CADDR . #2#))
              (|modifyModeStack| |m'| |index|)
              (LIST (LIST '|TAGGEDexit| |index| |u|) |m| |e|))))))))
 
; modifyModeStack(m,index) ==
;   $reportExitModeStack =>
;     SAY("exitModeStack: ",COPY $exitModeStack," ====> ",
;       ($exitModeStack.index:= resolve(m,$exitModeStack.index); $exitModeStack))
;   $exitModeStack.index:= resolve(m,$exitModeStack.index)
 
(DEFUN |modifyModeStack| (|m| |index|)
  (PROG ()
    (RETURN
     (COND
      (|$reportExitModeStack|
       (SAY '|exitModeStack: | (COPY |$exitModeStack|) '| ====> |
        (PROGN
         (SETF (ELT |$exitModeStack| |index|)
                 (|resolve| |m| (ELT |$exitModeStack| |index|)))
         |$exitModeStack|)))
      ('T
       (SETF (ELT |$exitModeStack| |index|)
               (|resolve| |m| (ELT |$exitModeStack| |index|))))))))
 
; compLeave(["leave",level,x],m,e) ==
;   index:= #$exitModeStack-1-$leaveLevelStack.(level-1)
;   [x',m',e']:= u:= comp(x,$exitModeStack.index,e) or return nil
;   modifyModeStack(m',index)
;   [["TAGGEDexit",index,u],m,e]
 
(DEFUN |compLeave| (|bfVar#110| |m| |e|)
  (PROG (|level| |x| |index| |u| |x'| |m'| |e'|)
    (RETURN
     (PROGN
      (SETQ |level| (CADR . #1=(|bfVar#110|)))
      (SETQ |x| (CADDR . #1#))
      (SETQ |index|
              (- (- (LENGTH |$exitModeStack|) 1)
                 (ELT |$leaveLevelStack| (- |level| 1))))
      (SETQ |u|
              (OR (|comp| |x| (ELT |$exitModeStack| |index|) |e|)
                  (RETURN NIL)))
      (SETQ |x'| (CAR |u|))
      (SETQ |m'| (CADR . #2=(|u|)))
      (SETQ |e'| (CADDR . #2#))
      (|modifyModeStack| |m'| |index|)
      (LIST (LIST '|TAGGEDexit| |index| |u|) |m| |e|)))))
 
; compReturn(["return",level,x],m,e) ==
;   ns := #$exitModeStack
;   ns = $currentFunctionLevel =>
;     stackSemanticError(["the return before","%b",x,"%d","is unneccessary"],nil)
;     nil
;   level~=1 => userError '"multi-level returns not supported"
;   index := MAX(0, ns - $currentFunctionLevel - 1)
;   $returnMode:= resolve($exitModeStack.index,$returnMode)
;   [x',m',e']:= u:= comp(x,$returnMode,e) or return nil
;   $returnMode:= resolve(m',$returnMode)
;   modifyModeStack(m',index)
;   [["TAGGEDreturn",0,u],m,e']
 
(DEFUN |compReturn| (|bfVar#111| |m| |e|)
  (PROG (|level| |x| |ns| |index| |u| |x'| |m'| |e'|)
    (RETURN
     (PROGN
      (SETQ |level| (CADR . #1=(|bfVar#111|)))
      (SETQ |x| (CADDR . #1#))
      (SETQ |ns| (LENGTH |$exitModeStack|))
      (COND
       ((EQUAL |ns| |$currentFunctionLevel|)
        (PROGN
         (|stackSemanticError|
          (LIST '|the return before| '|%b| |x| '|%d| '|is unneccessary|) NIL)
         NIL))
       ((NOT (EQL |level| 1))
        (|userError| "multi-level returns not supported"))
       ('T
        (PROGN
         (SETQ |index| (MAX 0 (- (- |ns| |$currentFunctionLevel|) 1)))
         (SETQ |$returnMode|
                 (|resolve| (ELT |$exitModeStack| |index|) |$returnMode|))
         (SETQ |u| (OR (|comp| |x| |$returnMode| |e|) (RETURN NIL)))
         (SETQ |x'| (CAR |u|))
         (SETQ |m'| (CADR . #2=(|u|)))
         (SETQ |e'| (CADDR . #2#))
         (SETQ |$returnMode| (|resolve| |m'| |$returnMode|))
         (|modifyModeStack| |m'| |index|)
         (LIST (LIST '|TAGGEDreturn| 0 |u|) |m| |e'|))))))))
 
; compSel(form is ["Sel", aDomain, anOp], m, E) ==
;   aDomain="Lisp" =>
;     [anOp',m,E] where anOp'() == (anOp=$Zero => 0; anOp=$One => 1; anOp)
;   anOp := (anOp = $Zero => "Zero"; anOp = $One => "One"; anOp)
;   compSel1(aDomain, anOp, [], m, E)
 
(DEFUN |compSel| (|form| |m| E)
  (PROG (|aDomain| |anOp|)
    (RETURN
     (PROGN
      (SETQ |aDomain| (CADR . #1=(|form|)))
      (SETQ |anOp| (CADDR . #1#))
      (COND
       ((EQ |aDomain| '|Lisp|)
        (LIST
         (COND ((EQUAL |anOp| |$Zero|) 0) ((EQUAL |anOp| |$One|) 1)
               (#2='T |anOp|))
         |m| E))
       (#2#
        (PROGN
         (SETQ |anOp|
                 (COND ((EQUAL |anOp| |$Zero|) '|Zero|)
                       ((EQUAL |anOp| |$One|) '|One|) (#2# |anOp|)))
         (|compSel1| |aDomain| |anOp| NIL |m| E))))))))
 
; compHas(pred is ["has",a,b],m,$e) ==
;   --b is (":",:.) => (.,.,E):= comp(b,$EmptyMode,E)
;   $e:= chaseInferences(pred,$e)
;   --pred':= ("has",a',b') := formatHas(pred)
;   predCode := compHasFormat1 pred
;   coerce([predCode,$Boolean,$e],m)
 
(DEFUN |compHas| (|pred| |m| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|a| |b| |predCode|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|pred|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |$e| (|chaseInferences| |pred| |$e|))
      (SETQ |predCode| (|compHasFormat1| |pred|))
      (|coerce| (LIST |predCode| |$Boolean| |$e|) |m|)))))
 
; compHasFormat1(pred is ["has", a, b]) ==
;     [a, :.] := comp(a, $EmptyMode, $e) or return nil
;     b is ["ATTRIBUTE", c] => BREAK()
;     b is ["SIGNATURE", op, sig] =>
;         ["HasSignature", a,
;           mkList [MKQ op, mkList [mkDomainConstructor type for type in sig]]]
;     isDomainForm(b, $EmptyEnvironment) => ["EQUAL", a, b]
;     ["HasCategory", a, mkDomainConstructor b]
 
(DEFUN |compHasFormat1| (|pred|)
  (PROG (|a| |b| |LETTMP#1| |ISTMP#1| |c| |op| |ISTMP#2| |sig|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|pred|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |LETTMP#1| (OR (|comp| |a| |$EmptyMode| |$e|) (RETURN NIL)))
      (SETQ |a| (CAR |LETTMP#1|))
      (COND
       ((AND (CONSP |b|) (EQ (CAR |b|) 'ATTRIBUTE)
             (PROGN
              (SETQ |ISTMP#1| (CDR |b|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |c| (CAR |ISTMP#1|)) #2='T))))
        (BREAK))
       ((AND (CONSP |b|) (EQ (CAR |b|) 'SIGNATURE)
             (PROGN
              (SETQ |ISTMP#1| (CDR |b|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |op| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |sig| (CAR |ISTMP#2|)) #2#))))))
        (LIST '|HasSignature| |a|
              (|mkList|
               (LIST (MKQ |op|)
                     (|mkList|
                      ((LAMBDA (|bfVar#113| |bfVar#112| |type|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#112|)
                                (PROGN (SETQ |type| (CAR |bfVar#112|)) NIL))
                            (RETURN (NREVERSE |bfVar#113|)))
                           (#2#
                            (SETQ |bfVar#113|
                                    (CONS (|mkDomainConstructor| |type|)
                                          |bfVar#113|))))
                          (SETQ |bfVar#112| (CDR |bfVar#112|))))
                       NIL |sig| NIL))))))
       ((|isDomainForm| |b| |$EmptyEnvironment|) (LIST 'EQUAL |a| |b|))
       (#2# (LIST '|HasCategory| |a| (|mkDomainConstructor| |b|))))))))
 
; compHasFormat (pred is ["has",olda,b]) ==
;   argl := rest $form
;   formals := TAKE(#argl,$FormalMapVariableList)
;   a := SUBLISLIS(argl,formals,olda)
;   [a,:.] := comp(a,$EmptyMode,$e) or return nil
;   a := SUBLISLIS(formals,argl,a)
;   b is ["ATTRIBUTE",c] => BREAK()
;   b is ["SIGNATURE",op,sig] =>
;      ["HasSignature",a,
;        mkList [MKQ op,mkList [mkDomainConstructor type for type in sig]]]
;   isDomainForm(b,$EmptyEnvironment) => ["EQUAL",a,b]
;   ["HasCategory",a,mkDomainConstructor b]
 
(DEFUN |compHasFormat| (|pred|)
  (PROG (|olda| |b| |argl| |formals| |a| |LETTMP#1| |ISTMP#1| |c| |op|
         |ISTMP#2| |sig|)
    (RETURN
     (PROGN
      (SETQ |olda| (CADR . #1=(|pred|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |argl| (CDR |$form|))
      (SETQ |formals| (TAKE (LENGTH |argl|) |$FormalMapVariableList|))
      (SETQ |a| (SUBLISLIS |argl| |formals| |olda|))
      (SETQ |LETTMP#1| (OR (|comp| |a| |$EmptyMode| |$e|) (RETURN NIL)))
      (SETQ |a| (CAR |LETTMP#1|))
      (SETQ |a| (SUBLISLIS |formals| |argl| |a|))
      (COND
       ((AND (CONSP |b|) (EQ (CAR |b|) 'ATTRIBUTE)
             (PROGN
              (SETQ |ISTMP#1| (CDR |b|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |c| (CAR |ISTMP#1|)) #2='T))))
        (BREAK))
       ((AND (CONSP |b|) (EQ (CAR |b|) 'SIGNATURE)
             (PROGN
              (SETQ |ISTMP#1| (CDR |b|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |op| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |sig| (CAR |ISTMP#2|)) #2#))))))
        (LIST '|HasSignature| |a|
              (|mkList|
               (LIST (MKQ |op|)
                     (|mkList|
                      ((LAMBDA (|bfVar#115| |bfVar#114| |type|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#114|)
                                (PROGN (SETQ |type| (CAR |bfVar#114|)) NIL))
                            (RETURN (NREVERSE |bfVar#115|)))
                           (#2#
                            (SETQ |bfVar#115|
                                    (CONS (|mkDomainConstructor| |type|)
                                          |bfVar#115|))))
                          (SETQ |bfVar#114| (CDR |bfVar#114|))))
                       NIL |sig| NIL))))))
       ((|isDomainForm| |b| |$EmptyEnvironment|) (LIST 'EQUAL |a| |b|))
       (#2# (LIST '|HasCategory| |a| (|mkDomainConstructor| |b|))))))))
 
; compIf(["IF",a,b,c],m,E) ==
;   [xa,ma,Ea,Einv]:= compBoolean(a,$Boolean,E) or return nil
;   [xb,mb,Eb]:= Tb:= compFromIf(b,m,Ea) or return nil
;   [xc,mc,Ec]:= Tc:= compFromIf(c,resolve(mb,m),Einv) or return nil
;   xb':= coerce(Tb,mc) or return nil
;   x:= ["IF", xa, xb'.expr, xc]
;   (returnEnv:= Env(xb'.env,Ec,xb'.expr,xc,E)) where
;     Env(bEnv,cEnv,b,c,E) ==
;       canReturn(b,0,0,true) =>
;         (canReturn(c,0,0,true) => intersectionEnvironment(bEnv,cEnv); bEnv)
;       canReturn(c,0,0,true) => cEnv
;       E
;   [x,mc,returnEnv]
 
(DEFUN |compIf| (|bfVar#116| |m| E)
  (PROG (|a| |b| |c| |LETTMP#1| |xa| |ma| |Ea| |Einv| |Tb| |xb| |mb| |Eb| |Tc|
         |xc| |mc| |Ec| |xb'| |x| |returnEnv|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#116|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |c| (CADDDR . #1#))
      (SETQ |LETTMP#1| (OR (|compBoolean| |a| |$Boolean| E) (RETURN NIL)))
      (SETQ |xa| (CAR |LETTMP#1|))
      (SETQ |ma| (CADR . #2=(|LETTMP#1|)))
      (SETQ |Ea| (CADDR . #2#))
      (SETQ |Einv| (CADDDR . #2#))
      (SETQ |Tb| (OR (|compFromIf| |b| |m| |Ea|) (RETURN NIL)))
      (SETQ |xb| (CAR |Tb|))
      (SETQ |mb| (CADR . #3=(|Tb|)))
      (SETQ |Eb| (CADDR . #3#))
      (SETQ |Tc|
              (OR (|compFromIf| |c| (|resolve| |mb| |m|) |Einv|) (RETURN NIL)))
      (SETQ |xc| (CAR |Tc|))
      (SETQ |mc| (CADR . #4=(|Tc|)))
      (SETQ |Ec| (CADDR . #4#))
      (SETQ |xb'| (OR (|coerce| |Tb| |mc|) (RETURN NIL)))
      (SETQ |x| (LIST 'IF |xa| (CAR |xb'|) |xc|))
      (SETQ |returnEnv| (|compIf,Env| (CADDR |xb'|) |Ec| (CAR |xb'|) |xc| E))
      (LIST |x| |mc| |returnEnv|)))))
(DEFUN |compIf,Env| (|bEnv| |cEnv| |b| |c| E)
  (PROG ()
    (RETURN
     (COND
      ((|canReturn| |b| 0 0 T)
       (COND
        ((|canReturn| |c| 0 0 T) (|intersectionEnvironment| |bEnv| |cEnv|))
        (#1='T |bEnv|)))
      ((|canReturn| |c| 0 0 T) |cEnv|) (#1# E)))))
 
; canReturn(expr,level,exitCount,ValueFlag) ==  --SPAD: exit and friends
;   atom expr => ValueFlag and level=exitCount
;   (op:= first expr)="QUOTE" => ValueFlag and level=exitCount
;   op="TAGGEDexit" =>
;     expr is [.,count,data] => canReturn(data.expr,level,count,count=level)
;   level=exitCount and not ValueFlag => nil
;   op="SEQ" => or/[canReturn(u,level+1,exitCount,false) for u in rest expr]
;   op="TAGGEDreturn" => nil
;   op="CATCH" =>
;     [.,gs,data]:= expr
;     (findThrow(gs,data,level,exitCount,ValueFlag) => true) where
;       findThrow(gs,expr,level,exitCount,ValueFlag) ==
;         atom expr => nil
;         expr is ["THROW", =gs,data] => true
;             --this is pessimistic, but I know of no more accurate idea
;         expr is ["SEQ",:l] =>
;           or/[findThrow(gs,u,level+1,exitCount,ValueFlag) for u in l]
;         or/[findThrow(gs,u,level,exitCount,ValueFlag) for u in rest expr]
;     canReturn(data,level,exitCount,ValueFlag)
;   op = "COND" =>
;     level = exitCount =>
;       or/[canReturn(last u,level,exitCount,ValueFlag) for u in rest expr]
;     or/[or/[canReturn(u,level,exitCount,ValueFlag) for u in v]
;                 for v in rest expr]
;   op="IF" =>
;     expr is [.,a,b,c]
;     if not canReturn(a,0,0,true) then
;       SAY "IF statement can not cause consequents to be executed"
;       pp expr
;     canReturn(a,level,exitCount,nil) or canReturn(b,level,exitCount,ValueFlag)
;       or canReturn(c,level,exitCount,ValueFlag)
;   op = "SPROG" =>
;       expr is [., defs, body]
;       canReturn(body, level, exitCount, ValueFlag)
;   op = "LAMBDA" =>
;       expr is [., args, :body]
;       and/[canReturn(u, level, exitCount, ValueFlag) for u in body]
;   --now we have an ordinary form
;   atom op => and/[canReturn(u,level,exitCount,ValueFlag) for u in expr]
;   op is ["XLAM",args,bods] =>
;     and/[canReturn(u,level,exitCount,ValueFlag) for u in expr]
;   systemErrorHere '"canReturn" --for the time being
 
(DEFUN |canReturn| (|expr| |level| |exitCount| |ValueFlag|)
  (PROG (|op| |ISTMP#1| |count| |ISTMP#2| |data| |gs| |a| |b| |ISTMP#3| |c|
         |defs| |body| |args| |bods|)
    (RETURN
     (COND ((ATOM |expr|) (AND |ValueFlag| (EQUAL |level| |exitCount|)))
           ((EQ (SETQ |op| (CAR |expr|)) 'QUOTE)
            (AND |ValueFlag| (EQUAL |level| |exitCount|)))
           ((EQ |op| '|TAGGEDexit|)
            (COND
             ((AND (CONSP |expr|)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |expr|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |count| (CAR |ISTMP#1|))
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN (SETQ |data| (CAR |ISTMP#2|)) #1='T))))))
              (IDENTITY
               (|canReturn| (CAR |data|) |level| |count|
                (EQUAL |count| |level|))))))
           ((AND (EQUAL |level| |exitCount|) (NULL |ValueFlag|)) NIL)
           ((EQ |op| 'SEQ)
            ((LAMBDA (|bfVar#118| |bfVar#117| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#117|)
                      (PROGN (SETQ |u| (CAR |bfVar#117|)) NIL))
                  (RETURN |bfVar#118|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#118|
                           (|canReturn| |u| (+ |level| 1) |exitCount| NIL))
                   (COND (|bfVar#118| (RETURN |bfVar#118|))))))
                (SETQ |bfVar#117| (CDR |bfVar#117|))))
             NIL (CDR |expr|) NIL))
           ((EQ |op| '|TAGGEDreturn|) NIL)
           ((EQ |op| 'CATCH)
            (PROGN
             (SETQ |gs| (CADR . #2=(|expr|)))
             (SETQ |data| (CADDR . #2#))
             (COND
              ((|canReturn,findThrow| |gs| |data| |level| |exitCount|
                |ValueFlag|)
               T)
              (#1# (|canReturn| |data| |level| |exitCount| |ValueFlag|)))))
           ((EQ |op| 'COND)
            (COND
             ((EQUAL |level| |exitCount|)
              ((LAMBDA (|bfVar#124| |bfVar#123| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#123|)
                        (PROGN (SETQ |u| (CAR |bfVar#123|)) NIL))
                    (RETURN |bfVar#124|))
                   (#1#
                    (PROGN
                     (SETQ |bfVar#124|
                             (|canReturn| (|last| |u|) |level| |exitCount|
                              |ValueFlag|))
                     (COND (|bfVar#124| (RETURN |bfVar#124|))))))
                  (SETQ |bfVar#123| (CDR |bfVar#123|))))
               NIL (CDR |expr|) NIL))
             (#1#
              ((LAMBDA (|bfVar#128| |bfVar#127| |v|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#127|)
                        (PROGN (SETQ |v| (CAR |bfVar#127|)) NIL))
                    (RETURN |bfVar#128|))
                   (#1#
                    (PROGN
                     (SETQ |bfVar#128|
                             ((LAMBDA (|bfVar#126| |bfVar#125| |u|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#125|)
                                       (PROGN
                                        (SETQ |u| (CAR |bfVar#125|))
                                        NIL))
                                   (RETURN |bfVar#126|))
                                  (#1#
                                   (PROGN
                                    (SETQ |bfVar#126|
                                            (|canReturn| |u| |level|
                                             |exitCount| |ValueFlag|))
                                    (COND
                                     (|bfVar#126| (RETURN |bfVar#126|))))))
                                 (SETQ |bfVar#125| (CDR |bfVar#125|))))
                              NIL |v| NIL))
                     (COND (|bfVar#128| (RETURN |bfVar#128|))))))
                  (SETQ |bfVar#127| (CDR |bfVar#127|))))
               NIL (CDR |expr|) NIL))))
           ((EQ |op| 'IF)
            (PROGN
             (AND (CONSP |expr|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |expr|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |a| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN
                               (SETQ |b| (CAR |ISTMP#2|))
                               (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                               (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                    (PROGN
                                     (SETQ |c| (CAR |ISTMP#3|))
                                     #1#))))))))
             (COND
              ((NULL (|canReturn| |a| 0 0 T))
               (SAY '|IF statement can not cause consequents to be executed|)
               (|pp| |expr|)))
             (OR (|canReturn| |a| |level| |exitCount| NIL)
                 (|canReturn| |b| |level| |exitCount| |ValueFlag|)
                 (|canReturn| |c| |level| |exitCount| |ValueFlag|))))
           ((EQ |op| 'SPROG)
            (PROGN
             (AND (CONSP |expr|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |expr|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |defs| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |body| (CAR |ISTMP#2|)) #1#))))))
             (|canReturn| |body| |level| |exitCount| |ValueFlag|)))
           ((EQ |op| 'LAMBDA)
            (PROGN
             (AND (CONSP |expr|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |expr|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |args| (CAR |ISTMP#1|))
                         (SETQ |body| (CDR |ISTMP#1|))
                         #1#))))
             ((LAMBDA (|bfVar#130| |bfVar#129| |u|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#129|)
                       (PROGN (SETQ |u| (CAR |bfVar#129|)) NIL))
                   (RETURN |bfVar#130|))
                  (#1#
                   (PROGN
                    (SETQ |bfVar#130|
                            (|canReturn| |u| |level| |exitCount| |ValueFlag|))
                    (COND ((NOT |bfVar#130|) (RETURN NIL))))))
                 (SETQ |bfVar#129| (CDR |bfVar#129|))))
              T |body| NIL)))
           ((ATOM |op|)
            ((LAMBDA (|bfVar#132| |bfVar#131| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#131|)
                      (PROGN (SETQ |u| (CAR |bfVar#131|)) NIL))
                  (RETURN |bfVar#132|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#132|
                           (|canReturn| |u| |level| |exitCount| |ValueFlag|))
                   (COND ((NOT |bfVar#132|) (RETURN NIL))))))
                (SETQ |bfVar#131| (CDR |bfVar#131|))))
             T |expr| NIL))
           ((AND (CONSP |op|) (EQ (CAR |op|) 'XLAM)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |op|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |args| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |bods| (CAR |ISTMP#2|)) #1#))))))
            ((LAMBDA (|bfVar#134| |bfVar#133| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#133|)
                      (PROGN (SETQ |u| (CAR |bfVar#133|)) NIL))
                  (RETURN |bfVar#134|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#134|
                           (|canReturn| |u| |level| |exitCount| |ValueFlag|))
                   (COND ((NOT |bfVar#134|) (RETURN NIL))))))
                (SETQ |bfVar#133| (CDR |bfVar#133|))))
             T |expr| NIL))
           (#1# (|systemErrorHere| "canReturn"))))))
(DEFUN |canReturn,findThrow| (|gs| |expr| |level| |exitCount| |ValueFlag|)
  (PROG (|ISTMP#1| |ISTMP#2| |data| |l|)
    (RETURN
     (COND ((ATOM |expr|) NIL)
           ((AND (CONSP |expr|) (EQ (CAR |expr|) 'THROW)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |expr|))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |gs|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |data| (CAR |ISTMP#2|)) #1='T))))))
            T)
           ((AND (CONSP |expr|) (EQ (CAR |expr|) 'SEQ)
                 (PROGN (SETQ |l| (CDR |expr|)) #1#))
            ((LAMBDA (|bfVar#120| |bfVar#119| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#119|)
                      (PROGN (SETQ |u| (CAR |bfVar#119|)) NIL))
                  (RETURN |bfVar#120|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#120|
                           (|canReturn,findThrow| |gs| |u| (+ |level| 1)
                            |exitCount| |ValueFlag|))
                   (COND (|bfVar#120| (RETURN |bfVar#120|))))))
                (SETQ |bfVar#119| (CDR |bfVar#119|))))
             NIL |l| NIL))
           (#1#
            ((LAMBDA (|bfVar#122| |bfVar#121| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#121|)
                      (PROGN (SETQ |u| (CAR |bfVar#121|)) NIL))
                  (RETURN |bfVar#122|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#122|
                           (|canReturn,findThrow| |gs| |u| |level| |exitCount|
                            |ValueFlag|))
                   (COND (|bfVar#122| (RETURN |bfVar#122|))))))
                (SETQ |bfVar#121| (CDR |bfVar#121|))))
             NIL (CDR |expr|) NIL))))))
 
; compBoolean(p,m,E) ==
;   [p',m,E]:= comp(p,m,E) or return nil
;   [p',m,getSuccessEnvironment(p,E),getInverseEnvironment(p,E)]
 
(DEFUN |compBoolean| (|p| |m| E)
  (PROG (|LETTMP#1| |p'|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (OR (|comp| |p| |m| E) (RETURN NIL)))
      (SETQ |p'| (CAR |LETTMP#1|))
      (SETQ |m| (CADR . #1=(|LETTMP#1|)))
      (SETQ E (CADDR . #1#))
      (LIST |p'| |m| (|getSuccessEnvironment| |p| E)
            (|getInverseEnvironment| |p| E))))))
 
; getSuccessEnvironment(a,e) ==
;   -- the next four lines try to ensure that explicit special-case tests
;   --  prevent implicit ones from being generated
;   a is ["has",x,m] =>
;     e
;   a is ["is",id,m] =>
;     IDENTP id and isDomainForm(m,$EmptyEnvironment) =>
;          currentProplist:= getProplist(id,e)
;          [.,.,e] := T := comp(m,$EmptyMode,e) or return nil -- duplicates compIs
;          newProplist:= consProplistOf(id,currentProplist,"value",[m,:rest removeEnv T])
;          addBinding(id,newProplist,e)
;     e
;   a is ["case",x,m] and IDENTP x =>
;     put(x,"condition",[a,:get(x,"condition",e)],e)
;   e
 
(DEFUN |getSuccessEnvironment| (|a| |e|)
  (PROG (|ISTMP#1| |x| |ISTMP#2| |m| |id| |currentProplist| T$ |newProplist|)
    (RETURN
     (COND
      ((AND (CONSP |a|) (EQ (CAR |a|) '|has|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |a|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |m| (CAR |ISTMP#2|)) #1='T))))))
       |e|)
      ((AND (CONSP |a|) (EQ (CAR |a|) '|is|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |a|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |id| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |m| (CAR |ISTMP#2|)) #1#))))))
       (COND
        ((AND (IDENTP |id|) (|isDomainForm| |m| |$EmptyEnvironment|))
         (PROGN
          (SETQ |currentProplist| (|getProplist| |id| |e|))
          (SETQ T$ (OR (|comp| |m| |$EmptyMode| |e|) (RETURN NIL)))
          (SETQ |e| (CADDR T$))
          (SETQ |newProplist|
                  (|consProplistOf| |id| |currentProplist| '|value|
                   (CONS |m| (CDR (|removeEnv| T$)))))
          (|addBinding| |id| |newProplist| |e|)))
        (#1# |e|)))
      ((AND (CONSP |a|) (EQ (CAR |a|) '|case|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |a|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |m| (CAR |ISTMP#2|)) #1#)))))
            (IDENTP |x|))
       (|put| |x| '|condition| (CONS |a| (|get| |x| '|condition| |e|)) |e|))
      (#1# |e|)))))
 
; getInverseEnvironment(a,E) ==
;   atom a => E
;   [op,:argl]:= a
; -- the next five lines try to ensure that explicit special-case tests
; -- prevent implicit ones from being generated
;   op="has" =>
;     [x,m]:= argl
;     E
;   a is ["case",x,m] and IDENTP x =>
;            --the next two lines are necessary to get 3-branched Unions to work
;            -- old-style unions, that is
;     (get(x,"condition",E) is [["OR",:oldpred]]) and member(a,oldpred) =>
;       put(x,"condition",LIST MKPF(delete(a,oldpred),"OR"),E)
;     getUnionMode(x,E) is ["Union",:l]
;     l':= delete(m,l)
;     for u in l' repeat
;        if u is ['_:,=m,:.] then l':=delete(u,l')
;     newpred:= MKPF([["case",x,m'] for m' in l'],"OR")
;     put(x,"condition",[newpred,:get(x,"condition",E)],E)
;   E
 
(DEFUN |getInverseEnvironment| (|a| E)
  (PROG (|op| |argl| |x| |m| |ISTMP#1| |ISTMP#2| |oldpred| |l| |l'| |newpred|)
    (RETURN
     (COND ((ATOM |a|) E)
           (#1='T
            (PROGN
             (SETQ |op| (CAR |a|))
             (SETQ |argl| (CDR |a|))
             (COND
              ((EQ |op| '|has|)
               (PROGN (SETQ |x| (CAR |argl|)) (SETQ |m| (CADR |argl|)) E))
              ((AND (CONSP |a|) (EQ (CAR |a|) '|case|)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |a|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |x| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |m| (CAR |ISTMP#2|)) #1#)))))
                    (IDENTP |x|))
               (COND
                ((AND
                  (PROGN
                   (SETQ |ISTMP#1| (|get| |x| '|condition| E))
                   (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                        (PROGN
                         (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) 'OR)
                              (PROGN (SETQ |oldpred| (CDR |ISTMP#2|)) #1#)))))
                  (|member| |a| |oldpred|))
                 (|put| |x| '|condition|
                  (LIST (MKPF (|delete| |a| |oldpred|) 'OR)) E))
                (#1#
                 (PROGN
                  (SETQ |ISTMP#1| (|getUnionMode| |x| E))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Union|)
                       (PROGN (SETQ |l| (CDR |ISTMP#1|)) #1#))
                  (SETQ |l'| (|delete| |m| |l|))
                  ((LAMBDA (|bfVar#135| |u|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#135|)
                            (PROGN (SETQ |u| (CAR |bfVar#135|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (COND
                         ((AND (CONSP |u|) (EQ (CAR |u|) '|:|)
                               (PROGN
                                (SETQ |ISTMP#1| (CDR |u|))
                                (AND (CONSP |ISTMP#1|)
                                     (EQUAL (CAR |ISTMP#1|) |m|))))
                          (SETQ |l'| (|delete| |u| |l'|))))))
                      (SETQ |bfVar#135| (CDR |bfVar#135|))))
                   |l'| NIL)
                  (SETQ |newpred|
                          (MKPF
                           ((LAMBDA (|bfVar#137| |bfVar#136| |m'|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#136|)
                                     (PROGN (SETQ |m'| (CAR |bfVar#136|)) NIL))
                                 (RETURN (NREVERSE |bfVar#137|)))
                                (#1#
                                 (SETQ |bfVar#137|
                                         (CONS (LIST '|case| |x| |m'|)
                                               |bfVar#137|))))
                               (SETQ |bfVar#136| (CDR |bfVar#136|))))
                            NIL |l'| NIL)
                           'OR))
                  (|put| |x| '|condition|
                   (CONS |newpred| (|get| |x| '|condition| E)) E)))))
              (#1# E))))))))
 
; getUnionMode(x,e) ==
;   m:=
;     atom x => getmode(x,e)
;     return nil
;   isUnionMode(m,e)
 
(DEFUN |getUnionMode| (|x| |e|)
  (PROG (|m|)
    (RETURN
     (PROGN
      (SETQ |m| (COND ((ATOM |x|) (|getmode| |x| |e|)) ('T (RETURN NIL))))
      (|isUnionMode| |m| |e|)))))
 
; isUnionMode(m,e) ==
;   m is ["Union",:.] => m
;   (m':= getmode(m,e)) is ["Mapping",["UnionCategory",:.]] => CADR m'
;   v:= get(if m="$" then "Rep" else m,"value",e) =>
;     (v.expr is ["Union",:.] => v.expr; nil)
;   nil
 
(DEFUN |isUnionMode| (|m| |e|)
  (PROG (|m'| |ISTMP#1| |ISTMP#2| |ISTMP#3| |v|)
    (RETURN
     (COND ((AND (CONSP |m|) (EQ (CAR |m|) '|Union|)) |m|)
           ((PROGN
             (SETQ |ISTMP#1| (SETQ |m'| (|getmode| |m| |e|)))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN
                         (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|)
                              (EQ (CAR |ISTMP#3|) '|UnionCategory|)))))))
            (CADR |m'|))
           ((SETQ |v|
                    (|get| (COND ((EQ |m| '$) '|Rep|) (#1='T |m|)) '|value|
                     |e|))
            (COND
             ((PROGN
               (SETQ |ISTMP#1| (CAR |v|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Union|)))
              (CAR |v|))
             (#1# NIL)))
           (#1# NIL)))))
 
; compFromIf(a,m,E) ==
;   a="noBranch" => ["noBranch",m,E]
;   true => comp(a,m,E)
 
(DEFUN |compFromIf| (|a| |m| E)
  (PROG ()
    (RETURN
     (COND ((EQ |a| '|noBranch|) (LIST '|noBranch| |m| E))
           (T (|comp| |a| |m| E))))))
 
; compImport(["import",:doms],m,e) ==
;   for dom in doms repeat e:=addDomain(dom,e)
;   ["/throwAway",$NoValueMode,e]
 
(DEFUN |compImport| (|bfVar#139| |m| |e|)
  (PROG (|doms|)
    (RETURN
     (PROGN
      (SETQ |doms| (CDR |bfVar#139|))
      ((LAMBDA (|bfVar#138| |dom|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#138|) (PROGN (SETQ |dom| (CAR |bfVar#138|)) NIL))
            (RETURN NIL))
           ('T (SETQ |e| (|addDomain| |dom| |e|))))
          (SETQ |bfVar#138| (CDR |bfVar#138|))))
       |doms| NIL)
      (LIST '|/throwAway| |$NoValueMode| |e|)))))
 
; compCase(["case",x,m'],m,e) ==
;   e:= addDomain(m',e)
;   T:= compCase1(x,m',e) => coerce(T,m)
;   nil
 
(DEFUN |compCase| (|bfVar#140| |m| |e|)
  (PROG (|x| |m'| T$)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#140|)))
      (SETQ |m'| (CADDR . #1#))
      (SETQ |e| (|addDomain| |m'| |e|))
      (COND ((SETQ T$ (|compCase1| |x| |m'| |e|)) (|coerce| T$ |m|))
            ('T NIL))))))
 
; compCase1(x,m,e) ==
;   [x',m',e']:= comp(x,$EmptyMode,e) or return nil
;   u:=
;     [cexpr
;       for (modemap:= [map,cexpr]) in getModemapList("case",2,e') | map is [.,.,s,
;         t] and modeEqual(t,m) and modeEqual(s,m')] or return nil
;   fn:= (or/[selfn for [cond,selfn] in u | cond=true]) or return nil
;   [["call",fn,x'],$Boolean,e']
 
(DEFUN |compCase1| (|x| |m| |e|)
  (PROG (|LETTMP#1| |x'| |m'| |e'| |map| |ISTMP#1| |cexpr| |ISTMP#2| |s|
         |ISTMP#3| |t| |u| |cond| |selfn| |fn|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (OR (|comp| |x| |$EmptyMode| |e|) (RETURN NIL)))
      (SETQ |x'| (CAR |LETTMP#1|))
      (SETQ |m'| (CADR . #1=(|LETTMP#1|)))
      (SETQ |e'| (CADDR . #1#))
      (SETQ |u|
              (OR
               ((LAMBDA (|bfVar#142| |bfVar#141| |modemap|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#141|)
                         (PROGN (SETQ |modemap| (CAR |bfVar#141|)) NIL))
                     (RETURN (NREVERSE |bfVar#142|)))
                    (#2='T
                     (AND (CONSP |modemap|)
                          (PROGN
                           (SETQ |map| (CAR |modemap|))
                           (SETQ |ISTMP#1| (CDR |modemap|))
                           (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                (PROGN (SETQ |cexpr| (CAR |ISTMP#1|)) #2#)))
                          (CONSP |map|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |map|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (PROGN
                                       (SETQ |s| (CAR |ISTMP#2|))
                                       (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                       (AND (CONSP |ISTMP#3|)
                                            (EQ (CDR |ISTMP#3|) NIL)
                                            (PROGN
                                             (SETQ |t| (CAR |ISTMP#3|))
                                             #2#)))))))
                          (|modeEqual| |t| |m|) (|modeEqual| |s| |m'|)
                          (SETQ |bfVar#142| (CONS |cexpr| |bfVar#142|)))))
                   (SETQ |bfVar#141| (CDR |bfVar#141|))))
                NIL (|getModemapList| '|case| 2 |e'|) NIL)
               (RETURN NIL)))
      (SETQ |fn|
              (OR
               ((LAMBDA (|bfVar#145| |bfVar#144| |bfVar#143|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#144|)
                         (PROGN (SETQ |bfVar#143| (CAR |bfVar#144|)) NIL))
                     (RETURN |bfVar#145|))
                    (#2#
                     (AND (CONSP |bfVar#143|)
                          (PROGN
                           (SETQ |cond| (CAR |bfVar#143|))
                           (SETQ |ISTMP#1| (CDR |bfVar#143|))
                           (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                (PROGN (SETQ |selfn| (CAR |ISTMP#1|)) #2#)))
                          (EQUAL |cond| T)
                          (PROGN
                           (SETQ |bfVar#145| |selfn|)
                           (COND (|bfVar#145| (RETURN |bfVar#145|)))))))
                   (SETQ |bfVar#144| (CDR |bfVar#144|))))
                NIL |u| NIL)
               (RETURN NIL)))
      (LIST (LIST '|call| |fn| |x'|) |$Boolean| |e'|)))))
 
; compColon([":",f,t],m,e) ==
;   $insideExpressionIfTrue=true => compColonInside(f,m,e,t)
;     --if inside an expression, ":" means to convert to m "on faith"
;   t:=
;     atom t and (t':= assoc(t,getDomainsInScope e)) => t'
;     isDomainForm(t,e) and not $insideCategoryIfTrue =>
;       (if not member(t,getDomainsInScope e) then e:= addDomain(t,e); t)
;     isDomainForm(t,e) or isCategoryForm(t,e) => t
;     t is ["Mapping",m',:r] => t
;     unknownTypeError t
;     t
;   f is ["LISTOF",:l] =>
;     (for x in l repeat T:= [.,.,e]:= compColon([":",x,t],m,e); T)
;   e:=
;     f is [op,:argl] =>
;       --for MPOLY--replace parameters by formal arguments: RDJ 3/83
;       newTarget:= EQSUBSTLIST(take(#argl,$FormalMapVariableList),
;         [(x is [":",a,m] => a; x) for x in argl],t)
;       signature:=
;         ["Mapping",newTarget,:
;           [(x is [":",a,m] => m;
;               getmode(x,e) or systemErrorHere '"compColonOld") for x in argl]]
;       put(op,"mode",signature,e)
;     put(f,"mode",t,e)
;   if not $bootStrapMode and $insideFunctorIfTrue and
;     makeCategoryForm(t,e) is [catform,e] then
;         e:= put(f,"value",[genSomeVariable(),t,$noEnv],e)
;   ["/throwAway",getmode(f,e),e]
 
(DEFUN |compColon| (|bfVar#151| |m| |e|)
  (PROG (|f| |t| |t'| |ISTMP#1| |m'| |r| |l| |LETTMP#1| T$ |op| |argl| |a|
         |ISTMP#2| |newTarget| |signature| |catform|)
    (RETURN
     (PROGN
      (SETQ |f| (CADR . #1=(|bfVar#151|)))
      (SETQ |t| (CADDR . #1#))
      (COND
       ((EQUAL |$insideExpressionIfTrue| T)
        (|compColonInside| |f| |m| |e| |t|))
       (#2='T
        (PROGN
         (SETQ |t|
                 (COND
                  ((AND (ATOM |t|)
                        (SETQ |t'| (|assoc| |t| (|getDomainsInScope| |e|))))
                   |t'|)
                  ((AND (|isDomainForm| |t| |e|)
                        (NULL |$insideCategoryIfTrue|))
                   (PROGN
                    (COND
                     ((NULL (|member| |t| (|getDomainsInScope| |e|)))
                      (SETQ |e| (|addDomain| |t| |e|))))
                    |t|))
                  ((OR (|isDomainForm| |t| |e|) (|isCategoryForm| |t| |e|))
                   |t|)
                  ((AND (CONSP |t|) (EQ (CAR |t|) '|Mapping|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |t|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |m'| (CAR |ISTMP#1|))
                               (SETQ |r| (CDR |ISTMP#1|))
                               #2#))))
                   |t|)
                  (#2# (PROGN (|unknownTypeError| |t|) |t|))))
         (COND
          ((AND (CONSP |f|) (EQ (CAR |f|) 'LISTOF)
                (PROGN (SETQ |l| (CDR |f|)) #2#))
           (PROGN
            ((LAMBDA (|bfVar#146| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#146|)
                      (PROGN (SETQ |x| (CAR |bfVar#146|)) NIL))
                  (RETURN NIL))
                 (#2#
                  (SETQ T$
                          (PROGN
                           (SETQ |LETTMP#1|
                                   (|compColon| (LIST '|:| |x| |t|) |m| |e|))
                           (SETQ |e| (CADDR |LETTMP#1|))
                           |LETTMP#1|))))
                (SETQ |bfVar#146| (CDR |bfVar#146|))))
             |l| NIL)
            T$))
          (#2#
           (PROGN
            (SETQ |e|
                    (COND
                     ((AND (CONSP |f|)
                           (PROGN
                            (SETQ |op| (CAR |f|))
                            (SETQ |argl| (CDR |f|))
                            #2#))
                      (PROGN
                       (SETQ |newTarget|
                               (EQSUBSTLIST
                                (TAKE (LENGTH |argl|) |$FormalMapVariableList|)
                                ((LAMBDA (|bfVar#148| |bfVar#147| |x|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#147|)
                                          (PROGN
                                           (SETQ |x| (CAR |bfVar#147|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#148|)))
                                     (#2#
                                      (SETQ |bfVar#148|
                                              (CONS
                                               (COND
                                                ((AND (CONSP |x|)
                                                      (EQ (CAR |x|) '|:|)
                                                      (PROGN
                                                       (SETQ |ISTMP#1|
                                                               (CDR |x|))
                                                       (AND (CONSP |ISTMP#1|)
                                                            (PROGN
                                                             (SETQ |a|
                                                                     (CAR
                                                                      |ISTMP#1|))
                                                             (SETQ |ISTMP#2|
                                                                     (CDR
                                                                      |ISTMP#1|))
                                                             (AND
                                                              (CONSP |ISTMP#2|)
                                                              (EQ
                                                               (CDR |ISTMP#2|)
                                                               NIL)
                                                              (PROGN
                                                               (SETQ |m|
                                                                       (CAR
                                                                        |ISTMP#2|))
                                                               #2#))))))
                                                 |a|)
                                                (#2# |x|))
                                               |bfVar#148|))))
                                    (SETQ |bfVar#147| (CDR |bfVar#147|))))
                                 NIL |argl| NIL)
                                |t|))
                       (SETQ |signature|
                               (CONS '|Mapping|
                                     (CONS |newTarget|
                                           ((LAMBDA
                                                (|bfVar#150| |bfVar#149| |x|)
                                              (LOOP
                                               (COND
                                                ((OR (ATOM |bfVar#149|)
                                                     (PROGN
                                                      (SETQ |x|
                                                              (CAR
                                                               |bfVar#149|))
                                                      NIL))
                                                 (RETURN
                                                  (NREVERSE |bfVar#150|)))
                                                (#2#
                                                 (SETQ |bfVar#150|
                                                         (CONS
                                                          (COND
                                                           ((AND (CONSP |x|)
                                                                 (EQ (CAR |x|)
                                                                     '|:|)
                                                                 (PROGN
                                                                  (SETQ |ISTMP#1|
                                                                          (CDR
                                                                           |x|))
                                                                  (AND
                                                                   (CONSP
                                                                    |ISTMP#1|)
                                                                   (PROGN
                                                                    (SETQ |a|
                                                                            (CAR
                                                                             |ISTMP#1|))
                                                                    (SETQ |ISTMP#2|
                                                                            (CDR
                                                                             |ISTMP#1|))
                                                                    (AND
                                                                     (CONSP
                                                                      |ISTMP#2|)
                                                                     (EQ
                                                                      (CDR
                                                                       |ISTMP#2|)
                                                                      NIL)
                                                                     (PROGN
                                                                      (SETQ |m|
                                                                              (CAR
                                                                               |ISTMP#2|))
                                                                      #2#))))))
                                                            |m|)
                                                           (#2#
                                                            (OR
                                                             (|getmode| |x|
                                                              |e|)
                                                             (|systemErrorHere|
                                                              "compColonOld"))))
                                                          |bfVar#150|))))
                                               (SETQ |bfVar#149|
                                                       (CDR |bfVar#149|))))
                                            NIL |argl| NIL))))
                       (|put| |op| '|mode| |signature| |e|)))
                     (#2# (|put| |f| '|mode| |t| |e|))))
            (COND
             ((AND (NULL |$bootStrapMode|) |$insideFunctorIfTrue|
                   (PROGN
                    (SETQ |ISTMP#1| (|makeCategoryForm| |t| |e|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |catform| (CAR |ISTMP#1|))
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN (SETQ |e| (CAR |ISTMP#2|)) #2#))))))
              (SETQ |e|
                      (|put| |f| '|value|
                       (LIST (|genSomeVariable|) |t| |$noEnv|) |e|))))
            (LIST '|/throwAway| (|getmode| |f| |e|) |e|)))))))))))
 
; unknownTypeError name ==
;   name:=
;     name is [op,:.] => op
;     name
;   stackSemanticError(["%b",name,"%d","is not a known type"],nil)
 
(DEFUN |unknownTypeError| (|name|)
  (PROG (|op|)
    (RETURN
     (PROGN
      (SETQ |name|
              (COND
               ((AND (CONSP |name|) (PROGN (SETQ |op| (CAR |name|)) #1='T))
                |op|)
               (#1# |name|)))
      (|stackSemanticError| (LIST '|%b| |name| '|%d| '|is not a known type|)
       NIL)))))
 
; compPretend(["pretend",x,t],m,e) ==
;   e:= addDomain(t,e)
;   T:= comp(x,t,e) or comp(x,$EmptyMode,e) or return nil
;   if T.mode=t then warningMessage:= ["pretend",t," -- should replace by @"]
;   if opOf(T.mode) = 'Union and opOf(m) ~= 'Union then
;      stackWarning(["cannot pretend ",x," of mode ",T.mode," to mode ",m])
;   T:= [T.expr,t,T.env]
;   T':= coerce(T,m) => (if warningMessage then stackWarning warningMessage; T')
 
(DEFUN |compPretend| (|bfVar#152| |m| |e|)
  (PROG (|x| |t| T$ |warningMessage| |T'|)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#152|)))
      (SETQ |t| (CADDR . #1#))
      (SETQ |e| (|addDomain| |t| |e|))
      (SETQ T$
              (OR (|comp| |x| |t| |e|) (|comp| |x| |$EmptyMode| |e|)
                  (RETURN NIL)))
      (COND
       ((EQUAL (CADR T$) |t|)
        (SETQ |warningMessage|
                (LIST '|pretend| |t| '| -- should replace by @|))))
      (COND
       ((AND (EQ (|opOf| (CADR T$)) '|Union|) (NOT (EQ (|opOf| |m|) '|Union|)))
        (|stackWarning|
         (LIST '|cannot pretend | |x| '| of mode | (CADR T$) '| to mode |
               |m|))))
      (SETQ T$ (LIST (CAR T$) |t| (CADDR T$)))
      (COND
       ((SETQ |T'| (|coerce| T$ |m|))
        (PROGN
         (COND (|warningMessage| (|stackWarning| |warningMessage|)))
         |T'|)))))))
 
; compColonInside(x,m,e,m') ==
;     return stackSemanticError([_
;         "compColonInside: colon inside expressions is unsupported"], nil)
 
(DEFUN |compColonInside| (|x| |m| |e| |m'|)
  (PROG ()
    (RETURN
     (RETURN
      (|stackSemanticError|
       (LIST '|compColonInside: colon inside expressions is unsupported|)
       NIL)))))
 
; compIs(["is",a,b],m,e) ==
;   [aval,am,e] := comp(a,$EmptyMode,e) or return nil
;   [bval,bm,e] := comp(b,$EmptyMode,e) or return nil
;   T:= [["domainEqual",aval,bval],$Boolean,e]
;   coerce(T,m)
 
(DEFUN |compIs| (|bfVar#153| |m| |e|)
  (PROG (|a| |b| |LETTMP#1| |aval| |am| |bval| |bm| T$)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#153|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |LETTMP#1| (OR (|comp| |a| |$EmptyMode| |e|) (RETURN NIL)))
      (SETQ |aval| (CAR |LETTMP#1|))
      (SETQ |am| (CADR . #2=(|LETTMP#1|)))
      (SETQ |e| (CADDR . #2#))
      (SETQ |LETTMP#1| (OR (|comp| |b| |$EmptyMode| |e|) (RETURN NIL)))
      (SETQ |bval| (CAR |LETTMP#1|))
      (SETQ |bm| (CADR . #3=(|LETTMP#1|)))
      (SETQ |e| (CADDR . #3#))
      (SETQ T$ (LIST (LIST '|domainEqual| |aval| |bval|) |$Boolean| |e|))
      (|coerce| T$ |m|)))))
 
; coerce(T,m) ==
;   $InteractiveMode =>
;     keyedSystemError("S2GE0016",['"coerce",
;       '"function coerce called from the interpreter."])
;   rplac(CADR T,substitute("$",$Rep,CADR T))
;   T':= coerceEasy(T,m) => T'
;   T':= coerceSubset(T,m) => T'
;   T':= coerceHard(T,m) => T'
;   T.expr = "$fromCoerceable$" or isSomeDomainVariable m => nil
;       -- if from coerceable, this coerce was just a trial coercion
;       -- from compFormWithModemap to filter through the modemaps
;   stackMessage fn(T.expr,T.mode,m) where
;     fn(x,m1,m2) ==
;       ["Cannot coerce","%b",x,"%d","%l","      of mode","%b",m1,"%d","%l",
;         "      to mode","%b",m2,"%d"]
 
(DEFUN |coerce| (T$ |m|)
  (PROG (|T'|)
    (RETURN
     (COND
      (|$InteractiveMode|
       (|keyedSystemError| 'S2GE0016
        (LIST "coerce" "function coerce called from the interpreter.")))
      (#1='T
       (PROGN
        (|rplac| (CADR T$) (|substitute| '$ |$Rep| (CADR T$)))
        (COND ((SETQ |T'| (|coerceEasy| T$ |m|)) |T'|)
              ((SETQ |T'| (|coerceSubset| T$ |m|)) |T'|)
              ((SETQ |T'| (|coerceHard| T$ |m|)) |T'|)
              ((OR (EQ (CAR T$) '|$fromCoerceable$|)
                   (|isSomeDomainVariable| |m|))
               NIL)
              (#1# (|stackMessage| (|coerce,fn| (CAR T$) (CADR T$) |m|))))))))))
(DEFUN |coerce,fn| (|x| |m1| |m2|)
  (PROG ()
    (RETURN
     (LIST '|Cannot coerce| '|%b| |x| '|%d| '|%l| '|      of mode| '|%b| |m1|
           '|%d| '|%l| '|      to mode| '|%b| |m2| '|%d|))))
 
; coerceEasy(T,m) ==
;   m=$EmptyMode => T
;   m=$NoValueMode or m=$Void => [T.expr,m,T.env]
;   T.mode =m => T
;   T.mode =$Exit =>
;       [["PROGN", T.expr, ["userError", '"Did not really exit."]],
;         m,T.env]
;   T.mode=$EmptyMode or modeEqualSubst(T.mode,m,T.env) =>
;     [T.expr,m,T.env]
 
(DEFUN |coerceEasy| (T$ |m|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |m| |$EmptyMode|) T$)
           ((OR (EQUAL |m| |$NoValueMode|) (EQUAL |m| |$Void|))
            (LIST (CAR T$) |m| (CADDR T$)))
           ((EQUAL (CADR T$) |m|) T$)
           ((EQUAL (CADR T$) |$Exit|)
            (LIST
             (LIST 'PROGN (CAR T$) (LIST '|userError| "Did not really exit."))
             |m| (CADDR T$)))
           ((OR (EQUAL (CADR T$) |$EmptyMode|)
                (|modeEqualSubst| (CADR T$) |m| (CADDR T$)))
            (LIST (CAR T$) |m| (CADDR T$)))))))
 
; coerceSubset([x,m,e],m') ==
;   isSubset(m,m',e) or m="Rep" and m'="$" => [x,m',e]
;   m is ['SubDomain,=m',:.] => [x,m',e]
;   INTEGERP x and (pred:= isSubset(m',maxSuperType(m,e),e)) -- again temporary
;     and eval substitute(x,"*",pred) =>
;       [x,m',e]
;   nil
 
(DEFUN |coerceSubset| (|bfVar#154| |m'|)
  (PROG (|x| |m| |e| |ISTMP#1| |pred|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#154|))
      (SETQ |m| (CADR . #1=(|bfVar#154|)))
      (SETQ |e| (CADDR . #1#))
      (COND
       ((OR (|isSubset| |m| |m'| |e|) (AND (EQ |m| '|Rep|) (EQ |m'| '$)))
        (LIST |x| |m'| |e|))
       ((AND (CONSP |m|) (EQ (CAR |m|) '|SubDomain|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |m|))
              (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |m'|))))
        (LIST |x| |m'| |e|))
       ((AND (INTEGERP |x|)
             (SETQ |pred| (|isSubset| |m'| (|maxSuperType| |m| |e|) |e|))
             (|eval| (|substitute| |x| '* |pred|)))
        (LIST |x| |m'| |e|))
       ('T NIL))))))
 
; coerceHard(T,m) ==
;   $e: local:= T.env
;   m':= T.mode
;   STRINGP m' and modeEqual(m,$String) => [T.expr,m,$e]
;   STRINGP T.expr and modeEqual(m', $String) and modeEqual(m, $Symbol) =>
;       [["QUOTE", INTERN(T.expr, "BOOT")], m, $e]
;   modeEqual(m',m) or
;     (get(m',"value",$e) is [m'',:.] or getmode(m',$e) is ["Mapping",m'']) and
;       modeEqual(m'',m) or
;         (get(m,"value",$e) is [m'',:.] or getmode(m,$e) is ["Mapping",m'']) and
;           modeEqual(m'',m') => [T.expr,m,T.env]
;   STRINGP T.expr and T.expr=m => [T.expr,m,$e]
;   isCategoryForm(m,$e) =>
;       $bootStrapMode = true => [T.expr,m,$e]
;       extendsCategoryForm(T.expr,T.mode,m) => [T.expr,m,$e]
;       coerceExtraHard(T,m)
;   coerceExtraHard(T,m)
 
(DEFUN |coerceHard| (T$ |m|)
  (PROG (|$e| |ISTMP#2| |m''| |ISTMP#1| |m'|)
    (DECLARE (SPECIAL |$e|))
    (RETURN
     (PROGN
      (SETQ |$e| (CADDR T$))
      (SETQ |m'| (CADR T$))
      (COND
       ((AND (STRINGP |m'|) (|modeEqual| |m| |$String|))
        (LIST (CAR T$) |m| |$e|))
       ((AND (STRINGP (CAR T$)) (|modeEqual| |m'| |$String|)
             (|modeEqual| |m| |$Symbol|))
        (LIST (LIST 'QUOTE (INTERN (CAR T$) 'BOOT)) |m| |$e|))
       ((OR (|modeEqual| |m'| |m|)
            (AND
             (OR
              (PROGN
               (SETQ |ISTMP#1| (|get| |m'| '|value| |$e|))
               (AND (CONSP |ISTMP#1|)
                    (PROGN (SETQ |m''| (CAR |ISTMP#1|)) #1='T)))
              (PROGN
               (SETQ |ISTMP#1| (|getmode| |m'| |$e|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
                    (PROGN
                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                          (PROGN (SETQ |m''| (CAR |ISTMP#2|)) #1#))))))
             (|modeEqual| |m''| |m|))
            (AND
             (OR
              (PROGN
               (SETQ |ISTMP#1| (|get| |m| '|value| |$e|))
               (AND (CONSP |ISTMP#1|)
                    (PROGN (SETQ |m''| (CAR |ISTMP#1|)) #1#)))
              (PROGN
               (SETQ |ISTMP#1| (|getmode| |m| |$e|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
                    (PROGN
                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                          (PROGN (SETQ |m''| (CAR |ISTMP#2|)) #1#))))))
             (|modeEqual| |m''| |m'|)))
        (LIST (CAR T$) |m| (CADDR T$)))
       ((AND (STRINGP (CAR T$)) (EQUAL (CAR T$) |m|)) (LIST (CAR T$) |m| |$e|))
       ((|isCategoryForm| |m| |$e|)
        (COND ((EQUAL |$bootStrapMode| T) (LIST (CAR T$) |m| |$e|))
              ((|extendsCategoryForm| (CAR T$) (CADR T$) |m|)
               (LIST (CAR T$) |m| |$e|))
              (#1# (|coerceExtraHard| T$ |m|))))
       (#1# (|coerceExtraHard| T$ |m|)))))))
 
; coerceExtraHard(T is [x,m',e],m) ==
;   T':= autoCoerceByModemap(T,m) => T'
;   isUnionMode(m',e) is ["Union",:l] and (t:= hasType(x,e)) and
;     member(t,l) and (T':= autoCoerceByModemap(T,t)) and
;       (T'':= coerce(T',m)) => T''
;   m' is ['Record, :.] and m = $OutputForm =>
;       [['coerceRe2E,x,['ELT,COPY m',0]],m,e]
;   nil
 
(DEFUN |coerceExtraHard| (T$ |m|)
  (PROG (|x| |m'| |e| |T'| |ISTMP#1| |l| |t| |T''|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR T$))
      (SETQ |m'| (CADR . #1=(T$)))
      (SETQ |e| (CADDR . #1#))
      (COND ((SETQ |T'| (|autoCoerceByModemap| T$ |m|)) |T'|)
            ((AND
              (PROGN
               (SETQ |ISTMP#1| (|isUnionMode| |m'| |e|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Union|)
                    (PROGN (SETQ |l| (CDR |ISTMP#1|)) #2='T)))
              (SETQ |t| (|hasType| |x| |e|)) (|member| |t| |l|)
              (SETQ |T'| (|autoCoerceByModemap| T$ |t|))
              (SETQ |T''| (|coerce| |T'| |m|)))
             |T''|)
            ((AND (CONSP |m'|) (EQ (CAR |m'|) '|Record|)
                  (EQUAL |m| |$OutputForm|))
             (LIST (LIST '|coerceRe2E| |x| (LIST 'ELT (COPY |m'|) 0)) |m| |e|))
            (#2# NIL))))))
 
; coerceable(m,m',e) ==
;   m=m' => m
;   -- must find any free parameters in m
;   sl:= pmatch(m',m) => SUBLIS(sl,m')
;   coerce(["$fromCoerceable$",m,e],m') => m'
;   nil
 
(DEFUN |coerceable| (|m| |m'| |e|)
  (PROG (|sl|)
    (RETURN
     (COND ((EQUAL |m| |m'|) |m|)
           ((SETQ |sl| (|pmatch| |m'| |m|)) (SUBLIS |sl| |m'|))
           ((|coerce| (LIST '|$fromCoerceable$| |m| |e|) |m'|) |m'|)
           ('T NIL)))))
 
; coerceExit([x,m,e],m') ==
;   m':= resolve(m,m')
;   x':= replaceExitEtc(x,catchTag:= MKQ GENSYM(),"TAGGEDexit",$exitMode)
;   coerce([["CATCH",catchTag,x'],m,e],m')
 
(DEFUN |coerceExit| (|bfVar#155| |m'|)
  (PROG (|x| |m| |e| |catchTag| |x'|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#155|))
      (SETQ |m| (CADR . #1=(|bfVar#155|)))
      (SETQ |e| (CADDR . #1#))
      (SETQ |m'| (|resolve| |m| |m'|))
      (SETQ |x'|
              (|replaceExitEtc| |x| (SETQ |catchTag| (MKQ (GENSYM)))
               '|TAGGEDexit| |$exitMode|))
      (|coerce| (LIST (LIST 'CATCH |catchTag| |x'|) |m| |e|) |m'|)))))
 
; compAtSign(["@",x,m'],m,e) ==
;   e:= addDomain(m',e)
;   T:= comp(x,m',e) or return nil
;   coerce(T,m)
 
(DEFUN |compAtSign| (|bfVar#156| |m| |e|)
  (PROG (|x| |m'| T$)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#156|)))
      (SETQ |m'| (CADDR . #1#))
      (SETQ |e| (|addDomain| |m'| |e|))
      (SETQ T$ (OR (|comp| |x| |m'| |e|) (RETURN NIL)))
      (|coerce| T$ |m|)))))
 
; compCoerce(["::",x,m'],m,e) ==
;   e:= addDomain(m',e)
;   T:= compCoerce1(x,m',e) => coerce(T,m)
 
(DEFUN |compCoerce| (|bfVar#157| |m| |e|)
  (PROG (|x| |m'| T$)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#157|)))
      (SETQ |m'| (CADDR . #1#))
      (SETQ |e| (|addDomain| |m'| |e|))
      (COND ((SETQ T$ (|compCoerce1| |x| |m'| |e|)) (|coerce| T$ |m|)))))))
 
; compCoerce1(x,m',e) ==
;   T:= comp(x,m',e) or comp(x,$EmptyMode,e) or return nil
;   m1:=
;     STRINGP T.mode => $String
;     T.mode
;   m':=resolve(m1,m')
;   T:=[T.expr,m1,T.env]
;   T':= coerce(T,m') => T'
;   T':= coerceByModemap(T,m') => T'
;   pred:=isSubset(m',T.mode,e) =>
;     gg:=GENSYM()
;     pred:= substitute(gg,"*",pred)
;     code := ['PROG1, ['LET, gg, T.expr],
;                      ['check_subtype2, pred, MKQ m', MKQ T.mode, gg]]
;     [code,m',T.env]
 
(DEFUN |compCoerce1| (|x| |m'| |e|)
  (PROG (T$ |m1| |T'| |pred| |gg| |code|)
    (RETURN
     (PROGN
      (SETQ T$
              (OR (|comp| |x| |m'| |e|) (|comp| |x| |$EmptyMode| |e|)
                  (RETURN NIL)))
      (SETQ |m1| (COND ((STRINGP (CADR T$)) |$String|) ('T (CADR T$))))
      (SETQ |m'| (|resolve| |m1| |m'|))
      (SETQ T$ (LIST (CAR T$) |m1| (CADDR T$)))
      (COND ((SETQ |T'| (|coerce| T$ |m'|)) |T'|)
            ((SETQ |T'| (|coerceByModemap| T$ |m'|)) |T'|)
            ((SETQ |pred| (|isSubset| |m'| (CADR T$) |e|))
             (PROGN
              (SETQ |gg| (GENSYM))
              (SETQ |pred| (|substitute| |gg| '* |pred|))
              (SETQ |code|
                      (LIST 'PROG1 (LIST 'LET |gg| (CAR T$))
                            (LIST '|check_subtype2| |pred| (MKQ |m'|)
                                  (MKQ (CADR T$)) |gg|)))
              (LIST |code| |m'| (CADDR T$)))))))))
 
; coerceByModemap([x,m,e],m') ==
; --+ modified 6/27 for new runtime system
;   u:=
;     [modemap
;       for (modemap:= [map,cexpr]) in getModemapList("coerce",1,e) | map is [.,t,
;         s] and (modeEqual(t,m') or isSubset(t,m',e))
;            and (modeEqual(s,m) or isSubset(m,s,e))] or return nil
; 
;   --mm:= (or/[mm for (mm:=[.,[cond,.]]) in u | cond=true]) or return nil
;   mm:=first u  -- patch for non-trival conditons
;   fn :=
;     genDeltaEntry ['coerce,:mm]
;   [["call",fn,x],m',e]
 
(DEFUN |coerceByModemap| (|bfVar#160| |m'|)
  (PROG (|x| |m| |e| |map| |ISTMP#1| |cexpr| |t| |ISTMP#2| |s| |u| |mm| |fn|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#160|))
      (SETQ |m| (CADR . #1=(|bfVar#160|)))
      (SETQ |e| (CADDR . #1#))
      (SETQ |u|
              (OR
               ((LAMBDA (|bfVar#159| |bfVar#158| |modemap|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#158|)
                         (PROGN (SETQ |modemap| (CAR |bfVar#158|)) NIL))
                     (RETURN (NREVERSE |bfVar#159|)))
                    (#2='T
                     (AND (CONSP |modemap|)
                          (PROGN
                           (SETQ |map| (CAR |modemap|))
                           (SETQ |ISTMP#1| (CDR |modemap|))
                           (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                (PROGN (SETQ |cexpr| (CAR |ISTMP#1|)) #2#)))
                          (CONSP |map|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |map|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |t| (CAR |ISTMP#1|))
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |s| (CAR |ISTMP#2|))
                                       #2#)))))
                          (OR (|modeEqual| |t| |m'|) (|isSubset| |t| |m'| |e|))
                          (OR (|modeEqual| |s| |m|) (|isSubset| |m| |s| |e|))
                          (SETQ |bfVar#159| (CONS |modemap| |bfVar#159|)))))
                   (SETQ |bfVar#158| (CDR |bfVar#158|))))
                NIL (|getModemapList| '|coerce| 1 |e|) NIL)
               (RETURN NIL)))
      (SETQ |mm| (CAR |u|))
      (SETQ |fn| (|genDeltaEntry| (CONS '|coerce| |mm|)))
      (LIST (LIST '|call| |fn| |x|) |m'| |e|)))))
 
; autoCoerceByModemap([x,source,e],target) ==
;   u:=
;     [cexpr
;       for (modemap:= [map,cexpr]) in getModemapList("autoCoerce",1,e) | map is [
;         .,t,s] and modeEqual(t,target) and modeEqual(s,source)] or return nil
;   fn:= (or/[selfn for [cond,selfn] in u | cond=true]) or return nil
;   source is ["Union",:l] and member(target,l) =>
;     (y:= get(x,"condition",e)) and (or/[u is ["case",., =target] for u in y])
;        => [["call",fn,x],target,e]
;     x="$fromCoerceable$" => nil
;     stackMessage ["cannot coerce: ",x,"%l","      of mode: ",source,"%l",
;       "      to: ",target," without a case statement"]
;   [["call",fn,x],target,e]
 
(DEFUN |autoCoerceByModemap| (|bfVar#168| |target|)
  (PROG (|x| |source| |e| |map| |ISTMP#1| |cexpr| |t| |ISTMP#2| |s| |u| |cond|
         |selfn| |fn| |l| |y|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#168|))
      (SETQ |source| (CADR . #1=(|bfVar#168|)))
      (SETQ |e| (CADDR . #1#))
      (SETQ |u|
              (OR
               ((LAMBDA (|bfVar#162| |bfVar#161| |modemap|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#161|)
                         (PROGN (SETQ |modemap| (CAR |bfVar#161|)) NIL))
                     (RETURN (NREVERSE |bfVar#162|)))
                    (#2='T
                     (AND (CONSP |modemap|)
                          (PROGN
                           (SETQ |map| (CAR |modemap|))
                           (SETQ |ISTMP#1| (CDR |modemap|))
                           (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                (PROGN (SETQ |cexpr| (CAR |ISTMP#1|)) #2#)))
                          (CONSP |map|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |map|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |t| (CAR |ISTMP#1|))
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |s| (CAR |ISTMP#2|))
                                       #2#)))))
                          (|modeEqual| |t| |target|) (|modeEqual| |s| |source|)
                          (SETQ |bfVar#162| (CONS |cexpr| |bfVar#162|)))))
                   (SETQ |bfVar#161| (CDR |bfVar#161|))))
                NIL (|getModemapList| '|autoCoerce| 1 |e|) NIL)
               (RETURN NIL)))
      (SETQ |fn|
              (OR
               ((LAMBDA (|bfVar#165| |bfVar#164| |bfVar#163|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#164|)
                         (PROGN (SETQ |bfVar#163| (CAR |bfVar#164|)) NIL))
                     (RETURN |bfVar#165|))
                    (#2#
                     (AND (CONSP |bfVar#163|)
                          (PROGN
                           (SETQ |cond| (CAR |bfVar#163|))
                           (SETQ |ISTMP#1| (CDR |bfVar#163|))
                           (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                (PROGN (SETQ |selfn| (CAR |ISTMP#1|)) #2#)))
                          (EQUAL |cond| T)
                          (PROGN
                           (SETQ |bfVar#165| |selfn|)
                           (COND (|bfVar#165| (RETURN |bfVar#165|)))))))
                   (SETQ |bfVar#164| (CDR |bfVar#164|))))
                NIL |u| NIL)
               (RETURN NIL)))
      (COND
       ((AND (CONSP |source|) (EQ (CAR |source|) '|Union|)
             (PROGN (SETQ |l| (CDR |source|)) #2#) (|member| |target| |l|))
        (COND
         ((AND (SETQ |y| (|get| |x| '|condition| |e|))
               ((LAMBDA (|bfVar#167| |bfVar#166| |u|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#166|)
                         (PROGN (SETQ |u| (CAR |bfVar#166|)) NIL))
                     (RETURN |bfVar#167|))
                    (#2#
                     (PROGN
                      (SETQ |bfVar#167|
                              (AND (CONSP |u|) (EQ (CAR |u|) '|case|)
                                   (PROGN
                                    (SETQ |ISTMP#1| (CDR |u|))
                                    (AND (CONSP |ISTMP#1|)
                                         (PROGN
                                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                          (AND (CONSP |ISTMP#2|)
                                               (EQ (CDR |ISTMP#2|) NIL)
                                               (EQUAL (CAR |ISTMP#2|)
                                                      |target|)))))))
                      (COND (|bfVar#167| (RETURN |bfVar#167|))))))
                   (SETQ |bfVar#166| (CDR |bfVar#166|))))
                NIL |y| NIL))
          (LIST (LIST '|call| |fn| |x|) |target| |e|))
         ((EQ |x| '|$fromCoerceable$|) NIL)
         (#2#
          (|stackMessage|
           (LIST '|cannot coerce: | |x| '|%l| '|      of mode: | |source| '|%l|
                 '|      to: | |target| '| without a case statement|)))))
       (#2# (LIST (LIST '|call| |fn| |x|) |target| |e|)))))))
 
; resolve(din,dout) ==
;   din=$NoValueMode or dout=$NoValueMode => $NoValueMode
;   dout=$EmptyMode => din
;   din ~= dout and STRINGP dout and modeEqual(din, $String) => nil
;   dout
 
(DEFUN |resolve| (|din| |dout|)
  (PROG ()
    (RETURN
     (COND
      ((OR (EQUAL |din| |$NoValueMode|) (EQUAL |dout| |$NoValueMode|))
       |$NoValueMode|)
      ((EQUAL |dout| |$EmptyMode|) |din|)
      ((AND (NOT (EQUAL |din| |dout|)) (STRINGP |dout|)
            (|modeEqual| |din| |$String|))
       NIL)
      ('T |dout|)))))
 
; modeEqual(x,y) ==
;   -- this is the late modeEqual
;   -- orders Unions
;   atom x or atom y => x=y
;   #x ~=#y => nil
;   x is ['Union,:xl] and y is ['Union,:yl] =>
;     for x1 in xl repeat
;       for y1 in yl repeat
;         modeEqual(x1,y1) =>
;           xl := delete(x1,xl)
;           yl := delete(y1,yl)
;           return nil
;     xl or yl => nil
;     true
;   (and/[modeEqual(u,v) for u in x for v in y])
 
(DEFUN |modeEqual| (|x| |y|)
  (PROG (|xl| |yl|)
    (RETURN
     (COND ((OR (ATOM |x|) (ATOM |y|)) (EQUAL |x| |y|))
           ((NOT (EQL (LENGTH |x|) (LENGTH |y|))) NIL)
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Union|)
                 (PROGN (SETQ |xl| (CDR |x|)) #1='T) (CONSP |y|)
                 (EQ (CAR |y|) '|Union|) (PROGN (SETQ |yl| (CDR |y|)) #1#))
            (PROGN
             ((LAMBDA (|bfVar#169| |x1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#169|)
                       (PROGN (SETQ |x1| (CAR |bfVar#169|)) NIL))
                   (RETURN NIL))
                  (#1#
                   ((LAMBDA (|bfVar#170| |y1|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#170|)
                             (PROGN (SETQ |y1| (CAR |bfVar#170|)) NIL))
                         (RETURN NIL))
                        (#1#
                         (COND
                          ((|modeEqual| |x1| |y1|)
                           (IDENTITY
                            (PROGN
                             (SETQ |xl| (|delete| |x1| |xl|))
                             (SETQ |yl| (|delete| |y1| |yl|))
                             (RETURN NIL)))))))
                       (SETQ |bfVar#170| (CDR |bfVar#170|))))
                    |yl| NIL)))
                 (SETQ |bfVar#169| (CDR |bfVar#169|))))
              |xl| NIL)
             (COND ((OR |xl| |yl|) NIL) (#1# T))))
           (#1#
            ((LAMBDA (|bfVar#173| |bfVar#171| |u| |bfVar#172| |v|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#171|)
                      (PROGN (SETQ |u| (CAR |bfVar#171|)) NIL)
                      (ATOM |bfVar#172|)
                      (PROGN (SETQ |v| (CAR |bfVar#172|)) NIL))
                  (RETURN |bfVar#173|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#173| (|modeEqual| |u| |v|))
                   (COND ((NOT |bfVar#173|) (RETURN NIL))))))
                (SETQ |bfVar#171| (CDR |bfVar#171|))
                (SETQ |bfVar#172| (CDR |bfVar#172|))))
             T |x| NIL |y| NIL))))))
 
; modeEqualSubst(m1,m,e) ==
;   atom m1 and EQ(m1, m) => true
;   if atom m1 then
;       m1 :=
;           get(m1,"value",e) is [m0,:.] => m0
;           m1
;   if atom m then
;       m :=
;           get(m,"value",e) is [m2,:.] => m2
;           m
;   atom m1 or atom m => m1 = m
;   modeEqual(m1, m) => true
;   -- atom m1 => get(m1,"value",e) is [m',:.] and modeEqual(m',m)
;   m1 is [op,:l1] and m is [=op,:l2]  and # l1 = # l2 =>
; -- Above length test inserted JHD 4:47 on 15/8/86
; -- Otherwise Records can get fouled up - consider expressIdealElt
; -- in the DEFAULTS package
;         and/[modeEqualSubst(xm1,xm2,e) for xm1 in l1 for xm2 in l2]
;   nil
 
(DEFUN |modeEqualSubst| (|m1| |m| |e|)
  (PROG (|ISTMP#1| |m0| |m2| |op| |l1| |l2|)
    (RETURN
     (COND ((AND (ATOM |m1|) (EQ |m1| |m|)) T)
           (#1='T
            (PROGN
             (COND
              ((ATOM |m1|)
               (SETQ |m1|
                       (COND
                        ((PROGN
                          (SETQ |ISTMP#1| (|get| |m1| '|value| |e|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN (SETQ |m0| (CAR |ISTMP#1|)) #1#)))
                         |m0|)
                        (#1# |m1|)))))
             (COND
              ((ATOM |m|)
               (SETQ |m|
                       (COND
                        ((PROGN
                          (SETQ |ISTMP#1| (|get| |m| '|value| |e|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN (SETQ |m2| (CAR |ISTMP#1|)) #1#)))
                         |m2|)
                        (#1# |m|)))))
             (COND ((OR (ATOM |m1|) (ATOM |m|)) (EQUAL |m1| |m|))
                   ((|modeEqual| |m1| |m|) T)
                   ((AND (CONSP |m1|)
                         (PROGN
                          (SETQ |op| (CAR |m1|))
                          (SETQ |l1| (CDR |m1|))
                          #1#)
                         (CONSP |m|) (EQUAL (CAR |m|) |op|)
                         (PROGN (SETQ |l2| (CDR |m|)) #1#)
                         (EQL (LENGTH |l1|) (LENGTH |l2|)))
                    ((LAMBDA (|bfVar#176| |bfVar#174| |xm1| |bfVar#175| |xm2|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#174|)
                              (PROGN (SETQ |xm1| (CAR |bfVar#174|)) NIL)
                              (ATOM |bfVar#175|)
                              (PROGN (SETQ |xm2| (CAR |bfVar#175|)) NIL))
                          (RETURN |bfVar#176|))
                         (#1#
                          (PROGN
                           (SETQ |bfVar#176|
                                   (|modeEqualSubst| |xm1| |xm2| |e|))
                           (COND ((NOT |bfVar#176|) (RETURN NIL))))))
                        (SETQ |bfVar#174| (CDR |bfVar#174|))
                        (SETQ |bfVar#175| (CDR |bfVar#175|))))
                     T |l1| NIL |l2| NIL))
                   (#1# NIL))))))))
 
; compileSpad2Cmd args ==
;     -- This is the old compiler
;     -- Assume we entered from the "compiler" function, so args ~= nil
;     -- and is a file with file extension .spad.
; 
;     path := pathname args
;     pathnameType path ~= '"spad" => throwKeyedMsg("S2IZ0082", nil)
;     not PROBE_-FILE path => throwKeyedMsg("S2IL0003",[namestring args])
; 
;     $edit_file := path
;     sayKeyedMsg("S2IZ0038",[namestring args])
; 
;     optList :=  '( _
;       break _
;       constructor _
;       functions _
;       library _
;       lisp _
;       new _
;       old _
;       nobreak _
;       nolibrary _
;       noquiet _
;       vartrace _
;       quiet _
;         )
; 
;     -- next three are for the OLD NEW compiler
;     -- should be unhooked
; 
;     $scanIfTrue              : local := nil
;     $compileOnlyCertainItems : local := nil
;     $f                       : local := nil  -- compiler
;     $m                       : local := nil  --   variables
; 
;     -- following are for )quick option for code generation
;     $QuickLet   : local := true
;     $QuickCode  : local := true
; 
;     fun         := ['rq, 'lib]
;     constructor := nil
; 
;     for opt in $options repeat
;         [optname,:optargs] := opt
;         fullopt := selectOptionLC(optname,optList,nil)
; 
;         fullopt = 'new         => error "Internal error: compileSpad2Cmd got )new"
;         fullopt = 'old         => NIL     -- no opt
; 
;         fullopt = 'library     => fun.1 := 'lib
;         fullopt = 'nolibrary   => fun.1 := 'nolib
; 
;         -- Ignore quiet/nonquiet if "constructor" is given.
;         fullopt = 'quiet       => if fun.0 ~= 'c then fun.0 := 'rq
;         fullopt = 'noquiet     => if fun.0 ~= 'c then fun.0 := 'rf
;         fullopt = 'nobreak     => $scanIfTrue := true
;         fullopt = 'break       => $scanIfTrue := nil
;         fullopt = 'vartrace      =>
;           $QuickLet  := false
;         fullopt = 'lisp        =>
;           throwKeyedMsg("S2IZ0036",['")lisp"])
;         fullopt = 'functions   =>
;             null optargs =>
;               throwKeyedMsg("S2IZ0037",['")functions"])
;             $compileOnlyCertainItems := optargs
;         fullopt = 'constructor =>
;             null optargs =>
;               throwKeyedMsg("S2IZ0037",['")constructor"])
;             fun.0       := 'c
;             constructor := [unabbrev o for o in optargs]
;         throwKeyedMsg("S2IZ0036",[STRCONC('")",object2String optname)])
; 
;     $InteractiveMode : local := nil
;     if $compileOnlyCertainItems then
;         null constructor => sayKeyedMsg("S2IZ0040",NIL)
;         compilerDoitWithScreenedLisplib(constructor, fun)
;     else
;         compilerDoit(constructor, fun)
;     extendLocalLibdb $newConlist
;     terminateSystemCommand()
;     spadPrompt()
 
(DEFUN |compileSpad2Cmd| (|args|)
  (PROG (|$InteractiveMode| |$QuickCode| |$QuickLet| |$m| |$f|
         |$compileOnlyCertainItems| |$scanIfTrue| |fullopt| |optargs| |optname|
         |constructor| |fun| |optList| |path|)
    (DECLARE
     (SPECIAL |$InteractiveMode| |$QuickCode| |$QuickLet| |$m| |$f|
      |$compileOnlyCertainItems| |$scanIfTrue|))
    (RETURN
     (PROGN
      (SETQ |path| (|pathname| |args|))
      (COND
       ((NOT (EQUAL (|pathnameType| |path|) "spad"))
        (|throwKeyedMsg| 'S2IZ0082 NIL))
       ((NULL (PROBE-FILE |path|))
        (|throwKeyedMsg| 'S2IL0003 (LIST (|namestring| |args|))))
       (#1='T
        (PROGN
         (SETQ |$edit_file| |path|)
         (|sayKeyedMsg| 'S2IZ0038 (LIST (|namestring| |args|)))
         (SETQ |optList|
                 '(|break| |constructor| |functions| |library| |lisp| |new|
                   |old| |nobreak| |nolibrary| |noquiet| |vartrace| |quiet|))
         (SETQ |$scanIfTrue| NIL)
         (SETQ |$compileOnlyCertainItems| NIL)
         (SETQ |$f| NIL)
         (SETQ |$m| NIL)
         (SETQ |$QuickLet| T)
         (SETQ |$QuickCode| T)
         (SETQ |fun| (LIST '|rq| '|lib|))
         (SETQ |constructor| NIL)
         ((LAMBDA (|bfVar#177| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#177|)
                   (PROGN (SETQ |opt| (CAR |bfVar#177|)) NIL))
               (RETURN NIL))
              (#1#
               (PROGN
                (SETQ |optname| (CAR |opt|))
                (SETQ |optargs| (CDR |opt|))
                (SETQ |fullopt| (|selectOptionLC| |optname| |optList| NIL))
                (COND
                 ((EQ |fullopt| '|new|)
                  (|error| '|Internal error: compileSpad2Cmd got )new|))
                 ((EQ |fullopt| '|old|) NIL)
                 ((EQ |fullopt| '|library|) (SETF (ELT |fun| 1) '|lib|))
                 ((EQ |fullopt| '|nolibrary|) (SETF (ELT |fun| 1) '|nolib|))
                 ((EQ |fullopt| '|quiet|)
                  (COND
                   ((NOT (EQ (ELT |fun| 0) '|c|)) (SETF (ELT |fun| 0) '|rq|))))
                 ((EQ |fullopt| '|noquiet|)
                  (COND
                   ((NOT (EQ (ELT |fun| 0) '|c|)) (SETF (ELT |fun| 0) '|rf|))))
                 ((EQ |fullopt| '|nobreak|) (SETQ |$scanIfTrue| T))
                 ((EQ |fullopt| '|break|) (SETQ |$scanIfTrue| NIL))
                 ((EQ |fullopt| '|vartrace|) (SETQ |$QuickLet| NIL))
                 ((EQ |fullopt| '|lisp|)
                  (|throwKeyedMsg| 'S2IZ0036 (LIST ")lisp")))
                 ((EQ |fullopt| '|functions|)
                  (COND
                   ((NULL |optargs|)
                    (|throwKeyedMsg| 'S2IZ0037 (LIST ")functions")))
                   (#1# (SETQ |$compileOnlyCertainItems| |optargs|))))
                 ((EQ |fullopt| '|constructor|)
                  (COND
                   ((NULL |optargs|)
                    (|throwKeyedMsg| 'S2IZ0037 (LIST ")constructor")))
                   (#1#
                    (PROGN
                     (SETF (ELT |fun| 0) '|c|)
                     (SETQ |constructor|
                             ((LAMBDA (|bfVar#179| |bfVar#178| |o|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#178|)
                                       (PROGN
                                        (SETQ |o| (CAR |bfVar#178|))
                                        NIL))
                                   (RETURN (NREVERSE |bfVar#179|)))
                                  (#1#
                                   (SETQ |bfVar#179|
                                           (CONS (|unabbrev| |o|)
                                                 |bfVar#179|))))
                                 (SETQ |bfVar#178| (CDR |bfVar#178|))))
                              NIL |optargs| NIL))))))
                 (#1#
                  (|throwKeyedMsg| 'S2IZ0036
                   (LIST (STRCONC ")" (|object2String| |optname|)))))))))
             (SETQ |bfVar#177| (CDR |bfVar#177|))))
          |$options| NIL)
         (SETQ |$InteractiveMode| NIL)
         (COND
          (|$compileOnlyCertainItems|
           (COND ((NULL |constructor|) (|sayKeyedMsg| 'S2IZ0040 NIL))
                 (#1#
                  (|compilerDoitWithScreenedLisplib| |constructor| |fun|))))
          (#1# (|compilerDoit| |constructor| |fun|)))
         (|extendLocalLibdb| |$newConlist|)
         (|terminateSystemCommand|)
         (|spadPrompt|))))))))
 
; compilerDoit(constructor, fun) ==
;     $byConstructors : local := []
;     $constructorsSeen : local := []
;     fun = ['rf, 'lib]   => read_or_compile(true, true)    -- Ignore "noquiet".
;     fun = ['rf, 'nolib] => read_or_compile(false, false)
;     fun = ['rq, 'lib]   => read_or_compile(true, true)
;     fun = ['rq, 'nolib] => read_or_compile(true, false)
;     fun = ['c,  'lib]   =>
;       $byConstructors := [opOf x for x in constructor]
;       read_or_compile(true, true)
;       for ii in $byConstructors repeat
;         null member(ii,$constructorsSeen) =>
;           sayBrightly ['">>> Warning ",'%b,ii,'%d,'" was not found"]
 
(DEFUN |compilerDoit| (|constructor| |fun|)
  (PROG (|$constructorsSeen| |$byConstructors|)
    (DECLARE (SPECIAL |$constructorsSeen| |$byConstructors|))
    (RETURN
     (PROGN
      (SETQ |$byConstructors| NIL)
      (SETQ |$constructorsSeen| NIL)
      (COND ((EQUAL |fun| (LIST '|rf| '|lib|)) (|read_or_compile| T T))
            ((EQUAL |fun| (LIST '|rf| '|nolib|)) (|read_or_compile| NIL NIL))
            ((EQUAL |fun| (LIST '|rq| '|lib|)) (|read_or_compile| T T))
            ((EQUAL |fun| (LIST '|rq| '|nolib|)) (|read_or_compile| T NIL))
            ((EQUAL |fun| (LIST '|c| '|lib|))
             (PROGN
              (SETQ |$byConstructors|
                      ((LAMBDA (|bfVar#181| |bfVar#180| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#180|)
                                (PROGN (SETQ |x| (CAR |bfVar#180|)) NIL))
                            (RETURN (NREVERSE |bfVar#181|)))
                           (#1='T
                            (SETQ |bfVar#181|
                                    (CONS (|opOf| |x|) |bfVar#181|))))
                          (SETQ |bfVar#180| (CDR |bfVar#180|))))
                       NIL |constructor| NIL))
              (|read_or_compile| T T)
              ((LAMBDA (|bfVar#182| |ii|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#182|)
                        (PROGN (SETQ |ii| (CAR |bfVar#182|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (COND
                     ((NULL (|member| |ii| |$constructorsSeen|))
                      (IDENTITY
                       (|sayBrightly|
                        (LIST ">>> Warning " '|%b| |ii| '|%d|
                              " was not found")))))))
                  (SETQ |bfVar#182| (CDR |bfVar#182|))))
               |$byConstructors| NIL))))))))
 
; compilerDoitWithScreenedLisplib(constructor, fun) ==
;     EMBED('RWRITE,
;           '(LAMBDA (KEY VALUE STREAM)
;                    (COND ((AND (EQ STREAM $libFile)
;                                (NOT (MEMBER KEY $saveableItems)))
;                           VALUE)
;                          ((NOT NIL)
;                           (RWRITE KEY VALUE STREAM)))) )
;     UNWIND_-PROTECT(compilerDoit(constructor,fun),
;                    UNEMBED 'RWRITE)
 
(DEFUN |compilerDoitWithScreenedLisplib| (|constructor| |fun|)
  (PROG ()
    (RETURN
     (PROGN
      (EMBED 'RWRITE
       '(LAMBDA (KEY VALUE STREAM)
          (COND
           ((AND (EQ STREAM |$libFile|) (NOT (MEMBER KEY |$saveableItems|)))
            VALUE)
           ((NOT NIL) (RWRITE KEY VALUE STREAM)))))
      (UNWIND-PROTECT (|compilerDoit| |constructor| |fun|)
        (UNEMBED 'RWRITE))))))
