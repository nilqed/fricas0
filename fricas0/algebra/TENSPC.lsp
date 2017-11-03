
(DEFPARAMETER |TensorPowerCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |TensorPowerCategory;|)) 

(DEFPARAMETER |TensorPowerCategory;AL| 'NIL) 

(DEFUN |TensorPowerCategory| (&REST #1=#:G695)
  (LET (#2=#:G696)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |TensorPowerCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |TensorPowerCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|TensorPowerCategory;| #1#)))
               |TensorPowerCategory;AL|))
      #2#)))) 

(DEFUN |TensorPowerCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G694 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|)))
                    (COND (|TensorPowerCategory;CAT|)
                          ('T
                           (LETT |TensorPowerCategory;CAT|
                                 (|Join| (|Module| '|t#2|)
                                         (|mkCategory|
                                          '(((|tensor| ($ (|List| |t#3|))) T))
                                          '(((|Algebra| |t#2|)
                                             (|has| |t#3| (|Algebra| |t#2|)))
                                            ((|TensorProductCategory| |t#2|
                                                                      |t#3|
                                                                      |t#3|)
                                             T))
                                          '((|List| |t#3|)) NIL))
                                 . #2=(|TensorPowerCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|TensorPowerCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)))))) 
