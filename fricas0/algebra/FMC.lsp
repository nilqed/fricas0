
(DECLAIM (NOTINLINE |FortranMatrixCategory;|)) 

(DEFPARAMETER |FortranMatrixCategory;AL| 'NIL) 

(DEFUN |FortranMatrixCategory| ()
  (LET (#:G692)
    (COND (|FortranMatrixCategory;AL|)
          (T (SETQ |FortranMatrixCategory;AL| (|FortranMatrixCategory;|)))))) 

(DEFUN |FortranMatrixCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|FortranProgramCategory|)
                           (|mkCategory|
                            '(((|coerce| ($ (|Matrix| (|MachineFloat|)))) T)
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
                              (|Matrix| (|MachineFloat|)))
                            NIL))
                   |FortranMatrixCategory|)
           (SETELT #1# 0 '(|FortranMatrixCategory|))))) 

(MAKEPROP '|FortranMatrixCategory| 'NILADIC T) 
