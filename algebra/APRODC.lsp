
(DECLAIM (NOTINLINE |AbelianProductCategory;|)) 

(DEFPARAMETER |AbelianProductCategory;AL| 'NIL) 

(DEFUN |AbelianProductCategory| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |AbelianProductCategory;AL|)) (CDR #1#))
          (T
           (SETQ |AbelianProductCategory;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|AbelianProductCategory;| #2#)))
                    |AbelianProductCategory;AL|))
           #1#)))) 

(DEFUN |AbelianProductCategory;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|Join|
                               (|mkCategory| NIL
                                             '(((|AbelianMonoid|)
                                                (|has| |t#1|
                                                       (|AbelianMonoid|)))
                                               ((|CancellationAbelianMonoid|)
                                                (|has| |t#1|
                                                       (|CancellationAbelianMonoid|)))
                                               ((|AbelianGroup|)
                                                (|has| |t#1|
                                                       (|AbelianGroup|))))
                                             NIL NIL))))
           (SETELT #1# 0 (LIST '|AbelianProductCategory| |t#1|))))) 
