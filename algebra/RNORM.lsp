
(SDEFUN |RNORM;split_expr| ((|e| (F)) (% (|List| F)))
        (SPROG
         ((|i_num| (F)) (|r_num| (F)) (|nrn| (F)) (|cd| (F)) (|i_den| (F))
          (|r_den| (F)) (|u_den| (|SparseUnivariatePolynomial| F))
          (|u_num| (|SparseUnivariatePolynomial| F))
          (|ue| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |ue| (SPADCALL |e| (QREFELT % 15) (QREFELT % 17)))
              (LETT |u_num| (SPADCALL |ue| (QREFELT % 20)))
              (EXIT
               (COND
                ((> (SPADCALL |u_num| (QREFELT % 22)) 1)
                 (|error| "impossible"))
                (#1='T
                 (SEQ (LETT |u_den| (SPADCALL |ue| (QREFELT % 23)))
                      (EXIT
                       (COND
                        ((> (SPADCALL |u_den| (QREFELT % 22)) 1)
                         (|error| "impossible"))
                        (#1#
                         (SEQ
                          (LETT |r_num| (SPADCALL |u_num| 0 (QREFELT % 25)))
                          (LETT |i_num| (SPADCALL |u_num| 1 (QREFELT % 25)))
                          (LETT |cd|
                                (LETT |r_den|
                                      (SPADCALL |u_den| 0 (QREFELT % 25))))
                          (COND
                           ((> (SPADCALL |u_den| (QREFELT % 22)) 0)
                            (SEQ
                             (LETT |i_den| (SPADCALL |u_den| (QREFELT % 26)))
                             (LETT |cd|
                                   (SPADCALL
                                    (SPADCALL |r_den| |r_den| (QREFELT % 27))
                                    (SPADCALL |i_den| |i_den| (QREFELT % 27))
                                    (QREFELT % 28)))
                             (LETT |nrn|
                                   (SPADCALL
                                    (SPADCALL |r_num| |r_den| (QREFELT % 27))
                                    (SPADCALL |i_num| |i_den| (QREFELT % 27))
                                    (QREFELT % 28)))
                             (LETT |i_num|
                                   (SPADCALL
                                    (SPADCALL |i_num| |r_den| (QREFELT % 27))
                                    (SPADCALL |r_num| |i_den| (QREFELT % 27))
                                    (QREFELT % 29)))
                             (EXIT (LETT |r_num| |nrn|)))))
                          (LETT |r_num| (SPADCALL |r_num| |cd| (QREFELT % 30)))
                          (LETT |i_num| (SPADCALL |i_num| |cd| (QREFELT % 30)))
                          (EXIT (LIST |r_num| |i_num|))))))))))))) 

(SDEFUN |RNORM;do_liou1|
        ((|f1| (F)) (|op| (|BasicOperator|)) (|a| (F)) (% (F)))
        (SPROG ((|a1| (F)) (|ia| (F)) (|ra| (F)) (|ll| (|List| F)))
               (SEQ (LETT |ll| (|RNORM;split_expr| |a| %))
                    (LETT |ra| (SPADCALL |ll| 1 (QREFELT % 33)))
                    (LETT |ia| (SPADCALL |ll| 2 (QREFELT % 33)))
                    (COND
                     ((SPADCALL |op| '|Ei| (QREFELT % 37))
                      (COND
                       ((SPADCALL |ra| (|spadConstant| % 38) (QREFELT % 39))
                        (EXIT
                         (SPADCALL (SPADCALL |ia| (QREFELT % 40))
                                   (SPADCALL (QREFELT % 12)
                                             (SPADCALL |ia| (QREFELT % 41))
                                             (QREFELT % 27))
                                   (QREFELT % 28)))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT % 37))
                      (COND
                       ((SPADCALL |ra| (|spadConstant| % 38) (QREFELT % 39))
                        (EXIT
                         (SPADCALL (QREFELT % 12)
                                   (SPADCALL |ia| (QREFELT % 42))
                                   (QREFELT % 27)))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT % 37))
                      (COND
                       ((SPADCALL |ra| |ia| (QREFELT % 39))
                        (EXIT
                         (SEQ
                          (LETT |a1|
                                (SPADCALL (SPADCALL 2 |ra| (QREFELT % 44))
                                          (SPADCALL (SPADCALL (QREFELT % 45))
                                                    (QREFELT % 11))
                                          (QREFELT % 30)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 9) (QREFELT % 12)
                                      (QREFELT % 28))
                            (SPADCALL (SPADCALL |a1| (QREFELT % 46))
                                      (SPADCALL (QREFELT % 12)
                                                (SPADCALL |a1| (QREFELT % 47))
                                                (QREFELT % 27))
                                      (QREFELT % 29))
                            (QREFELT % 27)))))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT % 37))
                      (COND
                       ((SPADCALL |ra| (SPADCALL |ia| (QREFELT % 10))
                                  (QREFELT % 39))
                        (EXIT
                         (SEQ
                          (LETT |a1|
                                (SPADCALL (SPADCALL 2 |ra| (QREFELT % 44))
                                          (SPADCALL (SPADCALL (QREFELT % 45))
                                                    (QREFELT % 11))
                                          (QREFELT % 30)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 9) (QREFELT % 12)
                                      (QREFELT % 29))
                            (SPADCALL (SPADCALL |a1| (QREFELT % 46))
                                      (SPADCALL (QREFELT % 12)
                                                (SPADCALL |a1| (QREFELT % 47))
                                                (QREFELT % 27))
                                      (QREFELT % 28))
                            (QREFELT % 27)))))))))
                    (EXIT |f1|)))) 

