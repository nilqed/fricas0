
(SDEFUN |RSETGCD;startTableGcd!;3SV;1|
        ((|ok| |String|) (|ko| |String|) (|domainName| |String|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 15)) (SPADCALL |ok| |ko| (QREFELT $ 17))
             (SPADCALL |domainName| (QREFELT $ 18))
             (EXIT (SPADCALL (QREFELT $ 19))))) 

(SDEFUN |RSETGCD;stopTableGcd!;V;2| (($ |Void|))
        (SEQ (COND ((SPADCALL (QREFELT $ 22)) (SPADCALL (QREFELT $ 23))))
             (EXIT (SPADCALL (QREFELT $ 24))))) 

(SDEFUN |RSETGCD;startTableInvSet!;3SV;3|
        ((|ok| |String|) (|ko| |String|) (|domainName| |String|) ($ |Void|))
        (SEQ (SPADCALL (QREFELT $ 28)) (SPADCALL |ok| |ko| (QREFELT $ 29))
             (SPADCALL |domainName| (QREFELT $ 30))
             (EXIT (SPADCALL (QREFELT $ 19))))) 

(SDEFUN |RSETGCD;stopTableInvSet!;V;4| (($ |Void|))
        (SEQ (COND ((SPADCALL (QREFELT $ 32)) (SPADCALL (QREFELT $ 33))))
             (EXIT (SPADCALL (QREFELT $ 34))))) 

