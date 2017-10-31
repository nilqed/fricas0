
(DECLAIM (NOTINLINE |VertexSet;|)) 

(DEFPARAMETER |VertexSet;AL| 'NIL) 

(DEFUN |VertexSet| ()
  (LET (#:G692)
    (COND (|VertexSet;AL|) (T (SETQ |VertexSet;AL| (|VertexSet;|)))))) 

(DEFUN |VertexSet;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((|maxFaces| ((|NonNegativeInteger|) $)) T)
                              ((|setMaxFaces|
                                ((|Void|) $ (|NonNegativeInteger|)))
                               T)
                              ((|join| ($ $ $)) T) ((|prod| ($ $ $)) T))
                            NIL '((|Void|) (|NonNegativeInteger|)) NIL))
                   |VertexSet|)
           (SETELT #1# 0 '(|VertexSet|))))) 

(MAKEPROP '|VertexSet| 'NILADIC T) 
