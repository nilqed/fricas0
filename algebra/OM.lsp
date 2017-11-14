
(DECLAIM (NOTINLINE |OpenMath;|)) 

(DEFPARAMETER |OpenMath;AL| 'NIL) 

(DEFUN |OpenMath| ()
  (LET (#:G692)
    (COND (|OpenMath;AL|) (T (SETQ |OpenMath;AL| (|OpenMath;|)))))) 

(DEFUN |OpenMath;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|OMwrite| ((|String|) $)) T)
                       ((|OMwrite| ((|String|) $ (|Boolean|))) T)
                       ((|OMwrite| ((|Void|) (|OpenMathDevice|) $)) T)
                       ((|OMwrite| ((|Void|) (|OpenMathDevice|) $ (|Boolean|)))
                        T))
                     NIL '((|Void|) (|OpenMathDevice|) (|Boolean|) (|String|))
                     NIL))
                   |OpenMath|)
           (SETELT #1# 0 '(|OpenMath|))))) 

(MAKEPROP '|OpenMath| 'NILADIC T) 
