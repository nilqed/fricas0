
(SDEFUN |XDPOLY;mindegTerm;$R;1|
        ((|p| $) ($ |Record| (|:| |k| (|FreeMonoid| |vl|)) (|:| |c| R)))
        (SPADCALL |p| (QREFELT $ 10))) 

(SDEFUN |XDPOLY;sh;$Nni$;2| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((|n1| (|NonNegativeInteger|)) (#1=#:G716 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| $ 14)) ((EQL |n| 1) |p|)
                      ('T
                       (SEQ
                        (LETT |n1|
                              (PROG1
                                  (LETT #1# (- |n| 1)
                                        . #2=(|XDPOLY;sh;$Nni$;2|))
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              . #2#)
                        (EXIT
                         (SPADCALL |p| (SPADCALL |p| |n1| (QREFELT $ 17))
                                   (QREFELT $ 18))))))))) 

(SDEFUN |XDPOLY;sh;3$;3| ((|p1| $) (|p2| $) ($ $))
        (SPROG
         ((|p| ($)) (#1=#:G725 NIL) (|t2| NIL) (#2=#:G724 NIL) (|t1| NIL))
         (SEQ (LETT |p| (|spadConstant| $ 12) . #3=(|XDPOLY;sh;3$;3|))
              (SEQ (LETT |t1| NIL . #3#) (LETT #2# |p1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |t1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t2| NIL . #3#) (LETT #1# |p2| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |t2| (CAR #1#) . #3#) NIL))
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
                                            (QREFELT $ 21))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(SDEFUN |XDPOLY;coerce;vl$;4| ((|v| |vl|) ($ $))
        (SPADCALL (SPADCALL |v| (QREFELT $ 23)) (QREFELT $ 24))) 

(SDEFUN |XDPOLY;*;vl2$;5| ((|v| |vl|) (|p| $) ($ $))
        (SPROG ((#1=#:G730 NIL) (|t| NIL) (#2=#:G729 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|XDPOLY;*;vl2$;5|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS (SPADCALL |v| (QCAR |t|) (QREFELT $ 26))
                                     (QCDR |t|))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
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
              (NULL
               (SPADCALL (SPADCALL |p| (QREFELT $ 36)) |n| (QREFELT $ 39))))
          |p|)
         ('T (SPADCALL (SPADCALL |p| (QREFELT $ 32)) |n| (QREFELT $ 40))))) 

(SDEFUN |XDPOLY;varList;$L;9| ((|p| $) ($ |List| |vl|))
        (SPROG
         ((|le| #1=(|List| |vl|)) (#2=#:G737 NIL) (#3=#:G736 #1#)
          (#4=#:G738 #1#) (#5=#:G742 NIL) (|t| NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 41)) NIL)
                (#6='T
                 (SEQ
                  (LETT |le|
                        (PROGN
                         (LETT #2# NIL . #7=(|XDPOLY;varList;$L;9|))
                         (SEQ (LETT |t| NIL . #7#) (LETT #5# |p| . #7#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |t| (CAR #5#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #4# (SPADCALL (QCAR |t|) (QREFELT $ 43))
                                       . #7#)
                                 (COND
                                  (#2#
                                   (LETT #3# (SPADCALL #3# #4# (QREFELT $ 44))
                                         . #7#))
                                  ('T
                                   (PROGN
                                    (LETT #3# #4# . #7#)
                                    (LETT #2# 'T . #7#)))))))
                              (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (COND (#2# #3#) (#6# (|IdentityError| '|setUnion|))))
                        . #7#)
                  (EXIT (SPADCALL |le| (QREFELT $ 45))))))))) 

(SDEFUN |XDPOLY;rquo;$Fm$;10| ((|p| $) (|w| |FreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G744 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G750 NIL) (|t| NIL) (#4=#:G749 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL . #5=(|XDPOLY;rquo;$Fm$;10|))
           (SEQ (LETT |t| NIL . #5#) (LETT #3# |p| . #5#) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 48)) . #5#)
                     (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #5#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#)
                          . #5#)))))
                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;$Fm$;11| ((|p| $) (|w| |FreeMonoid| |vl|) ($ $))
        (SPROG
         ((#1=#:G752 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G758 NIL) (|t| NIL) (#4=#:G757 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL . #5=(|XDPOLY;lquo;$Fm$;11|))
           (SEQ (LETT |t| NIL . #5#) (LETT #3# |p| . #5#) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |w| (QREFELT $ 50)) . #5#)
                     (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #5#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#)
                          . #5#)))))
                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;rquo;$vl$;12| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G760 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G766 NIL) (|t| NIL) (#4=#:G765 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL . #5=(|XDPOLY;rquo;$vl$;12|))
           (SEQ (LETT |t| NIL . #5#) (LETT #3# |p| . #5#) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 52)) . #5#)
                     (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #5#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#)
                          . #5#)))))
                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;lquo;$vl$;13| ((|p| $) (|v| |vl|) ($ $))
        (SPROG
         ((#1=#:G768 NIL) (|r| (|Union| (|FreeMonoid| |vl|) #2="failed"))
          (#3=#:G774 NIL) (|t| NIL) (#4=#:G773 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL . #5=(|XDPOLY;lquo;$vl$;13|))
           (SEQ (LETT |t| NIL . #5#) (LETT #3# |p| . #5#) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SEQ
                     (LETT |r| (SPADCALL (QCAR |t|) |v| (QREFELT $ 54)) . #5#)
                     (EXIT (NULL (QEQCAR |r| 1))))
                    (LETT #4#
                          (CONS
                           (CONS
                            (PROG2 (LETT #1# |r| . #5#)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|FreeMonoid| (QREFELT $ 6))
                                              (|Union|
                                               (|FreeMonoid| (QREFELT $ 6))
                                               #2#)
                                              #1#))
                            (QCDR |t|))
                           #4#)
                          . #5#)))))
                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                (EXIT (NREVERSE #4#))))))) 

(SDEFUN |XDPOLY;shw| ((|w1| |FreeMonoid| |vl|) (|w2| |FreeMonoid| |vl|) ($ $))
        (SPROG ((|y| (|vl|)) (|x| (|vl|)))
               (SEQ
                (COND
                 ((SPADCALL |w1| (|spadConstant| $ 56) (QREFELT $ 57))
                  (SPADCALL |w2| (QREFELT $ 24)))
                 ((SPADCALL |w2| (|spadConstant| $ 56) (QREFELT $ 57))
                  (SPADCALL |w1| (QREFELT $ 24)))
                 ('T
                  (SEQ
                   (LETT |x| (SPADCALL |w1| (QREFELT $ 58))
                         . #1=(|XDPOLY;shw|))
                   (LETT |y| (SPADCALL |w2| (QREFELT $ 58)) . #1#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL |x|
                               (|XDPOLY;shw| (SPADCALL |w1| (QREFELT $ 59))
                                |w2| $)
                               (QREFELT $ 27))
                     (SPADCALL |y|
                               (|XDPOLY;shw| |w1|
                                (SPADCALL |w2| (QREFELT $ 59)) $)
                               (QREFELT $ 27))
                     (QREFELT $ 21))))))))) 

(SDEFUN |XDPOLY;lquo;3$;15| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G780 NIL) (#2=#:G779 ($)) (#3=#:G781 ($)) (|r| ($))
          (#4=#:G783 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XDPOLY;lquo;3$;15|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |q| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 51)) . #5#)
                     (|spadConstant| $ 12) (QREFELT $ 60))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 61)) . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                      ('T
                       (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;rquo;3$;16| ((|p| $) (|q| $) ($ $))
        (SPROG
         ((#1=#:G785 NIL) (#2=#:G784 ($)) (#3=#:G786 ($)) (|r| ($))
          (#4=#:G788 NIL) (|t| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|XDPOLY;rquo;3$;16|))
           (SEQ (LETT |t| NIL . #5#) (LETT #4# |q| . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL
                     (LETT |r| (SPADCALL |p| (QCAR |t|) (QREFELT $ 49)) . #5#)
                     (|spadConstant| $ 12) (QREFELT $ 60))
                    (PROGN
                     (LETT #3# (SPADCALL |r| (QCDR |t|) (QREFELT $ 61)) . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 21)) . #5#))
                      ('T
                       (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 12))))))) 

(SDEFUN |XDPOLY;coef;2$R;17| ((|p| $) (|q| $) ($ R))
        (SPROG ((#1=#:G792 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((OR (SPADCALL |p| (|spadConstant| $ 12) (QREFELT $ 38))
                       (SPADCALL |q| (|spadConstant| $ 12) (QREFELT $ 38)))
                   (|spadConstant| $ 13))
                  ('T
                   (COND
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 64))
                     (SPADCALL (CDR |p|) |q| (QREFELT $ 65)))
                    ((SPADCALL (QCAR (|SPADfirst| |p|))
                               (QCAR (|SPADfirst| |q|)) (QREFELT $ 66))
                     (SPADCALL |p| (CDR |q|) (QREFELT $ 65)))
                    ('T
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (QCDR (|SPADfirst| |p|))
                                       (QCDR (|SPADfirst| |q|)) (QREFELT $ 19))
                             (SPADCALL (CDR |p|) (CDR |q|) (QREFELT $ 65))
                             (QREFELT $ 67))
                            |XDPOLY;coef;2$R;17|)
                      (GO #2=#:G791)))))))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |XDistributedPolynomial;|)) 

(DEFUN |XDistributedPolynomial| (&REST #1=#:G801)
  (SPROG NIL
         (PROG (#2=#:G802)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|XDistributedPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|XDistributedPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |XDistributedPolynomial;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|XDistributedPolynomial|)))))))))) 

(DEFUN |XDistributedPolynomial;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|XDistributedPolynomial|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|XDistributedPolynomial| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 81) . #1#)
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
                                               (|HasCategory|
                                                (|FreeMonoid| |#1|)
                                                '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#2|
                                                              '(|Comparable|))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|FreeMonoid| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|FreeMonoid| |#1|)
                                                 '(|OrderedSet|))))
                                              (OR
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoid|))
                                                (|HasCategory|
                                                 (|FreeMonoid| |#1|)
                                                 '(|OrderedSet|)))
                                               (AND
                                                (|HasCategory| |#2|
                                                               '(|OrderedAbelianMonoidSup|))
                                                (|HasCategory|
                                                 (|FreeMonoid| |#1|)
                                                 '(|OrderedSet|))))
                                              (|HasCategory| |#2|
                                                             '(|noZeroDivisors|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|XDistributedPolynomial|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|List|
                     (|Record| (|:| |k| (|FreeMonoid| |#1|)) (|:| |c| |#2|))))
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
              |XDPOLY;degree;$Nni;7| (|Boolean|) (103 . =) (109 . >)
              |XDPOLY;trunc;$Nni$;8| (115 . |constant?|) (|List| 6)
              (120 . |varList|) (125 . |setUnion|) (131 . |sort!|)
              |XDPOLY;varList;$L;9| (|Union| $ '"failed") (136 . |rquo|)
              |XDPOLY;rquo;$Fm$;10| (142 . |lquo|) |XDPOLY;lquo;$Fm$;11|
              (148 . |rquo|) |XDPOLY;rquo;$vl$;12| (154 . |lquo|)
              |XDPOLY;lquo;$vl$;13| (160 . |One|) (164 . =) (170 . |first|)
              (175 . |rest|) (180 . ~=) (186 . *) |XDPOLY;lquo;3$;15|
              |XDPOLY;rquo;3$;16| (192 . >) |XDPOLY;coef;2$R;17| (198 . <)
              (204 . +) (|Mapping| 7 22) (|PositiveInteger|) (|Integer|)
              (|Union| 22 '"failed") (|List| 22) (|List| $) (|List| 7)
              (|Mapping| 7 7) (|List| 9) (|String|) (|SingleInteger|)
              (|HashState|) (|OutputForm|))
           '#(~= 210 |zero?| 216 |varList| 221 |trunc| 226 |support| 232 |sup|
              237 |subtractIfCan| 243 |smaller?| 249 |sh| 255 |sample| 267
              |rquo| 271 |rightRecip| 289 |rightPower| 294 |retractIfCan| 306
              |retract| 311 |reductum| 316 |recip| 321 |quasiRegular?| 326
              |quasiRegular| 331 |opposite?| 336 |one?| 342 |numberOfMonomials|
              347 |monomials| 352 |monomial?| 357 |monomial| 362 |monom| 368
              |mirror| 374 |mindegTerm| 379 |mindeg| 384 |min| 389 |maxdeg| 395
              |max| 400 |map| 406 |lquo| 412 |listOfTerms| 430 |linearExtend|
              435 |leftRecip| 441 |leftPower| 446 |leadingTerm| 458
              |leadingSupport| 463 |leadingMonomial| 468 |leadingCoefficient|
              473 |latex| 478 |hashUpdate!| 483 |hash| 489 |degree| 494
              |constructOrdered| 499 |construct| 504 |constant?| 509 |constant|
              514 |commutator| 519 |coerce| 525 |coefficients| 550
              |coefficient| 555 |coef| 561 |characteristic| 573 |associator|
              577 |antiCommutator| 584 |annihilate?| 590 ^ 596 |Zero| 608 |One|
              612 >= 616 > 622 = 628 <= 634 < 640 - 646 + 657 * 663)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 1 0 0 0 0 0 0 1 0 0 0 2 0 0 0 0 0 0 2 0
                                  4 0 0 0 4 0 0 0 0 4 0 0 3 0 0 0 0 0 4 5))
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
                 (|BasicType|) (|CoercibleTo| 80) (|PartialOrder|)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| 80
                                  '(1 8 9 0 10 0 0 0 12 0 7 0 13 0 0 0 14 0 7 0
                                    15 2 0 0 0 16 17 2 0 0 0 0 18 2 7 0 0 0 19
                                    2 0 0 7 0 20 2 0 0 0 0 21 1 22 0 6 23 1 0 0
                                    22 24 2 22 0 6 0 26 1 0 22 0 28 1 22 0 0 29
                                    1 0 7 0 30 2 0 0 22 7 31 1 0 0 0 32 1 0 22
                                    0 34 1 22 16 0 35 2 0 37 0 0 38 2 16 37 0 0
                                    39 1 0 37 0 41 1 22 42 0 43 2 42 0 0 0 44 1
                                    42 0 0 45 2 22 47 0 0 48 2 22 47 0 0 50 2
                                    22 47 0 6 52 2 22 47 0 6 54 0 22 0 56 2 22
                                    37 0 0 57 1 22 6 0 58 1 22 0 0 59 2 0 37 0
                                    0 60 2 0 0 0 7 61 2 22 37 0 0 64 2 22 37 0
                                    0 66 2 7 0 0 0 67 2 0 37 0 0 60 1 0 37 0 1
                                    1 0 42 0 46 2 0 0 0 16 40 1 0 72 0 1 2 2 0
                                    0 0 1 2 0 47 0 0 1 2 3 37 0 0 1 2 1 0 0 16
                                    17 2 1 0 0 0 18 0 0 0 1 2 0 0 0 6 53 2 0 0
                                    0 22 49 2 0 0 0 0 63 1 0 47 0 1 2 0 0 0 69
                                    1 2 0 0 0 16 1 1 0 71 0 1 1 0 22 0 1 1 0 0
                                    0 32 1 0 47 0 1 1 0 37 0 1 1 0 0 0 1 2 0 37
                                    0 0 1 1 0 37 0 1 1 0 16 0 1 1 0 73 0 1 1 0
                                    37 0 1 2 0 0 7 22 1 2 0 0 22 7 31 1 0 0 0
                                    33 1 0 9 0 11 1 0 22 0 1 2 4 0 0 0 1 1 0 22
                                    0 34 2 4 0 0 0 1 2 0 0 75 0 1 2 0 0 0 6 55
                                    2 0 0 0 22 51 2 0 0 0 0 62 1 0 76 0 1 2 1 7
                                    68 0 1 1 0 47 0 1 2 0 0 0 69 1 2 0 0 0 16 1
                                    1 0 9 0 1 1 0 22 0 28 1 0 0 0 1 1 0 7 0 30
                                    1 0 77 0 1 2 0 79 79 0 1 1 0 78 0 1 1 0 16
                                    0 36 1 0 0 76 1 1 0 0 76 1 1 0 37 0 41 1 0
                                    7 0 1 2 0 0 0 0 1 1 0 0 70 1 1 0 0 7 1 1 0
                                    0 22 24 1 0 0 6 25 1 0 80 0 1 1 0 74 0 1 2
                                    0 7 0 22 1 2 0 7 0 22 1 2 0 7 0 0 65 0 0 16
                                    1 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 37 0 0 1 2
                                    0 0 0 69 1 2 0 0 0 16 1 0 0 0 12 0 0 0 14 2
                                    4 37 0 0 1 2 4 37 0 0 1 2 0 37 0 0 38 2 4
                                    37 0 0 1 2 4 37 0 0 1 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 21 2 0 0 0 0 1 2 0 0 70 0 1 2 0 0
                                    16 0 1 2 0 0 6 0 27 2 0 0 7 22 1 2 0 0 22 7
                                    1 2 0 0 0 7 61 2 0 0 7 0 20 2 0 0 69 0
                                    1)))))
           '|lookupComplete|)) 
