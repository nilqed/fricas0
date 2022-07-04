
; )package "BOOT"

(IN-PACKAGE "BOOT")

; syGeneralErrorHere() ==
;    sySpecificErrorHere('S2CY0002, [])

(DEFUN |syGeneralErrorHere| ()
  (PROG () (RETURN (|sySpecificErrorHere| 'S2CY0002 NIL))))

; sySpecificErrorHere(key, args) ==
;    sySpecificErrorAtToken($stok, key, args)

(DEFUN |sySpecificErrorHere| (|key| |args|)
  (PROG () (RETURN (|sySpecificErrorAtToken| |$stok| |key| |args|))))

; sySpecificErrorAtToken(tok, key, args) ==
;    pos := tokPosn tok
;    ncSoftError(pos, key, args)

(DEFUN |sySpecificErrorAtToken| (|tok| |key| |args|)
  (PROG (|pos|)
    (RETURN
     (PROGN
      (SETQ |pos| (|tokPosn| |tok|))
      (|ncSoftError| |pos| |key| |args|)))))

; syIgnoredFromTo(pos1, pos2) ==
;   if pfGlobalLinePosn pos1 = pfGlobalLinePosn pos2 then
;       ncSoftError(FromTo(pos1,pos2), 'S2CY0005, [])
;   else
;       ncSoftError(From pos1, 'S2CY0003, [])
;       ncSoftError(To   pos2, 'S2CY0004, [])

(DEFUN |syIgnoredFromTo| (|pos1| |pos2|)
  (PROG ()
    (RETURN
     (COND
      ((EQUAL (|pfGlobalLinePosn| |pos1|) (|pfGlobalLinePosn| |pos2|))
       (|ncSoftError| (|FromTo| |pos1| |pos2|) 'S2CY0005 NIL))
      ('T (|ncSoftError| (|From| |pos1|) 'S2CY0003 NIL)
       (|ncSoftError| (|To| |pos2|) 'S2CY0004 NIL))))))

; npMissingMate(close,open)==
;    ncSoftError(tokPosn open, 'S2CY0008, [])
;    npMissing close

(DEFUN |npMissingMate| (|close| |open|)
  (PROG ()
    (RETURN
     (PROGN
      (|ncSoftError| (|tokPosn| |open|) 'S2CY0008 NIL)
      (|npMissing| |close|)))))

; npMissing s==
;    ncSoftError(tokPosn $stok,'S2CY0007, [PNAME s])
;    THROW("TRAPPOINT","TRAPPED")

(DEFUN |npMissing| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (|ncSoftError| (|tokPosn| |$stok|) 'S2CY0007 (LIST (PNAME |s|)))
      (THROW 'TRAPPOINT 'TRAPPED)))))

; npCompMissing s == npEqKey s or npMissing s

(DEFUN |npCompMissing| (|s|)
  (PROG () (RETURN (OR (|npEqKey| |s|) (|npMissing| |s|)))))

; pfSourceStok x==
;        if pfLeaf? x
;        then x
;        else if null pfParts x
;             then 'NoToken
;             else pfSourceStok pfFirst x

(DEFUN |pfSourceStok| (|x|)
  (PROG ()
    (RETURN
     (COND ((|pfLeaf?| |x|) |x|) ((NULL (|pfParts| |x|)) '|NoToken|)
           ('T (|pfSourceStok| (|pfFirst| |x|)))))))

; npTrapForm(x)==
;    a:=pfSourceStok x
;    EQ(a,'NoToken)=>
;          syGeneralErrorHere()
;          THROW("TRAPPOINT","TRAPPED")
;    ncSoftError(tokPosn a, 'S2CY0002, [])
;    THROW("TRAPPOINT","TRAPPED")

(DEFUN |npTrapForm| (|x|)
  (PROG (|a|)
    (RETURN
     (PROGN
      (SETQ |a| (|pfSourceStok| |x|))
      (COND
       ((EQ |a| '|NoToken|)
        (PROGN (|syGeneralErrorHere|) (THROW 'TRAPPOINT 'TRAPPED)))
       ('T
        (PROGN
         (|ncSoftError| (|tokPosn| |a|) 'S2CY0002 NIL)
         (THROW 'TRAPPOINT 'TRAPPED))))))))

; npTrap()==
;    ncSoftError(tokPosn $stok,'S2CY0002,[])
;    THROW("TRAPPOINT","TRAPPED")

(DEFUN |npTrap| ()
  (PROG ()
    (RETURN
     (PROGN
      (|ncSoftError| (|tokPosn| |$stok|) 'S2CY0002 NIL)
      (THROW 'TRAPPOINT 'TRAPPED)))))

; npRecoverTrap()==
;   npFirstTok()
;   pos1 := tokPosn $stok
;   npMoveTo 0
;   pos2 := tokPosn $stok
;   syIgnoredFromTo(pos1, pos2)
;   npPush [pfWrong(pfDocument ['"pile syntax error"],pfListOf [])]

(DEFUN |npRecoverTrap| ()
  (PROG (|pos2| |pos1|)
    (RETURN
     (PROGN
      (|npFirstTok|)
      (SETQ |pos1| (|tokPosn| |$stok|))
      (|npMoveTo| 0)
      (SETQ |pos2| (|tokPosn| |$stok|))
      (|syIgnoredFromTo| |pos1| |pos2|)
      (|npPush|
       (LIST
        (|pfWrong| (|pfDocument| (LIST "pile syntax error"))
         (|pfListOf| NIL))))))))

; npListAndRecover(f)==
;    a:=$stack
;    b:=nil
;    $stack:=nil
;    done:=false
;    c:=$inputStream
;    while not done repeat
;      found:=CATCH("TRAPPOINT",APPLY(f,nil))
;      if found="TRAPPED"
;      then
;         $inputStream:=c
;         npRecoverTrap()
;      else if not found
;           then
;             $inputStream:=c
;             syGeneralErrorHere()
;             npRecoverTrap()
;      if npEqKey "BACKSET"
;      then
;         c:=$inputStream
;      else if npEqPeek "BACKTAB"
;           then
;              done:=true
;           else
;             $inputStream:=c
;             syGeneralErrorHere()
;             npRecoverTrap()
;             if npEqPeek "BACKTAB"
;             then done:=true
;             else
;                 npNext()
;                 c:=$inputStream
;      b:=cons(npPop1(),b)
;    $stack:=a
;    npPush NREVERSE b

(DEFUN |npListAndRecover| (|f|)
  (PROG (|a| |b| |done| |c| |found|)
    (RETURN
     (PROGN
      (SETQ |a| |$stack|)
      (SETQ |b| NIL)
      (SETQ |$stack| NIL)
      (SETQ |done| NIL)
      (SETQ |c| |$inputStream|)
      ((LAMBDA ()
         (LOOP
          (COND (|done| (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |found| (CATCH 'TRAPPOINT (APPLY |f| NIL)))
                  (COND
                   ((EQ |found| 'TRAPPED) (SETQ |$inputStream| |c|)
                    (|npRecoverTrap|))
                   ((NULL |found|) (SETQ |$inputStream| |c|)
                    (|syGeneralErrorHere|) (|npRecoverTrap|)))
                  (COND ((|npEqKey| 'BACKSET) (SETQ |c| |$inputStream|))
                        ((|npEqPeek| 'BACKTAB) (SETQ |done| T))
                        (#1# (SETQ |$inputStream| |c|) (|syGeneralErrorHere|)
                         (|npRecoverTrap|)
                         (COND ((|npEqPeek| 'BACKTAB) (SETQ |done| T))
                               (#1# (|npNext|) (SETQ |c| |$inputStream|)))))
                  (SETQ |b| (CONS (|npPop1|) |b|))))))))
      (SETQ |$stack| |a|)
      (|npPush| (NREVERSE |b|))))))

; npMoveTo n==
;       if null $inputStream
;       then true
;       else
;            if npEqPeek "BACKTAB"
;            then if n=0
;                 then true
;                 else (npNext();npMoveTo(n-1))
;            else if npEqPeek "BACKSET"
;                 then if n=0
;                      then true
;                      else (npNext();npMoveTo n)
;                  else if npEqKey "SETTAB"
;                       then npMoveTo(n+1)
;                       else (npNext();npMoveTo n)

(DEFUN |npMoveTo| (|n|)
  (PROG ()
    (RETURN
     (COND ((NULL |$inputStream|) T)
           ((|npEqPeek| 'BACKTAB)
            (COND ((EQL |n| 0) T) (#1='T (|npNext|) (|npMoveTo| (- |n| 1)))))
           ((|npEqPeek| 'BACKSET)
            (COND ((EQL |n| 0) T) (#1# (|npNext|) (|npMoveTo| |n|))))
           ((|npEqKey| 'SETTAB) (|npMoveTo| (+ |n| 1)))
           (#1# (|npNext|) (|npMoveTo| |n|))))))
