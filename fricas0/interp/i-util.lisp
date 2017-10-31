 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; wrap x ==
;   isWrapped x => x
;   ['WRAPPED,:x]
 
(DEFUN |wrap| (|x|)
  (PROG () (RETURN (COND ((|isWrapped| |x|) |x|) ('T (CONS 'WRAPPED |x|))))))
 
; isWrapped x == x is ['WRAPPED,:.] or NUMBERP x or FLOATP x or STRINGP x
 
(DEFUN |isWrapped| (|x|)
  (PROG ()
    (RETURN
     (OR (AND (CONSP |x|) (EQ (CAR |x|) 'WRAPPED)) (NUMBERP |x|) (FLOATP |x|)
         (STRINGP |x|)))))
 
; unwrap x ==
;   NUMBERP x or FLOATP x or STRINGP x => x
;   x is ["WRAPPED",:y] => y
;   x
 
(DEFUN |unwrap| (|x|)
  (PROG (|y|)
    (RETURN
     (COND ((OR (NUMBERP |x|) (FLOATP |x|) (STRINGP |x|)) |x|)
           ((AND (CONSP |x|) (EQ (CAR |x|) 'WRAPPED)
                 (PROGN (SETQ |y| (CDR |x|)) #1='T))
            |y|)
           (#1# |x|)))))
 
; wrapped2Quote x ==
;   x is ["WRAPPED",:y] => MKQ y
;   x
 
(DEFUN |wrapped2Quote| (|x|)
  (PROG (|y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) 'WRAPPED)
            (PROGN (SETQ |y| (CDR |x|)) #1='T))
       (MKQ |y|))
      (#1# |x|)))))
 
; quote2Wrapped x ==
;   x is ['QUOTE,y] => wrap y
;   x
 
(DEFUN |quote2Wrapped| (|x|)
  (PROG (|ISTMP#1| |y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1='T))))
       (|wrap| |y|))
      (#1# |x|)))))
 
; removeQuote x ==
;   x is ["QUOTE",y] => y
;   x
 
(DEFUN |removeQuote| (|x|)
  (PROG (|ISTMP#1| |y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1='T))))
       |y|)
      (#1# |x|)))))
 
; spadPrompt() ==
;   SAY '"   FriCAS"
;   sayNewLine()
 
(DEFUN |spadPrompt| #1=()
  (PROG #1# (RETURN (PROGN (SAY "   FriCAS") (|sayNewLine|)))))
 
; princPrompt() ==
;   ioHook("startPrompt")
;   PRINC MKPROMPT()
;   ioHook("endOfPrompt")
 
(DEFUN |princPrompt| #1=()
  (PROG #1#
    (RETURN
     (PROGN
      (|ioHook| '|startPrompt|)
      (PRINC (MKPROMPT))
      (|ioHook| '|endOfPrompt|)))))
 
; MKPROMPT() ==
;   $inputPromptType = 'none    => '""
;   $inputPromptType = 'plain   => '"-> "
;   $inputPromptType = 'step    =>
;     STRCONC('"(",STRINGIMAGE $IOindex,'") -> ")
;   $inputPromptType = 'frame   =>
;     STRCONC(STRINGIMAGE $interpreterFrameName,
;       '" (",STRINGIMAGE $IOindex,'") -> ")
;   STRCONC(STRINGIMAGE $interpreterFrameName,
;    '" [", SUBSTRING(CURRENTTIME(),8,NIL),'"] [",
;     STRINGIMAGE $IOindex, '"] -> ")
 
(DEFUN MKPROMPT #1=()
  (PROG #1#
    (RETURN
     (COND ((EQ |$inputPromptType| '|none|) "")
           ((EQ |$inputPromptType| '|plain|) "-> ")
           ((EQ |$inputPromptType| '|step|)
            (STRCONC "(" (STRINGIMAGE |$IOindex|) ") -> "))
           ((EQ |$inputPromptType| '|frame|)
            (STRCONC (STRINGIMAGE |$interpreterFrameName|) " ("
             (STRINGIMAGE |$IOindex|) ") -> "))
           ('T
            (STRCONC (STRINGIMAGE |$interpreterFrameName|) " ["
             (SUBSTRING (CURRENTTIME) 8 NIL) "] [" (STRINGIMAGE |$IOindex|)
             "] -> "))))))
 
; Zeros n ==
;   BOUNDP '$ZeroVecCache and #$ZeroVecCache=n => $ZeroVecCache
;   $ZeroVecCache:= MAKE_-VEC n
;   for i in 0..n-1 repeat $ZeroVecCache.i:=0
;   $ZeroVecCache
 
(DEFUN |Zeros| (|n|)
  (PROG ()
    (RETURN
     (COND
      ((AND (BOUNDP '|$ZeroVecCache|) (EQL (LENGTH |$ZeroVecCache|) |n|))
       |$ZeroVecCache|)
      (#1='T
       (PROGN
        (SETQ |$ZeroVecCache| (MAKE-VEC |n|))
        ((LAMBDA (|bfVar#1| |i|)
           (LOOP
            (COND ((> |i| |bfVar#1|) (RETURN NIL))
                  (#1# (SETF (ELT |$ZeroVecCache| |i|) 0)))
            (SETQ |i| (+ |i| 1))))
         (- |n| 1) 0)
        |$ZeroVecCache|))))))
 
; LZeros n ==
;   n < 1 => nil
;   l := [0]
;   for i in 2..n repeat l := [0, :l]
;   l
 
(DEFUN |LZeros| (|n|)
  (PROG (|l|)
    (RETURN
     (COND ((< |n| 1) NIL)
           (#1='T
            (PROGN
             (SETQ |l| (LIST 0))
             ((LAMBDA (|i|)
                (LOOP
                 (COND ((> |i| |n|) (RETURN NIL))
                       (#1# (SETQ |l| (CONS 0 |l|))))
                 (SETQ |i| (+ |i| 1))))
              2)
             |l|))))))
 
; isSubDomain(d1,d2) ==
;   -- d1 and d2 are different domains
;   subDomainList := '(Integer NonNegativeInteger PositiveInteger)
;   ATOM d1 or ATOM d2 => nil
;   l := MEMQ(first d2, subDomainList) =>
;     MEMQ(first d1, rest l)
;   nil
 
(DEFUN |isSubDomain| (|d1| |d2|)
  (PROG (|subDomainList| |l|)
    (RETURN
     (PROGN
      (SETQ |subDomainList|
              '(|Integer| |NonNegativeInteger| |PositiveInteger|))
      (COND ((OR (ATOM |d1|) (ATOM |d2|)) NIL)
            ((SETQ |l| (MEMQ (CAR |d2|) |subDomainList|))
             (MEMQ (CAR |d1|) (CDR |l|)))
            ('T NIL))))))
 
; $variableNumberAlist := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$variableNumberAlist| NIL))
 
; variableNumber(x) ==
;   p := ASSQ(x, $variableNumberAlist)
;   null p =>
;     $variableNumberAlist := [[x,:0], :$variableNumberAlist]
;     0
;   RPLACD(p, 1+CDR p)
;   CDR p
 
(DEFUN |variableNumber| (|x|)
  (PROG (|p|)
    (RETURN
     (PROGN
      (SETQ |p| (ASSQ |x| |$variableNumberAlist|))
      (COND
       ((NULL |p|)
        (PROGN
         (SETQ |$variableNumberAlist|
                 (CONS (CONS |x| 0) |$variableNumberAlist|))
         0))
       ('T (PROGN (RPLACD |p| (+ 1 (CDR |p|))) (CDR |p|))))))))
 
; Undef(:u) ==
;   u':= last u
;   [[domain,slot],op,sig]:= u'
;   domain':=eval mkEvalable domain
;   not EQ(first ELT(domain', slot), Undef) =>
; -- OK - thefunction is now defined
;     [:u'',.]:=u
;     if $reportBottomUpFlag then
;       sayMessage concat ['"   Retrospective determination of slot",'%b,
;         slot,'%d,'"of",'%b,:prefix2String domain,'%d]
;     APPLY(first ELT(domain', slot), [:u'', rest ELT(domain', slot)])
;   throwKeyedMsg("S2IF0008",[formatOpSignature(op,sig),domain])
 
(DEFUN |Undef| (&REST |u|)
  (PROG (|u'| |domain| |slot| |op| |sig| |domain'| |LETTMP#1| |u''|)
    (RETURN
     (PROGN
      (SETQ |u'| (|last| |u|))
      (SETQ |domain| (CAAR . #1=(|u'|)))
      (SETQ |slot| (CADAR . #1#))
      (SETQ |op| (CADR . #2=(|u'|)))
      (SETQ |sig| (CADDR . #2#))
      (SETQ |domain'| (|eval| (|mkEvalable| |domain|)))
      (COND
       ((NULL (EQ (CAR (ELT |domain'| |slot|)) |Undef|))
        (PROGN
         (SETQ |LETTMP#1| (REVERSE |u|))
         (SETQ |u''| (NREVERSE (CDR |LETTMP#1|)))
         (COND
          (|$reportBottomUpFlag|
           (|sayMessage|
            (|concat|
             (CONS "   Retrospective determination of slot"
                   (CONS '|%b|
                         (CONS |slot|
                               (CONS '|%d|
                                     (CONS "of"
                                           (CONS '|%b|
                                                 (APPEND
                                                  (|prefix2String| |domain|)
                                                  (CONS '|%d| NIL))))))))))))
         (APPLY (CAR (ELT |domain'| |slot|))
                (APPEND |u''| (CONS (CDR (ELT |domain'| |slot|)) NIL)))))
       ('T
        (|throwKeyedMsg| 'S2IF0008
         (LIST (|formatOpSignature| |op| |sig|) |domain|))))))))
 
; devaluateList l == [devaluate d for d in l]
 
(DEFUN |devaluateList| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#3| |bfVar#2| |d|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#2|) (PROGN (SETQ |d| (CAR |bfVar#2|)) NIL))
           (RETURN (NREVERSE |bfVar#3|)))
          ('T (SETQ |bfVar#3| (CONS (|devaluate| |d|) |bfVar#3|))))
         (SETQ |bfVar#2| (CDR |bfVar#2|))))
      NIL |l| NIL))))
 
; HasSignature(domain,[op,sig]) ==
;   compiledLookup(op,sig,domain)
 
(DEFUN |HasSignature| (|domain| |bfVar#4|)
  (PROG (|op| |sig|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#4|))
      (SETQ |sig| (CADR |bfVar#4|))
      (|compiledLookup| |op| |sig| |domain|)))))
 
; addModemap(op,mc,sig,pred,fn,$e) ==
;   $InteractiveMode => $e
;   if knownInfo pred then pred:=true
;   $insideCapsuleFunctionIfTrue=true =>
;     $CapsuleModemapFrame :=
;       addModemap0(op,mc,sig,pred,fn,$CapsuleModemapFrame)
;     $e
;   addModemap0(op,mc,sig,pred,fn,$e)
 
(DEFUN |addModemap| (|op| |mc| |sig| |pred| |fn| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG ()
    (RETURN
     (COND (|$InteractiveMode| |$e|)
           (#1='T
            (PROGN
             (COND ((|knownInfo| |pred|) (SETQ |pred| T)))
             (COND
              ((EQUAL |$insideCapsuleFunctionIfTrue| T)
               (PROGN
                (SETQ |$CapsuleModemapFrame|
                        (|addModemap0| |op| |mc| |sig| |pred| |fn|
                         |$CapsuleModemapFrame|))
                |$e|))
              (#1# (|addModemap0| |op| |mc| |sig| |pred| |fn| |$e|)))))))))
 
; lispize x == first optimize [x]
 
(DEFUN |lispize| (|x|) (PROG () (RETURN (CAR (|optimize| (LIST |x|))))))
 
; mkPredList listOfEntries ==
;      [['EQCAR,"#1",i] for arg in listOfEntries for i in 0..]
 
(DEFUN |mkPredList| (|listOfEntries|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#6| |bfVar#5| |arg| |i|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#5|) (PROGN (SETQ |arg| (CAR |bfVar#5|)) NIL))
           (RETURN (NREVERSE |bfVar#6|)))
          ('T (SETQ |bfVar#6| (CONS (LIST 'EQCAR '|#1| |i|) |bfVar#6|))))
         (SETQ |bfVar#5| (CDR |bfVar#5|))
         (SETQ |i| (+ |i| 1))))
      NIL |listOfEntries| NIL 0))))
 
; TruthP x ==
;     --True if x is a predicate that's always true
;   x is nil => nil
;   x=true => true
;   x is ['QUOTE,:.] => true
;   nil
 
(DEFUN |TruthP| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) NIL) ((EQUAL |x| T) T)
           ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)) T) ('T NIL)))))
