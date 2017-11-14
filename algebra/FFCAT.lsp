
(DEFPARAMETER |FunctionFieldCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FunctionFieldCategory;|)) 

(DEFPARAMETER |FunctionFieldCategory;AL| 'NIL) 

(DEFUN |FunctionFieldCategory| (&REST #1=#:G711)
  (LET (#2=#:G712)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FunctionFieldCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |FunctionFieldCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|FunctionFieldCategory;| #1#)))
               |FunctionFieldCategory;AL|))
      #2#)))) 

(DEFUN |FunctionFieldCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G710 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|)))
                    (|sublisV| (PAIR '(#2=#:G709) (LIST '(|Fraction| |t#2|)))
                               (COND (|FunctionFieldCategory;CAT|)
                                     ('T
                                      (LETT |FunctionFieldCategory;CAT|
                                            (|Join|
                                             (|MonogenicAlgebra| '#2# '|t#3|)
                                             (|mkCategory|
                                              '(((|numberOfComponents|
                                                  ((|NonNegativeInteger|)))
                                                 T)
                                                ((|genus|
                                                  ((|NonNegativeInteger|)))
                                                 T)
                                                ((|absolutelyIrreducible?|
                                                  ((|Boolean|)))
                                                 T)
                                                ((|rationalPoint?|
                                                  ((|Boolean|) |t#1| |t#1|))
                                                 T)
                                                ((|branchPointAtInfinity?|
                                                  ((|Boolean|)))
                                                 T)
                                                ((|branchPoint?|
                                                  ((|Boolean|) |t#1|))
                                                 T)
                                                ((|branchPoint?|
                                                  ((|Boolean|) |t#2|))
                                                 T)
                                                ((|singularAtInfinity?|
                                                  ((|Boolean|)))
                                                 T)
                                                ((|singular?|
                                                  ((|Boolean|) |t#1|))
                                                 T)
                                                ((|singular?|
                                                  ((|Boolean|) |t#2|))
                                                 T)
                                                ((|ramifiedAtInfinity?|
                                                  ((|Boolean|)))
                                                 T)
                                                ((|ramified?|
                                                  ((|Boolean|) |t#1|))
                                                 T)
                                                ((|ramified?|
                                                  ((|Boolean|) |t#2|))
                                                 T)
                                                ((|integralBasis|
                                                  ((|Vector| $)))
                                                 T)
                                                ((|integralBasisAtInfinity|
                                                  ((|Vector| $)))
                                                 T)
                                                ((|integralAtInfinity?|
                                                  ((|Boolean|) $))
                                                 T)
                                                ((|integral?| ((|Boolean|) $))
                                                 T)
                                                ((|complementaryBasis|
                                                  ((|Vector| $) (|Vector| $)))
                                                 T)
                                                ((|normalizeAtInfinity|
                                                  ((|Vector| $) (|Vector| $)))
                                                 T)
                                                ((|reduceBasisAtInfinity|
                                                  ((|Vector| $) (|Vector| $)))
                                                 T)
                                                ((|integralMatrix|
                                                  ((|Matrix|
                                                    (|Fraction| |t#2|))))
                                                 T)
                                                ((|inverseIntegralMatrix|
                                                  ((|Matrix|
                                                    (|Fraction| |t#2|))))
                                                 T)
                                                ((|integralMatrixAtInfinity|
                                                  ((|Matrix|
                                                    (|Fraction| |t#2|))))
                                                 T)
                                                ((|inverseIntegralMatrixAtInfinity|
                                                  ((|Matrix|
                                                    (|Fraction| |t#2|))))
                                                 T)
                                                ((|yCoordinates|
                                                  ((|Record|
                                                    (|:| |num|
                                                         (|Vector| |t#2|))
                                                    (|:| |den| |t#2|))
                                                   $))
                                                 T)
                                                ((|integralCoordinates|
                                                  ((|Record|
                                                    (|:| |num|
                                                         (|Vector| |t#2|))
                                                    (|:| |den| |t#2|))
                                                   $))
                                                 T)
                                                ((|integralRepresents|
                                                  ($ (|Vector| |t#2|) |t#2|))
                                                 T)
                                                ((|integralDerivationMatrix|
                                                  ((|Record|
                                                    (|:| |num|
                                                         (|Matrix| |t#2|))
                                                    (|:| |den| |t#2|))
                                                   (|Mapping| |t#2| |t#2|)))
                                                 T)
                                                ((|integral?|
                                                  ((|Boolean|) $ |t#1|))
                                                 T)
                                                ((|integral?|
                                                  ((|Boolean|) $ |t#2|))
                                                 T)
                                                ((|differentiate|
                                                  ($ $
                                                   (|Mapping| |t#2| |t#2|)))
                                                 T)
                                                ((|represents|
                                                  ($ (|Vector| |t#2|) |t#2|))
                                                 T)
                                                ((|primitivePart| ($ $)) T)
                                                ((|elt| (|t#1| $ |t#1| |t#1|))
                                                 T)
                                                ((|elliptic|
                                                  ((|Union| |t#2| "failed")))
                                                 T)
                                                ((|hyperelliptic|
                                                  ((|Union| |t#2| "failed")))
                                                 T)
                                                ((|algSplitSimple|
                                                  ((|Record| (|:| |num| $)
                                                             (|:| |den| |t#2|)
                                                             (|:| |derivden|
                                                                  |t#2|)
                                                             (|:| |gd| |t#2|))
                                                   $ (|Mapping| |t#2| |t#2|)))
                                                 T)
                                                ((|nonSingularModel|
                                                  ((|List|
                                                    (|Polynomial| |t#1|))
                                                   (|Symbol|)))
                                                 (|has| |t#1| (|Field|)))
                                                ((|rationalPoints|
                                                  ((|List| (|List| |t#1|))))
                                                 (|has| |t#1| (|Finite|))))
                                              NIL
                                              '((|List| (|List| |t#1|))
                                                (|List| (|Polynomial| |t#1|))
                                                (|Symbol|) (|Vector| |t#2|)
                                                (|Boolean|)
                                                (|Matrix| (|Fraction| |t#2|))
                                                (|Vector| $)
                                                (|NonNegativeInteger|))
                                              NIL))
                                            . #3=(|FunctionFieldCategory|))))))
                   . #3#)
           (SETELT #1# 0
                   (LIST '|FunctionFieldCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)))))) 
