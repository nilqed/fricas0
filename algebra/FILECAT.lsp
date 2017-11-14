
(DEFPARAMETER |FileCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FileCategory;|)) 

(DEFPARAMETER |FileCategory;AL| 'NIL) 

(DEFUN |FileCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FileCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |FileCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|FileCategory;| #1#)))
                       |FileCategory;AL|))
      #2#)))) 

(DEFUN |FileCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|FileCategory;CAT|)
                          ('T
                           (LETT |FileCategory;CAT|
                                 (|Join| (|SetCategory|)
                                         (|mkCategory|
                                          '(((|open| ($ |t#1|)) T)
                                            ((|open| ($ |t#1| (|String|))) T)
                                            ((|reopen!| ($ $ (|String|))) T)
                                            ((|close!| ($ $)) T)
                                            ((|name| (|t#1| $)) T)
                                            ((|iomode| ((|String|) $)) T)
                                            ((|read!| (|t#2| $)) T)
                                            ((|write!| (|t#2| $ |t#2|)) T)
                                            ((|flush| ((|Void|) $)) T))
                                          NIL '((|Void|) (|String|)) NIL))
                                 . #2=(|FileCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FileCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
