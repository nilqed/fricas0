
(SDEFUN |FFHOM;compare|
        ((|g| |SparseUnivariatePolynomial| GF)
         (|f| |SparseUnivariatePolynomial| GF) ($ |Boolean|))
        (SPROG
         ((|equal| (|Integer|)) (|g1| #1=(|PositiveInteger|)) (|f1| #1#)
          (|i| NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |f| (QREFELT $ 33))
                      (SPADCALL |g| (QREFELT $ 33)) (QREFELT $ 34))
            'T)
           ((< (SPADCALL |f| (QREFELT $ 33)) (SPADCALL |g| (QREFELT $ 33)))
            NIL)
           (#2='T
            (SEQ (LETT |equal| 0 . #3=(|FFHOM;compare|))
                 (SEQ (LETT |i| (SPADCALL |f| (QREFELT $ 33)) . #3#) G190
                      (COND ((OR (< |i| 0) (NULL (EQL |equal| 0))) (GO G191)))
                      (SEQ
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |f| |i| (QREFELT $ 39))
                                    (QREFELT $ 40)))
                         (COND
                          ((SPADCALL (SPADCALL |g| |i| (QREFELT $ 39))
                                     (QREFELT $ 40))
                           (EXIT (LETT |equal| 1 . #3#))))))
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL |g| |i| (QREFELT $ 39))
                                    (QREFELT $ 40)))
                         (COND
                          ((SPADCALL (SPADCALL |f| |i| (QREFELT $ 39))
                                     (QREFELT $ 40))
                           (EXIT (LETT |equal| -1 . #3#))))))
                       (LETT |f1|
                             (SPADCALL (SPADCALL |f| |i| (QREFELT $ 39))
                                       (QREFELT $ 41))
                             . #3#)
                       (LETT |g1|
                             (SPADCALL (SPADCALL |g| |i| (QREFELT $ 39))
                                       (QREFELT $ 41))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |f1| |g1| (QREFELT $ 42))
                          (LETT |equal| 1 . #3#))
                         ((< |f1| |g1|) (LETT |equal| -1 . #3#)))))
                      (LETT |i| (+ |i| -1) . #3#) (GO G190) G191 (EXIT NIL))
                 (EXIT (COND ((EQL |equal| 1) 'T) (#2# NIL))))))))) 

(SDEFUN |FFHOM;initialize| (($ |Void|))
        (SPROG
         ((|matbs| #1=(|Matrix| GF)) (#2=#:G733 NIL) (|matsb| #1#)
          (#3=#:G759 NIL) (|i| NIL) (|mat| #1#)
          (|arr| (|PrimitiveArray| (|SparseUnivariatePolynomial| GF)))
          (#4=#:G758 NIL) (#5=#:G757 NIL) (|rowind| (|Integer|))
          (|ra| (|Integer|)) (|iVec| (|Vector| (|Integer|)))
          (|a| #6=(|FiniteFieldExtensionByPolynomial| GF |dPbig|))
          (#7=#:G756 NIL) (|root| #6#)
          (|rTsmall|
           (|Union| #8="prime" #9="polynomial" #10="normal" #11="cyclic"))
          (|dPsmall| (|SparseUnivariatePolynomial| GF))
          (|rTbig| (|Union| #8# #9# #10# #11#))
          (|dPbig| (|SparseUnivariatePolynomial| GF))
          (|degbig| (|NonNegativeInteger|)) (|degsmall| (|NonNegativeInteger|))
          (#12=#:G755 NIL))
         (SEQ
          (COND
           ((SPADCALL (QREFELT $ 30) (QREFELT $ 32) (QREFELT $ 43))
            (SEQ
             (LETT |mat|
                   (SPADCALL (QREFELT $ 11) (QREFELT $ 11) (QREFELT $ 19))
                   . #13=(|FFHOM;initialize|))
             (LETT |arr| (SPADCALL (QREFELT $ 30) (QREFELT $ 46)) . #13#)
             (SEQ (LETT |i| 1 . #13#) (LETT #12# (QREFELT $ 11) . #13#) G190
                  (COND ((|greater_SI| |i| #12#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |mat| |i|
                              (SPADCALL (QAREF1 |arr| (- |i| 1)) (QREFELT $ 11)
                                        (QREFELT $ 48))
                              (QREFELT $ 50))))
                  (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (COND
               ((SPADCALL (QREFELT $ 24) (CONS 2 "normal") (QREFELT $ 51))
                (SEQ (SETELT $ 20 (SPADCALL |mat| (QREFELT $ 52)))
                     (SETELT $ 21
                             (SPADCALL
                              (PROG2
                                  (LETT #2# (SPADCALL |mat| (QREFELT $ 54))
                                        . #13#)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|Matrix| (QREFELT $ 7))
                                                (|Union|
                                                 (|Matrix| (QREFELT $ 7))
                                                 #14="failed")
                                                #2#))
                              (QREFELT $ 52)))
                     (SETELT $ 27 NIL) (EXIT (SPADCALL (QREFELT $ 56)))))
               (#15='T
                (SEQ (SETELT $ 21 (SPADCALL |mat| (QREFELT $ 52)))
                     (SETELT $ 20
                             (SPADCALL
                              (PROG2
                                  (LETT #2# (SPADCALL |mat| (QREFELT $ 54))
                                        . #13#)
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|Matrix| (QREFELT $ 7))
                                                (|Union|
                                                 (|Matrix| (QREFELT $ 7)) #14#)
                                                #2#))
                              (QREFELT $ 52)))
                     (SETELT $ 27 NIL) (EXIT (SPADCALL (QREFELT $ 56)))))))))
           (#15#
            (SEQ (LETT |dPbig| (QREFELT $ 32) . #13#)
                 (LETT |rTbig| (QREFELT $ 26) . #13#)
                 (LETT |dPsmall| (QREFELT $ 30) . #13#)
                 (LETT |rTsmall| (QREFELT $ 24) . #13#)
                 (LETT |degbig| (QREFELT $ 13) . #13#)
                 (LETT |degsmall| (QREFELT $ 11) . #13#)
                 (COND
                  ((|FFHOM;compare| (QREFELT $ 32) (QREFELT $ 30) $)
                   (SEQ (LETT |degsmall| (QREFELT $ 13) . #13#)
                        (LETT |degbig| (QREFELT $ 11) . #13#)
                        (LETT |dPbig| (QREFELT $ 30) . #13#)
                        (LETT |rTbig| (QREFELT $ 24) . #13#)
                        (LETT |dPsmall| (QREFELT $ 32) . #13#)
                        (EXIT (LETT |rTsmall| (QREFELT $ 26) . #13#)))))
                 (LETT |root|
                       (SPADCALL |dPsmall|
                                 (|compiledLookupCheck|
                                  '|rootOfIrreduciblePoly|
                                  (LIST
                                   (LIST '|FiniteFieldExtensionByPolynomial|
                                         (|devaluate| (ELT $ 7)) |dPbig|)
                                   (LIST '|SparseUnivariatePolynomial|
                                         (|devaluate| (ELT $ 7))))
                                  (|FiniteFieldPolynomialPackage2|
                                   (|FiniteFieldExtensionByPolynomial|
                                    (ELT $ 7) |dPbig|)
                                   (ELT $ 7))))
                       . #13#)
                 (LETT |matsb| (SPADCALL |degbig| |degsmall| (QREFELT $ 19))
                       . #13#)
                 (QSETAREF2O |matsb| 1 1 (|spadConstant| $ 36) 1 1)
                 (LETT |a| |root| . #13#)
                 (SEQ (LETT |i| 2 . #13#) (LETT #7# |degsmall| . #13#) G190
                      (COND ((|greater_SI| |i| #7#) (GO G191)))
                      (SEQ
                       (SPADCALL |matsb| |i|
                                 (SPADCALL |a|
                                           (|compiledLookupCheck|
                                            '|coordinates|
                                            (LIST
                                             (LIST '|Vector|
                                                   (|devaluate| (ELT $ 7)))
                                             '$)
                                            (|FiniteFieldExtensionByPolynomial|
                                             (ELT $ 7) |dPbig|)))
                                 (QREFELT $ 50))
                       (EXIT
                        (LETT |a|
                              (SPADCALL |a| |root|
                                        (|compiledLookupCheck| '*
                                                               (LIST '$ '$ '$)
                                                               (|FiniteFieldExtensionByPolynomial|
                                                                (ELT $ 7)
                                                                |dPbig|)))
                              . #13#)))
                      (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                      (EXIT NIL))
                 (LETT |ra| 1 . #13#)
                 (LETT |mat|
                       (SPADCALL (SPADCALL |matsb| 1 (QREFELT $ 57))
                                 (QREFELT $ 58))
                       . #13#)
                 (LETT |rowind| 2 . #13#)
                 (LETT |iVec| (MAKEARR1 |degsmall| 1) . #13#)
                 (SEQ G190 (COND ((NULL (< |ra| |degsmall|)) (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL
                          (SPADCALL
                           (SPADCALL |mat|
                                     (SPADCALL
                                      (SPADCALL |matsb| |rowind|
                                                (QREFELT $ 57))
                                      (QREFELT $ 58))
                                     (QREFELT $ 59))
                           (QREFELT $ 60))
                          |ra| (QREFELT $ 61))
                         (SEQ
                          (LETT |mat|
                                (SPADCALL |mat|
                                          (SPADCALL
                                           (SPADCALL |matsb| |rowind|
                                                     (QREFELT $ 57))
                                           (QREFELT $ 58))
                                          (QREFELT $ 59))
                                . #13#)
                          (LETT |ra| (+ |ra| 1) . #13#)
                          (EXIT
                           (SPADCALL |iVec| |ra| |rowind| (QREFELT $ 63))))))
                       (EXIT (LETT |rowind| (+ |rowind| 1) . #13#)))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |mat|
                       (PROG2 (LETT #2# (SPADCALL |mat| (QREFELT $ 54)) . #13#)
                           (QCDR #2#)
                         (|check_union2| (QEQCAR #2# 0)
                                         (|Matrix| (QREFELT $ 7))
                                         (|Union| (|Matrix| (QREFELT $ 7))
                                                  #14#)
                                         #2#))
                       . #13#)
                 (LETT |matbs| (SPADCALL |degsmall| |degbig| (QREFELT $ 19))
                       . #13#)
                 (SEQ (LETT |i| 1 . #13#) (LETT #5# |degsmall| . #13#) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |matbs| (SPADCALL |iVec| |i| (QREFELT $ 64))
                                  (SPADCALL |mat| |i| (QREFELT $ 65))
                                  (QREFELT $ 50))))
                      (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                      (EXIT NIL))
                 (COND
                  ((SPADCALL |rTbig| (CONS 2 "normal") (QREFELT $ 51))
                   (SEQ (LETT |arr| (SPADCALL |dPbig| (QREFELT $ 46)) . #13#)
                        (LETT |mat| (SPADCALL |degbig| |degbig| (QREFELT $ 19))
                              . #13#)
                        (SEQ (LETT |i| 1 . #13#) (LETT #4# |degbig| . #13#)
                             G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |mat| |i|
                                         (SPADCALL (QAREF1 |arr| (- |i| 1))
                                                   |degbig| (QREFELT $ 48))
                                         (QREFELT $ 50))))
                             (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |matsb|
                              (SPADCALL
                               (PROG2
                                   (LETT #2# (SPADCALL |mat| (QREFELT $ 54))
                                         . #13#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Matrix| (QREFELT $ 7))
                                                 (|Union|
                                                  (|Matrix| (QREFELT $ 7))
                                                  #14#)
                                                 #2#))
                               |matsb| (QREFELT $ 66))
                              . #13#)
                        (EXIT
                         (LETT |matbs| (SPADCALL |matbs| |mat| (QREFELT $ 66))
                               . #13#)))))
                 (COND
                  ((SPADCALL |rTsmall| (CONS 2 "normal") (QREFELT $ 51))
                   (SEQ (LETT |arr| (SPADCALL |dPsmall| (QREFELT $ 46)) . #13#)
                        (LETT |mat|
                              (SPADCALL |degsmall| |degsmall| (QREFELT $ 19))
                              . #13#)
                        (SEQ (LETT |i| 1 . #13#) (LETT #3# |degsmall| . #13#)
                             G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |mat| |i|
                                         (SPADCALL (QAREF1 |arr| (- |i| 1))
                                                   |degsmall| (QREFELT $ 48))
                                         (QREFELT $ 50))))
                             (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |matsb| (SPADCALL |matsb| |mat| (QREFELT $ 66))
                              . #13#)
                        (EXIT
                         (LETT |matbs|
                               (SPADCALL
                                (PROG2
                                    (LETT #2# (SPADCALL |mat| (QREFELT $ 54))
                                          . #13#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0)
                                                  (|Matrix| (QREFELT $ 7))
                                                  (|Union|
                                                   (|Matrix| (QREFELT $ 7))
                                                   #14#)
                                                  #2#))
                                |matbs| (QREFELT $ 66))
                               . #13#)))))
                 (EXIT
                  (COND
                   ((SPADCALL |dPbig| (QREFELT $ 32) (QREFELT $ 43))
                    (SEQ (SETELT $ 20 |matsb|) (SETELT $ 21 |matbs|)
                         (SETELT $ 27 NIL) (EXIT (SPADCALL (QREFELT $ 56)))))
                   (#15#
                    (SEQ (SETELT $ 20 |matbs|) (SETELT $ 21 |matsb|)
                         (SETELT $ 27 NIL)
                         (EXIT (SPADCALL (QREFELT $ 56))))))))))))) 

(SDEFUN |FFHOM;coerce;F1F2;3| ((|x| F1) ($ F2))
        (COND
         ((SPADCALL |x| (QREFELT $ 67))
          (SPADCALL (SPADCALL |x| (QREFELT $ 68)) (QREFELT $ 69)))
         ((SPADCALL (QREFELT $ 30) (QREFELT $ 32) (QREFELT $ 43))
          (|FFHOM;convertWRTsameDefPol12| |x| $))
         ('T (|FFHOM;convertWRTdifferentDefPol12| |x| $)))) 

(SDEFUN |FFHOM;convertWRTsameDefPol12| ((|x| F1) ($ F2))
        (SEQ
         (COND ((SPADCALL (QREFELT $ 24) (QREFELT $ 26) (QREFELT $ 51)) |x|)
               ((SPADCALL (QREFELT $ 24) (CONS 3 "cyclic") (QREFELT $ 51))
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 37) (QREFELT $ 71))
                  (|spadConstant| $ 72))
                 (#1='T
                  (SPADCALL (SPADCALL (QREFELT $ 73)) |x| (QREFELT $ 74)))))
               ((SPADCALL (QREFELT $ 26) (CONS 3 "cyclic") (QREFELT $ 51))
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 37) (QREFELT $ 71))
                  (|spadConstant| $ 72))
                 (#1# (SPADCALL |x| (QREFELT $ 75)))))
               (#1#
                (SEQ (COND ((QREFELT $ 27) (|FFHOM;initialize| $)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (QREFELT $ 20) (SPADCALL |x| (QREFELT $ 76))
                                 (QREFELT $ 77))
                       (QREFELT $ 78)))))))) 

(SDEFUN |FFHOM;convertWRTdifferentDefPol12| ((|x| F1) ($ F2))
        (SEQ (COND ((QREFELT $ 27) (|FFHOM;initialize| $)))
             (COND
              ((SPADCALL (QREFELT $ 11) (QREFELT $ 13) (QREFELT $ 34))
               (COND
                ((SPADCALL
                  (SPADCALL (QREFELT $ 13) (SPADCALL |x| (QREFELT $ 81))
                            (QREFELT $ 82))
                  0 (QREFELT $ 83))
                 (|error|
                  "coerce: element doesn't belong to smaller field")))))
             (EXIT
              (SPADCALL
               (SPADCALL (QREFELT $ 20) (SPADCALL |x| (QREFELT $ 76))
                         (QREFELT $ 77))
               (QREFELT $ 78))))) 

(SDEFUN |FFHOM;coerce;F2F1;6| ((|x| F2) ($ F1))
        (COND
         ((SPADCALL |x| (QREFELT $ 84))
          (SPADCALL (SPADCALL |x| (QREFELT $ 85)) (QREFELT $ 86)))
         ((SPADCALL (QREFELT $ 30) (QREFELT $ 32) (QREFELT $ 43))
          (|FFHOM;convertWRTsameDefPol21| |x| $))
         ('T (|FFHOM;convertWRTdifferentDefPol21| |x| $)))) 

(SDEFUN |FFHOM;convertWRTsameDefPol21| ((|x| F2) ($ F1))
        (SEQ
         (COND ((SPADCALL (QREFELT $ 24) (QREFELT $ 26) (QREFELT $ 51)) |x|)
               ((SPADCALL (QREFELT $ 26) (CONS 3 "cyclic") (QREFELT $ 51))
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 72) (QREFELT $ 88))
                  (|spadConstant| $ 37))
                 (#1='T
                  (SPADCALL (SPADCALL (QREFELT $ 89)) |x| (QREFELT $ 90)))))
               ((SPADCALL (QREFELT $ 24) (CONS 3 "cyclic") (QREFELT $ 51))
                (COND
                 ((SPADCALL |x| (|spadConstant| $ 72) (QREFELT $ 88))
                  (|spadConstant| $ 37))
                 (#1# (SPADCALL |x| (QREFELT $ 91)))))
               (#1#
                (SEQ (COND ((QREFELT $ 27) (|FFHOM;initialize| $)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (QREFELT $ 21) (SPADCALL |x| (QREFELT $ 92))
                                 (QREFELT $ 77))
                       (QREFELT $ 93)))))))) 

(SDEFUN |FFHOM;convertWRTdifferentDefPol21| ((|x| F2) ($ F1))
        (SEQ (COND ((QREFELT $ 27) (|FFHOM;initialize| $)))
             (COND
              ((SPADCALL (QREFELT $ 13) (QREFELT $ 11) (QREFELT $ 34))
               (COND
                ((SPADCALL
                  (SPADCALL (QREFELT $ 11) (SPADCALL |x| (QREFELT $ 95))
                            (QREFELT $ 82))
                  0 (QREFELT $ 83))
                 (|error|
                  "coerce: element doesn't belong to smaller field")))))
             (EXIT
              (SPADCALL
               (SPADCALL (QREFELT $ 21) (SPADCALL |x| (QREFELT $ 92))
                         (QREFELT $ 77))
               (QREFELT $ 93))))) 

(DECLAIM (NOTINLINE |FiniteFieldHomomorphisms;|)) 

(DEFUN |FiniteFieldHomomorphisms| (&REST #1=#:G779)
  (SPROG NIL
         (PROG (#2=#:G780)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldHomomorphisms|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldHomomorphisms|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldHomomorphisms;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldHomomorphisms|)))))))))) 

(DEFUN |FiniteFieldHomomorphisms;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteFieldHomomorphisms|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|FiniteFieldHomomorphisms| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 96) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteFieldHomomorphisms|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
          (QSETREFV $ 17
                    (SPADCALL
                     (REM (MAX (QREFELT $ 11) (QREFELT $ 13))
                          (MIN (QREFELT $ 11) (QREFELT $ 13)))
                     0 (QREFELT $ 16)))
          (COND
           ((QREFELT $ 17)
            (|error| "FFHOM: one extension degree must divide the other one")))
          (QSETREFV $ 20
                    (SPADCALL (QREFELT $ 13) (QREFELT $ 11) (QREFELT $ 19)))
          (QSETREFV $ 21
                    (SPADCALL (QREFELT $ 11) (QREFELT $ 13) (QREFELT $ 19)))
          (QSETREFV $ 24 (SPADCALL (QREFELT $ 23)))
          (QSETREFV $ 26 (SPADCALL (QREFELT $ 25)))
          (QSETREFV $ 27 'T)
          (QSETREFV $ 30 (SPADCALL (QREFELT $ 29)))
          (QSETREFV $ 32 (SPADCALL (QREFELT $ 31)))
          $))) 

(MAKEPROP '|FiniteFieldHomomorphisms| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |extensionDegree|)
              '|degree1| (4 . |extensionDegree|) '|degree2| (|Boolean|)
              (|NonNegativeInteger|) (8 . ~=) '#:G690 (|Matrix| 7)
              (14 . |zero|) '|conMat1to2| '|conMat2to1|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (20 . |representationType|) '|repType1|
              (24 . |representationType|) '|repType2| '|init?|
              (|SparseUnivariatePolynomial| 7) (28 . |definingPolynomial|)
              '|defPol1| (32 . |definingPolynomial|) '|defPol2| (36 . |degree|)
              (41 . >) (47 . |One|) (51 . |One|) (55 . |Zero|) (59 . |Zero|)
              (63 . |coefficient|) (69 . |zero?|) (74 . |lookup|) (79 . >)
              (85 . =) (|PrimitiveArray| 28) (|FiniteFieldPolynomialPackage| 7)
              (91 . |reducedQPowers|) (|Vector| 7) (96 . |vectorise|)
              (|Integer|) (102 . |setColumn!|) (109 . =) (115 . |copy|)
              (|Union| $ '"failed") (120 . |inverse|) (|Void|) (125 . |void|)
              (129 . |row|) (135 . |transpose|) (140 . |vertConcat|)
              (146 . |rank|) (151 . >) (|Vector| 49) (157 . |setelt!|)
              (164 . |elt|) (170 . |column|) (176 . *) (182 . |inGroundField?|)
              (187 . |retract|) (192 . |coerce|) |FFHOM;coerce;F1F2;3|
              (197 . =) (203 . |Zero|) (207 . |primitiveElement|) (211 . ^)
              (217 . |discreteLog|) (222 . |coordinates|) (227 . *)
              (233 . |represents|) (|OnePointCompletion| 9) (238 . |degree|)
              (243 . |degree|) (248 . |positiveRemainder|) (254 . ~=)
              (260 . |inGroundField?|) (265 . |retract|) (270 . |coerce|)
              |FFHOM;coerce;F2F1;6| (275 . =) (281 . |primitiveElement|)
              (285 . ^) (291 . |discreteLog|) (296 . |coordinates|)
              (301 . |represents|) (306 . |degree|) (311 . |degree|))
           '#(|coerce| 316) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 95
                                                 '(0 6 9 10 0 8 9 12 2 15 14 0
                                                   0 16 2 18 0 15 15 19 0 6 22
                                                   23 0 8 22 25 0 6 28 29 0 8
                                                   28 31 1 28 15 0 33 2 15 14 0
                                                   0 34 0 6 0 35 0 7 0 36 0 6 0
                                                   37 0 7 0 38 2 28 7 0 15 39 1
                                                   7 14 0 40 1 7 9 0 41 2 9 14
                                                   0 0 42 2 28 14 0 0 43 1 45
                                                   44 28 46 2 28 47 0 15 48 3
                                                   18 0 0 49 47 50 2 22 14 0 0
                                                   51 1 18 0 0 52 1 18 53 0 54
                                                   0 55 0 56 2 18 47 0 49 57 1
                                                   18 0 47 58 2 18 0 0 0 59 1
                                                   18 15 0 60 2 49 14 0 0 61 3
                                                   62 49 0 49 49 63 2 62 49 0
                                                   49 64 2 18 47 0 49 65 2 18 0
                                                   0 0 66 1 6 14 0 67 1 6 7 0
                                                   68 1 8 0 7 69 2 6 14 0 0 71
                                                   0 8 0 72 0 8 0 73 2 8 0 0 49
                                                   74 1 6 15 0 75 1 6 47 0 76 2
                                                   18 47 0 47 77 1 8 0 47 78 1
                                                   6 79 0 80 1 6 9 0 81 2 49 0
                                                   0 0 82 2 49 14 0 0 83 1 8 14
                                                   0 84 1 8 7 0 85 1 6 0 7 86 2
                                                   8 14 0 0 88 0 6 0 89 2 6 0 0
                                                   49 90 1 8 15 0 91 1 8 47 0
                                                   92 1 6 0 47 93 1 8 79 0 94 1
                                                   8 9 0 95 1 0 6 8 87 1 0 8 6
                                                   70)))))
           '|lookupComplete|)) 
