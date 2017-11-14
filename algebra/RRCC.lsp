
(DEFPARAMETER |RealRootCharacterizationCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RealRootCharacterizationCategory;|)) 

(DEFPARAMETER |RealRootCharacterizationCategory;AL| 'NIL) 

(DEFUN |RealRootCharacterizationCategory| (&REST #1=#:G695)
  (LET (#2=#:G696)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |RealRootCharacterizationCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |RealRootCharacterizationCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY #'|RealRootCharacterizationCategory;|
                                    #1#)))
               |RealRootCharacterizationCategory;AL|))
      #2#)))) 

(DEFUN |RealRootCharacterizationCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G694 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|RealRootCharacterizationCategory;CAT|)
                          ('T
                           (LETT |RealRootCharacterizationCategory;CAT|
                                 (|Join| (|SetCategory|)
                                         (|mkCategory|
                                          '(((|sign| ((|Integer|) |t#2| $)) T)
                                            ((|zero?| ((|Boolean|) |t#2| $)) T)
                                            ((|negative?|
                                              ((|Boolean|) |t#2| $))
                                             T)
                                            ((|positive?|
                                              ((|Boolean|) |t#2| $))
                                             T)
                                            ((|recip|
                                              ((|Union| |t#2| "failed") |t#2|
                                               $))
                                             T)
                                            ((|definingPolynomial| (|t#2| $))
                                             T)
                                            ((|allRootsOf| ((|List| $) |t#2|))
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
                                          NIL
                                          '((|PositiveInteger|) (|List| $)
                                            (|Boolean|) (|Integer|))
                                          NIL))
                                 . #2=(|RealRootCharacterizationCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|RealRootCharacterizationCategory|
                         (|devaluate| |t#1|) (|devaluate| |t#2|)))))) 
