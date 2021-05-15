
(SDEFUN |XPR;One;$;1| (($ $))
        (LIST (CONS (|spadConstant| $ 9) (|spadConstant| $ 10)))) 

(SDEFUN |XPR;characteristic;Nni;2| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 13))) 

(PUT '|XPR;#;$Nni;3| '|SPADreplace| 'LENGTH) 

(SDEFUN |XPR;#;$Nni;3| ((|x| $) ($ |NonNegativeInteger|)) (LENGTH |x|)) 

(SDEFUN |XPR;maxdeg;$E;4| ((|p| $) ($ E))
        (COND ((NULL |p|) (|error| "zero polynomial !!"))
              ('T (QCAR (|SPADfirst| |p|))))) 

(SDEFUN |XPR;mindeg;$E;5| ((|p| $) ($ E))
        (COND ((NULL |p|) (|error| "zero polynomial !!"))
              ('T (QCAR (SPADCALL |p| (QREFELT $ 18)))))) 

(SDEFUN |XPR;coef;$ER;6| ((|p| $) (|e| E) ($ R))
        (SPROG ((#1=#:G412 NIL) (#2=#:G413 NIL) (#3=#:G414 NIL) (|tm| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |tm| NIL) (LETT #3# |p|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 21))
                           (PROGN (LETT #2# (QCDR |tm|)) (GO #4=#:G411)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QCAR |tm|) |e| (QREFELT $ 22))
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (|spadConstant| $ 23))
                                       (GO #4#)))
                                (GO #5=#:G407)))))
                            #5# (EXIT #1#))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (|spadConstant| $ 23))))
                #4# (EXIT #2#)))) 

(SDEFUN |XPR;constant?;$B;7| ((|p| $) ($ |Boolean|))
        (COND ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT $ 16)) (|spadConstant| $ 9)
                         (QREFELT $ 21))))) 

(SDEFUN |XPR;constant;$R;8| ((|p| $) ($ R))
        (SPADCALL |p| (|spadConstant| $ 9) (QREFELT $ 24))) 

(SDEFUN |XPR;quasiRegular?;$B;9| ((|p| $) ($ |Boolean|))
        (COND ((SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26)) 'T)
              ('T
               (SPADCALL (QCAR (SPADCALL |p| (QREFELT $ 18)))
                         (|spadConstant| $ 9) (QREFELT $ 29))))) 

(SDEFUN |XPR;quasiRegular;2$;10| ((|p| $) ($ $))
        (SPROG ((#1=#:G426 NIL) (|t| NIL) (#2=#:G425 NIL))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 30)) |p|)
                      ('T
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL (QCAR |t|) (|spadConstant| $ 9)
                                            (QREFELT $ 21)))
                                 (LETT #2# (CONS |t| #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |XPR;recip;$U;11| ((|p| $) ($ |Union| $ #1="failed"))
        (SPROG ((|u| (|Union| R #1#)))
               (SEQ
                (COND
                 ((OR (SPADCALL |p| (|spadConstant| $ 25) (QREFELT $ 26))
                      (SPADCALL (QCAR (|SPADfirst| |p|)) (|spadConstant| $ 9)
                                (QREFELT $ 32)))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 34)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          ('T
                           (CONS 0
                                 (SPADCALL (QCDR |u|) (QREFELT $ 35)))))))))))) 

(SDEFUN |XPR;coerce;R$;12| ((|r| R) ($ $))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 23) (QREFELT $ 37))
          (|spadConstant| $ 25))
         ('T (LIST (CONS (|spadConstant| $ 9) |r|))))) 

(SDEFUN |XPR;coerce;I$;13| ((|n| |Integer|) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 39)) (QREFELT $ 35))) 

(SDEFUN |XPR;*;3$;14| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((#1=#:G444 NIL) (#2=#:G443 ($)) (#3=#:G445 ($)) (#4=#:G453 NIL)
          (|t2| NIL) (#5=#:G452 NIL) (#6=#:G451 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 25))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (|spadConstant| $ 9)
                           (QREFELT $ 21))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 41)))
                ((SPADCALL |p2| (|spadConstant| $ 11) (QREFELT $ 26)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #6# |p1|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #4# |p2|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |t2| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (CONS
                                                (SPADCALL (QCAR |t1|)
                                                          (QCAR |t2|)
                                                          (QREFELT $ 42))
                                                (SPADCALL (QCDR |t1|)
                                                          (QCDR |t2|)
                                                          (QREFELT $ 43)))
                                               #5#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 25))))))))) 

(SDEFUN |XPR;*;3$;15| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((#1=#:G456 NIL) (#2=#:G455 ($)) (#3=#:G457 ($)) (|r| (R))
          (#4=#:G466 NIL) (|t2| NIL) (#5=#:G465 NIL) (#6=#:G464 NIL)
          (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| $ 25))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (|spadConstant| $ 9)
                           (QREFELT $ 21))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT $ 41)))
                ((SPADCALL |p2| (|spadConstant| $ 11) (QREFELT $ 26)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #6# |p1|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #4# |p2|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |t2| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SEQ
                                           (LETT |r|
                                                 (SPADCALL (QCDR |t1|)
                                                           (QCDR |t2|)
                                                           (QREFELT $ 43)))
                                           (EXIT
                                            (NULL
                                             (SPADCALL |r|
                                                       (|spadConstant| $ 23)
                                                       (QREFELT $ 37)))))
                                          (LETT #5#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL (QCAR |t1|)
                                                            (QCAR |t2|)
                                                            (QREFELT $ 42))
                                                  |r|)
                                                 #5#))))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 44))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 25))))))))) 

(SDEFUN |XPR;^;$Nni$;16| ((|p| $) (|nn| |NonNegativeInteger|) ($ $))
        (|XPR;repeatMultExpt| |p| |nn| $)) 

(SDEFUN |XPR;repeatMultExpt| ((|x| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|y| ($)) (#1=#:G471 NIL) (|i| NIL))
               (SEQ
                (COND ((EQL |nn| 0) (|spadConstant| $ 11))
                      ('T
                       (SEQ (LETT |y| |x|)
                            (SEQ (LETT |i| 2) (LETT #1# |nn|) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |y|
                                         (SPADCALL |x| |y| (QREFELT $ 45)))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |y|))))))) 

(SDEFUN |XPR;outTerm| ((|r| R) (|m| E) ($ |OutputForm|))
        (COND
         ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 37))
          (SPADCALL |m| (QREFELT $ 48)))
         ((SPADCALL |m| (|spadConstant| $ 9) (QREFELT $ 21))
          (SPADCALL |r| (QREFELT $ 49)))
         ('T
          (SPADCALL (SPADCALL |r| (QREFELT $ 49)) (SPADCALL |m| (QREFELT $ 48))
                    (QREFELT $ 50))))) 

(SDEFUN |XPR;coerce;$Of;19| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G480 NIL) (|t| NIL) (#2=#:G479 NIL))
               (SEQ
                (COND
                 ((NULL |a|) (SPADCALL (|spadConstant| $ 23) (QREFELT $ 49)))
                 ('T
                  (SPADCALL (ELT $ 51)
                            (NREVERSE
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |t| NIL) (LETT #1# |a|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |t| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|XPR;outTerm| (QCDR |t|)
                                             (QCAR |t|) $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                            (QREFELT $ 54))))))) 

(SDEFUN |XPR;/;$R$;20| ((|x| $) (|r| R) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 56)) |x| (QREFELT $ 41))) 

(DECLAIM (NOTINLINE |XPolynomialRing;|)) 

(DEFUN |XPolynomialRing| (&REST #1=#:G490)
  (SPROG NIL
         (PROG (#2=#:G491)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XPolynomialRing|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XPolynomialRing;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XPolynomialRing|)))))))))) 

(DEFUN |XPolynomialRing;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G489 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XPolynomialRing| DV$1 DV$2))
    (LETT $ (GETREFV 69))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedSet|))))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1|
                                                       '(|noZeroDivisors|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| |#2|
                                                         '(|OrderedSet|))))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|XPolynomialRing| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (COND
     ((|testBitVector| |pv$| 6)
      (QSETREFV $ 45 (CONS (|dispatchFunction| |XPR;*;3$;14|) $)))
     ('T (QSETREFV $ 45 (CONS (|dispatchFunction| |XPR;*;3$;15|) $))))
    (COND
     ((|testBitVector| |pv$| 9)
      (QSETREFV $ 57 (CONS (|dispatchFunction| |XPR;/;$R$;20|) $))))
    $))) 

(MAKEPROP '|XPolynomialRing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 6 7) (|local| |#1|)
              (|local| |#2|) '|Rep| (0 . |One|) (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |XPR;One;$;1|) $))
              (|NonNegativeInteger|) (8 . |characteristic|)
              |XPR;characteristic;Nni;2| |XPR;#;$Nni;3| |XPR;maxdeg;$E;4|
              (|Record| (|:| |k| 7) (|:| |c| 6)) (12 . |last|)
              |XPR;mindeg;$E;5| (|Boolean|) (17 . =) (23 . <) (29 . |Zero|)
              |XPR;coef;$ER;6| (33 . |Zero|) (37 . =) |XPR;constant?;$B;7|
              |XPR;constant;$R;8| (43 . ~=) |XPR;quasiRegular?;$B;9|
              |XPR;quasiRegular;2$;10| (49 . >) (|Union| $ '"failed")
              (55 . |recip|) |XPR;coerce;R$;12| |XPR;recip;$U;11| (60 . =)
              (|Integer|) (66 . |coerce|) |XPR;coerce;I$;13| (71 . *) (77 . *)
              (83 . *) (89 . +) (95 . *) |XPR;^;$Nni$;16| (|OutputForm|)
              (101 . |coerce|) (106 . |coerce|) (111 . *) (117 . +)
              (|Mapping| 47 47 47) (|List| 47) (123 . |reduce|)
              |XPR;coerce;$Of;19| (129 . |inv|) (134 . /) (|List| 17)
              (|Mapping| 6 7) (|Union| 7 '"failed") (|Mapping| 6 6) (|List| 7)
              (|List| 6) (|List| $) (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(|recip| 140 |quasiRegular?| 145 |quasiRegular| 150 |mindeg| 155
              |maxdeg| 160 |constant?| 165 |constant| 170 |coerce| 175 |coef|
              190 |characteristic| 196 ^ 200 |Zero| 206 |One| 210 = 214 / 220 +
              226 * 232 |#| 244)
           'NIL
           (CONS
            (|makeByteWordVec2| 8
                                '(0 1 0 0 0 0 0 0 1 0 0 0 3 0 0 0 0 0 0 3 0 4 0
                                  0 0 4 0 0 0 0 4 0 0 8 0 0 0 0 2 4 5 6))
            (CONS
             '#(NIL |Algebra&| NIL |Rng&| |FreeModuleCategory&| NIL NIL NIL
                |Module&| NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |OrderedSet&| |Magma&| |AbelianSemiGroup&| NIL
                |SetCategory&| NIL |BasicType&| NIL |RetractableTo&|
                |PartialOrder&| NIL NIL)
             (CONS
              '#((|XAlgebra| 6) (|Algebra| 6) (|Ring|) (|Rng|)
                 (|FreeModuleCategory| 6 7) (|SemiRing|)
                 (|IndexedDirectProductCategory| 6 7) (|SemiRng|) (|Module| 6)
                 (|BiModule| 6 6) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|NonAssociativeRng|)
                 (|RightModule| $$) (|LeftModule| $$)
                 (|OrderedCancellationAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|OrderedSet|) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|SetCategory|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 47)
                 (|RetractableTo| 7) (|PartialOrder|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| 57
                                  '(0 7 0 9 0 6 0 10 0 6 12 13 1 8 17 0 18 2 7
                                    20 0 0 21 2 7 20 0 0 22 0 6 0 23 0 0 0 25 2
                                    0 20 0 0 26 2 7 20 0 0 29 2 7 20 0 0 32 1 6
                                    33 0 34 2 6 20 0 0 37 1 6 0 38 39 2 0 0 6 0
                                    41 2 7 0 0 0 42 2 6 0 0 0 43 2 0 0 0 0 44 2
                                    0 0 0 0 45 1 7 47 0 48 1 6 47 0 49 2 47 0 0
                                    0 50 2 47 0 0 0 51 2 53 47 52 0 54 1 6 0 0
                                    56 2 0 0 0 6 57 1 0 33 0 36 1 0 20 0 30 1 0
                                    0 0 31 1 0 7 0 19 1 0 7 0 16 1 0 20 0 27 1
                                    0 6 0 28 1 0 0 6 35 1 0 0 38 40 1 0 47 0 55
                                    2 0 6 0 7 24 0 0 12 14 2 0 0 0 12 46 0 0 0
                                    25 0 0 0 11 2 0 20 0 0 26 2 9 0 0 6 57 2 0
                                    0 0 0 44 2 0 0 6 0 41 2 0 0 0 0 45 1 0 12 0
                                    15)))))
           '|lookupIncomplete|)) 
