
(SDEFUN |PRS;*| ((|r| R) (|v| |Vector| |polR|) ($ |Vector| |polR|))
        (SPADCALL (SPADCALL |r| (QREFELT $ 12)) |v| (QREFELT $ 14))) 

(SDEFUN |PRS;exquo| ((|v| |Vector| |polR|) (|r| R) ($ |Vector| |polR|))
        (SPROG NIL
               (SPADCALL (CONS #'|PRS;exquo!0| (VECTOR (QREFELT $ 7) $ |r|))
                         |v| (QREFELT $ 18)))) 

(SDEFUN |PRS;exquo!0| ((|p1| NIL) ($$ NIL))
        (PROG (|r| $ |polR|)
          (LETT |r| (QREFELT $$ 2) . #1=(|PRS;exquo|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |polR| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G864 NIL))
                   (PROG2 (LETT #2# (SPADCALL |p1| |r| (QREFELT $ 16)) NIL)
                       (QCDR #2#)
                     (|check_union2| (QEQCAR #2# 0) |polR|
                                     (|Union| |polR| "failed") #2#))))))) 

(SDEFUN |PRS;divide;2polRR;3|
        ((F |polR|) (G |polR|)
         ($ |Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
        (SPROG
         ((#1=#:G883 NIL) (|quot| (|polR|)) (|mon| (|polR|)) (#2=#:G876 NIL)
          (#3=#:G874 NIL) (|delta| (|Integer|)) (#4=#:G870 NIL)
          (|degG| (|NonNegativeInteger|)) (|lcG| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lcG| (SPADCALL G (QREFELT $ 19))
                  . #5=(|PRS;divide;2polRR;3|))
            (LETT |degG| (SPADCALL G (QREFELT $ 20)) . #5#)
            (EXIT
             (COND
              ((ZEROP |degG|)
               (SEQ
                (LETT F
                      (PROG2 (LETT #4# (SPADCALL F |lcG| (QREFELT $ 16)) . #5#)
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #4#))
                      . #5#)
                (EXIT
                 (PROGN
                  (LETT #1# (CONS F (|spadConstant| $ 22)) . #5#)
                  (GO #6=#:G882)))))
              ('T
               (SEQ (LETT G (SPADCALL G (QREFELT $ 23)) . #5#)
                    (LETT |quot| (|spadConstant| $ 22) . #5#)
                    (SEQ G190
                         (COND
                          ((NULL
                            (>=
                             (LETT |delta|
                                   (- (SPADCALL F (QREFELT $ 20)) |degG|)
                                   . #5#)
                             0))
                           (GO G191)))
                         (SEQ
                          (LETT |mon|
                                (SPADCALL
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL
                                            (SPADCALL F (QREFELT $ 19)) |lcG|
                                            (QREFELT $ 24))
                                           . #5#)
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0) (QREFELT $ 6)
                                                   (|Union| (QREFELT $ 6)
                                                            "failed")
                                                   #3#))
                                 (PROG1 (LETT #2# |delta| . #5#)
                                   (|check_subtype2| (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                 (QREFELT $ 10))
                                . #5#)
                          (LETT |quot| (SPADCALL |quot| |mon| (QREFELT $ 25))
                                . #5#)
                          (EXIT
                           (LETT F
                                 (SPADCALL (SPADCALL F (QREFELT $ 23))
                                           (SPADCALL |mon| G (QREFELT $ 26))
                                           (QREFELT $ 27))
                                 . #5#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (PROGN (LETT #1# (CONS |quot| F) . #5#) (GO #6#)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |PRS;resultant_naif| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|#G19| (|polR|)) (|#G18| (|polR|)) (|a| (R)) (#1=#:G890 NIL)
          (U (|polR|)) (#2=#:G897 NIL) (|degQ| #3=(|NonNegativeInteger|))
          (|degP| #3#) (|#G17| #3#) (|#G16| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (|spadConstant| $ 8) . #4=(|PRS;resultant_naif|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT $ 31))
                          (PROGN
                           (LETT #2# (|spadConstant| $ 21) . #4#)
                           (GO #5=#:G896)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G16| (SPADCALL P (QREFELT $ 20)) . #4#)
                            (LETT |#G17| (SPADCALL Q (QREFELT $ 20)) . #4#)
                            (LETT |degP| |#G16| . #4#)
                            (LETT |degQ| |#G17| . #4#))
                           (COND
                            ((ODDP |degP|)
                             (COND
                              ((ODDP |degQ|)
                               (LETT |a| (SPADCALL |a| (QREFELT $ 32))
                                     . #4#)))))
                           (EXIT
                            (COND
                             ((ZEROP |degQ|)
                              (PROGN
                               (LETT #2#
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (SPADCALL Q (QREFELT $ 19))
                                                |degP| (QREFELT $ 33))
                                               (QREFELT $ 34))
                                     . #4#)
                               (GO #5#)))
                             ('T
                              (SEQ
                               (LETT U (QCDR (SPADCALL P Q (QREFELT $ 29)))
                                     . #4#)
                               (LETT |a|
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (SPADCALL Q (QREFELT $ 19))
                                                (PROG1
                                                    (LETT #1#
                                                          (- |degP|
                                                             (SPADCALL U
                                                                       (QREFELT
                                                                        $ 20)))
                                                          . #4#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 33))
                                               (QREFELT $ 34))
                                     . #4#)
                               (EXIT
                                (PROGN
                                 (LETT |#G18| Q . #4#)
                                 (LETT |#G19| U . #4#)
                                 (LETT P |#G18| . #4#)
                                 (LETT Q |#G19| . #4#))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean_naif|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|cf2| (|polR|)) (|cf1| (|polR|)) (|old_cf2| (|polR|))
          (|old_cf1| (|polR|)) (|#G29| (|polR|)) (|#G28| (|polR|))
          (|#G27| (|polR|)) (|#G26| (|polR|)) (|#G25| (|polR|))
          (|#G24| (|polR|)) (|a| (R)) (#1=#:G909 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#2=#:G915 NIL) (#3=#:G903 NIL) (|degQ| #4=(|NonNegativeInteger|))
          (|degP| #4#) (|#G23| #4#) (|#G22| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #5=(|PRS;resultantEuclidean_naif|))
            (LETT |old_cf1| (|spadConstant| $ 35) . #5#)
            (LETT |cf1| (|spadConstant| $ 22) . #5#)
            (LETT |old_cf2| (|spadConstant| $ 22) . #5#)
            (LETT |cf2| (|spadConstant| $ 35) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 31))
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 22)
                                     (|spadConstant| $ 22)
                                     (|spadConstant| $ 21))
                             . #5#)
                       (GO #6=#:G914)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G22| (SPADCALL P (QREFELT $ 20)) . #5#)
                        (LETT |#G23| (SPADCALL Q (QREFELT $ 20)) . #5#)
                        (LETT |degP| |#G22| . #5#)
                        (LETT |degQ| |#G23| . #5#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 32)) . #5#)))))
                       (COND
                        ((ZEROP |degQ|)
                         (SEQ
                          (LETT |a|
                                (SPADCALL |a|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                                    (PROG1
                                                        (LETT #3# (- |degP| 1)
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                                    (QREFELT $ 33))
                                          (QREFELT $ 34))
                                . #5#)
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (VECTOR (SPADCALL |a| |cf1| (QREFELT $ 36))
                                          (SPADCALL |a| |cf2| (QREFELT $ 36))
                                          (SPADCALL |a|
                                                    (SPADCALL Q (QREFELT $ 19))
                                                    (QREFELT $ 34)))
                                  . #5#)
                            (GO #6#))))))
                       (LETT |divid| (SPADCALL P Q (QREFELT $ 29)) . #5#)
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                                 (PROG1
                                                     (LETT #1#
                                                           (- |degP|
                                                              (SPADCALL
                                                               (QCDR |divid|)
                                                               (QREFELT $ 20)))
                                                           . #5#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT $ 33))
                                       (QREFELT $ 34))
                             . #5#)
                       (PROGN
                        (LETT |#G24| Q . #5#)
                        (LETT |#G25| (QCDR |divid|) . #5#)
                        (LETT P |#G24| . #5#)
                        (LETT Q |#G25| . #5#))
                       (EXIT
                        (PROGN
                         (LETT |#G26| |cf1| . #5#)
                         (LETT |#G27| |cf2| . #5#)
                         (LETT |#G28|
                               (SPADCALL |old_cf1|
                                         (SPADCALL (QCAR |divid|) |cf1|
                                                   (QREFELT $ 26))
                                         (QREFELT $ 27))
                               . #5#)
                         (LETT |#G29|
                               (SPADCALL |old_cf2|
                                         (SPADCALL (QCAR |divid|) |cf2|
                                                   (QREFELT $ 26))
                                         (QREFELT $ 27))
                               . #5#)
                         (LETT |old_cf1| |#G26| . #5#)
                         (LETT |old_cf2| |#G27| . #5#)
                         (LETT |cf1| |#G28| . #5#)
                         (LETT |cf2| |#G29| . #5#))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiResultantEuclidean_naif|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|cf2| (|polR|)) (|old_cf2| (|polR|)) (|#G37| (|polR|))
          (|#G36| (|polR|)) (|#G35| (|polR|)) (|#G34| (|polR|)) (|a| (R))
          (#1=#:G927 NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (#2=#:G933 NIL) (#3=#:G921 NIL) (|degQ| #4=(|NonNegativeInteger|))
          (|degP| #4#) (|#G33| #4#) (|#G32| #4#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |a| (|spadConstant| $ 8)
                  . #5=(|PRS;semiResultantEuclidean_naif|))
            (LETT |old_cf2| (|spadConstant| $ 22) . #5#)
            (LETT |cf2| (|spadConstant| $ 35) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 31))
                      (PROGN
                       (LETT #2#
                             (CONS (|spadConstant| $ 22) (|spadConstant| $ 21))
                             . #5#)
                       (GO #6=#:G932)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G32| (SPADCALL P (QREFELT $ 20)) . #5#)
                        (LETT |#G33| (SPADCALL Q (QREFELT $ 20)) . #5#)
                        (LETT |degP| |#G32| . #5#)
                        (LETT |degQ| |#G33| . #5#))
                       (COND
                        ((ODDP |degP|)
                         (COND
                          ((ODDP |degQ|)
                           (LETT |a| (SPADCALL |a| (QREFELT $ 32)) . #5#)))))
                       (COND
                        ((ZEROP |degQ|)
                         (SEQ
                          (LETT |a|
                                (SPADCALL |a|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                                    (PROG1
                                                        (LETT #3# (- |degP| 1)
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                                    (QREFELT $ 33))
                                          (QREFELT $ 34))
                                . #5#)
                          (EXIT
                           (PROGN
                            (LETT #2#
                                  (CONS (SPADCALL |a| |cf2| (QREFELT $ 36))
                                        (SPADCALL |a|
                                                  (SPADCALL Q (QREFELT $ 19))
                                                  (QREFELT $ 34)))
                                  . #5#)
                            (GO #6#))))))
                       (LETT |divid| (SPADCALL P Q (QREFELT $ 29)) . #5#)
                       (LETT |a|
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                                 (PROG1
                                                     (LETT #1#
                                                           (- |degP|
                                                              (SPADCALL
                                                               (QCDR |divid|)
                                                               (QREFELT $ 20)))
                                                           . #5#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT $ 33))
                                       (QREFELT $ 34))
                             . #5#)
                       (PROGN
                        (LETT |#G34| Q . #5#)
                        (LETT |#G35| (QCDR |divid|) . #5#)
                        (LETT P |#G34| . #5#)
                        (LETT Q |#G35| . #5#))
                       (EXIT
                        (PROGN
                         (LETT |#G36| |cf2| . #5#)
                         (LETT |#G37|
                               (SPADCALL |old_cf2|
                                         (SPADCALL (QCAR |divid|) |cf2|
                                                   (QREFELT $ 26))
                                         (QREFELT $ 27))
                               . #5#)
                         (LETT |old_cf2| |#G36| . #5#)
                         (LETT |cf2| |#G37| . #5#))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;exactQuo| ((|x| R) (|y| R) ($ R))
        (SPROG ((|ex| (|Union| R "failed")))
               (SEQ
                (LETT |ex| (SPADCALL |x| |y| (QREFELT $ 24)) |PRS;exactQuo|)
                (EXIT
                 (COND ((QEQCAR |ex| 0) (QCDR |ex|))
                       ('T (|error| "exactQuo$PRS: bad args"))))))) 

(SDEFUN |PRS;LazardQuotient;2RNniR;8|
        ((|x| R) (|y| R) (|n| |NonNegativeInteger|) ($ R))
        (SPROG
         ((#1=#:G941 NIL) (|c| (R)) (|a| (|NonNegativeInteger|))
          (#2=#:G948 NIL) (#3=#:G940 NIL) (|b| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|error| "Lazard$PRS : n = 0")) ((EQL |n| 1) |x|)
                 ('T
                  (SEQ (LETT |a| 1 . #4=(|PRS;LazardQuotient;2RNniR;8|))
                       (SEQ G190
                            (COND
                             ((NULL
                               (>= |n|
                                   (LETT |b| (SPADCALL 2 |a| (QREFELT $ 38))
                                         . #4#)))
                              (GO G191)))
                            (SEQ (EXIT (LETT |a| |b| . #4#))) NIL (GO G190)
                            G191 (EXIT NIL))
                       (LETT |c| |x| . #4#)
                       (LETT |n|
                             (PROG1 (LETT #3# (- |n| |a|) . #4#)
                               (|check_subtype2| (>= #3# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #3#))
                             . #4#)
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL |a| 1)
                                 (PROGN (LETT #2# |c| . #4#) (GO #5=#:G947)))
                                ('T
                                 (SEQ (LETT |a| (QUOTIENT2 |a| 2) . #4#)
                                      (LETT |c|
                                            (|PRS;exactQuo|
                                             (SPADCALL |c| |c| (QREFELT $ 34))
                                             |y| $)
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((>= |n| |a|)
                                         (SEQ
                                          (LETT |c|
                                                (|PRS;exactQuo|
                                                 (SPADCALL |c| |x|
                                                           (QREFELT $ 34))
                                                 |y| $)
                                                . #4#)
                                          (EXIT
                                           (LETT |n|
                                                 (PROG1
                                                     (LETT #1# (- |n| |a|)
                                                           . #4#)
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 . #4#)))))))))))
                             NIL (GO G190) G191 (EXIT NIL)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRS;LazardQuotient2;polR2RNnipolR;9|
        ((F |polR|) (|x| R) (|y| R) (|n| |NonNegativeInteger|) ($ |polR|))
        (SPROG ((#1=#:G956 NIL) (#2=#:G951 NIL) (#3=#:G949 NIL))
               (SEQ
                (EXIT
                 (COND ((ZEROP |n|) (|error| "LazardQuotient2$PRS : n = 0"))
                       ((EQL |n| 1) F)
                       ('T
                        (SEQ
                         (LETT |x|
                               (SPADCALL |x| |y|
                                         (PROG1
                                             (LETT #3# (- |n| 1)
                                                   . #4=(|PRS;LazardQuotient2;polR2RNnipolR;9|))
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT $ 39))
                               . #4#)
                         (EXIT
                          (PROGN
                           (LETT #1#
                                 (PROG2
                                     (LETT #2#
                                           (SPADCALL
                                            (SPADCALL |x| F (QREFELT $ 36)) |y|
                                            (QREFELT $ 16))
                                           . #4#)
                                     (QCDR #2#)
                                   (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            "failed")
                                                   #2#))
                                 . #4#)
                           (GO #5=#:G955)))))))
                #5# (EXIT #1#)))) 

(SDEFUN |PRS;Lazard3|
        ((V |Vector| |polR|) (|x| R) (|y| R) (|n| |NonNegativeInteger|)
         ($ |Vector| |polR|))
        (SPROG ((#1=#:G957 NIL))
               (SEQ
                (COND ((ZEROP |n|) (|error| "Lazard3$prs : n = 0"))
                      ((EQL |n| 1) V)
                      ('T
                       (SEQ
                        (LETT |x|
                              (SPADCALL |x| |y|
                                        (PROG1
                                            (LETT #1# (- |n| 1)
                                                  . #2=(|PRS;Lazard3|))
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 39))
                              . #2#)
                        (EXIT (|PRS;exquo| (|PRS;*| |x| V $) |y| $)))))))) 

(SDEFUN |PRS;next_sousResultant2;3polRRpolR;11|
        ((P |polR|) (Q |polR|) (Z |polR|) (|s| R) ($ |polR|))
        (SPROG
         ((#1=#:G974 NIL) (A (|polR|)) (#2=#:G964 NIL) (H (|polR|))
          (#3=#:G975 NIL) (|i| NIL) (|#G64| (|polR|)) (|#G63| (|polR|))
          (|#G62| (|polR|)) (|e| #4=(|NonNegativeInteger|)) (|d| #4#)
          (|#G61| #4#) (|#G60| #4#) (|se| (R)) (|c| (R)) (|lcP| (R))
          (|#G59| (R)) (|#G58| (R)) (|#G57| (R)))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G57| (SPADCALL P (QREFELT $ 19))
                   . #5=(|PRS;next_sousResultant2;3polRRpolR;11|))
             (LETT |#G58| (SPADCALL Q (QREFELT $ 19)) . #5#)
             (LETT |#G59| (SPADCALL Z (QREFELT $ 19)) . #5#)
             (LETT |lcP| |#G57| . #5#)
             (LETT |c| |#G58| . #5#)
             (LETT |se| |#G59| . #5#))
            (PROGN
             (LETT |#G60| (SPADCALL P (QREFELT $ 20)) . #5#)
             (LETT |#G61| (SPADCALL Q (QREFELT $ 20)) . #5#)
             (LETT |d| |#G60| . #5#)
             (LETT |e| |#G61| . #5#))
            (PROGN
             (LETT |#G62| (SPADCALL P (QREFELT $ 23)) . #5#)
             (LETT |#G63| (SPADCALL Q (QREFELT $ 23)) . #5#)
             (LETT |#G64| (SPADCALL (SPADCALL Z (QREFELT $ 23)) (QREFELT $ 41))
                   . #5#)
             (LETT P |#G62| . #5#)
             (LETT Q |#G63| . #5#)
             (LETT H |#G64| . #5#))
            (LETT A (SPADCALL (SPADCALL P |e| (QREFELT $ 42)) H (QREFELT $ 36))
                  . #5#)
            (SEQ (LETT |i| (+ |e| 1) . #5#) (LETT #3# (- |d| 1) . #5#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (LETT H
                        (COND
                         ((EQL (SPADCALL H (QREFELT $ 20)) (- |e| 1))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 11) (SPADCALL H (QREFELT $ 23))
                                     (QREFELT $ 26))
                           (PROG2
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL H (QREFELT $ 19)) Q
                                                (QREFELT $ 36))
                                      |c| (QREFELT $ 16))
                                     . #5#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                             (|Union| (QREFELT $ 7)
                                                      #6="failed")
                                             #2#))
                           (QREFELT $ 27)))
                         ('T (SPADCALL (QREFELT $ 11) H (QREFELT $ 26))))
                        . #5#)
                  (EXIT
                   (LETT A
                         (SPADCALL
                          (SPADCALL (SPADCALL P |i| (QREFELT $ 42)) H
                                    (QREFELT $ 36))
                          A (QREFELT $ 25))
                         . #5#)))
                 (LETT |i| (+ |i| 1) . #5#) (GO G190) G191 (EXIT NIL))
            (SEQ G190
                 (COND ((NULL (>= (SPADCALL P (QREFELT $ 20)) |e|)) (GO G191)))
                 (SEQ (EXIT (LETT P (SPADCALL P (QREFELT $ 23)) . #5#))) NIL
                 (GO G190) G191 (EXIT NIL))
            (LETT A
                  (SPADCALL A (SPADCALL |se| P (QREFELT $ 36)) (QREFELT $ 25))
                  . #5#)
            (LETT A
                  (PROG2 (LETT #2# (SPADCALL A |lcP| (QREFELT $ 16)) . #5#)
                      (QCDR #2#)
                    (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) #6#) #2#))
                  . #5#)
            (LETT A
                  (COND
                   ((EQL (SPADCALL H (QREFELT $ 20)) (- |e| 1))
                    (SPADCALL
                     (SPADCALL |c|
                               (SPADCALL
                                (SPADCALL (QREFELT $ 11)
                                          (SPADCALL H (QREFELT $ 23))
                                          (QREFELT $ 26))
                                A (QREFELT $ 25))
                               (QREFELT $ 36))
                     (SPADCALL (SPADCALL H (QREFELT $ 19)) Q (QREFELT $ 36))
                     (QREFELT $ 27)))
                   (#7='T
                    (SPADCALL |c|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 11) H (QREFELT $ 26)) A
                               (QREFELT $ 25))
                              (QREFELT $ 36))))
                  . #5#)
            (LETT A
                  (PROG2 (LETT #2# (SPADCALL A |s| (QREFELT $ 16)) . #5#)
                      (QCDR #2#)
                    (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) #6#) #2#))
                  . #5#)
            (EXIT
             (PROGN
              (LETT #1#
                    (COND ((ODDP (- |d| |e|)) A)
                          (#7# (SPADCALL A (QREFELT $ 41))))
                    . #5#)
              (GO #8=#:G973)))))
          #8# (EXIT #1#)))) 

(SDEFUN |PRS;next_sousResultant3|
        ((VP |Vector| |polR|) (VQ |Vector| |polR|) (|s| R) (|ss| R)
         ($ |Vector| |polR|))
        (SPROG
         ((#1=#:G993 NIL) (#2=#:G980 NIL) (#3=#:G994 NIL) (|i| NIL)
          (|divid| (|Record| (|:| |quotient| |polR|) (|:| |remainder| |polR|)))
          (|rr| (R)) (|r| (R)) (|#G75| (R)) (|#G74| (R)) (#4=#:G976 NIL)
          (|delta| (|Integer|)) (|e| (|NonNegativeInteger|)) (|c| (R))
          (|lcP| (R)) (|#G73| (R)) (|#G72| (R)) (Q (|polR|)) (P (|polR|))
          (|#G71| (|polR|)) (|#G70| (|polR|)))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G70| (SPADCALL VP 1 (QREFELT $ 45))
                   . #5=(|PRS;next_sousResultant3|))
             (LETT |#G71| (SPADCALL VQ 1 (QREFELT $ 45)) . #5#)
             (LETT P |#G70| . #5#)
             (LETT Q |#G71| . #5#))
            (PROGN
             (LETT |#G72| (SPADCALL P (QREFELT $ 19)) . #5#)
             (LETT |#G73| (SPADCALL Q (QREFELT $ 19)) . #5#)
             (LETT |lcP| |#G72| . #5#)
             (LETT |c| |#G73| . #5#))
            (LETT |e| (SPADCALL Q (QREFELT $ 20)) . #5#)
            (SEQ (LETT |delta| (- (SPADCALL P (QREFELT $ 20)) |e|) . #5#)
                 (EXIT
                  (COND
                   ((EQL |delta| 1)
                    (SEQ
                     (LETT VP
                           (SPADCALL (|PRS;*| |c| VP $)
                                     (|PRS;*| (SPADCALL P |e| (QREFELT $ 42))
                                      VQ $)
                                     (QREFELT $ 46))
                           . #5#)
                     (LETT VP (|PRS;exquo| VP |lcP| $) . #5#)
                     (LETT VP
                           (SPADCALL
                            (|PRS;*| |c|
                             (SPADCALL VP
                                       (SPADCALL (QREFELT $ 11) VQ
                                                 (QREFELT $ 14))
                                       (QREFELT $ 46))
                             $)
                            (|PRS;*|
                             (SPADCALL Q
                                       (PROG1 (LETT #4# (- |e| 1) . #5#)
                                         (|check_subtype2| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #4#))
                                       (QREFELT $ 42))
                             VQ $)
                            (QREFELT $ 47))
                           . #5#)
                     (EXIT (LETT VP (|PRS;exquo| VP |s| $) . #5#))))
                   (#6='T
                    (SEQ
                     (PROGN
                      (LETT |#G74| (SPADCALL |s| |lcP| (QREFELT $ 34)) . #5#)
                      (LETT |#G75| (SPADCALL |ss| |c| (QREFELT $ 34)) . #5#)
                      (LETT |r| |#G74| . #5#)
                      (LETT |rr| |#G75| . #5#))
                     (LETT |divid|
                           (SPADCALL (SPADCALL |rr| P (QREFELT $ 36)) Q
                                     (QREFELT $ 29))
                           . #5#)
                     (SPADCALL VP 1
                               (PROG2
                                   (LETT #2#
                                         (SPADCALL (QCDR |divid|) |r|
                                                   (QREFELT $ 16))
                                         . #5#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7)
                                                          #7="failed")
                                                 #2#))
                               (QREFELT $ 48))
                     (EXIT
                      (SEQ (LETT |i| 2 . #5#) (LETT #3# (QVSIZE VP) . #5#) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (SPADCALL VP |i|
                                      (SPADCALL
                                       (SPADCALL |rr|
                                                 (SPADCALL VP |i|
                                                           (QREFELT $ 45))
                                                 (QREFELT $ 36))
                                       (SPADCALL
                                        (SPADCALL VQ |i| (QREFELT $ 45))
                                        (QCAR |divid|) (QREFELT $ 26))
                                       (QREFELT $ 27))
                                      (QREFELT $ 48))
                            (EXIT
                             (SPADCALL VP |i|
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL
                                                  (SPADCALL VP |i|
                                                            (QREFELT $ 45))
                                                  |r| (QREFELT $ 16))
                                                 . #5#)
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #7#)
                                                         #2#))
                                       (QREFELT $ 48))))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))))))))
            (EXIT
             (PROGN
              (LETT #1#
                    (COND ((ODDP |delta|) VP)
                          (#6# (SPADCALL VP (QREFELT $ 49))))
                    . #5#)
              (GO #8=#:G992)))))
          #8# (EXIT #1#)))) 

(SDEFUN |PRS;algo_new| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|s| (R)) (|#G82| (|polR|)) (|#G81| (|polR|)) (#1=#:G1003 NIL)
          (Z (|polR|)) (|delta| (|NonNegativeInteger|)) (#2=#:G996 NIL)
          (|#G80| (|polR|)) (|#G79| (|polR|)) (#3=#:G995 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |delta|
                  (PROG1
                      (LETT #3#
                            (- (SPADCALL P (QREFELT $ 20))
                               (SPADCALL Q (QREFELT $ 20)))
                            . #4=(|PRS;algo_new|))
                    (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #3#))
                  . #4#)
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 19)) |delta| (QREFELT $ 33))
                  . #4#)
            (PROGN
             (LETT |#G79| Q . #4#)
             (LETT |#G80|
                   (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 50))
                   . #4#)
             (LETT P |#G79| . #4#)
             (LETT Q |#G80| . #4#))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 31))
                      (PROGN
                       (LETT #1# (|spadConstant| $ 21) . #4#)
                       (GO #5=#:G1002)))
                     ('T
                      (SEQ
                       (LETT |delta|
                             (PROG1
                                 (LETT #2#
                                       (- (SPADCALL P (QREFELT $ 20))
                                          (SPADCALL Q (QREFELT $ 20)))
                                       . #4#)
                               (|check_subtype2| (>= #2# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #2#))
                             . #4#)
                       (LETT Z
                             (SPADCALL Q (SPADCALL Q (QREFELT $ 19)) |s|
                                       |delta| (QREFELT $ 40))
                             . #4#)
                       (EXIT
                        (COND
                         ((ZEROP (SPADCALL Z (QREFELT $ 20)))
                          (PROGN
                           (LETT #1# (SPADCALL Z (QREFELT $ 19)) . #4#)
                           (GO #5#)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G81| Q . #4#)
                            (LETT |#G82| (SPADCALL P Q Z |s| (QREFELT $ 43))
                                  . #4#)
                            (LETT P |#G81| . #4#)
                            (LETT Q |#G82| . #4#))
                           (EXIT
                            (LETT |s| (SPADCALL Z (QREFELT $ 19))
                                  . #4#)))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;resultant;2polRR;14| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|degQ| #1=(|NonNegativeInteger|)) (|degP| #1#) (|#G90| #1#)
          (|#G89| #1#) (|#G88| (|polR|)) (|#G87| (|polR|)) (|#G86| #1#)
          (|#G85| #1#))
         (SEQ
          (COND
           ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
            (|spadConstant| $ 21))
           ('T
            (SEQ
             (PROGN
              (LETT |#G85| (SPADCALL P (QREFELT $ 20))
                    . #2=(|PRS;resultant;2polRR;14|))
              (LETT |#G86| (SPADCALL Q (QREFELT $ 20)) . #2#)
              (LETT |degP| |#G85| . #2#)
              (LETT |degQ| |#G86| . #2#))
             (COND
              ((< |degP| |degQ|)
               (SEQ
                (PROGN
                 (LETT |#G87| Q . #2#)
                 (LETT |#G88| P . #2#)
                 (LETT P |#G87| . #2#)
                 (LETT Q |#G88| . #2#))
                (PROGN
                 (LETT |#G89| |degQ| . #2#)
                 (LETT |#G90| |degP| . #2#)
                 (LETT |degP| |#G89| . #2#)
                 (LETT |degQ| |#G90| . #2#))
                (EXIT
                 (COND
                  ((ODDP |degP|)
                   (COND
                    ((ODDP |degQ|)
                     (LETT Q (SPADCALL Q (QREFELT $ 41)) . #2#)))))))))
             (EXIT
              (COND
               ((ZEROP |degQ|)
                (SPADCALL (SPADCALL Q (QREFELT $ 19)) |degP| (QREFELT $ 51)))
               ('T (|PRS;resultant_naif| P Q $)))))))))) 

(SDEFUN |PRS;resultant;2polRR;15| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((|degQ| #1=(|NonNegativeInteger|)) (|degP| #1#) (|#G98| #1#)
          (|#G97| #1#) (|#G96| (|polR|)) (|#G95| (|polR|)) (|#G94| #1#)
          (|#G93| #1#))
         (SEQ
          (COND
           ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
            (|spadConstant| $ 21))
           ('T
            (SEQ
             (PROGN
              (LETT |#G93| (SPADCALL P (QREFELT $ 20))
                    . #2=(|PRS;resultant;2polRR;15|))
              (LETT |#G94| (SPADCALL Q (QREFELT $ 20)) . #2#)
              (LETT |degP| |#G93| . #2#)
              (LETT |degQ| |#G94| . #2#))
             (COND
              ((< |degP| |degQ|)
               (SEQ
                (PROGN
                 (LETT |#G95| Q . #2#)
                 (LETT |#G96| P . #2#)
                 (LETT P |#G95| . #2#)
                 (LETT Q |#G96| . #2#))
                (PROGN
                 (LETT |#G97| |degQ| . #2#)
                 (LETT |#G98| |degP| . #2#)
                 (LETT |degP| |#G97| . #2#)
                 (LETT |degQ| |#G98| . #2#))
                (EXIT
                 (COND
                  ((ODDP |degP|)
                   (COND
                    ((ODDP |degQ|)
                     (LETT Q (SPADCALL Q (QREFELT $ 41)) . #2#)))))))))
             (EXIT
              (COND
               ((ZEROP |degQ|)
                (SPADCALL (SPADCALL Q (QREFELT $ 19)) |degP| (QREFELT $ 33)))
               ('T (|PRS;algo_new| P Q $)))))))))) 

(SDEFUN |PRS;subResultantEuclidean|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G104| (|Vector| |polR|)) (|#G103| #1#) (|ss| (R)) (#2=#:G1027 NIL)
          (|l| (|Vector| |polR|)) (|delta| (|NonNegativeInteger|))
          (#3=#:G1019 NIL) (|degQ| (|NonNegativeInteger|)) (|#G102| (|polR|))
          (|#G101| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1017 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 19))
                            (PROG1
                                (LETT #4#
                                      (- (SPADCALL P (QREFELT $ 20))
                                         (SPADCALL Q (QREFELT $ 20)))
                                      . #5=(|PRS;subResultantEuclidean|))
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#))
                            (QREFELT $ 33))
                  . #5#)
            (LETT VP (VECTOR Q (|spadConstant| $ 22) (|spadConstant| $ 35))
                  . #5#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 54))
                  . #5#)
            (LETT VQ
                  (VECTOR (QVELT |pdiv| 2)
                          (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                          (QVELT |pdiv| 1))
                  . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G101| (SPADCALL VP 1 (QREFELT $ 45)) . #5#)
                    (LETT |#G102| (SPADCALL VQ 1 (QREFELT $ 45)) . #5#)
                    (LETT P |#G101| . #5#)
                    (LETT Q |#G102| . #5#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 31))
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 22)
                                     (|spadConstant| $ 22)
                                     (|spadConstant| $ 21))
                             . #5#)
                       (GO #6=#:G1026)))
                     ('T
                      (SEQ (LETT |degQ| (SPADCALL Q (QREFELT $ 20)) . #5#)
                           (LETT |delta|
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 20))
                                              |degQ|)
                                           . #5#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 . #5#)
                           (EXIT
                            (COND
                             ((ZEROP |degQ|)
                              (SEQ
                               (LETT |l|
                                     (|PRS;Lazard3| VQ
                                      (SPADCALL Q (QREFELT $ 19)) |s| |delta|
                                      $)
                                     . #5#)
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (SPADCALL |l| 2 (QREFELT $ 45))
                                               (SPADCALL |l| 3 (QREFELT $ 45))
                                               (SPADCALL
                                                (SPADCALL |l| 1 (QREFELT $ 45))
                                                (QREFELT $ 19)))
                                       . #5#)
                                 (GO #6#)))))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL Q (QREFELT $ 19)) |s|
                                               |delta| (QREFELT $ 39))
                                     . #5#)
                               (PROGN
                                (LETT |#G103| VQ . #5#)
                                (LETT |#G104|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #5#)
                                (LETT VP |#G103| . #5#)
                                (LETT VQ |#G104| . #5#))
                               (EXIT (LETT |s| |ss| . #5#)))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;resultantEuclidean;2polRR;17|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (#1=#:G1033 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|e| (|Integer|)) (|degQ| #2=(|NonNegativeInteger|)) (|degP| #2#)
          (|#G108| #2#) (|#G107| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT $ 31)) (SPADCALL Q (QREFELT $ 31)))
            (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                    (|spadConstant| $ 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G107| (SPADCALL P (QREFELT $ 20))
                    . #3=(|PRS;resultantEuclidean;2polRR;17|))
              (LETT |#G108| (SPADCALL Q (QREFELT $ 20)) . #3#)
              (LETT |degP| |#G107| . #3#)
              (LETT |degQ| |#G108| . #3#))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP |degP|) (COND ((ODDP |degQ|) -1) (#4='T 1)))
                        (#4# 1))
                       . #3#)
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT $ 55))
                                 (QREFELT $ 57))
                       . #3#)
                 (EXIT
                  (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 55))
                          (QVELT |l| 0) (QVELT |l| 2)))))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "resultantEuclidean$PRS : constant polynomials"))
                 (#4#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                   (PROG1 (LETT #1# (- |degP| 1) . #3#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 51))
                         . #3#)
                   (EXIT
                    (VECTOR (|spadConstant| $ 22) (SPADCALL |s| (QREFELT $ 12))
                            (SPADCALL |s| (SPADCALL Q (QREFELT $ 19))
                                      (QREFELT $ 34))))))))
               (#4# (|PRS;resultantEuclidean_naif| P Q $)))))))))) 

(SDEFUN |PRS;resultantEuclidean;2polRR;18|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (#1=#:G1045 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|e| (|Integer|)) (|degQ| #2=(|NonNegativeInteger|)) (|degP| #2#)
          (|#G112| #2#) (|#G111| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT $ 31)) (SPADCALL Q (QREFELT $ 31)))
            (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                    (|spadConstant| $ 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G111| (SPADCALL P (QREFELT $ 20))
                    . #3=(|PRS;resultantEuclidean;2polRR;18|))
              (LETT |#G112| (SPADCALL Q (QREFELT $ 20)) . #3#)
              (LETT |degP| |#G111| . #3#)
              (LETT |degQ| |#G112| . #3#))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP |degP|) (COND ((ODDP |degQ|) -1) (#4='T 1)))
                        (#4# 1))
                       . #3#)
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT $ 55))
                                 (QREFELT $ 57))
                       . #3#)
                 (EXIT
                  (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 55))
                          (QVELT |l| 0) (QVELT |l| 2)))))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "resultantEuclidean$PRS : constant polynomials"))
                 (#4#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                   (PROG1 (LETT #1# (- |degP| 1) . #3#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 33))
                         . #3#)
                   (EXIT
                    (VECTOR (|spadConstant| $ 22) (SPADCALL |s| (QREFELT $ 12))
                            (SPADCALL |s| (SPADCALL Q (QREFELT $ 19))
                                      (QREFELT $ 34))))))))
               (#4# (|PRS;subResultantEuclidean| P Q $)))))))))) 

(SDEFUN |PRS;semiSubResultantEuclidean|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G118| (|Vector| |polR|)) (|#G117| #1#) (|ss| (R)) (#2=#:G1062 NIL)
          (|l| (|Vector| |polR|)) (|delta| (|NonNegativeInteger|))
          (#3=#:G1054 NIL) (|degQ| (|NonNegativeInteger|)) (|#G116| (|polR|))
          (|#G115| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1052 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 19))
                            (PROG1
                                (LETT #4#
                                      (- (SPADCALL P (QREFELT $ 20))
                                         (SPADCALL Q (QREFELT $ 20)))
                                      . #5=(|PRS;semiSubResultantEuclidean|))
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#))
                            (QREFELT $ 33))
                  . #5#)
            (LETT VP (VECTOR Q (|spadConstant| $ 35)) . #5#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 54))
                  . #5#)
            (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #5#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G115| (SPADCALL VP 1 (QREFELT $ 45)) . #5#)
                    (LETT |#G116| (SPADCALL VQ 1 (QREFELT $ 45)) . #5#)
                    (LETT P |#G115| . #5#)
                    (LETT Q |#G116| . #5#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 31))
                      (PROGN
                       (LETT #2#
                             (CONS (|spadConstant| $ 22) (|spadConstant| $ 21))
                             . #5#)
                       (GO #6=#:G1061)))
                     ('T
                      (SEQ (LETT |degQ| (SPADCALL Q (QREFELT $ 20)) . #5#)
                           (LETT |delta|
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 20))
                                              |degQ|)
                                           . #5#)
                                   (|check_subtype2| (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                 . #5#)
                           (COND
                            ((ZEROP |degQ|)
                             (SEQ
                              (LETT |l|
                                    (|PRS;Lazard3| VQ
                                     (SPADCALL Q (QREFELT $ 19)) |s| |delta| $)
                                    . #5#)
                              (EXIT
                               (PROGN
                                (LETT #2#
                                      (CONS (SPADCALL |l| 2 (QREFELT $ 45))
                                            (SPADCALL
                                             (SPADCALL |l| 1 (QREFELT $ 45))
                                             (QREFELT $ 19)))
                                      . #5#)
                                (GO #6#))))))
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 19)) |s|
                                           |delta| (QREFELT $ 39))
                                 . #5#)
                           (PROGN
                            (LETT |#G117| VQ . #5#)
                            (LETT |#G118|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #5#)
                            (LETT VP |#G117| . #5#)
                            (LETT VQ |#G118| . #5#))
                           (EXIT (LETT |s| |ss| . #5#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;semiResultantEuclidean2;2polRR;20|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (#1=#:G1065 NIL) (|degQ| #2=(|NonNegativeInteger|))
          (|degP| #2#) (|#G122| #2#) (|#G121| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT $ 31)) (SPADCALL Q (QREFELT $ 31)))
            (CONS (|spadConstant| $ 22) (|spadConstant| $ 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G121| (SPADCALL P (QREFELT $ 20))
                    . #3=(|PRS;semiResultantEuclidean2;2polRR;20|))
              (LETT |#G122| (SPADCALL Q (QREFELT $ 20)) . #3#)
              (LETT |degP| |#G121| . #3#)
              (LETT |degQ| |#G122| . #3#))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (|error| "semiResultantEuclidean2 : bad degrees"))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "semiResultantEuclidean2 : constant polynomials"))
                 (#4='T
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                   (PROG1 (LETT #1# (- |degP| 1) . #3#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 51))
                         . #3#)
                   (EXIT
                    (CONS (SPADCALL |s| (QREFELT $ 12))
                          (SPADCALL |s| (SPADCALL Q (QREFELT $ 19))
                                    (QREFELT $ 34))))))))
               (#4# (|PRS;semiResultantEuclidean_naif| P Q $)))))))))) 

(SDEFUN |PRS;semiResultantEuclidean2;2polRR;21|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|s| (R)) (#1=#:G1075 NIL) (|degQ| #2=(|NonNegativeInteger|))
          (|degP| #2#) (|#G126| #2#) (|#G125| #2#))
         (SEQ
          (COND
           ((OR (SPADCALL P (QREFELT $ 31)) (SPADCALL Q (QREFELT $ 31)))
            (CONS (|spadConstant| $ 22) (|spadConstant| $ 21)))
           ('T
            (SEQ
             (PROGN
              (LETT |#G125| (SPADCALL P (QREFELT $ 20))
                    . #3=(|PRS;semiResultantEuclidean2;2polRR;21|))
              (LETT |#G126| (SPADCALL Q (QREFELT $ 20)) . #3#)
              (LETT |degP| |#G125| . #3#)
              (LETT |degQ| |#G126| . #3#))
             (EXIT
              (COND
               ((< |degP| |degQ|)
                (|error| "semiResultantEuclidean2 : bad degrees"))
               ((ZEROP |degQ|)
                (COND
                 ((ZEROP |degP|)
                  (|error| "semiResultantEuclidean2 : constant polynomials"))
                 (#4='T
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                   (PROG1 (LETT #1# (- |degP| 1) . #3#)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 33))
                         . #3#)
                   (EXIT
                    (CONS (SPADCALL |s| (QREFELT $ 12))
                          (SPADCALL |s| (SPADCALL Q (QREFELT $ 19))
                                    (QREFELT $ 34))))))))
               (#4# (|PRS;semiSubResultantEuclidean| P Q $)))))))))) 

(SDEFUN |PRS;semiResultantEuclidean1;2polRR;22|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |resultant| R)))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R))))
         (SEQ
          (LETT |result| (SPADCALL P Q (QREFELT $ 57))
                |PRS;semiResultantEuclidean1;2polRR;22|)
          (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;indiceSubResultant;2polRNnipolR;23|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G139| (|polR|)) (|#G138| (|polR|)) (#1=#:G1107 NIL)
          (Z (|polR|)) (#2=#:G1099 NIL) (|degQ| #3=(|NonNegativeInteger|))
          (|degP| #3#) (|#G137| #3#) (|#G136| #3#) (|#G135| (|polR|))
          (|#G134| (|polR|)) (#4=#:G1097 NIL) (#5=#:G1092 NIL)
          (|delta| (|NonNegativeInteger|)) (#6=#:G1090 NIL) (|#G133| (|polR|))
          (|#G132| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (|spadConstant| $ 22))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (PROGN
                  (LETT |#G132| Q
                        . #7=(|PRS;indiceSubResultant;2polRNnipolR;23|))
                  (LETT |#G133| P . #7#)
                  (LETT P |#G132| . #7#)
                  (LETT Q |#G133| . #7#))
                 (EXIT
                  (COND
                   ((ODDP (- (SPADCALL P (QREFELT $ 20)) |i|))
                    (COND
                     ((ODDP (- (SPADCALL Q (QREFELT $ 20)) |i|))
                      (LETT Q (SPADCALL Q (QREFELT $ 41)) . #7#)))))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #6#
                                 (- (SPADCALL P (QREFELT $ 20))
                                    (SPADCALL Q (QREFELT $ 20)))
                                 . #7#)
                         (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #6#))
                       . #7#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultant$PRS : bad degrees"))
                   (#8='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                     (PROG1 (LETT #5# (- |delta| 1) . #7#)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 33))
                           . #7#)
                     (EXIT
                      (PROGN
                       (LETT #1# (SPADCALL |s| Q (QREFELT $ 36)) . #7#)
                       (GO #9=#:G1106))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 20)) (QREFELT $ 62))
                 (|spadConstant| $ 22))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                  (PROG1
                                      (LETT #4#
                                            (- (SPADCALL P (QREFELT $ 20))
                                               (SPADCALL Q (QREFELT $ 20)))
                                            . #7#)
                                    (|check_subtype2| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#))
                                  (QREFELT $ 33))
                        . #7#)
                  (PROGN
                   (LETT |#G134| Q . #7#)
                   (LETT |#G135|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                   (QREFELT $ 50))
                         . #7#)
                   (LETT P |#G134| . #7#)
                   (LETT Q |#G135| . #7#))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G136| (SPADCALL P (QREFELT $ 20)) . #7#)
                          (LETT |#G137| (SPADCALL Q (QREFELT $ 20)) . #7#)
                          (LETT |degP| |#G136| . #7#)
                          (LETT |degQ| |#G137| . #7#))
                         (EXIT
                          (COND
                           ((EQL |i| (- |degP| 1))
                            (PROGN (LETT #1# Q . #7#) (GO #9#)))
                           ((OR (SPADCALL Q (QREFELT $ 31))
                                (SPADCALL |i| |degQ| (QREFELT $ 62)))
                            (PROGN
                             (LETT #1# (|spadConstant| $ 22) . #7#)
                             (GO #9#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 19)) |s|
                                             (PROG1
                                                 (LETT #2# (- |degP| |degQ|)
                                                       . #7#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 40))
                                   . #7#)
                             (EXIT
                              (COND
                               ((EQL |i| |degQ|)
                                (PROGN (LETT #1# Z . #7#) (GO #9#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G138| Q . #7#)
                                  (LETT |#G139|
                                        (SPADCALL P Q Z |s| (QREFELT $ 43))
                                        . #7#)
                                  (LETT P |#G138| . #7#)
                                  (LETT Q |#G139| . #7#))
                                 (EXIT
                                  (LETT |s| (SPADCALL Z (QREFELT $ 19))
                                        . #7#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |PRS;indiceSubResultantEuclidean;2polRNniR;24|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G152| (|Vector| |polR|)) (|#G151| #1#) (|ss| (R)) (#2=#:G1133 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G1124 NIL)
          (|degQ| #4=(|NonNegativeInteger|)) (|degP| #4#) (|#G150| #4#)
          (|#G149| #4#) (|#G148| (|polR|)) (|#G147| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#5=#:G1122 NIL) (#6=#:G1117 NIL) (|delta| (|NonNegativeInteger|))
          (#7=#:G1115 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|)))
          (|e| (R)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                     (|spadConstant| $ 22)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |e|
                       (COND
                        ((ODDP (- (SPADCALL P (QREFELT $ 20)) |i|))
                         (COND
                          ((ODDP (- (SPADCALL Q (QREFELT $ 20)) |i|))
                           (SPADCALL (|spadConstant| $ 8) (QREFELT $ 32)))
                          (#8='T (|spadConstant| $ 8))))
                        (#8# (|spadConstant| $ 8)))
                       . #9=(|PRS;indiceSubResultantEuclidean;2polRNniR;24|))
                 (LETT |l|
                       (SPADCALL Q (SPADCALL |e| P (QREFELT $ 36)) |i|
                                 (QREFELT $ 65))
                       . #9#)
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 36))
                                 (QVELT |l| 0) (QVELT |l| 2))
                         . #9#)
                   (GO #10=#:G1132))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #7#
                                 (- (SPADCALL P (QREFELT $ 20))
                                    (SPADCALL Q (QREFELT $ 20)))
                                 . #9#)
                         (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #7#))
                       . #9#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "indiceSubResultantEuclidean$PRS : bad degrees"))
                   (#8#
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                     (PROG1 (LETT #6# (- |delta| 1) . #9#)
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #6#))
                                     (QREFELT $ 33))
                           . #9#)
                     (EXIT
                      (PROGN
                       (LETT #2#
                             (VECTOR (|spadConstant| $ 22)
                                     (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 36)))
                             . #9#)
                       (GO #10#))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 20)) (QREFELT $ 62))
                 (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                         (|spadConstant| $ 22)))
                (#8#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                  (PROG1
                                      (LETT #5#
                                            (- (SPADCALL P (QREFELT $ 20))
                                               (SPADCALL Q (QREFELT $ 20)))
                                            . #9#)
                                    (|check_subtype2| (>= #5# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #5#))
                                  (QREFELT $ 33))
                        . #9#)
                  (LETT VP
                        (VECTOR Q (|spadConstant| $ 22) (|spadConstant| $ 35))
                        . #9#)
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 54))
                        . #9#)
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                                (QVELT |pdiv| 1))
                        . #9#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G147| (SPADCALL VP 1 (QREFELT $ 45)) . #9#)
                          (LETT |#G148| (SPADCALL VQ 1 (QREFELT $ 45)) . #9#)
                          (LETT P |#G147| . #9#)
                          (LETT Q |#G148| . #9#))
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT $ 31))
                            (PROGN
                             (LETT #2#
                                   (VECTOR (|spadConstant| $ 22)
                                           (|spadConstant| $ 22)
                                           (|spadConstant| $ 22))
                                   . #9#)
                             (GO #10#)))
                           ('T
                            (SEQ
                             (PROGN
                              (LETT |#G149| (SPADCALL P (QREFELT $ 20)) . #9#)
                              (LETT |#G150| (SPADCALL Q (QREFELT $ 20)) . #9#)
                              (LETT |degP| |#G149| . #9#)
                              (LETT |degQ| |#G150| . #9#))
                             (EXIT
                              (COND
                               ((EQL |i| (- |degP| 1))
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (SPADCALL VQ 2 (QREFELT $ 45))
                                               (SPADCALL VQ 3 (QREFELT $ 45))
                                               (SPADCALL VQ 1 (QREFELT $ 45)))
                                       . #9#)
                                 (GO #10#)))
                               ((SPADCALL |i| |degQ| (QREFELT $ 62))
                                (PROGN
                                 (LETT #2#
                                       (VECTOR (|spadConstant| $ 22)
                                               (|spadConstant| $ 22)
                                               (|spadConstant| $ 22))
                                       . #9#)
                                 (GO #10#)))
                               ('T
                                (SEQ
                                 (LETT VZ
                                       (|PRS;Lazard3| VQ
                                        (SPADCALL Q (QREFELT $ 19)) |s|
                                        (PROG1
                                            (LETT #3# (- |degP| |degQ|) . #9#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        $)
                                       . #9#)
                                 (EXIT
                                  (COND
                                   ((EQL |i| |degQ|)
                                    (PROGN
                                     (LETT #2#
                                           (VECTOR
                                            (SPADCALL VZ 2 (QREFELT $ 45))
                                            (SPADCALL VZ 3 (QREFELT $ 45))
                                            (SPADCALL VZ 1 (QREFELT $ 45)))
                                           . #9#)
                                     (GO #10#)))
                                   ('T
                                    (SEQ
                                     (LETT |ss|
                                           (SPADCALL
                                            (SPADCALL VZ 1 (QREFELT $ 45))
                                            (QREFELT $ 19))
                                           . #9#)
                                     (PROGN
                                      (LETT |#G151| VQ . #9#)
                                      (LETT |#G152|
                                            (|PRS;next_sousResultant3| VP VQ
                                             |s| |ss| $)
                                            . #9#)
                                      (LETT VP |#G151| . #9#)
                                      (LETT VQ |#G152| . #9#))
                                     (EXIT (LETT |s| |ss| . #9#)))))))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |PRS;semiIndiceSubResultantEuclidean;2polRNniR;25|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G161| (|Vector| |polR|)) (|#G160| #1#) (|ss| (R)) (#2=#:G1157 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G1146 NIL)
          (|degQ| #4=(|NonNegativeInteger|)) (|degP| #4#) (|#G159| #4#)
          (|#G158| #4#) (|#G157| (|polR|)) (|#G156| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#5=#:G1144 NIL) (#6=#:G1139 NIL) (|delta| (|NonNegativeInteger|))
          (#7=#:G1137 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (CONS (|spadConstant| $ 22) (|spadConstant| $ 22)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
               (|error| "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
              (#8='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #7#
                                   (- (SPADCALL P (QREFELT $ 20))
                                      (SPADCALL Q (QREFELT $ 20)))
                                   . #9=(|PRS;semiIndiceSubResultantEuclidean;2polRNniR;25|))
                           (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #7#))
                         . #9#)
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
                     (#8#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                       (PROG1 (LETT #6# (- |delta| 1) . #9#)
                                         (|check_subtype2| (>= #6# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #6#))
                                       (QREFELT $ 33))
                             . #9#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 36)))
                               . #9#)
                         (GO #10=#:G1156))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |i| (SPADCALL Q (QREFELT $ 20)) (QREFELT $ 62))
                   (CONS (|spadConstant| $ 22) (|spadConstant| $ 22)))
                  (#8#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                    (PROG1
                                        (LETT #5#
                                              (- (SPADCALL P (QREFELT $ 20))
                                                 (SPADCALL Q (QREFELT $ 20)))
                                              . #9#)
                                      (|check_subtype2| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #5#))
                                    (QREFELT $ 33))
                          . #9#)
                    (LETT VP (VECTOR Q (|spadConstant| $ 35)) . #9#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                    (QREFELT $ 54))
                          . #9#)
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #9#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G156| (SPADCALL VP 1 (QREFELT $ 45)) . #9#)
                            (LETT |#G157| (SPADCALL VQ 1 (QREFELT $ 45)) . #9#)
                            (LETT P |#G156| . #9#)
                            (LETT Q |#G157| . #9#))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT $ 31))
                              (PROGN
                               (LETT #2#
                                     (CONS (|spadConstant| $ 22)
                                           (|spadConstant| $ 22))
                                     . #9#)
                               (GO #10#)))
                             ('T
                              (SEQ
                               (PROGN
                                (LETT |#G158| (SPADCALL P (QREFELT $ 20))
                                      . #9#)
                                (LETT |#G159| (SPADCALL Q (QREFELT $ 20))
                                      . #9#)
                                (LETT |degP| |#G158| . #9#)
                                (LETT |degQ| |#G159| . #9#))
                               (EXIT
                                (COND
                                 ((EQL |i| (- |degP| 1))
                                  (PROGN
                                   (LETT #2#
                                         (CONS (SPADCALL VQ 2 (QREFELT $ 45))
                                               (SPADCALL VQ 1 (QREFELT $ 45)))
                                         . #9#)
                                   (GO #10#)))
                                 ((SPADCALL |i| |degQ| (QREFELT $ 62))
                                  (PROGN
                                   (LETT #2#
                                         (CONS (|spadConstant| $ 22)
                                               (|spadConstant| $ 22))
                                         . #9#)
                                   (GO #10#)))
                                 ('T
                                  (SEQ
                                   (LETT VZ
                                         (|PRS;Lazard3| VQ
                                          (SPADCALL Q (QREFELT $ 19)) |s|
                                          (PROG1
                                              (LETT #3# (- |degP| |degQ|)
                                                    . #9#)
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#))
                                          $)
                                         . #9#)
                                   (EXIT
                                    (COND
                                     ((EQL |i| |degQ|)
                                      (PROGN
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL VZ 2 (QREFELT $ 45))
                                              (SPADCALL VZ 1 (QREFELT $ 45)))
                                             . #9#)
                                       (GO #10#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL VZ 1 (QREFELT $ 45))
                                              (QREFELT $ 19))
                                             . #9#)
                                       (PROGN
                                        (LETT |#G160| VQ . #9#)
                                        (LETT |#G161|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| $)
                                              . #9#)
                                        (LETT VP |#G160| . #9#)
                                        (LETT VQ |#G161| . #9#))
                                       (EXIT
                                        (LETT |s| |ss| . #9#)))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |PRS;degreeSubResultant;2polRNnipolR;26|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G174| (|polR|)) (|#G173| (|polR|)) (Z (|polR|))
          (#1=#:G1171 NIL) (#2=#:G1178 NIL) (|#G172| (|polR|))
          (|#G171| (|polR|)) (#3=#:G1168 NIL) (#4=#:G1163 NIL)
          (|delta| (|NonNegativeInteger|)) (#5=#:G1161 NIL) (|#G170| (|polR|))
          (|#G169| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (|spadConstant| $ 22))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (PROGN
                 (LETT |#G169| Q
                       . #6=(|PRS;degreeSubResultant;2polRNnipolR;26|))
                 (LETT |#G170| P . #6#)
                 (LETT P |#G169| . #6#)
                 (LETT Q |#G170| . #6#))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #5#
                                 (- (SPADCALL P (QREFELT $ 20))
                                    (SPADCALL Q (QREFELT $ 20)))
                                 . #6#)
                         (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #5#))
                       . #6#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultant$PRS : bad degrees"))
                   (#7='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                     (PROG1 (LETT #4# (- |delta| 1) . #6#)
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT $ 33))
                           . #6#)
                     (EXIT
                      (PROGN
                       (LETT #2# (SPADCALL |s| Q (QREFELT $ 36)) . #6#)
                       (GO #8=#:G1177))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 20)) (QREFELT $ 62))
                 (|spadConstant| $ 22))
                (#7#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT $ 20))
                                               (SPADCALL Q (QREFELT $ 20)))
                                            . #6#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT $ 33))
                        . #6#)
                  (PROGN
                   (LETT |#G171| Q . #6#)
                   (LETT |#G172|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                   (QREFELT $ 50))
                         . #6#)
                   (LETT P |#G171| . #6#)
                   (LETT Q |#G172| . #6#))
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((OR (SPADCALL Q (QREFELT $ 31))
                                (SPADCALL |i| (SPADCALL Q (QREFELT $ 20))
                                          (QREFELT $ 62)))
                            (PROGN
                             (LETT #2# (|spadConstant| $ 22) . #6#)
                             (GO #8#)))
                           ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                            (PROGN (LETT #2# Q . #6#) (GO #8#)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 19)) |s|
                                             (PROG1
                                                 (LETT #1#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           20))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           20)))
                                                       . #6#)
                                               (|check_subtype2| (>= #1# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #1#))
                                             (QREFELT $ 40))
                                   . #6#)
                             (PROGN
                              (LETT |#G173| Q . #6#)
                              (LETT |#G174| (SPADCALL P Q Z |s| (QREFELT $ 43))
                                    . #6#)
                              (LETT P |#G173| . #6#)
                              (LETT Q |#G174| . #6#))
                             (EXIT
                              (LETT |s| (SPADCALL Z (QREFELT $ 19))
                                    . #6#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRS;degreeSubResultantEuclidean;2polRNniR;27|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G184| (|Vector| |polR|)) (|#G183| #1#) (|ss| (R)) (#2=#:G1195 NIL)
          (#3=#:G1202 NIL) (|#G182| (|polR|)) (|#G181| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1191 NIL) (#5=#:G1186 NIL) (|delta| (|NonNegativeInteger|))
          (#6=#:G1184 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                     (|spadConstant| $ 22)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |l| (SPADCALL Q P |i| (QREFELT $ 69))
                       . #7=(|PRS;degreeSubResultantEuclidean;2polRNniR;27|))
                 (EXIT
                  (PROGN
                   (LETT #3# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                         . #7#)
                   (GO #8=#:G1201))))))
              (COND
               ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |delta|
                       (PROG1
                           (LETT #6#
                                 (- (SPADCALL P (QREFELT $ 20))
                                    (SPADCALL Q (QREFELT $ 20)))
                                 . #7#)
                         (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #6#))
                       . #7#)
                 (EXIT
                  (COND
                   ((ZEROP |delta|)
                    (|error| "degreeSubResultantEuclidean$PRS : bad degrees"))
                   (#9='T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                     (PROG1 (LETT #5# (- |delta| 1) . #7#)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 33))
                           . #7#)
                     (EXIT
                      (PROGN
                       (LETT #3#
                             (VECTOR (|spadConstant| $ 22)
                                     (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 36)))
                             . #7#)
                       (GO #8#))))))))))
              (EXIT
               (COND
                ((SPADCALL |i| (SPADCALL Q (QREFELT $ 20)) (QREFELT $ 62))
                 (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                         (|spadConstant| $ 22)))
                (#9#
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                  (PROG1
                                      (LETT #4#
                                            (- (SPADCALL P (QREFELT $ 20))
                                               (SPADCALL Q (QREFELT $ 20)))
                                            . #7#)
                                    (|check_subtype2| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #4#))
                                  (QREFELT $ 33))
                        . #7#)
                  (LETT VP
                        (VECTOR Q (|spadConstant| $ 22) (|spadConstant| $ 35))
                        . #7#)
                  (LETT |pdiv|
                        (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 54))
                        . #7#)
                  (LETT VQ
                        (VECTOR (QVELT |pdiv| 2)
                                (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                                (QVELT |pdiv| 1))
                        . #7#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (PROGN
                          (LETT |#G181| (SPADCALL VP 1 (QREFELT $ 45)) . #7#)
                          (LETT |#G182| (SPADCALL VQ 1 (QREFELT $ 45)) . #7#)
                          (LETT P |#G181| . #7#)
                          (LETT Q |#G182| . #7#))
                         (COND
                          ((OR (SPADCALL Q (QREFELT $ 31))
                               (SPADCALL |i| (SPADCALL Q (QREFELT $ 20))
                                         (QREFELT $ 62)))
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (VECTOR (|spadConstant| $ 22)
                                           (|spadConstant| $ 22)
                                           (|spadConstant| $ 22))
                                   . #7#)
                             (GO #8#)))))
                         (EXIT
                          (COND
                           ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                            (PROGN
                             (LETT #3#
                                   (VECTOR (SPADCALL VQ 2 (QREFELT $ 45))
                                           (SPADCALL VQ 3 (QREFELT $ 45))
                                           (SPADCALL VQ 1 (QREFELT $ 45)))
                                   . #7#)
                             (GO #8#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL Q (QREFELT $ 19)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           20))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           20)))
                                                       . #7#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 39))
                                   . #7#)
                             (PROGN
                              (LETT |#G183| VQ . #7#)
                              (LETT |#G184|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     $)
                                    . #7#)
                              (LETT VP |#G183| . #7#)
                              (LETT VQ |#G184| . #7#))
                             (EXIT (LETT |s| |ss| . #7#)))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |PRS;semiDegreeSubResultantEuclidean;2polRNniR;28|
        ((P |polR|) (Q |polR|) (|i| |NonNegativeInteger|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G191| (|Vector| |polR|)) (|#G190| #1#) (|ss| (R)) (#2=#:G1217 NIL)
          (#3=#:G1225 NIL) (|#G189| (|polR|)) (|#G188| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1213 NIL) (#5=#:G1208 NIL) (|delta| (|NonNegativeInteger|))
          (#6=#:G1206 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (CONS (|spadConstant| $ 22) (|spadConstant| $ 22)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
               (|error| "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
              (#7='T
               (SEQ
                (COND
                 ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #6#
                                   (- (SPADCALL P (QREFELT $ 20))
                                      (SPADCALL Q (QREFELT $ 20)))
                                   . #8=(|PRS;semiDegreeSubResultantEuclidean;2polRNniR;28|))
                           (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #6#))
                         . #8#)
                   (EXIT
                    (COND
                     ((ZEROP |delta|)
                      (|error|
                       "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
                     (#7#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                       (PROG1 (LETT #5# (- |delta| 1) . #8#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 33))
                             . #8#)
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 36)))
                               . #8#)
                         (GO #9=#:G1224))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |i| (SPADCALL Q (QREFELT $ 20)) (QREFELT $ 62))
                   (CONS (|spadConstant| $ 22) (|spadConstant| $ 22)))
                  (#7#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                    (PROG1
                                        (LETT #4#
                                              (- (SPADCALL P (QREFELT $ 20))
                                                 (SPADCALL Q (QREFELT $ 20)))
                                              . #8#)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 33))
                          . #8#)
                    (LETT VP (VECTOR Q (|spadConstant| $ 35)) . #8#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                    (QREFELT $ 54))
                          . #8#)
                    (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #8#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G188| (SPADCALL VP 1 (QREFELT $ 45)) . #8#)
                            (LETT |#G189| (SPADCALL VQ 1 (QREFELT $ 45)) . #8#)
                            (LETT P |#G188| . #8#)
                            (LETT Q |#G189| . #8#))
                           (COND
                            ((OR (SPADCALL Q (QREFELT $ 31))
                                 (SPADCALL |i| (SPADCALL Q (QREFELT $ 20))
                                           (QREFELT $ 62)))
                             (EXIT
                              (PROGN
                               (LETT #3#
                                     (CONS (|spadConstant| $ 22)
                                           (|spadConstant| $ 22))
                                     . #8#)
                               (GO #9#)))))
                           (EXIT
                            (COND
                             ((EQL |i| (SPADCALL Q (QREFELT $ 20)))
                              (PROGN
                               (LETT #3#
                                     (CONS (SPADCALL VQ 2 (QREFELT $ 45))
                                           (SPADCALL VQ 1 (QREFELT $ 45)))
                                     . #8#)
                               (GO #9#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL Q (QREFELT $ 19)) |s|
                                               (PROG1
                                                   (LETT #2#
                                                         (-
                                                          (SPADCALL P
                                                                    (QREFELT $
                                                                             20))
                                                          (SPADCALL Q
                                                                    (QREFELT $
                                                                             20)))
                                                         . #8#)
                                                 (|check_subtype2| (>= #2# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #2#))
                                               (QREFELT $ 39))
                                     . #8#)
                               (PROGN
                                (LETT |#G190| VQ . #8#)
                                (LETT |#G191|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #8#)
                                (LETT VP |#G190| . #8#)
                                (LETT VQ |#G191| . #8#))
                               (EXIT (LETT |s| |ss| . #8#)))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #9# (EXIT #3#)))) 

(SDEFUN |PRS;lastSubResultant;3polR;29| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G202| (|polR|)) (|#G201| (|polR|)) (#1=#:G1239 NIL)
          (Z (|polR|)) (#2=#:G1231 NIL) (|#G200| (|polR|)) (|#G199| (|polR|))
          (#3=#:G1230 NIL) (|#G198| (|polR|)) (|#G197| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (|spadConstant| $ 22))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (PROGN
                 (LETT |#G197| Q . #4=(|PRS;lastSubResultant;3polR;29|))
                 (LETT |#G198| P . #4#)
                 (LETT P |#G197| . #4#)
                 (LETT Q |#G198| . #4#))))
              (EXIT
               (COND
                ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                 (SPADCALL
                  (SPADCALL (SPADCALL Q (QREFELT $ 19))
                            (SPADCALL P (QREFELT $ 20)) (QREFELT $ 33))
                  (QREFELT $ 12)))
                ('T
                 (SEQ
                  (LETT |s|
                        (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL P (QREFELT $ 20))
                                               (SPADCALL Q (QREFELT $ 20)))
                                            . #4#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  (QREFELT $ 33))
                        . #4#)
                  (PROGN
                   (LETT |#G199| Q . #4#)
                   (LETT |#G200|
                         (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                   (QREFELT $ 50))
                         . #4#)
                   (LETT P |#G199| . #4#)
                   (LETT Q |#G200| . #4#))
                  (LETT Z P . #4#)
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL Q (QREFELT $ 31))
                            (PROGN (LETT #1# Z . #4#) (GO #5=#:G1238)))
                           ('T
                            (SEQ
                             (LETT Z
                                   (SPADCALL Q (SPADCALL Q (QREFELT $ 19)) |s|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           20))
                                                        (SPADCALL Q
                                                                  (QREFELT $
                                                                           20)))
                                                       . #4#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             (QREFELT $ 40))
                                   . #4#)
                             (EXIT
                              (COND
                               ((ZEROP (SPADCALL Z (QREFELT $ 20)))
                                (PROGN (LETT #1# Z . #4#) (GO #5#)))
                               ('T
                                (SEQ
                                 (PROGN
                                  (LETT |#G201| Q . #4#)
                                  (LETT |#G202|
                                        (SPADCALL P Q Z |s| (QREFELT $ 43))
                                        . #4#)
                                  (LETT P |#G201| . #4#)
                                  (LETT Q |#G202| . #4#))
                                 (EXIT
                                  (LETT |s| (SPADCALL Z (QREFELT $ 19))
                                        . #4#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;lastSubResultantEuclidean;2polRR;30|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G208| (|Vector| |polR|)) (|#G207| #1#) (|ss| (R)) (#2=#:G1260 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G1253 NIL) (Z (|polR|))
          (|#G206| (|polR|)) (|#G205| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1251 NIL) (#5=#:G1246 NIL) (|degP| (|NonNegativeInteger|))
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |subResultant| |polR|))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                     (|spadConstant| $ 22)))
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (LETT |l| (SPADCALL Q P (QREFELT $ 72))
                       . #6=(|PRS;lastSubResultantEuclidean;2polRR;30|))
                 (EXIT
                  (PROGN
                   (LETT #2# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                         . #6#)
                   (GO #7=#:G1259))))))
              (COND
               ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 20)) . #6#)
                     (EXIT
                      (COND
                       ((ZEROP |degP|)
                        (|error|
                         "lastSubResultantEuclidean$PRS : constant polynomials"))
                       ('T
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                         (PROG1 (LETT #5# (- |degP| 1) . #6#)
                                           (|check_subtype2| (>= #5# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #5#))
                                         (QREFELT $ 33))
                               . #6#)
                         (EXIT
                          (PROGN
                           (LETT #2#
                                 (VECTOR (|spadConstant| $ 22)
                                         (SPADCALL |s| (QREFELT $ 12))
                                         (SPADCALL |s| Q (QREFELT $ 36)))
                                 . #6#)
                           (GO #7#))))))))))
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 19))
                              (PROG1
                                  (LETT #4#
                                        (- (SPADCALL P (QREFELT $ 20))
                                           (SPADCALL Q (QREFELT $ 20)))
                                        . #6#)
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#))
                              (QREFELT $ 33))
                    . #6#)
              (LETT VP (VECTOR Q (|spadConstant| $ 22) (|spadConstant| $ 35))
                    . #6#)
              (LETT |pdiv|
                    (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 54))
                    . #6#)
              (LETT VQ
                    (VECTOR (QVELT |pdiv| 2)
                            (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                            (QVELT |pdiv| 1))
                    . #6#)
              (LETT VZ (SPADCALL VP (QREFELT $ 73)) . #6#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G205| (SPADCALL VQ 1 (QREFELT $ 45)) . #6#)
                      (LETT |#G206| (SPADCALL VZ 1 (QREFELT $ 45)) . #6#)
                      (LETT Q |#G205| . #6#)
                      (LETT Z |#G206| . #6#))
                     (EXIT
                      (COND
                       ((SPADCALL Q (QREFELT $ 31))
                        (PROGN
                         (LETT #2#
                               (VECTOR (SPADCALL VZ 2 (QREFELT $ 45))
                                       (SPADCALL VZ 3 (QREFELT $ 45))
                                       (SPADCALL VZ 1 (QREFELT $ 45)))
                               . #6#)
                         (GO #7#)))
                       ('T
                        (SEQ
                         (LETT VZ
                               (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 19))
                                |s|
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL Z (QREFELT $ 20))
                                             (SPADCALL Q (QREFELT $ 20)))
                                          . #6#)
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                $)
                               . #6#)
                         (EXIT
                          (COND
                           ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                            (PROGN
                             (LETT #2#
                                   (VECTOR (SPADCALL VZ 2 (QREFELT $ 45))
                                           (SPADCALL VZ 3 (QREFELT $ 45))
                                           (SPADCALL VZ 1 (QREFELT $ 45)))
                                   . #6#)
                             (GO #7#)))
                           ('T
                            (SEQ
                             (LETT |ss|
                                   (SPADCALL (SPADCALL VZ 1 (QREFELT $ 45))
                                             (QREFELT $ 19))
                                   . #6#)
                             (PROGN
                              (LETT |#G207| VQ . #6#)
                              (LETT |#G208|
                                    (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                     $)
                                    . #6#)
                              (LETT VP |#G207| . #6#)
                              (LETT VQ |#G208| . #6#))
                             (EXIT (LETT |s| |ss| . #6#)))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |PRS;semiLastSubResultantEuclidean;2polRR;31|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |subResultant| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G214| (|Vector| |polR|)) (|#G213| #1#) (|ss| (R)) (#2=#:G1280 NIL)
          (VZ (|Vector| |polR|)) (#3=#:G1272 NIL) (Z (|polR|))
          (|#G212| (|polR|)) (|#G211| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1270 NIL) (#5=#:G1265 NIL) (|degP| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31)))
             (CONS (|spadConstant| $ 22) (|spadConstant| $ 22)))
            ('T
             (COND
              ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
               (|error| "semiLastSubResultantEuclidean$PRS : bad degrees"))
              (#6='T
               (SEQ
                (COND
                 ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                  (SEQ
                   (LETT |degP| (SPADCALL P (QREFELT $ 20))
                         . #7=(|PRS;semiLastSubResultantEuclidean;2polRR;31|))
                   (EXIT
                    (COND
                     ((ZEROP |degP|)
                      (|error|
                       "semiLastSubResultantEuclidean$PRS : constant polynomials"))
                     (#6#
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                       (PROG1 (LETT #5# (- |degP| 1) . #7#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 33))
                             . #7#)
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (CONS (SPADCALL |s| (QREFELT $ 12))
                                     (SPADCALL |s| Q (QREFELT $ 36)))
                               . #7#)
                         (GO #8=#:G1279))))))))))
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                (PROG1
                                    (LETT #4#
                                          (- (SPADCALL P (QREFELT $ 20))
                                             (SPADCALL Q (QREFELT $ 20)))
                                          . #7#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 33))
                      . #7#)
                (LETT VP (VECTOR Q (|spadConstant| $ 35)) . #7#)
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT $ 41)) (QREFELT $ 54))
                      . #7#)
                (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #7#)
                (LETT VZ (SPADCALL VP (QREFELT $ 73)) . #7#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G211| (SPADCALL VQ 1 (QREFELT $ 45)) . #7#)
                        (LETT |#G212| (SPADCALL VZ 1 (QREFELT $ 45)) . #7#)
                        (LETT Q |#G211| . #7#)
                        (LETT Z |#G212| . #7#))
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT $ 31))
                          (PROGN
                           (LETT #2#
                                 (CONS (SPADCALL VZ 2 (QREFELT $ 45))
                                       (SPADCALL VZ 1 (QREFELT $ 45)))
                                 . #7#)
                           (GO #8#)))
                         ('T
                          (SEQ
                           (LETT VZ
                                 (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 19))
                                  |s|
                                  (PROG1
                                      (LETT #3#
                                            (- (SPADCALL Z (QREFELT $ 20))
                                               (SPADCALL Q (QREFELT $ 20)))
                                            . #7#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  $)
                                 . #7#)
                           (EXIT
                            (COND
                             ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                              (PROGN
                               (LETT #2#
                                     (CONS (SPADCALL VZ 2 (QREFELT $ 45))
                                           (SPADCALL VZ 1 (QREFELT $ 45)))
                                     . #7#)
                               (GO #8#)))
                             ('T
                              (SEQ
                               (LETT |ss|
                                     (SPADCALL (SPADCALL VZ 1 (QREFELT $ 45))
                                               (QREFELT $ 19))
                                     . #7#)
                               (PROGN
                                (LETT |#G213| VQ . #7#)
                                (LETT |#G214|
                                      (|PRS;next_sousResultant3| VP VQ |s| |ss|
                                       $)
                                      . #7#)
                                (LETT VP |#G213| . #7#)
                                (LETT VQ |#G214| . #7#))
                               (EXIT (LETT |s| |ss| . #7#)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |PRS;chainSubResultants;2polRL;32|
        ((P |polR|) (Q |polR|) ($ |List| |polR|))
        (SPROG
         ((|s| (R)) (|#G224| (|polR|)) (|#G223| (|polR|)) (#1=#:G1304 NIL)
          (L (|List| |polR|)) (Z (|polR|)) (|delta| (|NonNegativeInteger|))
          (#2=#:G1296 NIL) (|#G222| (|polR|)) (|#G221| (|polR|))
          (#3=#:G1291 NIL) (|#G220| (|polR|)) (|#G219| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (SEQ
                 (PROGN
                  (LETT |#G219| Q . #4=(|PRS;chainSubResultants;2polRL;32|))
                  (LETT |#G220| P . #4#)
                  (LETT P |#G219| . #4#)
                  (LETT Q |#G220| . #4#))
                 (EXIT
                  (COND
                   ((ODDP (SPADCALL P (QREFELT $ 20)))
                    (COND
                     ((ODDP (SPADCALL Q (QREFELT $ 20)))
                      (LETT Q (SPADCALL Q (QREFELT $ 41)) . #4#)))))))))
              (LETT L NIL . #4#)
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT $ 20))) L)
                     ('T
                      (SEQ (LETT L (LIST Q) . #4#)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                           (PROG1
                                               (LETT #3#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 20))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         20)))
                                                     . #4#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 33))
                                 . #4#)
                           (PROGN
                            (LETT |#G221| Q . #4#)
                            (LETT |#G222|
                                  (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                            (QREFELT $ 50))
                                  . #4#)
                            (LETT P |#G221| . #4#)
                            (LETT Q |#G222| . #4#))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT $ 31))
                                     (PROGN
                                      (LETT #1# L . #4#)
                                      (GO #5=#:G1303)))
                                    ('T
                                     (SEQ (LETT L (CONS Q L) . #4#)
                                          (LETT |delta|
                                                (PROG1
                                                    (LETT #2#
                                                          (-
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              20))
                                                           (SPADCALL Q
                                                                     (QREFELT $
                                                                              20)))
                                                          . #4#)
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                . #4#)
                                          (LETT Z
                                                (SPADCALL Q
                                                          (SPADCALL Q
                                                                    (QREFELT $
                                                                             19))
                                                          |s| |delta|
                                                          (QREFELT $ 40))
                                                . #4#)
                                          (COND
                                           ((SPADCALL |delta| 1 (QREFELT $ 62))
                                            (LETT L (CONS Z L) . #4#)))
                                          (EXIT
                                           (COND
                                            ((ZEROP
                                              (SPADCALL Z (QREFELT $ 20)))
                                             (PROGN
                                              (LETT #1# L . #4#)
                                              (GO #5#)))
                                            ('T
                                             (SEQ
                                              (PROGN
                                               (LETT |#G223| Q . #4#)
                                               (LETT |#G224|
                                                     (SPADCALL P Q Z |s|
                                                               (QREFELT $ 43))
                                                     . #4#)
                                               (LETT P |#G223| . #4#)
                                               (LETT Q |#G224| . #4#))
                                              (EXIT
                                               (LETT |s|
                                                     (SPADCALL Z
                                                               (QREFELT $ 19))
                                                     . #4#)))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;schema;2polRL;33|
        ((P |polR|) (Q |polR|) ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|s| (R)) (|#G232| (|polR|)) (|#G231| (|polR|)) (#1=#:G1318 NIL)
          (L (|List| (|NonNegativeInteger|))) (Z (|polR|))
          (|delta| (|NonNegativeInteger|)) (#2=#:G1310 NIL)
          (|e| (|NonNegativeInteger|)) (|#G230| (|polR|)) (|#G229| (|polR|))
          (#3=#:G1309 NIL) (|#G228| (|polR|)) (|#G227| (|polR|)))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL Q (QREFELT $ 31)) (SPADCALL P (QREFELT $ 31))) NIL)
            ('T
             (SEQ
              (COND
               ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                (PROGN
                 (LETT |#G227| Q . #4=(|PRS;schema;2polRL;33|))
                 (LETT |#G228| P . #4#)
                 (LETT P |#G227| . #4#)
                 (LETT Q |#G228| . #4#))))
              (EXIT
               (COND ((ZEROP (SPADCALL Q (QREFELT $ 20))) (LIST 0))
                     ('T
                      (SEQ (LETT L NIL . #4#)
                           (LETT |s|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                           (PROG1
                                               (LETT #3#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 20))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         20)))
                                                     . #4#)
                                             (|check_subtype2| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #3#))
                                           (QREFELT $ 33))
                                 . #4#)
                           (PROGN
                            (LETT |#G229| Q . #4#)
                            (LETT |#G230| (SPADCALL P Q (QREFELT $ 50)) . #4#)
                            (LETT P |#G229| . #4#)
                            (LETT Q |#G230| . #4#))
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL Q (QREFELT $ 31))
                                     (PROGN
                                      (LETT #1# L . #4#)
                                      (GO #5=#:G1317)))
                                    ('T
                                     (SEQ
                                      (LETT |e| (SPADCALL Q (QREFELT $ 20))
                                            . #4#)
                                      (LETT L (CONS |e| L) . #4#)
                                      (LETT |delta|
                                            (PROG1
                                                (LETT #2#
                                                      (-
                                                       (SPADCALL P
                                                                 (QREFELT $
                                                                          20))
                                                       |e|)
                                                      . #4#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            . #4#)
                                      (LETT Z
                                            (SPADCALL Q
                                                      (SPADCALL Q
                                                                (QREFELT $ 19))
                                                      |s| |delta|
                                                      (QREFELT $ 40))
                                            . #4#)
                                      (COND
                                       ((SPADCALL |delta| 1 (QREFELT $ 62))
                                        (LETT L (CONS |e| L) . #4#)))
                                      (EXIT
                                       (COND
                                        ((ZEROP |e|)
                                         (PROGN (LETT #1# L . #4#) (GO #5#)))
                                        ('T
                                         (SEQ
                                          (PROGN
                                           (LETT |#G231| Q . #4#)
                                           (LETT |#G232|
                                                 (SPADCALL P Q Z |s|
                                                           (QREFELT $ 43))
                                                 . #4#)
                                           (LETT P |#G231| . #4#)
                                           (LETT Q |#G232| . #4#))
                                          (EXIT
                                           (LETT |s|
                                                 (SPADCALL Z (QREFELT $ 19))
                                                 . #4#)))))))))))
                                 NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;subResultantGcd;3polR;34| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|s| (R)) (|#G240| (|polR|)) (|#G239| (|polR|)) (Z (|polR|))
          (#1=#:G1324 NIL) (#2=#:G1334 NIL) (|#G238| (|polR|))
          (|#G237| (|polR|)) (#3=#:G1323 NIL) (|#G236| (|polR|))
          (|#G235| (|polR|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 31))
              (COND
               ((SPADCALL Q (QREFELT $ 31)) (EXIT (|spadConstant| $ 22))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT $ 31)) Q)
                   ((SPADCALL Q (QREFELT $ 31)) P)
                   (#4='T
                    (SEQ
                     (COND
                      ((< (SPADCALL P (QREFELT $ 20))
                          (SPADCALL Q (QREFELT $ 20)))
                       (PROGN
                        (LETT |#G235| Q . #5=(|PRS;subResultantGcd;3polR;34|))
                        (LETT |#G236| P . #5#)
                        (LETT P |#G235| . #5#)
                        (LETT Q |#G236| . #5#))))
                     (EXIT
                      (COND
                       ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                        (|spadConstant| $ 35))
                       (#4#
                        (SEQ
                         (LETT |s|
                               (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                         (PROG1
                                             (LETT #3#
                                                   (-
                                                    (SPADCALL P (QREFELT $ 20))
                                                    (SPADCALL Q
                                                              (QREFELT $ 20)))
                                                   . #5#)
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT $ 33))
                               . #5#)
                         (PROGN
                          (LETT |#G237| Q . #5#)
                          (LETT |#G238|
                                (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                          (QREFELT $ 50))
                                . #5#)
                          (LETT P |#G237| . #5#)
                          (LETT Q |#G238| . #5#))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL Q (QREFELT $ 31))
                                   (PROGN (LETT #2# P . #5#) (GO #6=#:G1333)))
                                  ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                                   (PROGN
                                    (LETT #2# (|spadConstant| $ 35) . #5#)
                                    (GO #6#)))
                                  ('T
                                   (SEQ
                                    (LETT Z
                                          (SPADCALL Q
                                                    (SPADCALL Q (QREFELT $ 19))
                                                    |s|
                                                    (PROG1
                                                        (LETT #1#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          20))
                                                               (SPADCALL Q
                                                                         (QREFELT
                                                                          $
                                                                          20)))
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT $ 40))
                                          . #5#)
                                    (PROGN
                                     (LETT |#G239| Q . #5#)
                                     (LETT |#G240|
                                           (SPADCALL P Q Z |s| (QREFELT $ 43))
                                           . #5#)
                                     (LETT P |#G239| . #5#)
                                     (LETT Q |#G240| . #5#))
                                    (EXIT
                                     (LETT |s| (SPADCALL Z (QREFELT $ 19))
                                           . #5#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |PRS;subResultantGcdEuclidean;2polRR;35|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |gcd| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G246| (|Vector| |polR|)) (|#G245| #1#) (|ss| (R)) (#2=#:G1343 NIL)
          (#3=#:G1353 NIL) (|e| (|NonNegativeInteger|)) (|#G244| (|polR|))
          (|#G243| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1341 NIL)
          (|l|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 31))
              (COND
               ((SPADCALL Q (QREFELT $ 31))
                (EXIT
                 (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                         (|spadConstant| $ 22)))))))
            (EXIT
             (COND
              ((SPADCALL P (QREFELT $ 31))
               (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 35) Q))
              ((SPADCALL Q (QREFELT $ 31))
               (VECTOR (|spadConstant| $ 35) (|spadConstant| $ 22) P))
              (#5='T
               (SEQ
                (COND
                 ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                  (SEQ
                   (LETT |l| (SPADCALL Q P (QREFELT $ 81))
                         . #6=(|PRS;subResultantGcdEuclidean;2polRR;35|))
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                           . #6#)
                     (GO #7=#:G1352))))))
                (EXIT
                 (COND
                  ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                   (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 35) Q))
                  (#5#
                   (SEQ
                    (LETT |s|
                          (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                    (PROG1
                                        (LETT #4#
                                              (- (SPADCALL P (QREFELT $ 20))
                                                 (SPADCALL Q (QREFELT $ 20)))
                                              . #6#)
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    (QREFELT $ 33))
                          . #6#)
                    (LETT VP
                          (VECTOR Q (|spadConstant| $ 22)
                                  (|spadConstant| $ 35))
                          . #6#)
                    (LETT |pdiv|
                          (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                    (QREFELT $ 54))
                          . #6#)
                    (LETT VQ
                          (VECTOR (QVELT |pdiv| 2)
                                  (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 12))
                                  (QVELT |pdiv| 1))
                          . #6#)
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (PROGN
                            (LETT |#G243| (SPADCALL VP 1 (QREFELT $ 45)) . #6#)
                            (LETT |#G244| (SPADCALL VQ 1 (QREFELT $ 45)) . #6#)
                            (LETT P |#G243| . #6#)
                            (LETT Q |#G244| . #6#))
                           (EXIT
                            (COND
                             ((SPADCALL Q (QREFELT $ 31))
                              (PROGN
                               (LETT #3#
                                     (VECTOR (SPADCALL VP 2 (QREFELT $ 45))
                                             (SPADCALL VP 3 (QREFELT $ 45)) P)
                                     . #6#)
                               (GO #7#)))
                             ('T
                              (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 20)) . #6#)
                                   (EXIT
                                    (COND
                                     ((ZEROP |e|)
                                      (PROGN
                                       (LETT #3#
                                             (VECTOR
                                              (SPADCALL VQ 2 (QREFELT $ 45))
                                              (SPADCALL VQ 3 (QREFELT $ 45)) Q)
                                             . #6#)
                                       (GO #7#)))
                                     ('T
                                      (SEQ
                                       (LETT |ss|
                                             (SPADCALL
                                              (SPADCALL Q (QREFELT $ 19)) |s|
                                              (PROG1
                                                  (LETT #2#
                                                        (-
                                                         (SPADCALL P
                                                                   (QREFELT $
                                                                            20))
                                                         |e|)
                                                        . #6#)
                                                (|check_subtype2| (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                              (QREFELT $ 39))
                                             . #6#)
                                       (PROGN
                                        (LETT |#G245| VQ . #6#)
                                        (LETT |#G246|
                                              (|PRS;next_sousResultant3| VP VQ
                                               |s| |ss| $)
                                              . #6#)
                                        (LETT VP |#G245| . #6#)
                                        (LETT VQ |#G246| . #6#))
                                       (EXIT (LETT |s| |ss| . #6#)))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean2;2polRR;36|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |gcd| |polR|)))
        (SPROG
         ((|s| (R)) (VQ #1=(|Vector| |polR|)) (VP (|Vector| |polR|))
          (|#G252| (|Vector| |polR|)) (|#G251| #1#) (|ss| (R)) (#2=#:G1360 NIL)
          (#3=#:G1372 NIL) (|e| (|NonNegativeInteger|)) (|#G250| (|polR|))
          (|#G249| (|polR|))
          (|pdiv|
           (|Record| (|:| |coef| R) (|:| |quotient| |polR|)
                     (|:| |remainder| |polR|)))
          (#4=#:G1358 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL P (QREFELT $ 31))
              (COND
               ((SPADCALL Q (QREFELT $ 31))
                (EXIT (CONS (|spadConstant| $ 22) (|spadConstant| $ 22)))))))
            (EXIT
             (COND ((SPADCALL P (QREFELT $ 31)) (CONS (|spadConstant| $ 35) Q))
                   ((SPADCALL Q (QREFELT $ 31)) (CONS (|spadConstant| $ 22) P))
                   ((< (SPADCALL P (QREFELT $ 20)) (SPADCALL Q (QREFELT $ 20)))
                    (|error|
                     "semiSubResultantGcdEuclidean2$PRS : bad degrees"))
                   ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                    (CONS (|spadConstant| $ 35) Q))
                   ('T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                     (PROG1
                                         (LETT #4#
                                               (- (SPADCALL P (QREFELT $ 20))
                                                  (SPADCALL Q (QREFELT $ 20)))
                                               . #5=(|PRS;semiSubResultantGcdEuclidean2;2polRR;36|))
                                       (|check_subtype2| (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                     (QREFELT $ 33))
                           . #5#)
                     (LETT VP (VECTOR Q (|spadConstant| $ 35)) . #5#)
                     (LETT |pdiv|
                           (SPADCALL P (SPADCALL Q (QREFELT $ 41))
                                     (QREFELT $ 54))
                           . #5#)
                     (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #5#)
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (PROGN
                             (LETT |#G249| (SPADCALL VP 1 (QREFELT $ 45))
                                   . #5#)
                             (LETT |#G250| (SPADCALL VQ 1 (QREFELT $ 45))
                                   . #5#)
                             (LETT P |#G249| . #5#)
                             (LETT Q |#G250| . #5#))
                            (EXIT
                             (COND
                              ((SPADCALL Q (QREFELT $ 31))
                               (PROGN
                                (LETT #3#
                                      (CONS (SPADCALL VP 2 (QREFELT $ 45)) P)
                                      . #5#)
                                (GO #6=#:G1371)))
                              ('T
                               (SEQ
                                (LETT |e| (SPADCALL Q (QREFELT $ 20)) . #5#)
                                (EXIT
                                 (COND
                                  ((ZEROP |e|)
                                   (PROGN
                                    (LETT #3#
                                          (CONS (SPADCALL VQ 2 (QREFELT $ 45))
                                                Q)
                                          . #5#)
                                    (GO #6#)))
                                  ('T
                                   (SEQ
                                    (LETT |ss|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 19))
                                                    |s|
                                                    (PROG1
                                                        (LETT #2#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          20))
                                                               |e|)
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 39))
                                          . #5#)
                                    (PROGN
                                     (LETT |#G251| VQ . #5#)
                                     (LETT |#G252|
                                           (|PRS;next_sousResultant3| VP VQ |s|
                                            |ss| $)
                                           . #5#)
                                     (LETT VP |#G251| . #5#)
                                     (LETT VQ |#G252| . #5#))
                                    (EXIT (LETT |s| |ss| . #5#)))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))))))))
          #6# (EXIT #3#)))) 

(SDEFUN |PRS;semiSubResultantGcdEuclidean1;2polRR;37|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |gcd| |polR|)))
        (SPROG
         ((|result|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (LETT |result| (SPADCALL P Q (QREFELT $ 81))
                |PRS;semiSubResultantGcdEuclidean1;2polRR;37|)
          (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2)))))) 

(SDEFUN |PRS;discriminant;polRR;38| ((P |polR|) ($ R))
        (SPROG
         ((#1=#:G1389 NIL) (#2=#:G1384 NIL) (#3=#:G1380 NIL) (|d| (|Integer|))
          (|r| (R)) (|dP| (|polR|)) (|a| (|Integer|)) (#4=#:G1378 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 20))
                  . #5=(|PRS;discriminant;polRR;38|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#6='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #5#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #4# |a| . #5#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                          . #5#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 86)) . #5#)
                    (LETT |r| (SPADCALL P |dP| (QREFELT $ 52)) . #5#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 20))) 1)
                          . #5#)
                    (EXIT
                     (PROGN
                      (LETT #1#
                            (COND
                             ((ZEROP |d|)
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #3#
                                                  (SPADCALL |r|
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 19))
                                                            (QREFELT $ 24))
                                                  . #5#)
                                            (QCDR #3#)
                                          (|check_union2| (QEQCAR #3# 0)
                                                          (QREFELT $ 6)
                                                          (|Union|
                                                           (QREFELT $ 6)
                                                           "failed")
                                                          #3#))
                                        (QREFELT $ 87)))
                             (#6#
                              (SPADCALL (SPADCALL |a| |r| (QREFELT $ 87))
                                        (SPADCALL (SPADCALL P (QREFELT $ 19))
                                                  (PROG1
                                                      (LETT #2# (- |d| 1)
                                                            . #5#)
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT $ 33))
                                        (QREFELT $ 34))))
                            . #5#)
                      (GO #7=#:G1388)))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |PRS;discriminantEuclidean;polRR;39|
        ((P |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |discriminant| R)))
        (SPROG
         ((#1=#:G1416 NIL) (|cr| (R)) (#2=#:G1409 NIL) (|c2| (|polR|))
          (#3=#:G1406 NIL) (|c1| (|polR|)) (#4=#:G1402 NIL) (#5=#:G1396 NIL)
          (#6=#:G1393 NIL) (|d| (|Integer|))
          (|rE|
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |resultant| R)))
          (|dP| (|polR|)) (|a| (|Integer|)) (#7=#:G1391 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 20))
                  . #8=(|PRS;discriminantEuclidean;polRR;39|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#9='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #8#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #7# |a| . #8#)
                                  (|check_subtype2| (>= #7# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #7#)))
                          . #8#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 86)) . #8#)
                    (LETT |rE| (SPADCALL P |dP| (QREFELT $ 57)) . #8#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 20))) 1)
                          . #8#)
                    (COND
                     ((ZEROP |d|)
                      (SEQ
                       (LETT |c1|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL (QVELT |rE| 0)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              19))
                                                           (QREFELT $ 16))
                                                 . #8#)
                                           (QCDR #6#)
                                         (|check_union2| (QEQCAR #6# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #10="failed")
                                                         #6#))
                                       (QREFELT $ 55))
                             . #8#)
                       (LETT |c2|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #6#
                                                 (SPADCALL (QVELT |rE| 1)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              19))
                                                           (QREFELT $ 16))
                                                 . #8#)
                                           (QCDR #6#)
                                         (|check_union2| (QEQCAR #6# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  #10#)
                                                         #6#))
                                       (QREFELT $ 55))
                             . #8#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #5#
                                                  (SPADCALL (QVELT |rE| 2)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 19))
                                                            (QREFELT $ 24))
                                                  . #8#)
                                            (QCDR #5#)
                                          (|check_union2| (QEQCAR #5# 0)
                                                          (QREFELT $ 6)
                                                          (|Union|
                                                           (QREFELT $ 6)
                                                           "failed")
                                                          #5#))
                                        (QREFELT $ 87))
                              . #8#))))
                     (#9#
                      (SEQ
                       (LETT |c1|
                             (SPADCALL
                              (SPADCALL |a| (QVELT |rE| 0) (QREFELT $ 55))
                              (SPADCALL (SPADCALL P (QREFELT $ 19))
                                        (PROG1 (LETT #4# (- |d| 1) . #8#)
                                          (|check_subtype2| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #4#))
                                        (QREFELT $ 33))
                              (QREFELT $ 89))
                             . #8#)
                       (LETT |c2|
                             (SPADCALL
                              (SPADCALL |a| (QVELT |rE| 1) (QREFELT $ 55))
                              (SPADCALL (SPADCALL P (QREFELT $ 19))
                                        (PROG1 (LETT #3# (- |d| 1) . #8#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        (QREFELT $ 33))
                              (QREFELT $ 89))
                             . #8#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL
                               (SPADCALL |a| (QVELT |rE| 2) (QREFELT $ 87))
                               (SPADCALL (SPADCALL P (QREFELT $ 19))
                                         (PROG1 (LETT #2# (- |d| 1) . #8#)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 33))
                               (QREFELT $ 34))
                              . #8#)))))
                    (EXIT
                     (PROGN
                      (LETT #1# (VECTOR |c1| |c2| |cr|) . #8#)
                      (GO #11=#:G1415)))))))))
          #11# (EXIT #1#)))) 

(SDEFUN |PRS;semiDiscriminantEuclidean;polRR;40|
        ((P |polR|) ($ |Record| (|:| |coef2| |polR|) (|:| |discriminant| R)))
        (SPROG
         ((#1=#:G1439 NIL) (|cr| (R)) (#2=#:G1432 NIL) (|c2| (|polR|))
          (#3=#:G1429 NIL) (#4=#:G1423 NIL) (#5=#:G1420 NIL) (|d| (|Integer|))
          (|rE| (|Record| (|:| |coef2| |polR|) (|:| |resultant| R)))
          (|dP| (|polR|)) (|a| (|Integer|)) (#6=#:G1418 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |d| (SPADCALL P (QREFELT $ 20))
                  . #7=(|PRS;semiDiscriminantEuclidean;polRR;40|))
            (EXIT
             (COND
              ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
              (#8='T
               (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #7#)
                    (LETT |a|
                          (EXPT -1
                                (PROG1 (LETT #6# |a| . #7#)
                                  (|check_subtype2| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #6#)))
                          . #7#)
                    (LETT |dP| (SPADCALL P (QREFELT $ 86)) . #7#)
                    (LETT |rE| (SPADCALL P |dP| (QREFELT $ 59)) . #7#)
                    (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 20))) 1)
                          . #7#)
                    (COND
                     ((ZEROP |d|)
                      (SEQ
                       (LETT |c2|
                             (SPADCALL |a|
                                       (PROG2
                                           (LETT #5#
                                                 (SPADCALL (QCAR |rE|)
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              19))
                                                           (QREFELT $ 16))
                                                 . #7#)
                                           (QCDR #5#)
                                         (|check_union2| (QEQCAR #5# 0)
                                                         (QREFELT $ 7)
                                                         (|Union| (QREFELT $ 7)
                                                                  "failed")
                                                         #5#))
                                       (QREFELT $ 55))
                             . #7#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #4#
                                                  (SPADCALL (QCDR |rE|)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 19))
                                                            (QREFELT $ 24))
                                                  . #7#)
                                            (QCDR #4#)
                                          (|check_union2| (QEQCAR #4# 0)
                                                          (QREFELT $ 6)
                                                          (|Union|
                                                           (QREFELT $ 6)
                                                           "failed")
                                                          #4#))
                                        (QREFELT $ 87))
                              . #7#))))
                     (#8#
                      (SEQ
                       (LETT |c2|
                             (SPADCALL
                              (SPADCALL |a| (QCAR |rE|) (QREFELT $ 55))
                              (SPADCALL (SPADCALL P (QREFELT $ 19))
                                        (PROG1 (LETT #3# (- |d| 1) . #7#)
                                          (|check_subtype2| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #3#))
                                        (QREFELT $ 33))
                              (QREFELT $ 89))
                             . #7#)
                       (EXIT
                        (LETT |cr|
                              (SPADCALL
                               (SPADCALL |a| (QCDR |rE|) (QREFELT $ 87))
                               (SPADCALL (SPADCALL P (QREFELT $ 19))
                                         (PROG1 (LETT #2# (- |d| 1) . #7#)
                                           (|check_subtype2| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                         (QREFELT $ 33))
                               (QREFELT $ 34))
                              . #7#)))))
                    (EXIT
                     (PROGN
                      (LETT #1# (CONS |c2| |cr|) . #7#)
                      (GO #9=#:G1438)))))))))
          #9# (EXIT #1#)))) 

(SDEFUN |PRS;resultantReduit;2polRR;41| ((P |polR|) (Q |polR|) ($ R))
        (SPROG
         ((#1=#:G1455 NIL) (#2=#:G1450 NIL) (|l| (|List| R)) (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 81))
                  . #3=(|PRS;resultantReduit;2polRR;41|))
            (LETT |UVs| (QVELT UV 2) . #3#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 20)) 0 (QREFELT $ 62))
               (|spadConstant| $ 21))
              ('T
               (SEQ
                (LETT |l|
                      (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 95))
                                (SPADCALL (QVELT UV 1) (QREFELT $ 95))
                                (QREFELT $ 96))
                      . #3#)
                (EXIT
                 (PROGN
                  (LETT #1#
                        (PROG2
                            (LETT #2#
                                  (SPADCALL (SPADCALL |UVs| (QREFELT $ 19))
                                            (SPADCALL |l| (QREFELT $ 98))
                                            (QREFELT $ 24))
                                  . #3#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                          (|Union| (QREFELT $ 6) "failed")
                                          #2#))
                        . #3#)
                  (GO #4=#:G1454)))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |PRS;resultantReduitEuclidean;2polRR;42|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
          (|:| |resultantReduit| R)))
        (SPROG
         ((#1=#:G1468 NIL) (|rr| (R)) (#2=#:G1462 NIL) (|c2| (|polR|))
          (#3=#:G1459 NIL) (|c1| (|polR|)) (|gl| (R)) (|l| (|List| R))
          (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 81))
                  . #4=(|PRS;resultantReduitEuclidean;2polRR;42|))
            (LETT |UVs| (QVELT UV 2) . #4#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 20)) 0 (QREFELT $ 62))
               (VECTOR (|spadConstant| $ 22) (|spadConstant| $ 22)
                       (|spadConstant| $ 21)))
              ('T
               (SEQ
                (LETT |l|
                      (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 95))
                                (SPADCALL (QVELT UV 1) (QREFELT $ 95))
                                (QREFELT $ 96))
                      . #4#)
                (LETT |gl| (SPADCALL |l| (QREFELT $ 98)) . #4#)
                (LETT |c1|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 0) |gl| (QREFELT $ 16))
                                . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) #5="failed")
                                        #3#))
                      . #4#)
                (LETT |c2|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 16))
                                . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) #5#) #3#))
                      . #4#)
                (LETT |rr|
                      (PROG2
                          (LETT #2#
                                (SPADCALL (SPADCALL |UVs| (QREFELT $ 19)) |gl|
                                          (QREFELT $ 24))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #2#))
                      . #4#)
                (EXIT
                 (PROGN
                  (LETT #1# (VECTOR |c1| |c2| |rr|) . #4#)
                  (GO #6=#:G1467)))))))))
          #6# (EXIT #1#)))) 

(SDEFUN |PRS;semiResultantReduitEuclidean;2polRR;43|
        ((P |polR|) (Q |polR|)
         ($ |Record| (|:| |coef2| |polR|) (|:| |resultantReduit| R)))
        (SPROG
         ((#1=#:G1481 NIL) (|rr| (R)) (#2=#:G1475 NIL) (|c2| (|polR|))
          (#3=#:G1472 NIL) (|gl| (R)) (|l| (|List| R)) (|UVs| (|polR|))
          (UV
           (|Record| (|:| |coef1| |polR|) (|:| |coef2| |polR|)
                     (|:| |gcd| |polR|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT UV (SPADCALL P Q (QREFELT $ 81))
                  . #4=(|PRS;semiResultantReduitEuclidean;2polRR;43|))
            (LETT |UVs| (QVELT UV 2) . #4#)
            (EXIT
             (COND
              ((SPADCALL (SPADCALL |UVs| (QREFELT $ 20)) 0 (QREFELT $ 62))
               (CONS (|spadConstant| $ 22) (|spadConstant| $ 21)))
              ('T
               (SEQ
                (LETT |l|
                      (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 95))
                                (SPADCALL (QVELT UV 1) (QREFELT $ 95))
                                (QREFELT $ 96))
                      . #4#)
                (LETT |gl| (SPADCALL |l| (QREFELT $ 98)) . #4#)
                (LETT |c2|
                      (PROG2
                          (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 16))
                                . #4#)
                          (QCDR #3#)
                        (|check_union2| (QEQCAR #3# 0) (QREFELT $ 7)
                                        (|Union| (QREFELT $ 7) "failed") #3#))
                      . #4#)
                (LETT |rr|
                      (PROG2
                          (LETT #2#
                                (SPADCALL (SPADCALL |UVs| (QREFELT $ 19)) |gl|
                                          (QREFELT $ 24))
                                . #4#)
                          (QCDR #2#)
                        (|check_union2| (QEQCAR #2# 0) (QREFELT $ 6)
                                        (|Union| (QREFELT $ 6) "failed") #2#))
                      . #4#)
                (EXIT
                 (PROGN
                  (LETT #1# (CONS |c2| |rr|) . #4#)
                  (GO #5=#:G1480)))))))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;gcd_naif| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG
         ((|#G272| (|polR|)) (|#G271| (|polR|)) (#1=#:G1491 NIL)
          (#2=#:G1483 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL P (QREFELT $ 31))
             (PROG2
                 (LETT #2#
                       (SPADCALL Q (SPADCALL Q (QREFELT $ 19)) (QREFELT $ 16))
                       . #3=(|PRS;gcd_naif|))
                 (QCDR #2#)
               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                               (|Union| (QREFELT $ 7) #4="failed") #2#)))
            ('T
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 31))
                      (PROGN
                       (LETT #1#
                             (PROG2
                                 (LETT #2#
                                       (SPADCALL P (SPADCALL P (QREFELT $ 19))
                                                 (QREFELT $ 16))
                                       . #3#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT $ 7)
                                               (|Union| (QREFELT $ 7) #4#)
                                               #2#))
                             . #3#)
                       (GO #5=#:G1490)))
                     ((ZEROP (SPADCALL Q (QREFELT $ 20)))
                      (PROGN (LETT #1# (|spadConstant| $ 35) . #3#) (GO #5#)))
                     ('T
                      (PROGN
                       (LETT |#G271| Q . #3#)
                       (LETT |#G272| (QCDR (SPADCALL P Q (QREFELT $ 29)))
                             . #3#)
                       (LETT P |#G271| . #3#)
                       (LETT Q |#G272| . #3#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #1#)))) 

(SDEFUN |PRS;gcd;3polR;45| ((P |polR|) (Q |polR|) ($ |polR|))
        (|PRS;gcd_naif| P Q $)) 

(SDEFUN |PRS;gcd;3polR;46| ((P |polR|) (Q |polR|) ($ |polR|))
        (SPROG ((G (|polR|)) (#1=#:G1494 NIL) (|cQ| (R)) (|cP| (R)))
               (SEQ
                (COND ((SPADCALL P (QREFELT $ 31)) Q)
                      ((SPADCALL Q (QREFELT $ 31)) P)
                      ('T
                       (SEQ
                        (LETT |cP| (SPADCALL P (QREFELT $ 105))
                              . #2=(|PRS;gcd;3polR;46|))
                        (LETT |cQ| (SPADCALL Q (QREFELT $ 105)) . #2#)
                        (LETT P
                              (PROG2
                                  (LETT #1# (SPADCALL P |cP| (QREFELT $ 16))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                (|Union| (QREFELT $ 7)
                                                         #3="failed")
                                                #1#))
                              . #2#)
                        (LETT Q
                              (PROG2
                                  (LETT #1# (SPADCALL Q |cQ| (QREFELT $ 16))
                                        . #2#)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                (|Union| (QREFELT $ 7) #3#)
                                                #1#))
                              . #2#)
                        (LETT G (SPADCALL P Q (QREFELT $ 79)) . #2#)
                        (EXIT
                         (SPADCALL (SPADCALL |cP| |cQ| (QREFELT $ 106))
                                   (SPADCALL G (QREFELT $ 107))
                                   (QREFELT $ 36))))))))) 

(DECLAIM (NOTINLINE |PseudoRemainderSequence;|)) 

(DEFUN |PseudoRemainderSequence| (&REST #1=#:G1500)
  (SPROG NIL
         (PROG (#2=#:G1501)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PseudoRemainderSequence|)
                                               '|domainEqualList|)
                    . #3=(|PseudoRemainderSequence|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PseudoRemainderSequence;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PseudoRemainderSequence|)))))))))) 

(DEFUN |PseudoRemainderSequence;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PseudoRemainderSequence|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|PseudoRemainderSequence| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 108) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|PseudoRemainderSequence|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL (|spadConstant| $ 8) 1 (QREFELT $ 10)))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV $ 52
                      (CONS (|dispatchFunction| |PRS;resultant;2polRR;14|) $)))
           ('T
            (QSETREFV $ 52
                      (CONS (|dispatchFunction| |PRS;resultant;2polRR;15|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV $ 57
                      (CONS
                       (|dispatchFunction| |PRS;resultantEuclidean;2polRR;17|)
                       $)))
           ('T
            (QSETREFV $ 57
                      (CONS
                       (|dispatchFunction| |PRS;resultantEuclidean;2polRR;18|)
                       $))))
          (COND
           ((|HasCategory| |#1| '(|FiniteFieldCategory|))
            (QSETREFV $ 59
                      (CONS
                       (|dispatchFunction|
                        |PRS;semiResultantEuclidean2;2polRR;20|)
                       $)))
           ('T
            (QSETREFV $ 59
                      (CONS
                       (|dispatchFunction|
                        |PRS;semiResultantEuclidean2;2polRR;21|)
                       $))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 99
                       (CONS
                        (|dispatchFunction| |PRS;resultantReduit;2polRR;41|)
                        $))
             (QSETREFV $ 101
                       (CONS
                        (|dispatchFunction|
                         |PRS;resultantReduitEuclidean;2polRR;42|)
                        $))
             (QSETREFV $ 103
                       (CONS
                        (|dispatchFunction|
                         |PRS;semiResultantReduitEuclidean;2polRR;43|)
                        $))
             (COND
              ((|HasCategory| |#1| '(|FiniteFieldCategory|))
               (QSETREFV $ 104
                         (CONS (|dispatchFunction| |PRS;gcd;3polR;45|) $)))
              ('T
               (QSETREFV $ 104
                         (CONS (|dispatchFunction| |PRS;gcd;3polR;46|) $)))))))
          $))) 

(MAKEPROP '|PseudoRemainderSequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (|NonNegativeInteger|) (4 . |monomial|) 'X (10 . |coerce|)
              (|Vector| 7) (15 . *) (|Union| $ '"failed") (21 . |exquo|)
              (|Mapping| 7 7) (27 . |map|) (33 . |leadingCoefficient|)
              (38 . |degree|) (43 . |Zero|) (47 . |Zero|) (51 . |reductum|)
              (56 . |exquo|) (62 . +) (68 . *) (74 . -)
              (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;divide;2polRR;3| (|Boolean|) (80 . |zero?|) (85 . -)
              (90 . ^) (96 . *) (102 . |One|) (106 . *) (|PositiveInteger|)
              (112 . *) |PRS;LazardQuotient;2RNniR;8|
              |PRS;LazardQuotient2;polR2RNnipolR;9| (118 . -)
              (123 . |coefficient|) |PRS;next_sousResultant2;3polRRpolR;11|
              (|Integer|) (129 . |elt|) (135 . -) (141 . +) (147 . |setelt!|)
              (154 . -) (159 . |pseudoRemainder|) (165 . ^) (171 . |resultant|)
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (177 . |pseudoDivide|) (183 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |resultant| 6))
              (189 . |resultantEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultant| 6))
              (195 . |semiResultantEuclidean2|)
              (|Record| (|:| |coef1| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean1;2polRR;22| (201 . >)
              |PRS;indiceSubResultant;2polRNnipolR;23|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;indiceSubResultantEuclidean;2polRNniR;24|
              (|Record| (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;semiIndiceSubResultantEuclidean;2polRNniR;25|
              |PRS;degreeSubResultant;2polRNnipolR;26|
              |PRS;degreeSubResultantEuclidean;2polRNniR;27|
              |PRS;semiDegreeSubResultantEuclidean;2polRNniR;28|
              |PRS;lastSubResultant;3polR;29|
              |PRS;lastSubResultantEuclidean;2polRR;30| (207 . |copy|)
              |PRS;semiLastSubResultantEuclidean;2polRR;31| (|List| 7)
              |PRS;chainSubResultants;2polRL;32| (|List| 9)
              |PRS;schema;2polRL;33| |PRS;subResultantGcd;3polR;34|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;subResultantGcdEuclidean;2polRR;35|
              (|Record| (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean2;2polRR;36|
              (|Record| (|:| |coef1| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean1;2polRR;37|
              (212 . |differentiate|) (217 . *) |PRS;discriminant;polRR;38|
              (223 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;discriminantEuclidean;polRR;39|
              (|Record| (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;semiDiscriminantEuclidean;polRR;40| (|List| 6)
              (229 . |coefficients|) (234 . |concat|) (|List| $) (240 . |gcd|)
              (245 . |resultantReduit|)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7)
                        (|:| |resultantReduit| 6))
              (251 . |resultantReduitEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultantReduit| 6))
              (257 . |semiResultantReduitEuclidean|) (263 . |gcd|)
              (269 . |content|) (274 . |gcd|) (280 . |primitivePart|))
           '#(|subResultantGcdEuclidean| 285 |subResultantGcd| 291
              |semiSubResultantGcdEuclidean2| 297
              |semiSubResultantGcdEuclidean1| 303
              |semiResultantReduitEuclidean| 309 |semiResultantEuclidean2| 315
              |semiResultantEuclidean1| 321 |semiLastSubResultantEuclidean| 327
              |semiIndiceSubResultantEuclidean| 333 |semiDiscriminantEuclidean|
              340 |semiDegreeSubResultantEuclidean| 345 |schema| 352
              |resultantReduitEuclidean| 358 |resultantReduit| 364
              |resultantEuclidean| 370 |resultant| 376 |next_sousResultant2|
              382 |lastSubResultantEuclidean| 390 |lastSubResultant| 396
              |indiceSubResultantEuclidean| 402 |indiceSubResultant| 409 |gcd|
              416 |divide| 422 |discriminantEuclidean| 428 |discriminant| 433
              |degreeSubResultantEuclidean| 438 |degreeSubResultant| 445
              |chainSubResultants| 452 |LazardQuotient2| 458 |LazardQuotient|
              466)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 107
                                                 '(0 6 0 8 2 7 0 6 9 10 1 7 0 6
                                                   12 2 13 0 7 0 14 2 7 15 0 6
                                                   16 2 13 0 17 0 18 1 7 6 0 19
                                                   1 7 9 0 20 0 6 0 21 0 7 0 22
                                                   1 7 0 0 23 2 6 15 0 0 24 2 7
                                                   0 0 0 25 2 7 0 0 0 26 2 7 0
                                                   0 0 27 1 7 30 0 31 1 6 0 0
                                                   32 2 6 0 0 9 33 2 6 0 0 0 34
                                                   0 7 0 35 2 7 0 6 0 36 2 9 0
                                                   37 0 38 1 7 0 0 41 2 7 6 0 9
                                                   42 2 13 7 0 44 45 2 13 0 0 0
                                                   46 2 13 0 0 0 47 3 13 7 0 44
                                                   7 48 1 13 0 0 49 2 7 0 0 0
                                                   50 2 6 0 0 44 51 2 0 6 7 7
                                                   52 2 7 53 0 0 54 2 7 0 44 0
                                                   55 2 0 56 7 7 57 2 0 58 7 7
                                                   59 2 9 30 0 0 62 1 13 0 0 73
                                                   1 7 0 0 86 2 6 0 44 0 87 2 7
                                                   0 0 6 89 1 7 94 0 95 2 94 0
                                                   0 0 96 1 6 0 97 98 2 0 6 7 7
                                                   99 2 0 100 7 7 101 2 0 102 7
                                                   7 103 2 0 7 7 7 104 1 7 6 0
                                                   105 2 6 0 0 0 106 1 7 0 0
                                                   107 2 0 80 7 7 81 2 0 7 7 7
                                                   79 2 0 82 7 7 83 2 0 84 7 7
                                                   85 2 1 102 7 7 103 2 0 58 7
                                                   7 59 2 0 60 7 7 61 2 0 66 7
                                                   7 74 3 0 66 7 7 9 67 1 0 92
                                                   7 93 3 0 66 7 7 9 70 2 0 77
                                                   7 7 78 2 1 100 7 7 101 2 1 6
                                                   7 7 99 2 0 56 7 7 57 2 0 6 7
                                                   7 52 4 0 7 7 7 7 6 43 2 0 64
                                                   7 7 72 2 0 7 7 7 71 3 0 64 7
                                                   7 9 65 3 0 7 7 7 9 63 2 1 7
                                                   7 7 104 2 0 28 7 7 29 1 0 90
                                                   7 91 1 0 6 7 88 3 0 64 7 7 9
                                                   69 3 0 7 7 7 9 68 2 0 75 7 7
                                                   76 4 0 7 7 6 6 9 40 3 0 6 6
                                                   6 9 39)))))
           '|lookupComplete|)) 
