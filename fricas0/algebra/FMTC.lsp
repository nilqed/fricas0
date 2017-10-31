
(DECLAIM (NOTINLINE |FortranMachineTypeCategory;|)) 

(DEFPARAMETER |FortranMachineTypeCategory;AL| 'NIL) 

(DEFUN |FortranMachineTypeCategory| ()
  (LET (#:G695)
    (COND (|FortranMachineTypeCategory;AL|)
          (T
           (SETQ |FortranMachineTypeCategory;AL|
                   (|FortranMachineTypeCategory;|)))))) 

(DEFUN |FortranMachineTypeCategory;| ()
  (SPROG ((#1=#:G693 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G692) (LIST '(|Integer|)))
                              (|Join| (|IntegralDomain|) (|OrderedSet|)
                                      (|RetractableTo| '#2#)))
                   |FortranMachineTypeCategory|)
           (SETELT #1# 0 '(|FortranMachineTypeCategory|))))) 

(MAKEPROP '|FortranMachineTypeCategory| 'NILADIC T) 
