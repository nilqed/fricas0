
(SDEFUN |EFSTRUC;realElem| ((|f| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG NIL
               (SPADCALL (CONS #'|EFSTRUC;realElem!0| (VECTOR $ |l|)) |f|
                         (QREFELT $ 18)))) 

(SDEFUN |EFSTRUC;realElem!0| ((|k| NIL) ($$ NIL))
        (PROG (|l| $)
          (LETT |l| (QREFELT $$ 1) . #1=(|EFSTRUC;realElem|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EFSTRUC;k2Elem| |k| |l| $))))) 

(SDEFUN |EFSTRUC;realElementary;FSF;2| ((|f| F) (|x| |Symbol|) ($ F))
        (|EFSTRUC;realElem| |f| (LIST |x|) $)) 

(SDEFUN |EFSTRUC;realElementary;2F;3| ((|f| F) ($ F))
        (|EFSTRUC;realElem| |f| (SPADCALL |f| (QREFELT $ 22)) $)) 

(SDEFUN |EFSTRUC;realLiouvillian;2F;4| ((|f| F) ($ F))
        (SPADCALL (CONS (|function| |EFSTRUC;k_to_liou|) $) |f| (QREFELT $ 18))) 

(SDEFUN |EFSTRUC;realLiouvillian;FSF;5| ((|f| F) (|x| |Symbol|) ($ F))
        (SPROG NIL
               (SPADCALL
                (CONS #'|EFSTRUC;realLiouvillian;FSF;5!0| (VECTOR $ |x|)) |f|
                (QREFELT $ 18)))) 

(SDEFUN |EFSTRUC;realLiouvillian;FSF;5!0| ((|k| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|EFSTRUC;realLiouvillian;FSF;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|EFSTRUC;k_to_liou1| |k| |x| $))))) 

(SDEFUN |EFSTRUC;toY| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G823 NIL) (|k| NIL) (#2=#:G822 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toY|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoY| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toZ| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G827 NIL) (|k| NIL) (#2=#:G826 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toZ|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoZ| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toU| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G831 NIL) (|k| NIL) (#2=#:G830 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toU|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoU| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toV| ((|ker| |List| (|Kernel| F)) ($ |List| F))
        (SPROG ((|func| (F)) (#1=#:G835 NIL) (|k| NIL) (#2=#:G834 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toV|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (LETT |func| (|EFSTRUC;ktoV| |k| $) . #3#)
                                    (|spadConstant| $ 26) (QREFELT $ 28))
                          (LETT #2# (CONS |func| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;toR|
        ((|ker| |List| (|Kernel| F)) (|x| F) ($ |List| (|Kernel| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|EFSTRUC;toR!0| (VECTOR |x| $)) |ker|
                         (QREFELT $ 37)))) 

(SDEFUN |EFSTRUC;toR!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|EFSTRUC;toR|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |s| '|nthRoot| (QREFELT $ 30))
              (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 32)) (QREFELT $ 33))
                        |x| (QREFELT $ 34)))
             ('T NIL)))))) 

(SDEFUN |EFSTRUC;tanQ;F2F;11| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G851 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |x|
                            (PROG1
                                (LETT #1# (SPADCALL |c| (QREFELT $ 39))
                                      |EFSTRUC;tanQ;F2F;11|)
                              (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                                '(|Integer|) #1#))
                            (QREFELT $ 43))
                  (QREFELT $ 45))
                 (QREFELT $ 47))
                (SPADCALL |c| (QREFELT $ 48)) (QREFELT $ 49)))) 

(SDEFUN |EFSTRUC;tanQ;F2F;12| ((|c| |Fraction| (|Integer|)) (|x| F) ($ F))
        (SPROG ((#1=#:G854 NIL))
               (SPADCALL
                (SPADCALL
                 (SPADCALL |x|
                           (PROG1
                               (LETT #1# (SPADCALL |c| (QREFELT $ 39))
                                     |EFSTRUC;tanQ;F2F;12|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (QREFELT $ 43))
                 (QREFELT $ 45))
                (SPADCALL |c| (QREFELT $ 48)) (QREFELT $ 49)))) 

(SDEFUN |EFSTRUC;tanSum| ((|c| F) (|l| |List| F) ($ F))
        (SPROG ((#1=#:G863 NIL) (|r| (|Union| (|Integer|) "failed")) (|k| (F)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |k| (SPADCALL |c| (QREFELT $ 16) (QREFELT $ 15))
                        . #2=(|EFSTRUC;tanSum|))
                  (SEQ (LETT |r| (SPADCALL |k| (QREFELT $ 52)) . #2#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 0)
                          (COND
                           ((ODDP (QCDR |r|))
                            (PROGN
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |l| (QREFELT $ 53))
                                              (QREFELT $ 54))
                                    (QREFELT $ 14))
                                   . #2#)
                             (GO #3=#:G861))))))))
                  (EXIT
                   (SPADCALL (CONS (SPADCALL |c| (QREFELT $ 55)) |l|)
                             (QREFELT $ 53)))))
                #3# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;findQRelation|
        ((|lv| . #1=(|List| (|Symbol|))) (|lpar| |List| (|Symbol|))
         (|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#2=#:G889 NIL) (|j| NIL) (#3=#:G890 NIL) (|k| NIL) (#4=#:G887 NIL)
          (|i| NIL) (#5=#:G888 NIL) (|var| NIL) (|mat| (|Matrix| F))
          (|isconstant| (|Boolean|)) (#6=#:G885 NIL) (#7=#:G886 NIL)
          (|v| (|Vector| F)) (|lvv| #1#) (|m| (|NonNegativeInteger|))
          (#8=#:G883 NIL) (#9=#:G884 NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#10='T
                 (SEQ (LETT |isconstant| 'T . #11=(|EFSTRUC;findQRelation|))
                      (LETT |m| (LENGTH |lv|) . #11#) (LETT |lvv| |lv| . #11#)
                      (LETT |n| (LENGTH |lk|) . #11#)
                      (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)) . #11#)
                      (SEQ (LETT |var| NIL . #11#) (LETT #9# |lv| . #11#)
                           (LETT |i| 1 . #11#) (LETT #8# |m| . #11#) G190
                           (COND
                            ((OR (|greater_SI| |i| #8#) (ATOM #9#)
                                 (PROGN (LETT |var| (CAR #9#) . #11#) NIL))
                             (GO G191)))
                           (SEQ
                            (SPADCALL |v| |i|
                                      (SPADCALL |ker| |var| (QREFELT $ 57))
                                      (QREFELT $ 59))
                            (EXIT
                             (COND
                              (|isconstant|
                               (LETT |isconstant|
                                     (SPADCALL
                                      (SPADCALL |v| |i| (QREFELT $ 60))
                                      (|spadConstant| $ 26) (QREFELT $ 34))
                                     . #11#)))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #9# (CDR #9#) . #11#))
                                 . #11#)
                           (GO G190) G191 (EXIT NIL))
                      (COND
                       (|isconstant|
                        (SEQ (LETT |m| (LENGTH |lpar|) . #11#)
                             (LETT |lvv| |lpar| . #11#)
                             (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26))
                                   . #11#)
                             (EXIT
                              (SEQ (LETT |var| NIL . #11#)
                                   (LETT #7# |lpar| . #11#) (LETT |i| 1 . #11#)
                                   (LETT #6# |m| . #11#) G190
                                   (COND
                                    ((OR (|greater_SI| |i| #6#) (ATOM #7#)
                                         (PROGN
                                          (LETT |var| (CAR #7#) . #11#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (SPADCALL |v| |i|
                                              (SPADCALL |ker| |var|
                                                        (QREFELT $ 57))
                                              (QREFELT $ 59))
                                    (EXIT
                                     (COND
                                      (|isconstant|
                                       (LETT |isconstant|
                                             (SPADCALL
                                              (SPADCALL |v| |i| (QREFELT $ 60))
                                              (|spadConstant| $ 26)
                                              (QREFELT $ 34))
                                             . #11#)))))
                                   (LETT |i|
                                         (PROG1 (|inc_SI| |i|)
                                           (LETT #7# (CDR #7#) . #11#))
                                         . #11#)
                                   (GO G190) G191 (EXIT NIL))))))
                      (EXIT
                       (COND
                        (|isconstant|
                         (SEQ
                          (SPADCALL (SPADCALL |ker| (QREFELT $ 62))
                                    (QREFELT $ 64))
                          (EXIT (|error| "Hidden constant detected"))))
                        (#10#
                         (SEQ
                          (LETT |mat|
                                (MAKE_MATRIX1 |m| |n| (|spadConstant| $ 26))
                                . #11#)
                          (SEQ (LETT |var| NIL . #11#) (LETT #5# |lvv| . #11#)
                               (LETT |i| 1 . #11#) (LETT #4# |m| . #11#) G190
                               (COND
                                ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                                     (PROGN (LETT |var| (CAR #5#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |k| NIL . #11#)
                                      (LETT #3# |lk| . #11#)
                                      (LETT |j| 1 . #11#) (LETT #2# |n| . #11#)
                                      G190
                                      (COND
                                       ((OR (|greater_SI| |j| #2#) (ATOM #3#)
                                            (PROGN
                                             (LETT |k| (CAR #3#) . #11#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |mat| |i| |j|
                                                  (SPADCALL |k| |var|
                                                            (QREFELT $ 57))
                                                  (QREFELT $ 66))))
                                      (LETT |j|
                                            (PROG1 (|inc_SI| |j|)
                                              (LETT #3# (CDR #3#) . #11#))
                                            . #11#)
                                      (GO G190) G191 (EXIT NIL))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #5# (CDR #5#) . #11#))
                                     . #11#)
                               (GO G190) G191 (EXIT NIL))
                          (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 69)) . #11#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#10# (CONS 2 'T)))))))))))))) 

(SDEFUN |EFSTRUC;findLinearRelation1|
        ((|lk| |List| F) (|ker| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#1=#:G898 NIL) (|j| NIL) (#2=#:G899 NIL) (|k| NIL)
          (|v| (|Vector| F)) (|mat| (|Matrix| F)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |lk|) (CONS 2 'T))
                (#3='T
                 (SEQ
                  (LETT |n| (LENGTH |lk|) . #4=(|EFSTRUC;findLinearRelation1|))
                  (LETT |mat| (MAKE_MATRIX1 1 |n| (|spadConstant| $ 26)) . #4#)
                  (LETT |v| (MAKEARR1 1 |ker|) . #4#)
                  (SEQ (LETT |k| NIL . #4#) (LETT #2# |lk| . #4#)
                       (LETT |j| 1 . #4#) (LETT #1# |n| . #4#) G190
                       (COND
                        ((OR (|greater_SI| |j| #1#) (ATOM #2#)
                             (PROGN (LETT |k| (CAR #2#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |k| (QREFELT $ 22)))
                           (SPADCALL |mat| 1 |j| |k| (QREFELT $ 66)))
                          ('T
                           (SPADCALL |mat| 1 |j| (|spadConstant| $ 26)
                                     (QREFELT $ 66))))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #2# (CDR #2#) . #4#))
                             . #4#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 69)) . #4#)
                  (EXIT
                   (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                         (#3# (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;transkers| ((|x| |List| (|Kernel| F)) ($ |List| (|Kernel| F)))
        (SPROG ((#1=#:G904 NIL) (|k| NIL) (#2=#:G903 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;transkers|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |x| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 74))
                                     (QREFELT $ 72) (QREFELT $ 75)))
                          (LETT #2# (CONS |k| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;ktoQ| ((|ker| |Kernel| F) ($ |Fraction| (|Integer|)))
        (SPROG ((|qu| (|Union| (|Fraction| (|Integer|)) "failed")) (|z| (F)))
               (SEQ
                (COND
                 ((SPADCALL |ker| '|log| (QREFELT $ 30))
                  (COND
                   ((|HasCategory| (QREFELT $ 7)
                                   (LIST '|RetractableTo|
                                         (LIST '|Fraction| '(|Integer|))))
                    (EXIT
                     (SEQ
                      (LETT |z|
                            (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1
                                      (QREFELT $ 76))
                            . #1=(|EFSTRUC;ktoQ|))
                      (LETT |qu| (SPADCALL |z| (QREFELT $ 78)) . #1#)
                      (EXIT
                       (COND ((QEQCAR |qu| 0) (QCDR |qu|))
                             ('T (|spadConstant| $ 79))))))))))
                (EXIT (|spadConstant| $ 79))))) 

(SDEFUN |EFSTRUC;toQ|
        ((|lk| |List| (|Kernel| F)) ($ |List| (|Fraction| (|Integer|))))
        (SPROG ((#1=#:G924 NIL) (|k| NIL) (#2=#:G923 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|EFSTRUC;toQ|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |k| '|log| (QREFELT $ 30)) 'T)
                                ('T (SPADCALL |k| '|exp| (QREFELT $ 30))))
                          (LETT #2# (CONS (|EFSTRUC;ktoQ| |k| $) #2#)
                                . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EFSTRUC;findLinearRelation2|
        ((|lk| |List| (|Kernel| F)) (|lz| |List| F) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nz| (F)) (|ly| (|List| F)) (#1=#:G974 NIL) (|x| NIL)
          (#2=#:G973 NIL) (#3=#:G972 NIL) (#4=#:G971 NIL)
          (|lpars1f| (|List| F)) (#5=#:G970 NIL) (|s| NIL) (#6=#:G969 NIL)
          (|lpars1| (|List| (|Symbol|))) (#7=#:G968 NIL) (|k| NIL)
          (#8=#:G967 NIL) (|lpars0| #9=(|List| (|Kernel| F))) (#10=#:G964 NIL)
          (|vv| (|Vector| (|Fraction| (|Integer|)))) (|lz1tonq| (F))
          (|kertond| (F)) (|nd| (|Integer|)) (|nq| (|Integer|))
          (|qratio| (|Fraction| (|Integer|)))
          (|fratio| (|Union| (|Float|) "failed")) (|Fratio| (F))
          (#11=#:G965 NIL) (|z1| NIL) (#12=#:G966 NIL) (|i| NIL)
          (|m| (|NonNegativeInteger|)) (|kerF| (F))
          (|u| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|q| (|Fraction| (|Integer|))) (|zkers| #9#) (|z| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1 (QREFELT $ 76))
                  . #13=(|EFSTRUC;findLinearRelation2|))
            (LETT |zkers| (|EFSTRUC;transkers| (SPADCALL |z| (QREFELT $ 81)) $)
                  . #13#)
            (EXIT
             (COND
              ((NULL |zkers|)
               (SEQ (LETT |q| (|EFSTRUC;ktoQ| |ker| $) . #13#)
                    (COND
                     ((NULL
                       (SPADCALL |q| (|spadConstant| $ 79) (QREFELT $ 82)))
                      (COND
                       ((NULL
                         (SPADCALL |q|
                                   (SPADCALL (|spadConstant| $ 79)
                                             (QREFELT $ 83))
                                   (QREFELT $ 82)))
                        (EXIT
                         (SEQ
                          (LETT |u|
                                (SPADCALL (|EFSTRUC;toQ| |lk| $) |q|
                                          (QREFELT $ 86))
                                . #13#)
                          (EXIT
                           (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                                 (#14='T (CONS 2 'T))))))))))
                    (LETT |kerF| (SPADCALL |ker| (QREFELT $ 88)) . #13#)
                    (COND
                     ((|domainEqual| (QREFELT $ 7)
                                     (|Expression| (QREFELT $ 6)))
                      (COND
                       ((|HasCategory| (QREFELT $ 6)
                                       (LIST '|ConvertibleTo| '(|Float|)))
                        (COND
                         ((|HasCategory| (QREFELT $ 6) '(|IntegralDomain|))
                          (COND
                           ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                            (EXIT
                             (SEQ (LETT |m| (LENGTH |lz|) . #13#)
                                  (SEQ (LETT |i| 1 . #13#)
                                       (LETT #12# |m| . #13#)
                                       (LETT |z1| NIL . #13#)
                                       (LETT #11# |lz| . #13#) G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN
                                              (LETT |z1| (CAR #11#) . #13#)
                                              NIL)
                                             (|greater_SI| |i| #12#))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |Fratio|
                                              (SPADCALL |kerF|
                                                        (SPADCALL |z1|
                                                                  (QREFELT $
                                                                           89))
                                                        (QREFELT $ 15))
                                              . #13#)
                                        (LETT |fratio|
                                              (SPADCALL |Fratio| 20
                                                        (QREFELT $ 93))
                                              . #13#)
                                        (EXIT
                                         (COND
                                          ((QEQCAR |fratio| 0)
                                           (SEQ
                                            (LETT |qratio|
                                                  (SPADCALL (QCDR |fratio|) 8
                                                            (QREFELT $ 96))
                                                  . #13#)
                                            (COND
                                             ((OR
                                               (SPADCALL |qratio|
                                                         (|spadConstant| $ 97)
                                                         (QREFELT $ 82))
                                               (OR
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QCDR |fratio|)
                                                             (SPADCALL |qratio|
                                                                       (QREFELT
                                                                        $ 98))
                                                             (QREFELT $ 99))
                                                   (SPADCALL 1 0 10
                                                             (QREFELT $ 100))
                                                   (QREFELT $ 101))
                                                  (QREFELT $ 102))
                                                 (SPADCALL 1 -16 10
                                                           (QREFELT $ 100))
                                                 (QREFELT $ 103))
                                                (OR
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nq|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            48))
                                                         . #13#))
                                                  100 (QREFELT $ 104))
                                                 (SPADCALL
                                                  (ABS
                                                   (LETT |nd|
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            39))
                                                         . #13#))
                                                  100 (QREFELT $ 104)))))
                                              (EXIT "iterate")))
                                            (LETT |kertond|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |ker|
                                                              (QREFELT $ 32))
                                                    1 (QREFELT $ 76))
                                                   |nd| (QREFELT $ 105))
                                                  . #13#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |nq| 0
                                                         (QREFELT $ 104))
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| |nq|
                                                                (QREFELT $
                                                                         105))
                                                      . #13#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL |kertond|
                                                             |lz1tonq|
                                                             (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             107))
                                                          . #13#)
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|)
                                                            . #13#)
                                                      (GO #15=#:G963)))))))))
                                              ('T
                                               (SEQ
                                                (LETT |lz1tonq|
                                                      (SPADCALL |z1| (- |nq|)
                                                                (QREFELT $
                                                                         105))
                                                      . #13#)
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |kertond|
                                                              |lz1tonq|
                                                              (QREFELT $ 108))
                                                    (|spadConstant| $ 71)
                                                    (QREFELT $ 34))
                                                   (SEQ
                                                    (LETT |vv|
                                                          (SPADCALL |m|
                                                                    (QREFELT $
                                                                             107))
                                                          . #13#)
                                                    (QSETAREF1O |vv| |i|
                                                                |qratio| 1)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #10# (CONS 0 |vv|)
                                                            . #13#)
                                                      (GO #15#))))))))))))))))
                                       (LETT #11#
                                             (PROG1 (CDR #11#)
                                               (LETT |i| (|inc_SI| |i|)
                                                     . #13#))
                                             . #13#)
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT (CONS 2 'T))))))))))))
                    (EXIT (CONS 2 'T))))
              (#14#
               (SEQ (LETT |lpars0| (|EFSTRUC;transkers| |lk| $) . #13#)
                    (LETT |lpars1|
                          (PROGN
                           (LETT #8# NIL . #13#)
                           (SEQ (LETT |k| NIL . #13#)
                                (LETT #7# |lpars0| . #13#) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |k| (CAR #7#) . #13#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #8#
                                        (CONS (SPADCALL (QREFELT $ 109)) #8#)
                                        . #13#)))
                                (LETT #7# (CDR #7#) . #13#) (GO G190) G191
                                (EXIT (NREVERSE #8#))))
                          . #13#)
                    (LETT |lpars1f|
                          (PROGN
                           (LETT #6# NIL . #13#)
                           (SEQ (LETT |s| NIL . #13#)
                                (LETT #5# |lpars1| . #13#) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |s| (CAR #5#) . #13#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |s| (QREFELT $ 110))
                                          (QREFELT $ 88))
                                         #6#)
                                        . #13#)))
                                (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                                (EXIT (NREVERSE #6#))))
                          . #13#)
                    (COND
                     ((SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #4# NIL . #13#)
                              (SEQ (LETT |x| NIL . #13#) (LETT #3# |lz| . #13#)
                                   G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |x| (CAR #3#) . #13#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 112))
                                             (QREFELT $ 89))
                                            #4#)
                                           . #13#)))
                                   (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             . #13#)
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 112))
                               (QREFELT $ 89))
                              . #13#))))
                     ((NULL (SPADCALL |ker| '|atan| (QREFELT $ 30)))
                      (|error|
                       "findLinearRelation2: kernel should be log or atan"))
                     ('T
                      (SEQ
                       (LETT |ly|
                             (PROGN
                              (LETT #2# NIL . #13#)
                              (SEQ (LETT |x| NIL . #13#) (LETT #1# |lz| . #13#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |x| (CAR #1#) . #13#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL
                                             (SPADCALL |x| |lpars0| |lpars1f|
                                                       (QREFELT $ 112))
                                             (QREFELT $ 113))
                                            #2#)
                                           . #13#)))
                                   (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             . #13#)
                       (EXIT
                        (LETT |nz|
                              (SPADCALL
                               (SPADCALL |z| |lpars0| |lpars1f|
                                         (QREFELT $ 112))
                               (QREFELT $ 113))
                              . #13#)))))
                    (EXIT
                     (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
          #15# (EXIT #10#)))) 

(SDEFUN |EFSTRUC;findRelation|
        ((|lv| |List| (|Symbol|)) (|lpar| |List| (|Symbol|))
         (|lk| |List| (|Kernel| F)) (|ker| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG ((#1=#:G994 NIL) (|x| NIL) (#2=#:G993 NIL))
               (SEQ
                (COND
                 ((OR (SPADCALL |ker| '|log| (QREFELT $ 30))
                      (SPADCALL |ker| '|exp| (QREFELT $ 30)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 88)) (QREFELT $ 22)))
                    (COND
                     ((SPADCALL |ker| '|exp| (QREFELT $ 30))
                      (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toY| |lk| $)
                       (|EFSTRUC;ktoY| |ker| $) $))
                     (#3='T
                      (|EFSTRUC;findLinearRelation2| |lk|
                       (|EFSTRUC;toZ| |lk| $) |ker| $))))
                   (#3#
                    (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toY| |lk| $)
                     (|EFSTRUC;ktoY| |ker| $) $))))
                 ((OR (SPADCALL |ker| '|atan| (QREFELT $ 30))
                      (SPADCALL |ker| '|tan| (QREFELT $ 30)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |ker| (QREFELT $ 88)) (QREFELT $ 22)))
                    (COND
                     ((SPADCALL |ker| '|tan| (QREFELT $ 30))
                      (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toU| |lk| $)
                       (|EFSTRUC;ktoU| |ker| $) $))
                     (#3#
                      (|EFSTRUC;findLinearRelation2| |lk|
                       (|EFSTRUC;toV| |lk| $) |ker| $))))
                   (#3#
                    (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toU| |lk| $)
                     (|EFSTRUC;ktoU| |ker| $) $))))
                 ('T
                  (COND
                   ((SPADCALL |ker| '|nthRoot| (QREFELT $ 30))
                    (|EFSTRUC;rootDep| |lk| |ker| $))
                   (#3#
                    (SEQ
                     (COND
                      ((QREFELT $ 10)
                       (COND
                        ((SPADCALL |ker| '|factorial| (QREFELT $ 30))
                         (EXIT
                          (|EFSTRUC;factdeprel|
                           (PROGN
                            (LETT #2# NIL . #4=(|EFSTRUC;findRelation|))
                            (SEQ (LETT |x| NIL . #4#) (LETT #1# |lk| . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((COND
                                      ((SPADCALL |x| '|factorial|
                                                 (QREFELT $ 30))
                                       (SPADCALL |x| |ker| (QREFELT $ 114)))
                                      (#3# NIL))
                                     (LETT #2# (CONS |x| #2#) . #4#)))))
                                 (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           |ker| $))))))
                     (EXIT (CONS 2 'T)))))))))) 

(SDEFUN |EFSTRUC;ktoY| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ((SPADCALL |k| '|lambertW| (QREFELT $ 30))
          (SPADCALL |k| (QREFELT $ 88)))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoZ| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ((SPADCALL |k| '|exp| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|lambertW| (QREFELT $ 30))
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                    (SPADCALL |k| (QREFELT $ 88)) (QREFELT $ 15)))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoU| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|atan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;ktoV| ((|k| |Kernel| F) ($ F))
        (COND
         ((SPADCALL |k| '|tan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 88)))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
         ('T (|spadConstant| $ 26)))) 

(SDEFUN |EFSTRUC;smp_map|
        ((|f| |Mapping| F (|Kernel| F))
         (|p| |SparseMultivariatePolynomial| R (|Kernel| F)) ($ F))
        (SPADCALL |f| (ELT $ 115) |p| (QREFELT $ 119))) 

(SDEFUN |EFSTRUC;rmap;M2F;26| ((|f| |Mapping| F (|Kernel| F)) (|e| F) ($ F))
        (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 121)) $)
                  (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 122)) $)
                  (QREFELT $ 15))) 

(SDEFUN |EFSTRUC;k2Elem0|
        ((|k| |Kernel| F) (|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG ((|tz2| (F)) (|iez| (F)) (|ez| (F)) (|z| (F)))
               (SEQ (LETT |z| (|SPADfirst| |args|) . #1=(|EFSTRUC;k2Elem0|))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT $ 128))
                       (COND
                        ((SPADCALL |z| (QREFELT $ 129)) (|spadConstant| $ 26))
                        (#2='T
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| (QREFELT $ 130))
                                    (SPADCALL |z| (QREFELT $ 89))
                                    (QREFELT $ 108))
                          (QREFELT $ 131)))))
                      ((SPADCALL |op| '|cot| (QREFELT $ 128))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 55)) (QREFELT $ 54)))
                      ((SPADCALL |op| '|acot| (QREFELT $ 128))
                       (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                                 (QREFELT $ 113)))
                      ((SPADCALL |op| '|asin| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL |z|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 71)
                                             (SPADCALL |z| 2 (QREFELT $ 132))
                                             (QREFELT $ 133))
                                   (QREFELT $ 134))
                                  (QREFELT $ 15))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|acos| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 71)
                                    (SPADCALL |z| 2 (QREFELT $ 132))
                                    (QREFELT $ 133))
                          (QREFELT $ 134))
                         |z| (QREFELT $ 15))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|asec| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                   (|spadConstant| $ 71) (QREFELT $ 133))
                         (QREFELT $ 134))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|acsc| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                    (|spadConstant| $ 71) (QREFELT $ 133))
                          (QREFELT $ 134))
                         (QREFELT $ 54))
                        (QREFELT $ 113)))
                      ((SPADCALL |op| '|asinh| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 71)
                                    (SPADCALL |z| 2 (QREFELT $ 132))
                                    (QREFELT $ 135))
                          (QREFELT $ 134))
                         |z| (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((SPADCALL |op| '|acosh| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                    (|spadConstant| $ 71) (QREFELT $ 133))
                          (QREFELT $ 134))
                         |z| (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((SPADCALL |op| '|atanh| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 71) (QREFELT $ 135))
                          (SPADCALL (|spadConstant| $ 71) |z| (QREFELT $ 133))
                          (QREFELT $ 15))
                         (QREFELT $ 89))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|acoth| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |z| (|spadConstant| $ 71) (QREFELT $ 135))
                          (SPADCALL |z| (|spadConstant| $ 71) (QREFELT $ 133))
                          (QREFELT $ 15))
                         (QREFELT $ 89))
                        (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                      ((SPADCALL |op| '|asech| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |z| 2 (QREFELT $ 132))
                                              (QREFELT $ 54))
                                    (|spadConstant| $ 71) (QREFELT $ 133))
                                   (QREFELT $ 134))
                                  (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((SPADCALL |op| '|acsch| (QREFELT $ 128))
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| (QREFELT $ 54))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 71)
                                             (SPADCALL
                                              (SPADCALL |z| 2 (QREFELT $ 132))
                                              (QREFELT $ 54))
                                             (QREFELT $ 135))
                                   (QREFELT $ 134))
                                  (QREFELT $ 135))
                        (QREFELT $ 89)))
                      ((OR (SPADCALL |op| '|%paren| (QREFELT $ 128))
                           (SPADCALL |op| '|%box| (QREFELT $ 128)))
                       (COND ((NULL (CDR |args|)) |z|)
                             (#2# (SPADCALL |k| (QREFELT $ 88)))))
                      ('T
                       (SEQ
                        (COND
                         ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 75))
                          (LETT |iez|
                                (SPADCALL
                                 (LETT |ez| (SPADCALL |z| (QREFELT $ 131))
                                       . #1#)
                                 (QREFELT $ 54))
                                . #1#)))
                        (EXIT
                         (COND
                          ((SPADCALL |op| '|sinh| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 133))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|cosh| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 135))
                                     (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|tanh| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 133))
                                     (SPADCALL |ez| |iez| (QREFELT $ 135))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|coth| (QREFELT $ 128))
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 135))
                                     (SPADCALL |ez| |iez| (QREFELT $ 133))
                                     (QREFELT $ 15)))
                          ((SPADCALL |op| '|sech| (QREFELT $ 128))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 135))
                                      (QREFELT $ 54))
                                     (QREFELT $ 136)))
                          ((SPADCALL |op| '|csch| (QREFELT $ 128))
                           (SPADCALL 2
                                     (SPADCALL
                                      (SPADCALL |ez| |iez| (QREFELT $ 133))
                                      (QREFELT $ 54))
                                     (QREFELT $ 136)))
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 75))
                              (LETT |tz2|
                                    (SPADCALL
                                     (SPADCALL |z| (SPADCALL 2 (QREFELT $ 13))
                                               (QREFELT $ 15))
                                     (QREFELT $ 55))
                                    . #1#)))
                            (EXIT
                             (COND
                              ((SPADCALL |op| '|sin| (QREFELT $ 128))
                               (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 136))
                                         (SPADCALL (|spadConstant| $ 71)
                                                   (SPADCALL |tz2| 2
                                                             (QREFELT $ 132))
                                                   (QREFELT $ 135))
                                         (QREFELT $ 15)))
                              ((SPADCALL |op| '|cos| (QREFELT $ 128))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 133))
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 135))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|sec| (QREFELT $ 128))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 135))
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 133))
                                (QREFELT $ 15)))
                              ((SPADCALL |op| '|csc| (QREFELT $ 128))
                               (SPADCALL
                                (SPADCALL (|spadConstant| $ 71)
                                          (SPADCALL |tz2| 2 (QREFELT $ 132))
                                          (QREFELT $ 135))
                                (SPADCALL 2 |tz2| (QREFELT $ 136))
                                (QREFELT $ 15)))
                              (#2#
                               (SPADCALL |op| |args|
                                         (QREFELT $ 138)))))))))))))))) 

(SDEFUN |EFSTRUC;do_int| ((|op| |BasicOperator|) (|args| |List| F) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#1=#:G1057 NIL) (|v| NIL) (#2=#:G1056 NIL)
          (|vfs| (|List| F)) (#3=#:G1055 NIL) (#4=#:G1054 NIL)
          (|vars| (|List| (|Symbol|))) (|kf1| (F)))
         (SEQ
          (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 138))
                . #5=(|EFSTRUC;do_int|))
          (LETT |vars| (SPADCALL |kf1| (QREFELT $ 22)) . #5#)
          (LETT |vfs|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |v| NIL . #5#) (LETT #3# |vars| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 139)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (LETT |dvs|
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |v| NIL . #5#) (LETT #1# |vars| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 140))
                                         (QREFELT $ 24))
                               #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #5#)
          (EXIT
           (SPADCALL (QREFELT $ 127) (SPADCALL |vfs| |dvs| (QREFELT $ 141))
                     (QREFELT $ 142)))))) 

(SDEFUN |EFSTRUC;k_to_liou| ((|k| |Kernel| F) ($ F))
        (SPROG
         ((#1=#:G1072 NIL) (#2=#:G1071 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G1074 NIL) (|a| NIL) (#4=#:G1073 NIL)
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 74)) . #5=(|EFSTRUC;k_to_liou|))
          (LETT |args|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #3# (SPADCALL |k| (QREFELT $ 32)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 24)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 88)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 75))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 128)))
                         (EXIT (|EFSTRUC;do_int| |op| |args| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 143)) . #5#)
                     (COND
                      ((EQUAL |nm| '|polylog|)
                       (SEQ
                        (LETT |iu|
                              (SPADCALL (|SPADfirst| |args|) (QREFELT $ 52))
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |iu| 0)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (SEQ (LETT |i| (QCDR |iu|) . #5#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| 0 (QREFELT $ 104))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #6=#:G1065))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #6# (EXIT #2#))
                                  . #5#)
                            (GO #7=#:G1068))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #7# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;do_int1|
        ((|op| |BasicOperator|) (|args| |List| F) (|x| . #1=(|Symbol|)) ($ F))
        (SPROG
         ((|dvs| (|List| F)) (#2=#:G1082 NIL) (|v| NIL) (#3=#:G1081 NIL)
          (|vfs| (|List| F)) (#4=#:G1080 NIL) (#5=#:G1079 NIL)
          (|vars| (|List| #1#)) (|kf1| (F)))
         (SEQ
          (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 138))
                . #6=(|EFSTRUC;do_int1|))
          (LETT |vars| (LIST |x|) . #6#)
          (LETT |vfs|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |v| NIL . #6#) (LETT #4# |vars| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (SPADCALL |v| (QREFELT $ 139)) #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |dvs|
                (PROGN
                 (LETT #3# NIL . #6#)
                 (SEQ (LETT |v| NIL . #6#) (LETT #2# |vars| . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 140))
                                         |x| (QREFELT $ 25))
                               #3#)
                              . #6#)))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #6#)
          (EXIT
           (SPADCALL (QREFELT $ 127) (SPADCALL |vfs| |dvs| (QREFELT $ 141))
                     (QREFELT $ 142)))))) 

(SDEFUN |EFSTRUC;k_to_liou1| ((|k| |Kernel| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((#1=#:G1106 NIL) (#2=#:G1105 NIL) (|i| (|Integer|))
          (|iu| (|Union| (|Integer|) "failed")) (|nm| (|Symbol|))
          (|args| (|List| F)) (#3=#:G1108 NIL) (|a| NIL) (#4=#:G1107 NIL)
          (|op| (|BasicOperator|)))
         (SEQ
          (LETT |op| (SPADCALL |k| (QREFELT $ 74)) . #5=(|EFSTRUC;k_to_liou1|))
          (LETT |args|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #3# (SPADCALL |k| (QREFELT $ 32)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |a| |x| (QREFELT $ 25)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 88)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 75))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 128)))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 143)) . #5#)
                     (COND
                      ((EQUAL |nm| '|Gamma2|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| |args|) |x| (QREFELT $ 140))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|polylog|)
                       (SEQ
                        (LETT |iu|
                              (SPADCALL (|SPADfirst| |args|) (QREFELT $ 52))
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |iu| 0)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (SEQ (LETT |i| (QCDR |iu|) . #5#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| 0 (QREFELT $ 104))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #6=#:G1092))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #6# (EXIT #2#))
                                  . #5#)
                            (GO #7=#:G1102))))))))
                     (COND
                      ((OR (EQUAL |nm| '|ellipticE2|)
                           (EQUAL |nm| '|ellipticF|))
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 76)) |x|
                                    (QREFELT $ 140))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|ellipticPi|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 76)) |x|
                                    (QREFELT $ 140))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |args| 3 (QREFELT $ 76)) |x|
                                      (QREFELT $ 140))
                            (|spadConstant| $ 26) (QREFELT $ 34))
                           (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #7# (EXIT #1#)))))))) 

(SDEFUN |EFSTRUC;k2Elem| ((|k| |Kernel| F) (|l| |List| (|Symbol|)) ($ F))
        (SPROG
         ((|args| (|List| F)) (#1=#:G1113 NIL) (|a| NIL) (#2=#:G1112 NIL)
          (|op| (|BasicOperator|)))
         (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 74)) . #3=(|EFSTRUC;k2Elem|))
              (LETT |args|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |a| NIL . #3#)
                          (LETT #1# (SPADCALL |k| (QREFELT $ 32)) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (|EFSTRUC;realElem| |a| |l| $) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT
               (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 88)))
                     ('T (|EFSTRUC;k2Elem0| |k| |op| |args| $))))))) 

(SDEFUN |EFSTRUC;depeval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (COND
         ((SPADCALL |k| '|log| (QREFELT $ 30))
          (|EFSTRUC;logeval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|exp| (QREFELT $ 30))
          (|EFSTRUC;expeval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|tan| (QREFELT $ 30))
          (|EFSTRUC;taneval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|atan| (QREFELT $ 30))
          (|EFSTRUC;ataneval| |lf| |lk| |k| |v| $))
         ((SPADCALL |k| '|nthRoot| (QREFELT $ 30))
          (|EFSTRUC;rooteval| |lf| |lk| |k|
           (SPADCALL |v| (SPADCALL |v| (QREFELT $ 144)) (QREFELT $ 145)) $))
         ('T (VECTOR |lf| NIL NIL)))) 

(SDEFUN |EFSTRUC;rooteval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|n| |Fraction| (|Integer|))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G1132 NIL) (|f| NIL) (#2=#:G1131 NIL)
          (|lv| (|List| F)) (#3=#:G1130 NIL) (|r| NIL) (#4=#:G1129 NIL)
          (|l| (|List| (|Kernel| F))) (#5=#:G1128 NIL) (#6=#:G1127 NIL)
          (|nv| (F)) (|m| (|Integer|)) (|x| (F)))
         (SEQ
          (LETT |nv|
                (SPADCALL
                 (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                       . #7=(|EFSTRUC;rooteval|))
                 (LETT |m| (SPADCALL |n| (QREFELT $ 146)) . #7#)
                 (QREFELT $ 147))
                . #7#)
          (LETT |l|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |r| NIL . #7#)
                      (LETT #5# (CONS |k| (|EFSTRUC;toR| |lk| |x| $)) . #7#)
                      G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |r| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |r| (QREFELT $ 32))
                                      (QREFELT $ 148))
                            (QREFELT $ 149))
                           |m| (QREFELT $ 150))
                          (LETT #6# (CONS |r| #6#) . #7#)))))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |lv|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |r| NIL . #7#) (LETT #3# |l| . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL |nv|
                                         (SPADCALL |n|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |r|
                                                                (QREFELT $ 32))
                                                      (QREFELT $ 148))
                                                     (QREFELT $ 149))
                                                    (QREFELT $ 151))
                                                   (QREFELT $ 152))
                                         (QREFELT $ 153))
                               #4#)
                              . #7#)))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL . #7#)
                 (SEQ (LETT |f| NIL . #7#) (LETT #1# |lf| . #7#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |f| |l| |lv| (QREFELT $ 112))
                                    #2#)
                              . #7#)))
                      (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #7#)
          (EXIT (VECTOR |nlf| |l| |lv|))))) 

(SDEFUN |EFSTRUC;ataneval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G1148 NIL) (|f| NIL) (#2=#:G1147 NIL)
          (|g| (F)) (|h| (F)) (|d| (F)) (#3=#:G1136 NIL) (#4=#:G1135 (F))
          (#5=#:G1137 (F)) (#6=#:G1145 NIL) (|i| NIL) (#7=#:G1146 NIL)
          (|x| NIL) (|s| (F)) (#8=#:G1143 NIL) (#9=#:G1144 NIL)
          (#10=#:G1142 NIL) (|w| (F)))
         (SEQ
          (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #11=(|EFSTRUC;ataneval|))
          (LETT |s|
                (SPADCALL
                 (PROGN
                  (LETT #10# NIL . #11#)
                  (SEQ (LETT |x| NIL . #11#)
                       (LETT #9# (|EFSTRUC;toV| |lk| $) . #11#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #11#)
                       (LETT #8# (QVSIZE |v|) . #11#) G190
                       (COND
                        ((OR (> |i| #8#) (ATOM #9#)
                             (PROGN (LETT |x| (CAR #9#) . #11#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #10#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) |x|
                                          (QREFELT $ 50))
                                #10#)
                               . #11#)))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #9# (CDR #9#) . #11#))
                             . #11#)
                       (GO G190) G191 (EXIT (NREVERSE #10#))))
                 (QREFELT $ 53))
                . #11#)
          (LETT |g|
                (PROGN
                 (LETT #3# NIL . #11#)
                 (SEQ (LETT |x| NIL . #11#)
                      (LETT #7# (|EFSTRUC;toU| |lk| $) . #11#)
                      (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #11#)
                      (LETT #6# (QVSIZE |v|) . #11#) G190
                      (COND
                       ((OR (> |i| #6#) (ATOM #7#)
                            (PROGN (LETT |x| (CAR #7#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5#
                               (SPADCALL (QAREF1O |v| |i| 1) |x|
                                         (QREFELT $ 154))
                               . #11#)
                         (COND
                          (#3#
                           (LETT #4# (SPADCALL #4# #5# (QREFELT $ 135))
                                 . #11#))
                          ('T
                           (PROGN
                            (LETT #4# #5# . #11#)
                            (LETT #3# 'T . #11#)))))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #11#))
                            . #11#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#12='T (|spadConstant| $ 26))))
                . #11#)
          (LETT |h|
                (COND
                 ((SPADCALL
                   (LETT |d|
                         (SPADCALL (|spadConstant| $ 71)
                                   (SPADCALL |s| |w| (QREFELT $ 108))
                                   (QREFELT $ 135))
                         . #11#)
                   (QREFELT $ 129))
                  (QREFELT $ 16))
                 (#12#
                  (SPADCALL
                   (SPADCALL (SPADCALL |w| |s| (QREFELT $ 133)) |d|
                             (QREFELT $ 15))
                   (QREFELT $ 113))))
                . #11#)
          (LETT |g| (SPADCALL |g| |h| (QREFELT $ 135)) . #11#)
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL . #11#)
                 (SEQ (LETT |f| NIL . #11#) (LETT #1# |lf| . #11#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #11#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |f| (LIST |k|) (LIST |g|)
                                         (QREFELT $ 112))
                               #2#)
                              . #11#)))
                      (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #11#)
          (EXIT (VECTOR |nlf| (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;gdCoef?|
        ((|c| |Fraction| (|Integer|)) (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Boolean|))
        (SPROG ((#1=#:G1156 NIL) (#2=#:G1157 NIL) (#3=#:G1158 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |i| (SPADCALL |v| (QREFELT $ 144))
                           . #4=(|EFSTRUC;gdCoef?|))
                     (LETT #3# (QVSIZE |v|) . #4#) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (SPADCALL
                           (SPADCALL (QAREF1O |v| |i| 1) |c| (QREFELT $ 152))
                           (QREFELT $ 155))
                          1)
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# NIL . #4#) (GO #5=#:G1155))
                                . #4#)
                          (GO #6=#:G1153))))))
                     (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;goodCoef|
        ((|v| |Vector| (|Fraction| (|Integer|))) (|l| |List| (|Kernel| F))
         (|s| |Symbol|)
         ($ |Union|
          (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
          "failed"))
        (SPROG
         ((#1=#:G1189 NIL) (#2=#:G1190 NIL)
          (|r| (|Union| (|Fraction| (|Integer|)) "failed")) (#3=#:G1194 NIL)
          (|i| NIL) (#4=#:G1195 NIL) (|k| NIL) (|h| (|NonNegativeInteger|))
          (|j| (|Integer|)) (|h1| (|NonNegativeInteger|)) (#5=#:G1192 NIL)
          (#6=#:G1193 NIL) (|ll| (|List| (|Kernel| F))) (#7=#:G1191 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |h| 0 . #8=(|EFSTRUC;goodCoef|)) (LETT |j| 0 . #8#)
                (LETT |ll| NIL . #8#)
                (SEQ (LETT |k| NIL . #8#) (LETT #7# |l| . #8#) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((OR (SPADCALL |k| '|log| (QREFELT $ 30))
                             (OR (SPADCALL |k| '|exp| (QREFELT $ 30))
                                 (OR (SPADCALL |k| '|tan| (QREFELT $ 30))
                                     (SPADCALL |k| '|atan| (QREFELT $ 30)))))
                         (SEQ (LETT |ll| (CONS |k| |ll|) . #8#)
                              (EXIT (LETT |h| (+ |h| 1) . #8#)))))))
                     (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((NULL
                   (EQL |h|
                        (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 144))) 1)))
                  (EXIT (CONS 1 "failed"))))
                (LETT |h| 0 . #8#) (LETT |ll| (REVERSE |ll|) . #8#)
                (SEQ (LETT |k| NIL . #8#) (LETT #6# |ll| . #8#)
                     (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #8#)
                     (LETT #5# (QVSIZE |v|) . #8#) G190
                     (COND
                      ((OR (> |i| #5#) (ATOM #6#)
                           (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                       (GO G191)))
                     (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 156)) . #8#)
                          (EXIT
                           (COND
                            ((SPADCALL |h1| |h| (QREFELT $ 157))
                             (SEQ (LETT |j| |i| . #8#)
                                  (EXIT (LETT |h| |h1| . #8#)))))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#))
                           . #8#)
                     (GO G190) G191 (EXIT NIL))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| NIL . #8#) (LETT #4# |ll| . #8#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #8#)
                       (LETT #3# (QVSIZE |v|) . #8#) G190
                       (COND
                        ((OR (> |i| #3#) (ATOM #4#)
                             (PROGN (LETT |k| (CAR #4#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |k| |s| (QREFELT $ 30))
                           (COND
                            ((>= |i| |j|)
                             (SEQ
                              (LETT |r|
                                    (SPADCALL (QAREF1O |v| |i| 1)
                                              (QREFELT $ 159))
                                    . #8#)
                              (EXIT
                               (COND
                                ((QEQCAR |r| 0)
                                 (COND
                                  ((QEQCAR
                                    (SPADCALL (QCDR |r|) (QREFELT $ 155)) 0)
                                   (COND
                                    ((|EFSTRUC;gdCoef?| (QAREF1O |v| |i| 1) |v|
                                      $)
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# (CONS 0 (CONS |i| |k|))
                                                   . #8#)
                                             (GO #9=#:G1188))
                                            . #8#)
                                      (GO #10=#:G1186))))))))))))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #8#))
                             . #8#)
                       (GO G190) G191 (EXIT NIL)))
                 #10# (EXIT #1#))
                (EXIT (CONS 1 "failed"))))
          #9# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;taneval|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G1221 NIL) (|f| NIL) (#3=#:G1220 NIL)
          (|g| (F)) (#4=#:G1218 NIL) (|a| NIL) (#5=#:G1219 NIL) (|x| NIL)
          (#6=#:G1217 NIL) (|l| (|List| #1#)) (#7=#:G1216 NIL) (|kk| NIL)
          (#8=#:G1215 NIL) (|lv| (|List| (|Fraction| (|Integer|))))
          (#9=#:G1214 NIL) (|i| NIL) (#10=#:G1213 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|c| (F)) (#11=#:G1198 NIL) (#12=#:G1197 (F)) (#13=#:G1199 (F))
          (#14=#:G1211 NIL) (#15=#:G1212 NIL) (|fns| (|List| F)) (|u| (F)))
         (SEQ
          (LETT |u| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #16=(|EFSTRUC;taneval|))
          (LETT |fns| (|EFSTRUC;toU| |lk| $) . #16#)
          (LETT |c|
                (SPADCALL |u|
                          (PROGN
                           (LETT #11# NIL . #16#)
                           (SEQ (LETT |x| NIL . #16#) (LETT #15# |fns| . #16#)
                                (LETT |i| (SPADCALL |v| (QREFELT $ 144))
                                      . #16#)
                                (LETT #14# (QVSIZE |v|) . #16#) G190
                                (COND
                                 ((OR (> |i| #14#) (ATOM #15#)
                                      (PROGN (LETT |x| (CAR #15#) . #16#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #13#
                                         (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                   (QREFELT $ 154))
                                         . #16#)
                                   (COND
                                    (#11#
                                     (LETT #12#
                                           (SPADCALL #12# #13# (QREFELT $ 135))
                                           . #16#))
                                    ('T
                                     (PROGN
                                      (LETT #12# #13# . #16#)
                                      (LETT #11# 'T . #16#)))))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT #15# (CDR #15#) . #16#))
                                      . #16#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#11# #12#) (#17='T (|spadConstant| $ 26))))
                          (QREFELT $ 133))
                . #16#)
          (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $) . #16#)
          (EXIT
           (COND
            ((QEQCAR |rec| 1)
             (|EFSTRUC;tannosimp| |lf| |lk| |k| |v| |fns| |c| $))
            (#17#
             (SEQ
              (LETT |v0|
                    (SPADCALL
                     (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                               (QREFELT $ 160))
                     (QREFELT $ 146))
                    . #16#)
              (LETT |lv|
                    (PROGN
                     (LETT #10# NIL . #16#)
                     (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #16#)
                          (LETT #9# (QVSIZE |v|) . #16#) G190
                          (COND ((> |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| (QCAR (QCDR |rec|))
                                        (QREFELT $ 150))
                              (LETT #10# (CONS (QAREF1O |v| |i| 1) #10#)
                                    . #16#)))))
                          (LETT |i| (+ |i| 1) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #16#)
              (LETT |l|
                    (PROGN
                     (LETT #8# NIL . #16#)
                     (SEQ (LETT |kk| NIL . #16#) (LETT #7# |lk| . #16#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |kk| (CAR #7#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                        (QREFELT $ 114))
                              (LETT #8# (CONS |kk| #8#) . #16#)))))
                          (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #16#)
              (LETT |g|
                    (|EFSTRUC;tanSum|
                     (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 161))
                               (QREFELT $ 14))
                     (CONS
                      (SPADCALL (SPADCALL |k| (QREFELT $ 88)) |v0|
                                (QREFELT $ 49))
                      (PROGN
                       (LETT #6# NIL . #16#)
                       (SEQ (LETT |x| NIL . #16#)
                            (LETT #5# (|EFSTRUC;toV| |l| $) . #16#)
                            (LETT |a| NIL . #16#) (LETT #4# |lv| . #16#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |a| (CAR #4#) . #16#) NIL)
                                  (ATOM #5#)
                                  (PROGN (LETT |x| (CAR #5#) . #16#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (SPADCALL |x|
                                               (-
                                                (SPADCALL
                                                 (SPADCALL |a| |v0|
                                                           (QREFELT $ 162))
                                                 (QREFELT $ 146)))
                                               (QREFELT $ 49))
                                     #6#)
                                    . #16#)))
                            (LETT #4#
                                  (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #16#))
                                  . #16#)
                            (GO G190) G191 (EXIT (NREVERSE #6#)))))
                     $)
                    . #16#)
              (LETT |nlf|
                    (PROGN
                     (LETT #3# NIL . #16#)
                     (SEQ (LETT |f| NIL . #16#) (LETT #2# |lf| . #16#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |f| (CAR #2#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |f| (LIST (QCDR (QCDR |rec|)))
                                             (LIST |g|) (QREFELT $ 112))
                                   #3#)
                                  . #16#)))
                          (LETT #2# (CDR #2#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #16#)
              (EXIT (VECTOR |nlf| (LIST (QCDR (QCDR |rec|))) (LIST |g|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|c| F)
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G1264 NIL) (|f| NIL) (#3=#:G1263 NIL)
          (|h| (F)) (#4=#:G1261 NIL) (|i| NIL) (#5=#:G1262 NIL) (|x| NIL)
          (#6=#:G1260 NIL) (#7=#:G1259 NIL) (#8=#:G1258 NIL)
          (|lk1| (|List| #1#)) (|newtan| (|List| F)) (#9=#:G1256 NIL)
          (#10=#:G1257 NIL) (|t| NIL) (#11=#:G1255 NIL)
          (|li| (|List| (|NonNegativeInteger|))) (#12=#:G1254 NIL)
          (#13=#:G1253 NIL) (#14=#:G1252 NIL) (#15=#:G1251 NIL)
          (|newt| (|List| F)) (#16=#:G1249 NIL) (|u| NIL) (#17=#:G1250 NIL)
          (#18=#:G1248 NIL) (|dd| (F)) (|d| #19=(|Integer|))
          (|cd| (|Record| (|:| |num| (|Vector| (|Integer|))) (|:| |den| #19#)))
          (#20=#:G1246 NIL) (#21=#:G1247 NIL) (#22=#:G1245 NIL)
          (#23=#:G1244 NIL) (#24=#:G1243 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #25=(|EFSTRUC;tannosimp|))
              (LETT |lk|
                    (PROGN
                     (LETT #24# NIL . #25#)
                     (SEQ (LETT |x| NIL . #25#) (LETT #23# |lk| . #25#) G190
                          (COND
                           ((OR (ATOM #23#)
                                (PROGN (LETT |x| (CAR #23#) . #25#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND ((SPADCALL |x| '|tan| (QREFELT $ 30)) 'T)
                                    (#26='T
                                     (SPADCALL |x| '|atan| (QREFELT $ 30))))
                              (LETT #24# (CONS |x| #24#) . #25#)))))
                          (LETT #23# (CDR #23#) . #25#) (GO G190) G191
                          (EXIT (NREVERSE #24#))))
                    . #25#)
              (LETT |lk1|
                    (PROGN
                     (LETT #22# NIL . #25#)
                     (SEQ (LETT |i| 1 . #25#) (LETT #21# |n| . #25#)
                          (LETT |x| NIL . #25#) (LETT #20# |lk| . #25#) G190
                          (COND
                           ((OR (ATOM #20#)
                                (PROGN (LETT |x| (CAR #20#) . #25#) NIL)
                                (|greater_SI| |i| #21#))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (QAREF1O |v| |i| 1)
                                         (|spadConstant| $ 97) (QREFELT $ 82)))
                              (LETT #22# (CONS |x| #22#) . #25#)))))
                          (LETT #20#
                                (PROG1 (CDR #20#)
                                  (LETT |i| (|inc_SI| |i|) . #25#))
                                . #25#)
                          (GO G190) G191 (EXIT (NREVERSE #22#))))
                    . #25#)
              (EXIT
               (COND
                ((SPADCALL (CONS #'|EFSTRUC;tannosimp!0| $) |lk1|
                           (QREFELT $ 163))
                 (SEQ
                  (LETT |dd|
                        (SPADCALL
                         (LETT |d|
                               (QCDR
                                (LETT |cd| (SPADCALL |v| (QREFELT $ 166))
                                      . #25#))
                               . #25#)
                         (QREFELT $ 13))
                        . #25#)
                  (LETT |newt|
                        (PROGN
                         (LETT #18# NIL . #25#)
                         (SEQ (LETT |i| 1 . #25#) (LETT #17# |n| . #25#)
                              (LETT |u| NIL . #25#) (LETT #16# |fns| . #25#)
                              G190
                              (COND
                               ((OR (ATOM #16#)
                                    (PROGN (LETT |u| (CAR #16#) . #25#) NIL)
                                    (|greater_SI| |i| #17#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF1O |v| |i| 1)
                                             (|spadConstant| $ 97)
                                             (QREFELT $ 82)))
                                  (LETT #18#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |u| |dd| (QREFELT $ 15))
                                          (QREFELT $ 55))
                                         #18#)
                                        . #25#)))))
                              (LETT #16#
                                    (PROG1 (CDR #16#)
                                      (LETT |i| (|inc_SI| |i|) . #25#))
                                    . #25#)
                              (GO G190) G191 (EXIT (NREVERSE #18#))))
                        . #25#)
                  (LETT |newtan|
                        (PROGN
                         (LETT #15# NIL . #25#)
                         (SEQ (LETT |t| NIL . #25#) (LETT #14# |newt| . #25#)
                              G190
                              (COND
                               ((OR (ATOM #14#)
                                    (PROGN (LETT |t| (CAR #14#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #15#
                                      (CONS (SPADCALL |t| |d| (QREFELT $ 49))
                                            #15#)
                                      . #25#)))
                              (LETT #14# (CDR #14#) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #15#))))
                        . #25#)
                  (LETT |li|
                        (PROGN
                         (LETT #13# NIL . #25#)
                         (SEQ (LETT |i| 1 . #25#) (LETT #12# |n| . #25#) G190
                              (COND ((|greater_SI| |i| #12#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF1O |v| |i| 1)
                                             (|spadConstant| $ 97)
                                             (QREFELT $ 82)))
                                  (LETT #13# (CONS |i| #13#) . #25#)))))
                              (LETT |i| (|inc_SI| |i|) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #13#))))
                        . #25#)
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #11# NIL . #25#)
                          (SEQ (LETT |t| NIL . #25#) (LETT #10# |newt| . #25#)
                               (LETT |i| NIL . #25#) (LETT #9# |li| . #25#)
                               G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#) . #25#) NIL)
                                     (ATOM #10#)
                                     (PROGN (LETT |t| (CAR #10#) . #25#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (SPADCALL |t|
                                                  (QAREF1O (QCAR |cd|) |i| 1)
                                                  (QREFELT $ 49))
                                        #11#)
                                       . #25#)))
                               (LETT #9#
                                     (PROG1 (CDR #9#)
                                       (LETT #10# (CDR #10#) . #25#))
                                     . #25#)
                               (GO G190) G191 (EXIT (NREVERSE #11#))))
                         $)
                        . #25#)
                  (LETT |newtan| (CONS |h| |newtan|) . #25#)
                  (LETT |lk1| (CONS |k| |lk1|) . #25#)
                  (LETT |nlf|
                        (PROGN
                         (LETT #8# NIL . #25#)
                         (SEQ (LETT |f| NIL . #25#) (LETT #7# |lf| . #25#) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |f| (CAR #7#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #8#
                                      (CONS
                                       (SPADCALL |f| |lk1| |newtan|
                                                 (QREFELT $ 112))
                                       #8#)
                                      . #25#)))
                              (LETT #7# (CDR #7#) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #8#))))
                        . #25#)
                  (EXIT (VECTOR |nlf| |lk1| |newtan|))))
                (#26#
                 (SEQ
                  (LETT |h|
                        (|EFSTRUC;tanSum| |c|
                         (PROGN
                          (LETT #6# NIL . #25#)
                          (SEQ (LETT |x| NIL . #25#)
                               (LETT #5# (|EFSTRUC;toV| |lk| $) . #25#)
                               (LETT |i| 1 . #25#) (LETT #4# |n| . #25#) G190
                               (COND
                                ((OR (|greater_SI| |i| #4#) (ATOM #5#)
                                     (PROGN (LETT |x| (CAR #5#) . #25#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #6#
                                       (CONS
                                        (SPADCALL (QAREF1O |v| |i| 1) |x|
                                                  (QREFELT $ 50))
                                        #6#)
                                       . #25#)))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #5# (CDR #5#) . #25#))
                                     . #25#)
                               (GO G190) G191 (EXIT (NREVERSE #6#))))
                         $)
                        . #25#)
                  (LETT |nlf|
                        (PROGN
                         (LETT #3# NIL . #25#)
                         (SEQ (LETT |f| NIL . #25#) (LETT #2# |lf| . #25#) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#) . #25#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL |f| (LIST |k|) (LIST |h|)
                                                 (QREFELT $ 112))
                                       #3#)
                                      . #25#)))
                              (LETT #2# (CDR #2#) . #25#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        . #25#)
                  (EXIT (VECTOR |nlf| (LIST |k|) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;tannosimp!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| '|tan| (QREFELT $ 30))) 

(SDEFUN |EFSTRUC;expnosimp|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|))) (|fns| |List| F) (|g| F)
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G1283 NIL) (|f| NIL) (#2=#:G1282 NIL)
          (|lexp| (|List| F)) (|lke| (|List| (|Kernel| F))) (|h| (F))
          (|nui| (F)) (|di| (|Integer|)) (|vi| (|Fraction| (|Integer|)))
          (#3=#:G1279 NIL) (|i| NIL) (#4=#:G1280 NIL) (|k1| NIL)
          (#5=#:G1281 NIL) (|y| NIL) (|vnum| #6=(|Vector| (|Integer|)))
          (|d| #7=(|Integer|))
          (|cd| (|Record| (|:| |num| #6#) (|:| |den| #7#))) (#8=#:G1278 NIL)
          (|x| NIL) (#9=#:G1277 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (QVSIZE |v|) . #10=(|EFSTRUC;expnosimp|))
              (LETT |lk|
                    (PROGN
                     (LETT #9# NIL . #10#)
                     (SEQ (LETT |x| NIL . #10#) (LETT #8# |lk| . #10#) G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |x| (CAR #8#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((OR (SPADCALL |x| '|exp| (QREFELT $ 30))
                                    (SPADCALL |x| '|log| (QREFELT $ 30)))
                                'T)
                               ('T (SPADCALL |x| '|lambertW| (QREFELT $ 30))))
                              (LETT #9# (CONS |x| #9#) . #10#)))))
                          (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    . #10#)
              (LETT |d|
                    (QCDR (LETT |cd| (SPADCALL |v| (QREFELT $ 166)) . #10#))
                    . #10#)
              (LETT |vnum| (QCAR |cd|) . #10#) (LETT |h| |g| . #10#)
              (LETT |lke| NIL . #10#) (LETT |lexp| NIL . #10#)
              (SEQ (LETT |y| NIL . #10#) (LETT #5# |fns| . #10#)
                   (LETT |k1| NIL . #10#) (LETT #4# |lk| . #10#)
                   (LETT |i| 1 . #10#) (LETT #3# |n| . #10#) G190
                   (COND
                    ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                         (PROGN (LETT |k1| (CAR #4#) . #10#) NIL) (ATOM #5#)
                         (PROGN (LETT |y| (CAR #5#) . #10#) NIL))
                     (GO G191)))
                   (SEQ (LETT |vi| (QAREF1O |v| |i| 1) . #10#)
                        (EXIT
                         (COND
                          ((SPADCALL |vi| (|spadConstant| $ 97) (QREFELT $ 82))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |di| (SPADCALL |vi| (QREFELT $ 39)) . #10#)
                            (COND
                             ((OR (SPADCALL |k1| '|log| (QREFELT $ 30))
                                  (EQL |di| 1))
                              (EXIT
                               (LETT |h|
                                     (SPADCALL |h|
                                               (SPADCALL
                                                (SPADCALL |y| (QREFELT $ 131))
                                                |vi| (QREFELT $ 153))
                                               (QREFELT $ 108))
                                     . #10#))))
                            (LETT |lke| (CONS |k1| |lke|) . #10#)
                            (LETT |nui|
                                  (SPADCALL
                                   (SPADCALL |y| (SPADCALL |di| (QREFELT $ 13))
                                             (QREFELT $ 15))
                                   (QREFELT $ 131))
                                  . #10#)
                            (LETT |lexp|
                                  (CONS (SPADCALL |nui| |di| (QREFELT $ 105))
                                        |lexp|)
                                  . #10#)
                            (EXIT
                             (LETT |h|
                                   (SPADCALL |h|
                                             (SPADCALL |nui|
                                                       (SPADCALL |vi|
                                                                 (QREFELT $
                                                                          48))
                                                       (QREFELT $ 105))
                                             (QREFELT $ 108))
                                   . #10#)))))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|)
                           (LETT #4#
                                 (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #10#))
                                 . #10#))
                         . #10#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |lke| (CONS |k| |lke|) . #10#)
              (LETT |lexp| (CONS |h| |lexp|) . #10#)
              (LETT |nlf|
                    (PROGN
                     (LETT #2# NIL . #10#)
                     (SEQ (LETT |f| NIL . #10#) (LETT #1# |lf| . #10#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |f| (CAR #1#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |f| |lke| |lexp| (QREFELT $ 112))
                                   #2#)
                                  . #10#)))
                          (LETT #1# (CDR #1#) . #10#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #10#)
              (EXIT (VECTOR |nlf| |lke| |lexp|))))) 

(SDEFUN |EFSTRUC;logeval|
        ((|lf| |List| F) (|lk| |List| (|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#1=#:G1308 NIL) (|f| NIL) (#2=#:G1307 NIL)
          (|g| (F)) (#3=#:G1296 NIL) (#4=#:G1295 (F)) (#5=#:G1297 (F))
          (#6=#:G1305 NIL) (|i| NIL) (#7=#:G1306 NIL) (|x| NIL) (|c| (F))
          (#8=#:G1287 NIL) (#9=#:G1286 (F)) (#10=#:G1288 (F)) (#11=#:G1303 NIL)
          (#12=#:G1304 NIL) (|dd| (|Integer|)) (#13=#:G1302 NIL)
          (#14=#:G1301 NIL) (|z| (F)))
         (SEQ
          (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #15=(|EFSTRUC;logeval|))
          (LETT |dd|
                (SPADCALL
                 (PROGN
                  (LETT #14# NIL . #15#)
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #15#)
                       (LETT #13# (QVSIZE |v|) . #15#) G190
                       (COND ((> |i| #13#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #14#
                               (CONS
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 39))
                                #14#)
                               . #15#)))
                       (LETT |i| (+ |i| 1) . #15#) (GO G190) G191
                       (EXIT (NREVERSE #14#))))
                 (QREFELT $ 167))
                . #15#)
          (LETT |c|
                (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 105))
                          (PROGN
                           (LETT #8# NIL . #15#)
                           (SEQ
                            (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #15#)
                            (LETT #12# (QVSIZE |v|) . #15#)
                            (LETT |x| NIL . #15#)
                            (LETT #11# (|EFSTRUC;toZ| |lk| $) . #15#) G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |x| (CAR #11#) . #15#) NIL)
                                  (> |i| #12#))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #10#
                                     (SPADCALL |x|
                                               (SPADCALL |dd|
                                                         (QAREF1O |v| |i| 1)
                                                         (QREFELT $ 168))
                                               (QREFELT $ 153))
                                     . #15#)
                               (COND
                                (#8#
                                 (LETT #9# (SPADCALL #9# #10# (QREFELT $ 108))
                                       . #15#))
                                ('T
                                 (PROGN
                                  (LETT #9# #10# . #15#)
                                  (LETT #8# 'T . #15#)))))))
                            (LETT #11#
                                  (PROG1 (CDR #11#)
                                    (LETT |i| (+ |i| 1) . #15#))
                                  . #15#)
                            (GO G190) G191 (EXIT NIL))
                           (COND (#8# #9#) (#16='T (|spadConstant| $ 71))))
                          (QREFELT $ 15))
                . #15#)
          (LETT |g|
                (SPADCALL
                 (PROGN
                  (LETT #3# NIL . #15#)
                  (SEQ (LETT |x| NIL . #15#)
                       (LETT #7# (|EFSTRUC;toY| |lk| $) . #15#)
                       (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #15#)
                       (LETT #6# (QVSIZE |v|) . #15#) G190
                       (COND
                        ((OR (> |i| #6#) (ATOM #7#)
                             (PROGN (LETT |x| (CAR #7#) . #15#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #5#
                                (SPADCALL (QAREF1O |v| |i| 1) |x|
                                          (QREFELT $ 154))
                                . #15#)
                          (COND
                           (#3#
                            (LETT #4# (SPADCALL #4# #5# (QREFELT $ 135))
                                  . #15#))
                           ('T
                            (PROGN
                             (LETT #4# #5# . #15#)
                             (LETT #3# 'T . #15#)))))))
                       (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #15#))
                             . #15#)
                       (GO G190) G191 (EXIT NIL))
                  (COND (#3# #4#) (#16# (|spadConstant| $ 26))))
                 (SPADCALL (SPADCALL |c| (QREFELT $ 89))
                           (SPADCALL (SPADCALL |dd| (QREFELT $ 169))
                                     (QREFELT $ 115))
                           (QREFELT $ 15))
                 (QREFELT $ 135))
                . #15#)
          (LETT |nlf|
                (PROGN
                 (LETT #2# NIL . #15#)
                 (SEQ (LETT |f| NIL . #15#) (LETT #1# |lf| . #15#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |f| (LIST |k|) (LIST |g|)
                                         (QREFELT $ 112))
                               #2#)
                              . #15#)))
                      (LETT #1# (CDR #1#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #15#)
          (EXIT (VECTOR |nlf| (LIST |k|) (LIST |g|)))))) 

(SDEFUN |EFSTRUC;rischNormalize;LLR;42|
        ((|lf| |List| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((#1=#:G1321 NIL)
          (|rn|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|nlf| (|List| F)) (#2=#:G1325 NIL) (|f| NIL) (#3=#:G1324 NIL)
          (#4=#:G1320 NIL)
          (|rec|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|c|
           (|Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
                    (|:| |func| F) (|:| |fail| (|Boolean|))))
          (|klist| (|List| (|Kernel| F))) (#5=#:G1322 NIL) (|i| NIL)
          (#6=#:G1323 NIL) (|kk| NIL) (|n| (|NonNegativeInteger|))
          (|pars| (|List| (|Symbol|))) (|funs| (|List| (|Kernel| F))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |funs| (SPADCALL |lf| (QREFELT $ 170))
                  . #7=(|EFSTRUC;rischNormalize;LLR;42|))
            (LETT |pars| (SPADCALL |lf| (QREFELT $ 171)) . #7#)
            (LETT |pars| (SPADCALL |pars| |vars| (QREFELT $ 172)) . #7#)
            (EXIT
             (COND ((NULL |funs|) (VECTOR |lf| NIL NIL))
                   ('T
                    (SEQ (LETT |n| (LENGTH |funs|) . #7#)
                         (SEQ (LETT |kk| NIL . #7#)
                              (LETT #6# (CDR |funs|) . #7#) (LETT |i| 1 . #7#)
                              (LETT #5# |n| . #7#) G190
                              (COND
                               ((OR (|greater_SI| |i| #5#) (ATOM #6#)
                                    (PROGN (LETT |kk| (CAR #6#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (LETT |klist|
                                       (SPADCALL |funs| |i| (QREFELT $ 173))
                                       . #7#)
                                 (SEQ
                                  (LETT |c|
                                        (|EFSTRUC;findRelation| |vars| |pars|
                                         |klist| |kk| $)
                                        . #7#)
                                  (EXIT
                                   (COND
                                    ((QEQCAR |c| 0)
                                     (COND
                                      ((NULL
                                        (SPADCALL (CDR |c|) (QREFELT $ 174)))
                                       (PROGN
                                        (LETT #4#
                                              (SEQ
                                               (LETT |rec|
                                                     (|EFSTRUC;depeval| |lf|
                                                      |klist| |kk| (CDR |c|) $)
                                                     . #7#)
                                               (LETT |rn|
                                                     (SPADCALL (QVELT |rec| 0)
                                                               |vars|
                                                               (QREFELT $ 176))
                                                     . #7#)
                                               (EXIT
                                                (PROGN
                                                 (LETT #1#
                                                       (VECTOR (QVELT |rn| 0)
                                                               (SPADCALL
                                                                (QVELT |rec| 1)
                                                                (QVELT |rn| 1)
                                                                (QREFELT $
                                                                         177))
                                                               (SPADCALL
                                                                (QVELT |rec| 2)
                                                                (QVELT |rn| 2)
                                                                (QREFELT $
                                                                         141)))
                                                       . #7#)
                                                 (GO #8=#:G1319))))
                                              . #7#)
                                        (GO #9=#:G1315))))))))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |c| 1)
                                    (SEQ
                                     (LETT |nlf|
                                           (PROGN
                                            (LETT #3# NIL . #7#)
                                            (SEQ (LETT |f| NIL . #7#)
                                                 (LETT #2# |lf| . #7#) G190
                                                 (COND
                                                  ((OR (ATOM #2#)
                                                       (PROGN
                                                        (LETT |f| (CAR #2#)
                                                              . #7#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #3#
                                                         (CONS
                                                          (SPADCALL |f|
                                                                    (LIST |kk|)
                                                                    (LIST
                                                                     (CDR |c|))
                                                                    (QREFELT $
                                                                             112))
                                                          #3#)
                                                         . #7#)))
                                                 (LETT #2# (CDR #2#) . #7#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #3#))))
                                           . #7#)
                                     (LETT |rn|
                                           (SPADCALL |nlf| |vars|
                                                     (QREFELT $ 176))
                                           . #7#)
                                     (EXIT
                                      (PROGN
                                       (LETT #1#
                                             (VECTOR (QVELT |rn| 0)
                                                     (CONS |kk| (QVELT |rn| 1))
                                                     (CONS (CDR |c|)
                                                           (QVELT |rn| 2)))
                                             . #7#)
                                       (GO #8#)))))))))
                               #9# (EXIT #4#))
                              (LETT |i|
                                    (PROG1 (|inc_SI| |i|)
                                      (LETT #6# (CDR #6#) . #7#))
                                    . #7#)
                              (GO G190) G191 (EXIT NIL))
                         (EXIT (VECTOR |lf| NIL NIL))))))))
          #8# (EXIT #1#)))) 

(SDEFUN |EFSTRUC;rischNormalize;FLR;43|
        ((|f| F) (|vars| |List| (|Symbol|))
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPROG
         ((|rn|
           (|Record| (|:| |funcs| (|List| F))
                     (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F)))))
         (SEQ
          (LETT |rn| (SPADCALL (LIST |f|) |vars| (QREFELT $ 176))
                |EFSTRUC;rischNormalize;FLR;43|)
          (EXIT
           (VECTOR (|SPADfirst| (QVELT |rn| 0)) (QVELT |rn| 1)
                   (QVELT |rn| 2)))))) 

(SDEFUN |EFSTRUC;rischNormalize;FSR;44|
        ((|f| F) (|v| |Symbol|)
         ($ |Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
          (|:| |vals| (|List| F))))
        (SPADCALL |f| (LIST |v|) (QREFELT $ 179))) 

(SDEFUN |EFSTRUC;rootNormalize;FKF;45| ((|f| F) (|k| |Kernel| F) ($ F))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |funcs| (|List| F))
                      (|:| |kers| (|List| (|Kernel| F)))
                      (|:| |vals| (|List| F)))
            "failed")))
         (SEQ
          (LETT |u|
                (|EFSTRUC;rootKernelNormalize| (LIST |f|)
                 (|EFSTRUC;toR| (SPADCALL |f| (QREFELT $ 181))
                  (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                 |k| $)
                |EFSTRUC;rootNormalize;FKF;45|)
          (EXIT
           (COND ((QEQCAR |u| 1) |f|)
                 ('T (|SPADfirst| (QVELT (QCDR |u|) 0)))))))) 

(SDEFUN |EFSTRUC;rootKernelNormalize|
        ((|lf| |List| F) (|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union|
          (|Record| (|:| |funcs| (|List| F)) (|:| |kers| (|List| (|Kernel| F)))
                    (|:| |vals| (|List| F)))
          "failed"))
        (SPROG
         ((|c|
           (|Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
                    (|:| |func| F) (|:| |fail| (|Boolean|)))))
         (SEQ
          (LETT |c| (|EFSTRUC;rootDep| |l| |k| $)
                |EFSTRUC;rootKernelNormalize|)
          (EXIT
           (COND
            ((QEQCAR |c| 0)
             (CONS 0
                   (|EFSTRUC;rooteval| |lf| |l| |k|
                    (SPADCALL (CDR |c|) (SPADCALL (CDR |c|) (QREFELT $ 144))
                              (QREFELT $ 145))
                    $)))
            ('T (CONS 1 "failed"))))))) 

(SDEFUN |EFSTRUC;validExponential;LFSU;47|
        ((|twr| |List| (|Kernel| F)) (|eta| F) (|x| |Symbol|)
         ($ |Union| F "failed"))
        (SPROG
         ((#1=#:G1380 NIL) (#2=#:G1379 (F)) (#3=#:G1381 (F)) (#4=#:G1392 NIL)
          (|i| NIL) (#5=#:G1393 NIL) (|yy| NIL) (|g| (F)) (#6=#:G1353 NIL)
          (#7=#:G1352 (F)) (#8=#:G1354 (F)) (#9=#:G1390 NIL) (#10=#:G1391 NIL)
          (|v| (|Vector| (|Fraction| (|Integer|))))
          (|c| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (#11=#:G1389 NIL) (|fns| (|List| F)) (#12=#:G1388 NIL))
         (SEQ
          (LETT |c|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #12# NIL . #13=(|EFSTRUC;validExponential;LFSU;47|))
                   (SEQ (LETT |g| NIL . #13#)
                        (LETT #11# (LETT |fns| (|EFSTRUC;toY| |twr| $) . #13#)
                              . #13#)
                        G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |g| (CAR #11#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #12#
                                (CONS (SPADCALL |g| |x| (QREFELT $ 57)) #12#)
                                . #13#)))
                        (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #12#))))
                  (QREFELT $ 183))
                 (SPADCALL |eta| |x| (QREFELT $ 57)) (QREFELT $ 184))
                . #13#)
          (EXIT
           (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
                 (#14='T
                  (SEQ (LETT |v| (QCDR |c|) . #13#)
                       (LETT |g|
                             (SPADCALL |eta|
                                       (PROGN
                                        (LETT #6# NIL . #13#)
                                        (SEQ (LETT |yy| NIL . #13#)
                                             (LETT #10# |fns| . #13#)
                                             (LETT |i|
                                                   (SPADCALL |v|
                                                             (QREFELT $ 144))
                                                   . #13#)
                                             (LETT #9# (QVSIZE |v|) . #13#)
                                             G190
                                             (COND
                                              ((OR (> |i| #9#) (ATOM #10#)
                                                   (PROGN
                                                    (LETT |yy| (CAR #10#)
                                                          . #13#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #8#
                                                      (SPADCALL
                                                       (QAREF1O |v| |i| 1) |yy|
                                                       (QREFELT $ 154))
                                                      . #13#)
                                                (COND
                                                 (#6#
                                                  (LETT #7#
                                                        (SPADCALL #7# #8#
                                                                  (QREFELT $
                                                                           135))
                                                        . #13#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #7# #8# . #13#)
                                                   (LETT #6# 'T . #13#)))))))
                                             (LETT |i|
                                                   (PROG1 (+ |i| 1)
                                                     (LETT #10# (CDR #10#)
                                                           . #13#))
                                                   . #13#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#6# #7#)
                                              (#14# (|spadConstant| $ 26))))
                                       (QREFELT $ 133))
                             . #13#)
                       (EXIT
                        (CONS 0
                              (SPADCALL
                               (PROGN
                                (LETT #1# NIL . #13#)
                                (SEQ (LETT |yy| NIL . #13#)
                                     (LETT #5# |fns| . #13#)
                                     (LETT |i| (SPADCALL |v| (QREFELT $ 144))
                                           . #13#)
                                     (LETT #4# (QVSIZE |v|) . #13#) G190
                                     (COND
                                      ((OR (> |i| #4#) (ATOM #5#)
                                           (PROGN
                                            (LETT |yy| (CAR #5#) . #13#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #3#
                                              (SPADCALL
                                               (SPADCALL |yy| (QREFELT $ 131))
                                               (QAREF1O |v| |i| 1)
                                               (QREFELT $ 153))
                                              . #13#)
                                        (COND
                                         (#1#
                                          (LETT #2#
                                                (SPADCALL #2# #3#
                                                          (QREFELT $ 108))
                                                . #13#))
                                         ('T
                                          (PROGN
                                           (LETT #2# #3# . #13#)
                                           (LETT #1# 'T . #13#)))))))
                                     (LETT |i|
                                           (PROG1 (+ |i| 1)
                                             (LETT #5# (CDR #5#) . #13#))
                                           . #13#)
                                     (GO G190) G191 (EXIT NIL))
                                (COND (#1# #2#) (#14# (|spadConstant| $ 71))))
                               (SPADCALL |g| (QREFELT $ 131))
                               (QREFELT $ 108))))))))))) 

(SDEFUN |EFSTRUC;irootDep;KU;48|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((|nv| (F)) (|nk| (F)) (|nr| (F)) (|nf| (F))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|n| (|NonNegativeInteger|)) (#1=#:G1394 NIL))
         (SEQ
          (LETT |n|
                (PROG1
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                     (QREFELT $ 148))
                           (QREFELT $ 149))
                          . #2=(|EFSTRUC;irootDep;KU;48|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |pr|
                (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) |n|
                          (QREFELT $ 189))
                . #2#)
          (COND
           ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 71) (QREFELT $ 34))
            (COND
             ((NULL (EQL (QVELT |pr| 0) |n|))
              (EXIT
               (COND
                ((EQL (QVELT |pr| 0) 1)
                 (CONS 1
                       (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2)
                                 (QREFELT $ 108))))
                (#3='T
                 (SEQ
                  (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                  (LETT |nr| (QVELT |pr| 2) . #2#)
                  (LETT |nk|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 74))
                                  (LIST |nr| |nf|) (QREFELT $ 142))
                        . #2#)
                  (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 108))
                        . #2#)
                  (EXIT (CONS 1 |nv|)))))))))
           (#3#
            (EXIT
             (COND
              ((EQL (QVELT |pr| 0) 1)
               (CONS 1
                     (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 108))))
              (#3#
               (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                    (LETT |nr| (QVELT |pr| 2) . #2#)
                    (LETT |nk|
                          (SPADCALL (SPADCALL |k| (QREFELT $ 74))
                                    (LIST |nr| |nf|) (QREFELT $ 142))
                          . #2#)
                    (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 108))
                          . #2#)
                    (EXIT (CONS 1 |nv|))))))))
          (EXIT (CONS 2 'T))))) 

(SDEFUN |EFSTRUC;irootDep;KU;49|
        ((|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (CONS 2 'T)) 

(SDEFUN |EFSTRUC;rootDep|
        ((|ker| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G1430 NIL) (#2=#:G1429 #3=(|Integer|)) (#4=#:G1431 #3#)
          (#5=#:G1434 NIL) (|r| NIL))
         (SEQ
          (COND
           ((NULL
             (LETT |ker|
                   (|EFSTRUC;toR| |ker|
                    (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
                   . #6=(|EFSTRUC;rootDep|)))
            (SPADCALL |k| (QREFELT $ 191)))
           (#7='T
            (CONS 0
                  (MAKEARR1 1
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                         (QREFELT $ 148))
                               (QREFELT $ 149))
                              (PROGN
                               (LETT #1# NIL . #6#)
                               (SEQ (LETT |r| NIL . #6#) (LETT #5# |ker| . #6#)
                                    G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |r| (CAR #5#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #4#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |r| (QREFELT $ 32))
                                               (QREFELT $ 148))
                                              (QREFELT $ 149))
                                             . #6#)
                                       (COND
                                        (#1#
                                         (LETT #2#
                                               (SPADCALL #2# #4#
                                                         (QREFELT $ 192))
                                               . #6#))
                                        ('T
                                         (PROGN
                                          (LETT #2# #4# . #6#)
                                          (LETT #1# 'T . #6#)))))))
                                    (LETT #5# (CDR #5#) . #6#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) (#7# 1)))
                              (QREFELT $ 192))
                             (QREFELT $ 151))))))))) 

(SDEFUN |EFSTRUC;expeval|
        ((|lf| |List| F) (|lk| |List| #1=(|Kernel| F)) (|k| |Kernel| F)
         (|v| |Vector| (|Fraction| (|Integer|)))
         ($ |Record| (|:| |funcs| (|List| F))
          (|:| |kers| (|List| (|Kernel| F))) (|:| |vals| (|List| F))))
        (SPROG
         ((|nlf| (|List| F)) (#2=#:G1461 NIL) (|f| NIL) (#3=#:G1460 NIL)
          (|h| (F)) (#4=#:G1446 NIL) (#5=#:G1445 (F)) (#6=#:G1447 (F))
          (#7=#:G1458 NIL) (|a| NIL) (#8=#:G1459 NIL) (|z| NIL)
          (|l| (|List| #1#)) (#9=#:G1457 NIL) (|kk| NIL) (#10=#:G1456 NIL)
          (|lv| (|List| (|Fraction| (|Integer|)))) (#11=#:G1455 NIL) (|i| NIL)
          (#12=#:G1454 NIL) (|v0| (|Integer|))
          (|rec|
           (|Union|
            (|Record| (|:| |index| (|Integer|)) (|:| |ker| (|Kernel| F)))
            "failed"))
          (|g| (F)) (#13=#:G1437 NIL) (#14=#:G1436 (F)) (#15=#:G1438 (F))
          (#16=#:G1452 NIL) (#17=#:G1453 NIL) (|fns| (|List| F)) (|y| (F)))
         (SEQ
          (LETT |y| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                . #18=(|EFSTRUC;expeval|))
          (LETT |fns| (|EFSTRUC;toY| |lk| $) . #18#)
          (LETT |g|
                (SPADCALL |y|
                          (PROGN
                           (LETT #13# NIL . #18#)
                           (SEQ (LETT |z| NIL . #18#) (LETT #17# |fns| . #18#)
                                (LETT |i| (SPADCALL |v| (QREFELT $ 144))
                                      . #18#)
                                (LETT #16# (QVSIZE |v|) . #18#) G190
                                (COND
                                 ((OR (> |i| #16#) (ATOM #17#)
                                      (PROGN (LETT |z| (CAR #17#) . #18#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #15#
                                         (SPADCALL (QAREF1O |v| |i| 1) |z|
                                                   (QREFELT $ 154))
                                         . #18#)
                                   (COND
                                    (#13#
                                     (LETT #14#
                                           (SPADCALL #14# #15# (QREFELT $ 135))
                                           . #18#))
                                    ('T
                                     (PROGN
                                      (LETT #14# #15# . #18#)
                                      (LETT #13# 'T . #18#)))))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1)
                                        (LETT #17# (CDR #17#) . #18#))
                                      . #18#)
                                (GO G190) G191 (EXIT NIL))
                           (COND (#13# #14#) (#19='T (|spadConstant| $ 26))))
                          (QREFELT $ 133))
                . #18#)
          (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $) . #18#)
          (EXIT
           (COND
            ((QEQCAR |rec| 1)
             (|EFSTRUC;expnosimp| |lf| |lk| |k| |v| |fns|
              (SPADCALL |g| (QREFELT $ 131)) $))
            (#19#
             (SEQ
              (LETT |v0|
                    (SPADCALL
                     (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1)
                               (QREFELT $ 160))
                     (QREFELT $ 146))
                    . #18#)
              (LETT |lv|
                    (PROGN
                     (LETT #12# NIL . #18#)
                     (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 144)) . #18#)
                          (LETT #11# (QVSIZE |v|) . #18#) G190
                          (COND ((> |i| #11#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| (QCAR (QCDR |rec|))
                                        (QREFELT $ 150))
                              (LETT #12# (CONS (QAREF1O |v| |i| 1) #12#)
                                    . #18#)))))
                          (LETT |i| (+ |i| 1) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #12#))))
                    . #18#)
              (LETT |l|
                    (PROGN
                     (LETT #10# NIL . #18#)
                     (SEQ (LETT |kk| NIL . #18#) (LETT #9# |lk| . #18#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |kk| (CAR #9#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |kk| (QCDR (QCDR |rec|))
                                        (QREFELT $ 114))
                              (LETT #10# (CONS |kk| #10#) . #18#)))))
                          (LETT #9# (CDR #9#) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #10#))))
                    . #18#)
              (LETT |h|
                    (PROGN
                     (LETT #4# NIL . #18#)
                     (SEQ (LETT |z| NIL . #18#)
                          (LETT #8# (|EFSTRUC;toY| |l| $) . #18#)
                          (LETT |a| NIL . #18#) (LETT #7# |lv| . #18#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |a| (CAR #7#) . #18#) NIL)
                                (ATOM #8#)
                                (PROGN (LETT |z| (CAR #8#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #6#
                                   (SPADCALL (SPADCALL |z| (QREFELT $ 131))
                                             (-
                                              (SPADCALL
                                               (SPADCALL |a| |v0|
                                                         (QREFELT $ 162))
                                               (QREFELT $ 146)))
                                             (QREFELT $ 105))
                                   . #18#)
                             (COND
                              (#4#
                               (LETT #5# (SPADCALL #5# #6# (QREFELT $ 108))
                                     . #18#))
                              ('T
                               (PROGN
                                (LETT #5# #6# . #18#)
                                (LETT #4# 'T . #18#)))))))
                          (LETT #7#
                                (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #18#))
                                . #18#)
                          (GO G190) G191 (EXIT NIL))
                     (COND (#4# #5#) (#19# (|spadConstant| $ 71))))
                    . #18#)
              (LETT |h|
                    (SPADCALL
                     (SPADCALL |h|
                               (SPADCALL
                                (SPADCALL (SPADCALL |v0| |g| (QREFELT $ 161))
                                          (QREFELT $ 14))
                                (QREFELT $ 131))
                               (QREFELT $ 108))
                     (SPADCALL (SPADCALL |k| (QREFELT $ 88)) |v0|
                               (QREFELT $ 105))
                     (QREFELT $ 108))
                    . #18#)
              (LETT |nlf|
                    (PROGN
                     (LETT #3# NIL . #18#)
                     (SEQ (LETT |f| NIL . #18#) (LETT #2# |lf| . #18#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |f| (CAR #2#) . #18#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL |f| (LIST (QCDR (QCDR |rec|)))
                                             (LIST |h|) (QREFELT $ 112))
                                   #3#)
                                  . #18#)))
                          (LETT #2# (CDR #2#) . #18#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #18#)
              (EXIT (VECTOR |nlf| (LIST (QCDR (QCDR |rec|))) (LIST |h|)))))))))) 

(SDEFUN |EFSTRUC;normalize;2F;52| ((|f| F) ($ F))
        (|SPADfirst| (SPADCALL (LIST |f|) NIL (QREFELT $ 193)))) 

(SDEFUN |EFSTRUC;normalize;2L;53| ((|lf| |List| F) ($ |List| F))
        (SPADCALL |lf| NIL (QREFELT $ 193))) 

(SDEFUN |EFSTRUC;normalize;FSF;54| ((|f| F) (|x| |Symbol|) ($ F))
        (|SPADfirst| (SPADCALL (LIST |f|) (LIST |x|) (QREFELT $ 193)))) 

(SDEFUN |EFSTRUC;normalize;LLL;55|
        ((|lf| |List| F) (|lx| |List| (|Symbol|)) ($ |List| F))
        (SPROG ((|lf2| (|List| F)) (#1=#:G1470 NIL) (|f| NIL) (#2=#:G1469 NIL))
               (SEQ
                (LETT |lf2|
                      (PROGN
                       (LETT #2# NIL . #3=(|EFSTRUC;normalize;LLL;55|))
                       (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL (SPADCALL |f| (QREFELT $ 23))
                                               (QREFELT $ 197))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (QVELT (SPADCALL |lf2| |lx| (QREFELT $ 176)) 0))))) 

(SDEFUN |EFSTRUC;factdeprel|
        ((|l| |List| (|Kernel| F)) (|k| |Kernel| F)
         ($ |Union| (|:| |vec| (|Vector| (|Fraction| (|Integer|))))
          (|:| |func| F) (|:| |fail| (|Boolean|))))
        (SPROG
         ((#1=#:G1509 NIL) (#2=#:G1511 NIL) (#3=#:G1503 NIL) (#4=#:G1502 (F))
          (#5=#:G1504 (F)) (#6=#:G1513 NIL) (|i| NIL)
          (|r| (|Union| (|Integer|) "failed")) (|m| (F)) (#7=#:G1512 NIL)
          (|x| NIL) (#8=#:G1510 NIL) (|n| (F)))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ
              (SEQ
               (LETT |r|
                     (SPADCALL
                      (LETT |n| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                            . #9=(|EFSTRUC;factdeprel|))
                      (QREFELT $ 52))
                     . #9#)
               (EXIT
                (COND
                 ((QEQCAR |r| 0)
                  (COND
                   ((SPADCALL (QCDR |r|) 0 (QREFELT $ 104))
                    (PROGN
                     (LETT #8#
                           (CONS 1
                                 (SPADCALL
                                  (SPADCALL (QCDR |r|) (QREFELT $ 198))
                                  (QREFELT $ 13)))
                           . #9#)
                     (GO #10=#:G1507))))))))
              (SEQ (LETT |x| NIL . #9#) (LETT #7# |l| . #9#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |m| (|SPADfirst| (SPADCALL |x| (QREFELT $ 32)))
                            . #9#)
                      (LETT |r|
                            (SPADCALL (SPADCALL |n| |m| (QREFELT $ 133))
                                      (QREFELT $ 52))
                            . #9#)
                      (EXIT
                       (COND
                        ((QEQCAR |r| 0)
                         (PROGN
                          (LETT #1#
                                (COND
                                 ((SPADCALL (QCDR |r|) 0 (QREFELT $ 104))
                                  (PROGN
                                   (LETT #2#
                                         (CONS 1
                                               (SPADCALL
                                                (PROGN
                                                 (LETT #3# NIL . #9#)
                                                 (SEQ (LETT |i| 1 . #9#)
                                                      (LETT #6# (QCDR |r|)
                                                            . #9#)
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |i| #6#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #5#
                                                               (SPADCALL |m|
                                                                         (SPADCALL
                                                                          |i|
                                                                          (QREFELT
                                                                           $
                                                                           13))
                                                                         (QREFELT
                                                                          $
                                                                          135))
                                                               . #9#)
                                                         (COND
                                                          (#3#
                                                           (LETT #4#
                                                                 (SPADCALL #4#
                                                                           #5#
                                                                           (QREFELT
                                                                            $
                                                                            108))
                                                                 . #9#))
                                                          ('T
                                                           (PROGN
                                                            (LETT #4# #5#
                                                                  . #9#)
                                                            (LETT #3# 'T
                                                                  . #9#)))))))
                                                      (LETT |i| (|inc_SI| |i|)
                                                            . #9#)
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#3# #4#)
                                                       ('T
                                                        (|spadConstant| $
                                                                        71))))
                                                (SPADCALL |x| (QREFELT $ 88))
                                                (QREFELT $ 108)))
                                         . #9#)
                                   (GO #11=#:G1508)))
                                 ('T (|error| "bad order of factorials")))
                                . #9#)
                          (GO #12=#:G1505)))))))
                    #12# (EXIT #1#))
                   (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 2 'T))))
            #10# (EXIT #8#)))
          #11# (EXIT #2#)))) 

(SDEFUN |EFSTRUC;normalize;LLL;57|
        ((|lf| |List| F) (|lx| |List| (|Symbol|)) ($ |List| F))
        (SPROG ((|lf2| (|List| F)) (#1=#:G1519 NIL) (|f| NIL) (#2=#:G1518 NIL))
               (SEQ
                (LETT |lf2|
                      (PROGN
                       (LETT #2# NIL . #3=(|EFSTRUC;normalize;LLL;57|))
                       (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |f| (QREFELT $ 23)) #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (QVELT (SPADCALL |lf2| |lx| (QREFELT $ 176)) 0))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionStructurePackage;|)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G1520)
  (SPROG NIL
         (PROG (#2=#:G1521)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionStructurePackage|)
                                               '|domainEqualList|)
                    . #3=(|ElementaryFunctionStructurePackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ElementaryFunctionStructurePackage;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionStructurePackage|)))))))))) 

(DEFUN |ElementaryFunctionStructurePackage;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|ElementaryFunctionStructurePackage|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ElementaryFunctionStructurePackage| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 199) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionStructurePackage|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|htrig|)
          (QSETREFV $ 9 '|trig|)
          (QSETREFV $ 10 (|HasCategory| |#2| '(|CombinatorialOpsCategory|)))
          (QSETREFV $ 16
                    (SPADCALL (SPADCALL (QREFELT $ 11))
                              (SPADCALL (SPADCALL 2 (QREFELT $ 13))
                                        (QREFELT $ 14))
                              (QREFELT $ 15)))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (QSETREFV $ 50
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;11|) $)))
           ('T
            (QSETREFV $ 50
                      (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;12|) $))))
          (QSETREFV $ 72 '|%alg|)
          (QSETREFV $ 127
                    (SPADCALL (SPADCALL '|%iint| (QREFELT $ 124))
                              (QREFELT $ 126)))
          (COND
           ((|HasCategory| |#1| '(|GcdDomain|))
            (PROGN
             (QSETREFV $ 191
                       (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;48|)
                             $))))
           ('T
            (QSETREFV $ 191
                      (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;49|) $))))
          (COND
           ((|HasCategory| |#2| '(|CombinatorialOpsCategory|))
            (PROGN
             (QSETREFV $ 193
                       (CONS (|dispatchFunction| |EFSTRUC;normalize;LLL;55|)
                             $))))
           ('T
            (QSETREFV $ 193
                      (CONS (|dispatchFunction| |EFSTRUC;normalize;LLL;57|)
                            $))))
          $))) 

(MAKEPROP '|ElementaryFunctionStructurePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'HTRIG
              'TRIG '|comb?| (0 . |pi|) (|Integer|) (4 . |coerce|) (9 . -)
              (14 . /) '|mpiover2| (|Mapping| 7 29) |EFSTRUC;rmap;M2F;26|
              (|Symbol|) |EFSTRUC;realElementary;FSF;2| (|List| 19)
              (20 . |variables|) |EFSTRUC;realElementary;2F;3|
              |EFSTRUC;realLiouvillian;2F;4| |EFSTRUC;realLiouvillian;FSF;5|
              (25 . |Zero|) (|Boolean|) (29 . ~=) (|Kernel| 7) (35 . |is?|)
              (|List| 7) (41 . |argument|) (46 . |first|) (51 . =)
              (|Mapping| 27 29) (|List| 29) (57 . |select|) (|Fraction| 12)
              (63 . |denom|) (|SparseUnivariatePolynomial| 7)
              (|PositiveInteger|) (|TangentExpansions| 7) (68 . |tanAn|)
              (|SparseUnivariatePolynomial| $) (74 . |zeroOf|)
              (|AlgebraicManipulations| 6 7) (79 . |rootSimp|) (84 . |numer|)
              (89 . |tanNa|) (95 . |tanQ|) (|Union| 12 '#1="failed")
              (101 . |retractIfCan|) (106 . |tanSum|) (111 . |inv|)
              (116 . |tan|) (121 . |Zero|) (125 . |differentiate|) (|Vector| 7)
              (131 . |setelt!|) (138 . |elt|) (|OutputForm|) (144 . |coerce|)
              (|Void|) (149 . |print|) (|Matrix| 7) (154 . |setelt!|)
              (|Union| 106 '"failed") (|IntegerLinearDependence| 7)
              (162 . |particularSolutionOverQ|) (168 . |One|) (172 . |One|)
              'ALGOP (|BasicOperator|) (176 . |operator|) (181 . |has?|)
              (187 . |elt|) (|Union| 38 '#1#) (193 . |retractIfCan|)
              (198 . |One|) (|List| 87) (202 . |kernels|) (207 . =) (213 . -)
              (|List| 38) (|MultiplicativeDependence|) (218 . |logDependenceQ|)
              (|Kernel| $) (224 . |coerce|) (229 . |log|)
              (|Union| 95 '"failed") (|Expression| 6) (|Numeric| 6)
              (234 . |numericIfCan|) (|NonNegativeInteger|) (|Float|)
              (240 . |rationalApproximation|) (246 . |Zero|) (250 . |coerce|)
              (255 . /) (261 . |float|) (268 . -) (274 . |abs|) (279 . >)
              (285 . >) (291 . ^) (|Vector| 38) (297 . |zero|) (302 . *)
              (308 . |new|) (312 . |kernel|) (|List| $) (317 . |eval|)
              (324 . |atan|) (329 . ~=) (335 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 29)
              (|PolynomialCategoryLifting| (|IndexedExponents| 29) 29 6 117 7)
              (340 . |map|) (|SparseMultivariatePolynomial| 6 87)
              (347 . |numer|) (352 . |denom|) (|CommonOperators|)
              (357 . |operator|) (|LiouvillianFunction| 6 7) (362 . |operator|)
              '|opint| (367 . |is?|) (373 . |zero?|) (378 . |last|)
              (383 . |exp|) (388 . ^) (394 . -) (400 . |sqrt|) (405 . +)
              (411 . *) (417 . |One|) (421 . |elt|) (427 . |coerce|) (432 . D)
              (438 . |concat|) (444 . |kernel|) (450 . |name|)
              (455 . |minIndex|) (460 . |elt|) (466 . |retract|)
              (471 . |nthRoot|) (477 . |second|) (482 . |retract|) (487 . ~=)
              (493 . |coerce|) (498 . /) (504 . ^) (510 . *)
              (516 . |retractIfCan|) (521 . |height|) (526 . >)
              (|Union| $ '"failed") (532 . |recip|) (537 . |inv|) (542 . *)
              (548 . *) (554 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 38 (|Vector| 12) 106)
              (560 . |splitDenominator|) (565 . |lcm|) (570 . *)
              (576 . |coerce|) (581 . |tower|) (586 . |variables|)
              (591 . |setDifference|) (597 . |first|) (603 . |empty?|)
              (|Record| (|:| |funcs| 31) (|:| |kers| 36) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;LLR;42| (608 . |concat|)
              (|Record| (|:| |func| 7) (|:| |kers| 36) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;FLR;43| |EFSTRUC;rischNormalize;FSR;44|
              (614 . |tower|) |EFSTRUC;rootNormalize;FKF;45|
              (619 . |construct|) (624 . |particularSolutionOverQ|)
              (|Union| 7 '"failed") |EFSTRUC;validExponential;LFSU;47|
              (|Record| (|:| |exponent| 94) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 29) 29 6 117 7)
              (630 . |froot|)
              (|Union| (|:| |vec| 106) (|:| |func| 7) (|:| |fail| 27))
              (636 . |irootDep|) (641 . |lcm|) (647 . |normalize|)
              |EFSTRUC;normalize;2F;52| |EFSTRUC;normalize;2L;53|
              |EFSTRUC;normalize;FSF;54| (653 . |factorials|)
              (658 . |factorial|))
           '#(|validExponential| 663 |tanQ| 670 |rootNormalize| 676 |rmap| 682
              |rischNormalize| 688 |realLiouvillian| 706 |realElementary| 717
              |normalize| 728 |irootDep| 750)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 198
                                                 '(0 7 0 11 1 7 0 12 13 1 7 0 0
                                                   14 2 7 0 0 0 15 1 7 21 0 22
                                                   0 7 0 26 2 7 27 0 0 28 2 29
                                                   27 0 19 30 1 29 31 0 32 1 31
                                                   7 0 33 2 7 27 0 0 34 2 36 0
                                                   35 0 37 1 38 12 0 39 2 42 40
                                                   7 41 43 1 7 0 44 45 1 46 7 7
                                                   47 1 38 12 0 48 2 42 7 7 12
                                                   49 2 0 7 38 7 50 1 7 51 0 52
                                                   1 42 7 31 53 1 7 0 0 54 1 7
                                                   0 0 55 0 6 0 56 2 7 0 0 19
                                                   57 3 58 7 0 12 7 59 2 58 7 0
                                                   12 60 1 7 61 0 62 1 61 63 0
                                                   64 4 65 7 0 12 12 7 66 2 68
                                                   67 65 58 69 0 6 0 70 0 7 0
                                                   71 1 29 73 0 74 2 73 27 0 19
                                                   75 2 31 7 0 12 76 1 7 77 0
                                                   78 0 38 0 79 1 7 80 0 81 2
                                                   38 27 0 0 82 1 38 0 0 83 2
                                                   85 67 84 38 86 1 7 0 87 88 1
                                                   7 0 0 89 2 92 90 91 41 93 2
                                                   95 38 0 94 96 0 38 0 97 1 95
                                                   0 38 98 2 95 0 0 0 99 3 95 0
                                                   12 12 41 100 2 95 0 0 0 101
                                                   1 95 0 0 102 2 95 27 0 0 103
                                                   2 12 27 0 0 104 2 7 0 0 12
                                                   105 1 106 0 94 107 2 7 0 0 0
                                                   108 0 19 0 109 1 29 0 19 110
                                                   3 7 0 0 80 111 112 1 7 0 0
                                                   113 2 29 27 0 0 114 1 7 0 6
                                                   115 3 118 7 17 116 117 119 1
                                                   7 120 0 121 1 7 120 0 122 1
                                                   123 73 19 124 1 125 73 73
                                                   126 2 73 27 0 19 128 1 7 27
                                                   0 129 1 31 7 0 130 1 7 0 0
                                                   131 2 7 0 0 41 132 2 7 0 0 0
                                                   133 1 7 0 0 134 2 7 0 0 0
                                                   135 2 7 0 41 0 136 0 117 0
                                                   137 2 7 0 73 111 138 1 7 0
                                                   19 139 2 7 0 0 19 140 2 31 0
                                                   0 0 141 2 7 0 73 111 142 1
                                                   73 19 0 143 1 106 12 0 144 2
                                                   106 38 0 12 145 1 38 12 0
                                                   146 2 7 0 0 12 147 1 31 7 0
                                                   148 1 7 12 0 149 2 12 27 0 0
                                                   150 1 38 0 12 151 2 38 0 0 0
                                                   152 2 7 0 0 38 153 2 7 0 38
                                                   0 154 1 38 51 0 155 1 29 94
                                                   0 156 2 94 27 0 0 157 1 38
                                                   158 0 159 1 38 0 0 160 2 7 0
                                                   12 0 161 2 38 0 0 12 162 2
                                                   36 27 35 0 163 1 165 164 106
                                                   166 1 12 0 111 167 2 38 0 12
                                                   0 168 1 6 0 12 169 1 7 80
                                                   111 170 1 7 21 111 171 2 21
                                                   0 0 0 172 2 36 0 0 94 173 1
                                                   106 27 0 174 2 36 0 0 0 177
                                                   1 7 80 0 181 1 58 0 31 183 2
                                                   68 67 58 7 184 2 188 187 7
                                                   94 189 1 0 190 29 191 2 12 0
                                                   0 0 192 2 0 31 31 21 193 1 7
                                                   0 0 197 1 12 0 0 198 3 0 185
                                                   36 7 19 186 2 0 7 38 7 50 2
                                                   0 7 7 29 182 2 0 7 17 7 18 2
                                                   0 178 7 21 179 2 0 178 7 19
                                                   180 2 0 175 31 21 176 2 0 7
                                                   7 19 25 1 0 7 7 24 1 0 7 7
                                                   23 2 0 7 7 19 20 1 0 31 31
                                                   195 1 0 7 7 194 2 0 31 31 21
                                                   193 2 0 7 7 19 196 1 0 190
                                                   29 191)))))
           '|lookupComplete|)) 
