
(DECLAIM (NOTINLINE |HyperbolicFunctionCategory;|)) 

(DEFPARAMETER |HyperbolicFunctionCategory;AL| 'NIL) 

(DEFUN |HyperbolicFunctionCategory| ()
  (LET (#:G692)
    (COND (|HyperbolicFunctionCategory;AL|)
          (T
           (SETQ |HyperbolicFunctionCategory;AL|
                   (|HyperbolicFunctionCategory;|)))))) 

(DEFUN |HyperbolicFunctionCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|cosh| ($ $)) T) ((|coth| ($ $)) T) ((|csch| ($ $)) T)
                       ((|sech| ($ $)) T) ((|sinh| ($ $)) T)
                       ((|tanh| ($ $)) T))
                     NIL 'NIL NIL))
                   |HyperbolicFunctionCategory|)
           (SETELT #1# 0 '(|HyperbolicFunctionCategory|))))) 

(MAKEPROP '|HyperbolicFunctionCategory| 'NILADIC T) 
