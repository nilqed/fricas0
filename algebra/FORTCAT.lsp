
(DECLAIM (NOTINLINE |FortranProgramCategory;|)) 

(DEFPARAMETER |FortranProgramCategory;AL| 'NIL) 

(DEFUN |FortranProgramCategory| ()
  (LET (#:G693)
    (COND (|FortranProgramCategory;AL|)
          (T (SETQ |FortranProgramCategory;AL| (|FortranProgramCategory;|)))))) 

(DEFUN |FortranProgramCategory;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G690) (LIST '(|OutputForm|)))
                              (|Join| (|Type|) (|CoercibleTo| '#2#)
                                      (|mkCategory|
                                       '(((|outputAsFortran| ((|Void|) $)) T))
                                       NIL '((|Void|)) NIL)))
                   |FortranProgramCategory|)
           (SETELT #1# 0 '(|FortranProgramCategory|))))) 

(MAKEPROP '|FortranProgramCategory| 'NILADIC T) 
