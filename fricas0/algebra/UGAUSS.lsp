
(SDEFUN |UGAUSS;pre_gauss0|
        ((|m| |Matrix| (|Integer|)) (|pivotsj| |Vector| (|Integer|))
         (|pivotsk| |Vector| (|Integer|)) ($ |Void|))
        (SPROG
         ((#1=#:G722 NIL) (|l| NIL) (|pp| (|Integer|)) (#2=#:G721 NIL)
          (|n| NIL) (|ml| #3=(|Integer|)) (|l0| (|Integer|)) (#4=#:G718 NIL)
          (|pv| #3#) (#5=#:G720 NIL) (#6=#:G719 NIL) (|i| NIL)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|) . #7=(|UGAUSS;pre_gauss0|))
              (LETT |k| (ANCOLS |m|) . #7#)
              (EXIT
               (SEQ (LETT |i| 1 . #7#) (LETT #6# |j| . #7#) G190
                    (COND ((|greater_SI| |i| #6#) (GO G191)))
                    (SEQ
                     (SEQ
                      (EXIT
                       (SEQ (LETT |l| 1 . #7#) (LETT #5# |k| . #7#) G190
                            (COND ((|greater_SI| |l| #5#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (SPADCALL |pivotsk| |l| (QREFELT $ 8)) 0
                                 (QREFELT $ 10))
                                "iterate")
                               ('T
                                (SEQ
                                 (LETT |pv| (QAREF2O |m| |i| |l| 1 1) . #7#)
                                 (EXIT
                                  (COND
                                   ((OR (EQL |pv| 1) (EQL |pv| -1))
                                    (SEQ
                                     (SPADCALL |pivotsj| |i| |l|
                                               (QREFELT $ 11))
                                     (SPADCALL |pivotsk| |l| |i|
                                               (QREFELT $ 11))
                                     (EXIT
                                      (PROGN
                                       (LETT #4# |$NoValue| . #7#)
                                       (GO #8=#:G707))))))))))))
                            (LETT |l| (|inc_SI| |l|) . #7#) (GO G190) G191
                            (EXIT NIL)))
                      #8# (EXIT #4#))
                     (EXIT
                      (COND
                       ((EQL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0)
                        "iterate")
                       ('T
                        (SEQ
                         (LETT |l0| (SPADCALL |pivotsj| |i| (QREFELT $ 8))
                               . #7#)
                         (LETT |ml| (QAREF2O |m| |i| |l0| 1 1) . #7#)
                         (EXIT
                          (SEQ (LETT |n| 1 . #7#) (LETT #2# |j| . #7#) G190
                               (COND ((|greater_SI| |n| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL (QAREF1O |pivotsj| |n| 1) 0)
                                   (COND
                                    ((SPADCALL (QAREF2O |m| |n| |l0| 1 1) 0
                                               (QREFELT $ 10))
                                     (SEQ
                                      (LETT |pp|
                                            (-
                                             (* |ml|
                                                (QAREF2O |m| |n| |l0| 1 1)))
                                            . #7#)
                                      (SEQ (LETT |l| 1 . #7#)
                                           (LETT #1# |k| . #7#) G190
                                           (COND
                                            ((|greater_SI| |l| #1#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |m| |n| |l|
                                                         (+
                                                          (QAREF2O |m| |n| |l|
                                                                   1 1)
                                                          (* |pp|
                                                             (QAREF2O |m| |i|
                                                                      |l| 1
                                                                      1)))
                                                         1 1)))
                                           (LETT |l| (|inc_SI| |l|) . #7#)
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT 0))))))))
                               (LETT |n| (|inc_SI| |n|) . #7#) (GO G190) G191
                               (EXIT NIL))))))))
                    (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |UGAUSS;pre_lr;M2VM;2|
        ((|m| |Matrix| (|Integer|)) (|pivotsj| |Vector| (|Integer|))
         (|pivotsk| |Vector| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((#1=#:G746 NIL) (|l| NIL) (#2=#:G745 NIL) (|pp| (|Integer|))
          (#3=#:G744 NIL) (|n| NIL) (|ml| #4=(|Integer|)) (|l0| (|Integer|))
          (#5=#:G741 NIL) (|pv| #4#) (#6=#:G743 NIL) (#7=#:G742 NIL) (|i| NIL)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
          (|m2| (|Matrix| (|Integer|))))
         (SEQ
          (LETT |m2| (SPADCALL (ANROWS |m|) 1 (QREFELT $ 14))
                . #8=(|UGAUSS;pre_lr;M2VM;2|))
          (SEQ (LETT |j| (ANROWS |m|) . #8#) (LETT |k| (ANCOLS |m|) . #8#)
               (EXIT
                (SEQ (LETT |i| 1 . #8#) (LETT #7# |j| . #8#) G190
                     (COND ((|greater_SI| |i| #7#) (GO G191)))
                     (SEQ
                      (SEQ
                       (EXIT
                        (SEQ (LETT |l| 1 . #8#) (LETT #6# |k| . #8#) G190
                             (COND ((|greater_SI| |l| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (SPADCALL |pivotsk| |l| (QREFELT $ 8)) 0
                                  (QREFELT $ 10))
                                 "iterate")
                                ('T
                                 (SEQ
                                  (LETT |pv| (QAREF2O |m| |i| |l| 1 1) . #8#)
                                  (EXIT
                                   (COND
                                    ((OR (EQL |pv| 1) (EQL |pv| -1))
                                     (SEQ
                                      (SPADCALL |pivotsj| |i| |l|
                                                (QREFELT $ 11))
                                      (SPADCALL |pivotsk| |l| |i|
                                                (QREFELT $ 11))
                                      (EXIT
                                       (PROGN
                                        (LETT #5# |$NoValue| . #8#)
                                        (GO #9=#:G728))))))))))))
                             (LETT |l| (|inc_SI| |l|) . #8#) (GO G190) G191
                             (EXIT NIL)))
                       #9# (EXIT #5#))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0)
                         "iterate")
                        ('T
                         (SEQ
                          (LETT |l0| (SPADCALL |pivotsj| |i| (QREFELT $ 8))
                                . #8#)
                          (LETT |ml| (QAREF2O |m| |i| |l0| 1 1) . #8#)
                          (EXIT
                           (SEQ (LETT |n| 1 . #8#) (LETT #3# |j| . #8#) G190
                                (COND ((|greater_SI| |n| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL (QAREF1O |pivotsj| |n| 1) 0)
                                    (COND
                                     ((SPADCALL (QAREF2O |m| |n| |l0| 1 1) 0
                                                (QREFELT $ 10))
                                      (SEQ
                                       (LETT |pp|
                                             (-
                                              (* |ml|
                                                 (QAREF2O |m| |n| |l0| 1 1)))
                                             . #8#)
                                       (SEQ (LETT |l| 1 . #8#)
                                            (LETT #2# |k| . #8#) G190
                                            (COND
                                             ((|greater_SI| |l| #2#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (QSETAREF2O |m| |n| |l|
                                                          (+
                                                           (QAREF2O |m| |n| |l|
                                                                    1 1)
                                                           (* |pp|
                                                              (QAREF2O |m| |i|
                                                                       |l| 1
                                                                       1)))
                                                          1 1)))
                                            (LETT |l| (|inc_SI| |l|) . #8#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (SEQ (LETT |l| 1 . #8#)
                                             (LETT #1# |j| . #8#) G190
                                             (COND
                                              ((|greater_SI| |l| #1#)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (QSETAREF2O |m2| |n| |l|
                                                           (+
                                                            (QAREF2O |m2| |n|
                                                                     |l| 1 1)
                                                            (* |pp|
                                                               (QAREF2O |m2|
                                                                        |i| |l|
                                                                        1 1)))
                                                           1 1)))
                                             (LETT |l| (|inc_SI| |l|) . #8#)
                                             (GO G190) G191 (EXIT NIL))))))))))
                                (LETT |n| (|inc_SI| |n|) . #8#) (GO G190) G191
                                (EXIT NIL))))))))
                     (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                     (EXIT NIL))))
          (EXIT |m2|)))) 

(SDEFUN |UGAUSS;pre_gauss;2M;3|
        ((|m| |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|pivotsk| #1=(|Vector| (|Integer|))) (|pivotsj| #1#)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|) . #2=(|UGAUSS;pre_gauss;2M;3|))
              (LETT |k| (ANCOLS |m|) . #2#)
              (LETT |pivotsj| (SPADCALL |j| (QREFELT $ 16)) . #2#)
              (LETT |pivotsk| (SPADCALL |k| (QREFELT $ 16)) . #2#)
              (|UGAUSS;pre_gauss0| |m| |pivotsj| |pivotsk| $) (EXIT |m|)))) 

(SDEFUN |UGAUSS;pre_smith;2M;4|
        ((|m| |Matrix| (|Integer|)) ($ |Matrix| (|Integer|)))
        (SPROG
         ((|l0| #1=(|NonNegativeInteger|)) (#2=#:G764 NIL) (|l| NIL) (|i0| #1#)
          (#3=#:G763 NIL) (|i| NIL) (|ress| (|Matrix| (|Integer|)))
          (#4=#:G752 NIL) (#5=#:G751 NIL) (|count| #1#) (#6=#:G762 NIL)
          (|pivotsk| #7=(|Vector| (|Integer|))) (|pivotsj| #7#)
          (|k| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|)))
         (SEQ (LETT |j| (ANROWS |m|) . #8=(|UGAUSS;pre_smith;2M;4|))
              (LETT |k| (ANCOLS |m|) . #8#)
              (LETT |pivotsj| (SPADCALL |j| (QREFELT $ 16)) . #8#)
              (LETT |pivotsk| (SPADCALL |k| (QREFELT $ 16)) . #8#)
              (|UGAUSS;pre_gauss0| |m| |pivotsj| |pivotsk| $)
              (LETT |count| 0 . #8#)
              (SEQ (LETT |i| 1 . #8#) (LETT #6# |j| . #8#) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0
                                 (QREFELT $ 10))
                       (LETT |count| (+ |count| 1) . #8#)))))
                   (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |count| 0) |m|)
                     ('T
                      (SEQ
                       (LETT |ress|
                             (SPADCALL
                              (PROG1 (LETT #5# (- |j| |count|) . #8#)
                                (|check_subtype2| (>= #5# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #5#))
                              (PROG1 (LETT #4# (- |k| |count|) . #8#)
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#))
                              (QREFELT $ 18))
                             . #8#)
                       (LETT |i0| 0 . #8#)
                       (SEQ (LETT |i| 1 . #8#) (LETT #3# |j| . #8#) G190
                            (COND ((|greater_SI| |i| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (SPADCALL |pivotsj| |i| (QREFELT $ 8)) 0)
                                (SEQ (LETT |i0| (+ |i0| 1) . #8#)
                                     (LETT |l0| 0 . #8#)
                                     (EXIT
                                      (SEQ (LETT |l| 1 . #8#)
                                           (LETT #2# |k| . #8#) G190
                                           (COND
                                            ((|greater_SI| |l| #2#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((EQL (QAREF1O |pivotsk| |l| 1)
                                                    0)
                                               (SEQ
                                                (LETT |l0| (+ |l0| 1) . #8#)
                                                (EXIT
                                                 (QSETAREF2O |ress| |i0| |l0|
                                                             (QAREF2O |m| |i|
                                                                      |l| 1 1)
                                                             1 1)))))))
                                           (LETT |l| (|inc_SI| |l|) . #8#)
                                           (GO G190) G191 (EXIT NIL))))))))
                            (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |ress|)))))))) 

(DECLAIM (NOTINLINE |UnitGaussianElimination;|)) 

(DEFUN |UnitGaussianElimination| ()
  (SPROG NIL
         (PROG (#1=#:G766)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|UnitGaussianElimination|)
                    . #2=(|UnitGaussianElimination|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|UnitGaussianElimination|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|UnitGaussianElimination;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|UnitGaussianElimination|)))))))))) 

(DEFUN |UnitGaussianElimination;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|UnitGaussianElimination|)
                . #1=(|UnitGaussianElimination|))
          (LETT $ (GETREFV 20) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|UnitGaussianElimination| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|UnitGaussianElimination| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Vector| 6) (0 . |elt|)
              (|Boolean|) (6 . ~=) (12 . |setelt!|) (|NonNegativeInteger|)
              (|Matrix| 6) (19 . |scalarMatrix|) |UGAUSS;pre_lr;M2VM;2|
              (25 . |zero|) |UGAUSS;pre_gauss;2M;3| (30 . |zero|)
              |UGAUSS;pre_smith;2M;4|)
           '#(|pre_smith| 36 |pre_lr| 41 |pre_gauss| 48) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(2 7 6 0 6 8 2 6 9 0 0 10 3 7
                                                   6 0 6 6 11 2 13 0 12 6 14 1
                                                   7 0 12 16 2 13 0 12 12 18 1
                                                   0 13 13 19 3 0 13 13 7 7 15
                                                   1 0 13 13 17)))))
           '|lookupComplete|)) 

(MAKEPROP '|UnitGaussianElimination| 'NILADIC T) 
