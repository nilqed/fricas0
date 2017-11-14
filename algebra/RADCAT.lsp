
(DECLAIM (NOTINLINE |RadicalCategory;|)) 

(DEFPARAMETER |RadicalCategory;AL| 'NIL) 

(DEFUN |RadicalCategory| ()
  (LET (#:G692)
    (COND (|RadicalCategory;AL|)
          (T (SETQ |RadicalCategory;AL| (|RadicalCategory;|)))))) 

(DEFUN |RadicalCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|sqrt| ($ $)) T) ((|nthRoot| ($ $ (|Integer|))) T)
                       ((^ ($ $ (|Fraction| (|Integer|)))) T))
                     NIL '((|Fraction| (|Integer|)) (|Integer|)) NIL))
                   |RadicalCategory|)
           (SETELT #1# 0 '(|RadicalCategory|))))) 

(MAKEPROP '|RadicalCategory| 'NILADIC T) 
