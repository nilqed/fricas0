
(SDEFUN |FFFG;ShiftAction;2NniVD;1|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|) (|f| V) ($ D))
        (SPADCALL (EXPT |k| |l|) (SPADCALL |f| |k| (QREFELT $ 9))
                  (QREFELT $ 11))) 

(SDEFUN |FFFG;ShiftC;NniL;2| ((|total| |NonNegativeInteger|) ($ |List| D))
        (SPROG ((#1=#:G714 NIL) (|i| NIL) (#2=#:G713 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FFFG;ShiftC;NniL;2|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |total| 1) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 15)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FFFG;qShiftAction;D2NniVD;3|
        ((|q| D) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|) (|f| V)
         ($ D))
        (SPADCALL (SPADCALL |q| (* |k| |l|) (QREFELT $ 18))
                  (SPADCALL |f| |k| (QREFELT $ 9)) (QREFELT $ 19))) 

(SDEFUN |FFFG;qShiftC;DNniL;4|
        ((|q| D) (|total| |NonNegativeInteger|) ($ |List| D))
        (SPROG ((#1=#:G719 NIL) (|i| NIL) (#2=#:G718 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FFFG;qShiftC;DNniL;4|))
                 (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |total| 1) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |q| |i| (QREFELT $ 18)) #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FFFG;DiffAction;2NniVD;5|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|) (|f| V) ($ D))
        (SPROG ((#1=#:G720 NIL))
               (COND ((< |k| |l|) (|spadConstant| $ 22))
                     ('T
                      (SPADCALL |f|
                                (PROG1
                                    (LETT #1# (- |k| |l|)
                                          |FFFG;DiffAction;2NniVD;5|)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                (QREFELT $ 9)))))) 

(SDEFUN |FFFG;DiffC;NniL;6| ((|total| |NonNegativeInteger|) ($ |List| D))
        (SPROG ((#1=#:G725 NIL) (|i| NIL) (#2=#:G724 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FFFG;DiffC;NniL;6|))
                 (SEQ (LETT |i| 1 . #3#) (LETT #1# |total| . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|spadConstant| $ 22) #2#) . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FFFG;generalCoefficient;MVNniVD;7|
        ((|coeffAction| |Mapping| D (|NonNegativeInteger|)
          (|NonNegativeInteger|) V)
         (|f| |Vector| V) (|k| |NonNegativeInteger|)
         (|p| |Vector| (|SparseUnivariatePolynomial| D)) ($ D))
        (SPROG
         ((|res| (D)) (#1=#:G739 NIL) (|l| NIL)
          (|b| (|SparseUnivariatePolynomial| D)) (|a| (V)) (#2=#:G738 NIL)
          (|i| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 22)
                . #3=(|FFFG;generalCoefficient;MVNniVD;7|))
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (QVSIZE |f|) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |a| (SPADCALL |f| |i| (QREFELT $ 26)) . #3#)
                    (LETT |b| (SPADCALL |p| |i| (QREFELT $ 29)) . #3#)
                    (EXIT
                     (SEQ (LETT |l| (SPADCALL |b| (QREFELT $ 30)) . #3#)
                          (LETT #1# (SPADCALL |b| (QREFELT $ 31)) . #3#) G190
                          (COND ((> |l| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |b| |l| (QREFELT $ 32))
                                         (QREFELT $ 34)))
                              (LETT |res|
                                    (SPADCALL |res|
                                              (SPADCALL
                                               (SPADCALL |b| |l|
                                                         (QREFELT $ 32))
                                               (SPADCALL |k| |l| |a|
                                                         |coeffAction|)
                                               (QREFELT $ 19))
                                              (QREFELT $ 35))
                                    . #3#)))))
                          (LETT |l| (+ |l| 1) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FFFG;generalInterpolation;LMVLM;8|
        ((C |List| D)
         (|coeffAction| |Mapping| D (|NonNegativeInteger|)
          (|NonNegativeInteger|) V)
         (|f| |Vector| V) (|eta| |List| (|NonNegativeInteger|))
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|c|
           (|Mapping| D (|NonNegativeInteger|)
                      (|Vector| (|SparseUnivariatePolynomial| D)))))
         (SEQ
          (LETT |c|
                (CONS #'|FFFG;generalInterpolation;LMVLM;8!0|
                      (VECTOR $ |f| |coeffAction|))
                |FFFG;generalInterpolation;LMVLM;8|)
          (EXIT (SPADCALL C |c| |eta| (QREFELT $ 43)))))) 

(SDEFUN |FFFG;generalInterpolation;LMVLM;8!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|coeffAction| |f| $)
          (LETT |coeffAction| (QREFELT $$ 2)
                . #1=(|FFFG;generalInterpolation;LMVLM;8|))
          (LETT |f| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G744 NIL))
                   (SPADCALL |coeffAction| |f|
                             (PROG1
                                 (LETT #2#
                                       (SPADCALL |x| (|spadConstant| $ 38)
                                                 (QREFELT $ 39))
                                       NIL)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             |y| (QREFELT $ 37))))))) 

(SDEFUN |FFFG;generalInterpolation;LMVVNniM;9|
        ((C |List| D)
         (|coeffAction| |Mapping| D (|NonNegativeInteger|)
          (|NonNegativeInteger|) V)
         (|f| |Vector| V) (|vd| |Vector| (|Integer|)) (K |NonNegativeInteger|)
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|c|
           (|Mapping| D (|NonNegativeInteger|)
                      (|Vector| (|SparseUnivariatePolynomial| D)))))
         (SEQ
          (LETT |c|
                (CONS #'|FFFG;generalInterpolation;LMVVNniM;9!0|
                      (VECTOR $ |f| |coeffAction|))
                |FFFG;generalInterpolation;LMVVNniM;9|)
          (EXIT (SPADCALL C |c| |vd| K (QREFELT $ 46)))))) 

(SDEFUN |FFFG;generalInterpolation;LMVVNniM;9!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|coeffAction| |f| $)
          (LETT |coeffAction| (QREFELT $$ 2)
                . #1=(|FFFG;generalInterpolation;LMVVNniM;9|))
          (LETT |f| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G753 NIL))
                   (SPADCALL |coeffAction| |f|
                             (PROG1
                                 (LETT #2#
                                       (SPADCALL |x| (|spadConstant| $ 38)
                                                 (QREFELT $ 39))
                                       NIL)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             |y| (QREFELT $ 37))))))) 

(SDEFUN |FFFG;nextVector!|
        ((|p| |NonNegativeInteger|) (|v| |List| (|NonNegativeInteger|))
         ($ |Union| "failed" (|List| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G786 NIL) (#2=#:G791 NIL) (|sum| (|Integer|)) (#3=#:G779 NIL)
          (#4=#:G793 NIL) (|j| NIL) (#5=#:G792 NIL) (|i| NIL)
          (|pos| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |v| (QREFELT $ 48)) . #6=(|FFFG;nextVector!|))
            (LETT |pos|
                  (SPADCALL (CONS #'|FFFG;nextVector!!0| (VECTOR $ |p|)) |v|
                            (QREFELT $ 51))
                  . #6#)
            (EXIT
             (COND
              ((ZEROP |pos|)
               (PROGN (LETT #2# (CONS 0 "failed") . #6#) (GO #7=#:G790)))
              (#8='T
               (SEQ
                (COND
                 ((EQL |pos| 1)
                  (SEQ (LETT |sum| (SPADCALL |v| 1 (QREFELT $ 52)) . #6#)
                       (SEQ (LETT |i| 2 . #6#) (LETT #5# |n| . #6#) G190
                            (COND ((|greater_SI| |i| #5#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((< (SPADCALL |v| |i| (QREFELT $ 52)) |p|)
                                (COND
                                 ((SPADCALL |sum| 0 (QREFELT $ 54))
                                  (SEQ
                                   (SPADCALL |v| |i|
                                             (+
                                              (SPADCALL |v| |i| (QREFELT $ 52))
                                              1)
                                             (QREFELT $ 55))
                                   (LETT |sum| (- |sum| 1) . #6#)
                                   (SEQ (LETT |j| 1 . #6#)
                                        (LETT #4# (- |i| 1) . #6#) G190
                                        (COND
                                         ((|greater_SI| |j| #4#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |sum| |p| (QREFELT $ 54))
                                            (SEQ
                                             (SPADCALL |v| |j| |p|
                                                       (QREFELT $ 55))
                                             (EXIT
                                              (LETT |sum| (- |sum| |p|)
                                                    . #6#))))
                                           ('T
                                            (SEQ
                                             (SPADCALL |v| |j|
                                                       (PROG1
                                                           (LETT #3# |sum|
                                                                 . #6#)
                                                         (|check_subtype2|
                                                          (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                                       (QREFELT $ 55))
                                             (EXIT (LETT |sum| 0 . #6#)))))))
                                        (LETT |j| (|inc_SI| |j|) . #6#)
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (PROGN
                                     (LETT #2# (CONS 1 |v|) . #6#)
                                     (GO #7#)))))
                                 ('T
                                  (LETT |sum|
                                        (+ |sum|
                                           (SPADCALL |v| |i| (QREFELT $ 52)))
                                        . #6#))))
                               ('T
                                (LETT |sum|
                                      (+ |sum|
                                         (SPADCALL |v| |i| (QREFELT $ 52)))
                                      . #6#)))))
                            (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (PROGN (LETT #2# (CONS 0 "failed") . #6#) (GO #7#)))))
                 (#8#
                  (SEQ
                   (SPADCALL |v| |pos|
                             (+ (SPADCALL |v| |pos| (QREFELT $ 52)) 1)
                             (QREFELT $ 55))
                   (EXIT
                    (SPADCALL |v| (- |pos| 1)
                              (PROG1
                                  (LETT #1#
                                        (-
                                         (SPADCALL |v| (- |pos| 1)
                                                   (QREFELT $ 52))
                                         1)
                                        . #6#)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT $ 55))))))
                (EXIT (CONS 1 |v|))))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FFFG;nextVector!!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|FFFG;nextVector!|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 49)))))) 

(SDEFUN |FFFG;vectorStream|
        ((|p| |NonNegativeInteger|) (|v| |List| (|NonNegativeInteger|))
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|FFFG;vectorStream!0| (VECTOR $ |v| |p|))
                          (QREFELT $ 61))))) 

(SDEFUN |FFFG;vectorStream!0| (($$ NIL))
        (PROG (|p| |v| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|FFFG;vectorStream|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|next| NIL))
                   (SEQ
                    (LETT |next|
                          (|FFFG;nextVector!| |p| (SPADCALL |v| (QREFELT $ 56))
                           $)
                          NIL)
                    (EXIT
                     (COND ((QEQCAR |next| 0) (SPADCALL (QREFELT $ 58)))
                           ('T
                            (SPADCALL (QCDR |next|)
                                      (|FFFG;vectorStream| |p| (QCDR |next|) $)
                                      (QREFELT $ 59))))))))))) 

(SDEFUN |FFFG;vectorStream2|
        ((|p| |NonNegativeInteger|) (|v| |List| (|NonNegativeInteger|))
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|FFFG;vectorStream2!0| (VECTOR $ |v| |p|))
                          (QREFELT $ 61))))) 

(SDEFUN |FFFG;vectorStream2!0| (($$ NIL))
        (PROG (|p| |v| $)
          (LETT |p| (QREFELT $$ 2) . #1=(|FFFG;vectorStream2|))
          (LETT |v| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|next| NIL) (|next2| NIL))
                   (SEQ
                    (LETT |next|
                          (|FFFG;nextVector!| |p| (SPADCALL |v| (QREFELT $ 56))
                           $)
                          NIL)
                    (EXIT
                     (COND ((QEQCAR |next| 0) (SPADCALL (QREFELT $ 58)))
                           ('T
                            (SEQ
                             (LETT |next2|
                                   (|FFFG;nextVector!| |p|
                                    (SPADCALL (QCDR |next|) (QREFELT $ 56)) $)
                                   NIL)
                             (EXIT
                              (COND
                               ((QEQCAR |next2| 0)
                                (SPADCALL (QCDR |next|)
                                          (SPADCALL (QREFELT $ 58))
                                          (QREFELT $ 59)))
                               ('T
                                (SPADCALL (QCDR |next2|)
                                          (|FFFG;vectorStream2| |p|
                                           (QCDR |next2|) $)
                                          (QREFELT $ 59))))))))))))))) 

(SDEFUN |FFFG;initialVector|
        ((|sum| |NonNegativeInteger|) (|maxEta| |NonNegativeInteger|)
         (|n| |NonNegativeInteger|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G810 NIL) (#2=#:G808 NIL) (|entry| (|Integer|)) (#3=#:G816 NIL)
          (|i| NIL) (#4=#:G815 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL . #5=(|FFFG;initialVector|))
           (SEQ (LETT |i| 1 . #5#) (LETT #3# |n| . #5#) G190
                (COND ((|greater_SI| |i| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #4#
                        (CONS
                         (SEQ
                          (COND
                           ((< |sum| |maxEta|)
                            (SEQ (LETT |entry| |sum| . #5#)
                                 (EXIT (LETT |sum| 0 . #5#))))
                           ('T
                            (SEQ (LETT |entry| |maxEta| . #5#)
                                 (EXIT
                                  (LETT |sum|
                                        (PROG1
                                            (LETT #2# (- |sum| |maxEta|) . #5#)
                                          (|check_subtype2| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                        . #5#)))))
                          (EXIT
                           (PROG1 (LETT #1# |entry| . #5#)
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#))))
                         #4#)
                        . #5#)))
                (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                (EXIT (NREVERSE #4#))))))) 

(SDEFUN |FFFG;genVectorStream;3NniS;14|
        ((|sum| |NonNegativeInteger|) (|max| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|)
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG ((|eta| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |eta| (|FFFG;initialVector| |sum| |max| |k| $)
                      |FFFG;genVectorStream;3NniS;14|)
                (EXIT
                 (SPADCALL |eta| (|FFFG;vectorStream| |max| |eta| $)
                           (QREFELT $ 59)))))) 

(SDEFUN |FFFG;genVectorStream2;3NniS;15|
        ((|sum| |NonNegativeInteger|) (|max| |NonNegativeInteger|)
         (|k| |NonNegativeInteger|)
         ($ |Stream| (|List| (|NonNegativeInteger|))))
        (SPROG ((|eta| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |eta| (|FFFG;initialVector| |sum| |max| |k| $)
                      |FFFG;genVectorStream2;3NniS;15|)
                (EXIT
                 (SPADCALL |eta| (|FFFG;vectorStream2| |max| |eta| $)
                           (QREFELT $ 59)))))) 

(SDEFUN |FFFG;interpolate;2LNniF;16|
        ((|x| |List| (|Fraction| D)) (|y| |List| (|Fraction| D))
         (|d| |NonNegativeInteger|)
         ($ |Fraction| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|r| (|Fraction| (|SparseUnivariatePolynomial| D)))
          (|gy| #1=(|Record| (|:| |num| (|List| D)) (|:| |den| D))) (|gx| #1#))
         (SEQ
          (LETT |gx| (SPADCALL |x| (QREFELT $ 67))
                . #2=(|FFFG;interpolate;2LNniF;16|))
          (LETT |gy| (SPADCALL |y| (QREFELT $ 67)) . #2#)
          (LETT |r| (SPADCALL (QCAR |gx|) (QCAR |gy|) |d| (QREFELT $ 69))
                . #2#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |r| (QREFELT $ 70))
                      (SPADCALL (QCDR |gx|) 1 (QREFELT $ 71)) (QREFELT $ 72))
            (SPADCALL (QCDR |gy|)
                      (SPADCALL (SPADCALL |r| (QREFELT $ 73))
                                (SPADCALL (QCDR |gx|) 1 (QREFELT $ 71))
                                (QREFELT $ 72))
                      (QREFELT $ 74))
            (QREFELT $ 75)))))) 

(SDEFUN |FFFG;interpolate;2LNniF;17|
        ((|x| |List| D) (|y| |List| D) (|d| |NonNegativeInteger|)
         ($ |Fraction| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((M (|Matrix| (|SparseUnivariatePolynomial| D)))
          (|eta| (|List| (|NonNegativeInteger|))) (#1=#:G826 NIL)
          (|c|
           (|Mapping| D (|NonNegativeInteger|)
                      (|Vector| (|SparseUnivariatePolynomial| D))))
          (N (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (LETT N (LENGTH |x|) . #2=(|FFFG;interpolate;2LNniF;17|))
                      (LENGTH |y|) (QREFELT $ 77))
            (|error| "interpolate: number of points and values must match")))
          (COND
           ((SPADCALL N |d| (QREFELT $ 78))
            (|error|
             "interpolate: numerator degree must be smaller than number of data points")))
          (LETT |c| (CONS #'|FFFG;interpolate;2LNniF;17!0| (VECTOR |x| $ |y|))
                . #2#)
          (LETT |eta|
                (LIST |d|
                      (PROG1 (LETT #1# (- N |d|) . #2#)
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#)))
                . #2#)
          (LETT M (SPADCALL |x| |c| |eta| (QREFELT $ 43)) . #2#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL M 2 1 (QREFELT $ 84)) (QREFELT $ 85))
             (SPADCALL (SPADCALL M 1 2 (QREFELT $ 84))
                       (SPADCALL M 2 2 (QREFELT $ 84)) (QREFELT $ 75)))
            ('T
             (SPADCALL (SPADCALL M 1 1 (QREFELT $ 84))
                       (SPADCALL M 2 1 (QREFELT $ 84)) (QREFELT $ 75)))))))) 

(SDEFUN |FFFG;interpolate;2LNniF;17!0| ((|s| NIL) (|u| NIL) ($$ NIL))
        (PROG (|y| $ |x|)
          (LETT |y| (QREFELT $$ 2) . #1=(|FFFG;interpolate;2LNniF;17|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |y| |s| (QREFELT $ 79))
                       (SPADCALL (SPADCALL |u| 2 (QREFELT $ 29))
                                 (SPADCALL |x| |s| (QREFELT $ 79))
                                 (QREFELT $ 80))
                       (QREFELT $ 19))
             (SPADCALL (SPADCALL |u| (|spadConstant| $ 82) (QREFELT $ 29))
                       (SPADCALL |x| |s| (QREFELT $ 79)) (QREFELT $ 80))
             (QREFELT $ 83)))))) 

(SDEFUN |FFFG;recurrence|
        ((M |Matrix| (|SparseUnivariatePolynomial| D))
         (|pi| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         (|r| |Vector| D) (|d| D) (|z| |SparseUnivariatePolynomial| D) (|Ck| D)
         (|p| |Vector| D) (|vd| |Vector| (|Integer|))
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((#1=#:G833 NIL) (|newMiPi| (|SparseUnivariatePolynomial| D))
          (|pl| (D)) (|Mil| (|SparseUnivariatePolynomial| D)) (|rl| (D))
          (#2=#:G842 NIL) (|l| NIL) (|MiPi| (|SparseUnivariatePolynomial| D))
          (#3=#:G841 NIL) (|i| NIL) (|polyf| (|SparseUnivariatePolynomial| D))
          (|rPi| (D)))
         (SEQ (LETT |rPi| (QAREF1O |r| |pi| 1) . #4=(|FFFG;recurrence|))
              (LETT |polyf|
                    (SPADCALL |rPi|
                              (SPADCALL |z| (SPADCALL |Ck| (QREFELT $ 86))
                                        (QREFELT $ 87))
                              (QREFELT $ 74))
                    . #4#)
              (SEQ (LETT |i| 1 . #4#) (LETT #3# |m| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |MiPi| (QAREF2O M |i| |pi| 1 1) . #4#)
                        (LETT |newMiPi|
                              (SPADCALL |polyf| |MiPi| (QREFELT $ 88)) . #4#)
                        (SEQ (LETT |l| 1 . #4#) (LETT #2# |m| . #4#) G190
                             (COND ((|greater_SI| |l| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((COND
                                  ((SPADCALL |l| |pi| (QREFELT $ 77))
                                   (>= (SPADCALL |vd| |l| (QREFELT $ 89)) 0))
                                  ('T NIL))
                                 (SEQ (LETT |rl| (QAREF1O |r| |l| 1) . #4#)
                                      (LETT |Mil|
                                            (PROG2
                                                (LETT #1#
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QAREF2O M |i| |l| 1
                                                                  1)
                                                         |rPi| (QREFELT $ 90))
                                                        (SPADCALL |MiPi| |rl|
                                                                  (QREFELT $
                                                                           90))
                                                        (QREFELT $ 87))
                                                       |d| (QREFELT $ 92))
                                                      . #4#)
                                                (QCDR #1#)
                                              (|check_union2| (QEQCAR #1# 0)
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT $ 6))
                                                              (|Union|
                                                               (|SparseUnivariatePolynomial|
                                                                (QREFELT $ 6))
                                                               #5="failed")
                                                              #1#))
                                            . #4#)
                                      (QSETAREF2O M |i| |l| |Mil| 1 1)
                                      (LETT |pl| (QAREF1O |p| |l| 1) . #4#)
                                      (EXIT
                                       (LETT |newMiPi|
                                             (SPADCALL |newMiPi|
                                                       (SPADCALL |pl| |Mil|
                                                                 (QREFELT $
                                                                          74))
                                                       (QREFELT $ 87))
                                             . #4#)))))))
                             (LETT |l| (|inc_SI| |l|) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (QSETAREF2O M |i| |pi|
                                     (PROG2
                                         (LETT #1#
                                               (SPADCALL |newMiPi| |d|
                                                         (QREFELT $ 92))
                                               . #4#)
                                         (QCDR #1#)
                                       (|check_union2| (QEQCAR #1# 0)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 6))
                                                       (|Union|
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT $ 6))
                                                        #5#)
                                                       #1#))
                                     1 1)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT M)))) 

(SDEFUN |FFFG;fffg;LMVNniM;19|
        ((C |List| D)
         (|c| |Mapping| D (|NonNegativeInteger|)
          (|Vector| (|SparseUnivariatePolynomial| D)))
         (|vd| |Vector| (|Integer|)) (K |NonNegativeInteger|)
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|d| (D)) (M (|Matrix| (|SparseUnivariatePolynomial| D)))
          (#1=#:G847 NIL) (#2=#:G858 NIL) (|l| NIL)
          (|lambda| (|NonNegativeInteger|)) (|lambdaMax| (|Integer|))
          (|vdl| (|Integer|)) (#3=#:G857 NIL) (#4=#:G856 NIL) (|k| NIL)
          (|p| #5=(|Vector| D)) (|r| #5#)
          (|etak| (|Vector| (|NonNegativeInteger|)))
          (|m| (|NonNegativeInteger|)) (|z| (|SparseUnivariatePolynomial| D)))
         (SEQ
          (LETT |z| (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 71))
                . #6=(|FFFG;fffg;LMVNniM;19|))
          (LETT |m| (QVSIZE |vd|) . #6#)
          (LETT M (SPADCALL |m| (|spadConstant| $ 93) (QREFELT $ 94)) . #6#)
          (LETT |d| (|spadConstant| $ 13) . #6#)
          (LETT |etak| (SPADCALL |m| (QREFELT $ 96)) . #6#)
          (LETT |r| (SPADCALL |m| (QREFELT $ 98)) . #6#)
          (LETT |p| (SPADCALL |m| (QREFELT $ 98)) . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #4# K . #6#) G190
               (COND ((|greater_SI| |k| #4#) (GO G191)))
               (SEQ (LETT |lambda| 0 . #6#) (LETT |lambdaMax| -1 . #6#)
                    (SEQ (LETT |l| 1 . #6#) (LETT #3# |m| . #6#) G190
                         (COND ((|greater_SI| |l| #3#) (GO G191)))
                         (SEQ
                          (LETT |vdl| (SPADCALL |vd| |l| (QREFELT $ 89)) . #6#)
                          (EXIT
                           (COND ((< |vdl| 0) "iterate")
                                 ('T
                                  (SEQ
                                   (SPADCALL |r| |l|
                                             (SPADCALL |k|
                                                       (SPADCALL M |l|
                                                                 (QREFELT $
                                                                          99))
                                                       |c|)
                                             (QREFELT $ 100))
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |r| |l| (QREFELT $ 101))
                                       (|spadConstant| $ 22) (QREFELT $ 102))
                                      "iterate")
                                     ((SPADCALL |vdl| |lambdaMax|
                                                (QREFELT $ 54))
                                      (SEQ (LETT |lambdaMax| |vdl| . #6#)
                                           (EXIT
                                            (LETT |lambda| |l| . #6#)))))))))))
                         (LETT |l| (|inc_SI| |l|) . #6#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND ((EQL |lambda| 0) "iterate")
                           ('T
                            (SEQ
                             (SEQ (LETT |l| 1 . #6#) (LETT #2# |m| . #6#) G190
                                  (COND ((|greater_SI| |l| #2#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |l| |lambda| (QREFELT $ 77))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |etak| |l| (QREFELT $ 103))
                                         0 (QREFELT $ 104))
                                        (COND
                                         ((>=
                                           (SPADCALL |vd| |l| (QREFELT $ 89))
                                           0)
                                          (SPADCALL |p| |l|
                                                    (SPADCALL
                                                     (SPADCALL M |l| |lambda|
                                                               (QREFELT $ 84))
                                                     (PROG1
                                                         (LETT #1#
                                                               (-
                                                                (SPADCALL
                                                                 |etak| |l|
                                                                 (QREFELT $
                                                                          103))
                                                                1)
                                                               . #6#)
                                                       (|check_subtype2|
                                                        (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#))
                                                     (QREFELT $ 32))
                                                    (QREFELT $ 100)))
                                         ('T
                                          (SPADCALL |p| |l|
                                                    (|spadConstant| $ 22)
                                                    (QREFELT $ 100)))))
                                       ('T
                                        (SPADCALL |p| |l| (|spadConstant| $ 22)
                                                  (QREFELT $ 100))))))))
                                  (LETT |l| (|inc_SI| |l|) . #6#) (GO G190)
                                  G191 (EXIT NIL))
                             (LETT M
                                   (|FFFG;recurrence| M |lambda| |m| |r| |d|
                                    |z| (SPADCALL C |k| (QREFELT $ 79)) |p|
                                    |vd| $)
                                   . #6#)
                             (LETT |d| (SPADCALL |r| |lambda| (QREFELT $ 101))
                                   . #6#)
                             (SPADCALL |etak| |lambda|
                                       (+
                                        (SPADCALL |etak| |lambda|
                                                  (QREFELT $ 103))
                                        1)
                                       (QREFELT $ 105))
                             (EXIT
                              (SPADCALL |vd| |lambda|
                                        (-
                                         (SPADCALL |vd| |lambda|
                                                   (QREFELT $ 89))
                                         1)
                                        (QREFELT $ 106))))))))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT M)))) 

(SDEFUN |FFFG;fffg;LMLM;20|
        ((C |List| D)
         (|c| |Mapping| D (|NonNegativeInteger|)
          (|Vector| (|SparseUnivariatePolynomial| D)))
         (|eta| |List| (|NonNegativeInteger|))
         ($ |Matrix| (|SparseUnivariatePolynomial| D)))
        (SPROG
         ((|vd| (|Vector| (|Integer|))) (#1=#:G867 NIL) (|ei| NIL)
          (#2=#:G866 NIL))
         (SEQ
          (LETT |vd|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|FFFG;fffg;LMLM;20|))
                  (SEQ (LETT |ei| NIL . #3#) (LETT #1# |eta| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |ei| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS |ei| #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 108))
                . #3#)
          (EXIT
           (SPADCALL C |c| |vd| (SPADCALL (ELT $ 109) |eta| (QREFELT $ 111))
                     (QREFELT $ 46)))))) 

(DECLAIM (NOTINLINE |FractionFreeFastGaussian;|)) 

(DEFUN |FractionFreeFastGaussian| (&REST #1=#:G868)
  (SPROG NIL
         (PROG (#2=#:G869)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FractionFreeFastGaussian|)
                                               '|domainEqualList|)
                    . #3=(|FractionFreeFastGaussian|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FractionFreeFastGaussian;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FractionFreeFastGaussian|)))))))))) 

(DEFUN |FractionFreeFastGaussian;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FractionFreeFastGaussian|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FractionFreeFastGaussian| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 112) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FractionFreeFastGaussian|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FractionFreeFastGaussian| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |coefficient|) (|Integer|) (6 . *)
              |FFFG;ShiftAction;2NniVD;1| (12 . |One|) (16 . |One|)
              (20 . |coerce|) (|List| 6) |FFFG;ShiftC;NniL;2| (25 . ^) (31 . *)
              |FFFG;qShiftAction;D2NniVD;3| |FFFG;qShiftC;DNniL;4|
              (37 . |Zero|) |FFFG;DiffAction;2NniVD;5| |FFFG;DiffC;NniL;6|
              (|Vector| 7) (41 . |elt|) (|SparseUnivariatePolynomial| 6)
              (|Vector| 27) (47 . |elt|) (53 . |minimumDegree|) (58 . |degree|)
              (63 . |coefficient|) (|Boolean|) (69 . |zero?|) (74 . +)
              (|Mapping| 6 8 8 7) |FFFG;generalCoefficient;MVNniVD;7|
              (80 . |One|) (84 . -) (|Matrix| 27) (|Mapping| 6 8 28) (|List| 8)
              |FFFG;fffg;LMLM;20| |FFFG;generalInterpolation;LMVLM;8|
              (|Vector| 10) |FFFG;fffg;LMVNniM;19|
              |FFFG;generalInterpolation;LMVVNniM;9| (90 . |#|) (95 . <)
              (|Mapping| 33 8) (101 . |position|) (107 . |elt|) (113 . |Zero|)
              (117 . >) (123 . |setelt!|) (130 . |copy|) (|Stream| 42)
              (135 . |empty|) (139 . |cons|) (|Mapping| $) (145 . |delay|)
              |FFFG;genVectorStream;3NniS;14| |FFFG;genVectorStream2;3NniS;15|
              (|Record| (|:| |num| 16) (|:| |den| 6)) (|List| (|Fraction| 6))
              (|InnerCommonDenominator| 6 (|Fraction| 6) 16 65)
              (150 . |splitDenominator|) (|Fraction| 27)
              |FFFG;interpolate;2LNniF;17| (155 . |numer|) (160 . |monomial|)
              (166 . |elt|) (172 . |denom|) (177 . *) (183 . /)
              |FFFG;interpolate;2LNniF;16| (189 . ~=) (195 . <=) (201 . |elt|)
              (207 . |elt|) (|PositiveInteger|) (213 . |One|) (217 . -)
              (223 . |elt|) (230 . |zero?|) (235 . |coerce|) (240 . -)
              (246 . *) (252 . |elt|) (258 . *) (|Union| $ '"failed")
              (264 . |exquo|) (270 . |One|) (274 . |scalarMatrix|) (|Vector| 8)
              (280 . |zero|) (|Vector| 6) (285 . |zero|) (290 . |column|)
              (296 . |setelt!|) (303 . |elt|) (309 . =) (315 . |elt|) (321 . >)
              (327 . |setelt!|) (334 . |setelt!|) (|List| 10) (341 . |vector|)
              (346 . +) (|Mapping| 8 8 8) (352 . |reduce|))
           '#(|qShiftC| 358 |qShiftAction| 364 |interpolate| 372
              |generalInterpolation| 386 |generalCoefficient| 403
              |genVectorStream2| 411 |genVectorStream| 418 |fffg| 425 |ShiftC|
              440 |ShiftAction| 445 |DiffC| 452 |DiffAction| 457)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(2 7 6 0 8 9 2 6 0 10 0 11 0
                                                   6 0 13 0 7 0 14 1 6 0 10 15
                                                   2 6 0 0 8 18 2 6 0 0 0 19 0
                                                   6 0 22 2 25 7 0 10 26 2 28
                                                   27 0 10 29 1 27 8 0 30 1 27
                                                   8 0 31 2 27 6 0 8 32 1 6 33
                                                   0 34 2 6 0 0 0 35 0 8 0 38 2
                                                   10 0 0 0 39 1 42 8 0 48 2 8
                                                   33 0 0 49 2 42 10 50 0 51 2
                                                   42 8 0 10 52 0 7 0 53 2 10
                                                   33 0 0 54 3 42 8 0 10 8 55 1
                                                   42 0 0 56 0 57 0 58 2 57 0
                                                   42 0 59 1 57 0 60 61 1 66 64
                                                   65 67 1 68 27 0 70 2 27 0 6
                                                   8 71 2 27 0 0 0 72 1 68 27 0
                                                   73 2 27 0 6 0 74 2 68 0 27
                                                   27 75 2 8 33 0 0 77 2 8 33 0
                                                   0 78 2 16 6 0 10 79 2 27 6 0
                                                   6 80 0 81 0 82 2 6 0 0 0 83
                                                   3 40 27 0 10 10 84 1 27 33 0
                                                   85 1 27 0 6 86 2 27 0 0 0 87
                                                   2 27 0 0 0 88 2 45 10 0 10
                                                   89 2 27 0 0 6 90 2 27 91 0 6
                                                   92 0 27 0 93 2 40 0 8 27 94
                                                   1 95 0 8 96 1 97 0 8 98 2 40
                                                   28 0 10 99 3 97 6 0 10 6 100
                                                   2 97 6 0 10 101 2 6 33 0 0
                                                   102 2 95 8 0 10 103 2 8 33 0
                                                   0 104 3 95 8 0 10 8 105 3 45
                                                   10 0 10 10 106 1 45 0 107
                                                   108 2 8 0 0 0 109 2 42 8 110
                                                   0 111 2 0 16 6 8 21 4 0 6 6
                                                   8 8 7 20 3 0 68 16 16 8 69 3
                                                   0 68 65 65 8 76 4 0 40 16 36
                                                   25 42 44 5 0 40 16 36 25 45
                                                   8 47 4 0 6 36 25 8 28 37 3 0
                                                   57 8 8 8 63 3 0 57 8 8 8 62
                                                   4 0 40 16 41 45 8 46 3 0 40
                                                   16 41 42 43 1 0 16 8 17 3 0
                                                   6 8 8 7 12 1 0 16 8 24 3 0 6
                                                   8 8 7 23)))))
           '|lookupComplete|)) 
