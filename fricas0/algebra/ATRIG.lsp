
(DECLAIM (NOTINLINE |ArcTrigonometricFunctionCategory;|)) 

(DEFPARAMETER |ArcTrigonometricFunctionCategory;AL| 'NIL) 

(DEFUN |ArcTrigonometricFunctionCategory| ()
  (LET (#:G692)
    (COND (|ArcTrigonometricFunctionCategory;AL|)
          (T
           (SETQ |ArcTrigonometricFunctionCategory;AL|
                   (|ArcTrigonometricFunctionCategory;|)))))) 

(DEFUN |ArcTrigonometricFunctionCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|acos| ($ $)) T) ((|acot| ($ $)) T) ((|acsc| ($ $)) T)
                       ((|asec| ($ $)) T) ((|asin| ($ $)) T)
                       ((|atan| ($ $)) T))
                     NIL 'NIL NIL))
                   |ArcTrigonometricFunctionCategory|)
           (SETELT #1# 0 '(|ArcTrigonometricFunctionCategory|))))) 

(MAKEPROP '|ArcTrigonometricFunctionCategory| 'NILADIC T) 
