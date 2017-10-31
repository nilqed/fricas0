
(DECLAIM (NOTINLINE |FileNameCategory;|)) 

(DEFPARAMETER |FileNameCategory;AL| 'NIL) 

(DEFUN |FileNameCategory| ()
  (LET (#:G692)
    (COND (|FileNameCategory;AL|)
          (T (SETQ |FileNameCategory;AL| (|FileNameCategory;|)))))) 

(DEFUN |FileNameCategory;| ()
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((|coerce| ($ (|String|))) T)
                              ((|coerce| ((|String|) $)) T)
                              ((|filename|
                                ($ (|String|) (|String|) (|String|)))
                               T)
                              ((|directory| ((|String|) $)) T)
                              ((|name| ((|String|) $)) T)
                              ((|extension| ((|String|) $)) T)
                              ((|exists?| ((|Boolean|) $)) T)
                              ((|readable?| ((|Boolean|) $)) T)
                              ((|writable?| ((|Boolean|) $)) T)
                              ((|new| ($ (|String|) (|String|) (|String|))) T))
                            NIL '((|String|) (|Boolean|)) NIL))
                   |FileNameCategory|)
           (SETELT #1# 0 '(|FileNameCategory|))))) 

(MAKEPROP '|FileNameCategory| 'NILADIC T) 
