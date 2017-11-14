
(DECLAIM (NOTINLINE |InnerEvalable;|)) 

(DEFPARAMETER |InnerEvalable;AL| 'NIL) 

(DEFUN |InnerEvalable| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |InnerEvalable;AL|))
      (CDR #2#))
     (T
      (SETQ |InnerEvalable;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|InnerEvalable;| #1#)))
                       |InnerEvalable;AL|))
      #2#)))) 

(DEFUN |InnerEvalable;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|Join|
                     (|mkCategory|
                      '(((|eval| ($ $ |t#1| |t#2|)) T)
                        ((|eval| ($ $ (|List| |t#1|) (|List| |t#2|))) T))
                      NIL '((|List| |t#1|) (|List| |t#2|)) NIL)))
                   |InnerEvalable|)
           (SETELT #1# 0
                   (LIST '|InnerEvalable| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
