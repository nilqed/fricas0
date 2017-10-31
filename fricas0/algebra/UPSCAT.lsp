
(DEFPARAMETER |UnivariatePowerSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariatePowerSeriesCategory;|)) 

(DEFPARAMETER |UnivariatePowerSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariatePowerSeriesCategory| (&REST #1=#:G696)
  (LET (#2=#:G697)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |UnivariatePowerSeriesCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariatePowerSeriesCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|UnivariatePowerSeriesCategory;| #1#)))
               |UnivariatePowerSeriesCategory;AL|))
      #2#)))) 

(DEFUN |UnivariatePowerSeriesCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G695 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|sublisV|
                     (PAIR '(#2=#:G694) (LIST '(|SingletonAsOrderedSet|)))
                     (COND (|UnivariatePowerSeriesCategory;CAT|)
                           ('T
                            (LETT |UnivariatePowerSeriesCategory;CAT|
                                  (|Join|
                                   (|PowerSeriesCategory| '|t#1| '|t#2| '#2#)
                                   (|mkCategory|
                                    '(((|terms|
                                        ((|Stream|
                                          (|Record| (|:| |k| |t#2|)
                                                    (|:| |c| |t#1|)))
                                         $))
                                       T)
                                      ((|elt| (|t#1| $ |t#2|)) T)
                                      ((|variable| ((|Symbol|) $)) T)
                                      ((|center| (|t#1| $)) T)
                                      ((|multiplyExponents|
                                        ($ $ (|PositiveInteger|)))
                                       T)
                                      ((|order| (|t#2| $)) T)
                                      ((|order| (|t#2| $ |t#2|)) T)
                                      ((|truncate| ($ $ |t#2|)) T)
                                      ((|truncate| ($ $ |t#2| |t#2|)) T)
                                      ((|approximate| (|t#1| $ |t#2|))
                                       (AND
                                        (|has| |t#1|
                                               (SIGNATURE ^
                                                (|t#1| |t#1| |t#2|)))
                                        (|has| |t#1|
                                               (SIGNATURE |coerce|
                                                (|t#1| (|Symbol|))))))
                                      ((|extend| ($ $ |t#2|)) T)
                                      ((|eval| ((|Stream| |t#1|) $ |t#1|))
                                       (|has| |t#1|
                                              (SIGNATURE ^
                                               (|t#1| |t#1| |t#2|)))))
                                    '(((|Eltable| $ $)
                                       (|has| |t#2| (|SemiGroup|)))
                                      ((|DifferentialRing|)
                                       (|has| |t#1|
                                              (SIGNATURE *
                                               (|t#1| |t#2| |t#1|))))
                                      ((|PartialDifferentialRing| (|Symbol|))
                                       (AND
                                        (|has| |t#1|
                                               (|PartialDifferentialRing|
                                                (|Symbol|)))
                                        (|has| |t#1|
                                               (SIGNATURE *
                                                (|t#1| |t#2| |t#1|))))))
                                    '((|Stream| |t#1|) (|PositiveInteger|)
                                      (|Symbol|)
                                      (|Stream|
                                       (|Record| (|:| |k| |t#2|)
                                                 (|:| |c| |t#1|))))
                                    NIL))
                                  . #3=(|UnivariatePowerSeriesCategory|))))))
                   . #3#)
           (SETELT #1# 0
                   (LIST '|UnivariatePowerSeriesCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
