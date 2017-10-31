
(SDEFUN |FAXF-;represents;VS;1| ((|v| |Vector| F) ($ S))
        (SPROG ((|a| (S)) (#1=#:G722 NIL) (|i| NIL) (|b| (|Vector| S)))
               (SEQ
                (LETT |a| (|spadConstant| $ 8) . #2=(|FAXF-;represents;VS;1|))
                (LETT |b| (SPADCALL (QREFELT $ 10)) . #2#)
                (SEQ (LETT |i| 1 . #2#)
                     (LETT #1# (SPADCALL (QREFELT $ 12)) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL
                                        (SPADCALL |v| |i| (QREFELT $ 15))
                                        (SPADCALL |b| |i| (QREFELT $ 17))
                                        (QREFELT $ 18))
                                       (QREFELT $ 19))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))) 

(PUT '|FAXF-;transcendenceDegree;Nni;2| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |FAXF-;transcendenceDegree;Nni;2| (($ |NonNegativeInteger|)) 0) 

(SDEFUN |FAXF-;dimension;Cn;3| (($ |CardinalNumber|))
        (SPADCALL (QVSIZE (SPADCALL (QREFELT $ 10))) (QREFELT $ 24))) 

(SDEFUN |FAXF-;extensionDegree;Opc;4|
        (($ |OnePointCompletion| (|PositiveInteger|)))
        (SPROG ((#1=#:G727 NIL))
               (SPADCALL
                (PROG1
                    (LETT #1# (QVSIZE (SPADCALL (QREFELT $ 10)))
                          |FAXF-;extensionDegree;Opc;4|)
                  (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #1#))
                (QREFELT $ 27)))) 

(SDEFUN |FAXF-;degree;SOpc;5|
        ((|a| S) ($ |OnePointCompletion| (|PositiveInteger|)))
        (SPADCALL (SPADCALL |a| (QREFELT $ 29)) (QREFELT $ 27))) 

(SDEFUN |FAXF-;coordinates;VM;6| ((|v| |Vector| S) ($ |Matrix| F))
        (SPROG ((#1=#:G733 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| F)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (SPADCALL (QREFELT $ 12))
                                    (|spadConstant| $ 31))
                      . #2=(|FAXF-;coordinates;VM;6|))
                (SEQ (LETT |j| 1 . #2#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 32)) . #2#)
                     (LETT #1# (QVSIZE |v|) . #2#) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 33))
                                 (QREFELT $ 35))))
                     (LETT |i|
                           (PROG1 (+ |i| 1) (LETT |j| (|inc_SI| |j|) . #2#))
                           . #2#)
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(PUT '|FAXF-;algebraic?;SB;7| '|SPADreplace| '(XLAM (|a|) 'T)) 

(SDEFUN |FAXF-;algebraic?;SB;7| ((|a| S) ($ |Boolean|)) 'T) 

(PUT '|FAXF-;transcendent?;SB;8| '|SPADreplace| '(XLAM (|a|) NIL)) 

(SDEFUN |FAXF-;transcendent?;SB;8| ((|a| S) ($ |Boolean|)) NIL) 

(SDEFUN |FAXF-;extensionDegree;Pi;9| (($ |PositiveInteger|))
        (SPROG ((#1=#:G736 NIL))
               (PROG1
                   (LETT #1# (QVSIZE (SPADCALL (QREFELT $ 10)))
                         |FAXF-;extensionDegree;Pi;9|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |FAXF-;trace;SF;10| ((|a| S) ($ F))
        (SPROG ((|abs| (F)) (#1=#:G741 NIL) (|i| NIL) (|b| (|Vector| S)))
               (SEQ
                (LETT |b| (SPADCALL (QREFELT $ 10)) . #2=(|FAXF-;trace;SF;10|))
                (LETT |abs| (|spadConstant| $ 31) . #2#)
                (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |b|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |abs|
                             (SPADCALL |abs|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |a|
                                                   (SPADCALL |b| |i|
                                                             (QREFELT $ 17))
                                                   (QREFELT $ 41))
                                         (QREFELT $ 33))
                                        |i| (QREFELT $ 15))
                                       (QREFELT $ 42))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |abs|)))) 

(SDEFUN |FAXF-;norm;SF;11| ((|a| S) ($ F))
        (SPROG
         ((#1=#:G745 NIL) (|i| NIL) (|m| (|Matrix| F)) (|b| (|Vector| S)))
         (SEQ (LETT |b| (SPADCALL (QREFELT $ 10)) . #2=(|FAXF-;norm;SF;11|))
              (LETT |m|
                    (MAKE_MATRIX1 (QVSIZE |b|) (QVSIZE |b|)
                                  (|spadConstant| $ 31))
                    . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |b|) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |m| |i|
                               (SPADCALL
                                (SPADCALL |a| (SPADCALL |b| |i| (QREFELT $ 17))
                                          (QREFELT $ 41))
                                (QREFELT $ 33))
                               (QREFELT $ 35))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |m| (QREFELT $ 44)))))) 

(SDEFUN |FAXF-;linearAssociatedExp;SSupS;12|
        ((|x| S) (|f| |SparseUnivariatePolynomial| F) ($ S))
        (SPROG ((|y| (S)) (|erg| (S)) (#1=#:G751 NIL) (|i| NIL))
               (SEQ
                (LETT |erg| (|spadConstant| $ 8)
                      . #2=(|FAXF-;linearAssociatedExp;SSupS;12|))
                (LETT |y| |x| . #2#)
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (SPADCALL |f| (QREFELT $ 47)) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |erg|
                            (SPADCALL |erg|
                                      (SPADCALL
                                       (SPADCALL |f| |i| (QREFELT $ 48)) |y|
                                       (QREFELT $ 18))
                                      (QREFELT $ 19))
                            . #2#)
                      (EXIT (LETT |y| (SPADCALL |y| (QREFELT $ 49)) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |erg|)))) 

(SDEFUN |FAXF-;linearAssociatedLog;2SU;13|
        ((|b| S) (|x| S) ($ |Union| (|SparseUnivariatePolynomial| F) "failed"))
        (SPROG
         ((|p| #1=(|SparseUnivariatePolynomial| F)) (#2=#:G773 NIL)
          (#3=#:G772 #1#) (#4=#:G774 #1#) (#5=#:G783 NIL) (|i| NIL)
          (|rown| (|Integer|)) (#6=#:G782 NIL) (|v| (|Vector| F))
          (|m1| (|Matrix| F)) (|l| (|List| (|List| F))) (|a| (S))
          (#7=#:G781 NIL) (|extdeg| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 51))
            (CONS 0 (|spadConstant| $ 52)))
           (#8='T
            (SEQ
             (LETT |l|
                   (LIST
                    (SPADCALL (SPADCALL |b| (QREFELT $ 33)) (QREFELT $ 54)))
                   . #9=(|FAXF-;linearAssociatedLog;2SU;13|))
             (LETT |a| |b| . #9#)
             (LETT |extdeg| (SPADCALL (QREFELT $ 12)) . #9#)
             (SEQ (LETT |i| 2 . #9#) (LETT #7# |extdeg| . #9#) G190
                  (COND ((|greater_SI| |i| #7#) (GO G191)))
                  (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 49)) . #9#)
                       (EXIT
                        (LETT |l|
                              (SPADCALL |l|
                                        (SPADCALL (SPADCALL |a| (QREFELT $ 33))
                                                  (QREFELT $ 54))
                                        (QREFELT $ 56))
                              . #9#)))
                  (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
             (LETT |l|
                   (SPADCALL |l|
                             (SPADCALL (SPADCALL |x| (QREFELT $ 33))
                                       (QREFELT $ 54))
                             (QREFELT $ 56))
                   . #9#)
             (LETT |m1|
                   (SPADCALL
                    (SPADCALL (SPADCALL |l| (QREFELT $ 57)) (QREFELT $ 58))
                    (QREFELT $ 59))
                   . #9#)
             (LETT |v| (SPADCALL |extdeg| (QREFELT $ 60)) . #9#)
             (LETT |rown| 1 . #9#)
             (SEQ (LETT |i| 1 . #9#) (LETT #6# |extdeg| . #9#) G190
                  (COND ((|greater_SI| |i| #6#) (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL (QAREF2O |m1| |rown| |i| 1 1)
                                (|spadConstant| $ 61) (QREFELT $ 62))
                      (SEQ
                       (SPADCALL |v| |i|
                                 (QAREF2O |m1| |rown| (+ |extdeg| 1) 1 1)
                                 (QREFELT $ 64))
                       (EXIT (LETT |rown| (+ |rown| 1) . #9#)))))))
                  (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
             (LETT |p|
                   (PROGN
                    (LETT #2# NIL . #9#)
                    (SEQ (LETT |i| 0 . #9#) (LETT #5# (- (QVSIZE |v|) 1) . #9#)
                         G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #4#
                                  (SPADCALL
                                   (SPADCALL |v| (+ |i| 1) (QREFELT $ 15)) |i|
                                   (QREFELT $ 65))
                                  . #9#)
                            (COND
                             (#2#
                              (LETT #3# (SPADCALL #3# #4# (QREFELT $ 66))
                                    . #9#))
                             ('T
                              (PROGN
                               (LETT #3# #4# . #9#)
                               (LETT #2# 'T . #9#)))))))
                         (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191
                         (EXIT NIL))
                    (COND (#2# #3#) (#8# (|spadConstant| $ 52))))
                   . #9#)
             (EXIT
              (COND
               ((SPADCALL |p| (|spadConstant| $ 52) (QREFELT $ 67))
                (SEQ
                 (SPADCALL
                  "linearAssociatedLog: second argument not in                       group generated by first argument"
                  (QREFELT $ 71))
                 (EXIT (CONS 1 "failed"))))
               (#8# (CONS 0 |p|)))))))))) 

(SDEFUN |FAXF-;linearAssociatedLog;SSup;14|
        ((|x| S) ($ |SparseUnivariatePolynomial| F))
        (SPROG ((#1=#:G785 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL (SPADCALL (QREFELT $ 74)) |x|
                                   (QREFELT $ 75))
                         |FAXF-;linearAssociatedLog;SSup;14|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                 (|Union|
                                  (|SparseUnivariatePolynomial| (QREFELT $ 7))
                                  "failed")
                                 #1#)))) 

(SDEFUN |FAXF-;linearAssociatedOrder;SSup;15|
        ((|x| S) ($ |SparseUnivariatePolynomial| F))
        (SPROG
         ((#1=#:G791 NIL) (#2=#:G790 #3=(|SparseUnivariatePolynomial| F))
          (#4=#:G792 #3#) (#5=#:G796 NIL) (|i| NIL) (|v| (|Vector| F))
          (|l| (|List| (|List| F))) (|a| (S)) (#6=#:G795 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (|spadConstant| $ 8) (QREFELT $ 51))
            (|spadConstant| $ 52))
           (#7='T
            (SEQ
             (LETT |l|
                   (LIST
                    (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (QREFELT $ 54)))
                   . #8=(|FAXF-;linearAssociatedOrder;SSup;15|))
             (LETT |a| |x| . #8#)
             (SEQ (LETT |i| 1 . #8#) (LETT #6# (SPADCALL (QREFELT $ 12)) . #8#)
                  G190 (COND ((|greater_SI| |i| #6#) (GO G191)))
                  (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 49)) . #8#)
                       (EXIT
                        (LETT |l|
                              (SPADCALL |l|
                                        (SPADCALL (SPADCALL |a| (QREFELT $ 33))
                                                  (QREFELT $ 54))
                                        (QREFELT $ 56))
                              . #8#)))
                  (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
             (LETT |v|
                   (|SPADfirst|
                    (SPADCALL
                     (SPADCALL (SPADCALL |l| (QREFELT $ 57)) (QREFELT $ 58))
                     (QREFELT $ 78)))
                   . #8#)
             (EXIT
              (PROGN
               (LETT #1# NIL . #8#)
               (SEQ (LETT |i| 0 . #8#) (LETT #5# (- (QVSIZE |v|) 1) . #8#) G190
                    (COND ((|greater_SI| |i| #5#) (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #4#
                             (SPADCALL (SPADCALL |v| (+ |i| 1) (QREFELT $ 15))
                                       |i| (QREFELT $ 65))
                             . #8#)
                       (COND
                        (#1#
                         (LETT #2# (SPADCALL #2# #4# (QREFELT $ 66)) . #8#))
                        ('T
                         (PROGN (LETT #2# #4# . #8#) (LETT #1# 'T . #8#)))))))
                    (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
               (COND (#1# #2#) (#7# (|spadConstant| $ 52))))))))))) 

(SDEFUN |FAXF-;charthRoot;SU;16| ((|x| S) ($ |Union| S "failed"))
        (CONS 0 (SPADCALL |x| (QREFELT $ 80)))) 

(SDEFUN |FAXF-;minimalPolynomial;SPiSup;17|
        ((|a| S) (|n| |PositiveInteger|) ($ |SparseUnivariatePolynomial| S))
        (SPROG ((|u| (S)) (|f| (|SparseUnivariatePolynomial| S)))
               (SEQ
                (COND
                 ((SPADCALL (REM (SPADCALL (QREFELT $ 12)) |n|) 0
                            (QREFELT $ 83))
                  (|error|
                   "minimalPolynomial: 2. argument must divide extension degree"))
                 ('T
                  (SEQ
                   (LETT |f|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 63) 1 (QREFELT $ 85))
                          (SPADCALL |a| 0 (QREFELT $ 85)) (QREFELT $ 86))
                         . #1=(|FAXF-;minimalPolynomial;SPiSup;17|))
                   (LETT |u| (SPADCALL |a| |n| (QREFELT $ 87)) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL (NULL (SPADCALL |u| |a| (QREFELT $ 51))))
                          (GO G191)))
                        (SEQ
                         (LETT |f|
                               (SPADCALL |f|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| $ 63) 1
                                                    (QREFELT $ 85))
                                          (SPADCALL |u| 0 (QREFELT $ 85))
                                          (QREFELT $ 86))
                                         (QREFELT $ 88))
                               . #1#)
                         (EXIT
                          (LETT |u| (SPADCALL |u| |n| (QREFELT $ 87)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |f|))))))) 

(SDEFUN |FAXF-;norm;SPiS;18| ((|e| S) (|s| |PositiveInteger|) ($ S))
        (SPROG
         ((#1=#:G811 NIL) (|pow| (|Integer|))
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |qr| (DIVIDE2 (SPADCALL (QREFELT $ 12)) |s|)
                . #2=(|FAXF-;norm;SPiS;18|))
          (EXIT
           (COND
            ((ZEROP (QCDR |qr|))
             (SEQ
              (LETT |pow|
                    (QUOTIENT2 (- (SPADCALL (QREFELT $ 92)) 1)
                               (-
                                (SPADCALL (SPADCALL (QREFELT $ 93)) |s|
                                          (QREFELT $ 94))
                                1))
                    . #2#)
              (EXIT
               (SPADCALL |e|
                         (PROG1 (LETT #1# |pow| . #2#)
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT $ 95)))))
            ('T
             (|error|
              "norm: second argument must divide degree of extension"))))))) 

(SDEFUN |FAXF-;trace;SPiS;19| ((|e| S) (|s| |PositiveInteger|) ($ S))
        (SPROG
         ((|a| (S)) (#1=#:G820 NIL) (|i| NIL) (|q| (|NonNegativeInteger|))
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |qr| (DIVIDE2 (SPADCALL (QREFELT $ 12)) |s|)
                . #2=(|FAXF-;trace;SPiS;19|))
          (LETT |q| (SPADCALL (QREFELT $ 93)) . #2#)
          (EXIT
           (COND
            ((ZEROP (QCDR |qr|))
             (SEQ (LETT |a| (|spadConstant| $ 8) . #2#)
                  (SEQ (LETT |i| 0 . #2#) (LETT #1# (- (QCAR |qr|) 1) . #2#)
                       G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |a|
                               (SPADCALL |a|
                                         (SPADCALL |e|
                                                   (EXPT |q|
                                                         (SPADCALL |s| |i|
                                                                   (QREFELT $
                                                                            97)))
                                                   (QREFELT $ 95))
                                         (QREFELT $ 19))
                               . #2#)))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |a|)))
            ('T
             (|error|
              "trace: second argument must divide degree of extension"))))))) 

(SDEFUN |FAXF-;size;Nni;20| (($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL (QREFELT $ 93)) (SPADCALL (QREFELT $ 12))
                  (QREFELT $ 94))) 

(SDEFUN |FAXF-;createNormalElement;S;21| (($ S))
        (SPROG
         ((#1=#:G829 NIL) (#2=#:G830 NIL) (|res| (S)) (#3=#:G823 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (COND
            ((EQL (SPADCALL (QREFELT $ 100)) (SPADCALL (QREFELT $ 92)))
             (|spadConstant| $ 63))
            ('T
             (SEQ
              (SEQ (LETT |i| 1 . #4=(|FAXF-;createNormalElement;S;21|)) G190
                   NIL
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |res|
                            (SPADCALL
                             (PROG1 (LETT #3# |i| . #4#)
                               (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                                 '(|NonNegativeInteger|) #3#))
                             (QREFELT $ 101))
                            . #4#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |res| (QREFELT $ 102)))
                         (PROGN
                          (LETT #1#
                                (COND
                                 ((SPADCALL |res| (QREFELT $ 103))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN
                                          (LETT #2# |res| . #4#)
                                          (GO #5=#:G828))
                                         . #4#)
                                   (GO #6=#:G825))))
                                . #4#)
                          (GO #6#)))))))
                    #6# (EXIT #1#))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))))
          #5# (EXIT #2#)))) 

(SDEFUN |FAXF-;normal?;SB;22| ((|x| S) ($ |Boolean|))
        (SPROG
         ((|f| #1=(|SparseUnivariatePolynomial| S)) (#2=#:G832 NIL)
          (#3=#:G831 #1#) (#4=#:G833 #1#) (#5=#:G836 NIL) (|i| NIL)
          (|p| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (LETT |p|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 63) (SPADCALL (QREFELT $ 12))
                           (QREFELT $ 85))
                 (SPADCALL (|spadConstant| $ 63) 0 (QREFELT $ 85))
                 (QREFELT $ 86))
                . #6=(|FAXF-;normal?;SB;22|))
          (LETT |f|
                (PROGN
                 (LETT #2# NIL . #6#)
                 (SEQ (LETT |i| 0 . #6#)
                      (LETT #5# (- (SPADCALL (QREFELT $ 12)) 1) . #6#) G190
                      (COND ((|greater_SI| |i| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL (SPADCALL |x| |i| (QREFELT $ 87)) |i|
                                         (QREFELT $ 85))
                               . #6#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 105)) . #6#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #6#)
                            (LETT #2# 'T . #6#)))))))
                      (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                      (EXIT NIL))
                 (COND (#2# #3#) (#7='T (|spadConstant| $ 106))))
                . #6#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |p| |f| (QREFELT $ 107))
                       (|spadConstant| $ 108) (QREFELT $ 109))
             'T)
            (#7# NIL)))))) 

(SDEFUN |FAXF-;degree;SPi;23| ((|a| S) ($ |PositiveInteger|))
        (SPROG ((|deg| (|PositiveInteger|)) (|y| (S)))
               (SEQ
                (LETT |y| (SPADCALL |a| (QREFELT $ 49))
                      . #1=(|FAXF-;degree;SPi;23|))
                (LETT |deg| 1 . #1#)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |y| |a| (QREFELT $ 111))) (GO G191)))
                     (SEQ (LETT |y| (SPADCALL |y| (QREFELT $ 49)) . #1#)
                          (EXIT (LETT |deg| (+ |deg| 1) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |deg|)))) 

(DECLAIM (NOTINLINE |FiniteAlgebraicExtensionField&;|)) 

(DEFUN |FiniteAlgebraicExtensionField&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|FiniteAlgebraicExtensionField&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FiniteAlgebraicExtensionField&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 113) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Finite|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 50
                       (CONS
                        (|dispatchFunction|
                         |FAXF-;linearAssociatedExp;SSupS;12|)
                        $))
             (QSETREFV $ 73
                       (CONS
                        (|dispatchFunction| |FAXF-;linearAssociatedLog;2SU;13|)
                        $))
             (QSETREFV $ 76
                       (CONS
                        (|dispatchFunction|
                         |FAXF-;linearAssociatedLog;SSup;14|)
                        $))
             (QSETREFV $ 79
                       (CONS
                        (|dispatchFunction|
                         |FAXF-;linearAssociatedOrder;SSup;15|)
                        $))
             (QSETREFV $ 82
                       (CONS (|dispatchFunction| |FAXF-;charthRoot;SU;16|) $))
             (QSETREFV $ 90
                       (CONS
                        (|dispatchFunction|
                         |FAXF-;minimalPolynomial;SPiSup;17|)
                        $))
             (QSETREFV $ 96 (CONS (|dispatchFunction| |FAXF-;norm;SPiS;18|) $))
             (QSETREFV $ 98
                       (CONS (|dispatchFunction| |FAXF-;trace;SPiS;19|) $))
             (QSETREFV $ 99 (CONS (|dispatchFunction| |FAXF-;size;Nni;20|) $))
             (QSETREFV $ 104
                       (CONS
                        (|dispatchFunction| |FAXF-;createNormalElement;S;21|)
                        $))
             (QSETREFV $ 110
                       (CONS (|dispatchFunction| |FAXF-;normal?;SB;22|) $))
             (QSETREFV $ 112
                       (CONS (|dispatchFunction| |FAXF-;degree;SPi;23|) $)))))
          $))) 

(MAKEPROP '|FiniteAlgebraicExtensionField&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (|Vector| $) (4 . |basis|) (|PositiveInteger|)
              (8 . |extensionDegree|) (|Integer|) (|Vector| 7) (12 . |elt|)
              (|Vector| 6) (18 . |elt|) (24 . *) (30 . +)
              |FAXF-;represents;VS;1| (|NonNegativeInteger|)
              |FAXF-;transcendenceDegree;Nni;2| (|CardinalNumber|)
              (36 . |coerce|) |FAXF-;dimension;Cn;3| (|OnePointCompletion| 11)
              (41 . |coerce|) |FAXF-;extensionDegree;Opc;4| (46 . |degree|)
              |FAXF-;degree;SOpc;5| (51 . |Zero|) (55 . |minIndex|)
              (60 . |coordinates|) (|Matrix| 7) (65 . |setRow!|)
              |FAXF-;coordinates;VM;6| (|Boolean|) |FAXF-;algebraic?;SB;7|
              |FAXF-;transcendent?;SB;8| |FAXF-;extensionDegree;Pi;9| (72 . *)
              (78 . +) |FAXF-;trace;SF;10| (84 . |determinant|)
              |FAXF-;norm;SF;11| (|SparseUnivariatePolynomial| 7)
              (89 . |degree|) (94 . |coefficient|) (100 . |Frobenius|)
              (105 . |linearAssociatedExp|) (111 . =) (117 . |Zero|) (|List| 7)
              (121 . |entries|) (|List| 53) (126 . |concat|) (132 . |matrix|)
              (137 . |transpose|) (142 . |rowEchelon|) (147 . |zero|)
              (152 . |One|) (156 . =) (162 . |One|) (166 . |setelt!|)
              (173 . |monomial|) (179 . +) (185 . =) (|Void|) (|String|)
              (|OutputForm|) (191 . |messagePrint|) (|Union| 46 '"failed")
              (196 . |linearAssociatedLog|) (202 . |normalElement|)
              (206 . |linearAssociatedLog|) (212 . |linearAssociatedLog|)
              (|List| 14) (217 . |nullSpace|) (222 . |linearAssociatedOrder|)
              (227 . |charthRoot|) (|Union| $ '"failed") (232 . |charthRoot|)
              (237 . ~=) (|SparseUnivariatePolynomial| 6) (243 . |monomial|)
              (249 . -) (255 . |Frobenius|) (261 . *)
              (|SparseUnivariatePolynomial| $) (267 . |minimalPolynomial|)
              (273 . |extensionDegree|) (277 . |size|) (281 . |size|) (285 . ^)
              (291 . ^) (297 . |norm|) (303 . *) (309 . |trace|) (315 . |size|)
              (319 . |characteristic|) (323 . |index|) (328 . |inGroundField?|)
              (333 . |normal?|) (338 . |createNormalElement|) (342 . +)
              (348 . |Zero|) (352 . |gcd|) (358 . |One|) (362 . =)
              (368 . |normal?|) (373 . ~=) (379 . |degree|))
           '#(|transcendent?| 384 |transcendenceDegree| 389 |trace| 393 |size|
              404 |represents| 408 |normal?| 413 |norm| 418 |minimalPolynomial|
              429 |linearAssociatedOrder| 435 |linearAssociatedLog| 440
              |linearAssociatedExp| 451 |extensionDegree| 457 |dimension| 465
              |degree| 469 |createNormalElement| 479 |coordinates| 483
              |charthRoot| 488 |algebraic?| 493)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 112
                                                 '(0 6 0 8 0 6 9 10 0 6 11 12 2
                                                   14 7 0 13 15 2 16 6 0 13 17
                                                   2 6 0 7 0 18 2 6 0 0 0 19 1
                                                   23 0 21 24 1 26 0 13 27 1 6
                                                   11 0 29 0 7 0 31 1 16 13 0
                                                   32 1 6 14 0 33 3 34 0 0 13
                                                   14 35 2 6 0 0 0 41 2 7 0 0 0
                                                   42 1 34 7 0 44 1 46 21 0 47
                                                   2 46 7 0 21 48 1 6 0 0 49 2
                                                   0 0 0 46 50 2 6 37 0 0 51 0
                                                   46 0 52 1 14 53 0 54 2 55 0
                                                   0 53 56 1 34 0 55 57 1 34 0
                                                   0 58 1 34 0 0 59 1 14 0 21
                                                   60 0 7 0 61 2 7 37 0 0 62 0
                                                   6 0 63 3 14 7 0 13 7 64 2 46
                                                   0 7 21 65 2 46 0 0 0 66 2 46
                                                   37 0 0 67 1 70 68 69 71 2 0
                                                   72 0 0 73 0 6 0 74 2 6 72 0
                                                   0 75 1 0 46 0 76 1 34 77 0
                                                   78 1 0 46 0 79 1 6 0 0 80 1
                                                   0 81 0 82 2 21 37 0 0 83 2
                                                   84 0 6 21 85 2 84 0 0 0 86 2
                                                   6 0 0 21 87 2 84 0 0 0 88 2
                                                   0 89 0 11 90 0 6 26 91 0 6
                                                   21 92 0 7 21 93 2 21 0 0 11
                                                   94 2 6 0 0 21 95 2 0 0 0 11
                                                   96 2 21 0 11 0 97 2 0 0 0 11
                                                   98 0 0 21 99 0 6 21 100 1 6
                                                   0 11 101 1 6 37 0 102 1 6 37
                                                   0 103 0 0 0 104 2 84 0 0 0
                                                   105 0 84 0 106 2 84 0 0 0
                                                   107 0 84 0 108 2 84 37 0 0
                                                   109 1 0 37 0 110 2 6 37 0 0
                                                   111 1 0 11 0 112 1 0 37 0 39
                                                   0 0 21 22 2 0 0 0 11 98 1 0
                                                   7 0 43 0 0 21 99 1 0 0 14 20
                                                   1 0 37 0 110 2 0 0 0 11 96 1
                                                   0 7 0 45 2 0 89 0 11 90 1 0
                                                   46 0 79 2 0 72 0 0 73 1 0 46
                                                   0 76 2 0 0 0 46 50 0 0 11 40
                                                   0 0 26 28 0 0 23 25 1 0 11 0
                                                   112 1 0 26 0 30 0 0 0 104 1
                                                   0 34 9 36 1 0 81 0 82 1 0 37
                                                   0 38)))))
           '|lookupComplete|)) 
