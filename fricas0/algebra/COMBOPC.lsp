
(DECLAIM (NOTINLINE |CombinatorialOpsCategory;|)) 

(DEFPARAMETER |CombinatorialOpsCategory;AL| 'NIL) 

(DEFUN |CombinatorialOpsCategory| ()
  (LET (#:G692)
    (COND (|CombinatorialOpsCategory;AL|)
          (T
           (SETQ |CombinatorialOpsCategory;AL|
                   (|CombinatorialOpsCategory;|)))))) 

(DEFUN |CombinatorialOpsCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|CombinatorialFunctionCategory|)
                           (|mkCategory|
                            '(((|factorials| ($ $)) T)
                              ((|factorials| ($ $ (|Symbol|))) T)
                              ((|summation| ($ $ (|Symbol|))) T)
                              ((|summation| ($ $ (|SegmentBinding| $))) T)
                              ((|product| ($ $ (|Symbol|))) T)
                              ((|product| ($ $ (|SegmentBinding| $))) T))
                            NIL '((|SegmentBinding| $) (|Symbol|)) NIL))
                   |CombinatorialOpsCategory|)
           (SETELT #1# 0 '(|CombinatorialOpsCategory|))))) 

(MAKEPROP '|CombinatorialOpsCategory| 'NILADIC T) 
