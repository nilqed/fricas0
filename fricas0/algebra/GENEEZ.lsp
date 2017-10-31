
(SDEFUN |GENEEZ;compBound;BPLNni;1|
        ((|m| BP) (|listpolys| |List| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G721 NIL) (|normprod| #2=(|NonNegativeInteger|))
          (#3=#:G716 NIL) (#4=#:G715 #2#) (#5=#:G717 #2#) (#6=#:G719 NIL)
          (#7=#:G731 NIL) (|g| NIL) (#8=#:G732 NIL) (|df| NIL)
          (|nm| #9=(|NonNegativeInteger|)) (#10=#:G713 NIL) (#11=#:G712 #9#)
          (#12=#:G714 #9#) (#13=#:G730 NIL) (|u| NIL) (|normlist| (|List| #9#))
          (#14=#:G709 NIL) (#15=#:G708 #9#) (#16=#:G710 #9#) (#17=#:G729 NIL)
          (#18=#:G728 NIL) (|f| NIL) (#19=#:G727 NIL)
          (|n| #20=(|NonNegativeInteger|)) (#21=#:G706 NIL) (#22=#:G705 #20#)
          (#23=#:G707 #20#) (#24=#:G726 NIL) (|ldeg| (|List| #20#))
          (#25=#:G725 NIL) (#26=#:G724 NIL))
         (SEQ
          (LETT |ldeg|
                (PROGN
                 (LETT #26# NIL . #27=(|GENEEZ;compBound;BPLNni;1|))
                 (SEQ (LETT |f| NIL . #27#) (LETT #25# |listpolys| . #27#) G190
                      (COND
                       ((OR (ATOM #25#)
                            (PROGN (LETT |f| (CAR #25#) . #27#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #26# (CONS (SPADCALL |f| (QREFELT $ 9)) #26#)
                              . #27#)))
                      (LETT #25# (CDR #25#) . #27#) (GO G190) G191
                      (EXIT (NREVERSE #26#))))
                . #27#)
          (LETT |n|
                (PROGN
                 (LETT #21# NIL . #27#)
                 (SEQ (LETT |df| NIL . #27#) (LETT #24# |ldeg| . #27#) G190
                      (COND
                       ((OR (ATOM #24#)
                            (PROGN (LETT |df| (CAR #24#) . #27#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #23# |df| . #27#)
                         (COND (#21# (LETT #22# (+ #22# #23#) . #27#))
                               ('T
                                (PROGN
                                 (LETT #22# #23# . #27#)
                                 (LETT #21# 'T . #27#)))))))
                      (LETT #24# (CDR #24#) . #27#) (GO G190) G191 (EXIT NIL))
                 (COND (#21# #22#) (#28='T 0)))
                . #27#)
          (LETT |normlist|
                (PROGN
                 (LETT #19# NIL . #27#)
                 (SEQ (LETT |f| NIL . #27#) (LETT #18# |listpolys| . #27#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |f| (CAR #18#) . #27#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #19#
                              (CONS
                               (PROGN
                                (LETT #14# NIL . #27#)
                                (SEQ (LETT |u| NIL . #27#)
                                     (LETT #17# (SPADCALL |f| (QREFELT $ 11))
                                           . #27#)
                                     G190
                                     (COND
                                      ((OR (ATOM #17#)
                                           (PROGN
                                            (LETT |u| (CAR #17#) . #27#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #16#
                                              (SPADCALL
                                               (SPADCALL |u| (QREFELT $ 12)) 2
                                               (QREFELT $ 14))
                                              . #27#)
                                        (COND
                                         (#14#
                                          (LETT #15# (+ #15# #16#) . #27#))
                                         ('T
                                          (PROGN
                                           (LETT #15# #16# . #27#)
                                           (LETT #14# 'T . #27#)))))))
                                     (LETT #17# (CDR #17#) . #27#) (GO G190)
                                     G191 (EXIT NIL))
                                (COND (#14# #15#) ('T 0)))
                               #19#)
                              . #27#)))
                      (LETT #18# (CDR #18#) . #27#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #27#)
          (LETT |nm|
                (PROGN
                 (LETT #10# NIL . #27#)
                 (SEQ (LETT |u| NIL . #27#)
                      (LETT #13# (SPADCALL |m| (QREFELT $ 11)) . #27#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |u| (CAR #13#) . #27#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #12#
                               (SPADCALL (SPADCALL |u| (QREFELT $ 12)) 2
                                         (QREFELT $ 14))
                               . #27#)
                         (COND (#10# (LETT #11# (+ #11# #12#) . #27#))
                               ('T
                                (PROGN
                                 (LETT #11# #12# . #27#)
                                 (LETT #10# 'T . #27#)))))))
                      (LETT #13# (CDR #13#) . #27#) (GO G190) G191 (EXIT NIL))
                 (COND (#10# #11#) (#28# 0)))
                . #27#)
          (LETT |normprod|
                (PROGN
                 (LETT #3# NIL . #27#)
                 (SEQ (LETT |df| NIL . #27#) (LETT #8# |ldeg| . #27#)
                      (LETT |g| NIL . #27#) (LETT #7# |normlist| . #27#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#) . #27#) NIL)
                            (ATOM #8#)
                            (PROGN (LETT |df| (CAR #8#) . #27#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5#
                               (EXPT |g|
                                     (PROG1 (LETT #6# (- |n| |df|) . #27#)
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #6#)))
                               . #27#)
                         (COND (#3# (LETT #4# (* #4# #5#) . #27#))
                               ('T
                                (PROGN
                                 (LETT #4# #5# . #27#)
                                 (LETT #3# 'T . #27#)))))))
                      (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #27#))
                            . #27#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#3# #4#) (#28# 1)))
                . #27#)
          (EXIT
           (SPADCALL 2
                     (PROG1
                         (LETT #1#
                               (SPADCALL (* |normprod| |nm|) (QREFELT $ 17))
                               . #27#)
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 18)))))) 

(SDEFUN |GENEEZ;compBound;BPLNni;2|
        ((|m| BP) (|listpolys| |List| BP) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G737 NIL) (#2=#:G736 #3=(|NonNegativeInteger|)) (#4=#:G738 #3#)
          (#5=#:G740 NIL) (#6=#:G739 #3#) (#7=#:G741 #3#) (#8=#:G745 NIL)
          (|u| NIL) (#9=#:G744 NIL) (|p| NIL) (#10=#:G734 NIL) (#11=#:G733 #3#)
          (#12=#:G735 #3#) (#13=#:G743 NIL))
         (SEQ
          (+
           (PROGN
            (LETT #10# NIL . #14=(|GENEEZ;compBound;BPLNni;2|))
            (SEQ (LETT |u| NIL . #14#)
                 (LETT #13# (SPADCALL |m| (QREFELT $ 11)) . #14#) G190
                 (COND
                  ((OR (ATOM #13#) (PROGN (LETT |u| (CAR #13#) . #14#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #12# (SPADCALL |u| (QREFELT $ 12)) . #14#)
                    (COND (#10# (LETT #11# (MAX #11# #12#) . #14#))
                          ('T
                           (PROGN
                            (LETT #11# #12# . #14#)
                            (LETT #10# 'T . #14#)))))))
                 (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
            (COND (#10# #11#) (#15='T (|IdentityError| '|max|))))
           (PROGN
            (LETT #1# NIL . #14#)
            (SEQ (LETT |p| NIL . #14#) (LETT #9# |listpolys| . #14#) G190
                 (COND
                  ((OR (ATOM #9#) (PROGN (LETT |p| (CAR #9#) . #14#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (PROGN
                           (LETT #5# NIL . #14#)
                           (SEQ (LETT |u| NIL . #14#)
                                (LETT #8# (SPADCALL |p| (QREFELT $ 11)) . #14#)
                                G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |u| (CAR #8#) . #14#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7# (SPADCALL |u| (QREFELT $ 12))
                                         . #14#)
                                   (COND (#5# (LETT #6# (MAX #6# #7#) . #14#))
                                         ('T
                                          (PROGN
                                           (LETT #6# #7# . #14#)
                                           (LETT #5# 'T . #14#)))))))
                                (LETT #8# (CDR #8#) . #14#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#5# #6#) ('T (|IdentityError| '|max|))))
                          . #14#)
                    (COND (#1# (LETT #2# (+ #2# #4#) . #14#))
                          ('T
                           (PROGN
                            (LETT #2# #4# . #14#)
                            (LETT #1# 'T . #14#)))))))
                 (LETT #9# (CDR #9#) . #14#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) (#15# 0))))))) 

(PUT '|GENEEZ;compBound;BPLNni;3| '|SPADreplace|
     '(XLAM (|m| |listpolys|)
       (|error|
        "attempt to use compBound without a well-understood valuation"))) 

(SDEFUN |GENEEZ;compBound;BPLNni;3|
        ((|m| BP) (|listpolys| |List| BP) ($ |NonNegativeInteger|))
        (|error|
         "attempt to use compBound without a well-understood valuation")) 

(SDEFUN |GENEEZ;reduction;BPRBP;4| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|GENEEZ;reduction;BPRBP;4!0| (VECTOR $ |p|)) |u|
                       (QREFELT $ 27)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;4!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|GENEEZ;reduction;BPRBP;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 25)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;5| ((|u| BP) (|p| R) ($ BP))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|GENEEZ;reduction;BPRBP;5!0| (VECTOR $ |p|)) |u|
                       (QREFELT $ 27)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| $)
          (LETT |p| (QREFELT $$ 1) . #1=(|GENEEZ;reduction;BPRBP;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT $ 29)))))) 

(SDEFUN |GENEEZ;merge| ((|p| R) (|q| R) ($ |Union| R "failed"))
        (COND ((SPADCALL |p| |q| (QREFELT $ 24)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| $ 21) (QREFELT $ 24))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| $ 21) (QREFELT $ 24))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |GENEEZ;modInverse| ((|c| R) (|p| R) ($ R))
        (SPROG ((#1=#:G757 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| $ 30)
                                    (QREFELT $ 34))
                          |GENEEZ;modInverse|)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT $ 6))
                                            (|:| |coef2| (QREFELT $ 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT $ 6))
                                             (|:| |coef2| (QREFELT $ 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |GENEEZ;exactquo| ((|u| BP) (|v| BP) (|p| R) ($ |Union| BP "failed"))
        (SPROG
         ((|r| (|Record| (|:| |quotient| BP) (|:| |remainder| BP)))
          (|invlcv| (R)))
         (SEQ
          (LETT |invlcv|
                (|GENEEZ;modInverse| (SPADCALL |v| (QREFELT $ 35)) |p| $)
                . #1=(|GENEEZ;exactquo|))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT $ 36)) |p|
                                    (QREFELT $ 28))
                          (QREFELT $ 38))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT $ 28))
                       (|spadConstant| $ 22) (QREFELT $ 39))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT $ 36)) |p|
                             (QREFELT $ 28))))))))) 

(SDEFUN |GENEEZ;reduceList| ((|lp| |List| BP) (|lmod| R) ($ |List| FP))
        (SPROG ((#1=#:G783 NIL) (|ff| NIL) (#2=#:G782 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GENEEZ;reduceList|))
                 (SEQ (LETT |ff| NIL . #3#) (LETT #1# |lp| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |ff| |lmod| (QREFELT $ 41)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GENEEZ;coerceLFP| ((|lf| |List| FP) ($ |List| BP))
        (SPROG ((#1=#:G787 NIL) (|fm| NIL) (#2=#:G786 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GENEEZ;coerceLFP|))
                 (SEQ (LETT |fm| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |fm| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |fm| (QREFELT $ 42)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GENEEZ;liftSol|
        ((|oldsol| |List| BP) (|err| BP) (|lmod| R) (|lmodk| R)
         (|lpolys| |List| BP) (|ftab| |Vector| (|List| FP)) (|m| BP)
         (|bound| |NonNegativeInteger|) ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((#1=#:G761 NIL) (#2=#:G805 NIL) (|fs| (BP)) (#3=#:G798 NIL)
          (#4=#:G797 (BP)) (#5=#:G799 (BP)) (#6=#:G817 NIL) (|f| NIL)
          (#7=#:G818 NIL) (|g| NIL) (|nsol| (|List| BP)) (#8=#:G816 NIL)
          (|slp| NIL) (#9=#:G815 NIL) (#10=#:G813 NIL) (#11=#:G814 NIL)
          (#12=#:G812 NIL) (|sln| (|List| FP)) (#13=#:G810 NIL) (|pp| NIL)
          (#14=#:G811 NIL) (#15=#:G809 NIL) (|cc| (R)) (#16=#:G808 NIL)
          (|i| NIL) (#17=#:G807 NIL) (|xx| NIL) (#18=#:G806 NIL)
          (|d| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |lmodk| (QREFELT $ 12)) |bound|
                              (QREFELT $ 43))
                    (PROGN
                     (LETT #2# (CONS 1 "failed") . #19=(|GENEEZ;liftSol|))
                     (GO #20=#:G804)))
                   ('T
                    (SEQ (LETT |d| (SPADCALL |err| (QREFELT $ 9)) . #19#)
                         (LETT |sln|
                               (PROGN
                                (LETT #18# NIL . #19#)
                                (SEQ (LETT |xx| NIL . #19#)
                                     (LETT #17#
                                           (SPADCALL |ftab| 1 (QREFELT $ 46))
                                           . #19#)
                                     G190
                                     (COND
                                      ((OR (ATOM #17#)
                                           (PROGN
                                            (LETT |xx| (CAR #17#) . #19#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #18#
                                             (CONS (|spadConstant| $ 47) #18#)
                                             . #19#)))
                                     (LETT #17# (CDR #17#) . #19#) (GO G190)
                                     G191 (EXIT (NREVERSE #18#))))
                               . #19#)
                         (SEQ (LETT |i| 0 . #19#) (LETT #16# |d| . #19#) G190
                              (COND ((|greater_SI| |i| #16#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |cc|
                                         (SPADCALL |err| |i| (QREFELT $ 48))
                                         . #19#)
                                   (|spadConstant| $ 21) (QREFELT $ 49))
                                  (LETT |sln|
                                        (PROGN
                                         (LETT #15# NIL . #19#)
                                         (SEQ (LETT |slp| NIL . #19#)
                                              (LETT #14# |sln| . #19#)
                                              (LETT |pp| NIL . #19#)
                                              (LETT #13#
                                                    (SPADCALL |ftab| (+ |i| 1)
                                                              (QREFELT $ 46))
                                                    . #19#)
                                              G190
                                              (COND
                                               ((OR (ATOM #13#)
                                                    (PROGN
                                                     (LETT |pp| (CAR #13#)
                                                           . #19#)
                                                     NIL)
                                                    (ATOM #14#)
                                                    (PROGN
                                                     (LETT |slp| (CAR #14#)
                                                           . #19#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #15#
                                                      (CONS
                                                       (SPADCALL |slp|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |cc|
                                                                    (QREFELT $
                                                                             50))
                                                                   |lmod|
                                                                   (QREFELT $
                                                                            41))
                                                                  |pp|
                                                                  (QREFELT $
                                                                           51))
                                                                 (QREFELT $
                                                                          52))
                                                       #15#)
                                                      . #19#)))
                                              (LETT #13#
                                                    (PROG1 (CDR #13#)
                                                      (LETT #14# (CDR #14#)
                                                            . #19#))
                                                    . #19#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #15#))))
                                        . #19#)))))
                              (LETT |i| (|inc_SI| |i|) . #19#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |nsol|
                               (PROGN
                                (LETT #12# NIL . #19#)
                                (SEQ (LETT |g| NIL . #19#)
                                     (LETT #11# |sln| . #19#)
                                     (LETT |f| NIL . #19#)
                                     (LETT #10# |oldsol| . #19#) G190
                                     (COND
                                      ((OR (ATOM #10#)
                                           (PROGN
                                            (LETT |f| (CAR #10#) . #19#)
                                            NIL)
                                           (ATOM #11#)
                                           (PROGN
                                            (LETT |g| (CAR #11#) . #19#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #12#
                                             (CONS
                                              (SPADCALL |f|
                                                        (SPADCALL |lmodk|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |g|
                                                                    (QREFELT $
                                                                             42))
                                                                   |lmod|
                                                                   (QREFELT $
                                                                            28))
                                                                  (QREFELT $
                                                                           36))
                                                        (QREFELT $ 53))
                                              #12#)
                                             . #19#)))
                                     (LETT #10#
                                           (PROG1 (CDR #10#)
                                             (LETT #11# (CDR #11#) . #19#))
                                           . #19#)
                                     (GO G190) G191 (EXIT (NREVERSE #12#))))
                               . #19#)
                         (LETT |lmodk| (SPADCALL |lmod| |lmodk| (QREFELT $ 54))
                               . #19#)
                         (LETT |nsol|
                               (PROGN
                                (LETT #9# NIL . #19#)
                                (SEQ (LETT |slp| NIL . #19#)
                                     (LETT #8# |nsol| . #19#) G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN
                                            (LETT |slp| (CAR #8#) . #19#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #9#
                                             (CONS
                                              (SPADCALL |slp| |lmodk|
                                                        (QREFELT $ 28))
                                              #9#)
                                             . #19#)))
                                     (LETT #8# (CDR #8#) . #19#) (GO G190) G191
                                     (EXIT (NREVERSE #9#))))
                               . #19#)
                         (LETT |fs|
                               (PROGN
                                (LETT #3# NIL . #19#)
                                (SEQ (LETT |g| NIL . #19#)
                                     (LETT #7# |nsol| . #19#)
                                     (LETT |f| NIL . #19#)
                                     (LETT #6# |lpolys| . #19#) G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN
                                            (LETT |f| (CAR #6#) . #19#)
                                            NIL)
                                           (ATOM #7#)
                                           (PROGN
                                            (LETT |g| (CAR #7#) . #19#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #5#
                                              (SPADCALL |f| |g| (QREFELT $ 55))
                                              . #19#)
                                        (COND
                                         (#3#
                                          (LETT #4#
                                                (SPADCALL #4# #5#
                                                          (QREFELT $ 56))
                                                . #19#))
                                         ('T
                                          (PROGN
                                           (LETT #4# #5# . #19#)
                                           (LETT #3# 'T . #19#)))))))
                                     (LETT #6#
                                           (PROG1 (CDR #6#)
                                             (LETT #7# (CDR #7#) . #19#))
                                           . #19#)
                                     (GO G190) G191 (EXIT NIL))
                                (COND (#3# #4#) ('T (|spadConstant| $ 22))))
                               . #19#)
                         (EXIT
                          (COND
                           ((SPADCALL |fs| |m| (QREFELT $ 57))
                            (PROGN
                             (LETT #2# (CONS 0 |nsol|) . #19#)
                             (GO #20#)))
                           ('T
                            (SEQ
                             (LETT |err|
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL |fs| |m|
                                                        (QREFELT $ 53))
                                              |lmodk| (QREFELT $ 59))
                                             . #19#)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT $ 7)
                                                     (|Union| (QREFELT $ 7)
                                                              "failed")
                                                     #1#))
                                   . #19#)
                             (EXIT (LETT |oldsol| |nsol| . #19#)))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #20# (EXIT #2#)))) 

(SDEFUN |GENEEZ;makeProducts| ((|listPol| |List| BP) ($ |List| BP))
        (SPROG
         ((#1=#:G833 NIL) (|g| NIL) (#2=#:G832 NIL) (#3=#:G824 NIL)
          (#4=#:G823 (BP)) (#5=#:G825 (BP)) (#6=#:G831 NIL) (#7=#:G690 NIL)
          (|ll| (|List| BP)) (|f| (BP)))
         (SEQ
          (COND ((< (LENGTH |listPol|) 2) |listPol|)
                ((EQL (LENGTH |listPol|) 2) (REVERSE |listPol|))
                (#8='T
                 (SEQ
                  (LETT |f| (|SPADfirst| |listPol|)
                        . #9=(|GENEEZ;makeProducts|))
                  (LETT |ll| (CDR |listPol|) . #9#)
                  (EXIT
                   (CONS
                    (PROGN
                     (LETT #3# NIL . #9#)
                     (SEQ (LETT #7# NIL . #9#) (LETT #6# |ll| . #9#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT #7# (CAR #6#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5# #7# . #9#)
                             (COND
                              (#3#
                               (LETT #4# (SPADCALL #4# #5# (QREFELT $ 55))
                                     . #9#))
                              ('T
                               (PROGN
                                (LETT #4# #5# . #9#)
                                (LETT #3# 'T . #9#)))))))
                          (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
                     (COND (#3# #4#) (#8# (|spadConstant| $ 31))))
                    (PROGN
                     (LETT #2# NIL . #9#)
                     (SEQ (LETT |g| NIL . #9#)
                          (LETT #1# (|GENEEZ;makeProducts| |ll| $) . #9#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |g| (CAR #1#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |f| |g| (QREFELT $ 55)) #2#)
                                  . #9#)))
                          (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |GENEEZ;testModulus;RLB;13|
        ((|pmod| R) (|listPol| |List| BP) ($ |Boolean|))
        (SPROG
         ((#1=#:G843 NIL) (#2=#:G845 NIL) (#3=#:G848 NIL) (|rpol2| NIL)
          (|redListPol| (|List| FP)) (|rpol| (FP)) (#4=#:G844 NIL)
          (#5=#:G846 NIL) (|pol| NIL) (#6=#:G847 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |redListPol| (|GENEEZ;reduceList| |listPol| |pmod| $)
                  . #7=(|GENEEZ;testModulus;RLB;13|))
            (SEQ
             (EXIT
              (SEQ (LETT |rpol| NIL . #7#) (LETT #6# |redListPol| . #7#)
                   (LETT |pol| NIL . #7#) (LETT #5# |listPol| . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |pol| (CAR #5#) . #7#) NIL)
                         (ATOM #6#) (PROGN (LETT |rpol| (CAR #6#) . #7#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pol| (QREFELT $ 9))
                                 (SPADCALL (SPADCALL |rpol| (QREFELT $ 42))
                                           (QREFELT $ 9))
                                 (QREFELT $ 60))
                       (PROGN
                        (LETT #4# (PROGN (LETT #2# NIL . #7#) (GO #8=#:G842))
                              . #7#)
                        (GO #9=#:G835))))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL)))
             #9# (EXIT #4#))
            (SEQ G190 (COND ((NULL (NULL (NULL |redListPol|))) (GO G191)))
                 (SEQ (LETT |rpol| (|SPADfirst| |redListPol|) . #7#)
                      (LETT |redListPol| (CDR |redListPol|) . #7#)
                      (EXIT
                       (SEQ
                        (EXIT
                         (SEQ (LETT |rpol2| NIL . #7#)
                              (LETT #3# |redListPol| . #7#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |rpol2| (CAR #3#) . #7#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |rpol| |rpol2| (QREFELT $ 61))
                                   (|spadConstant| $ 62) (QREFELT $ 63))
                                  (PROGN
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL . #7#) (GO #8#))
                                         . #7#)
                                   (GO #10=#:G838))))))
                              (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                              (EXIT NIL)))
                        #10# (EXIT #1#))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #8# (EXIT #2#)))) 

(SDEFUN |GENEEZ;tablePow;NniRLU;14|
        ((|mdeg| |NonNegativeInteger|) (|pmod| R) (|listPol| |List| BP)
         ($ |Union| (|Vector| (|List| BP)) "failed"))
        (SPROG
         ((#1=#:G862 NIL) (|tpol| NIL) (#2=#:G863 NIL) (|fpol| NIL)
          (#3=#:G861 NIL) (#4=#:G860 NIL) (|i| NIL) (|x| (BP))
          (|ptable| (|Vector| (|List| BP)))
          (|multiE| (|Union| (|List| BP) "failed")))
         (SEQ
          (LETT |multiE|
                (SPADCALL |listPol| (|spadConstant| $ 31) (QREFELT $ 67))
                . #5=(|GENEEZ;tablePow;NniRLU;14|))
          (EXIT
           (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ptable| (MAKEARR1 (+ |mdeg| 1) NIL) . #5#)
                       (SPADCALL |ptable| 1 (QCDR |multiE|) (QREFELT $ 69))
                       (LETT |x|
                             (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 70))
                             . #5#)
                       (SEQ (LETT |i| 2 . #5#) (LETT #4# |mdeg| . #5#) G190
                            (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ptable| |i|
                                        (PROGN
                                         (LETT #3# NIL . #5#)
                                         (SEQ (LETT |fpol| NIL . #5#)
                                              (LETT #2# |listPol| . #5#)
                                              (LETT |tpol| NIL . #5#)
                                              (LETT #1#
                                                    (SPADCALL |ptable|
                                                              (- |i| 1)
                                                              (QREFELT $ 71))
                                                    . #5#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |tpol| (CAR #1#)
                                                           . #5#)
                                                     NIL)
                                                    (ATOM #2#)
                                                    (PROGN
                                                     (LETT |fpol| (CAR #2#)
                                                           . #5#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #3#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |tpol| |x|
                                                                  (QREFELT $
                                                                           55))
                                                        |fpol| (QREFELT $ 72))
                                                       #3#)
                                                      . #5#)))
                                              (LETT #1#
                                                    (PROG1 (CDR #1#)
                                                      (LETT #2# (CDR #2#)
                                                            . #5#))
                                                    . #5#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #3#))))
                                        (QREFELT $ 69))))
                            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                            (EXIT NIL))
                       (SPADCALL |ptable| (+ |mdeg| 1)
                                 (|GENEEZ;makeProducts| |listPol| $)
                                 (QREFELT $ 69))
                       (EXIT (CONS 0 |ptable|))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;15|
        ((|m| BP) (|pmod| R) (|table| |Vector| (|List| BP))
         ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((|sln| (|List| BP)) (#1=#:G876 NIL) (|pp| NIL) (#2=#:G877 NIL)
          (|slp| NIL) (#3=#:G875 NIL) (#4=#:G874 NIL) (|i| NIL) (#5=#:G873 NIL)
          (|xx| NIL) (#6=#:G872 NIL) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (SPADCALL |m| (QREFELT $ 9))
                . #7=(|GENEEZ;solveid;BPRVU;15|))
          (LETT |sln|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |xx| NIL . #7#)
                      (LETT #5# (SPADCALL |table| 1 (QREFELT $ 71)) . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |xx| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (|spadConstant| $ 22) #6#) . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (SEQ (LETT |i| 0 . #7#) (LETT #4# |d| . #7#) G190
               (COND ((|greater_SI| |i| #4#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 48))
                             (|spadConstant| $ 21) (QREFELT $ 49))
                   (LETT |sln|
                         (PROGN
                          (LETT #3# NIL . #7#)
                          (SEQ (LETT |slp| NIL . #7#) (LETT #2# |sln| . #7#)
                               (LETT |pp| NIL . #7#)
                               (LETT #1#
                                     (SPADCALL |table| (+ |i| 1)
                                               (QREFELT $ 71))
                                     . #7#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |pp| (CAR #1#) . #7#) NIL)
                                     (ATOM #2#)
                                     (PROGN (LETT |slp| (CAR #2#) . #7#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (SPADCALL |slp|
                                                  (SPADCALL
                                                   (SPADCALL |m| |i|
                                                             (QREFELT $ 48))
                                                   |pp| (QREFELT $ 36))
                                                  (QREFELT $ 56))
                                        #3#)
                                       . #7#)))
                               (LETT #1#
                                     (PROG1 (CDR #1#)
                                       (LETT #2# (CDR #2#) . #7#))
                                     . #7#)
                               (GO G190) G191 (EXIT (NREVERSE #3#))))
                         . #7#)))))
               (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 0 |sln|))))) 

(SDEFUN |GENEEZ;tablePow;NniRLU;16|
        ((|mdeg| |NonNegativeInteger|) (|pmod| R) (|listPol| |List| BP)
         ($ |Union| (|Vector| (|List| BP)) "failed"))
        (SPROG
         ((|ptable| (|Vector| (|List| BP))) (#1=#:G895 NIL) (|tpol| NIL)
          (#2=#:G896 NIL) (|fpol| NIL) (#3=#:G894 NIL) (#4=#:G893 NIL)
          (|i| NIL) (|x| (FP)) (|fl| (|List| FP))
          (|ftable| (|Vector| (|List| FP)))
          (|multiE| (|Union| (|List| FP) "failed")) (|listP| (|List| FP))
          (#5=#:G892 NIL) (|pol| NIL) (#6=#:G891 NIL))
         (SEQ
          (LETT |listP|
                (PROGN
                 (LETT #6# NIL . #7=(|GENEEZ;tablePow;NniRLU;16|))
                 (SEQ (LETT |pol| NIL . #7#) (LETT #5# |listPol| . #7#) G190
                      (COND
                       ((OR (ATOM #5#)
                            (PROGN (LETT |pol| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL |pol| |pmod| (QREFELT $ 41)) #6#)
                              . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |multiE|
                (SPADCALL |listP| (|spadConstant| $ 62) (QREFELT $ 77)) . #7#)
          (EXIT
           (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ftable| (MAKEARR1 (+ |mdeg| 1) NIL) . #7#)
                       (LETT |fl| (QCDR |multiE|) . #7#)
                       (SPADCALL |ftable| 1 |fl| (QREFELT $ 78))
                       (LETT |x|
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 30) 1 (QREFELT $ 70))
                              |pmod| (QREFELT $ 41))
                             . #7#)
                       (SEQ (LETT |i| 2 . #7#) (LETT #4# |mdeg| . #7#) G190
                            (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ftable| |i|
                                        (PROGN
                                         (LETT #3# NIL . #7#)
                                         (SEQ (LETT |fpol| NIL . #7#)
                                              (LETT #2# |listP| . #7#)
                                              (LETT |tpol| NIL . #7#)
                                              (LETT #1#
                                                    (SPADCALL |ftable|
                                                              (- |i| 1)
                                                              (QREFELT $ 46))
                                                    . #7#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |tpol| (CAR #1#)
                                                           . #7#)
                                                     NIL)
                                                    (ATOM #2#)
                                                    (PROGN
                                                     (LETT |fpol| (CAR #2#)
                                                           . #7#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #3#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |tpol| |x|
                                                                  (QREFELT $
                                                                           51))
                                                        |fpol| (QREFELT $ 79))
                                                       #3#)
                                                      . #7#)))
                                              (LETT #1#
                                                    (PROG1 (CDR #1#)
                                                      (LETT #2# (CDR #2#)
                                                            . #7#))
                                                    . #7#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #3#))))
                                        (QREFELT $ 78))))
                            (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |ptable|
                             (SPADCALL (CONS (|function| |GENEEZ;coerceLFP|) $)
                                       |ftable| (QREFELT $ 82))
                             . #7#)
                       (SPADCALL |ptable| (+ |mdeg| 1)
                                 (|GENEEZ;makeProducts| |listPol| $)
                                 (QREFELT $ 69))
                       (EXIT (CONS 0 |ptable|))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;17|
        ((|m| BP) (|pmod| R) (|table| |Vector| (|List| BP))
         ($ |Union| (|List| BP) "failed"))
        (SPROG
         ((|a| (BP)) (#1=#:G761 NIL) (|bound| (|NonNegativeInteger|))
          (|fs| (BP)) (#2=#:G903 NIL) (#3=#:G902 (BP)) (#4=#:G904 (BP))
          (#5=#:G916 NIL) (|f| NIL) (#6=#:G917 NIL) (|g| NIL)
          (|soln| (|List| BP)) (#7=#:G915 NIL) (|slp| NIL) (#8=#:G914 NIL)
          (|sln| (|List| FP)) (#9=#:G912 NIL) (|pp| NIL) (#10=#:G913 NIL)
          (#11=#:G911 NIL) (#12=#:G910 NIL) (|i| NIL) (#13=#:G909 NIL)
          (|xx| NIL) (#14=#:G908 NIL) (|lpolys| (|List| BP))
          (|ftab| (|Vector| (|List| FP))) (|d| (|NonNegativeInteger|)))
         (SEQ
          (LETT |d| (SPADCALL |m| (QREFELT $ 9))
                . #15=(|GENEEZ;solveid;BPRVU;17|))
          (LETT |ftab|
                (SPADCALL
                 (CONS #'|GENEEZ;solveid;BPRVU;17!0| (VECTOR $ |pmod|)) |table|
                 (QREFELT $ 85))
                . #15#)
          (LETT |lpolys| (SPADCALL |table| (QVSIZE |table|) (QREFELT $ 71))
                . #15#)
          (LETT |sln|
                (PROGN
                 (LETT #14# NIL . #15#)
                 (SEQ (LETT |xx| NIL . #15#)
                      (LETT #13# (SPADCALL |ftab| 1 (QREFELT $ 46)) . #15#)
                      G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |xx| (CAR #13#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14# (CONS (|spadConstant| $ 47) #14#) . #15#)))
                      (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #15#)
          (SEQ (LETT |i| 0 . #15#) (LETT #12# |d| . #15#) G190
               (COND ((|greater_SI| |i| #12#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |m| |i| (QREFELT $ 48))
                             (|spadConstant| $ 21) (QREFELT $ 49))
                   (LETT |sln|
                         (PROGN
                          (LETT #11# NIL . #15#)
                          (SEQ (LETT |slp| NIL . #15#) (LETT #10# |sln| . #15#)
                               (LETT |pp| NIL . #15#)
                               (LETT #9#
                                     (SPADCALL |ftab| (+ |i| 1) (QREFELT $ 46))
                                     . #15#)
                               G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |pp| (CAR #9#) . #15#) NIL)
                                     (ATOM #10#)
                                     (PROGN
                                      (LETT |slp| (CAR #10#) . #15#)
                                      NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (SPADCALL |slp|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |m| |i|
                                                               (QREFELT $ 48))
                                                     (QREFELT $ 50))
                                                    |pmod| (QREFELT $ 41))
                                                   |pp| (QREFELT $ 51))
                                                  (QREFELT $ 52))
                                        #11#)
                                       . #15#)))
                               (LETT #9#
                                     (PROG1 (CDR #9#)
                                       (LETT #10# (CDR #10#) . #15#))
                                     . #15#)
                               (GO G190) G191 (EXIT (NREVERSE #11#))))
                         . #15#)))))
               (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191 (EXIT NIL))
          (LETT |soln|
                (PROGN
                 (LETT #8# NIL . #15#)
                 (SEQ (LETT |slp| NIL . #15#) (LETT #7# |sln| . #15#) G190
                      (COND
                       ((OR (ATOM #7#)
                            (PROGN (LETT |slp| (CAR #7#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (SPADCALL |slp| (QREFELT $ 42)) #8#)
                              . #15#)))
                      (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #15#)
          (LETT |fs|
                (PROGN
                 (LETT #2# NIL . #15#)
                 (SEQ (LETT |g| NIL . #15#) (LETT #6# |soln| . #15#)
                      (LETT |f| NIL . #15#) (LETT #5# |lpolys| . #15#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#) . #15#) NIL)
                            (ATOM #6#) (PROGN (LETT |g| (CAR #6#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL |f| |g| (QREFELT $ 55)) . #15#)
                         (COND
                          (#2#
                           (LETT #3# (SPADCALL #3# #4# (QREFELT $ 56)) . #15#))
                          ('T
                           (PROGN
                            (LETT #3# #4# . #15#)
                            (LETT #2# 'T . #15#)))))))
                      (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #15#))
                            . #15#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) (#16='T (|spadConstant| $ 22))))
                . #15#)
          (EXIT
           (COND ((SPADCALL |fs| |m| (QREFELT $ 57)) (CONS 0 |soln|))
                 (#16#
                  (SEQ
                   (LETT |bound| (SPADCALL |m| |lpolys| (QREFELT $ 20)) . #15#)
                   (LETT |a|
                         (PROG2
                             (LETT #1#
                                   (SPADCALL (SPADCALL |fs| |m| (QREFELT $ 53))
                                             |pmod| (QREFELT $ 59))
                                   . #15#)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                           (|Union| (QREFELT $ 7) "failed")
                                           #1#))
                         . #15#)
                   (EXIT
                    (|GENEEZ;liftSol| |soln| |a| |pmod| |pmod| |lpolys| |ftab|
                     |m| |bound| $))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;17!0| ((|x| NIL) ($$ NIL))
        (PROG (|pmod| $)
          (LETT |pmod| (QREFELT $$ 1) . #1=(|GENEEZ;solveid;BPRVU;17|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|GENEEZ;reduceList| |x| |pmod| $))))) 

(DECLAIM (NOTINLINE |GenExEuclid;|)) 

(DEFUN |GenExEuclid| (&REST #1=#:G918)
  (SPROG NIL
         (PROG (#2=#:G919)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenExEuclid|)
                                               '|domainEqualList|)
                    . #3=(|GenExEuclid|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GenExEuclid;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GenExEuclid|)))))))))) 

(DEFUN |GenExEuclid;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GenExEuclid|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|GenExEuclid| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 86) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GenExEuclid| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|multiplicativeValuation|))
            (QSETREFV $ 20
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;1|)
                            $)))
           ((|HasCategory| |#1| '(|additiveValuation|))
            (QSETREFV $ 20
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;2|)
                            $)))
           ('T
            (QSETREFV $ 20
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;3|)
                            $))))
          (COND
           ((|HasCategory| |#1| '(|IntegerNumberSystem|))
            (QSETREFV $ 28
                      (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;4|)
                            $)))
           ('T
            (QSETREFV $ 28
                      (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;5|)
                            $))))
          (QSETREFV $ 40
                    (|EuclideanModularRing| |#1| |#2| |#1| (ELT $ 28)
                                            (CONS (|function| |GENEEZ;merge|)
                                                  $)
                                            (CONS
                                             (|function| |GENEEZ;exactquo|)
                                             $)))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;14|)
                             $))
             (QSETREFV $ 76
                       (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;15|)
                             $))))
           ('T
            (PROGN
             (QSETREFV $ 74
                       (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;16|)
                             $))
             (QSETREFV $ 76
                       (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;17|)
                             $)))))
          $))) 

(MAKEPROP '|GenExEuclid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |degree|) (|List| 6)
              (5 . |coefficients|) (10 . |euclideanSize|) (|PositiveInteger|)
              (15 . ^) (|Integer|) (|IntegerRoots| 15) (21 . |approxSqrt|)
              (26 . *) (|List| 7) (32 . |compBound|) (38 . |Zero|)
              (42 . |Zero|) (|Boolean|) (46 . =) (52 . |symmetricRemainder|)
              (|Mapping| 6 6) (58 . |map|) (64 . |reduction|) (70 . |rem|)
              (76 . |One|) (80 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 32 '#1="failed") (84 . |extendedEuclidean|)
              (91 . |leadingCoefficient|) (96 . *)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (102 . |monicDivide|) (108 . ~=) 'FP (114 . |reduce|)
              (120 . |coerce|) (125 . >) (|List| 40) (|Vector| 44)
              (131 . |elt|) (137 . |Zero|) (141 . |coefficient|) (147 . ~=)
              (153 . |coerce|) (158 . *) (164 . +) (170 . -) (176 . *)
              (182 . *) (188 . +) (194 . =) (|Union| $ '"failed")
              (200 . |exquo|) (206 . ~=) (212 . |gcd|) (218 . |One|) (222 . ~=)
              |GENEEZ;testModulus;RLB;13| (|Union| 66 '#1#) (|List| $)
              (228 . |multiEuclidean|) (|Vector| 19) (234 . |setelt!|)
              (241 . |monomial|) (247 . |elt|) (253 . |rem|)
              (|Union| 68 '"failed") (259 . |tablePow|) (|Union| 19 '"failed")
              (266 . |solveid|) (273 . |multiEuclidean|) (279 . |setelt!|)
              (286 . |rem|) (|Mapping| 19 44) (|VectorFunctions2| 44 19)
              (292 . |map|) (|Mapping| 44 19) (|VectorFunctions2| 19 44)
              (298 . |map|))
           '#(|testModulus| 304 |tablePow| 310 |solveid| 317 |reduction| 324
              |compBound| 330)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 85
                                                 '(1 7 8 0 9 1 7 10 0 11 1 6 8
                                                   0 12 2 8 0 0 13 14 1 16 15
                                                   15 17 2 8 0 13 0 18 2 0 8 7
                                                   19 20 0 6 0 21 0 7 0 22 2 6
                                                   23 0 0 24 2 6 0 0 0 25 2 7 0
                                                   26 0 27 2 0 7 7 6 28 2 6 0 0
                                                   0 29 0 6 0 30 0 7 0 31 3 6
                                                   33 0 0 0 34 1 7 6 0 35 2 7 0
                                                   6 0 36 2 7 37 0 0 38 2 7 23
                                                   0 0 39 2 40 0 7 6 41 1 40 7
                                                   0 42 2 8 23 0 0 43 2 45 44 0
                                                   15 46 0 40 0 47 2 7 6 0 8 48
                                                   2 6 23 0 0 49 1 7 0 6 50 2
                                                   40 0 0 0 51 2 40 0 0 0 52 2
                                                   7 0 0 0 53 2 6 0 0 0 54 2 7
                                                   0 0 0 55 2 7 0 0 0 56 2 7 23
                                                   0 0 57 2 7 58 0 6 59 2 8 23
                                                   0 0 60 2 40 0 0 0 61 0 40 0
                                                   62 2 40 23 0 0 63 2 7 65 66
                                                   0 67 3 68 19 0 15 19 69 2 7
                                                   0 6 8 70 2 68 19 0 15 71 2 7
                                                   0 0 0 72 3 0 73 8 6 19 74 3
                                                   0 75 7 6 68 76 2 40 65 66 0
                                                   77 3 45 44 0 15 44 78 2 40 0
                                                   0 0 79 2 81 68 80 45 82 2 84
                                                   45 83 68 85 2 0 23 6 19 64 3
                                                   0 73 8 6 19 74 3 0 75 7 6 68
                                                   76 2 0 7 7 6 28 2 0 8 7 19
                                                   20)))))
           '|lookupComplete|)) 
