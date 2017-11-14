
(DEFPARAMETER |PointCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PointCategory;|)) 

(DEFPARAMETER |PointCategory;AL| 'NIL) 

(DEFUN |PointCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |PointCategory;AL|)) (CDR #2#))
     (T
      (SETQ |PointCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|PointCategory;| #1#)))
                       |PointCategory;AL|))
      #2#)))) 

(DEFUN |PointCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
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
                                                    NIL
                                                    '((|List| |t#1|)
                                                      (|PositiveInteger|))
                                                    NIL))
                                           . #2=(|PointCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|PointCategory| (|devaluate| |t#1|)))))) 
