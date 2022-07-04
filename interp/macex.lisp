
; )package "BOOT"

(IN-PACKAGE "BOOT")

; macroExpanded pf ==
;     $macActive: local := []
;     $posActive: local := []
;
;     macExpand pf

(DEFUN |macroExpanded| (|pf|)
  (PROG (|$posActive| |$macActive|)
    (DECLARE (SPECIAL |$posActive| |$macActive|))
    (RETURN
     (PROGN
      (SETQ |$macActive| NIL)
      (SETQ |$posActive| NIL)
      (|macExpand| |pf|)))))

; macExpand pf ==
;     pfWhere?       pf => macWhere   pf
;     pfLambda?      pf => macLambda  pf
;     pfMacro?       pf => macMacro pf
;
;     pfId?          pf => macId pf
;     pfApplication? pf => macApplication pf
;     pfMapParts(function macExpand, pf)

(DEFUN |macExpand| (|pf|)
  (PROG ()
    (RETURN
     (COND ((|pfWhere?| |pf|) (|macWhere| |pf|))
           ((|pfLambda?| |pf|) (|macLambda| |pf|))
           ((|pfMacro?| |pf|) (|macMacro| |pf|))
           ((|pfId?| |pf|) (|macId| |pf|))
           ((|pfApplication?| |pf|) (|macApplication| |pf|))
           ('T (|pfMapParts| #'|macExpand| |pf|))))))

; macWhere pf ==
;     mac(pf,$pfMacros) where
;         mac(pf,$pfMacros) ==
;             -- pfWhereContext is before pfWhereExpr
;             pfMapParts(function macExpand, pf)

