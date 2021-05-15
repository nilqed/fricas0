
(DEFPARAMETER |RealRootCharacterizationCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RealRootCharacterizationCategory;|)) 

(DEFPARAMETER |RealRootCharacterizationCategory;AL| 'NIL) 

(DEFUN |RealRootCharacterizationCategory| (|t#1| |t#2|)
  (LET (#1=#:G383 (#2=#:G384 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND
     ((SETQ #1# (|assoc| #2# |RealRootCharacterizationCategory;AL|)) (CDR #1#))
     (T
      (SETQ |RealRootCharacterizationCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|RealRootCharacterizationCategory;|
                                    #2#)))
               |RealRootCharacterizationCategory;AL|))
      #1#)))) 

(DEFUN |RealRootCharacterizationCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G382 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|RealRootCharacterizationCategory;CAT|)
                                    ('T
                                     (LETT
                                      |RealRootCharacterizationCategory;CAT|
                                      (|Join| (|SetCategory|)
                                              (|mkCategory|
                                               '(((|sign|
                                                   ((|Integer|) |t#2| $))
                                                  T)
                                                 ((|zero?|
                                                   ((|Boolean|) |t#2| $))
                                                  T)
                                                 ((|negative?|
                                                   ((|Boolean|) |t#2| $))
                                                  T)
                                                 ((|positive?|
                                                   ((|Boolean|) |t#2| $))
                                                  T)
                                                 ((|recip|
                                                   ((|Union| |t#2| "failed")
                                                    |t#2| $))
                                                  T)
                                                 ((|definingPolynomial|
                                                   (|t#2| $))
                                                  T)
                                                 ((|allRootsOf|
                                                   ((|List| $) |t#2|))
                                                  T)
                                                 ((|rootOf|
                                                   ((|Union| $ "failed") |t#2|
                                                    (|PositiveInteger|)))
                                                  T)
                                                 ((|approximate|
                                                   (|t#1| |t#2| $ |t#1|))
                                                  T)
                                                 ((|relativeApprox|
                                                   (|t#1| |t#2| $ |t#1|))
                                                  T))
                                               NIL NIL NIL)))))))
           (SETELT #1# 0
                   (LIST '|RealRootCharacterizationCategory| |t#1| |t#2|))))) 
