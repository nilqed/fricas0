
(DECLAIM (NOTINLINE |RealConstant;|)) 

(DEFPARAMETER |RealConstant;AL| 'NIL) 

(DEFUN |RealConstant| ()
  (LET (#:G698)
    (COND (|RealConstant;AL|) (T (SETQ |RealConstant;AL| (|RealConstant;|)))))) 

(DEFUN |RealConstant;| ()
  (SPROG ((#1=#:G696 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(#2=#:G694 #3=#:G695)
                          (LIST '(|DoubleFloat|) '(|Float|)))
                    (|Join| (|ConvertibleTo| '#2#) (|ConvertibleTo| '#3#)))
                   |RealConstant|)
           (SETELT #1# 0 '(|RealConstant|))))) 

(MAKEPROP '|RealConstant| 'NILADIC T) 
