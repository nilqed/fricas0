
(DECLAIM (NOTINLINE |FortranMachineTypeCategory;|)) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (COND (|FortranMachineTypeCategory;AL|)
        (T
         (SETQ |FortranMachineTypeCategory;AL|
                 (|FortranMachineTypeCategory;|))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (SPROG ((#1=#:G379 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(#2=#:G378) (LIST '(|Integer|)))
                              (|Join| (|IntegralDomain|) (|OrderedSet|)
                                      (|RetractableTo| '#2#))))
           (SETELT #1# 0 '(|FortranMachineTypeCategory|))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
