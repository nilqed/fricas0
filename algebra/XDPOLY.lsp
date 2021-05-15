
(SDEFUN |XDPOLY;mindegTerm;$R;1|
        ((|p| $) ($ |Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| R)))
        (SPADCALL |p| (QREFELT $ 10))) 

(SDEFUN |XDPOLY;sh;$Nni$;2| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G390 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 14)) ((EQL |n| 1) |p|)
                      ('T
                       (SEQ
                        (LETT |n1|
                              (PROG1 (LETT #1# (- |n| 1))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#)))
                        (EXIT
                         (SPADCALL |p| (SPADCALL |p| |n1| (QREFELT $ 17))
                                   (QREFELT $ 18))))))))) 

(SDEFUN |XDPOLY;sh;3$;3| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|p| ($)) (#1=#:G398 NIL) (|t2| NIL) (#2=#:G397 NIL) (|t1| NIL))
         (SEQ (LETT |p| (|spadConstant| $ 12))
              (SEQ (LETT |t1| NIL) (LETT #2# |p1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL) (LETT #1# |p2|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |t2| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |p|
                                  (SPADCALL |p|
                                            (SPADCALL
                                             (SPADCALL (QCDR |t1|) (QCDR |t2|)
                                                       (QREFELT $ 19))
                                             (|XDPOLY;shw| (QCAR |t1|)
                                              (QCAR |t2|) $)
                                             (QREFELT $ 20))
                                            (QREFELT $ 21)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(SDEFUN |XDPOLY;coerce;vl$;4| ((|v| |vl|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 23)) (QREFELT $ 24))) 

(SDEFUN |XDPOLY;*;vl2$;5| ((|v| |vl|) (|p| $) ($ $))
        (SPROG ((#1=#:G403 NIL) (|t| NIL) (#2=#:G402 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL |v| (QCAR |t|) (QREFELT $ 26))
                                     (QCDR |t|))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |XDPOLY;mirror;2$;6| ((|p| $) ($ $))
        (COND ((NULL |p|) |p|)
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 28)) (QREFELT $ 29))
                 (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 31))
                (SPADCALL (SPADCALL |p| (QREFELT $ 32)) (QREFELT $ 33))
                (QREFELT $ 21))))) 

(SDEFUN |XDPOLY;degree;$Nni;7| ((|p| $) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 34)) (QREFELT $ 35))) 

(SDEFUN |XDPOLY;trunc;$Nni$;8| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (COND
         ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
              (NULL (> (SPADCALL |p| (QREFELT $ 36)) |n|)))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 32)) |n| (QREFELT $ 39))))) 

