
(DEFPARAMETER |PointCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PointCategory;|)) 

(DEFPARAMETER |PointCategory;AL| 'NIL) 

(DEFUN |PointCategory| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |PointCategory;AL|)) (CDR #1#))
          (T
           (SETQ |PointCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|PointCategory;| #2#)))
                            |PointCategory;AL|))
           #1#)))) 

(DEFUN |PointCategory;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|PointCategory;CAT|)
                                    ('T
                                     (LETT |PointCategory;CAT|
                                           (|Join| (|VectorCategory| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|point|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|dimension|
                                                        ((|PositiveInteger|)
                                                         $))
                                                       T)
                                                      ((|convert|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|cross| ($ $ $)) T)
                                                      ((|extend|
                                                        ($ $ (|List| |t#1|)))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|PointCategory| |t#1|))))) 
