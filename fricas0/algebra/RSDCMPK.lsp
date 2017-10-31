
(SDEFUN |RSDCMPK;KrullNumber;LLNni;1|
        ((|lp| |List| P) (|lts| |List| TS) ($ |NonNegativeInteger|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ln| (|List| (|NonNegativeInteger|)))
          (#1=#:G751 NIL) (|ts| NIL) (#2=#:G750 NIL))
         (SEQ
          (LETT |ln|
                (PROGN
                 (LETT #2# NIL . #3=(|RSDCMPK;KrullNumber;LLNni;1|))
                 (SEQ (LETT |ts| NIL . #3#) (LETT #1# |lts| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ts| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |ts| (QREFELT $ 12)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (LETT |n|
                 (+ (LENGTH |lp|) (SPADCALL (ELT $ 13) |ln| (QREFELT $ 16)))
                 . #3#))))) 

(SDEFUN |RSDCMPK;numberOfVariables;LLNni;2|
        ((|lp| |List| P) (|lts| |List| TS) ($ |NonNegativeInteger|))
        (SPROG ((|lv| (|List| V)) (#1=#:G763 NIL) (|ts| NIL))
               (SEQ
                (LETT |lv|
                      (SPADCALL (SPADCALL |lp| (QREFELT $ 21)) (QREFELT $ 23))
                      . #2=(|RSDCMPK;numberOfVariables;LLNni;2|))
                (SEQ (LETT |ts| NIL . #2#) (LETT #1# |lts| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ts| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |lv|
                             (SPADCALL (SPADCALL |ts| (QREFELT $ 24)) |lv|
                                       (QREFELT $ 25))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (LENGTH (SPADCALL |lv| (QREFELT $ 26))))))) 

(SDEFUN |RSDCMPK;algebraicDecompose;PTSBR;3|
        ((|p| P) (|ts| TS) (|clos?| |Boolean|)
         ($ |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))))
        (SPROG
         ((|llpwt| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (#1=#:G788 NIL) (|vs| NIL) (#2=#:G787 NIL) (|f| NIL)
          (|lus| (|List| TS)) (|lsfp| (|List| P)) (|b| (|Boolean|)) (|h| (P))
          (|lts| (|List| TS)) (|us| (TS)) (|g| (P)) (#3=#:G786 NIL) (|gwt| NIL)
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|ts_v| (P)) (#4=#:G766 NIL) (|ts_v+| (TS)) (|ts_v-| (TS))
          (|n| (|NonNegativeInteger|)) (|v| (V)))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT $ 29))
            (|error| " in algebraicDecompose$REGSET: should never happen !"))
           (#5='T
            (SEQ
             (LETT |v| (SPADCALL |p| (QREFELT $ 30))
                   . #6=(|RSDCMPK;algebraicDecompose;PTSBR;3|))
             (LETT |n| (SPADCALL |ts| (QREFELT $ 12)) . #6#)
             (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 31)) . #6#)
             (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 32)) . #6#)
             (LETT |ts_v|
                   (PROG2 (LETT #4# (SPADCALL |ts| |v| (QREFELT $ 34)) . #6#)
                       (QCDR #4#)
                     (|check_union2| (QEQCAR #4# 0) (QREFELT $ 9)
                                     (|Union| (QREFELT $ 9) "failed") #4#))
                   . #6#)
             (COND
              ((< (SPADCALL |p| (QREFELT $ 35))
                  (SPADCALL |ts_v| (QREFELT $ 35)))
               (LETT |lgwt| (SPADCALL |ts_v| |p| |ts_v-| 'T NIL (QREFELT $ 39))
                     . #6#))
              (#5#
               (LETT |lgwt| (SPADCALL |p| |ts_v| |ts_v-| 'T NIL (QREFELT $ 39))
                     . #6#)))
             (LETT |lts| NIL . #6#) (LETT |llpwt| NIL . #6#)
             (SEQ (LETT |gwt| NIL . #6#) (LETT #3# |lgwt| . #6#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |gwt| (CAR #3#) . #6#) NIL))
                    (GO G191)))
                  (SEQ (LETT |g| (QCAR |gwt|) . #6#)
                       (LETT |us| (QCDR |gwt|) . #6#)
                       (EXIT
                        (COND
                         ((SPADCALL |g| (QREFELT $ 40))
                          (|error|
                           " in algebraicDecompose$REGSET: should never happen !!"))
                         ((SPADCALL |g| (QREFELT $ 29)) "leave")
                         ('T
                          (SEQ
                           (COND
                            ((SPADCALL (SPADCALL |g| (QREFELT $ 30)) |v|
                                       (QREFELT $ 41))
                             (LETT |lts|
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |ts_v+| (QREFELT $ 42))
                                              (SPADCALL |g| |us|
                                                        (QREFELT $ 44))
                                              (QREFELT $ 45))
                                    |lts| (QREFELT $ 46))
                                   . #6#)))
                           (LETT |h| (SPADCALL |g| |v| (QREFELT $ 47)) . #6#)
                           (LETT |b| (SPADCALL |us| (QREFELT $ 48)) . #6#)
                           (LETT |lsfp| (SPADCALL |h| (QREFELT $ 50)) . #6#)
                           (LETT |lus|
                                 (SPADCALL (SPADCALL |ts_v+| (QREFELT $ 42))
                                           (SPADCALL |ts_v| |us|
                                                     (QREFELT $ 44))
                                           (QREFELT $ 45))
                                 . #6#)
                           (EXIT
                            (SEQ (LETT |f| NIL . #6#) (LETT #2# |lsfp| . #6#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |f| (CAR #2#) . #6#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |f| (QREFELT $ 29)) "leave")
                                    ('T
                                     (SEQ
                                      (COND
                                       (|b|
                                        (COND
                                         ((SPADCALL |f| |us| (QREFELT $ 51))
                                          (EXIT "leave")))))
                                      (EXIT
                                       (SEQ (LETT |vs| NIL . #6#)
                                            (LETT #1# |lus| . #6#) G190
                                            (COND
                                             ((OR (ATOM #1#)
                                                  (PROGN
                                                   (LETT |vs| (CAR #1#) . #6#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |llpwt|
                                                    (CONS
                                                     (CONS (LIST |f| |p|) |vs|)
                                                     |llpwt|)
                                                    . #6#)))
                                            (LETT #1# (CDR #1#) . #6#)
                                            (GO G190) G191 (EXIT NIL))))))))
                                 (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                                 (EXIT NIL))))))))
                  (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
             (EXIT (CONS |lts| |llpwt|)))))))) 

(SDEFUN |RSDCMPK;transcendentalDecompose;PTSNniR;4|
        ((|p| P) (|ts| TS) (|bound| |NonNegativeInteger|)
         ($ |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))))
        (SPROG
         ((|llpwt| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|lts| (|List| TS)))
         (SEQ
          (COND
           ((< (SPADCALL |ts| (QREFELT $ 12)) |bound|)
            (LETT |lts| (SPADCALL |p| |ts| (QREFELT $ 44))
                  . #1=(|RSDCMPK;transcendentalDecompose;PTSNniR;4|)))
           ('T (LETT |lts| NIL . #1#)))
          (LETT |llpwt| NIL . #1#) (EXIT (CONS |lts| |llpwt|))))) 

(SDEFUN |RSDCMPK;transcendentalDecompose;PTSR;5|
        ((|p| P) (|ts| TS)
         ($ |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))))
        (SPROG
         ((|llpwt| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|lts| (|List| TS)))
         (SEQ
          (LETT |lts| (SPADCALL |p| |ts| (QREFELT $ 44))
                . #1=(|RSDCMPK;transcendentalDecompose;PTSR;5|))
          (LETT |llpwt| NIL . #1#) (EXIT (CONS |lts| |llpwt|))))) 

(SDEFUN |RSDCMPK;internalDecompose;PTSNniBR;6|
        ((|p| P) (|ts| TS) (|bound| |NonNegativeInteger|) (|clos?| |Boolean|)
         ($ |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))))
        (COND (|clos?| (SPADCALL |p| |ts| |bound| (QREFELT $ 57)))
              ('T (SPADCALL |p| |ts| (QREFELT $ 58))))) 

(SDEFUN |RSDCMPK;internalDecompose;PTSNniR;7|
        ((|p| P) (|ts| TS) (|bound| |NonNegativeInteger|)
         ($ |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))))
        (SPROG
         ((|llpwt| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|lts| (|List| TS)) (|riv| (P))
          (|rsl|
           (|Record| (|:| |done| (|List| TS))
                     (|:| |todo|
                          (|List|
                           (|Record| (|:| |val| (|List| P))
                                     (|:| |tower| TS))))))
          (#1=#:G823 NIL) (|bwt| NIL)
          (|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|tp| (P)) (|ip| (P)) (#2=#:G803 NIL) (|lmp| (P)))
         (SEQ (LETT |llpwt| NIL . #3=(|RSDCMPK;internalDecompose;PTSNniR;7|))
              (LETT |lts| NIL . #3#)
              (COND
               ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 60)) (QREFELT $ 40)))
                (COND
                 ((NULL
                   (SPADCALL (LETT |lmp| (SPADCALL |p| (QREFELT $ 61)) . #3#)
                             (QREFELT $ 29)))
                  (SEQ
                   (LETT |llpwt|
                         (CONS
                          (CONS
                           (LIST
                            (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                      (QREFELT $ 62)))
                           |ts|)
                          |llpwt|)
                         . #3#)
                   (EXIT
                    (LETT |p|
                          (PROG2
                              (LETT #2# (SPADCALL |p| |lmp| (QREFELT $ 64))
                                    . #3#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) "failed")
                                            #2#))
                          . #3#)))))))
              (LETT |ip|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 65)) (QREFELT $ 66))
                    . #3#)
              (LETT |tp| (SPADCALL |p| (QREFELT $ 60)) . #3#)
              (LETT |p| (SPADCALL |p| (QREFELT $ 67)) . #3#)
              (LETT |lbwt| (SPADCALL |ip| |ts| (QREFELT $ 70)) . #3#)
              (SEQ (LETT |bwt| NIL . #3#) (LETT #1# |lbwt| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |bwt| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QCAR |bwt|)
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QCDR |bwt|)
                                    (QREFELT $ 71))
                          (LETT |rsl|
                                (SPADCALL |p| (QCDR |bwt|) 'T (QREFELT $ 54))
                                . #3#))
                         ('T
                          (LETT |rsl|
                                (SPADCALL |p| (QCDR |bwt|) |bound|
                                          (QREFELT $ 55))
                                . #3#)))
                        (LETT |lts|
                              (SPADCALL (QCAR |rsl|) |lts| (QREFELT $ 46))
                              . #3#)
                        (LETT |llpwt|
                              (SPADCALL (QCDR |rsl|) |llpwt| (QREFELT $ 73))
                              . #3#)
                        (COND
                         ((SPADCALL |ip| (QCDR |bwt|) (QREFELT $ 51))
                          (COND
                           ((SPADCALL (QCDR |bwt|) (QREFELT $ 48))
                            (EXIT "leave")))))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |ip| (QREFELT $ 29)))
                           (COND
                            ((SPADCALL |tp| (QREFELT $ 40))
                             (LETT |llpwt|
                                   (CONS (CONS (LIST |ip|) (QCDR |bwt|))
                                         |llpwt|)
                                   . #3#))
                            ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                             (LETT |llpwt|
                                   (CONS (CONS (LIST |ip| |tp|) (QCDR |bwt|))
                                         |llpwt|)
                                   . #3#))))))))
                      ('T
                       (SEQ
                        (LETT |riv| (SPADCALL |ip| (QCDR |bwt|) (QREFELT $ 74))
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |riv| (QREFELT $ 40))
                           (COND
                            ((SPADCALL |tp| (QREFELT $ 40))
                             (LETT |lts| (CONS (QCDR |bwt|) |lts|) . #3#))
                            ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                             (LETT |llpwt|
                                   (CONS (CONS (LIST |tp|) (QCDR |bwt|))
                                         |llpwt|)
                                   . #3#))))
                          ('T
                           (LETT |llpwt|
                                 (CONS
                                  (CONS
                                   (LIST
                                    (SPADCALL
                                     (SPADCALL |riv|
                                               (SPADCALL |p| (QREFELT $ 75))
                                               (QREFELT $ 76))
                                     |tp| (QREFELT $ 77)))
                                   (QCDR |bwt|))
                                  |llpwt|)
                                 . #3#)))))))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |lts| |llpwt|))))) 

(SDEFUN |RSDCMPK;internalDecompose;PTSR;8|
        ((|p| P) (|ts| TS)
         ($ |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))))
        (SPROG
         ((|llpwt| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|lts| (|List| TS)) (|riv| (P))
          (|rsl|
           (|Record| (|:| |done| (|List| TS))
                     (|:| |todo|
                          (|List|
                           (|Record| (|:| |val| (|List| P))
                                     (|:| |tower| TS))))))
          (#1=#:G846 NIL) (|bwt| NIL)
          (|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|tp| (P)) (|ip| (P)) (#2=#:G827 NIL) (|lmp| (P)))
         (SEQ (LETT |llpwt| NIL . #3=(|RSDCMPK;internalDecompose;PTSR;8|))
              (LETT |lts| NIL . #3#)
              (COND
               ((NULL (SPADCALL (SPADCALL |p| (QREFELT $ 60)) (QREFELT $ 40)))
                (COND
                 ((NULL
                   (SPADCALL (LETT |lmp| (SPADCALL |p| (QREFELT $ 61)) . #3#)
                             (QREFELT $ 29)))
                  (SEQ
                   (LETT |llpwt|
                         (CONS
                          (CONS
                           (LIST
                            (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                      (QREFELT $ 62)))
                           |ts|)
                          |llpwt|)
                         . #3#)
                   (EXIT
                    (LETT |p|
                          (PROG2
                              (LETT #2# (SPADCALL |p| |lmp| (QREFELT $ 64))
                                    . #3#)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) "failed")
                                            #2#))
                          . #3#)))))))
              (LETT |ip|
                    (SPADCALL (SPADCALL |p| (QREFELT $ 65)) (QREFELT $ 66))
                    . #3#)
              (LETT |tp| (SPADCALL |p| (QREFELT $ 60)) . #3#)
              (LETT |p| (SPADCALL |p| (QREFELT $ 67)) . #3#)
              (LETT |lbwt| (SPADCALL |ip| |ts| (QREFELT $ 70)) . #3#)
              (SEQ (LETT |bwt| NIL . #3#) (LETT #1# |lbwt| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |bwt| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QCAR |bwt|)
                       (SEQ
                        (COND
                         ((SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QCDR |bwt|)
                                    (QREFELT $ 71))
                          (LETT |rsl|
                                (SPADCALL |p| (QCDR |bwt|) NIL (QREFELT $ 54))
                                . #3#))
                         ('T
                          (LETT |rsl|
                                (SPADCALL |p| (QCDR |bwt|) (QREFELT $ 56))
                                . #3#)))
                        (LETT |lts|
                              (SPADCALL (QCAR |rsl|) |lts| (QREFELT $ 46))
                              . #3#)
                        (LETT |llpwt|
                              (SPADCALL (QCDR |rsl|) |llpwt| (QREFELT $ 73))
                              . #3#)
                        (COND
                         ((SPADCALL |ip| (QCDR |bwt|) (QREFELT $ 51))
                          (COND
                           ((SPADCALL (QCDR |bwt|) (QREFELT $ 48))
                            (EXIT "leave")))))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |ip| (QREFELT $ 29)))
                           (COND
                            ((SPADCALL |tp| (QREFELT $ 40))
                             (LETT |llpwt|
                                   (CONS (CONS (LIST |ip|) (QCDR |bwt|))
                                         |llpwt|)
                                   . #3#))
                            ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                             (LETT |llpwt|
                                   (CONS (CONS (LIST |ip| |tp|) (QCDR |bwt|))
                                         |llpwt|)
                                   . #3#))))))))
                      ('T
                       (SEQ
                        (LETT |riv| (SPADCALL |ip| (QCDR |bwt|) (QREFELT $ 74))
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |riv| (QREFELT $ 40))
                           (COND
                            ((SPADCALL |tp| (QREFELT $ 40))
                             (LETT |lts| (CONS (QCDR |bwt|) |lts|) . #3#))
                            ((NULL (SPADCALL |tp| (QREFELT $ 29)))
                             (LETT |llpwt|
                                   (CONS (CONS (LIST |tp|) (QCDR |bwt|))
                                         |llpwt|)
                                   . #3#))))
                          ('T
                           (LETT |llpwt|
                                 (CONS
                                  (CONS
                                   (LIST
                                    (SPADCALL
                                     (SPADCALL |riv|
                                               (SPADCALL |p| (QREFELT $ 75))
                                               (QREFELT $ 76))
                                     |tp| (QREFELT $ 77)))
                                   (QCDR |bwt|))
                                  |llpwt|)
                                 . #3#)))))))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |lts| |llpwt|))))) 

(SDEFUN |RSDCMPK;decompose;LL2BL;9|
        ((|lp| |List| P) (|lts| |List| TS) (|clos?| |Boolean|)
         (|info?| |Boolean|) ($ |List| TS))
        (SPADCALL |lp| |lts| NIL NIL |clos?| 'T |info?| (QREFELT $ 78))) 

(SDEFUN |RSDCMPK;convert;RS;10|
        ((|lpwt| |Record| (|:| |val| (|List| P)) (|:| |tower| TS))
         ($ |String|))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ
                (LETT |ls|
                      (LIST "<" (STRINGIMAGE (LENGTH (QCAR |lpwt|))) ","
                            (STRINGIMAGE
                             (SPADCALL (QCDR |lpwt|) (QREFELT $ 12)))
                            ">")
                      |RSDCMPK;convert;RS;10|)
                (EXIT (SPADCALL |ls| (QREFELT $ 81)))))) 

(SDEFUN |RSDCMPK;printInfo;LNniV;11|
        ((|toSee| |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         (|n| |NonNegativeInteger|) ($ |Void|))
        (SPROG
         ((|s| (|String|)) (|m| (|NonNegativeInteger|)) (#1=#:G858 NIL)
          (|lpwt| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
         (SEQ
          (LETT |lpwt| (|SPADfirst| |toSee|)
                . #2=(|RSDCMPK;printInfo;LNniV;11|))
          (LETT |s|
                (SPADCALL
                 (LIST "[" (STRINGIMAGE (LENGTH |toSee|)) " "
                       (SPADCALL |lpwt| (QREFELT $ 82)))
                 (QREFELT $ 81))
                . #2#)
          (LETT |m| (LENGTH (QCAR |lpwt|)) . #2#)
          (LETT |toSee| (CDR |toSee|) . #2#)
          (SEQ (LETT |lpwt| NIL . #2#) (LETT #1# |toSee| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |lpwt| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |m| (+ |m| (LENGTH (QCAR |lpwt|))) . #2#)
                    (EXIT
                     (LETT |s|
                           (SPADCALL
                            (LIST |s| "," (SPADCALL |lpwt| (QREFELT $ 82)))
                            (QREFELT $ 81))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |s|
                (SPADCALL
                 (LIST |s| " -> |" (STRINGIMAGE |m|) "|; {" (STRINGIMAGE |n|)
                       "}]")
                 (QREFELT $ 81))
                . #2#)
          (SPADCALL |s| (QREFELT $ 85)) (EXIT (SPADCALL (QREFELT $ 86)))))) 

(SDEFUN |RSDCMPK;decompose;LL5BL;12|
        ((|lp| |List| P) (|lts| |List| TS) (|cleanW?| |Boolean|)
         (|sqfr?| |Boolean|) (|clos?| |Boolean|) (|rem?| |Boolean|)
         (|info?| |Boolean|) ($ |List| TS))
        (SPROG
         ((|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|rsl|
           (|Record| (|:| |done| (|List| TS))
                     (|:| |todo|
                          (|List|
                           (|Record| (|:| |val| (|List| P))
                                     (|:| |tower| TS))))))
          (|p| (P)) (|toSave| (|List| TS)) (|ts| (TS))
          (|lpwt| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (|bound| (|NonNegativeInteger|)) (#1=#:G877 NIL) (|br| NIL)
          (#2=#:G876 NIL)
          (|branches|
           (|List|
            (|Record| (|:| |eq| (|List| P)) (|:| |tower| TS)
                      (|:| |ineq| (|List| P))))))
         (SEQ
          (COND ((NULL |lp|) |lts|)
                (#3='T
                 (SEQ
                  (LETT |branches|
                        (SPADCALL |lp| |lts| |cleanW?| |sqfr?| (QREFELT $ 91))
                        . #4=(|RSDCMPK;decompose;LL5BL;12|))
                  (EXIT
                   (COND ((NULL |branches|) NIL)
                         (#3#
                          (SEQ
                           (LETT |toSee|
                                 (PROGN
                                  (LETT #2# NIL . #4#)
                                  (SEQ (LETT |br| NIL . #4#)
                                       (LETT #1# |branches| . #4#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |br| (CAR #1#) . #4#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS (QVELT |br| 0)
                                                      (QVELT |br| 1))
                                                #2#)
                                               . #4#)))
                                       (LETT #1# (CDR #1#) . #4#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 . #4#)
                           (LETT |toSave| NIL . #4#)
                           (COND
                            (|clos?|
                             (LETT |bound| (SPADCALL |lp| |lts| (QREFELT $ 19))
                                   . #4#))
                            (#3#
                             (LETT |bound| (SPADCALL |lp| |lts| (QREFELT $ 27))
                                   . #4#)))
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                                (SEQ
                                 (COND
                                  (|info?|
                                   (SPADCALL |toSee| (LENGTH |toSave|)
                                             (QREFELT $ 87))))
                                 (LETT |lpwt| (|SPADfirst| |toSee|) . #4#)
                                 (LETT |toSee| (CDR |toSee|) . #4#)
                                 (LETT |lp| (QCAR |lpwt|) . #4#)
                                 (LETT |ts| (QCDR |lpwt|) . #4#)
                                 (EXIT
                                  (COND
                                   ((NULL |lp|)
                                    (LETT |toSave| (CONS |ts| |toSave|) . #4#))
                                   ('T
                                    (SEQ (LETT |p| (|SPADfirst| |lp|) . #4#)
                                         (LETT |lp| (CDR |lp|) . #4#)
                                         (COND
                                          (|rem?|
                                           (COND
                                            ((NULL
                                              (SPADCALL |p| (QREFELT $ 29)))
                                             (COND
                                              ((NULL
                                                (SPADCALL |ts| (QREFELT $ 92)))
                                               (LETT |p|
                                                     (QVELT
                                                      (SPADCALL |p| |ts|
                                                                (QREFELT $ 94))
                                                      1)
                                                     . #4#)))))))
                                         (LETT |p|
                                               (SPADCALL |p| |ts|
                                                         (QREFELT $ 74))
                                               . #4#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |p| (QREFELT $ 40))
                                            (LETT |toSee|
                                                  (CONS (CONS |lp| |ts|)
                                                        |toSee|)
                                                  . #4#))
                                           ((SPADCALL |p| (QREFELT $ 29))
                                            "leave")
                                           ('T
                                            (SEQ
                                             (LETT |rsl|
                                                   (SPADCALL |p| |ts| |bound|
                                                             |clos?|
                                                             (QREFELT $ 59))
                                                   . #4#)
                                             (EXIT
                                              (LETT |toSee|
                                                    (SPADCALL |lp| |toSave|
                                                              |toSee| |rsl|
                                                              |bound|
                                                              (QREFELT $ 95))
                                                    . #4#)))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (SPADCALL |toSave| (QREFELT $ 96))))))))))))) 

(SDEFUN |RSDCMPK;upDateBranches;LLLRNniL;13|
        ((|leq| |List| P) (|lts| |List| TS)
         (|current| |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         (|wip| |Record| (|:| |done| (|List| TS))
          (|:| |todo|
               (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))))
         (|n| |NonNegativeInteger|)
         ($ |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
        (SPROG
         ((|branches|
           (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|branches2|
           (|List| #1=(|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (#2=#:G897 NIL) (|us| (TS)) (|branches1| (|List| #1#))
          (|newleq| (|List| P)) (#3=#:G896 NIL) (|branch| NIL)
          (|newComponents| (|List| TS))
          (|newBranches|
           (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))))
         (SEQ
          (LETT |newBranches| (QCDR |wip|)
                . #4=(|RSDCMPK;upDateBranches;LLLRNniL;13|))
          (LETT |newComponents| (QCAR |wip|) . #4#)
          (LETT |branches1| NIL . #4#) (LETT |branches2| NIL . #4#)
          (SEQ (LETT |branch| NIL . #4#) (LETT #3# |newBranches| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |branch| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |us| (QCDR |branch|) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |us| (QREFELT $ 12)) |n|
                                 (QREFELT $ 97))
                       "leave")
                      ('T
                       (SEQ
                        (LETT |newleq|
                              (SPADCALL (ELT $ 99)
                                        (SPADCALL |leq| (QCAR |branch|)
                                                  (QREFELT $ 100))
                                        (QREFELT $ 102))
                              . #4#)
                        (EXIT
                         (LETT |branches1|
                               (CONS (CONS |newleq| |us|) |branches1|)
                               . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |us| NIL . #4#) (LETT #2# |newComponents| . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |us| (CAR #2#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((OR
                    (SPADCALL (SPADCALL |us| (QREFELT $ 12)) |n|
                              (QREFELT $ 97))
                    (SPADCALL |us| |lts| (QREFELT $ 103)))
                   "leave")
                  ('T
                   (LETT |branches2| (CONS (CONS |leq| |us|) |branches2|)
                         . #4#)))))
               (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |branches1|)
             (COND ((NULL |branches2|) |current|)
                   (#5='T (SPADCALL |branches2| |current| (QREFELT $ 73)))))
            (#5#
             (SEQ
              (LETT |branches|
                    (SPADCALL (LIST |branches2| |branches1| |current|)
                              (QREFELT $ 104))
                    . #4#)
              (EXIT (SPADCALL |branches| (QREFELT $ 105)))))))))) 

(DECLAIM (NOTINLINE |RegularSetDecompositionPackage;|)) 

(DEFUN |RegularSetDecompositionPackage| (&REST #1=#:G898)
  (SPROG NIL
         (PROG (#2=#:G899)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RegularSetDecompositionPackage|)
                                               '|domainEqualList|)
                    . #3=(|RegularSetDecompositionPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |RegularSetDecompositionPackage;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RegularSetDecompositionPackage|)))))))))) 

(DEFUN |RegularSetDecompositionPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|RegularSetDecompositionPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$|
          (LIST '|RegularSetDecompositionPackage| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #1#)
    (LETT $ (GETREFV 106) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|RegularSetDecompositionPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|RegularSetDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (0 . |#|) (5 . |max|) (|Mapping| 11 11 11)
              (|List| 11) (11 . |reduce|) (|List| 9) (|List| 10)
              |RSDCMPK;KrullNumber;LLNni;1| (|GeneralPolynomialSet| 6 7 8 9)
              (17 . |construct|) (|List| 8) (22 . |variables|)
              (27 . |variables|) (32 . |concat|) (38 . |removeDuplicates|)
              |RSDCMPK;numberOfVariables;LLNni;2| (|Boolean|) (43 . |ground?|)
              (48 . |mvar|) (53 . |collectUnder|) (59 . |collectUpper|)
              (|Union| 9 '"failed") (65 . |select|) (71 . |mdeg|)
              (|Record| (|:| |val| 9) (|:| |tower| 10)) (|List| 36)
              (|RegularTriangularSetGcdPackage| 6 7 8 9 10)
              (76 . |internalLastSubResultant|) (85 . |zero?|) (90 . =)
              (96 . |members|) (|List| $) (101 . |augment|) (107 . |augment|)
              (113 . |concat|) (119 . |leadingCoefficient|)
              (125 . |purelyAlgebraic?|)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (130 . |squareFreeFactors|) (135 . |purelyAlgebraic?|)
              (|Record| (|:| |val| 17) (|:| |tower| 10))
              (|Record| (|:| |done| 18) (|:| |todo| 72))
              |RSDCMPK;algebraicDecompose;PTSBR;3|
              |RSDCMPK;transcendentalDecompose;PTSNniR;4|
              |RSDCMPK;transcendentalDecompose;PTSR;5|
              |RSDCMPK;internalDecompose;PTSNniR;7|
              |RSDCMPK;internalDecompose;PTSR;8|
              |RSDCMPK;internalDecompose;PTSNniBR;6| (141 . |tail|)
              (146 . |leastMonomial|) (151 . |coerce|) (|Union| $ '"failed")
              (156 . |exquo|) (162 . |init|) (167 . |squareFreePart|)
              (172 . |mainPrimitivePart|)
              (|Record| (|:| |val| 28) (|:| |tower| $)) (|List| 68)
              (177 . |invertible?|) (183 . |algebraic?|) (|List| 52)
              (189 . |concat|) (195 . |removeZero|) (201 . |mainMonomial|)
              (206 . *) (212 . +) |RSDCMPK;decompose;LL5BL;12|
              |RSDCMPK;decompose;LL2BL;9| (|String|) (218 . |concat|)
              |RSDCMPK;convert;RS;10| (|Void|) (|InternalPrintPackage|)
              (223 . |iprint|) (228 . |void|) |RSDCMPK;printInfo;LNniV;11|
              (|Record| (|:| |eq| 17) (|:| |tower| 10) (|:| |ineq| 17))
              (|List| 88) (|QuasiComponentPackage| 6 7 8 9 10)
              (232 . |prepareDecompose|) (240 . |empty?|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (245 . |remainder|) |RSDCMPK;upDateBranches;LLLRNniL;13|
              (251 . |removeSuperfluousQuasiComponents|) (256 . >)
              (262 . |infRittWu?|) (268 . |infRittWu?|) (274 . |concat|)
              (|Mapping| 28 9 9) (280 . |sort|) (286 . |subQuasiComponent?|)
              (292 . |concat|) (297 . |removeSuperfluousCases|))
           '#(|upDateBranches| 302 |transcendentalDecompose| 311 |printInfo|
              324 |numberOfVariables| 330 |internalDecompose| 336 |decompose|
              357 |convert| 376 |algebraicDecompose| 381 |KrullNumber| 388)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 105
                                                 '(1 10 11 0 12 2 11 0 0 0 13 2
                                                   15 11 14 0 16 1 20 0 17 21 1
                                                   20 22 0 23 1 10 22 0 24 2 22
                                                   0 0 0 25 1 22 0 0 26 1 9 28
                                                   0 29 1 9 8 0 30 2 10 0 0 8
                                                   31 2 10 0 0 8 32 2 10 33 0 8
                                                   34 1 9 11 0 35 5 38 37 9 9
                                                   10 28 28 39 1 9 28 0 40 2 8
                                                   28 0 0 41 1 10 17 0 42 2 10
                                                   43 9 0 44 2 10 43 17 43 45 2
                                                   18 0 0 0 46 2 9 0 0 8 47 1
                                                   10 28 0 48 1 49 17 9 50 2 10
                                                   28 9 0 51 1 9 0 0 60 1 9 0 0
                                                   61 1 9 0 8 62 2 9 63 0 0 64
                                                   1 9 0 0 65 1 9 0 0 66 1 9 0
                                                   0 67 2 10 69 9 0 70 2 10 28
                                                   8 0 71 2 72 0 0 0 73 2 10 9
                                                   9 0 74 1 9 0 0 75 2 9 0 0 0
                                                   76 2 9 0 0 0 77 1 80 0 43 81
                                                   1 84 83 80 85 0 83 0 86 4 90
                                                   89 17 18 28 28 91 1 10 28 0
                                                   92 2 10 93 9 0 94 1 90 18 18
                                                   96 2 11 28 0 0 97 2 10 28 0
                                                   0 98 2 9 28 0 0 99 2 17 0 0
                                                   0 100 2 17 0 101 0 102 2 90
                                                   28 10 18 103 1 72 0 43 104 1
                                                   90 72 72 105 5 0 72 17 18 72
                                                   53 11 95 3 0 53 9 10 11 55 2
                                                   0 53 9 10 56 2 0 83 72 11 87
                                                   2 0 11 17 18 27 4 0 53 9 10
                                                   11 28 59 3 0 53 9 10 11 57 2
                                                   0 53 9 10 58 4 0 18 17 18 28
                                                   28 79 7 0 18 17 18 28 28 28
                                                   28 28 78 1 0 80 52 82 3 0 53
                                                   9 10 28 54 2 0 11 17 18
                                                   19)))))
           '|lookupComplete|)) 
