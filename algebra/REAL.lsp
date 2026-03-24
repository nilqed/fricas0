
(DECLAIM (NOTINLINE |RealConstant;|)) 

(DEFPARAMETER |RealConstant;AL| 'NIL) 

(DEFUN |RealConstant| ()
  (COND (|RealConstant;AL|) (T (SETQ |RealConstant;AL| (|RealConstant;|))))) 

(DEFUN |RealConstant;| ()
  (SPROG ((#1=#:G2 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G0 #3=#:G1)
                                   (LIST '(|DoubleFloat|) '(|Float|))
                                   (|Join| (|ConvertibleTo| '#2#)
                                           (|ConvertibleTo| '#3#))))
           (SETELT #1# 0 '(|RealConstant|))))) 
