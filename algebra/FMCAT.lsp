
(DEFPARAMETER |FreeModuleCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FreeModuleCategory;|)) 

(DEFPARAMETER |FreeModuleCategory;AL| 'NIL) 

(DEFUN |FreeModuleCategory| (|t#1| |t#2|)
  (LET (#1=#:G383 (#2=#:G384 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |FreeModuleCategory;AL|)) (CDR #1#))
          (T
           (SETQ |FreeModuleCategory;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|FreeModuleCategory;| #2#)))
                    |FreeModuleCategory;AL|))
           #1#)))) 

(DEFUN |FreeModuleCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|FreeModuleCategory;CAT|)
                                    ('T
                                     (LETT |FreeModuleCategory;CAT|
                                           (|Join| (|BiModule| '|t#1| '|t#1|)
                                                   (|IndexedDirectProductCategory|
                                                    '|t#1| '|t#2|)
                                                   (|mkCategory|
                                                    '(((* ($ |t#1| |t#2|)) T)
                                                      ((* ($ |t#2| |t#1|)) T)
                                                      ((|coefficients|
                                                        ((|List| |t#1|) $))
                                                       T)
                                                      ((|support|
                                                        ((|List| |t#2|) $))
                                                       T)
                                                      ((|monomials|
                                                        ((|List| $) $))
                                                       T)
                                                      ((|coefficient|
                                                        (|t#1| $ |t#2|))
                                                       T)
                                                      ((|linearExtend|
                                                        (|t#1|
                                                         (|Mapping| |t#1|
                                                                    |t#2|)
                                                         $))
                                                       (|has| |t#1|
                                                              (|CommutativeRing|))))
                                                    '(((|RetractableTo| |t#2|)
                                                       (|has| |t#1|
                                                              (|SemiRing|)))
                                                      ((|Module| |t#1|)
                                                       (|has| |t#1|
                                                              (|CommutativeRing|)))
                                                      ((|Comparable|)
                                                       (AND
                                                        (|has| |t#2|
                                                               (|Comparable|))
                                                        (|has| |t#1|
                                                               (|Comparable|)))))
                                                    NIL NIL)))))))
           (SETELT #1# 0 (LIST '|FreeModuleCategory| |t#1| |t#2|))))) 
