
(DECLAIM (NOTINLINE |PrimitiveFunctionCategory;|)) 

(DEFPARAMETER |PrimitiveFunctionCategory;AL| 'NIL) 

(DEFUN |PrimitiveFunctionCategory| ()
  (LET (#:G692)
    (COND (|PrimitiveFunctionCategory;AL|)
          (T
           (SETQ |PrimitiveFunctionCategory;AL|
                   (|PrimitiveFunctionCategory;|)))))) 

(DEFUN |PrimitiveFunctionCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|integral| ($ $ (|Symbol|))) T)
                       ((|integral| ($ $ (|SegmentBinding| $))) T))
                     NIL '((|SegmentBinding| $) (|Symbol|)) NIL))
                   |PrimitiveFunctionCategory|)
           (SETELT #1# 0 '(|PrimitiveFunctionCategory|))))) 

(MAKEPROP '|PrimitiveFunctionCategory| 'NILADIC T) 
