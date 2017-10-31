
(SDEFUN |SIMPC;simplicialComplex;VSL$;1|
        ((|v| VS) (|fs| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG ((|res| (|List| (|OrientedFacet|))) (#1=#:G733 NIL) (|f| NIL))
               (SEQ (LETT |res| NIL . #2=(|SIMPC;simplicialComplex;VSL$;1|))
                    (SEQ (LETT |f| NIL . #2#) (LETT #1# |fs| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |f| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL 1 |f| (QREFELT $ 11))
                                           (QREFELT $ 13))
                                 . #2#)))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |v| |res|))))) 

(SDEFUN |SIMPC;simplicialComplex;VS$;2| ((|v| VS) ($ $))
        (SPROG ((|res| (|List| (|OrientedFacet|))))
               (SEQ (LETT |res| NIL |SIMPC;simplicialComplex;VS$;2|)
                    (EXIT (CONS |v| |res|))))) 

(SDEFUN |SIMPC;simplicialComplex;Dc$;3| ((|dc| |DeltaComplex| VS) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G756 NIL) (|r| NIL)
          (|orf| (|OrientedFacet|)) (|subFacets| (|List| (|OrientedFacet|)))
          (|deleteList| (|List| (|OrientedFacet|)))
          (|subFacet2| (|OrientedFacet|)) (|m| (|Integer|))
          (|subFacet| (|OrientedFacet|)) (|ind| (|NonNegativeInteger|))
          (#2=#:G741 NIL) (#3=#:G755 NIL) (|i| NIL) (#4=#:G754 NIL)
          (|facet| NIL) (#5=#:G753 NIL)
          (|lastMap| (|List| (|List| (|OrientedFacet|)))) (#6=#:G751 NIL)
          (|map| NIL) (#7=#:G752 NIL) (|grade| NIL)
          (|maps| #8=(|List| (|List| (|List| (|Integer|))))) (|vertset| (VS))
          (|dcrep| (|Record| (|:| VERTSET VS) (|:| MAPS #8#))))
         (SEQ (LETT |dcrep| |dc| . #9=(|SIMPC;simplicialComplex;Dc$;3|))
              (LETT |vertset| (QCAR |dcrep|) . #9#)
              (LETT |maps| (QCDR |dcrep|) . #9#) (LETT |res| NIL . #9#)
              (LETT |deleteList| NIL . #9#) (LETT |lastMap| NIL . #9#)
              (SEQ (LETT |grade| 1 . #9#) (LETT #7# (LENGTH |maps|) . #9#)
                   (LETT |map| NIL . #9#) (LETT #6# |maps| . #9#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |map| (CAR #6#) . #9#) NIL)
                         (|greater_SI| |grade| #7#))
                     (GO G191)))
                   (SEQ
                    (LETT |lastMap| (SPADCALL |lastMap| NIL (QREFELT $ 18))
                          . #9#)
                    (COND
                     ((EQL |grade| 1)
                      (SEQ (LETT |facet| NIL . #9#) (LETT #5# |map| . #9#) G190
                           (COND
                            ((OR (ATOM #5#)
                                 (PROGN (LETT |facet| (CAR #5#) . #9#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |orf| (SPADCALL |facet| (QREFELT $ 20))
                                  . #9#)
                            (LETT |res| (SPADCALL |res| |orf| (QREFELT $ 13))
                                  . #9#)
                            (EXIT
                             (SPADCALL |lastMap| |grade|
                                       (SPADCALL
                                        (SPADCALL |lastMap| |grade|
                                                  (QREFELT $ 21))
                                        |orf| (QREFELT $ 13))
                                       (QREFELT $ 22))))
                           (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                           (EXIT NIL))))
                    (EXIT
                     (COND
                      ((SPADCALL |grade| 1 (QREFELT $ 25))
                       (SEQ (LETT |facet| NIL . #9#) (LETT #4# |map| . #9#)
                            G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |facet| (CAR #4#) . #9#) NIL))
                              (GO G191)))
                            (SEQ (LETT |subFacets| NIL . #9#)
                                 (SEQ (LETT |i| NIL . #9#)
                                      (LETT #3# |facet| . #9#) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN
                                             (LETT |i| (CAR #3#) . #9#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |ind|
                                             (PROG1 (LETT #2# (ABS |i|) . #9#)
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             . #9#)
                                       (LETT |subFacet|
                                             (SPADCALL
                                              (SPADCALL |lastMap| (- |grade| 1)
                                                        (QREFELT $ 21))
                                              |ind| (QREFELT $ 26))
                                             . #9#)
                                       (LETT |m| (COND ((< |i| 1) -1) ('T 1))
                                             . #9#)
                                       (LETT |subFacet2|
                                             (SPADCALL |m| |subFacet|
                                                       (QREFELT $ 27))
                                             . #9#)
                                       (LETT |deleteList|
                                             (SPADCALL |deleteList| |subFacet|
                                                       (QREFELT $ 13))
                                             . #9#)
                                       (EXIT
                                        (LETT |subFacets|
                                              (SPADCALL |subFacets| |subFacet2|
                                                        (QREFELT $ 13))
                                              . #9#)))
                                      (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |orf|
                                       (SPADCALL |subFacets| (QREFELT $ 29))
                                       . #9#)
                                 (LETT |res|
                                       (SPADCALL |res| |orf| (QREFELT $ 13))
                                       . #9#)
                                 (EXIT
                                  (SPADCALL |lastMap| |grade|
                                            (SPADCALL
                                             (SPADCALL |lastMap| |grade|
                                                       (QREFELT $ 21))
                                             |orf| (QREFELT $ 13))
                                            (QREFELT $ 22))))
                            (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                            (EXIT NIL))))))
                   (LETT #6#
                         (PROG1 (CDR #6#)
                           (LETT |grade| (|inc_SI| |grade|) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |r| NIL . #9#) (LETT #1# |deleteList| . #9#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res| (SPADCALL |r| |res| (QREFELT $ 30)) . #9#)))
                   (LETT #1# (CDR #1#) . #9#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |vertset| |res|))))) 

(SDEFUN |SIMPC;addSimplex;$Of$;4| ((|a| $) (|f| |OrientedFacet|) ($ $))
        (SPROG
         ((|res2| (|List| (|OrientedFacet|))) (#1=#:G766 NIL) (|orf| NIL)
          (|res| (|List| (|OrientedFacet|))) (|found| (|Boolean|))
          (|m| (|Integer|)) (#2=#:G765 NIL))
         (SEQ (LETT |res| (QCDR |a|) . #3=(|SIMPC;addSimplex;$Of$;4|))
              (LETT |found| NIL . #3#)
              (SEQ (LETT |orf| NIL . #3#) (LETT #2# |res| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |orf| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 33))
                                 (SPADCALL |f| (QREFELT $ 33)) (QREFELT $ 34))
                       (SEQ
                        (LETT |m|
                              (+ (SPADCALL |orf| (QREFELT $ 35))
                                 (SPADCALL |f| (QREFELT $ 35)))
                              . #3#)
                        (SPADCALL |orf| |m| (QREFELT $ 36))
                        (EXIT (LETT |found| 'T . #3#)))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |found|)
                (LETT |res| (SPADCALL |res| |f| (QREFELT $ 13)) . #3#)))
              (LETT |res2| NIL . #3#)
              (SEQ (LETT |orf| NIL . #3#) (LETT #1# |res| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |orf| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |orf| (QREFELT $ 35)) 0
                                 (QREFELT $ 37))
                       (LETT |res2| (SPADCALL |res2| |orf| (QREFELT $ 13))
                             . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QCAR |a|) |res2|))))) 

(SDEFUN |SIMPC;grade;$L;5| ((|s| $) ($ |List| (|List| (|OrientedFacet|))))
        (SPROG
         ((|gr| (|Integer|)) (#1=#:G777 NIL) (|face| NIL)
          (|res| (|List| (|List| (|OrientedFacet|)))) (#2=#:G776 NIL) (|a| NIL)
          (#3=#:G774 NIL) (|maxGrade| (|NonNegativeInteger|)) (#4=#:G775 NIL)
          (|simp| (|List| (|OrientedFacet|))))
         (SEQ
          (EXIT
           (SEQ (LETT |simp| (QCDR |s|) . #5=(|SIMPC;grade;$L;5|))
                (LETT |maxGrade| 0 . #5#)
                (SEQ (LETT |face| NIL . #5#) (LETT #4# |simp| . #5#) G190
                     (COND
                      ((OR (ATOM #4#)
                           (PROGN (LETT |face| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |face| (QREFELT $ 39)) |maxGrade|
                                   (QREFELT $ 25))
                         (LETT |maxGrade| (SPADCALL |face| (QREFELT $ 39))
                               . #5#)))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (LETT |res| NIL . #5#)
                (COND
                 ((< |maxGrade| 2)
                  (PROGN (LETT #3# |res| . #5#) (GO #6=#:G773))))
                (SEQ (LETT |a| 2 . #5#) (LETT #2# |maxGrade| . #5#) G190
                     (COND ((|greater_SI| |a| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res| (SPADCALL |res| NIL (QREFELT $ 18)) . #5#)))
                     (LETT |a| (|inc_SI| |a|) . #5#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |face| NIL . #5#) (LETT #1# |simp| . #5#) G190
                     (COND
                      ((OR (ATOM #1#)
                           (PROGN (LETT |face| (CAR #1#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |gr| (- (SPADCALL |face| (QREFELT $ 39)) 1) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |gr| 0 (QREFELT $ 40))
                         (SPADCALL |res| |gr|
                                   (SPADCALL
                                    (SPADCALL |res| |gr| (QREFELT $ 21)) |face|
                                    (QREFELT $ 13))
                                   (QREFELT $ 22))))))
                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #3#)))) 

(SDEFUN |SIMPC;sort;2$;6| ((|s| $) ($ $))
        (SPROG ((|fs| (|List| (|OrientedFacet|))) (|v| (VS)))
               (SEQ (LETT |v| (QCAR |s|) . #1=(|SIMPC;sort;2$;6|))
                    (LETT |fs| (QCDR |s|) . #1#)
                    (EXIT (CONS |v| (SPADCALL |fs| (QREFELT $ 42))))))) 

(SDEFUN |SIMPC;orderedPermutation|
        ((|lst| |List| (|Integer|)) (|len| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|reslt| (|List| (|List| (|Integer|)))) (|r1| (|List| (|Integer|)))
          (#1=#:G793 NIL) (#2=#:G785 NIL) (|x| NIL)
          (|rst| (|List| (|Integer|))) (|fst| (|Integer|)) (#3=#:G791 NIL)
          (#4=#:G792 NIL) (|y| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |len| 1)
              (PROGN
               (LETT #3# NIL . #5=(|SIMPC;orderedPermutation|))
               (GO #6=#:G790))))
            (COND
             ((SPADCALL |len| (LENGTH |lst|) (QREFELT $ 25))
              (PROGN (LETT #3# NIL . #5#) (GO #6#))))
            (COND
             ((EQL |len| (LENGTH |lst|))
              (PROGN (LETT #3# (LIST |lst|) . #5#) (GO #6#))))
            (LETT |reslt| NIL . #5#)
            (COND
             ((EQL |len| 1)
              (SEQ
               (SEQ (LETT |y| NIL . #5#) (LETT #4# |lst| . #5#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |y| (CAR #4#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |reslt|
                            (SPADCALL |reslt| (LIST |y|) (QREFELT $ 45))
                            . #5#)))
                    (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT (PROGN (LETT #3# |reslt| . #5#) (GO #6#))))))
            (LETT |fst| (|SPADfirst| |lst|) . #5#)
            (LETT |rst| (CDR |lst|) . #5#)
            (SEQ (LETT |x| NIL . #5#)
                 (LETT #1#
                       (|SIMPC;orderedPermutation| |rst|
                        (PROG2
                            (LETT #2# (SPADCALL |len| 1 (QREFELT $ 47)) . #5#)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #2#))
                        $)
                       . #5#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ (LETT |r1| (CONS |fst| |x|) . #5#)
                      (EXIT
                       (LETT |reslt| (SPADCALL |reslt| |r1| (QREFELT $ 45))
                             . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
            (LETT |reslt|
                  (SPADCALL |reslt| (|SIMPC;orderedPermutation| |rst| |len| $)
                            (QREFELT $ 48))
                  . #5#)
            (EXIT |reslt|)))
          #6# (EXIT #3#)))) 

(SDEFUN |SIMPC;isNewFace?|
        ((|lst| |List| (|OrientedFacet|)) (|b| |OrientedFacet|) ($ |Boolean|))
        (SPROG ((#1=#:G798 NIL) (#2=#:G799 NIL) (|a| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |a| NIL . #3=(|SIMPC;isNewFace?|))
                       (LETT #2# |lst| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |a| |b| (QREFELT $ 49))
                           (PROGN (LETT #1# NIL . #3#) (GO #4=#:G797))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |SIMPC;listUnion|
        ((|a| |List| (|OrientedFacet|)) (|b| |List| (|OrientedFacet|))
         ($ |List| (|OrientedFacet|)))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G806 NIL) (|b1| NIL)
          (#2=#:G805 NIL) (|a1| NIL))
         (SEQ (LETT |res| NIL . #3=(|SIMPC;listUnion|))
              (SEQ (LETT |a1| NIL . #3#) (LETT #2# |a| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a1| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res| (SPADCALL |res| |a1| (QREFELT $ 13)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |b1| NIL . #3#) (LETT #1# |b| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |b1| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|SIMPC;isNewFace?| |a| |b1| $)
                       (LETT |res| (SPADCALL |res| |b1| (QREFELT $ 13))
                             . #3#)))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SIMPC;addImpliedFaces;$L;10|
        ((|s| $) ($ |List| (|List| (|OrientedFacet|))))
        (SPROG
         ((|newFaces| (|List| (|OrientedFacet|)))
          (|len| (|NonNegativeInteger|)) (#1=#:G823 NIL) (|face| NIL)
          (#2=#:G822 NIL) (#3=#:G821 NIL) (#4=#:G819 NIL) (|gr| NIL)
          (#5=#:G820 NIL) (|grn| NIL)
          (|res| (|List| (|List| (|OrientedFacet|)))) (#6=#:G818 NIL) (|a| NIL)
          (#7=#:G817 NIL) (|maxGrade| (|NonNegativeInteger|))
          (|inputList| (|List| (|List| (|OrientedFacet|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |inputList| (REVERSE (SPADCALL |s| (QREFELT $ 41)))
                  . #8=(|SIMPC;addImpliedFaces;$L;10|))
            (LETT |res| NIL . #8#) (LETT |maxGrade| (LENGTH |inputList|) . #8#)
            (COND
             ((< |maxGrade| 1) (PROGN (LETT #7# |res| . #8#) (GO #9=#:G816))))
            (SEQ (LETT |a| 1 . #8#) (LETT #6# |maxGrade| . #8#) G190
                 (COND ((|greater_SI| |a| #6#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res| (SPADCALL |res| NIL (QREFELT $ 18)) . #8#)))
                 (LETT |a| (|inc_SI| |a|) . #8#) (GO G190) G191 (EXIT NIL))
            (LETT |newFaces| NIL . #8#)
            (SEQ (LETT |grn| 1 . #8#) (LETT #5# |maxGrade| . #8#)
                 (LETT |gr| NIL . #8#) (LETT #4# |inputList| . #8#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |gr| (CAR #4#) . #8#) NIL)
                       (|greater_SI| |grn| #5#))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |face| NIL . #8#) (LETT #3# |gr| . #8#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |face| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |grn|
                                   (SPADCALL
                                    (SPADCALL |res| |grn| (QREFELT $ 21))
                                    |face| (QREFELT $ 13))
                                   (QREFELT $ 22))))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |face| NIL . #8#) (LETT #2# |newFaces| . #8#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |face| (CAR #2#) . #8#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |grn|
                                   (SPADCALL
                                    (SPADCALL |res| |grn| (QREFELT $ 21))
                                    |face| (QREFELT $ 13))
                                   (QREFELT $ 22))))
                       (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
                  (LETT |newFaces| NIL . #8#)
                  (EXIT
                   (SEQ (LETT |face| NIL . #8#)
                        (LETT #1# (SPADCALL |res| |grn| (QREFELT $ 21)) . #8#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |face| (CAR #1#) . #8#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |len| (- (SPADCALL |face| (QREFELT $ 39)) 1)
                               . #8#)
                         (EXIT
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 25))
                            (LETT |newFaces|
                                  (|SIMPC;listUnion| |newFaces|
                                   (SPADCALL |face| |len| |len| (QREFELT $ 50))
                                   $)
                                  . #8#)))))
                        (LETT #1# (CDR #1#) . #8#) (GO G190) G191 (EXIT NIL))))
                 (LETT #4#
                       (PROG1 (CDR #4#) (LETT |grn| (|inc_SI| |grn|) . #8#))
                       . #8#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (REVERSE |res|))))
          #9# (EXIT #7#)))) 

(SDEFUN |SIMPC;delta;2$;11| ((|s| $) ($ $))
        (SPROG
         ((|res| ($)) (#1=#:G830 NIL) (|y| NIL)
          (|x| (|List| (|OrientedFacet|))) (#2=#:G829 NIL) (|facet| NIL))
         (SEQ
          (LETT |res| (SPADCALL (QCAR |s|) (QREFELT $ 16))
                . #3=(|SIMPC;delta;2$;11|))
          (SEQ (LETT |facet| NIL . #3#) (LETT #2# (QCDR |s|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |facet| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 52)) . #3#)
                    (EXIT
                     (SEQ (LETT |y| NIL . #3#) (LETT #1# |x| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |y| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res| (SPADCALL |res| |y| (QREFELT $ 38))
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT NIL))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |SIMPC;star;$Of$;12| ((|s| $) (|simplex| |OrientedFacet|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (#1=#:G835 NIL) (|simp| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;star;$Of$;12|))
              (SEQ (LETT |simp| NIL . #2#) (LETT #1# (QCDR |s|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |simp| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |simplex| |simp| (QREFELT $ 54))
                       (LETT |res| (SPADCALL |res| |simp| (QREFELT $ 13))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QCAR |s|) |res|))))) 

(SDEFUN |SIMPC;link;$Of$;13| ((|s| $) (|simplex| |OrientedFacet|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|x| (|List| (|OrientedFacet|)))
          (#1=#:G841 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;link;$Of$;13|))
              (SEQ (LETT |facet| NIL . #2#) (LETT #1# (QCDR |s|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |simplex| |facet| (QREFELT $ 54))
                       (SEQ (LETT |x| (SPADCALL |facet| (QREFELT $ 52)) . #2#)
                            (EXIT
                             (LETT |res| (SPADCALL |res| |x| (QREFELT $ 56))
                                   . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QCAR |s|) |res|))))) 

(SDEFUN |SIMPC;cone;$Nni$;14| ((|s| $) (|vertex| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|res| (|List| (|OrientedFacet|))) (|x| (|OrientedFacet|))
          (#1=#:G846 NIL) (|facet| NIL))
         (SEQ (LETT |res| NIL . #2=(|SIMPC;cone;$Nni$;14|))
              (SEQ (LETT |facet| NIL . #2#) (LETT #1# (QCDR |s|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |facet| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |x| (SPADCALL |facet| |vertex| (QREFELT $ 58)) . #2#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |x| (QREFELT $ 13)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QCAR |s|) |res|))))) 

(SDEFUN |SIMPC;simplicialJoin;3$;15| ((|a| $) (|b| $) ($ $))
        (SPROG ((|res| ($)) (#1=#:G850 NIL) (|x| NIL) (|c| (VS)))
               (SEQ
                (LETT |c| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 60))
                      . #2=(|SIMPC;simplicialJoin;3$;15|))
                (LETT |res| (CONS (CAR |a|) (CDR |a|)) . #2#)
                (SEQ (LETT |x| NIL . #2#) (LETT #1# (QCDR |b|) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |res| (SPADCALL |res| |x| (QREFELT $ 38)) . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))) 

(SDEFUN |SIMPC;concatIfNew|
        ((|a| |List|
          (|Record| (|:| |value| (|NonNegativeInteger|))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         (|b| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |value| (|NonNegativeInteger|))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G858 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (VECTOR |b| 0 0) |a| (QREFELT $ 64))
                    (PROGN (LETT #1# |a| |SIMPC;concatIfNew|) (GO #2=#:G857))))
                  (EXIT (SPADCALL |a| (VECTOR |b| 0 0) (QREFELT $ 65)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SIMPC;concatIfNewArrow|
        ((|a| |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         (|p| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG ((#1=#:G869 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (VECTOR "x" 0 |p| |m| 0 0 NIL) |a|
                              (QREFELT $ 68))
                    (PROGN
                     (LETT #1# |a| . #2=(|SIMPC;concatIfNewArrow|))
                     (GO #3=#:G868))))
                  (COND
                   ((SPADCALL (VECTOR "x" 0 |m| |p| 0 0 NIL) |a|
                              (QREFELT $ 68))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (EXIT
                   (SPADCALL |a| (VECTOR "x" 0 |p| |m| 0 0 NIL)
                             (QREFELT $ 69)))))
                #3# (EXIT #1#)))) 

(SDEFUN |SIMPC;oneSkeleton;$Dg;18|
        ((|s| $) ($ |DirectedGraph| (|NonNegativeInteger|)))
        (SPROG
         ((|edges|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G881 NIL) (|p| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| (|NonNegativeInteger|))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#2=#:G880 NIL) (|m| NIL)
          (|y|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|indexes| (|List| (|NonNegativeInteger|)))
          (|n| (|NonNegativeInteger|)) (#3=#:G879 NIL) (|x| NIL)
          (GS
           (|Join| (|FiniteGraph| #4=(|NonNegativeInteger|))
                   (CATEGORY |domain|
                    (SIGNATURE |directedGraph| ($ (|List| #4#)))
                    (SIGNATURE |directedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))))
                    (SIGNATURE |directedGraph|
                     ($
                      (|List|
                       (|Record| (|:| |value| #4#)
                                 (|:| |posX| (|NonNegativeInteger|))
                                 (|:| |posY| (|NonNegativeInteger|))))
                      (|List|
                       (|Record| (|:| |name| (|String|))
                                 (|:| |arrType| (|NonNegativeInteger|))
                                 (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))
                                 (|:| |xOffset| (|Integer|))
                                 (|:| |yOffset| (|Integer|))
                                 (|:| |map|
                                      (|List| (|NonNegativeInteger|)))))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| #4#)
                      (|List|
                       (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                                 (|:| |toOb| (|NonNegativeInteger|))))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| #4#) (|List| (|List| (|NonNegativeInteger|)))))
                    (SIGNATURE |directedGraph|
                     ($ (|List| (|Permutation| #4#))))
                    (SIGNATURE |directedGraph| ($ (|FinitePoset| #4#)))
                    (SIGNATURE * ((|DirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |cartesian|
                     ((|DirectedGraph| (|Product| #4# #4#)) $ $))
                    (SIGNATURE |closedTensor| ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE |closedCartesian|
                     ($ $ $ (|Mapping| #4# #4# #4#)))
                    (SIGNATURE ~ ($ $))
                    (SIGNATURE |coerce| ($ (|PermutationGroup| #4#)))
                    (SIGNATURE |coerce| ($ (|FinitePoset| #4#)))
                    (SIGNATURE |coerce| ($ (|List| #4#)))))))
         (SEQ
          (LETT GS (|DirectedGraph| (|NonNegativeInteger|))
                . #5=(|SIMPC;oneSkeleton;$Dg;18|))
          (LETT |nodes| NIL . #5#) (LETT |edges| NIL . #5#)
          (SEQ (LETT |x| NIL . #5#) (LETT #3# (QCDR |s|) . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 39)) . #5#)
                    (LETT |indexes| (SPADCALL |x| (QREFELT $ 33)) . #5#)
                    (COND
                     ((EQL |n| 2)
                      (SEQ
                       (LETT |nodes|
                             (|SIMPC;concatIfNew| |nodes|
                              (SPADCALL |indexes| 1 (QREFELT $ 70)) $)
                             . #5#)
                       (LETT |nodes|
                             (|SIMPC;concatIfNew| |nodes|
                              (SPADCALL |indexes| 2 (QREFELT $ 70)) $)
                             . #5#)
                       (LETT |y|
                             (VECTOR "x" 0
                                     (SPADCALL |indexes| 1 (QREFELT $ 70))
                                     (SPADCALL |indexes| 2 (QREFELT $ 70)) 0 0
                                     NIL)
                             . #5#)
                       (EXIT
                        (LETT |edges| (SPADCALL |edges| |y| (QREFELT $ 69))
                              . #5#)))))
                    (EXIT
                     (COND
                      ((SPADCALL |n| 2 (QREFELT $ 25))
                       (SEQ (LETT |m| NIL . #5#) (LETT #2# |indexes| . #5#)
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |m| (CAR #2#) . #5#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |nodes| (|SIMPC;concatIfNew| |nodes| |m| $)
                                   . #5#)
                             (EXIT
                              (SEQ (LETT |p| NIL . #5#)
                                   (LETT #1# |indexes| . #5#) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |p| (CAR #1#) . #5#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((< |p| |m|)
                                       (LETT |edges|
                                             (|SIMPC;concatIfNewArrow| |edges|
                                              |p| |m| $)
                                             . #5#)))))
                                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                            (EXIT NIL))))))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |nodes| |edges|
                     (|compiledLookupCheck| '|directedGraph|
                                            (LIST '$
                                                  (LIST '|List|
                                                        (LIST '|Record|
                                                              (LIST '|:|
                                                                    '|value|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|posX|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|posY|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))))
                                                  (LIST '|List|
                                                        (LIST '|Record|
                                                              (LIST '|:|
                                                                    '|name|
                                                                    (LIST
                                                                     '|String|))
                                                              (LIST '|:|
                                                                    '|arrType|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|fromOb|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|toOb|
                                                                    (LIST
                                                                     '|NonNegativeInteger|))
                                                              (LIST '|:|
                                                                    '|xOffset|
                                                                    (LIST
                                                                     '|Integer|))
                                                              (LIST '|:|
                                                                    '|yOffset|
                                                                    (LIST
                                                                     '|Integer|))
                                                              (LIST '|:| '|map|
                                                                    (LIST
                                                                     '|List|
                                                                     (LIST
                                                                      '|NonNegativeInteger|))))))
                                            GS)))))) 

(SDEFUN |SIMPC;fundamentalGroup;$Gp;19| ((|s| $) ($ |GroupPresentation|))
        (SPADCALL |s| 'T NIL (QREFELT $ 74))) 

(SDEFUN |SIMPC;fundamentalGroup;$2BGp;20|
        ((|s| $) (|simplify| |Boolean|) (|trace| |Boolean|)
         ($ |GroupPresentation|))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 77))
                      |SIMPC;fundamentalGroup;$2BGp;20|)
                (EXIT (SPADCALL |dc| |simplify| |trace| (QREFELT $ 78)))))) 

(SDEFUN |SIMPC;chain;$Cc;21| ((|s| $) ($ |ChainComplex|))
        (SPROG ((|cc| (|ChainComplex|)) (|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 77))
                      . #1=(|SIMPC;chain;$Cc;21|))
                (LETT |cc| (SPADCALL |dc| (QREFELT $ 80)) . #1#) (EXIT |cc|)))) 

(SDEFUN |SIMPC;homology;$L;22| ((|s| $) ($ |List| (|Homology|)))
        (SPROG ((|dc| (|DeltaComplex| VS)))
               (SEQ
                (LETT |dc| (SPADCALL |s| (QREFELT $ 77))
                      |SIMPC;homology;$L;22|)
                (EXIT (SPADCALL |dc| (QREFELT $ 83)))))) 

(SDEFUN |SIMPC;product;3$;23| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|res3| (|List| (|OrientedFacet|)))
          (|inds2| (|List| (|NonNegativeInteger|)))
          (|newIndex| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
          (#1=#:G897 NIL) (|l| (|NonNegativeInteger|)) (#2=#:G910 NIL)
          (|y| NIL) (|mul| (|Integer|))
          (|inds|
           (|List|
            (|Record| (|:| |left| (|NonNegativeInteger|))
                      (|:| |right| (|NonNegativeInteger|)))))
          (#3=#:G909 NIL) (|x| NIL) (|dimb| #4=(|NonNegativeInteger|))
          (|bz| (|NonNegativeInteger|)) (|dima| #4#)
          (|az| (|NonNegativeInteger|)) (#5=#:G908 NIL) (|z| NIL)
          (|res2| (|List| (|ProductFacet|))) (#6=#:G907 NIL) (|e| NIL)
          (|res| (|List| (|ProductFacet|))) (#7=#:G906 NIL) (|simpb| NIL)
          (#8=#:G905 NIL) (|simpa| NIL) (|vs| (VS))
          (|simpsb| #9=(|List| (|OrientedFacet|))) (|simpsa| #9#))
         (SEQ (LETT |simpsa| (QCDR |a|) . #10=(|SIMPC;product;3$;23|))
              (LETT |simpsb| (QCDR |b|) . #10#)
              (LETT |vs| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 85))
                    . #10#)
              (LETT |res| NIL . #10#)
              (SEQ (LETT |simpa| NIL . #10#) (LETT #8# |simpsa| . #10#) G190
                   (COND
                    ((OR (ATOM #8#)
                         (PROGN (LETT |simpa| (CAR #8#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |simpb| NIL . #10#) (LETT #7# |simpsb| . #10#)
                          G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |simpb| (CAR #7#) . #10#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL |simpa| |simpb|
                                                      (QREFELT $ 87))
                                            (QREFELT $ 88))
                                  . #10#)))
                          (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #8# (CDR #8#) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |res2| NIL . #10#)
              (SEQ (LETT |e| NIL . #10#) (LETT #6# |res| . #10#) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#) . #10#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |e| |res2| (QREFELT $ 90)))
                       (LETT |res2| (SPADCALL |res2| |e| (QREFELT $ 91))
                             . #10#)))))
                   (LETT #6# (CDR #6#) . #10#) (GO G190) G191 (EXIT NIL))
              (LETT |res3| NIL . #10#) (LETT |dima| 0 . #10#)
              (LETT |dimb| 0 . #10#)
              (SEQ (LETT |z| NIL . #10#) (LETT #5# |res2| . #10#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |z| (CAR #5#) . #10#) NIL))
                     (GO G191)))
                   (SEQ (LETT |az| (SPADCALL |z| (QREFELT $ 92)) . #10#)
                        (COND
                         ((SPADCALL |az| |dima| (QREFELT $ 25))
                          (LETT |dima| |az| . #10#)))
                        (LETT |bz| (SPADCALL |z| (QREFELT $ 93)) . #10#)
                        (EXIT
                         (COND
                          ((SPADCALL |bz| |dimb| (QREFELT $ 25))
                           (LETT |dimb| |bz| . #10#)))))
                   (LETT #5# (CDR #5#) . #10#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |x| NIL . #10#) (LETT #3# |res2| . #10#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #10#) NIL))
                     (GO G191)))
                   (SEQ (LETT |inds| (SPADCALL |x| (QREFELT $ 96)) . #10#)
                        (LETT |inds2| NIL . #10#)
                        (LETT |mul| (SPADCALL |x| (QREFELT $ 97)) . #10#)
                        (SEQ (LETT |y| NIL . #10#) (LETT #2# |inds| . #10#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |y| (CAR #2#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |l|
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL (QCAR |y|) 1
                                                        (QREFELT $ 47))
                                              . #10#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #11="failed")
                                                      #1#))
                                    . #10#)
                              (LETT |r|
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL (QCDR |y|) 1
                                                        (QREFELT $ 47))
                                              . #10#)
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       #11#)
                                                      #1#))
                                    . #10#)
                              (LETT |newIndex| (+ (+ (* |l| |dimb|) |r|) 1)
                                    . #10#)
                              (EXIT
                               (LETT |inds2|
                                     (SPADCALL |inds2| |newIndex|
                                               (QREFELT $ 98))
                                     . #10#)))
                             (LETT #2# (CDR #2#) . #10#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |res3|
                               (SPADCALL |res3|
                                         (SPADCALL |mul| |inds2|
                                                   (QREFELT $ 11))
                                         (QREFELT $ 13))
                               . #10#)))
                   (LETT #3# (CDR #3#) . #10#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |vs| |res3|))))) 

(SDEFUN |SIMPC;equalSimplex|
        ((|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG
         ((|offset| (|Integer|)) (#1=#:G920 NIL) (#2=#:G921 NIL) (|n| NIL)
          (|fst| (|NonNegativeInteger|)) (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |len| (SPADCALL |a| (QREFELT $ 100))
                  . #3=(|SIMPC;equalSimplex|))
            (COND
             ((SPADCALL |len| (SPADCALL |b| (QREFELT $ 100)) (QREFELT $ 101))
              (PROGN (LETT #1# NIL . #3#) (GO #4=#:G919))))
            (COND ((EQL |len| 0) (PROGN (LETT #1# 'T . #3#) (GO #4#))))
            (LETT |fst| (|SPADfirst| |a|) . #3#)
            (LETT |offset| (SPADCALL |fst| |b| (QREFELT $ 102)) . #3#)
            (COND ((< |offset| 1) (PROGN (LETT #1# NIL . #3#) (GO #4#))))
            (SEQ (LETT |n| 1 . #3#)
                 (LETT #2# (SPADCALL |a| (QREFELT $ 100)) . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |a| |n| (QREFELT $ 70))
                              (SPADCALL |b| |offset| (QREFELT $ 70))
                              (QREFELT $ 101))
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (LETT |offset| (+ |offset| 1) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |offset| (SPADCALL |b| (QREFELT $ 100))
                               (QREFELT $ 40))
                     (LETT |offset| 1 . #3#)))))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |SIMPC;=;2$B;25| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G933 NIL) (#2=#:G937 NIL) (|f| NIL)
          (|x| (|NonNegativeInteger|)) (#3=#:G936 NIL) (|a1| NIL)
          (|flags| (|List| (|Boolean|))) (#4=#:G935 NIL) (#5=#:G934 NIL)
          (|len| (|NonNegativeInteger|)) (|bs| #6=(|List| (|OrientedFacet|)))
          (|as| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |as| (QCDR |a|) . #7=(|SIMPC;=;2$B;25|))
                (LETT |bs| (QCDR |b|) . #7#) (LETT |len| (LENGTH |as|) . #7#)
                (COND
                 ((SPADCALL |len| (LENGTH |bs|) (QREFELT $ 101))
                  (PROGN (LETT #1# NIL . #7#) (GO #8=#:G932))))
                (LETT |flags|
                      (PROGN
                       (LETT #5# NIL . #7#)
                       (SEQ (LETT |x| NIL . #7#) (LETT #4# |as| . #7#) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |x| (CAR #4#) . #7#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #5# (CONS NIL #5#) . #7#)))
                            (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #5#))))
                      . #7#)
                (SEQ (LETT |a1| NIL . #7#) (LETT #3# |as| . #7#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #7#) NIL))
                       (GO G191)))
                     (SEQ (LETT |x| 1 . #7#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND
                                   ((SPADCALL |a1|
                                              (SPADCALL |bs| |x|
                                                        (QREFELT $ 26))
                                              (QREFELT $ 103))
                                    'T)
                                   ('T
                                    (SPADCALL |flags| |x| (QREFELT $ 105)))))
                                 (GO G191)))
                               (SEQ (LETT |x| (+ |x| 1) . #7#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL |x| (LENGTH |as|)
                                                 (QREFELT $ 25))
                                       (PROGN
                                        (LETT #1# NIL . #7#)
                                        (GO #8#))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |flags| |x| 'T (QREFELT $ 106))))
                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |f| NIL . #7#) (LETT #2# |flags| . #7#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((|BooleanEquality| |f| NIL)
                         (PROGN (LETT #1# NIL . #7#) (GO #8#))))))
                     (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #8# (EXIT #1#)))) 

(SDEFUN |SIMPC;coerce;$Of;26| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|res| (|OutputForm|)) (#1=#:G943 NIL) (|a| NIL) (#2=#:G942 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res| (SPADCALL (QREFELT $ 109))
                  . #3=(|SIMPC;coerce;$Of;26|))
            (COND
             ((NULL (QCDR |s|))
              (PROGN
               (LETT #2# (SPADCALL "empty" (QREFELT $ 110)) . #3#)
               (GO #4=#:G941))))
            (SEQ (LETT |a| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res|
                         (SPADCALL |res| (SPADCALL |a| (QREFELT $ 111))
                                   (QREFELT $ 112))
                         . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SIMPC;coerce;$Dc;27| ((|s| $) ($ |DeltaComplex| VS))
        (SPADCALL |s| (QREFELT $ 77))) 

(DECLAIM (NOTINLINE |FiniteSimplicialComplex;|)) 

(DEFUN |FiniteSimplicialComplex| (#1=#:G945)
  (SPROG NIL
         (PROG (#2=#:G946)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteSimplicialComplex|)
                                               '|domainEqualList|)
                    . #3=(|FiniteSimplicialComplex|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteSimplicialComplex;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteSimplicialComplex|)))))))))) 

(DEFUN |FiniteSimplicialComplex;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteSimplicialComplex|))
          (LETT |dv$| (LIST '|FiniteSimplicialComplex| DV$1) . #1#)
          (LETT $ (GETREFV 118) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteSimplicialComplex|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| VERTSET |#1|)
                              (|:| SIMP (|List| (|OrientedFacet|)))))
          $))) 

(MAKEPROP '|FiniteSimplicialComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Integer|)
              (|List| 24) (|OrientedFacet|) (0 . |orientedFacet|) (|List| 10)
              (6 . |concat|) (|List| 9) |SIMPC;simplicialComplex;VSL$;1|
              |SIMPC;simplicialComplex;VS$;2| (|List| 12) (12 . |concat|)
              (|List| 8) (18 . |orientedFacetSigned|) (23 . |elt|)
              (29 . |setelt!|) (|Boolean|) (|NonNegativeInteger|) (36 . >)
              (42 . |elt|) (48 . |orientedFacet|) (|List| $)
              (54 . |orientedFacet|) (59 . |remove|) (|DeltaComplex| 6)
              |SIMPC;simplicialComplex;Dc$;3| (65 . |getIndexes|) (70 . =)
              (76 . |getMult|) (81 . |setMult!|) (87 . ~=)
              |SIMPC;addSimplex;$Of$;4| (93 . |order|) (98 . >)
              |SIMPC;grade;$L;5| (104 . |sort|) |SIMPC;sort;2$;6| (|List| 19)
              (109 . |concat|) (|Union| $ '"failed") (115 . |subtractIfCan|)
              (121 . |concat|) (127 . |sameFace?|) (133 . |allSubsets|)
              |SIMPC;addImpliedFaces;$L;10| (140 . |delta|) |SIMPC;delta;2$;11|
              (145 . |isSubsetOf?|) |SIMPC;star;$Of$;12| (151 . |concat|)
              |SIMPC;link;$Of$;13| (157 . |addVertex|) |SIMPC;cone;$Nni$;14|
              (163 . |join|) |SIMPC;simplicialJoin;3$;15|
              (|Record| (|:| |value| 24) (|:| |posX| 24) (|:| |posY| 24))
              (|List| 62) (169 . |member?|) (175 . |concat|)
              (|Record| (|:| |name| 116) (|:| |arrType| 24) (|:| |fromOb| 24)
                        (|:| |toOb| 24) (|:| |xOffset| 8) (|:| |yOffset| 8)
                        (|:| |map| 9))
              (|List| 66) (181 . |member?|) (187 . |concat|) (193 . |elt|)
              (|DirectedGraph| 24) |SIMPC;oneSkeleton;$Dg;18|
              (|GroupPresentation|) |SIMPC;fundamentalGroup;$2BGp;20|
              |SIMPC;fundamentalGroup;$Gp;19| (|FiniteSimplicialComplex| 6)
              (199 . |deltaComplex|) (204 . |fundamentalGroup|)
              (|ChainComplex|) (211 . |chain|) |SIMPC;chain;$Cc;21|
              (|List| (|Homology|)) (216 . |homology|) |SIMPC;homology;$L;22|
              (221 . |prod|) (|List| 89) (227 . |product|) (233 . |concat|)
              (|ProductFacet|) (239 . |member?|) (245 . |concat|)
              (251 . |getMaxLeft|) (256 . |getMaxRight|)
              (|Record| (|:| |left| 24) (|:| |right| 24)) (|List| 94)
              (261 . |getIndexs|) (266 . |getMult|) (271 . |concat|)
              |SIMPC;product;3$;23| (277 . |#|) (282 . ~=) (288 . |position|)
              (294 . ~=) (|List| 23) (300 . |elt|) (306 . |setelt!|)
              |SIMPC;=;2$B;25| (|OutputForm|) (313 . |empty|) (317 . |bracket|)
              (322 . |coerce|) (327 . |vconcat|) |SIMPC;coerce;$Of;26|
              |SIMPC;coerce;$Dc;27| (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 333 |star| 339 |sort| 345 |simplicialJoin| 350
              |simplicialComplex| 356 |product| 372 |oneSkeleton| 378 |link|
              383 |latex| 389 |homology| 394 |hashUpdate!| 399 |hash| 405
              |grade| 410 |fundamentalGroup| 415 |delta| 427 |cone| 432
              |coerce| 438 |chain| 448 |addSimplex| 453 |addImpliedFaces| 459 =
              464)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 108))
                        (|makeByteWordVec2| 117
                                            '(2 10 0 8 9 11 2 12 0 0 10 13 2 17
                                              0 0 12 18 1 10 0 19 20 2 17 12 0
                                              8 21 3 17 12 0 8 12 22 2 24 23 0
                                              0 25 2 12 10 0 8 26 2 10 0 8 10
                                              27 1 10 0 28 29 2 12 0 10 0 30 1
                                              10 9 0 33 2 9 23 0 0 34 1 10 8 0
                                              35 2 10 0 0 8 36 2 8 23 0 0 37 1
                                              10 24 0 39 2 8 23 0 0 40 1 12 0 0
                                              42 2 44 0 0 19 45 2 24 46 0 0 47
                                              2 44 0 0 0 48 2 10 23 0 0 49 3 10
                                              28 0 24 24 50 1 10 28 0 52 2 10
                                              23 0 0 54 2 12 0 0 0 56 2 10 0 0
                                              24 58 2 6 0 0 0 60 2 63 23 62 0
                                              64 2 63 0 0 62 65 2 67 23 66 0 68
                                              2 67 0 0 66 69 2 9 24 0 8 70 1 31
                                              0 76 77 3 31 73 0 23 23 78 1 31
                                              79 0 80 1 31 82 0 83 2 6 0 0 0 85
                                              2 10 86 0 0 87 2 86 0 0 0 88 2 86
                                              23 89 0 90 2 86 0 0 89 91 1 89 24
                                              0 92 1 89 24 0 93 1 89 95 0 96 1
                                              89 8 0 97 2 9 0 0 24 98 1 9 24 0
                                              100 2 24 23 0 0 101 2 9 8 24 0
                                              102 2 10 23 0 0 103 2 104 23 0 8
                                              105 3 104 23 0 8 23 106 0 108 0
                                              109 1 108 0 0 110 1 10 108 0 111
                                              2 108 0 0 0 112 2 0 23 0 0 1 2 0
                                              0 0 10 55 1 0 0 0 43 2 0 0 0 0 61
                                              1 0 0 6 16 1 0 0 31 32 2 0 0 6 14
                                              15 2 0 0 0 0 99 1 0 71 0 72 2 0 0
                                              0 10 57 1 0 116 0 1 1 0 82 0 84 2
                                              0 115 115 0 1 1 0 117 0 1 1 0 17
                                              0 41 3 0 73 0 23 23 74 1 0 73 0
                                              75 1 0 0 0 53 2 0 0 0 24 59 1 0
                                              31 0 114 1 0 108 0 113 1 0 79 0
                                              81 2 0 0 0 10 38 1 0 17 0 51 2 0
                                              23 0 0 107)))))
           '|lookupComplete|)) 
