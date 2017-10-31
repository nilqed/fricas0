
(DECLAIM (NOTINLINE |IntegerNumberSystem;|)) 

(DEFPARAMETER |IntegerNumberSystem;AL| 'NIL) 

(DEFUN |IntegerNumberSystem| ()
  (LET (#:G713)
    (COND (|IntegerNumberSystem;AL|)
          (T (SETQ |IntegerNumberSystem;AL| (|IntegerNumberSystem;|)))))) 

(DEFUN |IntegerNumberSystem;| ()
  (SPROG ((#1=#:G711 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR
                     '(#2=#:G705 #3=#:G706 #4=#:G707 #5=#:G708 #6=#:G709
                       #7=#:G710)
                     (LIST '(|Integer|) '(|Integer|) '(|Integer|)
                           '(|InputForm|) '(|Pattern| (|Integer|))
                           '(|Integer|)))
                    (|Join| (|UniqueFactorizationDomain|) (|EuclideanDomain|)
                            (|OrderedIntegralDomain|) (|DifferentialRing|)
                            (|ConvertibleTo| '#2#) (|RetractableTo| '#3#)
                            (|LinearlyExplicitOver| '#4#)
                            (|ConvertibleTo| '#5#) (|ConvertibleTo| '#6#)
                            (|PatternMatchable| '#7#)
                            (|CombinatorialFunctionCategory|) (|RealConstant|)
                            (|CharacteristicZero|) (|StepThrough|)
                            (|canonicalUnitNormal|) (|multiplicativeValuation|)
                            (|mkCategory|
                             '(((|odd?| ((|Boolean|) $)) T)
                               ((|even?| ((|Boolean|) $)) T) ((|base| ($)) T)
                               ((|length| ($ $)) T) ((|shift| ($ $ $)) T)
                               ((|bit?| ((|Boolean|) $ $)) T)
                               ((|positiveRemainder| ($ $ $)) T)
                               ((|symmetricRemainder| ($ $ $)) T)
                               ((|rational?| ((|Boolean|) $)) T)
                               ((|rational| ((|Fraction| (|Integer|)) $)) T)
                               ((|rationalIfCan|
                                 ((|Union| (|Fraction| (|Integer|)) "failed")
                                  $))
                                T)
                               ((|random| ($ $)) T) ((|copy| ($ $)) T)
                               ((|inc| ($ $)) T) ((|dec| ($ $)) T)
                               ((|mask| ($ $)) T) ((|addmod| ($ $ $ $)) T)
                               ((|submod| ($ $ $ $)) T)
                               ((|mulmod| ($ $ $ $)) T)
                               ((|powmod| ($ $ $ $)) T) ((|invmod| ($ $ $)) T))
                             NIL '((|Fraction| (|Integer|)) (|Boolean|)) NIL)))
                   |IntegerNumberSystem|)
           (SETELT #1# 0 '(|IntegerNumberSystem|))))) 

(MAKEPROP '|IntegerNumberSystem| 'NILADIC T) 
