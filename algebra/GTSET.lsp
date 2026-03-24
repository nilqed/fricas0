
(PUT '|GTSET;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |GTSET;rep| ((|s| (%)) (% (|List| P))) |s|) 

(PUT '|GTSET;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |GTSET;per| ((|l| (|List| P)) (% (%))) |l|) 

(SDEFUN |GTSET;copy;2%;3| ((|ts| (%)) (% (%)))
        (|GTSET;per| (SPADCALL (|GTSET;rep| |ts| %) (QREFELT % 11)) %)) 

(SDEFUN |GTSET;empty;%;4| ((% (%))) (|GTSET;per| NIL %)) 

(SDEFUN |GTSET;empty?;%B;5| ((|ts| (%)) (% (|Boolean|)))
        (NULL (|GTSET;rep| |ts| %))) 

(SDEFUN |GTSET;parts;%L;6| ((|ts| (%)) (% (|List| P))) (|GTSET;rep| |ts| %)) 

(SDEFUN |GTSET;members;%L;7| ((|ts| (%)) (% (|List| P))) (|GTSET;rep| |ts| %)) 

(SDEFUN |GTSET;map;M2%;8| ((|f| (|Mapping| P P)) (|ts| (%)) (% (%)))
        (SPADCALL (SPADCALL |f| (|GTSET;rep| |ts| %) (QREFELT % 19))
                  (QREFELT % 20))) 

(SDEFUN |GTSET;map!;M2%;9| ((|f| (|Mapping| P P)) (|ts| (%)) (% (%)))
        (SPADCALL (SPADCALL |f| (|GTSET;rep| |ts| %) (QREFELT % 22))
                  (QREFELT % 20))) 

(SDEFUN |GTSET;member?;P%B;10| ((|p| (P)) (|ts| (%)) (% (|Boolean|)))
        (SPADCALL |p| (|GTSET;rep| |ts| %) (QREFELT % 24))) 

(PUT '|GTSET;roughUnitIdeal?;%B;11| '|SPADreplace| '(XLAM (|ts|) NIL)) 

(SDEFUN |GTSET;roughUnitIdeal?;%B;11| ((|ts| (%)) (% (|Boolean|))) NIL) 

(SDEFUN |GTSET;coerce;%Of;12| ((|ts| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G29 NIL) (|p| NIL) (#2=#:G28 NIL) (|lp| (|List| P)))
               (SEQ (LETT |lp| (REVERSE (|GTSET;rep| |ts| %)))
                    (EXIT
                     (SPADCALL
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |p| (QREFELT % 28)) #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT % 30)))))) 

(SDEFUN |GTSET;mvar;%V;13| ((|ts| (%)) (% (V)))
        (COND
         ((SPADCALL |ts| (QREFELT % 15))
          (|error| "failed in mvar : % -> V from GTSET"))
         ('T (SPADCALL (|SPADfirst| (|GTSET;rep| |ts| %)) (QREFELT % 32))))) 

(SDEFUN |GTSET;first;%U;14| ((|ts| (%)) (% (|Union| P "failed")))
        (COND ((SPADCALL |ts| (QREFELT % 15)) (CONS 1 "failed"))
              ('T (CONS 0 (|SPADfirst| (|GTSET;rep| |ts| %)))))) 

(SDEFUN |GTSET;last;%U;15| ((|ts| (%)) (% (|Union| P "failed")))
        (COND ((SPADCALL |ts| (QREFELT % 15)) (CONS 1 "failed"))
              ('T (CONS 0 (SPADCALL (|GTSET;rep| |ts| %) (QREFELT % 36)))))) 

(SDEFUN |GTSET;rest;%U;16| ((|ts| (%)) (% (|Union| % "failed")))
        (COND ((SPADCALL |ts| (QREFELT % 15)) (CONS 1 "failed"))
              ('T (CONS 0 (|GTSET;per| (CDR (|GTSET;rep| |ts| %)) %))))) 

(SDEFUN |GTSET;coerce;%L;17| ((|ts| (%)) (% (|List| P))) (|GTSET;rep| |ts| %)) 

(SDEFUN |GTSET;collectUpper;%V%;18| ((|ts| (%)) (|v| (V)) (% (%)))
        (SPROG ((|lp| (|List| P)) (|newlp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT % 15)) |ts|)
                      ('T
                       (SEQ (LETT |lp| (|GTSET;rep| |ts| %)) (LETT |newlp| NIL)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lp|) NIL)
                                          ('T
                                           (SPADCALL
                                            (SPADCALL (|SPADfirst| |lp|)
                                                      (QREFELT % 32))
                                            |v| (QREFELT % 41)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |newlp|
                                        (CONS (|SPADfirst| |lp|) |newlp|))
                                  (EXIT (LETT |lp| (CDR |lp|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (|GTSET;per| (REVERSE |newlp|) %)))))))) 

(SDEFUN |GTSET;collectUnder;%V%;19| ((|ts| (%)) (|v| (V)) (% (%)))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |ts| (QREFELT % 15)) |ts|)
                      ('T
                       (SEQ (LETT |lp| (|GTSET;rep| |ts| %))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lp|) NIL)
                                          ('T
                                           (SPADCALL
                                            (SPADCALL (|SPADfirst| |lp|)
                                                      (QREFELT % 32))
                                            |v| (QREFELT % 43)))))
                                   (GO G191)))
                                 (SEQ (EXIT (LETT |lp| (CDR |lp|)))) NIL
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT (|GTSET;per| |lp| %)))))))) 

(SDEFUN |GTSET;extendIfCan;%PU;20|
        ((|ts| (%)) (|p| (P)) (% (|Union| % "failed")))
        (COND ((SPADCALL |p| (QREFELT % 45)) (CONS 1 "failed"))
              ((SPADCALL |ts| (QREFELT % 15))
               (CONS 0 (|GTSET;per| (LIST (SPADCALL |p| (QREFELT % 46))) %)))
              ((NULL
                (SPADCALL (SPADCALL |ts| (QREFELT % 33))
                          (SPADCALL |p| (QREFELT % 32)) (QREFELT % 47)))
               (CONS 1 "failed"))
              ('T (CONS 0 (|GTSET;per| (CONS |p| (|GTSET;rep| |ts| %)) %))))) 

(DECLAIM (NOTINLINE |GeneralTriangularSet;|)) 

(DEFUN |GeneralTriangularSet;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G89 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|GeneralTriangularSet| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 67))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#4|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#4|)))
                                         (|HasCategory| |#4| '(|SetCategory|)))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#4| '(|BasicType|))
                                        (|HasCategory| |#4| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#3| '(|Finite|))))))
    (|haddProp| |$ConstructorCache| '|GeneralTriangularSet|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 64))
    (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 128))
    (AND (|HasCategory| |#4| '(|BasicType|)) #1# (|augmentPredVector| % 256))
    (AND (|HasCategory| |#4| '(|OrderedSet|)) #1# (|augmentPredVector| % 512))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |GeneralTriangularSet| (&REST #1=#:G90)
  (SPROG NIL
         (PROG (#2=#:G91)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralTriangularSet|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralTriangularSet;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralTriangularSet|)))))))))) 

(MAKEPROP '|GeneralTriangularSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|List| 9) (0 . |copy|)
              |GTSET;copy;2%;3| |GTSET;empty;%;4| (|Boolean|)
              |GTSET;empty?;%B;5| |GTSET;parts;%L;6| |GTSET;members;%L;7|
              (|Mapping| 9 9) (5 . |map|) (11 . |construct|) |GTSET;map;M2%;8|
              (16 . |map!|) |GTSET;map!;M2%;9| (22 . |member?|)
              |GTSET;member?;P%B;10| |GTSET;roughUnitIdeal?;%B;11|
              (|OutputForm|) (28 . |coerce|) (|List| %) (33 . |brace|)
              |GTSET;coerce;%Of;12| (38 . |mvar|) |GTSET;mvar;%V;13|
              (|Union| 9 '#1="failed") |GTSET;first;%U;14| (43 . |last|)
              |GTSET;last;%U;15| (|Union| % '#1#) |GTSET;rest;%U;16|
              |GTSET;coerce;%L;17| (48 . >) |GTSET;collectUpper;%V%;18|
              (54 . >=) |GTSET;collectUnder;%V%;19| (60 . |ground?|)
              (65 . |unitCanonical|) (70 . <) |GTSET;extendIfCan;%PU;20|
              (|String|) (|Mapping| 14 9) (|NonNegativeInteger|) (|List| 8)
              (|Record| (|:| |under| %) (|:| |floor| %) (|:| |upper| %))
              (|Record| (|:| |bas| %) (|:| |top| 10)) (|Union| 54 '#1#)
              (|Mapping| 14 9 9) (|Record| (|:| |close| 10) (|:| |open| 10))
              (|Mapping| 14 9 10) (|Mapping| 9 9 9)
              (|Record| (|:| |close| %) (|:| |open| 10)) (|List| 60)
              (|List| 63) (|Equation| 9) (|InputForm|)
              (|Record| (|:| |num| 9) (|:| |den| 6))
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6)))
           '#(~= 76 |zeroSetSplitIntoTriangularSystems| 82 |zeroSetSplit| 87
              |variables| 92 |trivialIdeal?| 97 |triangular?| 102
              |stronglyReduced?| 107 |stronglyReduce| 118 |sort| 124 |size?|
              130 |select| 136 |sample| 148 |roughUnitIdeal?| 152
              |roughSubIdeal?| 157 |roughEqualIdeals?| 163 |roughBase?| 169
              |rewriteSetWithReduction| 174 |rewriteIdealWithRemainder| 182
              |rewriteIdealWithHeadRemainder| 188 |retractIfCan| 194 |retract|
              199 |rest| 204 |removeZero| 209 |removeDuplicates| 215 |remove|
              220 |remainder| 232 |reduced?| 238 |reduceByQuasiMonic| 245
              |reduce| 251 |quasiComponent| 280 |parts| 285 |normalized?| 290
              |mvar| 301 |more?| 306 |min| 312 |members| 317 |member?| 322
              |max| 328 |map!| 339 |map| 345 |mainVariables| 351
              |mainVariable?| 356 |less?| 362 |latex| 368 |last| 373 |initials|
              378 |initiallyReduced?| 383 |initiallyReduce| 394 |infRittWu?|
              400 |iexactQuo| 406 |headRemainder| 412 |headReduced?| 418
              |headReduce| 429 |first| 435 |find| 440 |extendIfCan| 446
              |extend| 452 |every?| 458 |eval| 464 |eq?| 490 |empty?| 496
              |empty| 501 |degree| 505 |count| 510 |copy| 522 |convert| 527
              |construct| 532 |collectUpper| 537 |collectUnder| 543
              |collectQuasiMonic| 549 |collect| 554 |coerce| 560 |coHeight| 570
              |basicSet| 575 |autoReduced?| 588 |any?| 594 |algebraicVariables|
              600 |algebraic?| 605 = 611 |#| 617)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 1 0 0 0 2 1 0 0 0 0 0 0))
                 (CONS
                  '#(|TriangularSetCategory&| |PolynomialSetCategory&|
                     |Collection&| |HomogeneousAggregate&| |Evalable&|
                     |Aggregate&| |RetractableFrom&| |SetCategory&| NIL
                     |InnerEvalable&| NIL NIL NIL NIL NIL |BasicType&|)
                  (CONS
                   '#((|TriangularSetCategory| 6 7 8 9)
                      (|PolynomialSetCategory| 6 7 8 9) (|Collection| 9)
                      (|HomogeneousAggregate| 9) (|Evalable| 9) (|Aggregate|)
                      (|RetractableFrom| (|List| 9)) (|SetCategory|)
                      (|ConvertibleTo| 64) (|InnerEvalable| 9 9)
                      (|CoercibleTo| 27) (|Type|) (|CoercibleTo| (|List| 9))
                      (|finiteAggregate|) (|shallowlyMutable|) (|BasicType|))
                   (|makeByteWordVec2| 66
                                       '(1 10 0 0 11 2 10 0 18 0 19 1 0 0 10 20
                                         2 10 0 18 0 22 2 10 14 9 0 24 1 9 27 0
                                         28 1 27 0 29 30 1 9 8 0 32 1 10 9 0 36
                                         2 8 14 0 0 41 2 8 14 0 0 43 1 9 14 0
                                         45 1 9 0 0 46 2 8 14 0 0 47 2 0 14 0 0
                                         1 1 0 61 10 1 1 0 29 10 1 1 0 52 0 1 1
                                         0 14 0 1 1 5 14 0 1 2 0 14 9 0 1 1 0
                                         14 0 1 2 0 9 9 0 1 2 0 53 0 8 1 2 0 14
                                         0 51 1 2 0 34 0 8 1 2 8 0 50 0 1 0 0 0
                                         1 1 5 14 0 26 2 5 14 0 0 1 2 5 14 0 0
                                         1 1 5 14 0 1 4 0 10 10 0 59 56 1 2 5
                                         10 10 0 1 2 5 10 10 0 1 1 0 38 10 1 1
                                         0 0 10 1 1 0 38 0 39 2 0 9 9 0 1 1 9 0
                                         0 1 2 9 0 9 0 1 2 8 0 50 0 1 2 5 66 9
                                         0 1 3 0 14 9 0 56 1 2 0 9 9 0 1 4 0 9
                                         9 0 59 56 1 4 9 9 59 0 9 9 1 2 8 9 59
                                         0 1 3 8 9 59 0 9 1 1 0 57 0 1 1 8 10 0
                                         16 2 0 14 9 0 1 1 0 14 0 1 1 0 8 0 33
                                         2 0 14 0 51 1 1 10 9 0 1 1 8 10 0 17 2
                                         9 14 9 0 25 1 10 9 0 1 2 8 9 56 0 1 2
                                         7 0 18 0 23 2 0 0 18 0 21 1 0 52 0 1 2
                                         0 14 8 0 1 2 0 14 0 51 1 1 0 49 0 1 1
                                         0 34 0 37 1 0 10 0 1 2 0 14 9 0 1 1 0
                                         14 0 1 2 0 9 9 0 1 2 0 14 0 0 1 2 5 6
                                         6 6 1 2 5 65 9 0 1 2 0 14 9 0 1 1 0 14
                                         0 1 2 0 9 9 0 1 1 0 34 0 35 2 0 34 50
                                         0 1 2 0 38 0 9 48 2 0 0 0 9 1 2 8 14
                                         50 0 1 3 1 0 0 10 10 1 3 1 0 0 9 9 1 2
                                         1 0 0 62 1 2 1 0 0 63 1 2 0 14 0 0 1 1
                                         0 14 0 15 0 0 0 13 1 0 51 0 1 2 9 51 9
                                         0 1 2 8 51 50 0 1 1 0 0 0 12 1 2 64 0
                                         1 1 0 0 10 20 2 0 0 0 8 42 2 0 0 0 8
                                         44 1 0 0 0 1 2 0 0 0 8 1 1 0 27 0 31 1
                                         0 10 0 40 1 6 51 0 1 2 0 55 10 56 1 3
                                         0 55 10 50 56 1 2 0 14 0 58 1 2 8 14
                                         50 0 1 1 0 52 0 1 2 0 14 8 0 1 2 0 14
                                         0 0 1 1 8 51 0 1)))))
           '|lookupComplete|)) 
