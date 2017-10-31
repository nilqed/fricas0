
(DECLAIM (NOTINLINE |ModularEvaluationCategory;|)) 

(DEFPARAMETER |ModularEvaluationCategory;AL| 'NIL) 

(DEFUN |ModularEvaluationCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |ModularEvaluationCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |ModularEvaluationCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|ModularEvaluationCategory;| #1#)))
               |ModularEvaluationCategory;AL|))
      #2#)))) 

(DEFUN |ModularEvaluationCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|Join|
                     (|mkCategory|
                      '(((|degree| ((|NonNegativeInteger|) |t#2| (|Symbol|)))
                         T)
                        ((|ldegree| ((|NonNegativeInteger|) |t#1| (|Symbol|)))
                         T)
                        ((|eval1a|
                          ((|Integer|) |t#2| (|Integer|)
                           (|Record| (|:| |prime| (|Integer|))
                                     (|:| |eval1coeffbuf| (|U32Vector|))
                                     (|:| |eval1expbuf|
                                          (|SortedExponentVector|)))))
                         T)
                        ((|eval1|
                          (|t#2| |t#2| (|Symbol|) (|Integer|)
                           (|Record| (|:| |prime| (|Integer|))
                                     (|:| |eval1coeffbuf| (|U32Vector|))
                                     (|:| |eval1expbuf|
                                          (|SortedExponentVector|)))))
                         T)
                        ((|modpreduction| (|t#2| |t#2| (|Integer|))) T)
                        ((|subst_vars|
                          (|t#2| |t#1| (|List| (|Symbol|))
                           (|List| (|Symbol|))))
                         T)
                        ((|trial_division|
                          ((|Boolean|) |t#2| (|Polynomial| (|Integer|))
                           (|List| |t#2|) (|Symbol|) (|List| (|Symbol|))))
                         T))
                      NIL
                      '((|Boolean|) (|Polynomial| (|Integer|)) (|List| |t#2|)
                        (|Symbol|) (|List| (|Symbol|)) (|Integer|)
                        (|NonNegativeInteger|))
                      NIL)))
                   |ModularEvaluationCategory|)
           (SETELT #1# 0
                   (LIST '|ModularEvaluationCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
