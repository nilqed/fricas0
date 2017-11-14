
(DECLAIM (NOTINLINE |FortranMachineTypeCategory;|)) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (LET (#:G696)
    (COND (|FortranMachineTypeCategory;AL|)
          (T
           (SETQ |FortranMachineTypeCategory;AL|
                   (|FortranMachineTypeCategory;|)))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (SPROG ((#1=#:G694 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G693) (LIST '(|Integer|)))
                              (|Join| (|IntegralDomain|) (|OrderedSet|)
                                      (|RetractableTo| '#2#)))
                   |FortranMachineTypeCategory|)
           (SETELT #1# 0 '(|FortranMachineTypeCategory|))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
