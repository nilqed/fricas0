
(DECLAIM (NOTINLINE |ExpressionSpace;|)) 

(DEFPARAMETER |ExpressionSpace;AL| 'NIL) 

(DEFUN |ExpressionSpace| ()
  (COND (|ExpressionSpace;AL|)
        (T (SETQ |ExpressionSpace;AL| (|ExpressionSpace;|))))) 

(DEFUN |ExpressionSpace;| ()
  (SPROG ((#1=#:G1 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G0) (LIST '(|Kernel| %))
                                   (|Join| (|ExpressionSpace2| '#2#))))
           (SETELT #1# 0 '(|ExpressionSpace|))))) 