(SDEFUN |XDPOLY;varList;$L;9| ((|p| $) ($ |List| |vl|))
        (SPROG
         ((|le| #1=(|List| |vl|)) (#2=#:G410 NIL) (#3=#:G409 #1#)
          (#4=#:G411 #1#) (#5=#:G415 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 40)) NIL)
                (#6='T
                 (SEQ
                  (LETT |le|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |t| NIL) (LETT #5# |p|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |t| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4#
                                       (SPADCALL (QCAR |t|) (QREFELT $ 42)))
                                 (COND
                                  (#2#
                                   (LETT #3#
                                         (SPADCALL #3# #4# (QREFELT $ 43))))
                                  ('T (PROGN (LETT #3# #4#) (LETT #2# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#2# #3#) (#6# (|IdentityError| '|setUnion|)))))
                  (EXIT (SPADCALL |le| (QREFELT $ 44))))))))) 

(SDEFUN |XDPOLY;rquo;$Fm$;10| ((|p| $) (|w| |FreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G417 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G423 NIL) (|t| NIL) (#4=#:G422 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 47)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;$Fm$;11| ((|p| $) (|w| |FreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G425 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G431 NIL) (|t| NIL) (#4=#:G430 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 49)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;rquo;$vl$;12| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G433 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G439 NIL) (|t| NIL) (#4=#:G438 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 51)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;$vl$;13| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G441 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G447 NIL) (|t| NIL) (#4=#:G446 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |t| NIL) (LETT #3# |p|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 53)))
                         (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#))))))
                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;shw| ((|w1| |FreeMonoid| |vl|) (|w2| |FreeMonoid| |vl|) ($ $))
        (SPROG ((|y| (|vl|)) (|x| (|vl|)))
               (SEQ
                (COND
                 ((SPADCALL |w1| (|spadConstant| $ 55) (QREFELT $ 56))
                  (SPADCALL |w2| (QREFELT $ 24)))
                 ((SPADCALL |w2| (|spadConstant| $ 55) (QREFELT $ 56))
                  (SPADCALL |w1| (QREFELT $ 24)))
                 ('T
                  (SEQ (LETT |x| (SPADCALL |w1| (QREFELT $ 57)))
                       (LETT |y| (SPADCALL |w2| (QREFELT $ 57)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL |x|
                                   (|XDPOLY;shw| (SPADCALL |w1| (QREFELT $ 58))
                                    |w2| $)
                                   (QREFELT $ 27))
                         (SPADCALL |y|
                                   (|XDPOLY;shw| |w1|
                                    (SPADCALL |w2| (QREFELT $ 58)) $)
                                   (QREFELT $ 27))
                         (QREFELT $ 21))))))))) 

(SDEFUN |XDPOLY;lquo;3$;15| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G453 NIL) (#2=#:G452 ($)) (#3=#:G454 ($)) (|r| ($))
          (#4=#:G456 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |q|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 50)))
                     (|spadConstant| $ 12) (QREFELT $ 59))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 60)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;rquo;3$;16| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G458 NIL) (#2=#:G457 ($)) (#3=#:G459 ($)) (|r| ($))
          (#4=#:G461 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |t| NIL) (LETT #4# |q|) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 48)))
                     (|spadConstant| $ 12) (QREFELT $ 59))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 60)))
                     (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;coef;2$R;17| ((|p| $) (|q| $) ($ R))
        (SPROG ((#1=#:G465 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
                       (SPADCALL |q| (|spadConstant| $ 12) (QREFELT $ 38)))
                   (|spadConstant| $ 13))
                  ('T
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 63))
                     (SPADCALL (CDR |p|) |q| (QREFELT $ 64)))
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 65))
                     (SPADCALL |p| (CDR |q|) (QREFELT $ 64)))
                    ('T
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (QCDR (|SPADfirst| |p|))
                                       (QCDR (|SPADfirst| |q|)) (QREFELT $ 19))
                             (SPADCALL (CDR |p|) (CDR |q|) (QREFELT $ 64))
                             (QREFELT $ 66)))
                      (GO #2=#:G464)))))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |XDistributedPolynomial;|)) 

(DEFUN |XDistributedPolynomial| (&REST #1=#:G473)
  (SPROG NIL
         (PROG (#2=#:G474)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XDistributedPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XDistributedPolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XDistributedPolynomial|)))))))))) 

(DEFUN |XDistributedPolynomial;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G472 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|XDistributedPolynomial| DV$1 DV$2))
    (LETT $ (GETREFV 80))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         (|HasCategory| (|FreeMonoid| |#1|)
                                                        '(|OrderedSet|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|FreeMonoid| |#1|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|FreeMonoid| |#1|)
                                                         '(|OrderedSet|))))
                                        (|HasCategory| |#2|
                                                       '(|noZeroDivisors|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|FreeMonoid| |#1|)
                                               '(|Comparable|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2| '(|Comparable|))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|))
                                          (|HasCategory| (|FreeMonoid| |#1|)
                                                         '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|))
                                          (|HasCategory| (|FreeMonoid| |#1|)
                                                         '(|OrderedSet|))))))))
    (|haddProp| |$ConstructorCache| '|XDistributedPolynomial| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8
              (|List| (|Record| (|:| |k| (|FreeMonoid| |#1|)) (|:| |c| |#2|))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 17 (CONS (|dispatchFunction| |XDPOLY;sh;$Nni$;2|) $))
       (QSETREFV $ 18 (CONS (|dispatchFunction| |XDPOLY;sh;3$;3|) $)))))
    $))) 

(MAKEPROP '|XDistributedPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XPolynomialRing| 7 22) (|local| |#1|)
              (|local| |#2|) '|Rep| (|Record| (|:| |k| 22) (|:| |c| 7))
              (0 . |last|) |XDPOLY;mindegTerm;$R;1| (5 . |Zero|) (9 . |Zero|)
              (13 . |One|) (17 . |One|) (|NonNegativeInteger|) (21 . |sh|)
              (27 . |sh|) (33 . *) (39 . *) (45 . +) (|FreeMonoid| 6)
              (51 . |coerce|) (56 . |coerce|) |XDPOLY;coerce;vl$;4| (61 . *)
              |XDPOLY;*;vl2$;5| (67 . |leadingSupport|) (72 . |mirror|)
              (77 . |leadingCoefficient|) (82 . |monom|) (88 . |reductum|)
              |XDPOLY;mirror;2$;6| (93 . |maxdeg|) (98 . |length|)
              |XDPOLY;degree;$Nni;7| (|Boolean|) (103 . =)
              |XDPOLY;trunc;$Nni$;8| (109 . |constant?|) (|List| 6)
              (114 . |varList|) (119 . |setUnion|) (125 . |sort!|)
              |XDPOLY;varList;$L;9| (|Union| $ '"failed") (130 . |rquo|)
              |XDPOLY;rquo;$Fm$;10| (136 . |lquo|) |XDPOLY;lquo;$Fm$;11|
              (142 . |rquo|) |XDPOLY;rquo;$vl$;12| (148 . |lquo|)
              |XDPOLY;lquo;$vl$;13| (154 . |One|) (158 . =) (164 . |first|)
              (169 . |rest|) (174 . ~=) (180 . *) |XDPOLY;lquo;3$;15|
              |XDPOLY;rquo;3$;16| (186 . >) |XDPOLY;coef;2$R;17| (192 . <)
              (198 . +) (|List| 9) (|Mapping| 7 22) (|PositiveInteger|)
              (|Integer|) (|Union| 22 '"failed") (|List| 22) (|List| $)
              (|List| 7) (|Mapping| 7 7) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 204 |zero?| 210 |varList| 215 |trunc| 220 |support| 226 |sup|
              231 |subtractIfCan| 237 |smaller?| 243 |sh| 249 |sample| 261
              |rquo| 265 |rightRecip| 283 |rightPower| 288 |retractIfCan| 300
              |retract| 305 |reductum| 310 |recip| 315 |quasiRegular?| 320
              |quasiRegular| 325 |opposite?| 330 |one?| 336 |numberOfMonomials|
              341 |monomials| 346 |monomial?| 351 |monomial| 356 |monom| 362
              |mirror| 368 |mindegTerm| 373 |mindeg| 378 |min| 383 |maxdeg| 389
              |max| 394 |map| 400 |lquo| 406 |listOfTerms| 424 |linearExtend|
              429 |leftRecip| 435 |leftPower| 440 |leadingTerm| 452
              |leadingSupport| 457 |leadingMonomial| 462 |leadingCoefficient|
              467 |latex| 472 |hashUpdate!| 477 |hash| 483 |degree| 488
              |constructOrdered| 493 |construct| 498 |constant?| 503 |constant|
              508 |commutator| 513 |coerce| 519 |coefficients| 544
              |coefficient| 549 |coef| 555 |characteristic| 567 |associator|
              571 |antiCommutator| 578 |annihilate?| 584 ^ 590 |Zero| 602 |One|
              606 >= 610 > 616 = 622 <= 628 < 634 - 640 + 651 * 657)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 1 0 0 0 0 0 0 1 0 0 0 2 0 0 0 0 0 0 2 0
                                  3 0 0 0 3 0 0 0 0 3 0 0 6 0 0 0 0 0 3 4))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |FreeModuleCategory&| NIL |Rng&| NIL
                NIL |Module&| NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |OrderedSet&| |Magma&|
                |AbelianSemiGroup&| NIL |SetCategory&| NIL |RetractableTo&|
                |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|XPolynomialsCat| 6 7) (|XFreeAlgebra| 6 7) (|XAlgebra| 7)
                 (|Algebra| 7) (|Ring|)
                 (|FreeModuleCategory| 7 (|FreeMonoid| 6)) (|SemiRing|) (|Rng|)
                 (|SemiRng|)
                 (|IndexedDirectProductCategory| 7 (|FreeMonoid| 6))
                 (|Module| 7) (|BiModule| 7 7) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|OrderedAbelianMonoidSup|)
                 (|LeftModule| 7) (|RightModule| $$) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|AbelianProductCategory| 7)
                 (|RightModule| 7) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|OrderedSet|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|SetCategory|)
                 (|unitsKnown|) (|RetractableTo| (|FreeMonoid| 6))
                 (|BasicType|) (|CoercibleTo| 79) (|PartialOrder|)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| 79
                                  '(1 8 9 0 10 0 0 0 12 0 7 0 13 0 0 0 14 0 7 0
                                    15 2 0 0 0 16 17 2 0 0 0 0 18 2 7 0 0 0 19
                                    2 0 0 7 0 20 2 0 0 0 0 21 1 22 0 6 23 1 0 0
                                    22 24 2 22 0 6 0 26 1 0 22 0 28 1 22 0 0 29
                                    1 0 7 0 30 2 0 0 22 7 31 1 0 0 0 32 1 0 22
                                    0 34 1 22 16 0 35 2 0 37 0 0 38 1 0 37 0 40
                                    1 22 41 0 42 2 41 0 0 0 43 1 41 0 0 44 2 22
                                    46 0 0 47 2 22 46 0 0 49 2 22 46 0 6 51 2
                                    22 46 0 6 53 0 22 0 55 2 22 37 0 0 56 1 22
                                    6 0 57 1 22 0 0 58 2 0 37 0 0 59 2 0 0 0 7
                                    60 2 22 37 0 0 63 2 22 37 0 0 65 2 7 0 0 0
                                    66 2 0 37 0 0 59 1 0 37 0 1 1 0 41 0 45 2 0
                                    0 0 16 39 1 0 72 0 1 2 2 0 0 0 1 2 0 46 0 0
                                    1 2 6 37 0 0 1 2 1 0 0 16 17 2 1 0 0 0 18 0
                                    0 0 1 2 0 0 0 6 52 2 0 0 0 22 48 2 0 0 0 0
                                    62 1 0 46 0 1 2 0 0 0 69 1 2 0 0 0 16 1 1 0
                                    71 0 1 1 0 22 0 1 1 5 0 0 32 1 0 46 0 1 1 0
                                    37 0 1 1 0 0 0 1 2 0 37 0 0 1 1 0 37 0 1 1
                                    0 16 0 1 1 0 73 0 1 1 0 37 0 1 2 0 0 7 22 1
                                    2 0 0 22 7 31 1 0 0 0 33 1 0 9 0 11 1 0 22
                                    0 1 2 3 0 0 0 1 1 0 22 0 34 2 3 0 0 0 1 2 0
                                    0 75 0 1 2 0 0 0 6 54 2 0 0 0 22 50 2 0 0 0
                                    0 61 1 0 67 0 1 2 1 7 68 0 1 1 0 46 0 1 2 0
                                    0 0 69 1 2 0 0 0 16 1 1 5 9 0 1 1 5 22 0 28
                                    1 5 0 0 1 1 5 7 0 30 1 0 76 0 1 2 0 78 78 0
                                    1 1 0 77 0 1 1 0 16 0 36 1 5 0 67 1 1 0 0
                                    67 1 1 0 37 0 40 1 0 7 0 1 2 0 0 0 0 1 1 0
                                    0 70 1 1 0 0 7 1 1 0 0 22 24 1 0 0 6 25 1 0
                                    79 0 1 1 0 74 0 1 2 0 7 0 22 1 2 0 7 0 22 1
                                    2 0 7 0 0 64 0 0 16 1 3 0 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 37 0 0 1 2 0 0 0 69 1 2 0 0 0 16 1
                                    0 0 0 12 0 0 0 14 2 3 37 0 0 1 2 3 37 0 0 1
                                    2 0 37 0 0 38 2 3 37 0 0 1 2 3 37 0 0 1 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 21 2 0 0 0 0 1
                                    2 0 0 70 0 1 2 0 0 16 0 1 2 0 0 6 0 27 2 0
                                    0 7 22 1 2 0 0 22 7 1 2 0 0 0 7 60 2 0 0 7
                                    0 20 2 0 0 69 0 1)))))
           '|lookupComplete|)) 
