
(DEFPARAMETER |SExpressionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SExpressionCategory;|)) 

(DEFPARAMETER |SExpressionCategory;AL| 'NIL) 

(DEFUN |SExpressionCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |SExpressionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |SExpressionCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|SExpressionCategory;| #1#)))
               |SExpressionCategory;AL|))
      #2#)))) 

(DEFUN |SExpressionCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)))
                    (COND (|SExpressionCategory;CAT|)
                          ('T
                           (LETT |SExpressionCategory;CAT|
                                 (|Join| (|SetCategory|)
                                         (|mkCategory|
                                          '(((|eq| ((|Boolean|) $ $)) T)
                                            ((|null?| ((|Boolean|) $)) T)
                                            ((|atom?| ((|Boolean|) $)) T)
                                            ((|pair?| ((|Boolean|) $)) T)
                                            ((|list?| ((|Boolean|) $)) T)
                                            ((|string?| ((|Boolean|) $)) T)
                                            ((|symbol?| ((|Boolean|) $)) T)
                                            ((|integer?| ((|Boolean|) $)) T)
                                            ((|float?| ((|Boolean|) $)) T)
                                            ((|destruct| ((|List| $) $)) T)
                                            ((|string| (|t#1| $)) T)
                                            ((|symbol| (|t#2| $)) T)
                                            ((|integer| (|t#3| $)) T)
                                            ((|float| (|t#4| $)) T)
                                            ((|convert| ($ (|List| $))) T)
                                            ((|convert| ($ |t#1|)) T)
                                            ((|convert| ($ |t#2|)) T)
                                            ((|convert| ($ |t#3|)) T)
                                            ((|convert| ($ |t#4|)) T)
                                            ((|car| ($ $)) T) ((|cdr| ($ $)) T)
                                            ((|#| ((|Integer|) $)) T)
                                            ((|elt| ($ $ (|Integer|))) T)
                                            ((|elt| ($ $ (|List| (|Integer|))))
                                             T))
                                          NIL
                                          '((|List| (|Integer|)) (|Integer|)
                                            (|List| $) (|Boolean|))
                                          NIL))
                                 . #2=(|SExpressionCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|SExpressionCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|)))))) 
