
(DECLAIM (NOTINLINE |BitAggregate;|)) 

(DEFPARAMETER |BitAggregate;AL| 'NIL) 

(DEFUN |BitAggregate| ()
  (LET (#:G693)
    (COND (|BitAggregate;AL|) (T (SETQ |BitAggregate;AL| (|BitAggregate;|)))))) 

(DEFUN |BitAggregate;| ()
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(#2=#:G690) (LIST '(|Boolean|)))
                              (|Join| (|OrderedSet|) (|Logic|)
                                      (|OneDimensionalArrayAggregate| '#2#)
                                      (|mkCategory|
                                       '(((|not| ($ $)) T) ((|nand| ($ $ $)) T)
                                         ((|nor| ($ $ $)) T)
                                         ((|and| ($ $ $)) T) ((|or| ($ $ $)) T)
                                         ((|xor| ($ $ $)) T))
                                       NIL 'NIL NIL)))
                   |BitAggregate|)
           (SETELT #1# 0 '(|BitAggregate|))))) 

(MAKEPROP '|BitAggregate| 'NILADIC T) 
