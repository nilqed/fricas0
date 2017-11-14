
(DEFPARAMETER |VectorSpace;CAT| 'NIL) 

(DECLAIM (NOTINLINE |VectorSpace;|)) 

(DEFPARAMETER |VectorSpace;AL| 'NIL) 

(DEFUN |VectorSpace| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |VectorSpace;AL|)) (CDR #2#))
     (T
      (SETQ |VectorSpace;AL|
              (|cons5| (CONS #3# (SETQ #2# (|VectorSpace;| #1#)))
                       |VectorSpace;AL|))
      #2#)))) 

(DEFUN |VectorSpace;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|VectorSpace;CAT|)
                                    ('T
                                     (LETT |VectorSpace;CAT|
                                           (|Join| (|Module| '|t#1|)
                                                   (|mkCategory|
                                                    '(((/ ($ $ |t#1|)) T)
                                                      ((|dimension|
                                                        ((|CardinalNumber|)))
                                                       T))
                                                    NIL '((|CardinalNumber|))
                                                    NIL))
                                           . #2=(|VectorSpace|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|VectorSpace| (|devaluate| |t#1|)))))) 
