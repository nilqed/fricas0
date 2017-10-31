
(DECLAIM (NOTINLINE |TaylorSeriesExpansion;|)) 

(DEFPARAMETER |TaylorSeriesExpansion;AL| 'NIL) 

(DEFUN |TaylorSeriesExpansion| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |TaylorSeriesExpansion;AL|))
      (CDR #2#))
     (T
      (SETQ |TaylorSeriesExpansion;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|TaylorSeriesExpansion;| #1#)))
               |TaylorSeriesExpansion;AL|))
      #2#)))) 

(DEFUN |TaylorSeriesExpansion;| (|t#1| |t#2| |t#3| |t#4| |t#5|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4| |t#5|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)
                                (|devaluate| |t#5|)))
                    (|Join|
                     (|mkCategory|
                      '(((|taylor_via_deriv|
                          (|t#4| |t#1| (|List| |t#4|)
                           (|List| (|Mapping| |t#1| |t#1|))))
                         T)
                        ((|taylor_via_deriv|
                          (|t#4| |t#4| (|List| |t#4|)
                           (|List| (|Mapping| |t#1| |t#1|))))
                         T)
                        ((|taylor_via_lode|
                          (|t#4| (|List| |t#5|) |t#4| (|List| |t#1|)))
                         T)
                        ((|applyTaylor| (|t#4| (|Mapping| |t#5| |t#5|) |t#4|))
                         T)
                        ((|apply_taylor| (|t#4| |t#5| |t#4|)) T))
                      NIL
                      '((|List| |t#5|) (|List| |t#1|) (|List| |t#4|)
                        (|List| (|Mapping| |t#1| |t#1|)))
                      NIL)))
                   |TaylorSeriesExpansion|)
           (SETELT #1# 0
                   (LIST '|TaylorSeriesExpansion| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|) (|devaluate| |t#5|)))))) 
