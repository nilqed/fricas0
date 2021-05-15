
(DECLAIM (NOTINLINE |ModularEvaluationCategory;|)) 

(DEFPARAMETER |ModularEvaluationCategory;AL| 'NIL) 

(DEFUN |ModularEvaluationCategory| (|t#1| |t#2|)
  (LET (#1=#:G379 (#2=#:G380 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |ModularEvaluationCategory;AL|)) (CDR #1#))
          (T
           (SETQ |ModularEvaluationCategory;AL|
                   (|cons5|
                    (CONS #2#
                          (SETQ #1#
                                  (APPLY #'|ModularEvaluationCategory;| #2#)))
                    |ModularEvaluationCategory;AL|))
           #1#)))) 

(DEFUN |ModularEvaluationCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (|Join|
                               (|mkCategory|
                                '(((|degree|
                                    ((|NonNegativeInteger|) |t#2| (|Symbol|)))
                                   T)
                                  ((|ldegree|
                                    ((|NonNegativeInteger|) |t#1| (|Symbol|)))
                                   T)
                                  ((|eval1a|
                                    ((|Integer|) |t#2| (|Integer|)
                                     (|Record| (|:| |prime| (|Integer|))
                                               (|:| |eval1coeffbuf|
                                                    (|U32Vector|))
                                               (|:| |eval1expbuf|
                                                    (|SortedExponentVector|)))))
                                   T)
                                  ((|eval1|
                                    (|t#2| |t#2| (|Symbol|) (|Integer|)
                                     (|Record| (|:| |prime| (|Integer|))
                                               (|:| |eval1coeffbuf|
                                                    (|U32Vector|))
                                               (|:| |eval1expbuf|
                                                    (|SortedExponentVector|)))))
                                   T)
                                  ((|modpreduction| (|t#2| |t#2| (|Integer|)))
                                   T)
                                  ((|subst_vars|
                                    (|t#2| |t#1| (|List| (|Symbol|))
                                     (|List| (|Symbol|))))
                                   T)
                                  ((|trial_division|
                                    ((|Boolean|) |t#2|
                                     (|Polynomial| (|Integer|)) (|List| |t#2|)
                                     (|Symbol|) (|List| (|Symbol|))))
                                   T))
                                NIL NIL NIL))))
           (SETELT #1# 0 (LIST '|ModularEvaluationCategory| |t#1| |t#2|))))) 
