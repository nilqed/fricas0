
(SDEFUN |GPOLSET;construct;L$;1| ((|lp| |List| P) ($ $))
        (SPADCALL |lp| (QREFELT $ 12))) 

(SDEFUN |GPOLSET;copy;2$;2| ((|ps| $) ($ $))
        (SPADCALL (SPADCALL (SPADCALL |ps| (QREFELT $ 14)) (QREFELT $ 15))
                  (QREFELT $ 13))) 

(PUT '|GPOLSET;empty;$;3| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |GPOLSET;empty;$;3| (($ $)) NIL) 

(PUT '|GPOLSET;parts;$L;4| '|SPADreplace| '(XLAM (|ps|) |ps|)) 

(SDEFUN |GPOLSET;parts;$L;4| ((|ps| $) ($ |List| P)) |ps|) 

(SDEFUN |GPOLSET;map;M2$;5| ((|f| |Mapping| P P) (|ps| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |ps| (QREFELT $ 14)) (QREFELT $ 20))
                  (QREFELT $ 13))) 

(SDEFUN |GPOLSET;map!;M2$;6| ((|f| |Mapping| P P) (|ps| $) ($ $))
        (SPADCALL (SPADCALL |f| (SPADCALL |ps| (QREFELT $ 14)) (QREFELT $ 22))
                  (QREFELT $ 13))) 

(SDEFUN |GPOLSET;member?;P$B;7| ((|p| P) (|ps| $) ($ |Boolean|))
        (SPADCALL |p| (SPADCALL |ps| (QREFELT $ 14)) (QREFELT $ 25))) 

(SDEFUN |GPOLSET;=;2$B;8| ((|ps1| $) (|ps2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G718 NIL) (|p| NIL) (#2=#:G717 NIL) (#3=#:G716 NIL)
          (#4=#:G715 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL
            (PROGN
             (LETT #4# NIL . #5=(|GPOLSET;=;2$B;8|))
             (SEQ (LETT |p| NIL . #5#)
                  (LETT #3# (SPADCALL |ps1| (QREFELT $ 18)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #4# (CONS |p| #4#) . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            (QREFELT $ 28))
           (SPADCALL
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |p| NIL . #5#)
                  (LETT #1# (SPADCALL |ps2| (QREFELT $ 18)) . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS |p| #2#) . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 28))
           (QREFELT $ 29))))) 

(SDEFUN |GPOLSET;coerce;$Of;9| ((|ps| $) ($ |OutputForm|))
        (SPROG ((#1=#:G725 NIL) (|p| NIL) (#2=#:G724 NIL) (|lp| (|List| P)))
               (SEQ
                (LETT |lp|
                      (SPADCALL (ELT $ 31) (SPADCALL |ps| (QREFELT $ 14))
                                (QREFELT $ 33))
                      . #3=(|GPOLSET;coerce;$Of;9|))
                (EXIT
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 35)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 37)))))) 

(SDEFUN |GPOLSET;mvar;$VarSet;10| ((|ps| $) ($ |VarSet|))
        (SPROG ((|lv| (|List| |VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |ps| (QREFELT $ 39))
                  (|error| "Error from GPOLSET in mvar : #1 is empty"))
                 (#1='T
                  (SEQ
                   (LETT |lv| (SPADCALL |ps| (QREFELT $ 41))
                         |GPOLSET;mvar;$VarSet;10|)
                   (EXIT
                    (COND
                     ((NULL |lv|)
                      (|error|
                       "Error from GPOLSET in mvar : every polynomial in #1 is constant"))
                     (#1# (SPADCALL (ELT $ 42) |lv| (QREFELT $ 44))))))))))) 

(SDEFUN |GPOLSET;retractIfCan;LU;11| ((|lp| |List| P) ($ |Union| $ "failed"))
        (CONS 0 (SPADCALL |lp| (QREFELT $ 13)))) 

(PUT '|GPOLSET;coerce;$L;12| '|SPADreplace| '(XLAM (|ps|) |ps|)) 

(SDEFUN |GPOLSET;coerce;$L;12| ((|ps| $) ($ |List| P)) |ps|) 

(SDEFUN |GPOLSET;convert;L$;13| ((|lp| |List| P) ($ $))
        (SPADCALL |lp| (QREFELT $ 13))) 

(DECLAIM (NOTINLINE |GeneralPolynomialSet;|)) 

(DEFUN |GeneralPolynomialSet| (&REST #1=#:G752)
  (SPROG NIL
         (PROG (#2=#:G753)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralPolynomialSet|)
                                               '|domainEqualList|)
                    . #3=(|GeneralPolynomialSet|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralPolynomialSet;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralPolynomialSet|)))))))))) 

(DEFUN |GeneralPolynomialSet;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((#1=#:G751 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|GeneralPolynomialSet|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT DV$3 (|devaluate| |#3|) . #2#)
    (LETT DV$4 (|devaluate| |#4|) . #2#)
    (LETT |dv$| (LIST '|GeneralPolynomialSet| DV$1 DV$2 DV$3 DV$4) . #2#)
    (LETT $ (GETREFV 63) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|GeneralPolynomialSet|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 16))
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
         (|augmentPredVector| $ 32))
    (AND (|HasCategory| |#4| '(|BasicType|)) #1# (|augmentPredVector| $ 64))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10 (|List| |#4|))
    $))) 

(MAKEPROP '|GeneralPolynomialSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|List| 9)
              (0 . |removeDuplicates|) |GPOLSET;construct;L$;1| (5 . |members|)
              (10 . |copy|) |GPOLSET;copy;2$;2| |GPOLSET;empty;$;3|
              |GPOLSET;parts;$L;4| (|Mapping| 9 9) (15 . |map|)
              |GPOLSET;map;M2$;5| (21 . |map!|) |GPOLSET;map!;M2$;6|
              (|Boolean|) (27 . |member?|) |GPOLSET;member?;P$B;7| (|Set| 9)
              (33 . |set|) (38 . =) |GPOLSET;=;2$B;8| (44 . |infRittWu?|)
              (|Mapping| 24 9 9) (50 . |sort|) (|OutputForm|) (56 . |coerce|)
              (|List| $) (61 . |brace|) |GPOLSET;coerce;$Of;9| (66 . |empty?|)
              (|List| 8) (71 . |variables|) (76 . |max|) (|Mapping| 8 8 8)
              (82 . |reduce|) |GPOLSET;mvar;$VarSet;10| (|Union| $ '"failed")
              |GPOLSET;retractIfCan;LU;11| |GPOLSET;coerce;$L;12|
              |GPOLSET;convert;L$;13| (|NonNegativeInteger|) (|Mapping| 9 9 9)
              (|Equation| 9) (|List| 52) (|Mapping| 24 9) (|InputForm|)
              (|Record| (|:| |num| 9) (|:| |den| 6))
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (|Record| (|:| |under| $) (|:| |floor| $) (|:| |upper| $))
              (|Union| 9 '"failed") (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 88 |variables| 94 |trivialIdeal?| 99 |triangular?| 104 |sort|
              109 |size?| 115 |select| 121 |sample| 127 |roughUnitIdeal?| 131
              |roughSubIdeal?| 136 |roughEqualIdeals?| 142 |roughBase?| 148
              |rewriteIdealWithRemainder| 153 |rewriteIdealWithHeadRemainder|
              159 |retractIfCan| 165 |retract| 170 |removeDuplicates| 175
              |remove| 180 |remainder| 192 |reduce| 198 |parts| 219 |mvar| 224
              |more?| 229 |members| 235 |member?| 240 |map!| 246 |map| 252
              |mainVariables| 258 |mainVariable?| 263 |less?| 269 |latex| 275
              |iexactQuo| 280 |headRemainder| 286 |hashUpdate!| 292 |hash| 298
              |find| 303 |every?| 309 |eval| 315 |eq?| 341 |empty?| 347 |empty|
              352 |count| 356 |copy| 368 |convert| 373 |construct| 383
              |collectUpper| 388 |collectUnder| 394 |collect| 400 |coerce| 406
              |any?| 416 = 422 |#| 428)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 1 0 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(|PolynomialSetCategory&| |Collection&|
                     |HomogeneousAggregate&| |SetCategory&| |Aggregate&|
                     |Evalable&| |BasicType&| NIL NIL |RetractableFrom&| NIL
                     NIL NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|PolynomialSetCategory| 6 7 8 9) (|Collection| 9)
                      (|HomogeneousAggregate| 9) (|SetCategory|) (|Aggregate|)
                      (|Evalable| 9) (|BasicType|) (|shallowlyMutable|)
                      (|finiteAggregate|) (|RetractableFrom| (|List| 9))
                      (|CoercibleTo| (|List| 9)) (|Type|) (|CoercibleTo| 34)
                      (|InnerEvalable| 9 9) (|ConvertibleTo| 55))
                   (|makeByteWordVec2| 62
                                       '(1 11 0 0 12 1 0 11 0 14 1 11 0 0 15 2
                                         11 0 19 0 20 2 11 0 19 0 22 2 11 24 9
                                         0 25 1 27 0 11 28 2 27 24 0 0 29 2 9
                                         24 0 0 31 2 11 0 32 0 33 1 9 34 0 35 1
                                         34 0 36 37 1 0 24 0 39 1 0 40 0 41 2 8
                                         0 0 0 42 2 40 8 43 0 44 2 0 24 0 0 1 1
                                         0 40 0 41 1 0 24 0 1 1 4 24 0 1 2 0 58
                                         0 8 1 2 0 24 0 50 1 2 6 0 54 0 1 0 0 0
                                         1 1 4 24 0 1 2 4 24 0 0 1 2 4 24 0 0 1
                                         1 4 24 0 1 2 4 11 11 0 1 2 4 11 11 0 1
                                         1 0 46 11 47 1 0 0 11 1 1 7 0 0 1 2 7
                                         0 9 0 1 2 6 0 54 0 1 2 4 57 9 0 1 4 7
                                         9 51 0 9 9 1 3 6 9 51 0 9 1 2 6 9 51 0
                                         1 1 6 11 0 18 1 0 8 0 45 2 0 24 0 50 1
                                         1 6 11 0 14 2 7 24 9 0 26 2 5 0 19 0
                                         23 2 0 0 19 0 21 1 0 40 0 1 2 0 24 8 0
                                         1 2 0 24 0 50 1 1 0 61 0 1 2 4 6 6 6 1
                                         2 4 56 9 0 1 2 0 60 60 0 1 1 0 62 0 1
                                         2 0 59 54 0 1 2 6 24 54 0 1 2 1 0 0 52
                                         1 2 1 0 0 53 1 3 1 0 0 11 11 1 3 1 0 0
                                         9 9 1 2 0 24 0 0 1 1 0 24 0 39 0 0 0
                                         17 2 7 50 9 0 1 2 6 50 54 0 1 1 0 0 0
                                         16 1 2 55 0 1 1 0 0 11 49 1 0 0 11 13
                                         2 0 0 0 8 1 2 0 0 0 8 1 2 0 0 0 8 1 1
                                         0 11 0 48 1 0 34 0 38 2 6 24 54 0 1 2
                                         0 24 0 0 30 1 6 50 0 1)))))
           '|lookupComplete|)) 
