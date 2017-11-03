
(DECLAIM (NOTINLINE |VarCat;|)) 

(DEFPARAMETER |VarCat;AL| 'NIL) 

(DEFUN |VarCat| ()
  (LET (#:G693)
    (COND (|VarCat;AL|) (T (SETQ |VarCat;AL| (|VarCat;|)))))) 

(DEFUN |VarCat;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G690) (LIST '(|OutputForm|)))
                              (|Join| (|Type|) (|CoercibleTo| '#2#)
                                      (|mkCategory|
                                       '(((|var| ($ (|String|))) T)
                                         ((|var| ($ (|String|) (|ILogic|))) T)
                                         ((|getName| ((|String|) $)) T)
                                         ((|getType| ((|ILogic|) $)) T)
                                         ((|toString| ((|String|) $)) T)
                                         ((|parseVar| ($ (|String|))) T)
                                         ((|parseVarTerm|
                                           ((|Record| (|:| |rft| $)
                                                      (|:| |pout|
                                                           (|NonNegativeInteger|)))
                                            (|String|) (|NonNegativeInteger|)))
                                          T)
                                         ((= ((|Boolean|) $ $)) T)
                                         ((|coerce| ((|OutputForm|) $)) T))
                                       NIL
                                       '((|OutputForm|) (|Boolean|) (|String|)
                                         (|NonNegativeInteger|) (|ILogic|))
                                       NIL)))
                   |VarCat|)
           (SETELT #1# 0 '(|VarCat|))))) 

(MAKEPROP '|VarCat| 'NILADIC T) 