(SDEFUN |RSETGCD;toseInvertible?;PTSB;5| ((|p| P) (|ts| TS) ($ |Boolean|))
        (SPROG
         ((#1=#:G774 NIL) (#2=#:G776 NIL) (|g| (P)) (#3=#:G778 NIL) (|gwt| NIL)
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|ts_v-| (TS)) (|ts_v| (P)) (#4=#:G764 NIL) (#5=#:G775 NIL)
          (#6=#:G777 NIL) (|bwt| NIL)
          (|toCheck|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|v| (V)) (|q| (P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q|
                  (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36)) (QREFELT $ 37))
                  . #7=(|RSETGCD;toseInvertible?;PTSB;5|))
            (EXIT
             (COND ((SPADCALL |q| (QREFELT $ 38)) NIL)
                   ((SPADCALL |q| |ts| (QREFELT $ 39)) 'T)
                   ('T
                    (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #7#)
                         (COND
                          ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                           (EXIT
                            (SEQ
                             (LETT |toCheck| (SPADCALL |p| |ts| (QREFELT $ 44))
                                   . #7#)
                             (SEQ
                              (EXIT
                               (SEQ (LETT |bwt| NIL . #7#)
                                    (LETT #6# |toCheck| . #7#) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN
                                           (LETT |bwt| (CAR #6#) . #7#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|BooleanEquality| (QCAR |bwt|) NIL)
                                        (PROGN
                                         (LETT #5#
                                               (PROGN
                                                (LETT #2# NIL . #7#)
                                                (GO #8=#:G773))
                                               . #7#)
                                         (GO #9=#:G760))))))
                                    (LETT #6# (CDR #6#) . #7#) (GO G190) G191
                                    (EXIT NIL)))
                              #9# (EXIT #5#))
                             (EXIT (PROGN (LETT #2# 'T . #7#) (GO #8#)))))))
                         (LETT |ts_v|
                               (PROG2
                                   (LETT #4# (SPADCALL |ts| |v| (QREFELT $ 46))
                                         . #7#)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0) (QREFELT $ 9)
                                                 (|Union| (QREFELT $ 9)
                                                          "failed")
                                                 #4#))
                               . #7#)
                         (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47))
                               . #7#)
                         (LETT |lgwt|
                               (SPADCALL |ts_v| |q| |ts_v-| NIL 'T
                                         (QREFELT $ 49))
                               . #7#)
                         (SEQ (LETT |gwt| NIL . #7#) (LETT #3# |lgwt| . #7#)
                              G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |gwt| (CAR #3#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |g| (QCAR |gwt|) . #7#)
                                     (EXIT
                                      (COND
                                       ((NULL (SPADCALL |g| (QREFELT $ 50)))
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |g| (QREFELT $ 40)) |v|
                                           (QREFELT $ 51))
                                          (PROGN
                                           (LETT #1#
                                                 (PROGN
                                                  (LETT #2# NIL . #7#)
                                                  (GO #8#))
                                                 . #7#)
                                           (GO #10=#:G768)))))))))
                               #10# (EXIT #1#))
                              (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT 'T)))))))
          #8# (EXIT #2#)))) 

(SDEFUN |RSETGCD;toseInvertible?;PTSL;6|
        ((|p| P) (|ts| TS)
         ($ |List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
        (SPROG
         ((|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (#1=#:G823 NIL) (|bwt| NIL) (#2=#:G822 NIL)
          (|inv|
           #3=(|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|ts_h| (TS)) (|h| (P)) (|ts_g| (TS)) (|g| (P)) (#4=#:G821 NIL)
          (|gwt| NIL)
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|ts_v+| (TS)) (|ts_v-| (TS)) (|ts_v| (P)) (#5=#:G800 NIL)
          (#6=#:G819 NIL) (|newq| (P)) (#7=#:G820 NIL) (|toCheck| #3#)
          (|v| (V)) (|q| (P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q|
                  (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36)) (QREFELT $ 37))
                  . #8=(|RSETGCD;toseInvertible?;PTSL;6|))
            (EXIT
             (COND ((SPADCALL |q| (QREFELT $ 38)) (LIST (CONS NIL |ts|)))
                   ((SPADCALL |q| |ts| (QREFELT $ 39)) (LIST (CONS 'T |ts|)))
                   ('T
                    (SEQ (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #8#)
                         (COND
                          ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                           (EXIT
                            (SEQ (LETT |lbwt| NIL . #8#)
                                 (LETT |toCheck|
                                       (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                                 |ts| (QREFELT $ 44))
                                       . #8#)
                                 (SEQ (LETT |bwt| NIL . #8#)
                                      (LETT #7# |toCheck| . #8#) G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN
                                             (LETT |bwt| (CAR #7#) . #8#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((QCAR |bwt|)
                                          (LETT |lbwt| (CONS |bwt| |lbwt|)
                                                . #8#))
                                         ('T
                                          (SEQ
                                           (LETT |newq|
                                                 (SPADCALL |q| (QCDR |bwt|)
                                                           (QREFELT $ 54))
                                                 . #8#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |newq| (QREFELT $ 38))
                                              (LETT |lbwt| (CONS |bwt| |lbwt|)
                                                    . #8#))
                                             ('T
                                              (LETT |lbwt|
                                                    (SPADCALL
                                                     (SPADCALL |newq|
                                                               (QCDR |bwt|)
                                                               (QREFELT $ 44))
                                                     |lbwt| (QREFELT $ 55))
                                                    . #8#)))))))))
                                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (PROGN
                                   (LETT #6# |lbwt| . #8#)
                                   (GO #9=#:G818)))))))
                         (LETT |ts_v|
                               (PROG2
                                   (LETT #5# (SPADCALL |ts| |v| (QREFELT $ 46))
                                         . #8#)
                                   (QCDR #5#)
                                 (|check_union2| (QEQCAR #5# 0) (QREFELT $ 9)
                                                 (|Union| (QREFELT $ 9)
                                                          "failed")
                                                 #5#))
                               . #8#)
                         (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47))
                               . #8#)
                         (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 56))
                               . #8#)
                         (LETT |lgwt|
                               (SPADCALL |ts_v| |q| |ts_v-| NIL NIL
                                         (QREFELT $ 49))
                               . #8#)
                         (LETT |lbwt| NIL . #8#)
                         (SEQ (LETT |gwt| NIL . #8#) (LETT #4# |lgwt| . #8#)
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |gwt| (CAR #4#) . #8#) NIL))
                                (GO G191)))
                              (SEQ (LETT |g| (QCAR |gwt|) . #8#)
                                   (LETT |ts| (QCDR |gwt|) . #8#)
                                   (COND
                                    ((OR (SPADCALL |g| (QREFELT $ 50))
                                         (SPADCALL
                                          (SPADCALL |g| (QREFELT $ 40)) |v|
                                          (QREFELT $ 61)))
                                     (EXIT
                                      (SEQ
                                       (LETT |ts|
                                             (SPADCALL |ts_v| |ts|
                                                       (QREFELT $ 57))
                                             . #8#)
                                       (LETT |ts|
                                             (SPADCALL
                                              (SPADCALL |ts_v+| (QREFELT $ 59))
                                              |ts| (QREFELT $ 60))
                                             . #8#)
                                       (EXIT
                                        (LETT |lbwt|
                                              (CONS (CONS 'T |ts|) |lbwt|)
                                              . #8#))))))
                                   (LETT |g| (SPADCALL |g| (QREFELT $ 62))
                                         . #8#)
                                   (LETT |ts_g|
                                         (SPADCALL |g| |ts| (QREFELT $ 57))
                                         . #8#)
                                   (LETT |ts_g|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT $ 59))
                                          |ts_g| (QREFELT $ 60))
                                         . #8#)
                                   (LETT |lbwt| (CONS (CONS NIL |ts_g|) |lbwt|)
                                         . #8#)
                                   (LETT |h|
                                         (SPADCALL |ts_v| |g| (QREFELT $ 63))
                                         . #8#)
                                   (COND
                                    ((OR (SPADCALL |h| (QREFELT $ 50))
                                         (SPADCALL
                                          (SPADCALL |h| (QREFELT $ 40)) |v|
                                          (QREFELT $ 61)))
                                     (EXIT "leave")))
                                   (LETT |h| (SPADCALL |h| (QREFELT $ 62))
                                         . #8#)
                                   (LETT |ts_h|
                                         (SPADCALL |h| |ts| (QREFELT $ 57))
                                         . #8#)
                                   (LETT |ts_h|
                                         (SPADCALL
                                          (SPADCALL |ts_v+| (QREFELT $ 59))
                                          |ts_h| (QREFELT $ 60))
                                         . #8#)
                                   (LETT |inv|
                                         (SPADCALL |q| |ts_h| (QREFELT $ 44))
                                         . #8#)
                                   (EXIT
                                    (LETT |lbwt|
                                          (SPADCALL
                                           (PROGN
                                            (LETT #2# NIL . #8#)
                                            (SEQ (LETT |bwt| NIL . #8#)
                                                 (LETT #1# |inv| . #8#) G190
                                                 (COND
                                                  ((OR (ATOM #1#)
                                                       (PROGN
                                                        (LETT |bwt| (CAR #1#)
                                                              . #8#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((QCAR |bwt|)
                                                     (LETT #2# (CONS |bwt| #2#)
                                                           . #8#)))))
                                                 (LETT #1# (CDR #1#) . #8#)
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #2#))))
                                           |lbwt| (QREFELT $ 55))
                                          . #8#)))
                              (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (SPADCALL
                           (CONS #'|RSETGCD;toseInvertible?;PTSL;6!0| $) |lbwt|
                           (QREFELT $ 66)))))))))
          #9# (EXIT #6#)))) 

(SDEFUN |RSETGCD;toseInvertible?;PTSL;6!0| ((|x| NIL) (|y| NIL) ($ NIL))
        (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT $ 64))) 

(SDEFUN |RSETGCD;toseInvertibleSet;PTSL;7| ((|p| P) (|ts| TS) ($ |List| TS))
        (SPROG
         ((|toSave| (|List| TS)) (|inv| (|List| TS)) (|ts_h| (TS)) (|h| (P))
          (|g| (P)) (#1=#:G853 NIL) (|gwt| NIL)
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|ts_v+| (TS)) (|ts_v-| (TS)) (|ts_v| (P)) (#2=#:G835 NIL)
          (#3=#:G851 NIL) (|newq| (P)) (#4=#:G852 NIL) (|bwt| NIL)
          (|toCheck|
           (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|v| (V)) (|q| (P)) (|e| (|Union| (|List| TS) "failed"))
          (|k| (|Record| (|:| |arg1| P) (|:| |arg3| TS))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |k| (CONS |p| |ts|)
                  . #5=(|RSETGCD;toseInvertibleSet;PTSL;7|))
            (LETT |e| (SPADCALL |k| (QREFELT $ 68)) . #5#)
            (EXIT
             (COND ((QEQCAR |e| 0) (QCDR |e|))
                   (#6='T
                    (SEQ
                     (LETT |q|
                           (SPADCALL (SPADCALL |p| |ts| (QREFELT $ 36))
                                     (QREFELT $ 37))
                           . #5#)
                     (EXIT
                      (COND ((SPADCALL |q| (QREFELT $ 38)) NIL)
                            ((SPADCALL |q| |ts| (QREFELT $ 39)) (LIST |ts|))
                            (#6#
                             (SEQ
                              (LETT |v| (SPADCALL |q| (QREFELT $ 40)) . #5#)
                              (LETT |toSave| NIL . #5#)
                              (COND
                               ((NULL (SPADCALL |v| |ts| (QREFELT $ 41)))
                                (EXIT
                                 (SEQ
                                  (LETT |toCheck|
                                        (SPADCALL (SPADCALL |q| (QREFELT $ 53))
                                                  |ts| (QREFELT $ 44))
                                        . #5#)
                                  (SEQ (LETT |bwt| NIL . #5#)
                                       (LETT #4# |toCheck| . #5#) G190
                                       (COND
                                        ((OR (ATOM #4#)
                                             (PROGN
                                              (LETT |bwt| (CAR #4#) . #5#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((QCAR |bwt|)
                                           (LETT |toSave|
                                                 (CONS (QCDR |bwt|) |toSave|)
                                                 . #5#))
                                          ('T
                                           (SEQ
                                            (LETT |newq|
                                                  (SPADCALL |q| (QCDR |bwt|)
                                                            (QREFELT $ 54))
                                                  . #5#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |newq| (QREFELT $ 38))
                                               "leave")
                                              ('T
                                               (LETT |toSave|
                                                     (SPADCALL
                                                      (SPADCALL |newq|
                                                                (QCDR |bwt|)
                                                                (QREFELT $ 70))
                                                      |toSave| (QREFELT $ 71))
                                                     . #5#)))))))))
                                       (LETT #4# (CDR #4#) . #5#) (GO G190)
                                       G191 (EXIT NIL))
                                  (LETT |toSave|
                                        (SPADCALL |toSave| (QREFELT $ 72))
                                        . #5#)
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL |toSave| (QREFELT $ 74))
                                          . #5#)
                                    (GO #7=#:G850)))))))
                              (LETT |ts_v|
                                    (PROG2
                                        (LETT #2#
                                              (SPADCALL |ts| |v|
                                                        (QREFELT $ 46))
                                              . #5#)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (QREFELT $ 9)
                                                      (|Union| (QREFELT $ 9)
                                                               "failed")
                                                      #2#))
                                    . #5#)
                              (LETT |ts_v-| (SPADCALL |ts| |v| (QREFELT $ 47))
                                    . #5#)
                              (LETT |ts_v+| (SPADCALL |ts| |v| (QREFELT $ 56))
                                    . #5#)
                              (LETT |lgwt|
                                    (SPADCALL |ts_v| |q| |ts_v-| NIL NIL
                                              (QREFELT $ 49))
                                    . #5#)
                              (SEQ (LETT |gwt| NIL . #5#)
                                   (LETT #1# |lgwt| . #5#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |gwt| (CAR #1#) . #5#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |g| (QCAR |gwt|) . #5#)
                                        (LETT |ts| (QCDR |gwt|) . #5#)
                                        (COND
                                         ((OR (SPADCALL |g| (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |g| (QREFELT $ 40))
                                               |v| (QREFELT $ 61)))
                                          (EXIT
                                           (SEQ
                                            (LETT |ts|
                                                  (SPADCALL |ts_v| |ts|
                                                            (QREFELT $ 57))
                                                  . #5#)
                                            (LETT |ts|
                                                  (SPADCALL
                                                   (SPADCALL |ts_v+|
                                                             (QREFELT $ 59))
                                                   |ts| (QREFELT $ 60))
                                                  . #5#)
                                            (EXIT
                                             (LETT |toSave|
                                                   (CONS |ts| |toSave|)
                                                   . #5#))))))
                                        (LETT |g| (SPADCALL |g| (QREFELT $ 62))
                                              . #5#)
                                        (LETT |h|
                                              (SPADCALL |ts_v| |g|
                                                        (QREFELT $ 63))
                                              . #5#)
                                        (LETT |h| (SPADCALL |h| (QREFELT $ 62))
                                              . #5#)
                                        (COND
                                         ((OR (SPADCALL |h| (QREFELT $ 50))
                                              (SPADCALL
                                               (SPADCALL |h| (QREFELT $ 40))
                                               |v| (QREFELT $ 61)))
                                          (EXIT "leave")))
                                        (LETT |ts_h|
                                              (SPADCALL |h| |ts|
                                                        (QREFELT $ 57))
                                              . #5#)
                                        (LETT |ts_h|
                                              (SPADCALL
                                               (SPADCALL |ts_v+|
                                                         (QREFELT $ 59))
                                               |ts_h| (QREFELT $ 60))
                                              . #5#)
                                        (LETT |inv|
                                              (SPADCALL |q| |ts_h|
                                                        (QREFELT $ 70))
                                              . #5#)
                                        (EXIT
                                         (LETT |toSave|
                                               (SPADCALL
                                                (SPADCALL |inv| |toSave|
                                                          (QREFELT $ 71))
                                                (QREFELT $ 72))
                                               . #5#)))
                                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |toSave| (SPADCALL |toSave| (QREFELT $ 74))
                                    . #5#)
                              (SPADCALL |k| |toSave| (QREFELT $ 75))
                              (EXIT |toSave|)))))))))))
          #7# (EXIT #3#)))) 

(SDEFUN |RSETGCD;toseSquareFreePart_wip|
        ((|p| P) (|ts| TS)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (SPROG
         ((|lpwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|sfp| (P)) (|g| (P)) (|us| (TS)) (#1=#:G862 NIL) (|gwt| NIL)
          (|lgwt| (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))) (|q| (P))
          (|v| (V)))
         (SEQ
          (COND ((EQL (SPADCALL |p| (QREFELT $ 77)) 1) (LIST (CONS |p| |ts|)))
                ('T
                 (SEQ
                  (LETT |v| (SPADCALL |p| (QREFELT $ 40))
                        . #2=(|RSETGCD;toseSquareFreePart_wip|))
                  (LETT |q|
                        (SPADCALL (SPADCALL |p| |v| (QREFELT $ 79))
                                  (QREFELT $ 62))
                        . #2#)
                  (LETT |lgwt| (SPADCALL |p| |q| |ts| 'T NIL (QREFELT $ 49))
                        . #2#)
                  (LETT |lpwt| NIL . #2#)
                  (SEQ (LETT |gwt| NIL . #2#) (LETT #1# |lgwt| . #2#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |gwt| (CAR #1#) . #2#) NIL))
                         (GO G191)))
                       (SEQ (LETT |g| (QCAR |gwt|) . #2#)
                            (LETT |us| (QCDR |gwt|) . #2#)
                            (COND
                             ((OR (SPADCALL |g| (QREFELT $ 50))
                                  (SPADCALL (SPADCALL |g| (QREFELT $ 40)) |v|
                                            (QREFELT $ 61)))
                              (EXIT
                               (LETT |lpwt| (CONS (CONS |p| |us|) |lpwt|)
                                     . #2#))))
                            (LETT |g| (SPADCALL |g| (QREFELT $ 62)) . #2#)
                            (LETT |sfp| (SPADCALL |p| |g| (QREFELT $ 63))
                                  . #2#)
                            (LETT |sfp|
                                  (SPADCALL
                                   (SPADCALL |sfp| |us| (QREFELT $ 80))
                                   (QREFELT $ 62))
                                  . #2#)
                            (EXIT
                             (LETT |lpwt| (CONS (CONS |sfp| |us|) |lpwt|)
                                   . #2#)))
                       (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                  (EXIT |lpwt|))))))) 

(SDEFUN |RSETGCD;toseSquareFreePart_base|
        ((|p| P) (|ts| TS)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (LIST (CONS |p| |ts|))) 

(SDEFUN |RSETGCD;toseSquareFreePart;PTSL;10|
        ((|p| P) (|ts| TS)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (|RSETGCD;toseSquareFreePart_wip| |p| |ts| $)) 

(SDEFUN |RSETGCD;prepareSubResAlgo;2PTSL;11|
        ((|p1| P) (|p2| P) (|ts| TS)
         ($ |List| #1=(|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
        (SPROG
         ((|toSee| (|List| #1#))
          (|toSave|
           (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|newp2| (P)) (|s| (P)) (#2=#:G869 NIL) (|p3| (P)) (#3=#:G882 NIL)
          (|bwt| NIL)
          (|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|lpwt| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
          (|v| (V)))
         (SEQ
          (LETT |toSee| (LIST (CONS (LIST |p1| |p2|) |ts|))
                . #4=(|RSETGCD;prepareSubResAlgo;2PTSL;11|))
          (LETT |toSave| NIL . #4#)
          (LETT |v| (SPADCALL |p1| (QREFELT $ 40)) . #4#)
          (SEQ G190 (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
               (SEQ (LETT |lpwt| (|SPADfirst| |toSee|) . #4#)
                    (LETT |toSee| (CDR |toSee|) . #4#)
                    (LETT |p1| (SPADCALL (QCAR |lpwt|) 1 (QREFELT $ 83)) . #4#)
                    (LETT |p2| (SPADCALL (QCAR |lpwt|) 2 (QREFELT $ 83)) . #4#)
                    (LETT |ts| (QCDR |lpwt|) . #4#)
                    (LETT |lbwt|
                          (SPADCALL (SPADCALL |p2| |v| (QREFELT $ 84)) |ts|
                                    (QREFELT $ 44))
                          . #4#)
                    (EXIT
                     (SEQ (LETT |bwt| NIL . #4#) (LETT #3# |lbwt| . #4#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |bwt| (CAR #3#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            ((|BooleanEquality| (QCAR |bwt|) 'T)
                             (COND
                              ((SPADCALL (SPADCALL |p2| |v| (QREFELT $ 85)) 0
                                         (QREFELT $ 86))
                               (EXIT
                                (SEQ
                                 (LETT |p3|
                                       (SPADCALL |p1|
                                                 (SPADCALL |p2| (QREFELT $ 87))
                                                 (QREFELT $ 88))
                                       . #4#)
                                 (LETT |s|
                                       (SPADCALL (SPADCALL |p2| (QREFELT $ 53))
                                                 (PROG1
                                                     (LETT #2#
                                                           (-
                                                            (SPADCALL |p1|
                                                                      (QREFELT
                                                                       $ 77))
                                                            (SPADCALL |p2|
                                                                      (QREFELT
                                                                       $ 77)))
                                                           . #4#)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 (QREFELT $ 89))
                                       . #4#)
                                 (EXIT
                                  (LETT |toSave|
                                        (CONS
                                         (CONS (LIST |p2| |p3| |s|)
                                               (QCDR |bwt|))
                                         |toSave|)
                                        . #4#))))))))
                           (LETT |newp2|
                                 (SPADCALL
                                  (SPADCALL |p2| (QCDR |bwt|) (QREFELT $ 36))
                                  (QREFELT $ 37))
                                 . #4#)
                           (EXIT
                            (COND
                             ((|BooleanEquality| (QCAR |bwt|) 'T)
                              (LETT |toSave|
                                    (CONS
                                     (CONS
                                      (LIST |p2| (|spadConstant| $ 90)
                                            (|spadConstant| $ 91))
                                      (QCDR |bwt|))
                                     |toSave|)
                                    . #4#))
                             ((SPADCALL |newp2| (QREFELT $ 38))
                              (LETT |toSave|
                                    (CONS
                                     (CONS
                                      (LIST |p1| (|spadConstant| $ 90)
                                            (|spadConstant| $ 91))
                                      (QCDR |bwt|))
                                     |toSave|)
                                    . #4#))
                             ('T
                              (LETT |toSee|
                                    (CONS
                                     (CONS (LIST |p1| |newp2|) (QCDR |bwt|))
                                     |toSee|)
                                    . #4#)))))
                          (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                          (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |toSave|)))) 

(SDEFUN |RSETGCD;integralLastSubResultant;2PTSL;12|
        ((|p1| P) (|p2| P) (|ts| TS)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (SPROG ((|ex| (|Union| P "failed")) (|gi1i2| (P)) (|lsr| (P)))
               (SEQ
                (LETT |lsr| (SPADCALL |p1| |p2| (QREFELT $ 95))
                      . #1=(|RSETGCD;integralLastSubResultant;2PTSL;12|))
                (EXIT
                 (COND
                  ((OR (SPADCALL |lsr| (QREFELT $ 50))
                       (SPADCALL (SPADCALL |lsr| (QREFELT $ 40))
                                 (SPADCALL |p1| (QREFELT $ 40))
                                 (QREFELT $ 61)))
                   (LIST (CONS |lsr| |ts|)))
                  ('T
                   (SEQ
                    (LETT |gi1i2|
                          (SPADCALL (SPADCALL |p1| (QREFELT $ 53))
                                    (SPADCALL |p2| (QREFELT $ 53))
                                    (QREFELT $ 96))
                          . #1#)
                    (LETT |ex|
                          (SPADCALL (SPADCALL |gi1i2| |lsr| (QREFELT $ 97))
                                    (SPADCALL |lsr| (QREFELT $ 53))
                                    (QREFELT $ 99))
                          . #1#)
                    (EXIT
                     (COND ((QEQCAR |ex| 1) (LIST (CONS |lsr| |ts|)))
                           ('T (LIST (CONS (QCDR |ex|) |ts|)))))))))))) 

(SDEFUN |RSETGCD;internalLastSubResultant;2PTS2BL;13|
        ((|p1| P) (|p2| P) (|ts| TS) (|b1| |Boolean|) (|b2| |Boolean|)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (SPROG
         ((|toSave| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (|s| (P)) (#1=#:G897 NIL) (|p3| (P)) (#2=#:G903 NIL)
          (|e|
           (|Union| (|List| (|Record| (|:| |val| P) (|:| |tower| TS)))
                    "failed"))
          (|k|
           (|Record| (|:| |arg1| P) (|:| |arg2| P) (|:| |arg3| TS)
                     (|:| |arg4| (|Boolean|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |k| (VECTOR |p1| |p2| |ts| |b2|)
                  . #3=(|RSETGCD;internalLastSubResultant;2PTS2BL;13|))
            (LETT |e| (SPADCALL |k| (QREFELT $ 102)) . #3#)
            (EXIT
             (COND ((QEQCAR |e| 0) (QCDR |e|))
                   ((SPADCALL |ts| (QREFELT $ 103))
                    (SEQ
                     (LETT |toSave| (SPADCALL |p1| |p2| |ts| (QREFELT $ 100))
                           . #3#)
                     (SPADCALL |k| |toSave| (QREFELT $ 104))
                     (EXIT (PROGN (LETT #2# |toSave| . #3#) (GO #4=#:G902)))))
                   (#5='T
                    (SEQ
                     (COND
                      (|b1|
                       (SEQ
                        (LETT |p3|
                              (SPADCALL |p1| (SPADCALL |p2| (QREFELT $ 87))
                                        (QREFELT $ 88))
                              . #3#)
                        (LETT |s|
                              (SPADCALL (SPADCALL |p2| (QREFELT $ 53))
                                        (PROG1
                                            (LETT #1#
                                                  (-
                                                   (SPADCALL |p1|
                                                             (QREFELT $ 77))
                                                   (SPADCALL |p2|
                                                             (QREFELT $ 77)))
                                                  . #3#)
                                          (|check_subtype2| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#))
                                        (QREFELT $ 89))
                              . #3#)
                        (EXIT
                         (LETT |toSee| (LIST (CONS (LIST |p2| |p3| |s|) |ts|))
                               . #3#))))
                      (#5#
                       (LETT |toSee| (SPADCALL |p1| |p2| |ts| (QREFELT $ 94))
                             . #3#)))
                     (LETT |toSave|
                           (SPADCALL |toSee| (SPADCALL |p1| (QREFELT $ 40))
                                     |b2| (QREFELT $ 105))
                           . #3#)
                     (SPADCALL |k| |toSave| (QREFELT $ 104))
                     (EXIT |toSave|)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |RSETGCD;internalLastSubResultant;LVBL;14|
        ((|llpwt| |List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS)))
         (|v| V) (|b2| |Boolean|)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (SPROG
         ((#1=#:G927 NIL)
          (|lpwt| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))) (|s| (P))
          (|p2| (P)) (|p1| (P)) (|#G80| (P)) (|#G79| (P))
          (|toReturn| (|List| (|Record| (|:| |val| P) (|:| |tower| TS))))
          (#2=#:G926 NIL) (|p3| (P)) (|delta| (|NonNegativeInteger|))
          (#3=#:G913 NIL)
          (|toSee| (|List| (|Record| (|:| |val| (|List| P)) (|:| |tower| TS))))
          (#4=#:G923 NIL) (#5=#:G925 NIL) (|bwt| NIL)
          (|lbwt| (|List| (|Record| (|:| |val| (|Boolean|)) (|:| |tower| TS))))
          (|ts| (TS)) (#6=#:G924 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |toReturn| NIL
                  . #7=(|RSETGCD;internalLastSubResultant;LVBL;14|))
            (SEQ G190 (COND ((NULL (NULL (NULL |llpwt|))) (GO G191)))
                 (SEQ (LETT |toSee| |llpwt| . #7#) (LETT |llpwt| NIL . #7#)
                      (SEQ (LETT |lpwt| NIL . #7#) (LETT #6# |toSee| . #7#)
                           G190
                           (COND
                            ((OR (ATOM #6#)
                                 (PROGN (LETT |lpwt| (CAR #6#) . #7#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |p1|
                                  (SPADCALL (QCAR |lpwt|) 1 (QREFELT $ 83))
                                  . #7#)
                            (LETT |p2|
                                  (SPADCALL (QCAR |lpwt|) 2 (QREFELT $ 83))
                                  . #7#)
                            (LETT |s| (SPADCALL (QCAR |lpwt|) 3 (QREFELT $ 83))
                                  . #7#)
                            (LETT |ts| (QCDR |lpwt|) . #7#)
                            (LETT |lbwt|
                                  (SPADCALL (SPADCALL |p2| |v| (QREFELT $ 84))
                                            |ts| (QREFELT $ 44))
                                  . #7#)
                            (EXIT
                             (SEQ (LETT |bwt| NIL . #7#)
                                  (LETT #5# |lbwt| . #7#) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN
                                         (LETT |bwt| (CAR #5#) . #7#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((|BooleanEquality| (QCAR |bwt|) NIL)
                                      (SEQ
                                       (LETT |toReturn|
                                             (CONS (CONS |p1| (QCDR |bwt|))
                                                   |toReturn|)
                                             . #7#)
                                       (EXIT
                                        (COND
                                         (|b2|
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |p1| |v| (QREFELT $ 85))
                                             (QREFELT $ 106))
                                            (PROGN
                                             (LETT #4# |toReturn| . #7#)
                                             (GO #8=#:G922)))))))))
                                     ('T
                                      (LETT |llpwt|
                                            (CONS
                                             (CONS (LIST |p1| |p2| |s|)
                                                   (QCDR |bwt|))
                                             |llpwt|)
                                            . #7#)))))
                                  (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #6# (CDR #6#) . #7#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND ((NULL |llpwt|) "leave")
                             ('T
                              (SEQ (LETT |toSee| |llpwt| . #7#)
                                   (LETT |llpwt| NIL . #7#)
                                   (LETT |lpwt| (|SPADfirst| |toSee|) . #7#)
                                   (LETT |toSee| (CDR |toSee|) . #7#)
                                   (LETT |p1|
                                         (SPADCALL (QCAR |lpwt|) 1
                                                   (QREFELT $ 83))
                                         . #7#)
                                   (LETT |p2|
                                         (SPADCALL (QCAR |lpwt|) 2
                                                   (QREFELT $ 83))
                                         . #7#)
                                   (LETT |s|
                                         (SPADCALL (QCAR |lpwt|) 3
                                                   (QREFELT $ 83))
                                         . #7#)
                                   (LETT |delta|
                                         (PROG1
                                             (LETT #3#
                                                   (-
                                                    (SPADCALL |p1|
                                                              (QREFELT $ 77))
                                                    (SPADCALL |p2| |v|
                                                              (QREFELT $ 85)))
                                                   . #7#)
                                           (|check_subtype2| (>= #3# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #3#))
                                         . #7#)
                                   (LETT |p3|
                                         (SPADCALL |p2|
                                                   (SPADCALL |p2| |v|
                                                             (QREFELT $ 84))
                                                   |s| |delta| (QREFELT $ 107))
                                         . #7#)
                                   (EXIT
                                    (COND
                                     ((ZEROP
                                       (SPADCALL |p3| |v| (QREFELT $ 85)))
                                      (SEQ
                                       (LETT |toReturn|
                                             (CONS (CONS |p3| (QCDR |lpwt|))
                                                   |toReturn|)
                                             . #7#)
                                       (EXIT
                                        (SEQ (LETT |lpwt| NIL . #7#)
                                             (LETT #2# |toSee| . #7#) G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |lpwt| (CAR #2#)
                                                          . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |toReturn|
                                                     (CONS
                                                      (CONS |p3| (QCDR |lpwt|))
                                                      |toReturn|)
                                                     . #7#)))
                                             (LETT #2# (CDR #2#) . #7#)
                                             (GO G190) G191 (EXIT NIL)))))
                                     ('T
                                      (SEQ
                                       (PROGN
                                        (LETT |#G79| |p3| . #7#)
                                        (LETT |#G80|
                                              (SPADCALL |p1| |p2| |p3| |s|
                                                        (QREFELT $ 108))
                                              . #7#)
                                        (LETT |p1| |#G79| . #7#)
                                        (LETT |p2| |#G80| . #7#))
                                       (LETT |s|
                                             (SPADCALL |p1| |v| (QREFELT $ 84))
                                             . #7#)
                                       (LETT |llpwt|
                                             (CONS
                                              (CONS (LIST |p1| |p2| |s|)
                                                    (QCDR |lpwt|))
                                              |llpwt|)
                                             . #7#)
                                       (EXIT
                                        (SEQ (LETT |lpwt| NIL . #7#)
                                             (LETT #1# |toSee| . #7#) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |lpwt| (CAR #1#)
                                                          . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |llpwt|
                                                     (CONS
                                                      (CONS
                                                       (LIST |p1| |p2| |s|)
                                                       (QCDR |lpwt|))
                                                      |llpwt|)
                                                     . #7#)))
                                             (LETT #1# (CDR #1#) . #7#)
                                             (GO G190) G191
                                             (EXIT NIL))))))))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT |toReturn|)))
          #8# (EXIT #4#)))) 

(SDEFUN |RSETGCD;toseLastSubResultant;2PTSL;15|
        ((|p1| P) (|p2| P) (|ts| TS)
         ($ |List| (|Record| (|:| |val| P) (|:| |tower| TS))))
        (SPROG ((|#G87| (P)) (|#G86| (P)))
               (SEQ
                (COND
                 ((SPADCALL |p1| (QREFELT $ 50))
                  (|error|
                   "in toseLastSubResultantElseSplit$TOSEGCD  : bad #1"))
                 ((OR (SPADCALL |p2| (QREFELT $ 50))
                      (NULL
                       (SPADCALL (SPADCALL |p2| (QREFELT $ 40))
                                 (SPADCALL |p1| (QREFELT $ 40))
                                 (QREFELT $ 51))))
                  (|error|
                   "in toseLastSubResultantElseSplit$TOSEGCD : bad #2"))
                 ((OR
                   (SPADCALL (SPADCALL |p1| (QREFELT $ 40)) |ts|
                             (QREFELT $ 41))
                   (NULL (SPADCALL |p1| |ts| (QREFELT $ 109))))
                  (|error|
                   "in toseLastSubResultantElseSplit$TOSEGCD : bad #1"))
                 ((NULL (SPADCALL |p2| |ts| (QREFELT $ 109)))
                  (|error|
                   "in toseLastSubResultantElseSplit$TOSEGCD : bad #2"))
                 ('T
                  (SEQ
                   (COND
                    ((SPADCALL |p1| |ts| (QREFELT $ 110))
                     (COND
                      ((SPADCALL |p2| |ts| (QREFELT $ 110))
                       (EXIT (SPADCALL |p1| |p2| |ts| (QREFELT $ 100)))))))
                   (COND
                    ((< (SPADCALL |p1| (QREFELT $ 77))
                        (SPADCALL |p2| (QREFELT $ 77)))
                     (SEQ
                      (PROGN
                       (LETT |#G86| |p2|
                             . #1=(|RSETGCD;toseLastSubResultant;2PTSL;15|))
                       (LETT |#G87| |p1| . #1#)
                       (LETT |p1| |#G86| . #1#)
                       (LETT |p2| |#G87| . #1#))
                      (EXIT
                       (COND
                        ((ODDP (SPADCALL |p1| (QREFELT $ 77)))
                         (COND
                          ((ODDP (SPADCALL |p2| (QREFELT $ 77)))
                           (LETT |p2| (SPADCALL |p2| (QREFELT $ 87))
                                 . #1#)))))))))
                   (EXIT (SPADCALL |p1| |p2| |ts| NIL NIL (QREFELT $ 49))))))))) 

(DECLAIM (NOTINLINE |RegularTriangularSetGcdPackage;|)) 

(DEFUN |RegularTriangularSetGcdPackage| (&REST #1=#:G941)
  (SPROG NIL
         (PROG (#2=#:G942)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RegularTriangularSetGcdPackage|)
                                               '|domainEqualList|)
                    . #3=(|RegularTriangularSetGcdPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |RegularTriangularSetGcdPackage;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|RegularTriangularSetGcdPackage|)))))))))) 

(DEFUN |RegularTriangularSetGcdPackage;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|RegularTriangularSetGcdPackage|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$|
          (LIST '|RegularTriangularSetGcdPackage| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #1#)
    (LETT $ (GETREFV 112) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|RegularTriangularSetGcdPackage|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|RegularTriangularSetGcdPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Void|)
              (|Record| (|:| |arg1| 9) (|:| |arg2| 9) (|:| |arg3| 10)
                        (|:| |arg4| 21))
              (|Record| (|:| |val| 9) (|:| |tower| 10))
              (|TabulatedComputationPackage| 12 48) (0 . |initTable!|)
              (|String|) (4 . |printInfo!|) (10 . |startStats!|) (15 . |void|)
              |RSETGCD;startTableGcd!;3SV;1| (|Boolean|) (19 . |makingStats?|)
              (23 . |printStats!|) (27 . |clearTable!|)
              |RSETGCD;stopTableGcd!;V;2|
              (|Record| (|:| |arg1| 9) (|:| |arg3| 10))
              (|TabulatedComputationPackage| 26 69) (31 . |initTable!|)
              (35 . |printInfo!|) (41 . |startStats!|)
              |RSETGCD;startTableInvSet!;3SV;3| (46 . |makingStats?|)
              (50 . |printStats!|) (54 . |clearTable!|)
              |RSETGCD;stopTableInvSet!;V;4| (58 . |initiallyReduce|)
              (64 . |primitivePart|) (69 . |zero?|) (74 . |normalized?|)
              (80 . |mvar|) (85 . |algebraic?|)
              (|Record| (|:| |val| 21) (|:| |tower| 10)) (|List| 42)
              |RSETGCD;toseInvertible?;PTSL;6| (|Union| 9 '"failed")
              (91 . |select|) (97 . |collectUnder|) (|List| 13)
              |RSETGCD;internalLastSubResultant;2PTS2BL;13| (103 . |ground?|)
              (108 . =) |RSETGCD;toseInvertible?;PTSB;5| (114 . |init|)
              (119 . |removeZero|) (125 . |concat|) (131 . |collectUpper|)
              (137 . |internalAugment|) (|List| 9) (143 . |members|)
              (148 . |internalAugment|) (154 . <) (160 . |mainPrimitivePart|)
              (165 . |lazyPquo|) (171 . <) (|Mapping| 21 42 42) (177 . |sort|)
              (|Union| 69 '#1="failed") (183 . |extractIfCan|) (|List| 10)
              |RSETGCD;toseInvertibleSet;PTSL;7| (188 . |concat|)
              (194 . |removeDuplicates|) (|QuasiComponentPackage| 6 7 8 9 10)
              (199 . |algebraicSort|) (204 . |insert!|) (|NonNegativeInteger|)
              (210 . |mdeg|) (215 . |One|) (219 . D) (225 . |stronglyReduce|)
              |RSETGCD;toseSquareFreePart;PTSL;10| (|Integer|) (231 . |elt|)
              (237 . |leadingCoefficient|) (243 . |degree|) (249 . >) (255 . -)
              (260 . |prem|) (266 . ^) (272 . |Zero|) (276 . |One|)
              (|Record| (|:| |val| 58) (|:| |tower| 10)) (|List| 92)
              |RSETGCD;prepareSubResAlgo;2PTSL;11| (280 . |lastSubResultant|)
              (286 . |gcd|) (292 . *) (|Union| $ '"failed") (298 . |exquo|)
              |RSETGCD;integralLastSubResultant;2PTSL;12| (|Union| 48 '#1#)
              (304 . |extractIfCan|) (309 . |empty?|) (314 . |insert!|)
              |RSETGCD;internalLastSubResultant;LVBL;14| (320 . |positive?|)
              (325 . |LazardQuotient2|) (333 . |next_subResultant2|)
              (341 . |initiallyReduced?|) (347 . |purelyTranscendental?|)
              |RSETGCD;toseLastSubResultant;2PTSL;15|)
           '#(|toseSquareFreePart| 353 |toseLastSubResultant| 359
              |toseInvertibleSet| 366 |toseInvertible?| 372 |stopTableInvSet!|
              384 |stopTableGcd!| 388 |startTableInvSet!| 392 |startTableGcd!|
              399 |prepareSubResAlgo| 406 |internalLastSubResultant| 413
              |integralLastSubResultant| 429)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(0 14 11 15 2 14 11 16 16 17
                                                   1 14 11 16 18 0 11 0 19 0 14
                                                   21 22 0 14 11 23 0 14 11 24
                                                   0 27 11 28 2 27 11 16 16 29
                                                   1 27 11 16 30 0 27 21 32 0
                                                   27 11 33 0 27 11 34 2 10 9 9
                                                   0 36 1 9 0 0 37 1 9 21 0 38
                                                   2 10 21 9 0 39 1 9 8 0 40 2
                                                   10 21 8 0 41 2 10 45 0 8 46
                                                   2 10 0 0 8 47 1 9 21 0 50 2
                                                   8 21 0 0 51 1 9 0 0 53 2 10
                                                   9 9 0 54 2 43 0 0 0 55 2 10
                                                   0 0 8 56 2 10 0 9 0 57 1 10
                                                   58 0 59 2 10 0 58 0 60 2 8
                                                   21 0 0 61 1 9 0 0 62 2 9 0 0
                                                   0 63 2 21 21 0 0 64 2 43 0
                                                   65 0 66 1 27 67 26 68 2 69 0
                                                   0 0 71 1 69 0 0 72 1 73 69
                                                   69 74 2 27 11 26 69 75 1 9
                                                   76 0 77 0 6 0 78 2 9 0 0 8
                                                   79 2 10 9 9 0 80 2 58 9 0 82
                                                   83 2 9 0 0 8 84 2 9 76 0 8
                                                   85 2 82 21 0 0 86 1 9 0 0 87
                                                   2 9 0 0 0 88 2 9 0 0 76 89 0
                                                   9 0 90 0 9 0 91 2 9 0 0 0 95
                                                   2 9 0 0 0 96 2 9 0 0 0 97 2
                                                   9 98 0 0 99 1 14 101 12 102
                                                   1 10 21 0 103 2 14 11 12 48
                                                   104 1 82 21 0 106 4 9 0 0 0
                                                   0 76 107 4 9 0 0 0 0 0 108 2
                                                   10 21 9 0 109 2 10 21 9 0
                                                   110 2 0 48 9 10 81 3 0 48 9
                                                   9 10 111 2 0 69 9 10 70 2 0
                                                   43 9 10 44 2 0 21 9 10 52 0
                                                   0 11 35 0 0 11 25 3 0 11 16
                                                   16 16 31 3 0 11 16 16 16 20
                                                   3 0 93 9 9 10 94 5 0 48 9 9
                                                   10 21 21 49 3 0 48 93 8 21
                                                   105 3 0 48 9 9 10 100)))))
           '|lookupComplete|)) 
