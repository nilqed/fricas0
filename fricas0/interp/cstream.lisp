 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; npNull x== StreamNull x
 
(DEFUN |npNull| (|x|) (PROG () (RETURN (|StreamNull| |x|))))
 
; StreamNull x==
;   null x or EQCAR (x,"nullstream") => true
;   while EQCAR(x,"nonnullstream") repeat
;           st:=APPLY(CADR x,CDDR x)
;           RPLACA(x, first st)
;           RPLACD(x, rest st)
;   EQCAR(x,"nullstream")
 
(DEFUN |StreamNull| (|x|)
  (PROG (|st|)
    (RETURN
     (COND ((OR (NULL |x|) (EQCAR |x| '|nullstream|)) T)
           (#1='T
            (PROGN
             ((LAMBDA ()
                (LOOP
                 (COND ((NOT (EQCAR |x| '|nonnullstream|)) (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |st| (APPLY (CADR |x|) (CDDR |x|)))
                         (RPLACA |x| (CAR |st|))
                         (RPLACD |x| (CDR |st|))))))))
             (EQCAR |x| '|nullstream|)))))))
 
; Delay(f,x)==cons("nonnullstream",[f,:x])
 
(DEFUN |Delay| (|f| |x|)
  (PROG () (RETURN (CONS '|nonnullstream| (CONS |f| |x|)))))
 
; StreamNil:= ["nullstream"]
 
(EVAL-WHEN (EVAL LOAD) (SETQ |StreamNil| (LIST '|nullstream|)))
 
; incRgen s==Delay(function incRgen1,[s])
 
(DEFUN |incRgen| (|s|) (PROG () (RETURN (|Delay| #'|incRgen1| (LIST |s|)))))
 
; incRgen1(:z)==
;         [s]:=z
;         a := READ_-LINE(s, nil, nil)
;         if NULL a
;         then (CLOSE s;StreamNil)
; 
;         else cons(a,incRgen s)
 
(DEFUN |incRgen1| (&REST |z|)
  (PROG (|s| |a|)
    (RETURN
     (PROGN
      (SETQ |s| (CAR |z|))
      (SETQ |a| (READ-LINE |s| NIL NIL))
      (COND ((NULL |a|) (CLOSE |s|) |StreamNil|)
            ('T (CONS |a| (|incRgen| |s|))))))))
 
; incIgen n==Delay(function incIgen1,[n])
 
(DEFUN |incIgen| (|n|) (PROG () (RETURN (|Delay| #'|incIgen1| (LIST |n|)))))
 
; incIgen1(:z)==
;         [n]:=z
;         n:=n+1
;         cons(n,incIgen n)
 
(DEFUN |incIgen1| (&REST |z|)
  (PROG (|n|)
    (RETURN
     (PROGN
      (SETQ |n| (CAR |z|))
      (SETQ |n| (+ |n| 1))
      (CONS |n| (|incIgen| |n|))))))
 
; incZip(g,f1,f2)==Delay(function incZip1,[g,f1,f2])
 
(DEFUN |incZip| (|g| |f1| |f2|)
  (PROG () (RETURN (|Delay| #'|incZip1| (LIST |g| |f1| |f2|)))))
 
; incZip1(:z)==
;      [g,f1,f2]:=z
;      StreamNull f1 => StreamNil
;      StreamNull f2 => StreamNil
;      cons(FUNCALL(g,car f1,car f2),incZip(g,cdr f1,cdr f2))
 
(DEFUN |incZip1| (&REST |z|)
  (PROG (|g| |f1| |f2|)
    (RETURN
     (PROGN
      (SETQ |g| (CAR |z|))
      (SETQ |f1| (CADR . #1=(|z|)))
      (SETQ |f2| (CADDR . #1#))
      (COND ((|StreamNull| |f1|) |StreamNil|) ((|StreamNull| |f2|) |StreamNil|)
            ('T
             (CONS (FUNCALL |g| (CAR |f1|) (CAR |f2|))
                   (|incZip| |g| (CDR |f1|) (CDR |f2|)))))))))
 
; incAppend(x,y)==Delay(function incAppend1,[x,y])
 
(DEFUN |incAppend| (|x| |y|)
  (PROG () (RETURN (|Delay| #'|incAppend1| (LIST |x| |y|)))))
 
; incAppend1(:z)==
;      [x,y]:=z
;      if StreamNull x
;      then if StreamNull y
;           then StreamNil
;           else y
;      else cons(car x,incAppend(cdr x,y))
 
(DEFUN |incAppend1| (&REST |z|)
  (PROG (|x| |y|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |z|))
      (SETQ |y| (CADR |z|))
      (COND
       ((|StreamNull| |x|) (COND ((|StreamNull| |y|) |StreamNil|) (#1='T |y|)))
       (#1# (CONS (CAR |x|) (|incAppend| (CDR |x|) |y|))))))))
 
; next(f,s)==Delay(function next1,[f,s])
 
(DEFUN |next| (|f| |s|) (PROG () (RETURN (|Delay| #'|next1| (LIST |f| |s|)))))
 
; next1(:z)==
;       [f,s]:=z
;       StreamNull s=> StreamNil
;       h:= APPLY(f, [s])
;       incAppend(car h,next(f,cdr h))
 
(DEFUN |next1| (&REST |z|)
  (PROG (|f| |s| |h|)
    (RETURN
     (PROGN
      (SETQ |f| (CAR |z|))
      (SETQ |s| (CADR |z|))
      (COND ((|StreamNull| |s|) |StreamNil|)
            ('T
             (PROGN
              (SETQ |h| (APPLY |f| (LIST |s|)))
              (|incAppend| (CAR |h|) (|next| |f| (CDR |h|))))))))))
 
; nextown(f,g,s)==Delay(function nextown1,[f,g,s])
 
(DEFUN |nextown| (|f| |g| |s|)
  (PROG () (RETURN (|Delay| #'|nextown1| (LIST |f| |g| |s|)))))
 
; nextown1 (:z)==
;       [f,g,s]:=z
;       StreamNull s=>
;            spadcall1 g
;            StreamNil
;       StreamNull s
;       h:=spadcall2 (f, s)
;       incAppend(car h,nextown(f,g,cdr h))
 
(DEFUN |nextown1| (&REST |z|)
  (PROG (|f| |g| |s| |h|)
    (RETURN
     (PROGN
      (SETQ |f| (CAR |z|))
      (SETQ |g| (CADR . #1=(|z|)))
      (SETQ |s| (CADDR . #1#))
      (COND ((|StreamNull| |s|) (PROGN (|spadcall1| |g|) |StreamNil|))
            ('T
             (PROGN
              (|StreamNull| |s|)
              (SETQ |h| (|spadcall2| |f| |s|))
              (|incAppend| (CAR |h|) (|nextown| |f| |g| (CDR |h|))))))))))
 
; nextown2(f,g,e,x)==nextown(cons(f,e),cons(g,e),x)
 
(DEFUN |nextown2| (|f| |g| |e| |x|)
  (PROG () (RETURN (|nextown| (CONS |f| |e|) (CONS |g| |e|) |x|))))
 
; spadcall1(g)==
;     [impl, :env] := g
;     APPLY(impl, [env])
 
(DEFUN |spadcall1| (|g|)
  (PROG (|impl| |env|)
    (RETURN
     (PROGN
      (SETQ |impl| (CAR |g|))
      (SETQ |env| (CDR |g|))
      (APPLY |impl| (LIST |env|))))))
 
; spadcall2(f,args) ==
;     [impl, :env] := f
;     APPLY(impl, [args, env])
 
(DEFUN |spadcall2| (|f| |args|)
  (PROG (|impl| |env|)
    (RETURN
     (PROGN
      (SETQ |impl| (CAR |f|))
      (SETQ |env| (CDR |f|))
      (APPLY |impl| (LIST |args| |env|))))))
