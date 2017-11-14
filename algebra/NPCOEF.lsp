
(SDEFUN |NPCOEF;npcoef;SupLLR;1|
        ((|u| |SparseUnivariatePolynomial| P) (|factlist| |List| BP)
         (|leadlist| |List| P)
         ($ |Record| (|:| |deter| (|List| (|SparseUnivariatePolynomial| P)))
          (|:| |dterm|
               (|List|
                (|List|
                 (|Record| (|:| |expt| (|NonNegativeInteger|))
                           (|:| |pcoef| P)))))
          (|:| |nfacts| (|List| BP)) (|:| |nlead| (|List| P))))
        (SPROG
         ((|detcoef|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#1=#:G778 NIL) (|i| NIL)
          (|ltodel| #2=(|List| (|NonNegativeInteger|)))
          (|detufact| (|List| (|SparseUnivariatePolynomial| P)))
          (#3=#:G765 NIL)
          (|uu| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (#4=#:G753 NIL) (#5=#:G752 #6=(|SparseUnivariatePolynomial| P))
          (#7=#:G754 #6#) (#8=#:G777 NIL) (|pol| NIL) (|ltochange| #2#)
          (|tablecoef|
           (|List|
            (|Record| (|:| |coefu| P)
                      (|:| |detfacts|
                           (|List|
                            (|List|
                             (|Record| (|:| |expt| (|NonNegativeInteger|))
                                       (|:| |pcoef| P))))))))
          (#9=#:G776 NIL) (|changed| (|Boolean|))
          (|ndet| (|NonNegativeInteger|)) (#10=#:G743 NIL)
          (|nterm|
           #11=(|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))
          (|vexp| #12=(|NonNegativeInteger|))
          (|vpos| #13=(|NonNegativeInteger|))
          (|celtf|
           (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                     (|:| |posit| (|NonNegativeInteger|))))
          (|cf|
           (|Union|
            (|Record| (|:| |valexp| #12#) (|:| |valcoef| P) (|:| |posit| #13#))
            "failed"))
          (#14=#:G775 NIL) (|dt| (|NonNegativeInteger|))
          (|lexp| (|List| (|List| (|NonNegativeInteger|)))) (#15=#:G774 NIL)
          (|ep| NIL) (#16=#:G773 NIL) (|ldtcf| (|List| (|List| #11#)))
          (#17=#:G771 NIL) (#18=#:G772 NIL) (|lcu| NIL) (#19=#:G770 NIL)
          (|ulist| (|Vector| P)) (#20=#:G769 NIL) (#21=#:G768 NIL)
          (#22=#:G767 NIL) (|v| NIL) (#23=#:G766 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |detcoef| NIL . #24=(|NPCOEF;npcoef;SupLLR;1|))
                (LETT |detufact| NIL . #24#)
                (LETT |lexp|
                      (PROGN
                       (LETT #23# NIL . #24#)
                       (SEQ (LETT |v| NIL . #24#) (LETT #22# |factlist| . #24#)
                            G190
                            (COND
                             ((OR (ATOM #22#)
                                  (PROGN (LETT |v| (CAR #22#) . #24#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #23# (CONS (|NPCOEF;listexp| |v| $) #23#)
                                    . #24#)))
                            (LETT #22# (CDR #22#) . #24#) (GO G190) G191
                            (EXIT (NREVERSE #23#))))
                      . #24#)
                (LETT |ulist|
                      (SPADCALL
                       (PROGN
                        (LETT #21# NIL . #24#)
                        (SEQ (LETT |i| 0 . #24#)
                             (LETT #20# (SPADCALL |u| (QREFELT $ 13)) . #24#)
                             G190 (COND ((|greater_SI| |i| #20#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #21#
                                     (CONS (SPADCALL |u| |i| (QREFELT $ 14))
                                           #21#)
                                     . #24#)))
                             (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                             (EXIT (NREVERSE #21#))))
                       (QREFELT $ 17))
                      . #24#)
                (LETT |tablecoef|
                      (|NPCOEF;buildtable| |ulist| |lexp| |leadlist| $) . #24#)
                (LETT |detcoef|
                      (PROGN
                       (LETT #19# NIL . #24#)
                       (SEQ (LETT |lcu| NIL . #24#)
                            (LETT #18# |leadlist| . #24#)
                            (LETT |ep| NIL . #24#) (LETT #17# |lexp| . #24#)
                            G190
                            (COND
                             ((OR (ATOM #17#)
                                  (PROGN (LETT |ep| (CAR #17#) . #24#) NIL)
                                  (ATOM #18#)
                                  (PROGN (LETT |lcu| (CAR #18#) . #24#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #19#
                                    (CONS
                                     (LIST (CONS (|SPADfirst| |ep|) |lcu|))
                                     #19#)
                                    . #24#)))
                            (LETT #17#
                                  (PROG1 (CDR #17#)
                                    (LETT #18# (CDR #18#) . #24#))
                                  . #24#)
                            (GO G190) G191 (EXIT (NREVERSE #19#))))
                      . #24#)
                (LETT |ldtcf| |detcoef| . #24#)
                (LETT |lexp|
                      (PROGN
                       (LETT #16# NIL . #24#)
                       (SEQ (LETT |ep| NIL . #24#) (LETT #15# |lexp| . #24#)
                            G190
                            (COND
                             ((OR (ATOM #15#)
                                  (PROGN (LETT |ep| (CAR #15#) . #24#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT (LETT #16# (CONS (CDR |ep|) #16#) . #24#)))
                            (LETT #15# (CDR #15#) . #24#) (GO G190) G191
                            (EXIT (NREVERSE #16#))))
                      . #24#)
                (LETT |ndet| (LENGTH |factlist|) . #24#)
                (LETT |changed| 'T . #24#) (LETT |ltochange| NIL . #24#)
                (LETT |ltodel| NIL . #24#)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND (|changed| (SPADCALL |ndet| 1 (QREFELT $ 21)))
                              ('T NIL)))
                       (GO G191)))
                     (SEQ (LETT |changed| NIL . #24#)
                          (LETT |dt| (LENGTH |tablecoef|) . #24#)
                          (SEQ (LETT |i| 1 . #24#) (LETT #14# |dt| . #24#) G190
                               (COND
                                ((OR (|greater_SI| |i| #14#)
                                     (NULL (NULL |changed|)))
                                 (GO G191)))
                               (SEQ
                                (LETT |cf|
                                      (|NPCOEF;check|
                                       (SPADCALL |tablecoef| |i|
                                                 (QREFELT $ 26))
                                       |ulist| $)
                                      . #24#)
                                (EXIT
                                 (COND ((QEQCAR |cf| 1) "next i")
                                       ('T
                                        (SEQ
                                         (LETT |ltochange|
                                               (CONS |i| |ltochange|) . #24#)
                                         (LETT |celtf| (QCDR |cf|) . #24#)
                                         (LETT |tablecoef|
                                               (|NPCOEF;modify| |tablecoef|
                                                |celtf| $)
                                               . #24#)
                                         (LETT |vpos| (QVELT |celtf| 2) . #24#)
                                         (LETT |vexp| (QVELT |celtf| 0) . #24#)
                                         (LETT |nterm|
                                               (CONS |vexp| (QVELT |celtf| 1))
                                               . #24#)
                                         (SPADCALL |detcoef| |vpos|
                                                   (CONS |nterm|
                                                         (SPADCALL |detcoef|
                                                                   |vpos|
                                                                   (QREFELT $
                                                                            29)))
                                                   (QREFELT $ 30))
                                         (SPADCALL |lexp| |vpos|
                                                   (SPADCALL
                                                    (SPADCALL |lexp| |vpos|
                                                              (QREFELT $ 33))
                                                    (SPADCALL |vexp|
                                                              (SPADCALL |lexp|
                                                                        |vpos|
                                                                        (QREFELT
                                                                         $ 33))
                                                              (QREFELT $ 34))
                                                    (QREFELT $ 35))
                                                   (QREFELT $ 36))
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |lexp| |vpos|
                                                      (QREFELT $ 33))
                                            NIL (QREFELT $ 37))
                                           (SEQ
                                            (LETT |ltodel|
                                                  (CONS |vpos| |ltodel|)
                                                  . #24#)
                                            (LETT |ndet|
                                                  (PROG1
                                                      (LETT #10# (- |ndet| 1)
                                                            . #24#)
                                                    (|check_subtype2|
                                                     (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                                  . #24#)
                                            (EXIT
                                             (LETT |detufact|
                                                   (CONS
                                                    (|NPCOEF;constructp|
                                                     (SPADCALL |detcoef| |vpos|
                                                               (QREFELT $ 29))
                                                     $)
                                                    |detufact|)
                                                   . #24#)))))
                                         (EXIT (LETT |changed| 'T . #24#)))))))
                               (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                               (EXIT NIL))
                          (SEQ (LETT |i| NIL . #24#)
                               (LETT #9# |ltochange| . #24#) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#) . #24#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |tablecoef|
                                       (SPADCALL |tablecoef| |i|
                                                 (QREFELT $ 38))
                                       . #24#)))
                               (LETT #9# (CDR #9#) . #24#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |ltochange| NIL . #24#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |ndet| 1)
                  (SEQ
                   (LETT |uu|
                         (SPADCALL |u|
                                   (PROGN
                                    (LETT #4# NIL . #24#)
                                    (SEQ (LETT |pol| NIL . #24#)
                                         (LETT #8# |detufact| . #24#) G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |pol| (CAR #8#) . #24#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #7# |pol| . #24#)
                                            (COND
                                             (#4#
                                              (LETT #5#
                                                    (SPADCALL #5# #7#
                                                              (QREFELT $ 39))
                                                    . #24#))
                                             ('T
                                              (PROGN
                                               (LETT #5# #7# . #24#)
                                               (LETT #4# 'T . #24#)))))))
                                         (LETT #8# (CDR #8#) . #24#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND (#4# #5#)
                                          (#25='T (|spadConstant| $ 40))))
                                   (QREFELT $ 42))
                         . #24#)
                   (EXIT
                    (COND
                     ((QEQCAR |uu| 1)
                      (PROGN
                       (LETT #3# (VECTOR NIL |ldtcf| |factlist| |leadlist|)
                             . #24#)
                       (GO #26=#:G764)))
                     (#25#
                      (LETT |detufact| (CONS (QCDR |uu|) |detufact|)
                            . #24#))))))
                 (#25#
                  (SEQ
                   (LETT |ltodel| (SPADCALL (ELT $ 43) |ltodel| (QREFELT $ 45))
                         . #24#)
                   (EXIT
                    (SEQ (LETT |i| NIL . #24#) (LETT #1# |ltodel| . #24#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |i| (CAR #1#) . #24#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |detcoef|
                                (SPADCALL |detcoef| |i| (QREFELT $ 46)) . #24#)
                          (LETT |factlist|
                                (SPADCALL |factlist| |i| (QREFELT $ 48))
                                . #24#)
                          (EXIT
                           (LETT |leadlist|
                                 (SPADCALL |leadlist| |i| (QREFELT $ 49))
                                 . #24#)))
                         (LETT #1# (CDR #1#) . #24#) (GO G190) G191
                         (EXIT NIL))))))
                (EXIT (VECTOR |detufact| |detcoef| |factlist| |leadlist|))))
          #26# (EXIT #3#)))) 

(SDEFUN |NPCOEF;check|
        ((|tterm| |Record| (|:| |coefu| P)
          (|:| |detfacts|
               #1=(|List|
                   (|List|
                    (|Record| (|:| |expt| (|NonNegativeInteger|))
                              (|:| |pcoef| P))))))
         (|ulist| |Vector| P)
         ($ |Union|
          (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                    (|:| |posit| (|NonNegativeInteger|)))
          "failed"))
        (SPROG
         ((#2=#:G785 NIL) (#3=#:G800 NIL) (|pp| (|Union| P "failed"))
          (|poselt| #4=(|NonNegativeInteger|)) (#5=#:G792 NIL) (|doit| #4#)
          (|cfu| (P)) (|cu1| (P)) (#6=#:G801 NIL) (|elterm| NIL)
          (|vterm|
           (|List|
            (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
          (|termlist| #1#))
         (SEQ (LETT |cfu| (|spadConstant| $ 52) . #7=(|NPCOEF;check|))
              (LETT |doit| 0 . #7#) (LETT |poselt| 0 . #7#)
              (LETT |termlist| (QCDR |tterm|) . #7#) (LETT |vterm| NIL . #7#)
              (EXIT
               (COND
                ((EQL (LENGTH |termlist|) 1)
                 (SEQ
                  (EXIT
                   (SEQ (LETT |vterm| (|SPADfirst| |termlist|) . #7#)
                        (SEQ (LETT |elterm| NIL . #7#) (LETT #6# |vterm| . #7#)
                             G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |elterm| (CAR #6#) . #7#) NIL)
                                   (NULL (< |doit| 2)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (LETT |cu1| (QCDR |elterm|) . #7#)
                                           (|spadConstant| $ 53)
                                           (QREFELT $ 54))
                                 (LETT |cfu|
                                       (SPADCALL |cu1| |cfu| (QREFELT $ 55))
                                       . #7#))
                                ('T
                                 (SEQ (LETT |doit| (+ |doit| 1) . #7#)
                                      (EXIT
                                       (LETT |poselt|
                                             (PROG1
                                                 (LETT #5#
                                                       (SPADCALL |elterm|
                                                                 |vterm|
                                                                 (QREFELT $
                                                                          56))
                                                       . #7#)
                                               (|check_subtype2| (>= #5# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #5#))
                                             . #7#)))))))
                             (LETT #6# (CDR #6#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (COND ((EQL |doit| 2) (EXIT (CONS 1 #8="failed")))
                              (#9='T
                               (SEQ
                                (LETT |pp|
                                      (SPADCALL (QCAR |tterm|) |cfu|
                                                (QREFELT $ 57))
                                      . #7#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |pp| 1)
                                   (PROGN
                                    (LETT #3# (CONS 1 #8#) . #7#)
                                    (GO #10=#:G797))))))))
                        (EXIT
                         (CONS 0
                               (VECTOR
                                (QCAR
                                 (SPADCALL |vterm| |poselt| (QREFELT $ 58)))
                                (PROG2 (LETT #2# |pp| . #7#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 0) (QREFELT $ 10)
                                                  (|Union| (QREFELT $ 10)
                                                           "failed")
                                                  #2#))
                                |poselt|)))))
                  #10# (EXIT #3#)))
                (#9# (CONS 1 "failed"))))))) 

(SDEFUN |NPCOEF;buildvect|
        ((|lvterm| |List|
          (|List|
           (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
         (|n| |NonNegativeInteger|)
         ($ |Vector|
          (|List|
           (|List|
            (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))))
        (SPROG
         ((#1=#:G820 NIL) (#2=#:G819 NIL) (#3=#:G818 NIL) (|i| NIL)
          (|nexp| (|NonNegativeInteger|)) (#4=#:G817 NIL) (|term| NIL)
          (|ntable|
           #5=(|Vector|
               (|List|
                (|List|
                 (|Record| (|:| |expt| (|NonNegativeInteger|))
                           (|:| |pcoef| P))))))
          (|vtable| #5#) (#6=#:G816 NIL))
         (SEQ (LETT |vtable| (MAKEARR1 |n| NIL) . #7=(|NPCOEF;buildvect|))
              (EXIT
               (COND
                ((EQL (LENGTH |lvterm|) 1)
                 (SEQ
                  (SEQ (LETT |term| NIL . #7#)
                       (LETT #6# (|SPADfirst| |lvterm|) . #7#) G190
                       (COND
                        ((OR (ATOM #6#)
                             (PROGN (LETT |term| (CAR #6#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |vtable| (+ (QCAR |term|) 1)
                                   (LIST (LIST |term|)) (QREFELT $ 60))))
                       (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                  (EXIT |vtable|)))
                ('T
                 (SEQ
                  (LETT |vtable| (|NPCOEF;buildvect| (CDR |lvterm|) |n| $)
                        . #7#)
                  (LETT |ntable| (MAKEARR1 |n| NIL) . #7#)
                  (SEQ (LETT |term| NIL . #7#)
                       (LETT #4# (|SPADfirst| |lvterm|) . #7#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |term| (CAR #4#) . #7#) NIL))
                         (GO G191)))
                       (SEQ (LETT |nexp| (QCAR |term|) . #7#)
                            (EXIT
                             (SEQ (LETT |i| 1 . #7#) (LETT #3# |n| . #7#) G190
                                  (COND
                                   ((OR (|greater_SI| |i| #3#)
                                        (NULL (< (+ |nexp| |i|) (+ |n| 1))))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |ntable| (+ |nexp| |i|)
                                              (SPADCALL
                                               (PROGN
                                                (LETT #2# NIL . #7#)
                                                (SEQ (LETT |lvterm| NIL . #7#)
                                                     (LETT #1#
                                                           (SPADCALL |vtable|
                                                                     |i|
                                                                     (QREFELT $
                                                                              61))
                                                           . #7#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |lvterm|
                                                                  (CAR #1#)
                                                                  . #7#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #2#
                                                             (CONS
                                                              (CONS |term|
                                                                    |lvterm|)
                                                              #2#)
                                                             . #7#)))
                                                     (LETT #1# (CDR #1#) . #7#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #2#))))
                                               (SPADCALL |ntable|
                                                         (+ |nexp| |i|)
                                                         (QREFELT $ 61))
                                               (QREFELT $ 62))
                                              (QREFELT $ 60))))
                                  (LETT |i| (|inc_SI| |i|) . #7#) (GO G190)
                                  G191 (EXIT NIL))))
                       (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                  (EXIT |ntable|)))))))) 

(SDEFUN |NPCOEF;buildtable|
        ((|vu| |Vector| P) (|lvect| |List| (|List| (|NonNegativeInteger|)))
         (|leadlist| |List| P)
         ($ |List|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P))))))))
        (SPROG
         ((|table|
           (|List|
            (|Record| (|:| |coefu| P)
                      (|:| |detfacts|
                           (|List|
                            (|List|
                             (|Record| (|:| |expt| (|NonNegativeInteger|))
                                       (|:| |pcoef| P))))))))
          (#1=#:G835 NIL) (|i| NIL)
          (|partialv|
           (|Vector|
            (|List|
             (|List|
              (|Record| (|:| |expt| (|NonNegativeInteger|))
                        (|:| |pcoef| P))))))
          (#2=#:G834 NIL)
          (|prelim|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#3=#:G833 NIL) (|e| NIL) (#4=#:G832 NIL) (#5=#:G831 NIL) (|lv| NIL)
          (#6=#:G830 NIL) (|degu| (|NonNegativeInteger|)) (#7=#:G822 NIL)
          (|nfact| (|NonNegativeInteger|)))
         (SEQ (LETT |nfact| (LENGTH |leadlist|) . #8=(|NPCOEF;buildtable|))
              (LETT |table| NIL . #8#)
              (LETT |degu|
                    (PROG1 (LETT #7# (- (QVSIZE |vu|) 1) . #8#)
                      (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #7#))
                    . #8#)
              (LETT |prelim|
                    (PROGN
                     (LETT #6# NIL . #8#)
                     (SEQ (LETT |lv| NIL . #8#) (LETT #5# |lvect| . #8#) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |lv| (CAR #5#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (PROGN
                                    (LETT #4# NIL . #8#)
                                    (SEQ (LETT |e| NIL . #8#)
                                         (LETT #3# |lv| . #8#) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |e| (CAR #3#) . #8#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (CONS |e|
                                                        (|spadConstant| $ 53))
                                                  #4#)
                                                 . #8#)))
                                         (LETT #3# (CDR #3#) . #8#) (GO G190)
                                         G191 (EXIT (NREVERSE #4#))))
                                   #6#)
                                  . #8#)))
                          (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #8#)
              (SEQ (LETT |i| 1 . #8#) (LETT #2# |nfact| . #8#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (RPLACD
                       (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT $ 29)))
                       (SPADCALL |leadlist| |i| (QREFELT $ 63)))
                      (QCDR
                       (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT $ 29)))))))
                   (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
              (LETT |partialv| (MAKEARR1 |nfact| NIL) . #8#)
              (LETT |partialv| (|NPCOEF;buildvect| |prelim| |degu| $) . #8#)
              (SEQ (LETT |i| 1 . #8#) (LETT #1# |degu| . #8#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |partialv| |i| (QREFELT $ 61)))
                       "next i")
                      ('T
                       (LETT |table|
                             (CONS
                              (CONS (SPADCALL |vu| |i| (QREFELT $ 64))
                                    (SPADCALL |partialv| |i| (QREFELT $ 61)))
                              |table|)
                             . #8#)))))
                   (LETT |i| (|inc_SI| |i|) . #8#) (GO G190) G191 (EXIT NIL))
              (EXIT |table|)))) 

(SDEFUN |NPCOEF;modify|
        ((|tablecoef| |List|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P)))))))
         (|cfter| |Record| (|:| |valexp| (|NonNegativeInteger|))
          (|:| |valcoef| P) (|:| |posit| (|NonNegativeInteger|)))
         ($ |List|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P))))))))
        (SPROG
         ((|lterase| (|List| (|NonNegativeInteger|)))
          (|ctdet|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#1=#:G897 NIL) (|i| NIL) (#2=#:G879 NIL) (#3=#:G878 (P))
          (#4=#:G880 (P)) (#5=#:G896 NIL) (|cc| NIL)
          (|k| (|NonNegativeInteger|)) (#6=#:G877 NIL) (#7=#:G865 NIL)
          (#8=#:G864 #9=(|Boolean|)) (#10=#:G866 #9#) (#11=#:G895 NIL)
          (#12=#:G894 NIL) (|celt| NIL) (#13=#:G862 NIL)
          (#14=#:G861 #15=(|NonNegativeInteger|)) (#16=#:G863 #15#)
          (#17=#:G893 NIL) (|term| NIL) (#18=#:G892 NIL) (|cterm| NIL)
          (|cfpos| (|NonNegativeInteger|)) (|cfcoef| (P))
          (|cfexp| (|NonNegativeInteger|)))
         (SEQ (LETT |cfexp| (QVELT |cfter| 0) . #19=(|NPCOEF;modify|))
              (LETT |cfcoef| (QVELT |cfter| 1) . #19#)
              (LETT |cfpos| (QVELT |cfter| 2) . #19#)
              (LETT |lterase| NIL . #19#)
              (SEQ (LETT |cterm| NIL . #19#) (LETT #18# |tablecoef| . #19#)
                   G190
                   (COND
                    ((OR (ATOM #18#)
                         (PROGN (LETT |cterm| (CAR #18#) . #19#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL (LETT |ctdet| (QCDR |cterm|) . #19#)))
                       (COND
                        ((<
                          (PROGN
                           (LETT #13# NIL . #19#)
                           (SEQ (LETT |term| NIL . #19#)
                                (LETT #17# (|SPADfirst| |ctdet|) . #19#) G190
                                (COND
                                 ((OR (ATOM #17#)
                                      (PROGN
                                       (LETT |term| (CAR #17#) . #19#)
                                       NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #16# (QCAR |term|) . #19#)
                                   (COND
                                    (#13# (LETT #14# (+ #14# #16#) . #19#))
                                    ('T
                                     (PROGN
                                      (LETT #14# #16# . #19#)
                                      (LETT #13# 'T . #19#)))))))
                                (LETT #17# (CDR #17#) . #19#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#13# #14#) ('T 0)))
                          |cfexp|)
                         "next term")
                        ('T
                         (SEQ
                          (SEQ (LETT |celt| NIL . #19#)
                               (LETT #12# |ctdet| . #19#) G190
                               (COND
                                ((OR (ATOM #12#)
                                     (PROGN
                                      (LETT |celt| (CAR #12#) . #19#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (QCAR
                                     (SPADCALL |celt| |cfpos| (QREFELT $ 58)))
                                    |cfexp|)
                                   (SEQ
                                    (PROGN
                                     (RPLACD
                                      (SPADCALL |celt| |cfpos| (QREFELT $ 58))
                                      |cfcoef|)
                                     (QCDR
                                      (SPADCALL |celt| |cfpos|
                                                (QREFELT $ 58))))
                                    (EXIT
                                     (COND
                                      ((PROGN
                                        (LETT #7# NIL . #19#)
                                        (SEQ (LETT |cc| NIL . #19#)
                                             (LETT #11# |celt| . #19#) G190
                                             (COND
                                              ((OR (ATOM #11#)
                                                   (PROGN
                                                    (LETT |cc| (CAR #11#)
                                                          . #19#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #10#
                                                      (SPADCALL (QCDR |cc|)
                                                                (|spadConstant|
                                                                 $ 53)
                                                                (QREFELT $ 54))
                                                      . #19#)
                                                (COND
                                                 (#7#
                                                  (LETT #8#
                                                        (COND (#8# #10#)
                                                              ('T NIL))
                                                        . #19#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #8# #10# . #19#)
                                                   (LETT #7# 'T . #19#)))))))
                                             (LETT #11# (CDR #11#) . #19#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#7# #8#) ('T 'T)))
                                       (SEQ
                                        (LETT |k|
                                              (PROG1
                                                  (LETT #6#
                                                        (SPADCALL |celt|
                                                                  |ctdet|
                                                                  (QREFELT $
                                                                           65))
                                                        . #19#)
                                                (|check_subtype2| (>= #6# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #6#))
                                              . #19#)
                                        (LETT |lterase| (CONS |k| |lterase|)
                                              . #19#)
                                        (EXIT
                                         (PROGN
                                          (RPLACA |cterm|
                                                  (SPADCALL (QCAR |cterm|)
                                                            (PROGN
                                                             (LETT #2# NIL
                                                                   . #19#)
                                                             (SEQ
                                                              (LETT |cc| NIL
                                                                    . #19#)
                                                              (LETT #5# |celt|
                                                                    . #19#)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #5#)
                                                                    (PROGN
                                                                     (LETT |cc|
                                                                           (CAR
                                                                            #5#)
                                                                           . #19#)
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #4#
                                                                       (QCDR
                                                                        |cc|)
                                                                       . #19#)
                                                                 (COND
                                                                  (#2#
                                                                   (LETT #3#
                                                                         (SPADCALL
                                                                          #3#
                                                                          #4#
                                                                          (QREFELT
                                                                           $
                                                                           55))
                                                                         . #19#))
                                                                  ('T
                                                                   (PROGN
                                                                    (LETT #3#
                                                                          #4#
                                                                          . #19#)
                                                                    (LETT #2#
                                                                          'T
                                                                          . #19#)))))))
                                                              (LETT #5#
                                                                    (CDR #5#)
                                                                    . #19#)
                                                              (GO G190) G191
                                                              (EXIT NIL))
                                                             (COND (#2# #3#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     $ 52))))
                                                            (QREFELT $ 66)))
                                          (QCAR |cterm|))))))))))))
                               (LETT #12# (CDR #12#) . #19#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            ((NULL (NULL |lterase|))
                             (SEQ
                              (LETT |lterase|
                                    (SPADCALL (ELT $ 43) |lterase|
                                              (QREFELT $ 45))
                                    . #19#)
                              (SEQ (LETT |i| NIL . #19#)
                                   (LETT #1# |lterase| . #19#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |i| (CAR #1#) . #19#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ctdet|
                                           (SPADCALL |ctdet| |i|
                                                     (QREFELT $ 46))
                                           . #19#)))
                                   (LETT #1# (CDR #1#) . #19#) (GO G190) G191
                                   (EXIT NIL))
                              (PROGN (RPLACD |cterm| |ctdet|) (QCDR |cterm|))
                              (EXIT (LETT |lterase| NIL . #19#)))))))))))))
                   (LETT #18# (CDR #18#) . #19#) (GO G190) G191 (EXIT NIL))
              (EXIT |tablecoef|)))) 

(SDEFUN |NPCOEF;listexp| ((|up| BP) ($ |List| (|NonNegativeInteger|)))
        (COND ((EQL (SPADCALL |up| (QREFELT $ 67)) 0) (LIST 0))
              ('T
               (CONS (SPADCALL |up| (QREFELT $ 67))
                     (|NPCOEF;listexp| (SPADCALL |up| (QREFELT $ 68)) $))))) 

(SDEFUN |NPCOEF;constructp|
        ((|lterm| |List|
          (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))
         ($ |SparseUnivariatePolynomial| P))
        (SPROG
         ((#1=#:G901 NIL) (#2=#:G900 #3=(|SparseUnivariatePolynomial| P))
          (#4=#:G902 #3#) (#5=#:G904 NIL) (|term| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|NPCOEF;constructp|))
           (SEQ (LETT |term| NIL . #6#) (LETT #5# |lterm| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |term| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL (QCDR |term|) (QCAR |term|) (QREFELT $ 69))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 70)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 71))))))) 

(DECLAIM (NOTINLINE |NPCoef;|)) 

(DEFUN |NPCoef| (&REST #1=#:G905)
  (SPROG NIL
         (PROG (#2=#:G906)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NPCoef|)
                                               '|domainEqualList|)
                    . #3=(|NPCoef|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NPCoef;|) #1#) (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|NPCoef|)))))))))) 

(DEFUN |NPCoef;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|NPCoef|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|NPCoef| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 72) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|NPCoef| (LIST DV$1 DV$2 DV$3 DV$4 DV$5)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|NPCoef| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 10)
              (0 . |degree|) (5 . |coefficient|) (|List| 10) (|Vector| 10)
              (11 . |vector|) (16 . |One|) (20 . |One|) (|Boolean|) (24 . ~=)
              (|Record| (|:| |expt| 11) (|:| |pcoef| 10))
              (|Record| (|:| |coefu| 10) (|:| |detfacts| 28)) (|Integer|)
              (|List| 23) (30 . |elt|) (|List| 22) (|List| 27) (36 . |elt|)
              (42 . |setelt!|) (|List| 11) (|List| 31) (49 . |elt|)
              (55 . |position|) (61 . |delete|) (67 . |setelt!|) (74 . =)
              (80 . |delete|) (86 . *) (92 . |One|) (|Union| $ '"failed")
              (96 . |exquo|) (102 . >) (|Mapping| 20 11 11) (108 . |sort|)
              (114 . |delete|) (|List| 6) (120 . |delete|) (126 . |delete|)
              (|Record| (|:| |deter| (|List| 12)) (|:| |dterm| 28)
                        (|:| |nfacts| 47) (|:| |nlead| 15))
              |NPCOEF;npcoef;SupLLR;1| (132 . |One|) (136 . |Zero|) (140 . ~=)
              (146 . *) (152 . |position|) (158 . |exquo|) (164 . |elt|)
              (|Vector| 28) (170 . |setelt!|) (177 . |elt|) (183 . |append|)
              (189 . |elt|) (195 . |elt|) (201 . |position|) (207 . -)
              (213 . |degree|) (218 . |reductum|) (223 . |monomial|) (229 . +)
              (235 . |Zero|))
           '#(|npcoef| 239) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 71
                                                 '(1 12 11 0 13 2 12 10 0 11 14
                                                   1 16 0 15 17 0 6 0 18 0 9 0
                                                   19 2 11 20 0 0 21 2 25 23 0
                                                   24 26 2 28 27 0 24 29 3 28
                                                   27 0 24 27 30 2 32 31 0 24
                                                   33 2 31 24 11 0 34 2 31 0 0
                                                   24 35 3 32 31 0 24 31 36 2
                                                   31 20 0 0 37 2 25 0 0 24 38
                                                   2 12 0 0 0 39 0 12 0 40 2 12
                                                   41 0 0 42 2 11 20 0 0 43 2
                                                   31 0 44 0 45 2 28 0 0 24 46
                                                   2 47 0 0 24 48 2 15 0 0 24
                                                   49 0 10 0 52 0 10 0 53 2 10
                                                   20 0 0 54 2 10 0 0 0 55 2 27
                                                   24 22 0 56 2 10 41 0 0 57 2
                                                   27 22 0 24 58 3 59 28 0 24
                                                   28 60 2 59 28 0 24 61 2 28 0
                                                   0 0 62 2 15 10 0 24 63 2 16
                                                   10 0 24 64 2 28 24 27 0 65 2
                                                   10 0 0 0 66 1 6 11 0 67 1 6
                                                   0 0 68 2 12 0 10 11 69 2 12
                                                   0 0 0 70 0 12 0 71 3 0 50 12
                                                   47 15 51)))))
           '|lookupComplete|)) 
