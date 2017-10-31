
(DEFPARAMETER |FiniteLinearAggregate;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteLinearAggregate;|)) 

(DEFPARAMETER |FiniteLinearAggregate;AL| 'NIL) 

(DEFUN |FiniteLinearAggregate| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FiniteLinearAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteLinearAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FiniteLinearAggregate;| #1#)))
                       |FiniteLinearAggregate;AL|))
      #2#)))) 

(DEFUN |FiniteLinearAggregate;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FiniteLinearAggregate;CAT|)
                                    ('T
                                     (LETT |FiniteLinearAggregate;CAT|
                                           (|Join| (|LinearAggregate| '|t#1|)
                                                   (|finiteAggregate|))
                                           . #2=(|FiniteLinearAggregate|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FiniteLinearAggregate| (|devaluate| |t#1|)))))) 
