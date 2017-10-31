
(SDEFUN |FSINT;K2KG|
        ((|k| |Kernel| F) ($ |Kernel| (|Expression| (|Complex| R))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 19))) (QREFELT $ 22))
          (QREFELT $ 23))
         (QREFELT $ 25))) 

(SDEFUN |FSINT;tan2temp| ((|k| |Kernel| F) ($ |Kernel| F))
        (SPADCALL (QREFELT $ 16) (SPADCALL |k| (QREFELT $ 19))
                  (SPADCALL |k| (QREFELT $ 26)) (QREFELT $ 27))) 

(SDEFUN |FSINT;trans?| ((|f| F) ($ |Boolean|))
        (SPADCALL (CONS #'|FSINT;trans?!0| $) (SPADCALL |f| (QREFELT $ 31))
                  (QREFELT $ 33))) 

(SDEFUN |FSINT;trans?!0| ((|x1| NIL) ($ NIL))
        (COND
         ((OR (SPADCALL |x1| '|log| (QREFELT $ 29))
              (SPADCALL |x1| '|exp| (QREFELT $ 29)))
          'T)
         ('T (SPADCALL |x1| '|atan| (QREFELT $ 29))))) 

(SDEFUN |FSINT;mkPrimh| ((|f| F) (|x| |Symbol|) (|h| |Boolean|) ($ F))
        (SPROG ((|g| (F)))
               (SEQ
                (LETT |g| (SPADCALL |f| |x| (QREFELT $ 35)) |FSINT;mkPrimh|)
                (COND
                 (|h|
                  (COND
                   ((|FSINT;trans?| |g| $)
                    (EXIT (SPADCALL |g| (QREFELT $ 37)))))))
                (EXIT |g|)))) 

(SDEFUN |FSINT;rinteg|
        ((|i| |IntegrationResult| F) (|f| F) (|x| |Symbol|) (|h| |Boolean|)
         ($ |List| F))
        (SPROG ((#1=#:G750 NIL) (#2=#:G749 NIL))
               (SEQ
                (COND
                 ((NULL (SPADCALL |i| (QREFELT $ 39)))
                  (LIST (SPADCALL |f| |x| (QREFELT $ 40))))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3=(|FSINT;rinteg|))
                   (SEQ (LETT |f| NIL . #3#)
                        (LETT #1# (SPADCALL |i| (QREFELT $ 42)) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (|FSINT;mkPrimh| |f| |x| |h| $) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FSINT;halfangle| ((|a| F) ($ F))
        (SEQ (LETT |a| (SPADCALL 2 |a| (QREFELT $ 44)) |FSINT;halfangle|)
             (EXIT
              (SPADCALL
               (SPADCALL (|spadConstant| $ 46) (SPADCALL |a| (QREFELT $ 47))
                         (QREFELT $ 48))
               (SPADCALL (|spadConstant| $ 46) (SPADCALL |a| (QREFELT $ 47))
                         (QREFELT $ 49))
               (QREFELT $ 50))))) 

(SDEFUN |FSINT;Khalf| ((|k| |Kernel| F) ($ F))
        (SPROG ((|a| (F)))
               (SEQ
                (LETT |a|
                      (SPADCALL 2 (|SPADfirst| (SPADCALL |k| (QREFELT $ 19)))
                                (QREFELT $ 44))
                      |FSINT;Khalf|)
                (EXIT
                 (SPADCALL (SPADCALL |a| (QREFELT $ 51))
                           (SPADCALL (|spadConstant| $ 46)
                                     (SPADCALL |a| (QREFELT $ 47))
                                     (QREFELT $ 49))
                           (QREFELT $ 50)))))) 

(SDEFUN |FSINT;find_int|
        ((|i| |Kernel| F) (|t| |List| (|Kernel| F)) ($ |Kernel| F))
        (SPROG
         ((#1=#:G761 NIL) (|akl| #2=(|List| F)) (#3=#:G762 NIL) (|k| NIL)
          (|ii| (F)) (|k0| (|NonNegativeInteger|)) (|ail| #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ail| (SPADCALL |i| (QREFELT $ 19)) . #4=(|FSINT;find_int|))
            (LETT |k0| (LENGTH |ail|) . #4#)
            (LETT |ii| (SPADCALL |i| (QREFELT $ 52)) . #4#)
            (SEQ (LETT |k| NIL . #4#) (LETT #3# |t| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |k| (QREFELT $ 53)) '|%iint|
                               (QREFELT $ 29))
                     (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 19)) . #4#)
                          (EXIT
                           (COND
                            ((SPADCALL (LENGTH |akl|) |k0| (QREFELT $ 54))
                             "iterate")
                            ((SPADCALL
                              (SPADCALL
                               (SPADCALL |ii| (SPADCALL |k| (QREFELT $ 52))
                                         (QREFELT $ 48))
                               (QREFELT $ 56))
                              (|spadConstant| $ 57) (QREFELT $ 58))
                             (PROGN
                              (LETT #1# |k| . #4#)
                              (GO #5=#:G760))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |i|)))
          #5# (EXIT #1#)))) 

(SDEFUN |FSINT;try_real| ((|f| F) ($ F))
        (SPROG ((|pu| (|Union| F "failed")))
               (SEQ
                (LETT |pu| (|trappedSpadEval| (SPADCALL |f| (QREFELT $ 60)))
                      |FSINT;try_real|)
                (EXIT (COND ((QEQCAR |pu| 0) (QCDR |pu|)) ('T |f|)))))) 

(SDEFUN |FSINT;postSubst|
        ((|f| F) (|otf| |List| (|Kernel| F)) (|lv| |List| F)
         (|lk| |List| (|Kernel| F)) (|ltan| |List| (|Kernel| F))
         (|ekers| |List| (|Kernel| F)) (|evals| |List| F) (|x| |Symbol|) ($ F))
        (SPROG
         ((#1=#:G819 NIL) (|k| (|Kernel| F)) (#2=#:G818 NIL) (#3=#:G817 NIL)
          (#4=#:G816 NIL) (|ltemp| (|List| (|Kernel| F))) (#5=#:G815 NIL)
          (#6=#:G814 NIL) (|tf| (|List| (|Kernel| F))) (#7=#:G812 NIL)
          (#8=#:G813 NIL) (|v| NIL) (|vkv| (F)) (|vc| (F)) (|vkf| (F))
          (|vk| (|Kernel| F)) (|vkl| (|List| (|Kernel| F))) (#9=#:G811 NIL)
          (|kk| NIL) (#10=#:G810 NIL) (|uk| (|Kernel| F))
          (|u| (|Union| (|Kernel| F) "failed")) (#11=#:G808 NIL)
          (#12=#:G809 NIL))
         (SEQ
          (SEQ (LETT |k| NIL . #13=(|FSINT;postSubst|)) (LETT #12# |lk| . #13#)
               (LETT |v| NIL . #13#) (LETT #11# |lv| . #13#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |v| (CAR #11#) . #13#) NIL)
                     (ATOM #12#) (PROGN (LETT |k| (CAR #12#) . #13#) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |v| (QREFELT $ 62)) . #13#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ (LETT |uk| (QCDR |u|) . #13#)
                            (COND
                             ((SPADCALL (SPADCALL |uk| (QREFELT $ 53))
                                        (QREFELT $ 11) (QREFELT $ 63))
                              (LETT |f|
                                    (SPADCALL
                                     (SPADCALL |f| |uk|
                                               (SPADCALL |uk| (QREFELT $ 65))
                                               (QREFELT $ 68))
                                     (SPADCALL |uk| (QREFELT $ 52))
                                     (QREFELT $ 69))
                                    . #13#)))
                            (EXIT
                             (LETT |f|
                                   (SPADCALL |f| (LIST |uk|)
                                             (LIST
                                              (SPADCALL |k| (QREFELT $ 52)))
                                             (QREFELT $ 72))
                                   . #13#))))
                      ((SPADCALL |k| '|nthRoot| (QREFELT $ 73))
                       (SEQ
                        (LETT |vkl|
                              (PROGN
                               (LETT #10# NIL . #13#)
                               (SEQ (LETT |kk| NIL . #13#)
                                    (LETT #9# (SPADCALL |v| (QREFELT $ 74))
                                          . #13#)
                                    G190
                                    (COND
                                     ((OR (ATOM #9#)
                                          (PROGN
                                           (LETT |kk| (CAR #9#) . #13#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL |kk| '|nthRoot|
                                                  (QREFELT $ 73))
                                        (LETT #10# (CONS |kk| #10#) . #13#)))))
                                    (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                                    (EXIT (NREVERSE #10#))))
                              . #13#)
                        (EXIT
                         (COND
                          ((EQL (LENGTH |vkl|) 1)
                           (SEQ
                            (LETT |vk| (SPADCALL |vkl| 1 (QREFELT $ 77))
                                  . #13#)
                            (EXIT
                             (COND
                              ((SPADCALL |vk| |otf| (QREFELT $ 78)) "skip")
                              ('T
                               (SEQ
                                (LETT |vkf| (SPADCALL |vk| (QREFELT $ 52))
                                      . #13#)
                                (LETT |vc| (SPADCALL |v| |vkf| (QREFELT $ 50))
                                      . #13#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |vk|
                                             (SPADCALL |vc| (QREFELT $ 74))
                                             (QREFELT $ 78))
                                   "skip")
                                  ('T
                                   (SEQ
                                    (LETT |vkv|
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 52)) |vc|
                                           (QREFELT $ 50))
                                          . #13#)
                                    (LETT |f|
                                          (SPADCALL
                                           (SPADCALL |f| |vk|
                                                     (SPADCALL |vk|
                                                               (QREFELT $ 65))
                                                     (QREFELT $ 68))
                                           |vkf| (QREFELT $ 69))
                                          . #13#)
                                    (EXIT
                                     (LETT |f|
                                           (SPADCALL |f| (LIST |vk|)
                                                     (LIST |vkv|)
                                                     (QREFELT $ 72))
                                           . #13#)))))))))))))))))))
               (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #13#))
                     . #13#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |v| NIL . #13#) (LETT #8# |evals| . #13#)
               (LETT |k| NIL . #13#) (LETT #7# |ekers| . #13#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #13#) NIL)
                     (ATOM #8#) (PROGN (LETT |v| (CAR #8#) . #13#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |k| (QREFELT $ 53)) '|%iint|
                            (QREFELT $ 29))
                  (COND
                   ((NULL
                     (SPADCALL |k|
                               (LETT |tf| (SPADCALL |f| (QREFELT $ 79)) . #13#)
                               (QREFELT $ 78)))
                    (LETT |k| (|FSINT;find_int| |k| |tf| $) . #13#)))))
                (EXIT
                 (LETT |f| (SPADCALL |f| (LIST |k|) (LIST |v|) (QREFELT $ 72))
                       . #13#)))
               (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #13#)) . #13#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL (NULL |ltan|))
            (SEQ
             (LETT |ltemp|
                   (PROGN
                    (LETT #6# NIL . #13#)
                    (SEQ (LETT |k| NIL . #13#) (LETT #5# |ltan| . #13#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |k| (CAR #5#) . #13#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #6# (CONS (|FSINT;tan2temp| |k| $) #6#)
                                 . #13#)))
                         (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                         (EXIT (NREVERSE #6#))))
                   . #13#)
             (LETT |f|
                   (SPADCALL |f| |ltan|
                             (PROGN
                              (LETT #4# NIL . #13#)
                              (SEQ (LETT |k| NIL . #13#)
                                   (LETT #3# |ltemp| . #13#) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN
                                          (LETT |k| (CAR #3#) . #13#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS (SPADCALL |k| (QREFELT $ 52))
                                                 #4#)
                                           . #13#)))
                                   (LETT #3# (CDR #3#) . #13#) (GO G190) G191
                                   (EXIT (NREVERSE #4#))))
                             (QREFELT $ 72))
                   . #13#)
             (LETT |f|
                   (SPADCALL |f| '|%temptan| 2
                             (CONS (|function| |FSINT;halfangle|) $)
                             (QREFELT $ 81))
                   . #13#)
             (EXIT
              (LETT |f|
                    (SPADCALL |f| |ltemp|
                              (PROGN
                               (LETT #2# NIL . #13#)
                               (SEQ (LETT |k| NIL . #13#)
                                    (LETT #1# |ltemp| . #13#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |k| (CAR #1#) . #13#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS (|FSINT;Khalf| |k| $) #2#)
                                            . #13#)))
                                    (LETT #1# (CDR #1#) . #13#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 72))
                    . #13#)))))
          (LETT |f| (|FSINT;try_real| |f| $) . #13#)
          (LETT |f| (SPADCALL |f| (QREFELT $ 82)) . #13#)
          (EXIT (SPADCALL |f| |x| (QREFELT $ 83)))))) 

(SDEFUN |FSINT;inv_lst|
        ((|lt| |List| (|Kernel| (|Expression| (|Complex| R))))
         (|le| |List| (|Expression| (|Complex| R)))
         ($ |Record|
          (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|:| |val| (|List| (|Expression| (|Complex| R))))))
        (SPROG
         ((|rese| (|List| (|Expression| (|Complex| R))))
          (|resk| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|ie| (|Expression| (|Complex| R)))
          (|ik| (|Kernel| (|Expression| (|Complex| R))))
          (|iku| (|Union| (|Kernel| (|Expression| (|Complex| R))) "failed"))
          (|k1| #1=(|Expression| (|Complex| R))) (|e1| #1#) (#2=#:G834 NIL)
          (|k| NIL) (#3=#:G835 NIL) (|e| NIL) (|im| (|Complex| R)))
         (SEQ (LETT |resk| NIL . #4=(|FSINT;inv_lst|)) (LETT |rese| NIL . #4#)
              (LETT |im|
                    (SPADCALL (|spadConstant| $ 84) (|spadConstant| $ 45)
                              (QREFELT $ 86))
                    . #4#)
              (SEQ (LETT |e| NIL . #4#) (LETT #3# |le| . #4#)
                   (LETT |k| NIL . #4#) (LETT #2# |lt| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |e| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |k| '|atan| (QREFELT $ 88)))
                      (COND
                       ((NULL (SPADCALL |k| '|tan| (QREFELT $ 88)))
                        (EXIT "iterate")))))
                    (COND
                     ((SPADCALL |k| '|atan| (QREFELT $ 88))
                      (SEQ
                       (LETT |ik|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |im| (QREFELT $ 89)) |e|
                                         (QREFELT $ 90))
                               (QREFELT $ 91))
                              (QREFELT $ 25))
                             . #4#)
                       (LETT |ie|
                             (SPADCALL
                              (SPADCALL (SPADCALL 2 |im| (QREFELT $ 89))
                                        (SPADCALL |k| (QREFELT $ 92))
                                        (QREFELT $ 90))
                              (QREFELT $ 91))
                             . #4#)
                       (LETT |resk| (CONS |ik| |resk|) . #4#)
                       (EXIT (LETT |rese| (CONS |ie| |rese|) . #4#)))))
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|tan| (QREFELT $ 88))
                       (SEQ
                        (LETT |e1| (SPADCALL |im| |e| (QREFELT $ 90)) . #4#)
                        (LETT |k1|
                              (SPADCALL |im| (SPADCALL |k| (QREFELT $ 92))
                                        (QREFELT $ 90))
                              . #4#)
                        (LETT |iku|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |e1| (|spadConstant| $ 93)
                                           (QREFELT $ 94))
                                 (SPADCALL |e1| (|spadConstant| $ 93)
                                           (QREFELT $ 95))
                                 (QREFELT $ 96))
                                (QREFELT $ 91))
                               (QREFELT $ 97))
                              . #4#)
                        (EXIT
                         (COND ((QEQCAR |iku| 1) "iterate")
                               ('T
                                (SEQ (LETT |ik| (QCDR |iku|) . #4#)
                                     (LETT |ie|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |k1|
                                                       (|spadConstant| $ 93)
                                                       (QREFELT $ 94))
                                             (SPADCALL |k1|
                                                       (|spadConstant| $ 93)
                                                       (QREFELT $ 95))
                                             (QREFELT $ 96))
                                            (QREFELT $ 91))
                                           . #4#)
                                     (LETT |resk| (CONS |ik| |resk|) . #4#)
                                     (EXIT
                                      (LETT |rese| (CONS |ie| |rese|)
                                            . #4#)))))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (REVERSE |resk|) (REVERSE |rese|)))))) 

(SDEFUN |FSINT;inv_alg_lst|
        ((|lt| |List| (|Kernel| F))
         ($ |Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
        (SPROG
         ((|rese| (|List| F)) (|resk| (|List| (|Kernel| F)))
          (|ru1| (|Union| (|Kernel| F) "failed")) (|e2| (F))
          (|ckf| (|Expression| (|Complex| R)))
          (|ck| (|Kernel| (|Expression| (|Complex| R))))
          (|ckl| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|e1| (|Expression| (|Complex| R))) (#1=#:G848 NIL) (|k| NIL)
          (|im| (F)))
         (SEQ (LETT |resk| NIL . #2=(|FSINT;inv_alg_lst|))
              (LETT |rese| NIL . #2#)
              (LETT |im|
                    (SPADCALL (SPADCALL (|spadConstant| $ 46) (QREFELT $ 98))
                              (QREFELT $ 99))
                    . #2#)
              (SEQ (LETT |k| NIL . #2#) (LETT #1# |lt| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 73)))
                       "iterate")
                      ('T
                       (SEQ
                        (LETT |e1|
                              (SPADCALL (SPADCALL |k| (QREFELT $ 52))
                                        (QREFELT $ 22))
                              . #2#)
                        (LETT |ckl| (SPADCALL |e1| (QREFELT $ 100)) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL (LENGTH |ckl|) 1 (QREFELT $ 54))
                           "iterate")
                          ('T
                           (SEQ
                            (LETT |ck| (SPADCALL |ckl| 1 (QREFELT $ 102))
                                  . #2#)
                            (LETT |ckf| (SPADCALL |ck| (QREFELT $ 92)) . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL |e1| |ckf| (QREFELT $ 103)) "iterate")
                              ('T
                               (SEQ
                                (LETT |e2| (SPADCALL |ckf| (QREFELT $ 104))
                                      . #2#)
                                (LETT |ru1| (SPADCALL |e2| (QREFELT $ 62))
                                      . #2#)
                                (EXIT
                                 (COND ((QEQCAR |ru1| 1) "iterate")
                                       ('T
                                        (SEQ
                                         (LETT |resk|
                                               (CONS (QCDR |ru1|) |resk|)
                                               . #2#)
                                         (EXIT
                                          (LETT |rese|
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |k| (QREFELT $ 52))
                                                  (SPADCALL
                                                   (SPADCALL |e1| |ckf|
                                                             (QREFELT $ 96))
                                                   (QREFELT $ 104))
                                                  (QREFELT $ 50))
                                                 |rese|)
                                                . #2#)))))))))))))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resk|) (NREVERSE |rese|)))))) 

(SDEFUN |FSINT;to_real|
        ((|fg| |Expression| (|Complex| R))
         (|rtg| |Record|
          (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|:| |val| (|List| (|Expression| (|Complex| R)))))
         (|ralg| |Record| (|:| |ker| (|List| (|Kernel| F)))
          (|:| |val| (|List| F)))
         ($ F))
        (SPROG ((|f| (F)))
               (SEQ
                (LETT |f|
                      (SPADCALL
                       (SPADCALL |fg| (QCAR |rtg|) (QCDR |rtg|)
                                 (QREFELT $ 105))
                       (QREFELT $ 104))
                      |FSINT;to_real|)
                (EXIT
                 (SPADCALL |f| (QCAR |ralg|) (QCDR |ralg|) (QREFELT $ 106)))))) 

(SDEFUN |FSINT;goComplex?|
        ((|rt| |Boolean|) (|l| |List| (|Kernel| F))
         (|ltan| |List| (|Kernel| F)) ($ |Boolean|))
        (COND ((NULL |ltan|) |rt|) ('T 'T))) 

(SDEFUN |FSINT;integrate;FSU;15|
        ((|f| F) (|x| |Symbol|) ($ |Union| F (|List| F)))
        (SPROG
         ((|rl| (|List| F)) (#1=#:G924 NIL) (|h| NIL) (#2=#:G923 NIL)
          (|ltg0| #3=(|List| (|Kernel| F))) (|i| (|IntegrationResult| F))
          (|gg| (|Expression| (|Complex| R)))
          (|rtg1|
           (|Record|
            (|:| |ker| (|List| (|Kernel| (|Expression| (|Complex| R)))))
            (|:| |val| (|List| (|Expression| (|Complex| R))))))
          (|tgg1| (|List| (|Expression| (|Complex| R)))) (#4=#:G922 NIL)
          (|k| NIL) (#5=#:G921 NIL)
          (|tgg0| (|List| (|Kernel| (|Expression| (|Complex| R)))))
          (|gg0| (|Expression| (|Complex| R)))
          (|ralg|
           (|Record| (|:| |ker| (|List| (|Kernel| F))) (|:| |val| (|List| F))))
          (|el| #6=(|Boolean|)) (|rtg| #6#) (|ltg| #3#)
          (|tg| (|List| (|Kernel| F))) (#7=#:G920 NIL) (#8=#:G919 NIL)
          (|tg0| #9=(|List| (|Kernel| F))) (|g| (F))
          (|nr_lst| (|List| (|Kernel| F))) (|ir_lst| (|List| F))
          (|rv_lst| (|List| F)) (|nk| (F)) (|ec| (F))
          (|r_lst| (|List| (|Kernel| F))) (|rnumu| (|Union| R "failed"))
          (|nak| (F))
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|ak2| (|NonNegativeInteger|)) (#10=#:G883 NIL) (|ak1| (F))
          (|akl| (|List| F)) (#11=#:G918 NIL) (|tf2| #9#)
          (|rec|
           (|Record| (|:| |func| F) (|:| |kers| (|List| (|Kernel| F)))
                     (|:| |vals| (|List| F))))
          (|tf1| #9#) (|f1| (F)) (|evals| (|List| F))
          (|ekers| (|List| (|Kernel| F))) (|kn| (|Symbol|)) (|s| (F))
          (|vk| (|Kernel| F)) (|vu| (|Union| (|Kernel| F) "failed"))
          (#12=#:G916 NIL) (#13=#:G917 NIL) (|v| NIL) (|etf| (|List| F))
          (#14=#:G915 NIL) (#15=#:G914 NIL) (|ht| #6#) (|ltf| #3#) (|tf| #9#))
         (SEQ
          (COND
           ((OR (|HasSignature| (QREFELT $ 6) (LIST '|imaginary| (LIST '$)))
                (|domainEqual| (QREFELT $ 6) (|AlgebraicNumber|)))
            (CONS 0 (SPADCALL |f| |x| (QREFELT $ 108))))
           ((NULL (SPADCALL |f| (QREFELT $ 109)))
            (CONS 0 (SPADCALL |f| |x| (QREFELT $ 108))))
           ('T
            (SEQ
             (LETT |f|
                   (SPADCALL |f| (SPADCALL |x| (QREFELT $ 110))
                             (QREFELT $ 111))
                   . #16=(|FSINT;integrate;FSU;15|))
             (LETT |tf| (SPADCALL |f| (QREFELT $ 79)) . #16#)
             (LETT |ltf|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!0| $) |tf|
                             (QREFELT $ 113))
                   . #16#)
             (LETT |ht|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!1|
                          (VECTOR (QREFELT $ 9) $))
                    |tf| (QREFELT $ 114))
                   . #16#)
             (LETT |etf|
                   (PROGN
                    (LETT #15# NIL . #16#)
                    (SEQ (LETT |k| NIL . #16#) (LETT #14# |tf| . #16#) G190
                         (COND
                          ((OR (ATOM #14#)
                               (PROGN (LETT |k| (CAR #14#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #15#
                                 (CONS
                                  (SPADCALL (SPADCALL |k| (QREFELT $ 52)) |x|
                                            (QREFELT $ 115))
                                  #15#)
                                 . #16#)))
                         (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #15#))))
                   . #16#)
             (LETT |ekers| NIL . #16#) (LETT |evals| NIL . #16#)
             (SEQ (LETT |v| NIL . #16#) (LETT #13# |etf| . #16#)
                  (LETT |k| NIL . #16#) (LETT #12# |tf| . #16#) G190
                  (COND
                   ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#) . #16#) NIL)
                        (ATOM #13#) (PROGN (LETT |v| (CAR #13#) . #16#) NIL))
                    (GO G191)))
                  (SEQ (LETT |s| (|spadConstant| $ 57) . #16#)
                       (SEQ (LETT |vu| (SPADCALL |v| (QREFELT $ 62)) . #16#)
                            (EXIT
                             (COND
                              ((QEQCAR |vu| 0)
                               (SEQ (LETT |vk| (QCDR |vu|) . #16#)
                                    (EXIT
                                     (LETT |s| (|spadConstant| $ 46) . #16#))))
                              ('T
                               (SEQ
                                (LETT |vu|
                                      (SPADCALL (SPADCALL |v| (QREFELT $ 98))
                                                (QREFELT $ 62))
                                      . #16#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |vu| 0)
                                   (SEQ (LETT |vk| (QCDR |vu|) . #16#)
                                        (EXIT
                                         (LETT |s|
                                               (SPADCALL (|spadConstant| $ 46)
                                                         (QREFELT $ 98))
                                               . #16#)))))))))))
                       (EXIT
                        (COND
                         ((SPADCALL |s| (|spadConstant| $ 57) (QREFELT $ 116))
                          (SEQ
                           (LETT |kn|
                                 (SPADCALL (SPADCALL |vk| (QREFELT $ 53))
                                           (QREFELT $ 117))
                                 . #16#)
                           (EXIT
                            (COND
                             ((OR (EQUAL |kn| '|%iint|) (EQUAL |kn| '|atan|))
                              (SEQ (LETT |ekers| (CONS |vk| |ekers|) . #16#)
                                   (EXIT
                                    (LETT |evals|
                                          (CONS
                                           (SPADCALL |s|
                                                     (SPADCALL |k|
                                                               (QREFELT $ 52))
                                                     (QREFELT $ 118))
                                           |evals|)
                                          . #16#)))))))))))
                  (LETT #12# (PROG1 (CDR #12#) (LETT #13# (CDR #13#) . #16#))
                        . #16#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |f1| (SPADCALL |f| |tf| |etf| (QREFELT $ 72)) . #16#)
             (LETT |tf1| (SPADCALL |f1| (QREFELT $ 79)) . #16#)
             (LETT |rec| (SPADCALL |f1| |x| (QREFELT $ 120)) . #16#)
             (LETT |tf2| (SPADCALL (QVELT |rec| 0) (QREFELT $ 79)) . #16#)
             (LETT |r_lst| NIL . #16#) (LETT |rv_lst| NIL . #16#)
             (LETT |nr_lst| NIL . #16#) (LETT |ir_lst| NIL . #16#)
             (SEQ (LETT |k| NIL . #16#) (LETT #11# |tf2| . #16#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |k| (CAR #11#) . #16#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 73)))
                      "iterate")
                     ('T
                      (SEQ (LETT |akl| (SPADCALL |k| (QREFELT $ 19)) . #16#)
                           (LETT |ak1|
                                 (SPADCALL (|SPADfirst| |akl|) |r_lst| |rv_lst|
                                           (QREFELT $ 72))
                                 . #16#)
                           (LETT |ak2|
                                 (PROG1
                                     (LETT #10#
                                           (SPADCALL
                                            (SPADCALL |akl| 2 (QREFELT $ 121))
                                            (QREFELT $ 122))
                                           . #16#)
                                   (|check_subtype2| (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                 . #16#)
                           (LETT |pr| (SPADCALL |ak1| |ak2| (QREFELT $ 125))
                                 . #16#)
                           (LETT |nak| (QVELT |pr| 2) . #16#)
                           (LETT |rnumu|
                                 (SPADCALL (SPADCALL |nak| (QREFELT $ 127))
                                           (QREFELT $ 130))
                                 . #16#)
                           (COND
                            ((EQL (QVELT |pr| 0) |ak2|)
                             (COND
                              ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 46)
                                         (QREFELT $ 58))
                               (COND ((QEQCAR |rnumu| 1) (EXIT "iterate")))))))
                           (LETT |r_lst| (CONS |k| |r_lst|) . #16#)
                           (LETT |ec|
                                 (SPADCALL (QVELT |pr| 1) |nr_lst| |ir_lst|
                                           (QREFELT $ 72))
                                 . #16#)
                           (COND
                            ((QEQCAR |rnumu| 0)
                             (SEQ
                              (LETT |nk|
                                    (SPADCALL (SPADCALL |k| (QREFELT $ 53))
                                              (LIST
                                               (SPADCALL (|spadConstant| $ 46)
                                                         |nak| (QREFELT $ 50))
                                               (SPADCALL (QVELT |pr| 0)
                                                         (QREFELT $ 131)))
                                              (QREFELT $ 132))
                                    . #16#)
                              (LETT |rv_lst|
                                    (CONS
                                     (SPADCALL (QVELT |pr| 1) |nk|
                                               (QREFELT $ 50))
                                     |rv_lst|)
                                    . #16#)
                              (EXIT
                               (LETT |ir_lst|
                                     (CONS
                                      (SPADCALL |ec|
                                                (SPADCALL |k| (QREFELT $ 52))
                                                (QREFELT $ 50))
                                      |ir_lst|)
                                     . #16#))))
                            ('T
                             (SEQ
                              (LETT |rv_lst|
                                    (CONS
                                     (SPADCALL (QVELT |pr| 1) |nk|
                                               (QREFELT $ 118))
                                     |rv_lst|)
                                    . #16#)
                              (EXIT
                               (LETT |ir_lst|
                                     (CONS
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 52))
                                                (SPADCALL (QVELT |pr| 1)
                                                          |nr_lst| |ir_lst|
                                                          (QREFELT $ 72))
                                                (QREFELT $ 50))
                                      |ir_lst|)
                                     . #16#)))))
                           (EXIT
                            (LETT |nr_lst|
                                  (CONS (SPADCALL |nk| (QREFELT $ 133))
                                        |nr_lst|)
                                  . #16#)))))))
                  (LETT #11# (CDR #11#) . #16#) (GO G190) G191 (EXIT NIL))
             (LETT |g|
                   (SPADCALL (QVELT |rec| 0) |r_lst| |rv_lst| (QREFELT $ 106))
                   . #16#)
             (LETT |tg0| (SPADCALL |g| (QREFELT $ 79)) . #16#)
             (LETT |tg|
                   (PROGN
                    (LETT #8# NIL . #16#)
                    (SEQ (LETT |k| NIL . #16#) (LETT #7# |tg0| . #16#) G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |k| (CAR #7#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |x|
                                       (SPADCALL (SPADCALL |k| (QREFELT $ 52))
                                                 (QREFELT $ 135))
                                       (QREFELT $ 136))
                             (LETT #8# (CONS |k| #8#) . #16#)))))
                         (LETT #7# (CDR #7#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   . #16#)
             (LETT |ltg0|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!2| $) |tg0|
                             (QREFELT $ 113))
                   . #16#)
             (LETT |ltg|
                   (SPADCALL (CONS #'|FSINT;integrate;FSU;15!3| $) |tg|
                             (QREFELT $ 113))
                   . #16#)
             (LETT |rtg|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!4|
                          (VECTOR (QREFELT $ 8) $))
                    |tg| (QREFELT $ 114))
                   . #16#)
             (LETT |el|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!5|
                          (VECTOR (QREFELT $ 10) $))
                    |tg| (QREFELT $ 114))
                   . #16#)
             (COND
              ((|FSINT;goComplex?| |rtg| |tg| |ltg| $)
               (SEQ (LETT |ralg| (|FSINT;inv_alg_lst| |tg0| $) . #16#)
                    (LETT |gg0| (SPADCALL |g| (QREFELT $ 22)) . #16#)
                    (LETT |tgg0| (SPADCALL |gg0| (QREFELT $ 137)) . #16#)
                    (LETT |tgg1|
                          (PROGN
                           (LETT #5# NIL . #16#)
                           (SEQ (LETT |k| NIL . #16#) (LETT #4# |tgg0| . #16#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |k| (CAR #4#) . #16#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT $ 92)) NIL
                                          (QREFELT $ 138))
                                         #5#)
                                        . #16#)))
                                (LETT #4# (CDR #4#) . #16#) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          . #16#)
                    (LETT |rtg1| (|FSINT;inv_lst| |tgg0| |tgg1| $) . #16#)
                    (LETT |gg| (SPADCALL |gg0| |tgg0| |tgg1| (QREFELT $ 139))
                          . #16#)
                    (LETT |i|
                          (SPADCALL
                           (CONS #'|FSINT;integrate;FSU;15!6|
                                 (VECTOR $ |ralg| |rtg1|))
                           (SPADCALL |gg| |x| (QREFELT $ 142)) (QREFELT $ 145))
                          . #16#)
                    (EXIT
                     (LETT |i|
                           (SPADCALL |i|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| $ 46)
                                                 (QREFELT $ 98))
                                       (QREFELT $ 99))
                                      (QREFELT $ 133))
                                     (QREFELT $ 147))
                           . #16#))))
              (#17='T (LETT |i| (SPADCALL |g| |x| (QREFELT $ 149)) . #16#)))
             (LETT |i|
                   (SPADCALL
                    (CONS #'|FSINT;integrate;FSU;15!7|
                          (VECTOR $ |ir_lst| |nr_lst|))
                    |i| (QREFELT $ 152))
                   . #16#)
             (LETT |ltg0| (SPADCALL |ltg0| |ltf| (QREFELT $ 153)) . #16#)
             (LETT |rl|
                   (PROGN
                    (LETT #2# NIL . #16#)
                    (SEQ (LETT |h| NIL . #16#)
                         (LETT #1#
                               (|FSINT;rinteg| |i| |f| |x|
                                (COND (|el| |ht|) (#17# NIL)) $)
                               . #16#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |h| (CAR #1#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (|FSINT;postSubst| |h| |tf1| (QVELT |rec| 2)
                                   (QVELT |rec| 1) |ltg0| |ekers| |evals| |x|
                                   $)
                                  #2#)
                                 . #16#)))
                         (LETT #1# (CDR #1#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #16#)
             (EXIT
              (COND ((NULL (CDR |rl|)) (CONS 0 (|SPADfirst| |rl|)))
                    (#17# (CONS 1 |rl|)))))))))) 

(SDEFUN |FSINT;integrate;FSU;15!7| ((|ii| NIL) ($$ NIL))
        (PROG (|nr_lst| |ir_lst| $)
          (LETT |nr_lst| (QREFELT $$ 2) . #1=(|FSINT;integrate;FSU;15|))
          (LETT |ir_lst| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |ii| |nr_lst| |ir_lst| (QREFELT $ 72)))))) 

(SDEFUN |FSINT;integrate;FSU;15!6| ((|fg| NIL) ($$ NIL))
        (PROG (|rtg1| |ralg| $)
          (LETT |rtg1| (QREFELT $$ 2) . #1=(|FSINT;integrate;FSU;15|))
          (LETT |ralg| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FSINT;to_real| |fg| |rtg1| |ralg| $))))) 

(SDEFUN |FSINT;integrate;FSU;15!5| ((|x1| NIL) ($$ NIL))
        (PROG ($ ELEM)
          (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;15|))
          (LETT ELEM (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) ELEM (QREFELT $ 63)))))) 

(SDEFUN |FSINT;integrate;FSU;15!4| ((|x1| NIL) ($$ NIL))
        (PROG ($ RTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;15|))
          (LETT RTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) RTRIG (QREFELT $ 63)))))) 

(SDEFUN |FSINT;integrate;FSU;15!3| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) '|tan| (QREFELT $ 29))) 

(SDEFUN |FSINT;integrate;FSU;15!2| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) '|tan| (QREFELT $ 29))) 

(SDEFUN |FSINT;integrate;FSU;15!1| ((|x1| NIL) ($$ NIL))
        (PROG ($ HTRIG)
          (LETT $ (QREFELT $$ 1) . #1=(|FSINT;integrate;FSU;15|))
          (LETT HTRIG (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) HTRIG (QREFELT $ 63)))))) 

(SDEFUN |FSINT;integrate;FSU;15!0| ((|x1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |x1| (QREFELT $ 53)) '|tan| (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |FunctionSpaceIntegration;|)) 

(DEFUN |FunctionSpaceIntegration| (&REST #1=#:G925)
  (SPROG NIL
         (PROG (#2=#:G926)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceIntegration|)
                                               '|domainEqualList|)
                    . #3=(|FunctionSpaceIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionSpaceIntegration|)))))))))) 

(DEFUN |FunctionSpaceIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpaceIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpaceIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 156) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|rtrig|)
          (QSETREFV $ 9 '|htrig|)
          (QSETREFV $ 10 '|elem|)
          (QSETREFV $ 11 '|%alg|)
          (QSETREFV $ 16 (SPADCALL '|%temptan| 1 (QREFELT $ 15)))
          $))) 

(MAKEPROP '|FunctionSpaceIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              'HTRIG 'ELEM 'ALGOP (|Symbol|) (|NonNegativeInteger|)
              (|BasicOperator|) (0 . |operator|) '|optemp| (|List| 7)
              (|Kernel| 7) (6 . |argument|) (|Expression| 85)
              (|InnerTrigonometricManipulations| 6 7 20) (11 . F2FG)
              (16 . |tan|) (|Kernel| $) (21 . |retract|) (26 . |height|)
              (31 . |kernel|) (|Boolean|) (38 . |is?|) (|List| 14)
              (44 . |operators|) (|Mapping| 28 14) (49 . |any?|)
              (|IntegrationTools| 6 7) (55 . |mkPrim|)
              (|TranscendentalManipulations| 6 7) (61 . |htrigs|)
              (|IntegrationResult| 7) (66 . |elem?|) (71 . |integral|)
              (|IntegrationResultToFunction| 6 7) (77 . |expand|)
              (|PositiveInteger|) (82 . *) (88 . |One|) (92 . |One|)
              (96 . |cos|) (101 . -) (107 . +) (113 . /) (119 . |sin|)
              (124 . |coerce|) (129 . |operator|) (134 . ~=)
              (|ElementaryFunctionStructurePackage| 6 7) (140 . |normalize|)
              (145 . |Zero|) (149 . =) (|TrigonometricManipulations| 6 7)
              (155 . |real|) (|Union| 24 '"failed") (160 . |retractIfCan|)
              (165 . |has?|) (|SparseUnivariatePolynomial| $) (171 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6 129 7)
              (176 . |univariate|) (183 . |elt|) (|List| 24) (|List| $)
              (189 . |eval|) (196 . |is?|) (202 . |kernels|) (|Integer|)
              (|List| 18) (207 . |elt|) (213 . |member?|) (219 . |tower|)
              (|Mapping| $ $) (224 . |eval|) (232 . |removeSinSq|)
              (237 . |removeConstantTerm|) (243 . |Zero|) (|Complex| 6)
              (247 . |complex|) (|Kernel| 20) (253 . |is?|) (259 . *) (265 . *)
              (271 . -) (276 . |coerce|) (281 . |One|) (285 . +) (291 . -)
              (297 . /) (303 . |retractIfCan|) (308 . -) (313 . |sqrt|)
              (318 . |kernels|) (|List| 87) (323 . |elt|) (329 . =)
              (335 . FG2F) (340 . |subst|) (347 . |subst|)
              (|FunctionSpaceComplexIntegration| 6 7)
              (354 . |complexIntegrate|) (360 . |real?|) (365 . |coerce|)
              (370 . |distribute|) (|Mapping| 28 18) (376 . |select|)
              (382 . |any?|) (388 . |realLiouvillian|) (394 . ~=)
              (400 . |name|) (405 . *)
              (|Record| (|:| |func| 7) (|:| |kers| 76) (|:| |vals| 17))
              (411 . |rischNormalize|) (417 . |elt|) (423 . |retract|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 18) 18 6 129 7)
              (428 . |froot|) (|SparseMultivariatePolynomial| 6 24)
              (434 . |numer|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 18) (439 . |retractIfCan|)
              (444 . |coerce|) (449 . |kernel|) (455 . |retract|) (|List| 12)
              (460 . |variables|) (465 . |member?|) (471 . |tower|)
              (476 . |trigs2explogs|) (482 . |eval|) (|IntegrationResult| 20)
              (|ElementaryIntegration| 85 20) (489 . |lfintegrate|)
              (|Mapping| 7 20) (|IntegrationResultFunctions2| 20 7)
              (495 . |map|) (|GenusZeroIntegration| 6 7 7)
              (501 . |rationalize_ir|) (|ElementaryIntegration| 6 7)
              (507 . |lfintegrate|) (|Mapping| 7 7)
              (|IntegrationResultFunctions2| 7 7) (513 . |map|)
              (519 . |setDifference|) (|Union| 7 17) |FSINT;integrate;FSU;15|)
           '#(|integrate| 525) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 155
                                                 '(2 14 0 12 13 15 1 18 17 0 19
                                                   1 21 20 7 22 1 20 0 0 23 1
                                                   20 24 0 25 1 18 13 0 26 3 18
                                                   0 14 17 13 27 2 14 28 0 12
                                                   29 1 7 30 0 31 2 30 28 32 0
                                                   33 2 34 7 7 12 35 1 36 7 7
                                                   37 1 38 28 0 39 2 7 0 0 12
                                                   40 1 41 17 38 42 2 7 0 43 0
                                                   44 0 6 0 45 0 7 0 46 1 7 0 0
                                                   47 2 7 0 0 0 48 2 7 0 0 0 49
                                                   2 7 0 0 0 50 1 7 0 0 51 1 7
                                                   0 24 52 1 18 14 0 53 2 13 28
                                                   0 0 54 1 55 7 7 56 0 7 0 57
                                                   2 7 28 0 0 58 1 59 7 7 60 1
                                                   7 61 0 62 2 14 28 0 12 63 1
                                                   7 64 24 65 3 67 66 7 18 66
                                                   68 2 66 7 0 7 69 3 7 0 0 70
                                                   71 72 2 18 28 0 12 73 1 7 70
                                                   0 74 2 76 18 0 75 77 2 76 28
                                                   18 0 78 1 7 70 0 79 4 7 0 0
                                                   12 13 80 81 1 36 7 7 82 2 34
                                                   7 7 12 83 0 6 0 84 2 85 0 6
                                                   6 86 2 87 28 0 12 88 2 85 0
                                                   43 0 89 2 20 0 85 0 90 1 20
                                                   0 0 91 1 20 0 24 92 0 20 0
                                                   93 2 20 0 0 0 94 2 20 0 0 0
                                                   95 2 20 0 0 0 96 1 20 61 0
                                                   97 1 7 0 0 98 1 7 0 0 99 1
                                                   20 70 0 100 2 101 87 0 75
                                                   102 2 20 28 0 0 103 1 21 7
                                                   20 104 3 20 0 0 70 71 105 3
                                                   7 0 0 70 71 106 2 107 7 7 12
                                                   108 1 59 28 7 109 1 7 0 12
                                                   110 2 7 0 0 0 111 2 76 0 112
                                                   0 113 2 76 28 112 0 114 2 55
                                                   7 7 12 115 2 7 28 0 0 116 1
                                                   14 12 0 117 2 7 0 0 0 118 2
                                                   55 119 7 12 120 2 17 7 0 75
                                                   121 1 7 75 0 122 2 124 123 7
                                                   13 125 1 7 126 0 127 1 129
                                                   128 0 130 1 7 0 75 131 2 7 0
                                                   14 71 132 1 7 24 0 133 1 7
                                                   134 0 135 2 134 28 12 0 136
                                                   1 20 70 0 137 2 21 20 20 101
                                                   138 3 20 0 0 70 71 139 2 141
                                                   140 20 12 142 2 144 38 143
                                                   140 145 2 146 38 38 18 147 2
                                                   148 38 7 12 149 2 151 38 150
                                                   38 152 2 76 0 0 0 153 2 0
                                                   154 7 12 155)))))
           '|lookupComplete|)) 
