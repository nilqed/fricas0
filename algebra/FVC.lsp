
(DECLAIM (NOTINLINE |FortranVectorCategory;|)) 

(DEFPARAMETER |FortranVectorCategory;AL| 'NIL) 

(DEFUN |FortranVectorCategory| ()
  (LET (#:G692)
    (COND (|FortranVectorCategory;AL|)
          (T (SETQ |FortranVectorCategory;AL| (|FortranVectorCategory;|)))))) 

(DEFUN |FortranVectorCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|FortranProgramCategory|)
                           (|mkCategory|
                            '(((|coerce| ($ (|Vector| (|MachineFloat|)))) T)
                              ((|coerce| ($ (|List| (|FortranCode|)))) T)
                              ((|coerce| ($ (|FortranCode|))) T)
                              ((|coerce|
                                ($
                                 (|Record| (|:| |localSymbols| (|SymbolTable|))
                                           (|:| |code|
                                                (|List| (|FortranCode|))))))
                               T))
                            NIL
                            '((|FortranCode|) (|List| (|FortranCode|))
                              (|Vector| (|MachineFloat|)))
                            NIL))
                   |FortranVectorCategory|)
           (SETELT #1# 0 '(|FortranVectorCategory|))))) 

(MAKEPROP '|FortranVectorCategory| 'NILADIC T) 
