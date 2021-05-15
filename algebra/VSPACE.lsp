
(DEFPARAMETER |VectorSpace;CAT| 'NIL) 

(DECLAIM (NOTINLINE |VectorSpace;|)) 

(DEFPARAMETER |VectorSpace;AL| 'NIL) 

(DEFUN |VectorSpace| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |VectorSpace;AL|)) (CDR #1#))
          (T
           (SETQ |VectorSpace;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|VectorSpace;| #2#)))
                            |VectorSpace;AL|))
           #1#)))) 

(DEFUN |VectorSpace;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|VectorSpace;CAT|)
                                    ('T
                                     (LETT |VectorSpace;CAT|
                                           (|Join| (|Module| '|t#1|)
                                                   (|mkCategory|
                                                    '(((/ ($ $ |t#1|)) T)
                                                      ((|dimension|
                                                        ((|CardinalNumber|)))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|VectorSpace| |t#1|))))) 
