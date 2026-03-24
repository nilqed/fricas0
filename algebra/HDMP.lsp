
(DECLAIM (NOTINLINE |HomogeneousDistributedMultivariatePolynomial;|)) 

(DEFUN |HomogeneousDistributedMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G47 NIL) (|pv$| NIL) (#2=#:G38 NIL) (#3=#:G40 NIL) (#4=#:G39 NIL)
    (#5=#:G41 NIL) (#6=#:G42 NIL) (#7=#:G43 NIL) (#8=#:G44 NIL) (#9=#:G45 NIL)
    (#10=#:G46 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$|
          (LIST '|HomogeneousDistributedMultivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 61))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|OrderedVariableList| |#1|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#2| '(|Hashable|))
                                             (|HasCategory|
                                              (|OrderedVariableList| |#1|)
                                              '(|Hashable|)))
                                        (|HasCategory|
                                         (|HomogeneousDirectProduct|
                                          (LENGTH |#1|) (|NonNegativeInteger|))
                                         '(|Comparable|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10# #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|OrderedVariableList| |#1|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|OrderedVariableList| |#1|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #10#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache|
                '|HomogeneousDistributedMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 17592186044416))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 35184372088832))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 70368744177664))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 140737488355328))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 281474976710656))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 36028797018963968))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |HomogeneousDistributedMultivariatePolynomial| (&REST #1=#:G48)
  (SPROG NIL
         (PROG (#2=#:G49)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|HomogeneousDistributedMultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |HomogeneousDistributedMultivariatePolynomial;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|HomogeneousDistributedMultivariatePolynomial|)))))))))) 

(MAKEPROP '|HomogeneousDistributedMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|GeneralDistributedMultivariatePolynomial|
               (NRTEVAL (QREFELT % 6)) 7 14)
              (|local| |#1|) (|local| |#2|) (|Boolean|) (|OutputForm|)
              (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 14) (|:| |c| 7)) (|List| 12)
              (|HomogeneousDirectProduct| (NRTEVAL (LENGTH (QREFELT % 6))) 19)
              (|Mapping| 7 7) (|List| %) (|List| 7) (|List| 14)
              (|NonNegativeInteger|) (|Union| 7 '#1="failed") (|Mapping| 14 14)
              (|List| 19) (|List| 24)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 6)))
              (|Union| 24 '"failed") (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomial| %) (|Union| 16 '#2="failed")
              (|List| 37) (|Union| 40 '#3="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 37) (|HashState|)
              (|SingleInteger|) (|Integer|) (|Matrix| 37)
              (|Record| (|:| |mat| 38) (|:| |vec| (|Vector| 37))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 37 %)
              (|Union| % '#3#)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 37) (|Mapping| 7 14) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 50 '#3#) (|List| 27) (|Factored| 27) (|Union| 45 '#1#)
              (|Union| 37 '#1#)
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 7))) (|Matrix| 7)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 24) (|:| |exponent| 19)) (|Union| 57 '#2#)
              (|List| 60) (|Equation| %))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 10 0 10 0 16 0 25 14 24 4 17 26 15 3 2 1 27
                                  27 26 12 15 1 26 4 5 1 0 38 4 5 4 1 0 27 38 5
                                  1 1 0 0 0 11 12 12 44 12 43 0 0 31 29 9 0 0 0
                                  12 12 19 26 7 6 0 0 12 12 18 35 33 13 26 8 7
                                  6 4 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| NIL NIL |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |Module&| |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL |NonAssociativeSemiRng&| NIL NIL NIL |AbelianSemiGroup&|
                |Magma&| |FullyRetractableTo&| |RetractableTo&| |Evalable&|
                |Hashable&| NIL |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| NIL |InnerEvalable&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 7
                                       (|HomogeneousDirectProduct| (LENGTH 6)
                                                                   19)
                                       (|OrderedVariableList| 6))
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 7
                                                (|HomogeneousDirectProduct|
                                                 (LENGTH 6) 19)
                                                (|OrderedVariableList| 6))
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 7
                                            (|HomogeneousDirectProduct|
                                             (LENGTH 6) 19))
                 (|GcdDomain|)
                 (|AbelianMonoidRing| 7
                                      (|HomogeneousDirectProduct| (LENGTH 6)
                                                                  19))
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| (|OrderedVariableList| 6))
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 7)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 45) (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRing|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| 45) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| 45)
                 (|SemiRng|) (|LinearlyExplicitOver| 37)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7)
                 (|NonAssociativeRing|) (|BiModule| 45 45) (|BiModule| $$ $$)
                 (|NonAssociativeRng|) (|RightModule| 37) (|LeftModule| 7)
                 (|RightModule| 45) (|LeftModule| 45) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 7) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 37) (|PatternMatchable| (|Float|))
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 7)
                 (|RetractableTo| (|OrderedVariableList| 6)) (|Evalable| $$)
                 (|Hashable|) (|CommutativeStar|) (|RetractableTo| 37)
                 (|RetractableTo| 45) (|SetCategory|) (|RetractableTo| 7)
                 (|CoercibleFrom| (|OrderedVariableList| 6))
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 32)
                 (|ConvertibleTo| 34) (|ConvertibleTo| 33) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 37)
                 (|CoercibleFrom| 45) (|unitsKnown|) (|CoercibleTo| 9)
                 (|BasicType|) (|CoercibleFrom| 7)
                 (|InnerEvalable| (|OrderedVariableList| 6) 7)
                 (|InnerEvalable| (|OrderedVariableList| 6) $$)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
