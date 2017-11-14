
(DEFPARAMETER |FullyRetractableTo;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FullyRetractableTo;|)) 

(DEFPARAMETER |FullyRetractableTo;AL| 'NIL) 

(DEFUN |FullyRetractableTo| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FullyRetractableTo;AL|))
      (CDR #2#))
     (T
      (SETQ |FullyRetractableTo;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FullyRetractableTo;| #1#)))
                       |FullyRetractableTo;AL|))
      #2#)))) 

(DEFUN |FullyRetractableTo;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FullyRetractableTo;CAT|)
                                    ('T
                                     (LETT |FullyRetractableTo;CAT|
                                           (|Join| (|RetractableTo| '|t#1|)
                                                   (|mkCategory| NIL
                                                                 '(((|RetractableTo|
                                                                     (|Integer|))
                                                                    (|has|
                                                                     |t#1|
                                                                     (|RetractableTo|
                                                                      (|Integer|))))
                                                                   ((|RetractableTo|
                                                                     (|Fraction|
                                                                      (|Integer|)))
                                                                    (|has|
                                                                     |t#1|
                                                                     (|RetractableTo|
                                                                      (|Fraction|
                                                                       (|Integer|))))))
                                                                 'NIL NIL))
                                           . #2=(|FullyRetractableTo|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FullyRetractableTo| (|devaluate| |t#1|)))))) 
