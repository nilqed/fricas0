
(SDEFUN |ASSOCEQ;makeMatrix|
        ((|v| |Vector| (|Matrix| R)) (|n| |NonNegativeInteger|) ($ |Matrix| R))
        (SPROG ((#1=#:G706 NIL) (|i| NIL) (#2=#:G705 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|ASSOCEQ;makeMatrix|))
                  (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |v|) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 13))
                                           |n| (QREFELT $ 15))
                                 (QREFELT $ 17))
                                #2#)
                               . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 19))))) 

(SDEFUN |ASSOCEQ;associatedSystem;LPiR;2|
        ((|op| L) (|m| |PositiveInteger|)
         ($ |Record| (|:| |mat| (|Matrix| R))
          (|:| |vec| (|Vector| (|List| (|PositiveInteger|))))))
        (SPROG
         ((|u| (|Union| S #1="failed")) (#2=#:G735 NIL) (#3=#:G730 NIL)
          (#4=#:G750 NIL) (|j| NIL) (#5=#:G723 NIL) (#6=#:G749 NIL) (|k| NIL)
          (|wi| (S)) (|eq| (|Vector| R)) (#7=#:G748 NIL) (|i| NIL)
          (|a| (|Vector| R)) (#8=#:G719 NIL) (#9=#:G747 NIL) (#10=#:G746 NIL)
          (|an| (R)) (|m1| (|PositiveInteger|)) (#11=#:G717 NIL)
          (M (|Matrix| R)) (|ww| (|Vector| (|List| (|PositiveInteger|))))
          (|s| (|NonNegativeInteger|)) (|w| (|Vector| S))
          (S
           (|Join| (|Finite|)
                   (CATEGORY |domain|
                    (SIGNATURE |incrementKthElement|
                     ((|Union| $ #12="failed") $ (|PositiveInteger|)))
                    (SIGNATURE |replaceKthElement|
                     ((|Union| $ #12#) $ (|PositiveInteger|)
                      (|PositiveInteger|)))
                    (SIGNATURE |elements| ((|List| (|PositiveInteger|)) $))
                    (SIGNATURE |setOfMinN| ($ (|List| (|PositiveInteger|))))
                    (SIGNATURE |enumerate| ((|Vector| $)))
                    (SIGNATURE |member?| ((|Boolean|) (|PositiveInteger|) $))
                    (SIGNATURE |delta|
                     ((|NonNegativeInteger|) $ (|PositiveInteger|)
                      (|PositiveInteger|))))))
          (|n| (|PositiveInteger|)) (#13=#:G712 NIL))
         (SEQ
          (LETT S
                (|SetOfMIntegersInOneToN| |m|
                                          (LETT |n|
                                                (PROG1
                                                    (LETT #13#
                                                          (SPADCALL |op|
                                                                    (QREFELT $
                                                                             21))
                                                          . #14=(|ASSOCEQ;associatedSystem;LPiR;2|))
                                                  (|check_subtype2| (> #13# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #13#))
                                                . #14#))
                . #14#)
          (LETT |w|
                (SPADCALL
                 (|compiledLookupCheck| '|enumerate| (LIST (LIST '|Vector| '$))
                                        S))
                . #14#)
          (LETT |s|
                (SPADCALL
                 (|compiledLookupCheck| '|size|
                                        (LIST (LIST '|NonNegativeInteger|)) S))
                . #14#)
          (LETT |ww| (MAKEARR1 |s| NIL) . #14#)
          (LETT M (MAKE_MATRIX1 |s| |s| (|spadConstant| $ 22)) . #14#)
          (LETT |m1|
                (PROG1 (LETT #11# (- |m| 1) . #14#)
                  (|check_subtype2| (> #11# 0) '(|PositiveInteger|)
                                    '(|Integer|) #11#))
                . #14#)
          (LETT |an| (SPADCALL |op| (QREFELT $ 26)) . #14#)
          (LETT |a|
                (PROGN
                 (LETT #10# (GETREFV |n|) . #14#)
                 (SEQ (LETT |j| 0 . #14#) (LETT #9# (- |n| 1) . #14#) G190
                      (COND ((|greater_SI| |j| #9#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #10# |j|
                                (SPADCALL
                                 (PROG2
                                     (LETT #8#
                                           (SPADCALL
                                            (SPADCALL |op| |j| (QREFELT $ 27))
                                            |an| (QREFELT $ 29))
                                           . #14#)
                                     (QCDR #8#)
                                   (|check_union2| (QEQCAR #8# 0) (QREFELT $ 6)
                                                   (|Union| (QREFELT $ 6)
                                                            "failed")
                                                   #8#))
                                 (QREFELT $ 30)))))
                      (LETT |j| (|inc_SI| |j|) . #14#) (GO G190) G191
                      (EXIT NIL))
                 #10#)
                . #14#)
          (SEQ (LETT |i| 1 . #14#) (LETT #7# |s| . #14#) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ (LETT |eq| (MAKEARR1 |s| (|spadConstant| $ 22)) . #14#)
                    (LETT |wi|
                          (SPADCALL |w| |i|
                                    (|compiledLookupCheck| '|elt|
                                                           (LIST
                                                            (|devaluate| S) '$
                                                            (LIST '|Integer|))
                                                           (|Vector| S)))
                          . #14#)
                    (SPADCALL |ww| |i|
                              (SPADCALL |wi|
                                        (|compiledLookupCheck| '|elements|
                                                               (LIST
                                                                (LIST '|List|
                                                                      (LIST
                                                                       '|PositiveInteger|))
                                                                '$)
                                                               S))
                              (QREFELT $ 33))
                    (SEQ (LETT |k| 1 . #14#) (LETT #6# |m1| . #14#) G190
                         (COND ((|greater_SI| |k| #6#) (GO G191)))
                         (SEQ
                          (LETT |u|
                                (SPADCALL |wi|
                                          (PROG1 (LETT #5# |k| . #14#)
                                            (|check_subtype2| (> #5# 0)
                                                              '(|PositiveInteger|)
                                                              '(|NonNegativeInteger|)
                                                              #5#))
                                          (|compiledLookupCheck|
                                           '|incrementKthElement|
                                           (LIST (LIST '|Union| '$ '#1#) '$
                                                 (LIST '|PositiveInteger|))
                                           S))
                                . #14#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 0)
                             (SPADCALL |eq|
                                       (SPADCALL (QCDR |u|)
                                                 (|compiledLookupCheck|
                                                  '|lookup|
                                                  (LIST
                                                   (LIST '|PositiveInteger|)
                                                   '$)
                                                  S))
                                       (|spadConstant| $ 24)
                                       (QREFELT $ 34))))))
                         (LETT |k| (|inc_SI| |k|) . #14#) (GO G190) G191
                         (EXIT NIL))
                    (COND
                     ((SPADCALL |n| |wi|
                                (|compiledLookupCheck| '|member?|
                                                       (LIST (LIST '|Boolean|)
                                                             (LIST
                                                              '|PositiveInteger|)
                                                             '$)
                                                       S))
                      (SEQ (LETT |j| 1 . #14#) (LETT #4# |n| . #14#) G190
                           (COND ((|greater_SI| |j| #4#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |a| |j| (QREFELT $ 35))
                                         (|spadConstant| $ 22) (QREFELT $ 37))
                               (SEQ
                                (LETT |u|
                                      (SPADCALL |wi| |m|
                                                (PROG1 (LETT #3# |j| . #14#)
                                                  (|check_subtype2| (> #3# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #3#))
                                                (|compiledLookupCheck|
                                                 '|replaceKthElement|
                                                 (LIST (LIST '|Union| '$ '#1#)
                                                       '$
                                                       (LIST
                                                        '|PositiveInteger|)
                                                       (LIST
                                                        '|PositiveInteger|))
                                                 S))
                                      . #14#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |u| 0)
                                   (SPADCALL |eq|
                                             (SPADCALL (QCDR |u|)
                                                       (|compiledLookupCheck|
                                                        '|lookup|
                                                        (LIST
                                                         (LIST
                                                          '|PositiveInteger|)
                                                         '$)
                                                        S))
                                             (COND
                                              ((ODDP
                                                (SPADCALL |wi| |m|
                                                          (PROG1
                                                              (LETT #2# |j|
                                                                    . #14#)
                                                            (|check_subtype2|
                                                             (> #2# 0)
                                                             '(|PositiveInteger|)
                                                             '(|NonNegativeInteger|)
                                                             #2#))
                                                          (|compiledLookupCheck|
                                                           '|delta|
                                                           (LIST
                                                            (LIST
                                                             '|NonNegativeInteger|)
                                                            '$
                                                            (LIST
                                                             '|PositiveInteger|)
                                                            (LIST
                                                             '|PositiveInteger|))
                                                           S)))
                                               (SPADCALL
                                                (SPADCALL |a| |j|
                                                          (QREFELT $ 35))
                                                (QREFELT $ 30)))
                                              ('T
                                               (SPADCALL |a| |j|
                                                         (QREFELT $ 35))))
                                             (QREFELT $ 34))))))))))
                           (LETT |j| (|inc_SI| |j|) . #14#) (GO G190) G191
                           (EXIT NIL)))
                     ('T
                      (SEQ
                       (LETT |u|
                             (SPADCALL |wi| |m|
                                       (|compiledLookupCheck|
                                        '|incrementKthElement|
                                        (LIST (LIST '|Union| '$ '#1#) '$
                                              (LIST '|PositiveInteger|))
                                        S))
                             . #14#)
                       (EXIT
                        (COND
                         ((QEQCAR |u| 0)
                          (SPADCALL |eq|
                                    (SPADCALL (QCDR |u|)
                                              (|compiledLookupCheck| '|lookup|
                                                                     (LIST
                                                                      (LIST
                                                                       '|PositiveInteger|)
                                                                      '$)
                                                                     S))
                                    (|spadConstant| $ 24) (QREFELT $ 34))))))))
                    (EXIT (SPADCALL M |i| |eq| (QREFELT $ 38))))
               (LETT |i| (|inc_SI| |i|) . #14#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS M |ww|))))) 

(SDEFUN |ASSOCEQ;uncouplingMatrices;MV;3|
        ((|m| . #1=(|Matrix| R)) ($ |Vector| (|Matrix| R)))
        (SPROG
         ((#2=#:G757 NIL) (#3=#:G759 NIL) (|i| NIL) (#4=#:G758 NIL) (|mi| #1#)
          (#5=#:G756 NIL) (|v| (|Vector| (|Matrix| R)))
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (ANROWS |m|) . #6=(|ASSOCEQ;uncouplingMatrices;MV;3|))
              (LETT |v| (MAKEARR1 |n| (SPADCALL 1 0 (QREFELT $ 42))) . #6#)
              (SPADCALL |v| 1 (LETT |mi| |m| . #6#) (QREFELT $ 43))
              (SEQ (LETT |i| 2 . #6#) (LETT #5# |n| . #6#) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |v| |i|
                               (LETT |mi|
                                     (SPADCALL
                                      (SPADCALL
                                       (CONS
                                        #'|ASSOCEQ;uncouplingMatrices;MV;3!0|
                                        (VECTOR $ (QREFELT $ 9)))
                                       |mi| (QREFELT $ 46))
                                      (SPADCALL |mi| |m| (QREFELT $ 47))
                                      (QREFELT $ 48))
                                     . #6#)
                               (QREFELT $ 43))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #4# (GETREFV |n|) . #6#)
                (SEQ (LETT |i| 1 . #6#) (LETT #3# |n| . #6#) (LETT #2# 0 . #6#)
                     G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT (SETELT #4# #2# (|ASSOCEQ;makeMatrix| |v| |i| $))))
                     (LETT #2#
                           (PROG1 (|inc_SI| #2#)
                             (LETT |i| (|inc_SI| |i|) . #6#))
                           . #6#)
                     (GO G190) G191 (EXIT NIL))
                #4#))))) 

(SDEFUN |ASSOCEQ;uncouplingMatrices;MV;3!0| ((|z1| NIL) ($$ NIL))
        (PROG (|diff| $)
          (LETT |diff| (QREFELT $$ 1) . #1=(|ASSOCEQ;uncouplingMatrices;MV;3|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |diff| |z1| (QREFELT $ 44)))))) 

(SDEFUN |ASSOCEQ;makeeq|
        ((|v| |Vector| (|List| (|PositiveInteger|))) (|m| |Matrix| R)
         (|i| |NonNegativeInteger|) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |minor| (|List| (|PositiveInteger|))) (|:| |eq| L)
          (|:| |minors| (|List| (|List| (|PositiveInteger|))))
          (|:| |ops| (|List| L))))
        (SPROG
         ((#1=#:G767 NIL) (|j| NIL) (#2=#:G766 NIL) (#3=#:G765 NIL)
          (#4=#:G764 NIL))
         (SEQ
          (VECTOR (SPADCALL |v| |i| (QREFELT $ 50))
                  (SPADCALL
                   (|ASSOCEQ;makeop| (SPADCALL |m| |i| (QREFELT $ 15)) $)
                   (|spadConstant| $ 25) (QREFELT $ 51))
                  (PROGN
                   (LETT #4# NIL . #5=(|ASSOCEQ;makeeq|))
                   (SEQ (LETT |j| 1 . #5#) (LETT #3# |n| . #5#) G190
                        (COND ((|greater_SI| |j| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |j| |i| (QREFELT $ 52))
                            (LETT #4#
                                  (CONS (SPADCALL |v| |j| (QREFELT $ 50)) #4#)
                                  . #5#)))))
                        (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  (PROGN
                   (LETT #2# NIL . #5#)
                   (SEQ (LETT |j| 1 . #5#) (LETT #1# |n| . #5#) G190
                        (COND ((|greater_SI| |j| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL |j| |i| (QREFELT $ 52))
                            (LETT #2#
                                  (CONS
                                   (|ASSOCEQ;makeop|
                                    (SPADCALL |m| |j| (QREFELT $ 15)) $)
                                   #2#)
                                  . #5#)))))
                        (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ASSOCEQ;associatedEquations;LPiR;5|
        ((|op| L) (|m| |PositiveInteger|)
         ($ |Record| (|:| |minor| (|List| (|PositiveInteger|))) (|:| |eq| L)
          (|:| |minors| (|List| (|List| (|PositiveInteger|))))
          (|:| |ops| (|List| L))))
        (SPROG
         ((#1=#:G779 NIL) (|i| NIL)
          (|ww| (|Vector| (|List| (|PositiveInteger|))))
          (|s| (|NonNegativeInteger|)) (|w| (|Vector| S))
          (S
           (|Join| (|Finite|)
                   (CATEGORY |domain|
                    (SIGNATURE |incrementKthElement|
                     ((|Union| $ #2="failed") $ (|PositiveInteger|)))
                    (SIGNATURE |replaceKthElement|
                     ((|Union| $ #2#) $ (|PositiveInteger|)
                      (|PositiveInteger|)))
                    (SIGNATURE |elements| ((|List| (|PositiveInteger|)) $))
                    (SIGNATURE |setOfMinN| ($ (|List| (|PositiveInteger|))))
                    (SIGNATURE |enumerate| ((|Vector| $)))
                    (SIGNATURE |member?| ((|Boolean|) (|PositiveInteger|) $))
                    (SIGNATURE |delta|
                     ((|NonNegativeInteger|) $ (|PositiveInteger|)
                      (|PositiveInteger|))))))
          (#3=#:G772 NIL) (|v| (|Union| (|Matrix| R) "failed"))
          (|u| (|Union| (|Matrix| R) "failed")))
         (SEQ
          (LETT |u| (SPADCALL |op| |m| (QREFELT $ 55))
                . #4=(|ASSOCEQ;associatedEquations;LPiR;5|))
          (EXIT
           (COND ((QEQCAR |u| 1) (|ASSOCEQ;computeIt| |op| |m| 1 $))
                 (#5='T
                  (SEQ (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 56)) . #4#)
                       (EXIT
                        (COND
                         ((QEQCAR |v| 1) (|ASSOCEQ;computeIt| |op| |m| 2 $))
                         (#5#
                          (SEQ
                           (LETT S
                                 (|SetOfMIntegersInOneToN| |m|
                                                           (PROG1
                                                               (LETT #3#
                                                                     (SPADCALL
                                                                      |op|
                                                                      (QREFELT
                                                                       $ 21))
                                                                     . #4#)
                                                             (|check_subtype2|
                                                              (> #3# 0)
                                                              '(|PositiveInteger|)
                                                              '(|NonNegativeInteger|)
                                                              #3#)))
                                 . #4#)
                           (LETT |w|
                                 (SPADCALL
                                  (|compiledLookupCheck| '|enumerate|
                                                         (LIST
                                                          (LIST '|Vector| '$))
                                                         S))
                                 . #4#)
                           (LETT |s|
                                 (SPADCALL
                                  (|compiledLookupCheck| '|size|
                                                         (LIST
                                                          (LIST
                                                           '|NonNegativeInteger|))
                                                         S))
                                 . #4#)
                           (LETT |ww| (MAKEARR1 |s| NIL) . #4#)
                           (SEQ (LETT |i| 1 . #4#) (LETT #1# |s| . #4#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |ww| |i|
                                            (SPADCALL
                                             (SPADCALL |w| |i|
                                                       (|compiledLookupCheck|
                                                        '|elt|
                                                        (LIST (|devaluate| S)
                                                              '$
                                                              (LIST
                                                               '|Integer|))
                                                        (|Vector| S)))
                                             (|compiledLookupCheck| '|elements|
                                                                    (LIST
                                                                     (LIST
                                                                      '|List|
                                                                      (LIST
                                                                       '|PositiveInteger|))
                                                                     '$)
                                                                    S))
                                            (QREFELT $ 33))))
                                (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (|ASSOCEQ;makeeq| |ww| (QCDR |v|) 1 |s|
                             $))))))))))))) 

(SDEFUN |ASSOCEQ;computeIt|
        ((|op| L) (|m| |PositiveInteger|) (|k| |NonNegativeInteger|)
         ($ |Record| (|:| |minor| (|List| (|PositiveInteger|))) (|:| |eq| L)
          (|:| |minors| (|List| (|List| (|PositiveInteger|))))
          (|:| |ops| (|List| L))))
        (SPROG
         ((#1=#:G789 NIL) (#2=#:G790 NIL) (|u| (|Union| (|Matrix| R) "failed"))
          (#3=#:G791 NIL) (|i| NIL) (|n| (|NonNegativeInteger|))
          (|a| (|Vector| (|Matrix| R)))
          (|rec|
           (|Record| (|:| |mat| (|Matrix| R))
                     (|:| |vec| (|Vector| (|List| (|PositiveInteger|)))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rec| (SPADCALL |op| |m| (QREFELT $ 41))
                  . #4=(|ASSOCEQ;computeIt|))
            (LETT |a| (SPADCALL (QCAR |rec|) (QREFELT $ 49)) . #4#)
            (LETT |n| (QVSIZE |a|) . #4#)
            (SEQ
             (EXIT
              (SEQ (LETT |i| |k| . #4#) (LETT #3# |n| . #4#) G190
                   (COND ((> |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |u|
                          (SPADCALL (SPADCALL |a| |i| (QREFELT $ 13))
                                    (QREFELT $ 56))
                          . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (PROGN
                        (LETT #1#
                              (PROGN
                               (LETT #2#
                                     (|ASSOCEQ;makeeq| (QCDR |rec|) (QCDR |u|)
                                      |i| |n| $)
                                     . #4#)
                               (GO #5=#:G788))
                              . #4#)
                        (GO #6=#:G786))))))
                   (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
             #6# (EXIT #1#))
            (EXIT (|error| "associatedEquations: full degenerate case"))))
          #5# (EXIT #2#)))) 

(SDEFUN |ASSOCEQ;makeop| ((|v| |Vector| R) ($ L))
        (SPROG ((|op| (L)) (#1=#:G795 NIL) (|i| NIL))
               (SEQ (LETT |op| (|spadConstant| $ 23) . #2=(|ASSOCEQ;makeop|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |v|) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |op|
                                 (SPADCALL |op|
                                           (SPADCALL
                                            (SPADCALL |v| |i| (QREFELT $ 35))
                                            |i| (QREFELT $ 59))
                                           (QREFELT $ 60))
                                 . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |op|)))) 

(DECLAIM (NOTINLINE |AssociatedEquations;|)) 

(DEFUN |AssociatedEquations| (&REST #1=#:G796)
  (SPROG NIL
         (PROG (#2=#:G797)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AssociatedEquations|)
                                               '|domainEqualList|)
                    . #3=(|AssociatedEquations|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AssociatedEquations;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AssociatedEquations|)))))))))) 

(DEFUN |AssociatedEquations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|AssociatedEquations|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|AssociatedEquations| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 61) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1| '(|Field|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|AssociatedEquations|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 58
                       (CONS
                        (|dispatchFunction|
                         |ASSOCEQ;associatedEquations;LPiR;5|)
                        $)))))
          $))) 

(MAKEPROP '|AssociatedEquations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff| (|Matrix| 6) (|Integer|) (|Vector| 10) (4 . |elt|)
              (|Vector| 6) (10 . |row|) (|List| 6) (16 . |parts|) (|List| 16)
              (21 . |matrix|) (|NonNegativeInteger|) (26 . |degree|)
              (31 . |Zero|) (35 . |Zero|) (39 . |One|) (43 . |One|)
              (47 . |leadingCoefficient|) (52 . |coefficient|)
              (|Union| $ '"failed") (58 . |exquo|) (64 . -) (|List| 40)
              (|Vector| 31) (69 . |setelt!|) (76 . |setelt!|) (83 . |elt|)
              (|Boolean|) (89 . ~=) (95 . |setRow!|)
              (|Record| (|:| |mat| 10) (|:| |vec| 32)) (|PositiveInteger|)
              |ASSOCEQ;associatedSystem;LPiR;2| (102 . |zero|)
              (108 . |setelt!|) (115 . |elt|) (|Mapping| 6 6) (121 . |map|)
              (127 . *) (133 . +) |ASSOCEQ;uncouplingMatrices;MV;3|
              (139 . |elt|) (145 . -) (151 . ~=) (|Union| 10 '"failed")
              (|PrecomputedAssociatedEquations| 6 7)
              (157 . |firstUncouplingMatrix|) (163 . |inverse|)
              (|Record| (|:| |minor| 31) (|:| |eq| 7)
                        (|:| |minors| (|List| 31)) (|:| |ops| (|List| 7)))
              (168 . |associatedEquations|) (174 . |monomial|) (180 . +))
           '#(|uncouplingMatrices| 186 |associatedSystem| 191
              |associatedEquations| 197)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(0 7 0 8 2 12 10 0 11 13 2 10
                                                   14 0 11 15 1 14 16 0 17 1 10
                                                   0 18 19 1 7 20 0 21 0 6 0 22
                                                   0 7 0 23 0 6 0 24 0 7 0 25 1
                                                   7 6 0 26 2 7 6 0 20 27 2 6
                                                   28 0 0 29 1 6 0 0 30 3 32 31
                                                   0 11 31 33 3 14 6 0 11 6 34
                                                   2 14 6 0 11 35 2 6 36 0 0 37
                                                   3 10 0 0 11 14 38 2 10 0 20
                                                   20 42 3 12 10 0 11 10 43 2 7
                                                   6 0 6 44 2 10 0 45 0 46 2 10
                                                   0 0 0 47 2 10 0 0 0 48 2 32
                                                   31 0 11 50 2 7 0 0 0 51 2 20
                                                   36 0 0 52 2 54 53 7 40 55 1
                                                   10 28 0 56 2 0 57 7 40 58 2
                                                   7 0 6 20 59 2 7 0 0 0 60 1 0
                                                   12 10 49 2 0 39 7 40 41 2 1
                                                   57 7 40 58)))))
           '|lookupComplete|)) 
