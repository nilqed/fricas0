 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; dqUnit s==(a:=[s];CONS(a,a))
 
(DEFUN |dqUnit| (|s|)
  (PROG (|a|) (RETURN (PROGN (SETQ |a| (LIST |s|)) (CONS |a| |a|)))))
 
; dqUnitCopy s== dqUnit(CAAR s)
 
(DEFUN |dqUnitCopy| (|s|) (PROG () (RETURN (|dqUnit| (CAAR |s|)))))
 
; dqAppend(x,y)==
;     if null x
;     then y
;     else if null y
;          then x
;          else
;               RPLACD(CDR x, first y)
;               RPLACD (x,    CDR y)
;               x
 
(DEFUN |dqAppend| (|x| |y|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
           ('T (RPLACD (CDR |x|) (CAR |y|)) (RPLACD |x| (CDR |y|)) |x|)))))
 
; dqConcat ld==
;     if null ld
;     then nil
;     else if null rest ld
;          then first ld
;          else dqAppend(first ld,dqConcat rest ld)
 
(DEFUN |dqConcat| (|ld|)
  (PROG ()
    (RETURN
     (COND ((NULL |ld|) NIL) ((NULL (CDR |ld|)) (CAR |ld|))
           ('T (|dqAppend| (CAR |ld|) (|dqConcat| (CDR |ld|))))))))
 
; dqToList s == if null s then nil else first s
 
(DEFUN |dqToList| (|s|)
  (PROG () (RETURN (COND ((NULL |s|) NIL) ('T (CAR |s|))))))
 
; dqAddAppend(x,y)==
;     if null x
;     then nil
;     else if null y
;          then nil
;          else
;               RPLACD (CDR x, first y)
;               RPLACD (x,    CDR y)
;               x
 
(DEFUN |dqAddAppend| (|x| |y|)
  (PROG ()
    (RETURN
     (COND ((NULL |x|) NIL) ((NULL |y|) NIL)
           ('T (RPLACD (CDR |x|) (CAR |y|)) (RPLACD |x| (CDR |y|)) |x|)))))
