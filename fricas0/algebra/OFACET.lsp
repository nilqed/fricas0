
(SDEFUN |OFACET;orientedFacet;IL$;1|
        ((|mul1| |Integer|) (|fac1| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|mul2| (|Integer|)) (|diff| (|NonNegativeInteger|)) (#1=#:G735 NIL)
          (|x| NIL) (#2=#:G736 NIL) (|y| NIL)
          (|fac2| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |mul2| |mul1| . #3=(|OFACET;orientedFacet;IL$;1|))
              (LETT |fac2| (SPADCALL |fac1| (QREFELT $ 8)) . #3#)
              (LETT |diff| 0 . #3#)
              (SEQ (LETT |y| NIL . #3#) (LETT #2# |fac2| . #3#)
                   (LETT |x| NIL . #3#) (LETT #1# |fac1| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL)
                         (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |x| |y| (QREFELT $ 11))
                       (LETT |diff| (+ |diff| 1) . #3#)))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (COND ((EQL |diff| 1) (|error| "cant construct orientedFacet")))
              (COND
               ((SPADCALL |diff| (QREFELT $ 13))
                (COND
                 ((SPADCALL |diff| 1 (QREFELT $ 14))
                  (LETT |mul2| (- |mul2|) . #3#)))))
              (EXIT (CONS |mul2| |fac2|))))) 

(SDEFUN |OFACET;orientedFacetUnsigned;L$;2| ((|fac1| |List| (|Integer|)) ($ $))
        (SPROG
         ((|lst| (|List| (|NonNegativeInteger|))) (#1=#:G737 NIL)
          (#2=#:G742 NIL) (|x| NIL) (#3=#:G741 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #3# NIL . #4=(|OFACET;orientedFacetUnsigned;L$;2|))
                 (SEQ (LETT |x| NIL . #4#) (LETT #2# |fac1| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG1 (LETT #1# (ABS |x|) . #4#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |lst| (SPADCALL |lst| (QREFELT $ 16)) . #4#)
          (EXIT (CONS 1 (SPADCALL |lst| (QREFELT $ 8))))))) 

(SDEFUN |OFACET;orientedFacetSigned;L$;3| ((|fac1| |List| (|Integer|)) ($ $))
        (SPROG
         ((|sig| (|Integer|)) (|lst| (|List| (|NonNegativeInteger|)))
          (#1=#:G743 NIL) (#2=#:G751 NIL) (|x| NIL) (#3=#:G750 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #3# NIL . #4=(|OFACET;orientedFacetSigned;L$;3|))
                 (SEQ (LETT |x| NIL . #4#) (LETT #2# |fac1| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (PROG1 (LETT #1# (ABS |x|) . #4#)
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |lst| (SPADCALL |lst| (QREFELT $ 16)) . #4#)
          (LETT |sig| 1 . #4#)
          (COND
           ((< (LENGTH |fac1|) 1)
            (|error| "attempt to construct empty facet")))
          (COND ((< (|SPADfirst| |fac1|) 0) (LETT |sig| -1 . #4#)))
          (EXIT (CONS |sig| (SPADCALL |lst| (QREFELT $ 8))))))) 

(SDEFUN |OFACET;orientedFacet;I2$;4|
        ((|mul| |Integer|) (|fac1| |OrientedFacet|) ($ $))
        (CONS |mul| (SPADCALL |fac1| (QREFELT $ 21)))) 

(SDEFUN |OFACET;orientedFacet;L$;5| ((|boundary| |List| $) ($ $))
        (SPROG
         ((|mm| (|Integer|)) (#1=#:G779 NIL) (|e| NIL) (#2=#:G778 NIL)
          (|expected| (|List| $)) (|res| ($))
          (|indexes| (|List| (|NonNegativeInteger|))) (#3=#:G777 NIL) (|i| NIL)
          (|indexLst| (|List| (|List| (|NonNegativeInteger|)))) (#4=#:G776 NIL)
          (|subFacet| NIL) (|b| (|List| $)) (|multLst| (|List| (|Integer|))))
         (SEQ (LETT |indexLst| NIL . #5=(|OFACET;orientedFacet;L$;5|))
              (LETT |multLst| NIL . #5#)
              (COND
               ((< (SPADCALL |boundary| (QREFELT $ 24)) 1)
                (|error|
                 "cannot construct orientedFacet from empty boundary")))
              (LETT |b| (SPADCALL |boundary| (QREFELT $ 25)) . #5#)
              (SEQ (LETT |subFacet| NIL . #5#) (LETT #4# |b| . #5#) G190
                   (COND
                    ((OR (ATOM #4#)
                         (PROGN (LETT |subFacet| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |indexLst|
                           (SPADCALL |indexLst|
                                     (SPADCALL |subFacet| (QREFELT $ 26))
                                     (QREFELT $ 28))
                           . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |indexes| NIL . #5#)
              (SEQ (LETT |i| NIL . #5#) (LETT #3# |indexLst| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |indexes| (SPADCALL |indexes| |i| (QREFELT $ 29))
                           . #5#)))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (LETT |indexes| (SPADCALL |indexes| (QREFELT $ 16)) . #5#)
              (LETT |indexes| (SPADCALL |indexes| (QREFELT $ 8)) . #5#)
              (LETT |res| (SPADCALL 1 |indexes| (QREFELT $ 15)) . #5#)
              (LETT |expected| (SPADCALL |res| (QREFELT $ 31)) . #5#)
              (LETT |mm|
                    (SPADCALL (SPADCALL |boundary| (QREFELT $ 32)) |expected|
                              (QREFELT $ 33))
                    . #5#)
              (COND
               ((< |mm| 0)
                (SEQ (LETT |res| (SPADCALL -1 |indexes| (QREFELT $ 15)) . #5#)
                     (EXIT
                      (LETT |expected| (SPADCALL |res| (QREFELT $ 31))
                            . #5#)))))
              (SEQ (LETT |e| NIL . #5#) (LETT #2# |expected| . #5#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |mm| (SPADCALL |e| |boundary| (QREFELT $ 33)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL |mm| 0 (QREFELT $ 34))
                       (SEQ
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "orientedFacet:"
                                    (SPADCALL |e| (QREFELT $ 36))
                                    (QREFELT $ 37))
                          (COND ((EQL |mm| 0) "not in provided boundary")
                                ('T "has opposite orientation"))
                          (QREFELT $ 37))
                         (QREFELT $ 39))
                        (EXIT (|error| "Not a boundary of a cell")))))))
                   (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |e| NIL . #5#) (LETT #1# |boundary| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |mm| (SPADCALL |e| |expected| (QREFELT $ 33)) . #5#)
                    (EXIT
                     (COND
                      ((SPADCALL |mm| 0 (QREFELT $ 34))
                       (SEQ
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "orientedFacet:"
                                    (SPADCALL |e| (QREFELT $ 36))
                                    (QREFELT $ 37))
                          (COND ((EQL |mm| 0) "not in constructed boundary")
                                ('T "has opposite orientation"))
                          (QREFELT $ 37))
                         (QREFELT $ 39))
                        (EXIT (|error| "Not a boundary of a cell")))))))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;order;$Nni;6| ((|f| $) ($ |NonNegativeInteger|))
        (SPROG ((|facet| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |facet| (SPADCALL |f| (QREFELT $ 26))
                      |OFACET;order;$Nni;6|)
                (EXIT (SPADCALL |facet| (QREFELT $ 41)))))) 

(PUT '|OFACET;getIndexes;$L;7| '|SPADreplace| 'QCDR) 

(SDEFUN |OFACET;getIndexes;$L;7| ((|orf| $) ($ |List| (|NonNegativeInteger|)))
        (QCDR |orf|)) 

(SDEFUN |OFACET;minIndex;$Nni;8| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G786 NIL) (|i| NIL)
          (|inds| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |m| 0 . #2=(|OFACET;minIndex;$Nni;8|))
              (LETT |inds| (SPADCALL |orf| (QREFELT $ 26)) . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |inds| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (EQL |m| 0) (< |i| |m|)) (LETT |m| |i| . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;maxIndex;$Nni;9| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G790 NIL) (|i| NIL)
          (|inds| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |m| 0 . #2=(|OFACET;maxIndex;$Nni;9|))
              (LETT |inds| (SPADCALL |orf| (QREFELT $ 26)) . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |inds| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| |m| (QREFELT $ 14))
                       (LETT |m| |i| . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;getIndexesSigned;$L;10| ((|orf| $) ($ |List| (|Integer|)))
        (SPROG
         ((|neg| (|Boolean|)) (|res| (|List| (|Integer|))) (|i2| (|Integer|))
          (#1=#:G796 NIL) (|i| NIL))
         (SEQ (LETT |res| NIL . #2=(|OFACET;getIndexesSigned;$L;10|))
              (LETT |neg| (EQL (SPADCALL (QCAR |orf|) (QREFELT $ 45)) -1)
                    . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# (QCDR |orf|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |i2| (COND (|neg| (- |i|)) ('T |i|)) . #2#)
                        (LETT |res| (SPADCALL |res| |i2| (QREFELT $ 46)) . #2#)
                        (EXIT (LETT |neg| (NULL |neg|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(PUT '|OFACET;getMult;$I;11| '|SPADreplace| 'QCAR) 

(SDEFUN |OFACET;getMult;$I;11| ((|orf| $) ($ |Integer|)) (QCAR |orf|)) 

(SDEFUN |OFACET;setMult!;$I$;12| ((|orf| $) (|m| |Integer|) ($ $))
        (SEQ (PROGN (RPLACA |orf| |m|) (QCAR |orf|)) (EXIT |orf|))) 

(SDEFUN |OFACET;delta;$L;13| ((|orf| $) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|r1| ($)) (|even| (|Boolean|))
          (|m| #1=(|Integer|)) (|r| (|List| (|NonNegativeInteger|)))
          (#2=#:G804 NIL) (|x| NIL) (|mult| #1#)
          (|revFacet| (|List| (|NonNegativeInteger|)))
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |orf|) . #3=(|OFACET;delta;$L;13|))
              (LETT |revFacet| (REVERSE |facet|) . #3#)
              (LETT |mult| (QCAR |orf|) . #3#) (LETT |res| NIL . #3#)
              (LETT |even| NIL . #3#)
              (SEQ (LETT |x| NIL . #3#) (LETT #2# |revFacet| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |x| |facet| (QREFELT $ 50)) . #3#)
                        (LETT |m| (COND (|even| (- |mult|)) ('T |mult|)) . #3#)
                        (LETT |even| (NULL |even|) . #3#)
                        (LETT |r1| (SPADCALL |m| |r| (QREFELT $ 15)) . #3#)
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r1| (QREFELT $ 51))
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;addIfNew| ((|lst| |List| $) (|orf| $) ($ |List| $))
        (SPROG ((#1=#:G809 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |orf| (QREFELT $ 52)))
                    (COND
                     ((SPADCALL |orf| |lst| (QREFELT $ 53))
                      (PROGN
                       (LETT #1# |lst| |OFACET;addIfNew|)
                       (GO #2=#:G808))))))
                  (EXIT (SPADCALL |lst| |orf| (QREFELT $ 51)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;addIfNew2| ((|lst| |List| $) (|orfs| |List| $) ($ |List| $))
        (SPROG ((|res| (|List| $)) (#1=#:G817 NIL) (|orf| NIL) (#2=#:G816 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |orfs| (QREFELT $ 54))
                    (PROGN
                     (LETT #2# |lst| . #3=(|OFACET;addIfNew2|))
                     (GO #4=#:G815))))
                  (LETT |res| (SPADCALL |lst| (QREFELT $ 55)) . #3#)
                  (SEQ (LETT |orf| NIL . #3#) (LETT #1# |orfs| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |orf| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |orf| (QREFELT $ 52)))
                           (COND
                            ((NULL (SPADCALL |orf| |res| (QREFELT $ 53)))
                             (LETT |res| (SPADCALL |res| |orf| (QREFELT $ 51))
                                   . #3#)))))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                #4# (EXIT #2#)))) 

(SDEFUN |OFACET;allSubsets;$NniL;16|
        ((|orf| $) (|minDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res| (|List| $)) (|sub| (|List| $)) (|r1| ($))
          (|r| (|List| (|NonNegativeInteger|))) (#1=#:G826 NIL) (|x| NIL)
          (#2=#:G825 NIL) (|mult| (|Integer|))
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ (LETT |facet| (QCDR |orf|) . #3=(|OFACET;allSubsets;$NniL;16|))
                (LETT |mult| (QCAR |orf|) . #3#) (LETT |res| NIL . #3#)
                (COND
                 ((SPADCALL (SPADCALL |orf| (QREFELT $ 42)) |minDim|
                            (QREFELT $ 56))
                  (PROGN (LETT #2# |res| . #3#) (GO #4=#:G824))))
                (SEQ (LETT |x| NIL . #3#) (LETT #1# |facet| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |r| (SPADCALL |x| |facet| (QREFELT $ 50)) . #3#)
                      (LETT |r1| (SPADCALL 1 |r| (QREFELT $ 15)) . #3#)
                      (LETT |res| (|OFACET;addIfNew| |res| |r1| $) . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |r1| (QREFELT $ 42)) |minDim|
                                   (QREFELT $ 14))
                         (SEQ
                          (LETT |sub| (SPADCALL |r1| |minDim| (QREFELT $ 57))
                                . #3#)
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |sub| (QREFELT $ 54)))
                             (LETT |res| (|OFACET;addIfNew2| |res| |sub| $)
                                   . #3#)))))))))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |OFACET;allSubsets;$2NniL;17|
        ((|orf| $) (|minDim| |NonNegativeInteger|)
         (|maxDim| |NonNegativeInteger|) ($ |List| $))
        (SPROG
         ((|res2| (|List| $)) (#1=#:G832 NIL) (|y| NIL) (|res| (|List| $)))
         (SEQ
          (LETT |res| (SPADCALL |orf| |minDim| (QREFELT $ 57))
                . #2=(|OFACET;allSubsets;$2NniL;17|))
          (LETT |res2| NIL . #2#)
          (SEQ (LETT |y| NIL . #2#) (LETT #1# |res| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |y| (QREFELT $ 42)) |maxDim|
                             (QREFELT $ 56))
                   (LETT |res2| (SPADCALL |res2| |y| (QREFELT $ 51)) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res2|)))) 

(SDEFUN |OFACET;isSubsetOf?;2$B;18| ((|sa| $) (|sb| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G836 NIL) (#2=#:G837 NIL) (|vertex| NIL) (|all| (|List| $)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |all| (SPADCALL |sb| 1 (QREFELT $ 57))
                  . #3=(|OFACET;isSubsetOf?;2$B;18|))
            (SEQ (LETT |vertex| NIL . #3#) (LETT #2# |all| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |vertex| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |vertex| |sa| (QREFELT $ 59))
                     (PROGN (LETT #1# 'T . #3#) (GO #4=#:G835))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |OFACET;subtract;3$;19| ((|sa| $) (|sb| $) ($ $))
        (SPROG ((|lst| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |lst| (SPADCALL (QCDR |sb|) (QCDR |sa|) (QREFELT $ 61))
                      |OFACET;subtract;3$;19|)
                (EXIT (CONS 1 |lst|))))) 

(SDEFUN |OFACET;reindex;2$;20| ((|sa| $) ($ $))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (|ptr| (|Integer|))
          (#1=#:G847 NIL) (|v| NIL) (|i| (|NonNegativeInteger|))
          (|newval| (|List| (|NonNegativeInteger|)))
          (|oldval| (|List| (|NonNegativeInteger|))) (#2=#:G846 NIL)
          (|facet| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |sa|) . #3=(|OFACET;reindex;2$;20|))
              (LETT |oldval| NIL . #3#) (LETT |newval| NIL . #3#)
              (LETT |i| 1 . #3#)
              (SEQ (LETT |v| NIL . #3#) (LETT #2# |facet| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |oldval| (SPADCALL |oldval| |v| (QREFELT $ 63))
                          . #3#)
                    (LETT |newval| (SPADCALL |newval| |i| (QREFELT $ 63))
                          . #3#)
                    (EXIT (LETT |i| (+ |i| 1) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL . #3#)
              (SEQ (LETT |v| NIL . #3#) (LETT #1# |facet| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ptr| (SPADCALL |v| |oldval| (QREFELT $ 64)) . #3#)
                    (COND ((< |ptr| 1) (|error| "error in reindex")))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |newval| |ptr| (QREFELT $ 65))
                                     (QREFELT $ 63))
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 1 |res|))))) 

(SDEFUN |OFACET;boolWordPermute;2NniL;21|
        ((|numZeros| |NonNegativeInteger|) (|numOnes| |NonNegativeInteger|)
         ($ |List| (|List| (|Boolean|))))
        (SPADCALL NIL |numZeros| |numOnes| (QREFELT $ 68))) 

(SDEFUN |OFACET;boolWordPermute;L2NniL;22|
        ((|wordIn| |List| (|List| (|Boolean|)))
         (|numZeros| |NonNegativeInteger|) (|numOnes| |NonNegativeInteger|)
         ($ |List| (|List| (|Boolean|))))
        (SPROG
         ((|res| (|List| (|List| (|Boolean|))))
          (|word1| (|List| (|List| (|Boolean|))))
          (|subWord| (|List| (|Boolean|))) (#1=#:G864 NIL) (|x| NIL)
          (|z| (|NonNegativeInteger|)) (#2=#:G850 NIL)
          (|word0| (|List| (|List| (|Boolean|)))) (#3=#:G863 NIL)
          (#4=#:G862 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |numZeros| 1)
              (COND
               ((< |numOnes| 1)
                (PROGN
                 (LETT #4# |wordIn| . #5=(|OFACET;boolWordPermute;L2NniL;22|))
                 (GO #6=#:G861))))))
            (LETT |res| NIL . #5#)
            (COND
             ((SPADCALL |numZeros| 0 (QREFELT $ 14))
              (SEQ
               (LETT |z|
                     (PROG2
                         (LETT #2# (SPADCALL |numZeros| 1 (QREFELT $ 71))
                               . #5#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|)
                                                #7="failed")
                                       #2#))
                     . #5#)
               (LETT |word0| NIL . #5#)
               (COND ((NULL |wordIn|) (LETT |word0| (LIST (LIST NIL)) . #5#)))
               (SEQ (LETT |x| NIL . #5#) (LETT #3# |wordIn| . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |subWord| (SPADCALL |x| NIL (QREFELT $ 73)) . #5#)
                     (EXIT
                      (LETT |word0| (SPADCALL |word0| |subWord| (QREFELT $ 74))
                            . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word0| |z| |numOnes| (QREFELT $ 68))
                                (QREFELT $ 75))
                      . #5#)))))
            (COND
             ((SPADCALL |numOnes| 0 (QREFELT $ 14))
              (SEQ
               (LETT |z|
                     (PROG2
                         (LETT #2# (SPADCALL |numOnes| 1 (QREFELT $ 71)) . #5#)
                         (QCDR #2#)
                       (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|) #7#)
                                       #2#))
                     . #5#)
               (LETT |word1| NIL . #5#)
               (COND ((NULL |wordIn|) (LETT |word1| (LIST (LIST 'T)) . #5#)))
               (SEQ (LETT |x| NIL . #5#) (LETT #1# |wordIn| . #5#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (LETT |subWord| (SPADCALL |x| 'T (QREFELT $ 73)) . #5#)
                     (EXIT
                      (LETT |word1| (SPADCALL |word1| |subWord| (QREFELT $ 74))
                            . #5#)))
                    (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word1| |numZeros| |z|
                                          (QREFELT $ 68))
                                (QREFELT $ 75))
                      . #5#)))))
            (EXIT |res|)))
          #6# (EXIT #4#)))) 

(SDEFUN |OFACET;product;2$L;23| ((|a| $) (|b| $) ($ |List| (|ProductFacet|)))
        (SPROG
         ((|res| (|List| (|ProductFacet|))) (|pf| (|ProductFacet|))
          (|i2|
           (|List|
            #1=(|Record| (|:| |left| (|NonNegativeInteger|))
                         (|:| |right| (|NonNegativeInteger|)))))
          (|i| #1#) (|leftIndex| #2=(|NonNegativeInteger|)) (|rightIndex| #2#)
          (#3=#:G879 NIL) (#4=#:G878 NIL) (|perm| NIL)
          (|perms| (|List| (|List| (|Boolean|))))
          (|lenB| (|NonNegativeInteger|)) (#5=#:G866 NIL)
          (|lenA| (|NonNegativeInteger|))
          (|indB| #6=(|List| (|NonNegativeInteger|))) (|indA| #6#))
         (SEQ (LETT |res| NIL . #7=(|OFACET;product;2$L;23|))
              (LETT |indA| (SPADCALL |a| (QREFELT $ 26)) . #7#)
              (LETT |indB| (SPADCALL |b| (QREFELT $ 26)) . #7#)
              (LETT |lenA|
                    (PROG2
                        (LETT #5#
                              (SPADCALL (SPADCALL |indA| (QREFELT $ 41)) 1
                                        (QREFELT $ 71))
                              . #7#)
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|)
                                               #8="failed")
                                      #5#))
                    . #7#)
              (LETT |lenB|
                    (PROG2
                        (LETT #5#
                              (SPADCALL (SPADCALL |indB| (QREFELT $ 41)) 1
                                        (QREFELT $ 71))
                              . #7#)
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #8#)
                                      #5#))
                    . #7#)
              (LETT |perms| (REVERSE (SPADCALL |lenA| |lenB| (QREFELT $ 69)))
                    . #7#)
              (SEQ (LETT |perm| NIL . #7#) (LETT #4# |perms| . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |perm| (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |leftIndex| 1 . #7#) (LETT |rightIndex| 1 . #7#)
                        (LETT |i|
                              (CONS
                               (SPADCALL |indA| |leftIndex| (QREFELT $ 76))
                               (SPADCALL |indB| |rightIndex| (QREFELT $ 76)))
                              . #7#)
                        (LETT |i2| (LIST |i|) . #7#)
                        (SEQ (LETT |b| NIL . #7#) (LETT #3# |perm| . #7#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |b| (CAR #3#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               (|b|
                                (LETT |rightIndex| (+ |rightIndex| 1) . #7#))
                               ('T (LETT |leftIndex| (+ |leftIndex| 1) . #7#)))
                              (COND
                               ((SPADCALL |leftIndex|
                                          (SPADCALL |indA| (QREFELT $ 41))
                                          (QREFELT $ 14))
                                (|error| "leftIndex too high in product")))
                              (COND
                               ((SPADCALL |rightIndex|
                                          (SPADCALL |indB| (QREFELT $ 41))
                                          (QREFELT $ 14))
                                (|error| "rightIndex too high in product")))
                              (LETT |i|
                                    (CONS
                                     (SPADCALL |indA| |leftIndex|
                                               (QREFELT $ 76))
                                     (SPADCALL |indB| |rightIndex|
                                               (QREFELT $ 76)))
                                    . #7#)
                              (EXIT
                               (LETT |i2| (SPADCALL |i2| |i| (QREFELT $ 79))
                                     . #7#)))
                             (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |pf| (SPADCALL 1 |i2| (QREFELT $ 81)) . #7#)
                        (EXIT
                         (LETT |res| (SPADCALL |res| |pf| (QREFELT $ 83))
                               . #7#)))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;position;$LI;24| ((|e| $) (|lst| |List| $) ($ |Integer|))
        (SPROG ((#1=#:G888 NIL) (|res| (|Integer|)) (#2=#:G889 NIL) (|x| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |res| 1 . #3=(|OFACET;position;$LI;24|))
                      (SEQ (LETT |x| NIL . #3#) (LETT #2# |lst| . #3#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |x| (CAR #2#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |e|) (QCDR |x|) (QREFELT $ 85))
                              (SEQ
                               (COND
                                ((EQL (QCAR |e|) (QCAR |x|))
                                 (PROGN
                                  (LETT #1# |res| . #3#)
                                  (GO #4=#:G887))))
                               (EXIT
                                (PROGN (LETT #1# (- |res|) . #3#) (GO #4#))))))
                            (EXIT (LETT |res| (+ |res| 1) . #3#)))
                           (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (PROGN (LETT #1# 0 . #3#) (GO #4#)))))
                #4# (EXIT #1#)))) 

(SDEFUN |OFACET;addVertex;$Nni$;25| ((|sa| $) (|v| |NonNegativeInteger|) ($ $))
        (SPROG ((|f| (|List| (|NonNegativeInteger|))))
               (SEQ (LETT |f| (QCDR |sa|) . #1=(|OFACET;addVertex;$Nni$;25|))
                    (LETT |f| (SPADCALL |f| |v| (QREFELT $ 63)) . #1#)
                    (EXIT (SPADCALL 1 |f| (QREFELT $ 15)))))) 

(SDEFUN |OFACET;sameFace?;2$B;26| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((|vertsb| #1=(|List| (|NonNegativeInteger|))) (|vertsa| #1#))
               (SEQ (LETT |vertsa| (QCDR |a|) . #2=(|OFACET;sameFace?;2$B;26|))
                    (LETT |vertsb| (QCDR |b|) . #2#)
                    (EXIT (NULL (SPADCALL |vertsa| |vertsb| (QREFELT $ 87))))))) 

(SDEFUN |OFACET;ltLocal|
        ((|a| |List| (|NonNegativeInteger|))
         (|b| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G901 NIL) (|b1| #2=(|NonNegativeInteger|)) (|a1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| |b| (QREFELT $ 85))
                    (PROGN
                     (LETT #1# NIL . #3=(|OFACET;ltLocal|))
                     (GO #4=#:G900))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 41)) 1)
                    (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT $ 41)) 1)
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (LETT |a1| (|SPADfirst| |a|) . #3#)
                  (LETT |b1| (|SPADfirst| |b|) . #3#)
                  (COND ((< |a1| |b1|) (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (COND
                   ((SPADCALL |a1| |b1| (QREFELT $ 14))
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT $ 41)) 2)
                    (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT $ 41)) 2)
                    (PROGN (LETT #1# NIL . #3#) (GO #4#))))
                  (EXIT (|OFACET;ltLocal| (CDR |a|) (CDR |b|) $))))
                #4# (EXIT #1#)))) 

(SDEFUN |OFACET;<;2$B;28| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG ((|b| #1=(|List| (|NonNegativeInteger|))) (|a| #1#))
               (SEQ (LETT |a| (QCDR |ain|) . #2=(|OFACET;<;2$B;28|))
                    (LETT |b| (QCDR |bin|) . #2#)
                    (EXIT (|OFACET;ltLocal| |a| |b| $))))) 

(SDEFUN |OFACET;<=;2$B;29| ((|ain| $) (|bin| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G906 NIL) (|b| #2=(|List| (|NonNegativeInteger|))) (|a| #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (QCDR |ain|) . #3=(|OFACET;<=;2$B;29|))
                (LETT |b| (QCDR |bin|) . #3#)
                (COND
                 ((SPADCALL |a| |b| (QREFELT $ 85))
                  (PROGN (LETT #1# 'T . #3#) (GO #4=#:G905))))
                (EXIT (|OFACET;ltLocal| |a| |b| $))))
          #4# (EXIT #1#)))) 

(SDEFUN |OFACET;=;2$B;30| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG ((#1=#:G911 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 91))
                    (PROGN (LETT #1# NIL |OFACET;=;2$B;30|) (GO #2=#:G910))))
                  (EXIT (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT $ 85)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;coerce;$Of;31| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|body| (|OutputForm|)) (|elements| (|List| (|OutputForm|)))
          (#1=#:G919 NIL) (|x| NIL) (#2=#:G918 NIL) (|prefix| (|OutputForm|))
          (|m| (|Integer|)))
         (SEQ (LETT |prefix| "" . #3=(|OFACET;coerce;$Of;31|))
              (LETT |m| (QCAR |s|) . #3#)
              (COND
               ((SPADCALL (ABS |m|) 1 (QREFELT $ 91))
                (LETT |prefix|
                      (SPADCALL (SPADCALL |m| (QREFELT $ 92)) "*"
                                (QREFELT $ 37))
                      . #3#)))
              (COND ((EQL |m| -1) (LETT |prefix| "-" . #3#)))
              (LETT |elements|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |x| NIL . #3#) (LETT #1# (QCDR |s|) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 93)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (LETT |body| (SPADCALL |elements| (QREFELT $ 94)) . #3#)
              (EXIT (SPADCALL |prefix| |body| (QREFELT $ 37)))))) 

(DECLAIM (NOTINLINE |OrientedFacet;|)) 

(DEFUN |OrientedFacet| ()
  (SPROG NIL
         (PROG (#1=#:G922)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OrientedFacet|)
                    . #2=(|OrientedFacet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OrientedFacet|
                             (LIST (CONS NIL (CONS 1 (|OrientedFacet;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OrientedFacet|)))))))))) 

(DEFUN |OrientedFacet;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OrientedFacet|) . #1=(|OrientedFacet|))
          (LETT $ (GETREFV 98) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OrientedFacet| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |mul| (|Integer|))
                              (|:| |fac| (|List| (|NonNegativeInteger|)))))
          $))) 

(MAKEPROP '|OrientedFacet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 10) (0 . |sort|)
              (|Boolean|) (|NonNegativeInteger|) (5 . ~=) (|Integer|)
              (11 . |even?|) (16 . >) |OFACET;orientedFacet;IL$;1|
              (22 . |removeDuplicates|) (|List| 12)
              |OFACET;orientedFacetUnsigned;L$;2|
              |OFACET;orientedFacetSigned;L$;3| (|OrientedFacet|)
              (27 . |getIndexes|) |OFACET;orientedFacet;I2$;4| (|List| $$)
              (32 . |#|) (37 . |sort|) |OFACET;getIndexes;$L;7| (|List| 7)
              (42 . |concat|) (48 . |concat|) (|List| $) |OFACET;delta;$L;13|
              (54 . |first|) |OFACET;position;$LI;24| (59 . <=) (|OutputForm|)
              |OFACET;coerce;$Of;31| (65 . |hconcat|) (|Void|) (71 . |print|)
              |OFACET;orientedFacet;L$;5| (76 . |#|) |OFACET;order;$Nni;6|
              |OFACET;minIndex;$Nni;8| |OFACET;maxIndex;$Nni;9| (81 . |sign|)
              (86 . |concat|) |OFACET;getIndexesSigned;$L;10|
              |OFACET;getMult;$I;11| |OFACET;setMult!;$I$;12| (92 . |remove|)
              (98 . |concat|) (104 . |empty?|) (109 . |member?|)
              (115 . |empty?|) (120 . |copy|) (125 . <=)
              |OFACET;allSubsets;$NniL;16| |OFACET;allSubsets;$2NniL;17|
              |OFACET;=;2$B;30| |OFACET;isSubsetOf?;2$B;18|
              (131 . |setDifference|) |OFACET;subtract;3$;19| (137 . |concat|)
              (143 . |position|) (149 . |qelt|) |OFACET;reindex;2$;20|
              (|List| 72) |OFACET;boolWordPermute;L2NniL;22|
              |OFACET;boolWordPermute;2NniL;21| (|Union| $ '"failed")
              (155 . |subtractIfCan|) (|List| 9) (161 . |concat|)
              (167 . |concat|) (173 . |concat|) (179 . |elt|)
              (|Record| (|:| |left| 10) (|:| |right| 10)) (|List| 77)
              (185 . |concat|) (|ProductFacet|) (191 . |productFacet|)
              (|List| 80) (197 . |concat|) |OFACET;product;2$L;23| (203 . =)
              |OFACET;addVertex;$Nni$;25| (209 . ~=) |OFACET;sameFace?;2$B;26|
              |OFACET;<;2$B;28| |OFACET;<=;2$B;29| (215 . ~=) (221 . |coerce|)
              (226 . |coerce|) (231 . |paren|) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 236 |subtract| 242 |smaller?| 248 |setMult!| 254 |sameFace?|
              260 |reindex| 266 |product| 271 |position| 277
              |orientedFacetUnsigned| 283 |orientedFacetSigned| 288
              |orientedFacet| 293 |order| 310 |minIndex| 315 |min| 320
              |maxIndex| 326 |max| 331 |latex| 337 |isSubsetOf?| 342
              |hashUpdate!| 348 |hash| 354 |getMult| 359 |getIndexesSigned| 364
              |getIndexes| 369 |empty?| 374 |delta| 379 |coerce| 384
              |boolWordPermute| 389 |allSubsets| 402 |addVertex| 415 >= 421 >
              427 = 433 <= 439 < 445)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|FacetCategory&| |OrderedSet&| NIL |SetCategory&|
                     |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|FacetCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|PartialOrder|) (|BasicType|)
                      (|CoercibleTo| 35))
                   (|makeByteWordVec2| 97
                                       '(1 7 0 0 8 2 10 9 0 0 11 1 12 9 0 13 2
                                         10 9 0 0 14 1 7 0 0 16 1 20 7 0 21 1
                                         23 10 0 24 1 23 0 0 25 2 27 0 0 7 28 2
                                         7 0 0 0 29 1 23 2 0 32 2 12 9 0 0 34 2
                                         35 0 0 0 37 1 35 38 0 39 1 7 10 0 41 1
                                         12 12 0 45 2 17 0 0 12 46 2 7 0 10 0
                                         50 2 23 0 0 2 51 1 0 9 0 52 2 23 9 2 0
                                         53 1 23 9 0 54 1 23 0 0 55 2 10 9 0 0
                                         56 2 7 0 0 0 61 2 7 0 0 10 63 2 7 12
                                         10 0 64 2 7 10 0 12 65 2 10 70 0 0 71
                                         2 72 0 0 9 73 2 67 0 0 72 74 2 67 0 0
                                         0 75 2 7 10 0 12 76 2 78 0 0 77 79 2
                                         80 0 12 78 81 2 82 0 0 80 83 2 7 9 0 0
                                         85 2 7 9 0 0 87 2 12 9 0 0 91 1 12 35
                                         0 92 1 10 35 0 93 1 35 0 30 94 2 0 9 0
                                         0 1 2 0 0 0 0 62 2 0 9 0 0 1 2 0 0 0
                                         12 49 2 0 9 0 0 88 1 0 0 0 66 2 0 82 0
                                         0 84 2 0 12 0 30 33 1 0 0 17 18 1 0 0
                                         17 19 2 0 0 12 20 22 1 0 0 30 40 2 0 0
                                         12 7 15 1 0 10 0 42 1 0 10 0 43 2 0 0
                                         0 0 1 1 0 10 0 44 2 0 0 0 0 1 1 0 95 0
                                         1 2 0 9 0 0 60 2 0 97 97 0 1 1 0 96 0
                                         1 1 0 12 0 48 1 0 17 0 47 1 0 7 0 26 1
                                         0 9 0 52 1 0 30 0 31 1 0 35 0 36 2 0
                                         67 10 10 69 3 0 67 67 10 10 68 2 0 30
                                         0 10 57 3 0 30 0 10 10 58 2 0 0 0 10
                                         86 2 0 9 0 0 1 2 0 9 0 0 1 2 0 9 0 0
                                         59 2 0 9 0 0 90 2 0 9 0 0 89)))))
           '|lookupComplete|)) 

(MAKEPROP '|OrientedFacet| 'NILADIC T) 