(SDEFUN |RNORM;real_k| ((|k| (|Kernel| F)) (% (F)))
        (SPROG ((|arg| (|List| F)) (|op| (|BasicOperator|)) (|kf| (F)))
               (SEQ (LETT |kf| (SPADCALL |k| (QREFELT % 48)))
                    (LETT |op| (SPADCALL |k| (QREFELT % 50)))
                    (LETT |arg| (SPADCALL |k| (QREFELT % 51)))
                    (COND
                     ((EQL (LENGTH |arg|) 1)
                      (COND
                       ((SPADCALL |op| '|prim| (QREFELT % 52))
                        (EXIT
                         (|RNORM;do_liou1| |kf| |op| (|SPADfirst| |arg|)
                          %))))))
                    (EXIT |kf|)))) 

(SDEFUN |RNORM;do_c| ((|c| (F)) (% (F)))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F))) (|v| (F)) (|ia| (F))
          (|ra| (F)) (|ll| (|List| F)) (|a1| (F)) (|arg| (|List| F))
          (|op| (|BasicOperator|)) (#1=#:G50 NIL) (|k| NIL)
          (|lk0| (|List| (|Kernel| F))))
         (SEQ (LETT |lk0| (SPADCALL |c| (QREFELT % 54))) (LETT |lk| NIL)
              (LETT |lv| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# |lk0|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |op| (SPADCALL |k| (QREFELT % 50)))
                        (LETT |arg| (SPADCALL |k| (QREFELT % 51)))
                        (EXIT
                         (COND
                          ((EQL (LENGTH |arg|) 1)
                           (COND
                            ((SPADCALL |k| '|exp| (QREFELT % 55))
                             (SEQ (LETT |a1| (|SPADfirst| |arg|))
                                  (LETT |ll| (|RNORM;split_expr| |a1| %))
                                  (LETT |ra| (SPADCALL |ll| 1 (QREFELT % 33)))
                                  (LETT |ia| (SPADCALL |ll| 2 (QREFELT % 33)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |ra| (|spadConstant| % 38)
                                               (QREFELT % 39))
                                     (SEQ
                                      (LETT |v|
                                            (SPADCALL
                                             (SPADCALL |ia| (QREFELT % 56))
                                             (SPADCALL (QREFELT % 12)
                                                       (SPADCALL |ia|
                                                                 (QREFELT %
                                                                          57))
                                                       (QREFELT % 27))
                                             (QREFELT % 28)))
                                      (LETT |lk| (CONS |k| |lk|))
                                      (EXIT
                                       (LETT |lv| (CONS |v| |lv|))))))))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL (NULL |lk|))
                (EXIT (SPADCALL |c| |lk| |lv| (QREFELT % 59)))))
              (EXIT |c|)))) 

