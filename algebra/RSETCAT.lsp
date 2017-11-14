
(DEFPARAMETER |RegularTriangularSetCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |RegularTriangularSetCategory;|)) 

(DEFPARAMETER |RegularTriangularSetCategory;AL| 'NIL) 

(DEFUN |RegularTriangularSetCategory| (&REST #1=#:G728)
  (LET (#2=#:G729)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |RegularTriangularSetCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |RegularTriangularSetCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|RegularTriangularSetCategory;| #1#)))
               |RegularTriangularSetCategory;AL|))
      #2#)))) 

(DEFUN |RegularTriangularSetCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G727 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)))
                    (COND (|RegularTriangularSetCategory;CAT|)
                          ('T
                           (LETT |RegularTriangularSetCategory;CAT|
                                 (|Join|
                                  (|TriangularSetCategory| '|t#1| '|t#2| '|t#3|
                                                           '|t#4|)
                                  (|mkCategory|
                                   '(((|purelyAlgebraic?|
                                       ((|Boolean|) |t#4| $))
                                      T)
                                     ((|purelyTranscendental?|
                                       ((|Boolean|) |t#4| $))
                                      T)
                                     ((|algebraicCoefficients?|
                                       ((|Boolean|) |t#4| $))
                                      T)
                                     ((|purelyAlgebraic?| ((|Boolean|) $)) T)
                                     ((|purelyAlgebraicLeadingMonomial?|
                                       ((|Boolean|) |t#4| $))
                                      T)
                                     ((|invertibleElseSplit?|
                                       ((|Union| (|Boolean|) (|List| $)) |t#4|
                                        $))
                                      T)
                                     ((|invertible?|
                                       ((|List|
                                         (|Record| (|:| |val| (|Boolean|))
                                                   (|:| |tower| $)))
                                        |t#4| $))
                                      T)
                                     ((|invertible?| ((|Boolean|) |t#4| $)) T)
                                     ((|invertibleSet| ((|List| $) |t#4| $)) T)
                                     ((|lastSubResultantElseSplit|
                                       ((|Union| |t#4| (|List| $)) |t#4| |t#4|
                                        $))
                                      T)
                                     ((|lastSubResultant|
                                       ((|List|
                                         (|Record| (|:| |val| |t#4|)
                                                   (|:| |tower| $)))
                                        |t#4| |t#4| $))
                                      T)
                                     ((|squareFreePart|
                                       ((|List|
                                         (|Record| (|:| |val| |t#4|)
                                                   (|:| |tower| $)))
                                        |t#4| $))
                                      T)
                                     ((|intersect| ((|List| $) |t#4| $)) T)
                                     ((|intersect|
                                       ((|List| $) (|List| |t#4|) $))
                                      T)
                                     ((|intersect|
                                       ((|List| $) (|List| |t#4|) (|List| $)))
                                      T)
                                     ((|intersect|
                                       ((|List| $) |t#4| (|List| $)))
                                      T)
                                     ((|augment| ((|List| $) |t#4| $)) T)
                                     ((|augment| ((|List| $) |t#4| (|List| $)))
                                      T)
                                     ((|augment| ((|List| $) (|List| |t#4|) $))
                                      T)
                                     ((|augment|
                                       ((|List| $) (|List| |t#4|) (|List| $)))
                                      T)
                                     ((|internalAugment| ($ |t#4| $)) T)
                                     ((|internalAugment| ($ (|List| |t#4|) $))
                                      T)
                                     ((|extend| ((|List| $) |t#4| $)) T)
                                     ((|extend| ((|List| $) |t#4| (|List| $)))
                                      T)
                                     ((|extend| ((|List| $) (|List| |t#4|) $))
                                      T)
                                     ((|extend|
                                       ((|List| $) (|List| |t#4|) (|List| $)))
                                      T)
                                     ((|zeroSetSplit|
                                       ((|List| $) (|List| |t#4|) (|Boolean|)))
                                      T))
                                   NIL
                                   '((|List| $) (|List| |t#4|) (|Boolean|)
                                     (|List|
                                      (|Record| (|:| |val| |t#4|)
                                                (|:| |tower| $)))
                                     (|List|
                                      (|Record| (|:| |val| (|Boolean|))
                                                (|:| |tower| $))))
                                   NIL))
                                 . #2=(|RegularTriangularSetCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|RegularTriangularSetCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|)))))) 
