
(DECLAIM (NOTINLINE |GenerateUnivariatePowerSeries;|)) 

(DEFUN |GenerateUnivariatePowerSeries;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GenerateUnivariatePowerSeries| DV$1 DV$2))
          (LETT % (GETREFV 17))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|))))))))
          (|haddProp| |$ConstructorCache| '|GenerateUnivariatePowerSeries|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |GenerateUnivariatePowerSeries| (&REST #1=#:G2)
  (SPROG NIL
         (PROG (#2=#:G3)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenerateUnivariatePowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GenerateUnivariatePowerSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GenerateUnivariatePowerSeries|)))))))))) 

(MAKEPROP '|GenerateUnivariatePowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|GenerateUnivariatePowerSeries2| 7)
              (|local| |#1|) (|local| |#2|) (|Any|) (|Mapping| 7 (|Integer|))
              (|Equation| 7) (|UniversalSegment| (|Integer|)) (|Mapping| 7 14)
              (|UniversalSegment| 14) (|Fraction| (|Integer|))
              (|UniversalSegment| (|NonNegativeInteger|)) (|Symbol|))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|taylor|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)))
                                T)
                              '((|taylor|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|NonNegativeInteger|))))
                                T)
                              '((|laurent|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|puiseux|
                                 ((|Any|)
                                  (|Mapping| |#2| (|Fraction| (|Integer|)))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)))
                                T)
                              '((|series|
                                 ((|Any|) (|Mapping| |#2| (|Integer|))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                T)
                              '((|series|
                                 ((|Any|)
                                  (|Mapping| |#2| (|Fraction| (|Integer|)))
                                  (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|taylor|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| (|Integer|)))))
                              '((|taylor|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|NonNegativeInteger|))))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| (|Integer|)))))
                              '((|laurent|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| (|Integer|)))))
                              '((|puiseux|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| 14))))
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| 14))))
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Integer|))))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| 14))))
                              '((|series|
                                 ((|Any|) |#2| (|Symbol|) (|Equation| |#2|)
                                  (|UniversalSegment| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                (AND (|has| 7 (|Evalable| 7))
                                     (|has| 7 (|RetractableTo| 14)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
