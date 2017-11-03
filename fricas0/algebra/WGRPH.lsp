
(SDEFUN |WGRPH;weightedGraph;L$;1| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (#1=#:G742 NIL) (|x| NIL) (#2=#:G741 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL . #3=(|WGRPH;weightedGraph;L$;1|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (VECTOR |x| 0 0 (|spadConstant| $ 9)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (CONS |objs| NIL))))) 

(PUT '|WGRPH;weightedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |WGRPH;weightedGraph;L$;2|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
         ($ $))
        (CONS |ob| NIL)) 

(PUT '|WGRPH;weightedGraph;LL$;3| '|SPADreplace| 'CONS) 

(SDEFUN |WGRPH;weightedGraph;LL$;3|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
         (|ar| |List|
          (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         ($ $))
        (CONS |ob| |ar|)) 

(SDEFUN |WGRPH;weightedGraph;LL$;4|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         (|ar| |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|)))))
         ($ $))
        (SPROG
         ((|fobs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|fo| #1#) (#2=#:G783 NIL) (|f| NIL) (#3=#:G784 NIL) (|fn| NIL)
          (|arrs|
           (|List|
            #4=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arro| #4#) (#5=#:G782 NIL) (|a| NIL))
         (SEQ (LETT |arrs| NIL . #6=(|WGRPH;weightedGraph;LL$;4|))
              (SEQ (LETT |a| NIL . #6#) (LETT #5# |ar| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |arro|
                          (VECTOR (QVELT |a| 0) (|spadConstant| $ 9)
                                  (QVELT |a| 2) (QVELT |a| 3) (QVELT |a| 4)
                                  (QVELT |a| 5) (QVELT |a| 6))
                          . #6#)
                    (EXIT
                     (LETT |arrs| (SPADCALL |arrs| |arro| (QREFELT $ 18))
                           . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |fobs| NIL . #6#)
              (SEQ (LETT |fn| 1 . #6#) (LETT #3# (LENGTH |ob|) . #6#)
                   (LETT |f| NIL . #6#) (LETT #2# |ob| . #6#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #6#) NIL)
                         (|greater_SI| |fn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |fo|
                          (VECTOR (QVELT |f| 0) (QVELT |f| 1) (QVELT |f| 2)
                                  (|spadConstant| $ 9))
                          . #6#)
                    (EXIT
                     (LETT |fobs| (SPADCALL |fobs| |fo| (QREFELT $ 19))
                           . #6#)))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |fn| (|inc_SI| |fn|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |fobs| |arrs|))))) 

(SDEFUN |WGRPH;weightedGraph;LL$;5|
        ((|obs| |List| S)
         (|ars| |List|
          (|Record| (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))))
         ($ $))
        (SPROG
         ((|edges|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (#1=#:G798 NIL) (|ar| NIL) (#2=#:G799 NIL) (|arn| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#3=#:G796 NIL) (|ob| NIL) (#4=#:G797 NIL) (|obn| NIL))
         (SEQ (LETT |nodes| NIL . #5=(|WGRPH;weightedGraph;LL$;5|))
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |obs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |obs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT $ 26))
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT $ 27)))
                          . #5#)
                    (EXIT
                     (LETT |nodes| (SPADCALL |nodes| |o| (QREFELT $ 28))
                           . #5#)))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |edges| NIL . #5#)
              (SEQ (LETT |arn| 1 . #5#) (LETT #2# (LENGTH |ars|) . #5#)
                   (LETT |ar| NIL . #5#) (LETT #1# |ars| . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ar| (CAR #1#) . #5#) NIL)
                         (|greater_SI| |arn| #2#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |edges|
                           (SPADCALL |edges|
                                     (VECTOR (STRCONC "a" (STRINGIMAGE |arn|))
                                             0 (QCAR |ar|) (QCDR |ar|) 0 0 NIL)
                                     (QREFELT $ 29))
                           . #5#)))
                   (LETT #1#
                         (PROG1 (CDR #1#) (LETT |arn| (|inc_SI| |arn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |nodes| |edges| (QREFELT $ 24)))))) 

(SDEFUN |WGRPH;weightedGraph;Fp$;6| ((|poset| |FinitePoset| S) ($ $))
        (SPROG
         ((|ars|
           (|List|
            #1=(|Record| (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|)))))
          (|z| #1#) (#2=#:G808 NIL) (|y| NIL) (#3=#:G809 NIL) (|yn| NIL)
          (#4=#:G806 NIL) (|x| NIL) (#5=#:G807 NIL) (|xn| NIL)
          (|mat| (|List| (|List| (|Boolean|)))) (|obs| (|List| S)))
         (SEQ
          (LETT |obs| (SPADCALL |poset| (QREFELT $ 34))
                . #6=(|WGRPH;weightedGraph;Fp$;6|))
          (LETT |ars| NIL . #6#)
          (LETT |mat| (SPADCALL |poset| (QREFELT $ 36)) . #6#)
          (SEQ (LETT |xn| 1 . #6#) (LETT #5# (LENGTH |mat|) . #6#)
               (LETT |x| NIL . #6#) (LETT #4# |mat| . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#) . #6#) NIL)
                     (|greater_SI| |xn| #5#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |yn| 1 . #6#) (LETT #3# (LENGTH |x|) . #6#)
                      (LETT |y| NIL . #6#) (LETT #2# |x| . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |y| (CAR #2#) . #6#) NIL)
                            (|greater_SI| |yn| #3#))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         (|y|
                          (SEQ (LETT |z| (CONS |xn| |yn|) . #6#)
                               (EXIT
                                (LETT |ars| (SPADCALL |ars| |z| (QREFELT $ 37))
                                      . #6#)))))))
                      (LETT #2#
                            (PROG1 (CDR #2#) (LETT |yn| (|inc_SI| |yn|) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #4# (PROG1 (CDR #4#) (LETT |xn| (|inc_SI| |xn|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |obs| |ars| (QREFELT $ 32)))))) 

(SDEFUN |WGRPH;weightedGraph;LL$;7|
        ((|objs| |List| S) (|am| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|ar|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G825 NIL) (|j| NIL) (#3=#:G824 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #4#) (|ob| (S)) (#5=#:G823 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|WGRPH;weightedGraph;LL$;7|))
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#) G190
                   (COND ((|greater_SI| |obn| #5#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 40)) . #6#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 27))
                                  (|spadConstant| $ 9))
                          . #6#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #6#)))
                   (LETT |obn| (|inc_SI| |obn|) . #6#) (GO G190) G191
                   (EXIT NIL))
              (LETT |ar| NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# (LENGTH |am|) . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 43))
                                          (QREFELT $ 44))
                                . #6#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 43)) |j|
                                         (QREFELT $ 45))
                               1)
                              (SEQ
                               (LETT |a|
                                     (VECTOR "a" (|spadConstant| $ 9) |i| |j| 0
                                             0 NIL)
                                     . #6#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 18))
                                      . #6#)))))))
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |WGRPH;addObject!;$S$;8| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|WGRPH;addObject!;$S$;8|))
              (LETT |obj| (VECTOR |n| 0 0 (|spadConstant| $ 9)) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 48))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 19)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |WGRPH;addObject!;$R$;9|
        ((|s| $)
         (|n| |Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
          (|:| |posY| #1#))
         ($ $))
        (SEQ
         (|error|
          "this form of addObject! not supported in multifunctionGraph")
         (EXIT (CONS NIL NIL)))) 

(SDEFUN |WGRPH;addArrow!;$R$;10|
        ((|s| $)
         (|ar| |Record| (|:| |name| (|String|))
          (|:| |arrType| #1=(|NonNegativeInteger|)) (|:| |fromOb| #1#)
          (|:| |toOb| #1#) (|:| |xOffset| #2=(|Integer|)) (|:| |yOffset| #2#)
          (|:| |map| (|List| #1#)))
         ($ $))
        (SPADCALL |s| (QVELT |ar| 0) (QVELT |ar| 2) (QVELT |ar| 3)
                  (|spadConstant| $ 9) (QREFELT $ 52))) 

(SDEFUN |WGRPH;addArrow!;$S2Nni$;11|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPADCALL |s| |nm| |n1| |n2| (|spadConstant| $ 9) (QREFELT $ 52))) 

(SDEFUN |WGRPH;addWArrow!;$S2NniW$;12|
        ((|s| $) (|nm| |String|) (|n1| |NonNegativeInteger|)
         (|n2| |NonNegativeInteger|) (|w| W) ($ $))
        (SPROG
         ((#1=#:G844 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrss|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|) . #2=(|WGRPH;addWArrow!;$S2NniW$;12|))
                (LETT |a| (VECTOR |nm| |w| |n1| |n2| 0 0 NIL) . #2#)
                (EXIT
                 (COND
                  ((NULL |arrss|)
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #1# |s| . #2#) (GO #3=#:G843)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 18)) . #2#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #1# |s| . #2#) (GO #3#)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |WGRPH;getVertices;$L;13|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                       (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #1#) (#2=#:G851 NIL) (|soj| NIL))
         (SEQ (LETT |res| NIL . #3=(|WGRPH;getVertices;$L;13|))
              (SEQ (LETT |soj| NIL . #3#) (LETT #2# (QCAR |s|) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |soj| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR (QVELT |soj| 0) (QVELT |soj| 1)
                                  (QVELT |soj| 2))
                          . #3#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| |o| (QREFELT $ 28)) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;getArrows;$L;14|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |name| (|String|))
                       (|:| |arrType| (|NonNegativeInteger|))
                       (|:| |fromOb| (|NonNegativeInteger|))
                       (|:| |toOb| (|NonNegativeInteger|))
                       (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                       (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|aw| #1#) (#2=#:G858 NIL) (|a| NIL))
         (SEQ (LETT |arrs| NIL . #3=(|WGRPH;getArrows;$L;14|))
              (SEQ (LETT |a| NIL . #3#) (LETT #2# (QCDR |s|) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |aw|
                          (VECTOR (QVELT |a| 0) 0 (QVELT |a| 2) (QVELT |a| 3)
                                  (QVELT |a| 4) (QVELT |a| 5) (QVELT |a| 6))
                          . #3#)
                    (EXIT
                     (LETT |arrs| (SPADCALL |arrs| |aw| (QREFELT $ 29))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |arrs|)))) 

(PUT '|WGRPH;initial;$;15| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |WGRPH;initial;$;15| (($ $)) (CONS NIL NIL)) 

(SDEFUN |WGRPH;terminal;S$;16| ((|a| S) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
         (SEQ
          (LETT |o| (VECTOR |a| 0 0 (|spadConstant| $ 9))
                . #1=(|WGRPH;terminal;S$;16|))
          (LETT |ar| (VECTOR "loop" (|spadConstant| $ 9) 1 1 0 0 NIL) . #1#)
          (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |WGRPH;cycleOpen;LS$;17|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #2#) (|ob| (S)) (#3=#:G874 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|WGRPH;cycleOpen;LS$;17|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 40)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 27))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 59))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |next| 0 0
                                      NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;cycleClosed;LS$;18|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #2#) (|ob| (S)) (#3=#:G884 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|WGRPH;cycleClosed;LS$;18|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 40)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 27))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #4#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 59))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |next| 0 0
                                      NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;unit;LS$;19| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#)
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #2#) (|ob| (S)) (#3=#:G892 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|WGRPH;unit;LS$;19|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 40)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 27))
                                  (|spadConstant| $ 9))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #4#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                  (|spadConstant| $ 9) |obn| |obn| 0 0 NIL)
                          . #4#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18)) . #4#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #4#)))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;kgraph;LS$;20| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G904 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|))
                         (|:| |weight| W))))
          (|o| #3#) (|ob| (S)) (#4=#:G903 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|WGRPH;kgraph;LS$;20|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#) G190
                   (COND ((|greater_SI| |obn| #4#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 40)) . #5#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 26))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 27))
                                  (|spadConstant| $ 9))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 19)) . #5#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #5#) (LETT #2# (LENGTH |objs|) . #5#)
                          G190 (COND ((|greater_SI| |obm| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 63))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      (|spadConstant| $ 9) |obn| |obm| 0 0 NIL)
                                     . #5#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 18))
                                     . #5#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |obn| (|inc_SI| |obn|) . #5#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |WGRPH;+;3$;21| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (#2=#:G912 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))))
         (SEQ
          (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 65))
                . #3=(|WGRPH;+;3$;21|))
          (LETT |bStart| (LENGTH (QCAR |a|)) . #3#) (LETT |lb| NIL . #3#)
          (SEQ (LETT |ba| NIL . #3#) (LETT #2# (QCDR |b|) . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ba| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1)
                              (+ (QVELT |ba| 2) |bStart|)
                              (+ (QVELT |ba| 3) |bStart|) (QVELT |ba| 4)
                              (QVELT |ba| 5) (QVELT |ba| 6))
                      . #3#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 18)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 66)) . #3#)
          (EXIT (CONS |lo| |la|))))) 

(SDEFUN |WGRPH;merge;3$;22| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|fromI| #2=(|NonNegativeInteger|)) (|toI| #2#)
          (#3=#:G933 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G921 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|i| (|Integer|)) (#6=#:G932 NIL) (|bob| NIL) (#7=#:G931 NIL)
          (|x| NIL) (#8=#:G930 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL . #9=(|WGRPH;merge;3$;22|))
                 (SEQ (LETT |x| 1 . #9#) (LETT #7# (LENGTH (QCAR |a|)) . #9#)
                      G190 (COND ((|greater_SI| |x| #7#) (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS |x| #8#) . #9#)))
                      (LETT |x| (|inc_SI| |x|) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |newIndex| (LENGTH (QCAR |a|)) . #9#)
          (LETT |mergedObjects| (QCAR |a|) . #9#)
          (SEQ (LETT |bob| NIL . #9#) (LETT #6# (QCAR |b|) . #9#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |bob| (CAR #6#) . #9#) NIL))
                 (GO G191)))
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 68)) . #9#)
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 19))
                              . #9#)
                        (LETT |newIndex| (+ |newIndex| 1) . #9#)
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 69))
                               . #9#))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i| . #9#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 69))
                             . #9#)))))
               (LETT #6# (CDR #6#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |bStart| (LENGTH (QCAR |a|)) . #9#) (LETT |lb| NIL . #9#)
          (SEQ (LETT |ba| NIL . #9#) (LETT #3# (QCDR |b|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |ba| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |toI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 3) |bStart|)
                                (QREFELT $ 45))
                      . #9#)
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 45))
                      . #9#)
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                      . #9#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 18)) . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 66)) . #9#)
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |WGRPH;objProd|
        ((|a| $) (|b| $)
         ($ |List|
          (|Record| (|:| |value| (|Product| S S))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| (|Product| S S))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|ob|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W)))
          (|sp| (|Product| S S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #1=(|NonNegativeInteger|))
          (|x| #1#) (|byi| #2=(|NonNegativeInteger|))
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G945 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G944 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|WGRPH;objProd|))
              (SEQ (LETT |aoi| NIL . #6#) (LETT #5# (QCAR |a|) . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |aoi| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #6#)
                        (LETT |axi| (QVELT |aoi| 1) . #6#)
                        (LETT |ayi| (QVELT |aoi| 2) . #6#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #6#)
                              (LETT #4# (QCAR |b|) . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #6#)
                                   (LETT |bxi| (QVELT |boi| 1) . #6#)
                                   (LETT |byi| (QVELT |boi| 2) . #6#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 71)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 72)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 71))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 72)) . #6#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 74))
                                         . #6#)
                                   (LETT |ob|
                                         (VECTOR |sp| |x| |y|
                                                 (|spadConstant| $ 9))
                                         . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 77))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |WGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G946 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |WGRPH;indexProd|)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |WGRPH;*;2$Wg;25|
        ((|a| $) (|b| $) ($ |WeightedGraph| (|Product| S S) W))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G970 NIL) (|bv| NIL)
          (#3=#:G969 NIL) (|bu| NIL) (#4=#:G968 NIL) (|av| NIL) (#5=#:G967 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;*;2$Wg;25|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT $ 78))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 78))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          79))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          79)))
                                                      (QREFELT $ 81))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 83)))))) 

(SDEFUN |WGRPH;cartesian;2$Wg;26|
        ((|a| $) (|b| $) ($ |WeightedGraph| (|Product| S S) W))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G995 NIL) (|bv| NIL)
          (#3=#:G994 NIL) (|bu| NIL) (#4=#:G993 NIL) (|av| NIL) (#5=#:G992 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;cartesian;2$Wg;26|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT $ 78))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            78))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              79))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 81)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              79))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 81)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            79))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 81))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 78))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              78))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 79))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 81)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 79))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 81)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              79))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 81))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an|
                                                               (|spadConstant|
                                                                $ 9)
                                                               (|WGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|WGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           18))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 78))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            78))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              79))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 81)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              79))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 81)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            79))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 81))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 83)))))) 

(SDEFUN |WGRPH;closedObjProd|
        ((|a| $) (|b| $) (|f| |Mapping| S S S)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (|ob|
           (|Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
                     (|:| |posY| #2=(|NonNegativeInteger|)) (|:| |weight| W)))
          (|sp| (S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #3=(|NonNegativeInteger|))
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G1004 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G1003 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|WGRPH;closedObjProd|))
              (SEQ (LETT |aoi| NIL . #6#) (LETT #5# (QCAR |a|) . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |aoi| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |ai| (QVELT |aoi| 0) . #6#)
                        (LETT |axi| (QVELT |aoi| 1) . #6#)
                        (LETT |ayi| (QVELT |aoi| 2) . #6#)
                        (EXIT
                         (SEQ (LETT |boi| NIL . #6#)
                              (LETT #4# (QCAR |b|) . #6#) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |boi| (CAR #4#) . #6#) NIL))
                                (GO G191)))
                              (SEQ (LETT |bi| (QVELT |boi| 0) . #6#)
                                   (LETT |bxi| (QVELT |boi| 1) . #6#)
                                   (LETT |byi| (QVELT |boi| 2) . #6#)
                                   (LETT |x|
                                         (+
                                          (* |bxi|
                                             (SPADCALL |a| (QREFELT $ 71)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 72)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 71))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 72)) . #6#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #6#)
                                   (LETT |ob|
                                         (VECTOR |sp| |x| |y|
                                                 (|spadConstant| $ 9))
                                         . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 19))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |WGRPH;closedTensor;2$M$;28|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G1025 NIL) (|bv| NIL)
          (#3=#:G1024 NIL) (|bu| NIL) (#4=#:G1023 NIL) (|av| NIL)
          (#5=#:G1022 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;closedTensor;2$M$;28|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |a| |au| |av|
                                                      (QREFELT $ 78))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 78))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          79))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          79)))
                                                      (QREFELT $ 81))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |WGRPH;closedCartesian;2$M$;29|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G1051 NIL) (|bv| NIL)
          (#3=#:G1050 NIL) (|bu| NIL) (#4=#:G1049 NIL) (|av| NIL)
          (#5=#:G1048 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|WGRPH;closedCartesian;2$M$;29|))
              (SEQ (LETT |au| 1 . #6#) (LETT #5# (LENGTH (QCAR |a|)) . #6#)
                   G190 (COND ((|greater_SI| |au| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |av| 1 . #6#)
                          (LETT #4# (LENGTH (QCAR |a|)) . #6#) G190
                          (COND ((|greater_SI| |av| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |bu| 1 . #6#)
                                 (LETT #3# (LENGTH (QCAR |b|)) . #6#) G190
                                 (COND ((|greater_SI| |bu| #3#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |bv| 1 . #6#)
                                        (LETT #2# (LENGTH (QCAR |b|)) . #6#)
                                        G190
                                        (COND
                                         ((|greater_SI| |bv| #2#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQL |bu| |bv|)
                                            (COND
                                             ((SPADCALL |a| |au| |av|
                                                        (QREFELT $ 78))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            78))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              79))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 81)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              79))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 81)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            79))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 81))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 78))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              78))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 79))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 81)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 79))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 81)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              79))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 81))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an|
                                                               (|spadConstant|
                                                                $ 9)
                                                               (|WGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|WGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           18))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 78))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            78))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              79))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 81)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              79))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 81)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            79))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 81))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an|
                                                             (|spadConstant| $
                                                                             9)
                                                             (|WGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|WGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 18))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|WGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |WGRPH;map;$LL2I$;30|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G1068 NIL) (|oldArrow| NIL) (#4=#:G1056 NIL)
          (#5=#:G1055 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G1067 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (#7=#:G1066 NIL) (|o| NIL) (#8=#:G1065 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|WGRPH;map;$LL2I$;30|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS (VECTOR |o| 0 0 (|spadConstant| $ 9)) #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 45)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 89))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 89))
                                            1)
                                           |offsetX|)
                                          . #9#)
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 89))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (|spadConstant| $ 9))
                               (QREFELT $ 90))))
               (LETT |oi| (|inc_SI| |oi|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL . #9#)
          (SEQ (LETT |oldArrow| NIL . #9#) (LETT #3# (QCDR |s|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |oldArrow| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 45))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 45))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 18))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |WGRPH;mapContra;$LL2I$;31|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|)) (|:| |weight| W)
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G1085 NIL) (|oldArrow| NIL) (#4=#:G1073 NIL)
          (#5=#:G1072 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G1084 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)) (|:| |weight| W))))
          (#7=#:G1083 NIL) (|o| NIL) (#8=#:G1082 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|WGRPH;mapContra;$LL2I$;31|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS (VECTOR |o| 0 0 (|spadConstant| $ 9)) #8#)
                              . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 45)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 89))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 89))
                                            1)
                                           |offsetX|)
                                          . #9#)
                                  (|check_subtype2| (>= #5# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #5#))
                                (PROG1
                                    (LETT #4#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 89))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (|spadConstant| $ 9))
                               (QREFELT $ 90))))
               (LETT |oi| (|inc_SI| |oi|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |newArrs| NIL . #9#)
          (SEQ (LETT |oldArrow| NIL . #9#) (LETT #3# (QCDR |s|) . #9#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |oldArrow| (CAR #3#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |newArr|
                      (VECTOR (QVELT |oldArrow| 0) (QVELT |oldArrow| 1)
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 45))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 45))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 18))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |WGRPH;routeNodeRecursive|
        ((|s| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G1098 NIL) (|shortest| (|List| (|NonNegativeInteger|)))
          (|d| #1#) (#3=#:G1099 NIL) (|arr| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 44))
                        (LENGTH (SPADCALL |s| (QREFELT $ 55))) (QREFELT $ 93))
              (PROGN
               (LETT #2# NIL . #4=(|WGRPH;routeNodeRecursive|))
               (GO #5=#:G1097))))
            (LETT |shortest| NIL . #4#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# (LIST |a|) . #4#) (GO #5#))))
            (COND
             ((SPADCALL |s| |a| |b| (QREFELT $ 78))
              (PROGN (LETT #2# (LIST |a| |b|) . #4#) (GO #5#))))
            (SEQ (LETT |arr| NIL . #4#)
                 (LETT #3# (SPADCALL |s| (QREFELT $ 56)) . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |arr| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 78))
                     (SEQ
                      (LETT |d|
                            (|WGRPH;routeNodeRecursive| |s| (QVELT |arr| 2) |b|
                             (SPADCALL |visited| |a| (QREFELT $ 69)) $)
                            . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| NIL (QREFELT $ 94))
                         (LETT |shortest| |d| . #4#))
                        ((SPADCALL |d| NIL (QREFELT $ 95))
                         (COND
                          ((SPADCALL
                            (SPADCALL |s| (CONS |a| |d|) (QREFELT $ 96))
                            (SPADCALL |s| (CONS |a| |shortest|) (QREFELT $ 96))
                            (QREFELT $ 97))
                           (LETT |shortest| |d| . #4#)))))))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| NIL (QREFELT $ 94))
              (PROGN (LETT #2# NIL . #4#) (GO #5#))))
            (EXIT (CONS |a| |shortest|))))
          #5# (EXIT #2#)))) 

(SDEFUN |WGRPH;routeNodes;$2NniL;33|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |List| (|NonNegativeInteger|)))
        (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |WGRPH;routeArrowRecursive|
        ((|s| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         (|visited| |List| (|NonNegativeInteger|))
         ($ . #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((#2=#:G1116 NIL)
          (|shortestFullPath| (|List| #3=(|NonNegativeInteger|)))
          (|shortest| (|List| #3#))
          (|fullPath| (|List| (|NonNegativeInteger|))) (|d| #1#) (|aa| #3#)
          (#4=#:G1117 NIL) (|arr| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arrn| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (SPADCALL |visited| (QREFELT $ 44))
                        (LENGTH (SPADCALL |s| (QREFELT $ 55))) (QREFELT $ 93))
              (PROGN
               (LETT #2# (LIST 0) . #5=(|WGRPH;routeArrowRecursive|))
               (GO #6=#:G1115))))
            (LETT |shortest| (LIST 0) . #5#)
            (COND ((EQL |a| |b|) (PROGN (LETT #2# NIL . #5#) (GO #6#))))
            (LETT |arrn| (SPADCALL |s| |a| |b| (QREFELT $ 99)) . #5#)
            (COND
             ((SPADCALL |arrn| 0 (QREFELT $ 63))
              (PROGN (LETT #2# (LIST |arrn|) . #5#) (GO #6#))))
            (LETT |aa| 0 . #5#) (LETT |shortestFullPath| (LIST 0) . #5#)
            (LETT |arrs| (SPADCALL |s| (QREFELT $ 56)) . #5#)
            (SEQ (LETT |arr| NIL . #5#) (LETT #4# |arrs| . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |arr| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 78))
                     (SEQ
                      (LETT |aa|
                            (SPADCALL |s| |a| (QVELT |arr| 2) (QREFELT $ 99))
                            . #5#)
                      (LETT |d|
                            (|WGRPH;routeArrowRecursive| |s| (QVELT |arr| 2)
                             |b| (SPADCALL |visited| |a| (QREFELT $ 69)) $)
                            . #5#)
                      (LETT |fullPath| (CONS |aa| |d|) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |shortest| (LIST 0) (QREFELT $ 94))
                         (SEQ (LETT |shortest| |d| . #5#)
                              (EXIT
                               (LETT |shortestFullPath| |fullPath| . #5#))))
                        ((SPADCALL |d| (LIST 0) (QREFELT $ 95))
                         (COND
                          ((SPADCALL (SPADCALL |s| |fullPath| (QREFELT $ 100))
                                     (SPADCALL |s| |shortestFullPath|
                                               (QREFELT $ 100))
                                     (QREFELT $ 97))
                           (SEQ (LETT |shortest| |d| . #5#)
                                (EXIT
                                 (LETT |shortestFullPath| |fullPath|
                                       . #5#)))))))))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |shortest| (LIST 0) (QREFELT $ 94))
              (PROGN (LETT #2# (LIST 0) . #5#) (GO #6#))))
            (EXIT |shortestFullPath|)))
          #6# (EXIT #2#)))) 

(SDEFUN |WGRPH;routeArrows;$2NniL;35|
        ((|s| $) (|a| . #1=(|NonNegativeInteger|)) (|b| . #1#)
         ($ |List| (|NonNegativeInteger|)))
        (|WGRPH;routeArrowRecursive| |s| |a| |b| NIL $)) 

(SDEFUN |WGRPH;distanceWeighted;$2NniU;36|
        ((|s| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |Union| W "disjoint"))
        (SPROG ((#1=#:G1129 NIL) (|r| (|List| (|NonNegativeInteger|))))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |r| (|WGRPH;routeNodeRecursive| |s| |a| |b| NIL $)
                        . #2=(|WGRPH;distanceWeighted;$2NniU;36|))
                  (COND
                   ((EQL (SPADCALL |r| (QREFELT $ 44)) 0)
                    (PROGN
                     (LETT #1# (CONS 1 "disjoint") . #2#)
                     (GO #3=#:G1128))))
                  (EXIT (CONS 0 (SPADCALL |s| |r| (QREFELT $ 96))))))
                #3# (EXIT #1#)))) 

(SDEFUN |WGRPH;getWeightBetween|
        ((|s| $) (|i1| |NonNegativeInteger|) (|i2| |NonNegativeInteger|) ($ W))
        (SPROG
         ((|res| (W)) (|isDisjoint| (|Boolean|)) (#1=#:G1141 NIL) (|arr| NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ (LETT |isDisjoint| 'T . #2=(|WGRPH;getWeightBetween|))
              (LETT |res| (|spadConstant| $ 9) . #2#)
              (LETT |arrs| (QCDR |s|) . #2#)
              (SEQ (LETT |arr| NIL . #2#) (LETT #1# |arrs| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arr| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      (|isDisjoint|
                       (COND
                        ((EQL (QVELT |arr| 2) |i1|)
                         (COND
                          ((EQL (QVELT |arr| 3) |i2|)
                           (SEQ (LETT |res| (QVELT |arr| 1) . #2#)
                                (EXIT (LETT |isDisjoint| NIL . #2#))))))))
                      ((EQL (QVELT |arr| 2) |i1|)
                       (COND
                        ((EQL (QVELT |arr| 3) |i2|)
                         (COND
                          ((SPADCALL (QVELT |arr| 1) |res| (QREFELT $ 97))
                           (LETT |res| (QVELT |arr| 1) . #2#)))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |WGRPH;routeNodeWeight;$LW;38|
        ((|s| $) (|r| |List| (|NonNegativeInteger|)) ($ W))
        (SPROG
         ((|lasti| (|NonNegativeInteger|)) (|fst| (|Boolean|)) (|res| (W))
          (|w| (W)) (#1=#:G1147 NIL) (|i| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 9)
                . #2=(|WGRPH;routeNodeWeight;$LW;38|))
          (LETT |fst| 'T . #2#) (LETT |lasti| 0 . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |r| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((NULL |fst|)
                  (SEQ
                   (LETT |w| (|WGRPH;getWeightBetween| |s| |lasti| |i| $)
                         . #2#)
                   (EXIT
                    (LETT |res| (SPADCALL |res| |w| (QREFELT $ 104)) . #2#)))))
                (LETT |fst| NIL . #2#) (EXIT (LETT |lasti| |i| . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |WGRPH;routeArrowWeight;$LW;39|
        ((|s| $) (|r| |List| (|NonNegativeInteger|)) ($ W))
        (SPROG
         ((|res| (W))
          (|a|
           (|Record| (|:| |name| (|String|)) (|:| |weight| W)
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#1=#:G1153 NIL) (|i| NIL))
         (SEQ
          (LETT |res| (|spadConstant| $ 9)
                . #2=(|WGRPH;routeArrowWeight;$LW;39|))
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |r| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |a| (SPADCALL (QCDR |s|) |i| (QREFELT $ 105)) . #2#)
                    (EXIT
                     (LETT |res| (SPADCALL |res| (QVELT |a| 1) (QREFELT $ 104))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |WGRPH;weightedDistanceMatrix;$Tda;40|
        ((|s| $) ($ |TwoDimensionalArray| (|Union| W #1="disjoint")))
        (SPROG
         ((#2=#:G1167 NIL) (|v| NIL) (#3=#:G1166 NIL) (|u| NIL)
          (|m| (|TwoDimensionalArray| (|Union| W #1#)))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n| (LENGTH (SPADCALL |s| (QREFELT $ 55)))
                . #4=(|WGRPH;weightedDistanceMatrix;$Tda;40|))
          (LETT |m| (MAKE_MATRIX1 |n| |n| (CONS 0 (|spadConstant| $ 9))) . #4#)
          (SEQ (LETT |u| 1 . #4#) (LETT #3# |n| . #4#) G190
               (COND ((|greater_SI| |u| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |v| 1 . #4#) (LETT #2# |n| . #4#) G190
                      (COND ((|greater_SI| |v| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |m| |u| |v|
                                    (SPADCALL |s| |u| |v| (QREFELT $ 103)) 1
                                    1)))
                      (LETT |v| (|inc_SI| |v|) . #4#) (GO G190) G191
                      (EXIT NIL))))
               (LETT |u| (|inc_SI| |u|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |m|)))) 

(SDEFUN |WGRPH;coerce;Fp$;41| ((|poset| |FinitePoset| S) ($ $))
        (SPADCALL |poset| (QREFELT $ 38))) 

(DECLAIM (NOTINLINE |WeightedGraph;|)) 

(DEFUN |WeightedGraph| (&REST #1=#:G1172)
  (SPROG NIL
         (PROG (#2=#:G1173)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|WeightedGraph|)
                                               '|domainEqualList|)
                    . #3=(|WeightedGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |WeightedGraph;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|WeightedGraph|)))))))))) 

(DEFUN |WeightedGraph;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|WeightedGraph|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|WeightedGraph| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 120) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|WeightedGraph| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record|
                     (|:| |objects|
                          (|List|
                           (|Record| (|:| |value| |#1|)
                                     (|:| |posX| (|NonNegativeInteger|))
                                     (|:| |posY| (|NonNegativeInteger|))
                                     (|:| |weight| |#2|))))
                     (|:| |arrows|
                          (|List|
                           (|Record| (|:| |name| (|String|))
                                     (|:| |weight| |#2|)
                                     (|:| |fromOb| (|NonNegativeInteger|))
                                     (|:| |toOb| (|NonNegativeInteger|))
                                     (|:| |xOffset| (|Integer|))
                                     (|:| |yOffset| (|Integer|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          $))) 

(MAKEPROP '|WeightedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (0 . |Zero|) (|List| 6) |WGRPH;weightedGraph;L$;1|
              (|Record| (|:| |value| 6) (|:| |posX| 25) (|:| |posY| 25)
                        (|:| |weight| 7))
              (|List| 12) |WGRPH;weightedGraph;L$;2|
              (|Record| (|:| |name| 51) (|:| |weight| 7) (|:| |fromOb| 25)
                        (|:| |toOb| 25) (|:| |xOffset| 39) (|:| |yOffset| 39)
                        (|:| |map| 41))
              (|List| 15) |WGRPH;weightedGraph;LL$;3| (4 . |concat|)
              (10 . |concat|)
              (|Record| (|:| |value| 6) (|:| |posX| 25) (|:| |posY| 25))
              (|List| 20)
              (|Record| (|:| |name| 51) (|:| |arrType| 25) (|:| |fromOb| 25)
                        (|:| |toOb| 25) (|:| |xOffset| 39) (|:| |yOffset| 39)
                        (|:| |map| 41))
              (|List| 22) |WGRPH;weightedGraph;LL$;4| (|NonNegativeInteger|)
              (16 . |createX|) (22 . |createY|) (28 . |concat|) (34 . |concat|)
              (|Record| (|:| |fromOb| 25) (|:| |toOb| 25)) (|List| 30)
              |WGRPH;weightedGraph;LL$;5| (|FinitePoset| 6) (40 . |getVert|)
              (|List| (|List| 47)) (45 . |getArr|) (50 . |concat|)
              |WGRPH;weightedGraph;Fp$;6| (|Integer|) (56 . |elt|) (|List| 25)
              (|List| 41) (62 . |elt|) (68 . |#|) (73 . |elt|)
              |WGRPH;weightedGraph;LL$;7| (|Boolean|) (79 . =)
              |WGRPH;addObject!;$S$;8| |WGRPH;addObject!;$R$;9| (|String|)
              |WGRPH;addWArrow!;$S2NniW$;12| |WGRPH;addArrow!;$R$;10|
              |WGRPH;addArrow!;$S2Nni$;11| |WGRPH;getVertices;$L;13|
              |WGRPH;getArrows;$L;14| |WGRPH;initial;$;15|
              |WGRPH;terminal;S$;16| (85 . <=) |WGRPH;cycleOpen;LS$;17|
              |WGRPH;cycleClosed;LS$;18| |WGRPH;unit;LS$;19| (91 . ~=)
              |WGRPH;kgraph;LS$;20| (97 . |concat|) (103 . |concat|)
              |WGRPH;+;3$;21| (109 . |position|) (115 . |concat|)
              |WGRPH;merge;3$;22| (121 . |diagramWidth|)
              (126 . |diagramHeight|) (|Product| 6 6) (131 . |construct|)
              (|Record| (|:| |value| 73) (|:| |posX| 25) (|:| |posY| 25)
                        (|:| |weight| 7))
              (|List| 75) (137 . |concat|) (143 . |isDirectSuccessor?|)
              (150 . |arrowName|) (|List| $) (157 . |concat|)
              (|WeightedGraph| 73 7) (162 . |weightedGraph|) |WGRPH;*;2$Wg;25|
              |WGRPH;cartesian;2$Wg;26| (|Mapping| 6 6 6)
              |WGRPH;closedTensor;2$M$;28| |WGRPH;closedCartesian;2$M$;29|
              (168 . |elt|) (174 . |setelt!|) |WGRPH;map;$LL2I$;30|
              |WGRPH;mapContra;$LL2I$;31| (181 . >) (187 . =) (193 . ~=)
              |WGRPH;routeNodeWeight;$LW;38| (199 . <)
              |WGRPH;routeNodes;$2NniL;33| (205 . |getArrowIndex|)
              |WGRPH;routeArrowWeight;$LW;39| |WGRPH;routeArrows;$2NniL;35|
              (|Union| 7 '"disjoint") |WGRPH;distanceWeighted;$2NniU;36|
              (212 . +) (218 . |elt|) (|TwoDimensionalArray| 102)
              |WGRPH;weightedDistanceMatrix;$Tda;40| |WGRPH;coerce;Fp$;41|
              (|Void|) (|Scene| (|SCartesian| '2)) (|Matrix| 39) (|Matrix| 25)
              (|List| (|Loop|)) (|List| 115) (|Tree| 39) (|DirectedGraph| $)
              (|SingleInteger|) (|OutputForm|) (|HashState|))
           '#(~= 224 |weightedGraph| 230 |weightedDistanceMatrix| 269 |unit|
              274 |terminal| 280 |subdiagramSvg| 285 |spanningTreeNode| 293
              |spanningTreeArrow| 299 |spanningForestNode| 305
              |spanningForestArrow| 310 |routeNodes| 315 |routeNodeWeight| 322
              |routeArrows| 328 |routeArrowWeight| 335 |outDegree| 341
              |nodeToNode| 347 |nodeToArrow| 353 |nodeFromNode| 359
              |nodeFromArrow| 365 |min| 371 |merge| 382 |max| 388 |mapContra|
              399 |map| 408 |looseEquals| 417 |loopsNodes| 423 |loopsAtNode|
              428 |loopsArrows| 434 |latex| 439 |laplacianMatrix| 444 |kgraph|
              449 |isGreaterThan?| 455 |isFunctional?| 462 |isFixPoint?| 467
              |isDirected?| 473 |isDirectSuccessor?| 477 |isAcyclic?| 484
              |initial| 489 |incidenceMatrix| 493 |inDegree| 498 |hashUpdate!|
              504 |hash| 510 |getVertices| 515 |getVertexIndex| 520 |getArrows|
              526 |getArrowIndex| 531 |flatten| 538 |distanceWeighted| 543
              |distanceMatrix| 550 |distance| 555 |diagramsSvg| 562
              |diagramWidth| 569 |diagramSvg| 574 |diagramHeight| 581
              |deepDiagramSvg| 586 |cycleOpen| 593 |cycleClosed| 599 |createY|
              605 |createX| 611 |createWidth| 617 |coerce| 622 |closedTensor|
              632 |closedCartesian| 639 |cartesian| 646 |arrowsToNode| 652
              |arrowsToArrow| 658 |arrowsFromNode| 664 |arrowsFromArrow| 670
              |arrowName| 676 |adjacencyMatrix| 683 |addWArrow!| 688
              |addObject!| 697 |addArrow!| 709 = 740 + 746 * 752)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 118) (|BasicType|))
                        (|makeByteWordVec2| 119
                                            '(0 7 0 9 2 16 0 0 15 18 2 13 0 0
                                              12 19 2 0 25 25 25 26 2 0 25 25
                                              25 27 2 21 0 0 20 28 2 23 0 0 22
                                              29 1 33 10 0 34 1 33 35 0 36 2 31
                                              0 0 30 37 2 10 6 0 39 40 2 42 41
                                              0 39 43 1 41 25 0 44 2 41 25 0 39
                                              45 2 13 47 0 0 48 2 25 47 0 0 59
                                              2 25 47 0 0 63 2 13 0 0 0 65 2 16
                                              0 0 0 66 2 13 39 12 0 68 2 41 0 0
                                              25 69 1 0 25 0 71 1 0 25 0 72 2
                                              73 0 6 6 74 2 76 0 0 75 77 3 0 47
                                              0 25 25 78 3 0 51 0 25 25 79 1 51
                                              0 80 81 2 82 0 76 16 83 2 13 12 0
                                              39 89 3 13 12 0 39 12 90 2 25 47
                                              0 0 93 2 41 47 0 0 94 2 41 47 0 0
                                              95 2 7 47 0 0 97 3 0 25 0 25 25
                                              99 2 7 0 0 0 104 2 16 15 0 39 105
                                              2 0 47 0 0 1 2 0 0 10 42 46 2 0 0
                                              10 31 32 1 0 0 33 38 2 0 0 21 23
                                              24 1 0 0 13 14 2 0 0 13 16 17 1 0
                                              0 10 11 1 0 106 0 107 2 0 0 10 51
                                              62 1 0 0 6 58 4 0 109 110 0 47 47
                                              1 2 0 115 0 25 1 2 0 115 0 25 1 1
                                              0 114 0 1 1 0 114 0 1 3 0 41 0 25
                                              25 98 2 0 7 0 41 96 3 0 41 0 25
                                              25 101 2 0 7 0 41 100 2 0 25 0 25
                                              1 2 0 41 0 25 1 2 0 41 0 25 1 2 0
                                              41 0 25 1 2 0 41 0 25 1 2 0 25 0
                                              41 1 1 0 25 0 1 2 0 0 0 0 70 2 0
                                              25 0 41 1 1 0 25 0 1 5 0 0 0 41
                                              10 39 39 92 5 0 0 0 41 10 39 39
                                              91 2 0 47 0 0 1 1 0 113 0 1 2 0
                                              113 0 25 1 1 0 113 0 1 1 0 51 0 1
                                              1 0 111 0 1 2 0 0 10 51 64 3 0 47
                                              0 25 25 1 1 0 47 0 1 2 0 47 0 25
                                              1 0 0 47 1 3 0 47 0 25 25 78 1 0
                                              47 0 1 0 0 0 57 1 0 111 0 1 2 0
                                              25 0 25 1 2 0 119 119 0 1 1 0 117
                                              0 1 1 0 21 0 55 2 0 25 0 6 1 1 0
                                              23 0 56 3 0 25 0 25 25 99 1 0 0
                                              116 1 3 0 102 0 25 25 103 1 0 111
                                              0 1 3 0 39 0 25 25 1 3 0 109 51
                                              80 47 1 1 0 25 0 71 3 0 109 51 0
                                              47 1 1 0 25 0 72 3 0 109 51 0 47
                                              1 2 0 0 10 51 60 2 0 0 10 51 61 2
                                              0 25 25 25 27 2 0 25 25 25 26 1 0
                                              25 25 1 1 0 0 33 108 1 0 118 0 1
                                              3 0 0 0 0 86 87 3 0 0 0 0 86 88 2
                                              0 82 0 0 85 2 0 41 0 25 1 2 0 41
                                              0 25 1 2 0 41 0 25 1 2 0 41 0 25
                                              1 3 0 51 0 25 25 79 1 0 112 0 1 5
                                              0 0 0 51 25 25 7 52 2 0 0 0 20 50
                                              2 0 0 0 6 49 4 0 0 0 51 6 6 1 5 0
                                              0 0 51 25 25 41 1 2 0 0 0 22 53 4
                                              0 0 0 51 25 25 54 2 0 47 0 0 1 2
                                              0 0 0 0 67 2 0 82 0 0 84)))))
           '|lookupComplete|)) 
