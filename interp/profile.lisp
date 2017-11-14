 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; $profileAlist := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$profileAlist| NIL))
 
; profileWrite() ==  --called from finalizeLisplib
;   outStream := MAKE_-OUTSTREAM CONCAT(LIBSTREAM_-DIRNAME $libFile,'"/info")
;   -- logically _*PRINT_-PRETTY_* should be local, but Common Lisp
;   -- forces us to omit it.
;   _*PRINT_-PRETTY_* := 'T
;   print_full2(profileTran $profileAlist, outStream)
;   SHUT outStream
 
(DEFUN |profileWrite| ()
  (PROG (*PRINT-PRETTY* |outStream|)
    (RETURN
     (PROGN
      (SETQ |outStream|
              (MAKE-OUTSTREAM (CONCAT (LIBSTREAM-DIRNAME |$libFile|) "/info")))
      (SETQ *PRINT-PRETTY* 'T)
      (|print_full2| (|profileTran| |$profileAlist|) |outStream|)
      (SHUT |outStream|)))))
 
; profileTran alist ==
;   $profileHash := MAKE_-HASH_-TABLE()
;   for [opSig,:info] in alist repeat
;     op := opOf opSig
;     sig := IFCAR IFCDR opSig
;     HPUT($profileHash,op,[[sig,:info],:HGET($profileHash,op)])
;   [[key,:HGET($profileHash,key)] for key in mySort HKEYS $profileHash]
 
(DEFUN |profileTran| (|alist|)
  (PROG (|opSig| |info| |op| |sig|)
    (RETURN
     (PROGN
      (SETQ |$profileHash| (MAKE-HASH-TABLE))
      ((LAMBDA (|bfVar#2| |bfVar#1|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#1|)
                 (PROGN
                  (SETQ |opSig| (CAR |bfVar#1|))
                  (SETQ |info| (CDR |bfVar#1|))
                  #1#)
                 (PROGN
                  (SETQ |op| (|opOf| |opSig|))
                  (SETQ |sig| (IFCAR (IFCDR |opSig|)))
                  (HPUT |$profileHash| |op|
                        (CONS (CONS |sig| |info|)
                              (HGET |$profileHash| |op|)))))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |alist| NIL)
      ((LAMBDA (|bfVar#4| |bfVar#3| |key|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |key| (CAR |bfVar#3|)) NIL))
            (RETURN (NREVERSE |bfVar#4|)))
           (#1#
            (SETQ |bfVar#4|
                    (CONS (CONS |key| (HGET |$profileHash| |key|))
                          |bfVar#4|))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       NIL (|mySort| (HKEYS |$profileHash|)) NIL)))))
 
; profileRecord(label,name,info) ==  --name: info is var: type or op: sig
; --$profileAlist is ((op . alist1) ...) where
; --  alist1      is ((label . alist2) ...) where
; --    alist2    is ((name . info) ...)
;   if $insideCapsuleFunctionIfTrue then
;     op := $op
;     argl := rest $form
;     opSig := [$op,$signatureOfForm]
;   else
;     op := 'constructor
;     argl := nil
;     opSig := [op]
;   if label = 'locals and MEMQ(name,argl) then label := 'arguments
;   alist1        := LASSOC(opSig,$profileAlist)
;   alist2        := LASSOC(label,alist1)
;   newAlist2     := insertAlist(name,info,alist2)
;   newAlist1     := insertAlist(label,newAlist2,alist1)
;   $profileAlist := insertAlist(opSig,newAlist1,$profileAlist)
;   $profileAlist
 
(DEFUN |profileRecord| (|label| |name| |info|)
  (PROG (|op| |argl| |opSig| |alist1| |alist2| |newAlist2| |newAlist1|)
    (RETURN
     (PROGN
      (COND
       (|$insideCapsuleFunctionIfTrue| (SETQ |op| |$op|)
        (SETQ |argl| (CDR |$form|))
        (SETQ |opSig| (LIST |$op| |$signatureOfForm|)))
       ('T (SETQ |op| '|constructor|) (SETQ |argl| NIL)
        (SETQ |opSig| (LIST |op|))))
      (COND
       ((AND (EQ |label| '|locals|) (MEMQ |name| |argl|))
        (SETQ |label| '|arguments|)))
      (SETQ |alist1| (LASSOC |opSig| |$profileAlist|))
      (SETQ |alist2| (LASSOC |label| |alist1|))
      (SETQ |newAlist2| (|insertAlist| |name| |info| |alist2|))
      (SETQ |newAlist1| (|insertAlist| |label| |newAlist2| |alist1|))
      (SETQ |$profileAlist|
              (|insertAlist| |opSig| |newAlist1| |$profileAlist|))
      |$profileAlist|))))
 
; profileDisplay() ==
;   profileDisplayOp('constructor,LASSOC('constructor,$profileAlist) )
;   for [op,:alist1] in $profileAlist | op ~= 'constructor repeat
;     profileDisplayOp(op,alist1)
 
(DEFUN |profileDisplay| ()
  (PROG (|alist1| |op|)
    (RETURN
     (PROGN
      (|profileDisplayOp| '|constructor|
       (LASSOC '|constructor| |$profileAlist|))
      ((LAMBDA (|bfVar#6| |bfVar#5|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#5|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#5|))
                  (SETQ |alist1| (CDR |bfVar#5|))
                  #1#)
                 (NOT (EQ |op| '|constructor|))
                 (|profileDisplayOp| |op| |alist1|))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       |$profileAlist| NIL)))))
 
; profileDisplayOp(op,alist1) ==
;   sayBrightly op
;   if LASSOC('arguments,alist1) then
;     sayBrightly '"  arguments"
;     for [x,:t] in MSORT LASSOC('arguments,alist1) repeat
;       sayBrightly concat('"     ",x,": ",prefix2String t)
;   if LASSOC('locals,alist1) then
;     sayBrightly '"  locals"
;     for [x,:t] in MSORT LASSOC('locals,alist1) repeat
;       sayBrightly concat('"     ",x,": ",prefix2String t)
;   for [con,:alist2] in alist1 | not MEMQ(con,'(locals arguments)) repeat
;     sayBrightly concat('"  ",prefix2String con)
;     for [op1,:sig] in MSORT alist2 repeat
;       sayBrightly ['"    ",:formatOpSignature(op1,sig)]
 
(DEFUN |profileDisplayOp| (|op| |alist1|)
  (PROG (|x| |t| |con| |alist2| |op1| |sig|)
    (RETURN
     (PROGN
      (|sayBrightly| |op|)
      (COND
       ((LASSOC '|arguments| |alist1|) (|sayBrightly| "  arguments")
        ((LAMBDA (|bfVar#8| |bfVar#7|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#8|)
                  (PROGN (SETQ |bfVar#7| (CAR |bfVar#8|)) NIL))
              (RETURN NIL))
             (#1='T
              (AND (CONSP |bfVar#7|)
                   (PROGN
                    (SETQ |x| (CAR |bfVar#7|))
                    (SETQ |t| (CDR |bfVar#7|))
                    #1#)
                   (|sayBrightly|
                    (|concat| "     " |x| '|: | (|prefix2String| |t|))))))
            (SETQ |bfVar#8| (CDR |bfVar#8|))))
         (MSORT (LASSOC '|arguments| |alist1|)) NIL)))
      (COND
       ((LASSOC '|locals| |alist1|) (|sayBrightly| "  locals")
        ((LAMBDA (|bfVar#10| |bfVar#9|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#10|)
                  (PROGN (SETQ |bfVar#9| (CAR |bfVar#10|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#9|)
                   (PROGN
                    (SETQ |x| (CAR |bfVar#9|))
                    (SETQ |t| (CDR |bfVar#9|))
                    #1#)
                   (|sayBrightly|
                    (|concat| "     " |x| '|: | (|prefix2String| |t|))))))
            (SETQ |bfVar#10| (CDR |bfVar#10|))))
         (MSORT (LASSOC '|locals| |alist1|)) NIL)))
      ((LAMBDA (|bfVar#12| |bfVar#11|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#12|)
                (PROGN (SETQ |bfVar#11| (CAR |bfVar#12|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#11|)
                 (PROGN
                  (SETQ |con| (CAR |bfVar#11|))
                  (SETQ |alist2| (CDR |bfVar#11|))
                  #1#)
                 (NULL (MEMQ |con| '(|locals| |arguments|)))
                 (PROGN
                  (|sayBrightly| (|concat| "  " (|prefix2String| |con|)))
                  ((LAMBDA (|bfVar#14| |bfVar#13|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#14|)
                            (PROGN (SETQ |bfVar#13| (CAR |bfVar#14|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |bfVar#13|)
                             (PROGN
                              (SETQ |op1| (CAR |bfVar#13|))
                              (SETQ |sig| (CDR |bfVar#13|))
                              #1#)
                             (|sayBrightly|
                              (CONS "    "
                                    (|formatOpSignature| |op1| |sig|))))))
                      (SETQ |bfVar#14| (CDR |bfVar#14|))))
                   (MSORT |alist2|) NIL)))))
          (SETQ |bfVar#12| (CDR |bfVar#12|))))
       |alist1| NIL)))))