(SDEFUN |RNORM;try_real;FSF;5| ((|f| (F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|res_p| (F)) (|lck1| (|List| F)) (#1=#:G74 NIL) (#2=#:G75 NIL)
          (|k| (|Kernel| F)) (|a1| (F)) (#3=#:G81 NIL) (|k1| NIL) (|a| (F))
          (#4=#:G80 NIL) (|lck| (|List| (|Kernel| F))) (|rpp| (F))
          (#5=#:G76 NIL) (|c| (F)) (|c_den| (F))
          (|den_f| (|SparseUnivariatePolynomial| F))
          (|num_f| (|SparseUnivariatePolynomial| F))
          (|fu| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|arg| (|List| F)) (|op| (|BasicOperator|)) (#6=#:G79 NIL)
          (|lk| (|List| (|Kernel| F))) (#7=#:G77 NIL) (#8=#:G78 NIL))
         (SEQ (LETT |lk| (SPADCALL |f| (QREFELT % 54)))
              (LETT |res_p| (|spadConstant| % 38))
              (SEQ (LETT #8# |lk|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |k| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |fu| (SPADCALL |f| |k| (QREFELT % 17)))
                          (LETT |num_f| (SPADCALL |fu| (QREFELT % 20)))
                          (LETT |den_f| (SPADCALL |fu| (QREFELT % 23)))
                          (COND
                           ((OR (> (SPADCALL |den_f| (QREFELT % 22)) 0)
                                (SPADCALL (SPADCALL |num_f| (QREFELT % 22)) 1
                                          (QREFELT % 60)))
                            (EXIT
                             (PROGN (LETT #7# |$NoValue|) (GO #9=#:G51)))))
                          (LETT |c_den| (SPADCALL |den_f| (QREFELT % 26)))
                          (LETT |c|
                                (SPADCALL (SPADCALL |num_f| (QREFELT % 26))
                                          |c_den| (QREFELT % 30)))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |c| |x| (QREFELT % 61))
                                       (|spadConstant| % 38) (QREFELT % 62))
                             (PROGN (LETT #7# |$NoValue|) (GO #9#)))
                            ('T
                             (SEQ
                              (LETT |res_p|
                                    (SPADCALL
                                     (SPADCALL (|RNORM;do_c| |c| %)
                                               (|RNORM;real_k| |k| %)
                                               (QREFELT % 27))
                                     |res_p| (QREFELT % 28)))
                              (EXIT
                               (LETT |f|
                                     (SPADCALL
                                      (SPADCALL |num_f| 0 (QREFELT % 25))
                                      |c_den| (QREFELT % 30))))))))))
                    #9# (EXIT #7#))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |lk| (SPADCALL |res_p| (QREFELT % 54))) (LETT |lck| NIL)
              (LETT |rpp| |res_p|)
              (SEQ (LETT #6# |lk|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |op| (SPADCALL |k| (QREFELT % 50)))
                          (LETT |arg| (SPADCALL |k| (QREFELT % 51)))
                          (COND
                           ((SPADCALL |op| '|Ci| (QREFELT % 37))
                            (COND
                             ((NULL (EQL (LENGTH |arg|) 1))
                              (EXIT
                               (PROGN (LETT #5# |$NoValue|) (GO #10=#:G57))))))
                           ('T (EXIT (PROGN (LETT #5# |$NoValue|) (GO #10#)))))
                          (LETT |fu| (SPADCALL |rpp| |k| (QREFELT % 17)))
                          (LETT |num_f| (SPADCALL |fu| (QREFELT % 20)))
                          (LETT |den_f| (SPADCALL |fu| (QREFELT % 23)))
                          (COND
                           ((OR (> (SPADCALL |den_f| (QREFELT % 22)) 0)
                                (SPADCALL (SPADCALL |num_f| (QREFELT % 22)) 1
                                          (QREFELT % 60)))
                            (EXIT (PROGN (LETT #5# |$NoValue|) (GO #10#)))))
                          (LETT |c_den| (SPADCALL |den_f| (QREFELT % 26)))
                          (LETT |c|
                                (SPADCALL (SPADCALL |num_f| (QREFELT % 26))
                                          |c_den| (QREFELT % 30)))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |c| |x| (QREFELT % 61))
                                       (|spadConstant| % 38) (QREFELT % 62))
                             (PROGN (LETT #5# |$NoValue|) (GO #10#)))
                            ('T
                             (SEQ (LETT |lck| (CONS |k| |lck|))
                                  (EXIT
                                   (LETT |rpp|
                                         (SPADCALL
                                          (SPADCALL |num_f| 0 (QREFELT % 25))
                                          |c_den| (QREFELT % 30))))))))))
                    #10# (EXIT #5#))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (LETT |lck| (REVERSE (SPADCALL |lck| (QREFELT % 64))))
              (LETT |lck1| NIL)
              (SEQ (LETT #4# |lck|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT % 51))))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |k1| NIL) (LETT #3# |lck|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |k1| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL |k| |k1| (QREFELT % 65))
                                   (PROGN
                                    (LETT #2# |$NoValue|)
                                    (GO #11=#:G69)))
                                  ('T
                                   (SEQ
                                    (EXIT
                                     (SEQ
                                      (LETT |a1|
                                            (|SPADfirst|
                                             (SPADCALL |k1| (QREFELT % 51))))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |a|
                                                   (SPADCALL |a1|
                                                             (QREFELT % 10))
                                                   (QREFELT % 39))
                                         (PROGN
                                          (LETT #1#
                                                (SEQ (LETT |k| |k1|)
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #2# 1)
                                                       (GO #11#)))))
                                          (GO #12=#:G68)))))))
                                    #12# (EXIT #1#))))))
                               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                         #11# (EXIT #2#))
                        (EXIT
                         (LETT |lck1|
                               (CONS (SPADCALL |k| (QREFELT % 48)) |lck1|))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |res_p|
                    (SPADCALL |res_p| |lck| (REVERSE |lck1|) (QREFELT % 59)))
              (EXIT (SPADCALL |f| |res_p| (QREFELT % 28)))))) 

(PUT '|RNORM;try_real;FSF;6| '|SPADreplace| '(XLAM (|f| |x|) |f|)) 

(SDEFUN |RNORM;try_real;FSF;6| ((|f| (F)) (|x| (|Symbol|)) (% (F))) |f|) 

(DECLAIM (NOTINLINE |RealNormalizationUtilities;|)) 

(DEFUN |RealNormalizationUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RealNormalizationUtilities| DV$1 DV$2))
          (LETT % (GETREFV 67))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RealNormalizationUtilities|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
            (PROGN
             (QSETREFV % 12
                       (SPADCALL (SPADCALL (|spadConstant| % 9) (QREFELT % 10))
                                 (QREFELT % 11)))
             (QSETREFV % 15 (SPADCALL (QREFELT % 12) (QREFELT % 14)))
             (QSETREFV % 66
                       (CONS (|dispatchFunction| |RNORM;try_real;FSF;5|) %))))
           ('T
            (QSETREFV % 66
                      (CONS (|dispatchFunction| |RNORM;try_real;FSF;6|) %))))
          %))) 

(DEFUN |RealNormalizationUtilities| (&REST #1=#:G83)
  (SPROG NIL
         (PROG (#2=#:G84)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RealNormalizationUtilities|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RealNormalizationUtilities;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RealNormalizationUtilities|)))))))))) 

(MAKEPROP '|RealNormalizationUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (8 . -) (13 . |sqrt|) '|imf| (|Kernel| %)
              (18 . |retract|) '|imk|
              (|Fraction| (|SparseUnivariatePolynomial| %)) (23 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 18) (29 . |numer|)
              (|NonNegativeInteger|) (34 . |degree|) (39 . |denom|)
              (44 . |Zero|) (48 . |coefficient|) (54 . |leadingCoefficient|)
              (59 . *) (65 . +) (71 . -) (77 . /) (|Integer|) (|List| 7)
              (83 . |elt|) (|Boolean|) (|Symbol|) (|BasicOperator|)
              (89 . |is?|) (95 . |Zero|) (99 . =) (105 . |Ci|) (110 . |Si|)
              (115 . |erfi|) (|PositiveInteger|) (120 . *) (126 . |pi|)
              (130 . |fresnelC|) (135 . |fresnelS|) (140 . |coerce|)
              (|Kernel| 7) (145 . |operator|) (150 . |argument|) (155 . |has?|)
              (|List| 13) (161 . |kernels|) (166 . |is?|) (172 . |cos|)
              (177 . |sin|) (|List| %) (182 . |subst|) (189 . ~=) (195 . D)
              (201 . ~=) (|List| 49) (207 . |removeDuplicates|) (212 . =)
              (218 . |try_real|))
           '#(|try_real| 224) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|try_real| (|#2| |#2| (|Symbol|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 66
                                            '(0 6 0 8 0 7 0 9 1 7 0 0 10 1 7 0
                                              0 11 1 7 13 0 14 2 7 16 0 13 17 1
                                              19 18 0 20 1 18 21 0 22 1 19 18 0
                                              23 0 6 0 24 2 18 7 0 21 25 1 18 7
                                              0 26 2 7 0 0 0 27 2 7 0 0 0 28 2
                                              7 0 0 0 29 2 7 0 0 0 30 2 32 7 0
                                              31 33 2 36 34 0 35 37 0 7 0 38 2
                                              7 34 0 0 39 1 7 0 0 40 1 7 0 0 41
                                              1 7 0 0 42 2 7 0 43 0 44 0 7 0 45
                                              1 7 0 0 46 1 7 0 0 47 1 7 0 13 48
                                              1 49 36 0 50 1 49 32 0 51 2 36 34
                                              0 35 52 1 7 53 0 54 2 49 34 0 35
                                              55 1 7 0 0 56 1 7 0 0 57 3 7 0 0
                                              53 58 59 2 21 34 0 0 60 2 7 0 0
                                              35 61 2 7 34 0 0 62 1 63 0 0 64 2
                                              49 34 0 0 65 2 0 7 7 35 66 2 0 7
                                              7 35 66)))))
           '|lookupComplete|)) 