(DEFUN |macWhere| (|pf|) (PROG () (RETURN (|macWhere,mac| |pf| |$pfMacros|))))
(DEFUN |macWhere,mac| (|pf| |$pfMacros|)
  (DECLARE (SPECIAL |$pfMacros|))
  (PROG () (RETURN (|pfMapParts| #'|macExpand| |pf|))))

; macLambda pf ==
;     mac(pf,$pfMacros) where
;         mac(pf,$pfMacros) ==
;             pfMapParts(function macExpand, pf)

(DEFUN |macLambda| (|pf|) (PROG () (RETURN (|macLambda,mac| |pf| |$pfMacros|))))
(DEFUN |macLambda,mac| (|pf| |$pfMacros|)
  (DECLARE (SPECIAL |$pfMacros|))
  (PROG () (RETURN (|pfMapParts| #'|macExpand| |pf|))))

; macLambdaParameterHandling( replist , pform )  ==
;     pfLeaf? pform => []
;     pfLambda? pform =>      -- remove ( identifier . replacement ) from assoclist
;         parlist := [ pfTypedId p for p in pf0LambdaArgs pform ] -- extract parameters
;         for par in [ pfIdSymbol par for par in parlist ] repeat
;                 replist := AlistRemoveQ(par,replist)
;         replist
;     pfMLambda? pform =>     -- construct assoclist ( identifier . replacement )
;         parlist := pf0MLambdaArgs pform  -- extract parameter list
;         [[pfIdSymbol par ,:pfLeaf( pfAbSynOp par,GENSYM(),pfLeafPosition par)] for par in parlist ]
;     for p in pfParts pform repeat macLambdaParameterHandling( replist , p )

(DEFUN |macLambdaParameterHandling| (|replist| |pform|)
  (PROG (|parlist|)
    (RETURN
     (COND ((|pfLeaf?| |pform|) NIL)
           ((|pfLambda?| |pform|)
            (PROGN
             (SETQ |parlist|
                     ((LAMBDA (|bfVar#2| |bfVar#1| |p|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#1|)
                               (PROGN (SETQ |p| (CAR |bfVar#1|)) NIL))
                           (RETURN (NREVERSE |bfVar#2|)))
                          (#1='T
                           (SETQ |bfVar#2|
                                   (CONS (|pfTypedId| |p|) |bfVar#2|))))
                         (SETQ |bfVar#1| (CDR |bfVar#1|))))
                      NIL (|pf0LambdaArgs| |pform|) NIL))
             ((LAMBDA (|bfVar#5| |par|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#5|)
                       (PROGN (SETQ |par| (CAR |bfVar#5|)) NIL))
                   (RETURN NIL))
                  (#1# (SETQ |replist| (|AlistRemoveQ| |par| |replist|))))
                 (SETQ |bfVar#5| (CDR |bfVar#5|))))
              ((LAMBDA (|bfVar#4| |bfVar#3| |par|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#3|)
                        (PROGN (SETQ |par| (CAR |bfVar#3|)) NIL))
                    (RETURN (NREVERSE |bfVar#4|)))
                   (#1#
                    (SETQ |bfVar#4| (CONS (|pfIdSymbol| |par|) |bfVar#4|))))
                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
               NIL |parlist| NIL)
              NIL)
             |replist|))
           ((|pfMLambda?| |pform|)
            (PROGN
             (SETQ |parlist| (|pf0MLambdaArgs| |pform|))
             ((LAMBDA (|bfVar#7| |bfVar#6| |par|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#6|)
                       (PROGN (SETQ |par| (CAR |bfVar#6|)) NIL))
                   (RETURN (NREVERSE |bfVar#7|)))
                  (#1#
                   (SETQ |bfVar#7|
                           (CONS
                            (CONS (|pfIdSymbol| |par|)
                                  (|pfLeaf| (|pfAbSynOp| |par|) (GENSYM)
                                   (|pfLeafPosition| |par|)))
                            |bfVar#7|))))
                 (SETQ |bfVar#6| (CDR |bfVar#6|))))
              NIL |parlist| NIL)))
           (#1#
            ((LAMBDA (|bfVar#8| |p|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#8|) (PROGN (SETQ |p| (CAR |bfVar#8|)) NIL))
                  (RETURN NIL))
                 (#1# (|macLambdaParameterHandling| |replist| |p|)))
                (SETQ |bfVar#8| (CDR |bfVar#8|))))
             (|pfParts| |pform|) NIL))))))

; macSubstituteId( replist , pform ) ==
;     ex := AlistAssocQ( pfIdSymbol pform , replist )
;     ex =>
;         RPLPAIR(pform, rest ex)
;         pform
;     pform

(DEFUN |macSubstituteId| (|replist| |pform|)
  (PROG (|ex|)
    (RETURN
     (PROGN
      (SETQ |ex| (|AlistAssocQ| (|pfIdSymbol| |pform|) |replist|))
      (COND (|ex| (PROGN (RPLPAIR |pform| (CDR |ex|)) |pform|))
            ('T |pform|))))))

; macSubstituteOuter( pform ) ==
;     mac0SubstituteOuter( macLambdaParameterHandling( [] , pform ) , pform )

(DEFUN |macSubstituteOuter| (|pform|)
  (PROG ()
    (RETURN
     (|mac0SubstituteOuter| (|macLambdaParameterHandling| NIL |pform|)
      |pform|))))

; mac0SubstituteOuter( replist , pform ) ==
;     pfId? pform => macSubstituteId( replist , pform )
;     pfLeaf? pform => pform
;     pfLambda? pform =>
;         tmplist := macLambdaParameterHandling( replist , pform )
;         for p in pfParts pform repeat mac0SubstituteOuter( tmplist , p )
;         pform
;     for p in pfParts pform repeat mac0SubstituteOuter( replist , p )
;     pform

(DEFUN |mac0SubstituteOuter| (|replist| |pform|)
  (PROG (|tmplist|)
    (RETURN
     (COND ((|pfId?| |pform|) (|macSubstituteId| |replist| |pform|))
           ((|pfLeaf?| |pform|) |pform|)
           ((|pfLambda?| |pform|)
            (PROGN
             (SETQ |tmplist| (|macLambdaParameterHandling| |replist| |pform|))
             ((LAMBDA (|bfVar#9| |p|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#9|) (PROGN (SETQ |p| (CAR |bfVar#9|)) NIL))
                   (RETURN NIL))
                  (#1='T (|mac0SubstituteOuter| |tmplist| |p|)))
                 (SETQ |bfVar#9| (CDR |bfVar#9|))))
              (|pfParts| |pform|) NIL)
             |pform|))
           (#1#
            (PROGN
             ((LAMBDA (|bfVar#10| |p|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#10|)
                       (PROGN (SETQ |p| (CAR |bfVar#10|)) NIL))
                   (RETURN NIL))
                  (#1# (|mac0SubstituteOuter| |replist| |p|)))
                 (SETQ |bfVar#10| (CDR |bfVar#10|))))
              (|pfParts| |pform|) NIL)
             |pform|))))))

; macMacro pf ==
;     lhs := pfMacroLhs pf
;     rhs := pfMacroRhs pf
;     not pfId? lhs =>
;         ncSoftError (pfSourcePosition lhs, 'S2CM0001, [%pform lhs] )
;         pf
;     sy := pfIdSymbol lhs
;
;     mac0Define(sy, if pfMLambda? rhs then 'mlambda else 'mbody, macSubstituteOuter rhs)
;
;     if pfNothing? rhs then pf else pfMacro(lhs, pfNothing())

(DEFUN |macMacro| (|pf|)
  (PROG (|lhs| |rhs| |sy|)
    (RETURN
     (PROGN
      (SETQ |lhs| (|pfMacroLhs| |pf|))
      (SETQ |rhs| (|pfMacroRhs| |pf|))
      (COND
       ((NULL (|pfId?| |lhs|))
        (PROGN
         (|ncSoftError| (|pfSourcePosition| |lhs|) 'S2CM0001
          (LIST (|%pform| |lhs|)))
         |pf|))
       (#1='T
        (PROGN
         (SETQ |sy| (|pfIdSymbol| |lhs|))
         (|mac0Define| |sy|
          (COND ((|pfMLambda?| |rhs|) '|mlambda|) (#1# '|mbody|))
          (|macSubstituteOuter| |rhs|))
         (COND ((|pfNothing?| |rhs|) |pf|)
               (#1# (|pfMacro| |lhs| (|pfNothing|)))))))))))

; mac0Define(sy, state, body) ==
;     $pfMacros := cons([sy, state, body], $pfMacros)

(DEFUN |mac0Define| (|sy| |state| |body|)
  (PROG ()
    (RETURN (SETQ |$pfMacros| (CONS (LIST |sy| |state| |body|) |$pfMacros|)))))

; mac0Get sy ==
;     IFCDR ASSOC(sy, $pfMacros)

(DEFUN |mac0Get| (|sy|) (PROG () (RETURN (IFCDR (ASSOC |sy| |$pfMacros|)))))

; mac0GetName body ==
;     name := nil
;     for [sy,st,bd] in $pfMacros while not name repeat
;         if st = 'mlambda then
;             bd := pfMLambdaBody bd
;         EQ(bd, body) => name := [sy,st]
;     name

(DEFUN |mac0GetName| (|body|)
  (PROG (|name| |sy| |ISTMP#1| |st| |ISTMP#2| |bd|)
    (RETURN
     (PROGN
      (SETQ |name| NIL)
      ((LAMBDA (|bfVar#12| |bfVar#11|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#12|)
                (PROGN (SETQ |bfVar#11| (CAR |bfVar#12|)) NIL) |name|)
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#11|)
                 (PROGN
                  (SETQ |sy| (CAR |bfVar#11|))
                  (SETQ |ISTMP#1| (CDR |bfVar#11|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |st| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |bd| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (COND
                   ((EQ |st| '|mlambda|) (SETQ |bd| (|pfMLambdaBody| |bd|))))
                  (COND ((EQ |bd| |body|) (SETQ |name| (LIST |sy| |st|))))))))
          (SETQ |bfVar#12| (CDR |bfVar#12|))))
       |$pfMacros| NIL)
      |name|))))

; macId pf ==
;     sy := pfIdSymbol pf
;     not (got := mac0Get sy) => pf
;     [state, body] := got
;
;     state = 'mparam     => body                                         -- expanded already
;     state = 'mlambda    => pfCopyWithPos( body , pfSourcePosition pf )  -- expanded later
;
;     pfCopyWithPos( mac0ExpandBody(body, pf, $macActive, $posActive) , pfSourcePosition pf )

(DEFUN |macId| (|pf|)
  (PROG (|sy| |got| |state| |body|)
    (RETURN
     (PROGN
      (SETQ |sy| (|pfIdSymbol| |pf|))
      (COND ((NULL (SETQ |got| (|mac0Get| |sy|))) |pf|)
            (#1='T
             (PROGN
              (SETQ |state| (CAR |got|))
              (SETQ |body| (CADR |got|))
              (COND ((EQ |state| '|mparam|) |body|)
                    ((EQ |state| '|mlambda|)
                     (|pfCopyWithPos| |body| (|pfSourcePosition| |pf|)))
                    (#1#
                     (|pfCopyWithPos|
                      (|mac0ExpandBody| |body| |pf| |$macActive| |$posActive|)
                      (|pfSourcePosition| |pf|)))))))))))

; macApplication pf ==
;     pf := pfMapParts(function macExpand, pf)
;
;     op := pfApplicationOp pf
;     not pfMLambda? op => pf
;
;     args := pf0ApplicationArgs pf
;     mac0MLambdaApply(op, args, pf, $pfMacros)

(DEFUN |macApplication| (|pf|)
  (PROG (|op| |args|)
    (RETURN
     (PROGN
      (SETQ |pf| (|pfMapParts| #'|macExpand| |pf|))
      (SETQ |op| (|pfApplicationOp| |pf|))
      (COND ((NULL (|pfMLambda?| |op|)) |pf|)
            ('T
             (PROGN
              (SETQ |args| (|pf0ApplicationArgs| |pf|))
              (|mac0MLambdaApply| |op| |args| |pf| |$pfMacros|))))))))

; mac0MLambdaApply(mlambda, args, opf, $pfMacros) ==
;     params := pf0MLambdaArgs mlambda
;     body   := pfMLambdaBody  mlambda
;     #args ~= #params =>
;         pos := pfSourcePosition opf
;         ncHardError(pos,'S2CM0003, [#params,#args])
;     for p in params for a in args repeat
;         not pfId? p =>
;             pos := pfSourcePosition opf
;             ncHardError(pos, 'S2CM0004, [%pform p])
;         mac0Define(pfIdSymbol p, 'mparam, a)
;
;     mac0ExpandBody( body , opf, $macActive, $posActive)

(DEFUN |mac0MLambdaApply| (|mlambda| |args| |opf| |$pfMacros|)
  (DECLARE (SPECIAL |$pfMacros|))
  (PROG (|params| |body| |pos|)
    (RETURN
     (PROGN
      (SETQ |params| (|pf0MLambdaArgs| |mlambda|))
      (SETQ |body| (|pfMLambdaBody| |mlambda|))
      (COND
       ((NOT (EQL (LENGTH |args|) (LENGTH |params|)))
        (PROGN
         (SETQ |pos| (|pfSourcePosition| |opf|))
         (|ncHardError| |pos| 'S2CM0003
          (LIST (LENGTH |params|) (LENGTH |args|)))))
       (#1='T
        (PROGN
         ((LAMBDA (|bfVar#13| |p| |bfVar#14| |a|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#13|) (PROGN (SETQ |p| (CAR |bfVar#13|)) NIL)
                   (ATOM |bfVar#14|) (PROGN (SETQ |a| (CAR |bfVar#14|)) NIL))
               (RETURN NIL))
              (#1#
               (COND
                ((NULL (|pfId?| |p|))
                 (PROGN
                  (SETQ |pos| (|pfSourcePosition| |opf|))
                  (|ncHardError| |pos| 'S2CM0004 (LIST (|%pform| |p|)))))
                (#1# (|mac0Define| (|pfIdSymbol| |p|) '|mparam| |a|)))))
             (SETQ |bfVar#13| (CDR |bfVar#13|))
             (SETQ |bfVar#14| (CDR |bfVar#14|))))
          |params| NIL |args| NIL)
         (|mac0ExpandBody| |body| |opf| |$macActive| |$posActive|))))))))

; mac0ExpandBody(body, opf, $macActive, $posActive) ==
;     MEMQ(body,$macActive) =>
;         [.,pf] := $posActive
;         posn   := pfSourcePosition pf
;         mac0InfiniteExpansion(posn, body, $macActive)
;     $macActive := [body, :$macActive]
;     $posActive := [opf,  :$posActive]
;     macExpand body

(DEFUN |mac0ExpandBody| (|body| |opf| |$macActive| |$posActive|)
  (DECLARE (SPECIAL |$macActive| |$posActive|))
  (PROG (|pf| |posn|)
    (RETURN
     (COND
      ((MEMQ |body| |$macActive|)
       (PROGN
        (SETQ |pf| (CADR |$posActive|))
        (SETQ |posn| (|pfSourcePosition| |pf|))
        (|mac0InfiniteExpansion| |posn| |body| |$macActive|)))
      ('T
       (PROGN
        (SETQ |$macActive| (CONS |body| |$macActive|))
        (SETQ |$posActive| (CONS |opf| |$posActive|))
        (|macExpand| |body|)))))))

; mac0InfiniteExpansion(posn, body, active) ==
;     blist := [body, :active]
;     [fname, :rnames] := [name b for b in blist] where
;         name b ==
;             got := mac0GetName b
;             not got => '"???"
;             [sy,st] := got
;             st = 'mlambda => CONCAT(PNAME sy, '"(...)")
;             PNAME sy
;     ncSoftError (posn, 'S2CM0005, _
;        [ [:[n,'"==>"] for n in reverse rnames], fname, %pform body ]  )
;
;     body

(DEFUN |mac0InfiniteExpansion| (|posn| |body| |active|)
  (PROG (|blist| |LETTMP#1| |fname| |rnames|)
    (RETURN
     (PROGN
      (SETQ |blist| (CONS |body| |active|))
      (SETQ |LETTMP#1|
              ((LAMBDA (|bfVar#16| |bfVar#15| |b|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#15|)
                        (PROGN (SETQ |b| (CAR |bfVar#15|)) NIL))
                    (RETURN (NREVERSE |bfVar#16|)))
                   (#1='T
                    (SETQ |bfVar#16|
                            (CONS (|mac0InfiniteExpansion,name| |b|)
                                  |bfVar#16|))))
                  (SETQ |bfVar#15| (CDR |bfVar#15|))))
               NIL |blist| NIL))
      (SETQ |fname| (CAR |LETTMP#1|))
      (SETQ |rnames| (CDR |LETTMP#1|))
      (|ncSoftError| |posn| 'S2CM0005
       (LIST
        ((LAMBDA (|bfVar#18| |bfVar#17| |n|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#17|) (PROGN (SETQ |n| (CAR |bfVar#17|)) NIL))
              (RETURN (NREVERSE |bfVar#18|)))
             (#1#
              (SETQ |bfVar#18|
                      (APPEND (REVERSE (LIST |n| "==>")) |bfVar#18|))))
            (SETQ |bfVar#17| (CDR |bfVar#17|))))
         NIL (REVERSE |rnames|) NIL)
        |fname| (|%pform| |body|)))
      |body|))))
(DEFUN |mac0InfiniteExpansion,name| (|b|)
  (PROG (|got| |sy| |st|)
    (RETURN
     (PROGN
      (SETQ |got| (|mac0GetName| |b|))
      (COND ((NULL |got|) "???")
            (#1='T
             (PROGN
              (SETQ |sy| (CAR |got|))
              (SETQ |st| (CADR |got|))
              (COND ((EQ |st| '|mlambda|) (CONCAT (PNAME |sy|) "(...)"))
                    (#1# (PNAME |sy|))))))))))
