
(PUT '|UDGRPH;isDirected?;B;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |UDGRPH;isDirected?;B;1| (($ |Boolean|)) NIL) 

(SDEFUN |UDGRPH;undirectedGraph;L$;2| ((|ob| |List| S) ($ $))
        (SPROG
         ((|objs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#1=#:G722 NIL) (|x| NIL) (#2=#:G721 NIL))
         (SEQ
          (LETT |objs|
                (PROGN
                 (LETT #2# NIL . #3=(|UDGRPH;undirectedGraph;L$;2|))
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |ob| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (VECTOR |x| 0 0) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT (CONS |objs| NIL))))) 

(PUT '|UDGRPH;undirectedGraph;L$;3| '|SPADreplace|
     '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |UDGRPH;undirectedGraph;L$;3|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         ($ $))
        (CONS |ob| NIL)) 

(PUT '|UDGRPH;undirectedGraph;LL$;4| '|SPADreplace| 'CONS) 

(SDEFUN |UDGRPH;undirectedGraph;LL$;4|
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
        (CONS |ob| |ar|)) 

(SDEFUN |UDGRPH;undirectedGraph;LL$;5|
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
          (#1=#:G759 NIL) (|ar| NIL) (#2=#:G760 NIL) (|arn| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#3=#:G757 NIL) (|ob| NIL) (#4=#:G758 NIL) (|obn| NIL))
         (SEQ (LETT |nodes| NIL . #5=(|UDGRPH;undirectedGraph;LL$;5|))
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
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT $ 20)))
                          . #5#)
                    (EXIT
                     (LETT |nodes| (SPADCALL |nodes| |o| (QREFELT $ 21))
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
                                     (QREFELT $ 22))
                           . #5#)))
                   (LETT #1#
                         (PROG1 (CDR #1#) (LETT |arn| (|inc_SI| |arn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |nodes| |edges|))))) 

(SDEFUN |UDGRPH;undirectedGraph;Fp$;6| ((|poset| |FinitePoset| S) ($ $))
        (SPROG
         ((|ars|
           (|List|
            #1=(|Record| (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|)))))
          (|z| #1#) (#2=#:G769 NIL) (|y| NIL) (#3=#:G770 NIL) (|yn| NIL)
          (#4=#:G767 NIL) (|x| NIL) (#5=#:G768 NIL) (|xn| NIL)
          (|mat| (|List| (|List| (|Boolean|)))) (|obs| (|List| S)))
         (SEQ
          (LETT |obs| (SPADCALL |poset| (QREFELT $ 27))
                . #6=(|UDGRPH;undirectedGraph;Fp$;6|))
          (LETT |ars| NIL . #6#)
          (LETT |mat| (SPADCALL |poset| (QREFELT $ 29)) . #6#)
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
                                (LETT |ars| (SPADCALL |ars| |z| (QREFELT $ 30))
                                      . #6#)))))))
                      (LETT #2#
                            (PROG1 (CDR #2#) (LETT |yn| (|inc_SI| |yn|) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #4# (PROG1 (CDR #4#) (LETT |xn| (|inc_SI| |xn|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |obs| |ars| (QREFELT $ 25)))))) 

(SDEFUN |UDGRPH;undirectedGraph;LL$;7|
        ((|objs| |List| S) (|am| |List| (|List| (|NonNegativeInteger|))) ($ $))
        (SPROG
         ((|ar|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G786 NIL) (|j| NIL) (#3=#:G785 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #4#) (|ob| (S)) (#5=#:G784 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|UDGRPH;undirectedGraph;LL$;7|))
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#) G190
                   (COND ((|greater_SI| |obn| #5#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)) . #6#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 20)))
                          . #6#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #6#)))
                   (LETT |obn| (|inc_SI| |obn|) . #6#) (GO G190) G191
                   (EXIT NIL))
              (LETT |ar| NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# (LENGTH |am|) . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #6#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 36))
                                          (QREFELT $ 37))
                                . #6#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 36)) |j|
                                         (QREFELT $ 38))
                               1)
                              (SEQ
                               (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL) . #6#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 22))
                                      . #6#)))))))
                          (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |UDGRPH;addObject!;$S$;8| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|UDGRPH;addObject!;$S$;8|))
              (LETT |obj| (VECTOR |n| 0 0) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 40))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 21)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |UDGRPH;addObject!;$R$;9|
        ((|s| $)
         (|n| |Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
          (|:| |posY| #1#))
         ($ $))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) |UDGRPH;addObject!;$R$;9|)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 40))
                (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 21)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |UDGRPH;addArrow!;$S2Nni$;10|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPROG
         ((#2=#:G804 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrss|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|UDGRPH;addArrow!;$S2Nni$;10|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 43))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G803)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 22)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |UDGRPH;addArrow!;$S2NniL$;11|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) (|mp| |List| #1#) ($ $))
        (SPROG
         ((#2=#:G812 NIL)
          (|arrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|arrss|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|)))))))
         (SEQ
          (EXIT
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|UDGRPH;addArrow!;$S2NniL$;11|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 43))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G811)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 22)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(PUT '|UDGRPH;getVertices;$L;12| '|SPADreplace| 'QCAR) 

(SDEFUN |UDGRPH;getVertices;$L;12|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (QCAR |s|)) 

(SDEFUN |UDGRPH;getArrows;$L;13|
        ((|s| $)
         ($ |List|
          #1=(|Record| (|:| |name| (|String|))
                       (|:| |arrType| (|NonNegativeInteger|))
                       (|:| |fromOb| (|NonNegativeInteger|))
                       (|:| |toOb| (|NonNegativeInteger|))
                       (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                       (|:| |map| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|as|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|revAr| #1#) (#2=#:G823 NIL) (|a| NIL) (|forwAr| #1#)
          (#3=#:G822 NIL))
         (SEQ (LETT |as| NIL . #4=(|UDGRPH;getArrows;$L;13|))
              (SEQ (LETT |a| NIL . #4#) (LETT #3# (QCDR |s|) . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |forwAr|
                          (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 2)
                                  (QVELT |a| 3) (QVELT |a| 4) (QVELT |a| 5)
                                  (QVELT |a| 6))
                          . #4#)
                    (EXIT
                     (LETT |as| (SPADCALL |as| |forwAr| (QREFELT $ 22))
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |a| NIL . #4#) (LETT #2# (QCDR |s|) . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |revAr|
                          (VECTOR (QVELT |a| 0) (QVELT |a| 1) (QVELT |a| 3)
                                  (QVELT |a| 2) (QVELT |a| 4) (QVELT |a| 5)
                                  (QVELT |a| 6))
                          . #4#)
                    (EXIT
                     (LETT |as| (SPADCALL |as| |revAr| (QREFELT $ 22)) . #4#)))
                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |as|)))) 

(PUT '|UDGRPH;initial;$;14| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |UDGRPH;initial;$;14| (($ $)) (CONS NIL NIL)) 

(SDEFUN |UDGRPH;terminal;S$;15| ((|a| S) ($ $))
        (SPROG
         ((|ar|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|)))))
         (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|UDGRPH;terminal;S$;15|))
              (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL) . #1#)
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |UDGRPH;cycleOpen;LS$;16|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #2#) (|ob| (S)) (#3=#:G839 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|UDGRPH;cycleOpen;LS$;16|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 20)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 51))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;cycleClosed;LS$;17|
        ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (|next| (|NonNegativeInteger|))
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #2#) (|ob| (S)) (#3=#:G849 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|UDGRPH;cycleClosed;LS$;17|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 20)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #4#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 51))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;unit;LS$;18| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#)
          (|obs|
           (|List|
            #2=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #2#) (|ob| (S)) (#3=#:G857 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|UDGRPH;unit;LS$;18|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#) G190
                   (COND ((|greater_SI| |obn| #3#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)) . #4#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 20)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #4#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obn| 0 0 NIL)
                          . #4#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22)) . #4#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #4#)))
                   (LETT |obn| (|inc_SI| |obn|) . #4#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;kgraph;LS$;19| ((|objs| |List| S) (|arrowName| |String|) ($ $))
        (SPROG
         ((|arn| (|Integer|))
          (|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G869 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (|ob| (S)) (#4=#:G868 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|UDGRPH;kgraph;LS$;19|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#) G190
                   (COND ((|greater_SI| |obn| #4#) (GO G191)))
                   (SEQ
                    (LETT |ob| (SPADCALL |objs| |obn| (QREFELT $ 33)) . #5#)
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 19))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 20)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 21)) . #5#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #5#) (LETT #2# (LENGTH |objs|) . #5#)
                          G190 (COND ((|greater_SI| |obm| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 55))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obm| 0 0 NIL)
                                     . #5#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 22))
                                     . #5#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |obn| (|inc_SI| |obn|) . #5#) (GO G190) G191
                   (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |UDGRPH;+;3$;20| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (#2=#:G877 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 57))
                . #3=(|UDGRPH;+;3$;20|))
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
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 22)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 58)) . #3#)
          (EXIT (CONS |lo| |la|))))) 

(SDEFUN |UDGRPH;merge;3$;21| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|la|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|lb|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|fromI| #2=(|NonNegativeInteger|)) (|toI| #2#)
          (#3=#:G898 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G886 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|i| (|Integer|)) (#6=#:G897 NIL) (|bob| NIL) (#7=#:G896 NIL)
          (|x| NIL) (#8=#:G895 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL . #9=(|UDGRPH;merge;3$;21|))
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
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 60)) . #9#)
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 21))
                              . #9#)
                        (LETT |newIndex| (+ |newIndex| 1) . #9#)
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 61))
                               . #9#))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i| . #9#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 61))
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
                                (QREFELT $ 38))
                      . #9#)
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 38))
                      . #9#)
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                      . #9#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 22)) . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 58)) . #9#)
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |UDGRPH;objProd|
        ((|a| $) (|b| $)
         ($ |List|
          (|Record| (|:| |value| (|Product| S S))
                    (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| (|Product| S S))
                      (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob|
           (|Record| (|:| |value| (|Product| S S))
                     (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|sp| (|Product| S S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #1=(|NonNegativeInteger|))
          (|x| #1#) (|byi| #2=(|NonNegativeInteger|))
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G909 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G908 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|UDGRPH;objProd|))
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
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 63))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 64)) . #6#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 66))
                                         . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 69))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |UDGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G910 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |UDGRPH;indexProd|)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |UDGRPH;*;2$Ug;24|
        ((|a| $) (|b| $) ($ |UndirectedGraph| (|Product| S S)))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G932 NIL) (|bv| NIL)
          (#3=#:G931 NIL) (|bu| NIL) (#4=#:G930 NIL) (|av| NIL) (#5=#:G929 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;*;2$Ug;24|))
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
                                                      (QREFELT $ 70))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          71))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          71)))
                                                      (QREFELT $ 73))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 22))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 75)))))) 

(SDEFUN |UDGRPH;cartesian;2$Ug;25|
        ((|a| $) (|b| $) ($ |UndirectedGraph| (|Product| S S)))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G957 NIL) (|bv| NIL)
          (#3=#:G956 NIL) (|bu| NIL) (#4=#:G955 NIL) (|av| NIL) (#5=#:G954 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;cartesian;2$Ug;25|))
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
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 22))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 70))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 73)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 73)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|UDGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|UDGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           22))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 22))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 75)))))) 

(SDEFUN |UDGRPH;closedObjProd|
        ((|a| $) (|b| $) (|f| |Mapping| S S S)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (SPROG
         ((|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob|
           (|Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
                     (|:| |posY| #2=(|NonNegativeInteger|))))
          (|sp| (S)) (|heighta| (|NonNegativeInteger|))
          (|widtha| (|NonNegativeInteger|)) (|y| #3=(|NonNegativeInteger|))
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G966 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G965 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|UDGRPH;closedObjProd|))
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
                                             (SPADCALL |a| (QREFELT $ 63)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 64)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 63))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 64)) . #6#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 21))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |UDGRPH;closedTensor;2$M$;27|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G987 NIL) (|bv| NIL)
          (#3=#:G986 NIL) (|bu| NIL) (#4=#:G985 NIL) (|av| NIL) (#5=#:G984 NIL)
          (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;closedTensor;2$M$;27|))
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
                                                      (QREFELT $ 70))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          71))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          71)))
                                                      (QREFELT $ 73))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 22))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |UDGRPH;closedCartesian;2$M$;28|
        ((|a| $) (|b| $) (|f| |Mapping| S S S) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr| #1#) (|an| (|String|)) (#2=#:G1013 NIL) (|bv| NIL)
          (#3=#:G1012 NIL) (|bu| NIL) (#4=#:G1011 NIL) (|av| NIL)
          (#5=#:G1010 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|UDGRPH;closedCartesian;2$M$;28|))
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
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 22))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 70))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              70))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 73)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 71))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 73)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|UDGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|UDGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           22))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 70))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            70))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              71))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 73)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              71))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 73)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            71))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 73))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|UDGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|UDGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 22))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|UDGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 17)))))) 

(SDEFUN |UDGRPH;map;$LL2I$;29|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G1030 NIL) (|oldArrow| NIL) (#4=#:G1018 NIL)
          (#5=#:G1017 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G1029 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G1028 NIL) (|o| NIL) (#8=#:G1027 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|UDGRPH;map;$LL2I$;29|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (VECTOR |o| 0 0) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 38)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 81))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 81))
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
                                                      (QREFELT $ 81))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 82))))
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
                                        (QREFELT $ 38))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 38))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 22))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |UDGRPH;mapContra;$LL2I$;30|
        ((|s| $) (|m| |List| (|NonNegativeInteger|)) (|newOb| |List| S)
         (|offsetX| . #1=(|Integer|)) (|offsetY| . #1#) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            #2=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr| #2#) (#3=#:G1047 NIL) (|oldArrow| NIL) (#4=#:G1035 NIL)
          (#5=#:G1034 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G1046 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G1045 NIL) (|o| NIL) (#8=#:G1044 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|UDGRPH;mapContra;$LL2I$;30|))
                 (SEQ (LETT |o| NIL . #9#) (LETT #7# |newOb| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |o| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (VECTOR |o| 0 0) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ (LETT |oi| 1 . #9#) (LETT #6# (LENGTH (QCAR |s|)) . #9#) G190
               (COND ((|greater_SI| |oi| #6#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 38)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 81))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 81))
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
                                                      (QREFELT $ 81))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 82))))
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
                                        (QREFELT $ 38))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 38))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 22))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |UDGRPH;coerce;Fp$;31| ((|poset| |FinitePoset| S) ($ $))
        (SPADCALL |poset| (QREFELT $ 31))) 

(DECLAIM (NOTINLINE |UndirectedGraph;|)) 

(DEFUN |UndirectedGraph| (#1=#:G1051)
  (SPROG NIL
         (PROG (#2=#:G1052)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UndirectedGraph|)
                                               '|domainEqualList|)
                    . #3=(|UndirectedGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UndirectedGraph;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UndirectedGraph|)))))))))) 

(DEFUN |UndirectedGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|UndirectedGraph|))
          (LETT |dv$| (LIST '|UndirectedGraph| DV$1) . #1#)
          (LETT $ (GETREFV 97) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|UndirectedGraph| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record|
                     (|:| |objects|
                          (|List|
                           (|Record| (|:| |value| |#1|)
                                     (|:| |posX| (|NonNegativeInteger|))
                                     (|:| |posY| (|NonNegativeInteger|)))))
                     (|:| |arrows|
                          (|List|
                           (|Record| (|:| |name| (|String|))
                                     (|:| |arrType| (|NonNegativeInteger|))
                                     (|:| |fromOb| (|NonNegativeInteger|))
                                     (|:| |toOb| (|NonNegativeInteger|))
                                     (|:| |xOffset| (|Integer|))
                                     (|:| |yOffset| (|Integer|))
                                     (|:| |map|
                                          (|List| (|NonNegativeInteger|))))))))
          $))) 

(MAKEPROP '|UndirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |UDGRPH;isDirected?;B;1| (|List| 6) |UDGRPH;undirectedGraph;L$;2|
              (|Record| (|:| |value| 6) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 12) |UDGRPH;undirectedGraph;L$;3|
              (|Record| (|:| |name| 44) (|:| |arrType| 18) (|:| |fromOb| 18)
                        (|:| |toOb| 18) (|:| |xOffset| 32) (|:| |yOffset| 32)
                        (|:| |map| 34))
              (|List| 15) |UDGRPH;undirectedGraph;LL$;4| (|NonNegativeInteger|)
              (0 . |createX|) (6 . |createY|) (12 . |concat|) (18 . |concat|)
              (|Record| (|:| |fromOb| 18) (|:| |toOb| 18)) (|List| 23)
              |UDGRPH;undirectedGraph;LL$;5| (|FinitePoset| 6) (24 . |getVert|)
              (|List| (|List| 8)) (29 . |getArr|) (34 . |concat|)
              |UDGRPH;undirectedGraph;Fp$;6| (|Integer|) (40 . |elt|)
              (|List| 18) (|List| 34) (46 . |elt|) (52 . |#|) (57 . |elt|)
              |UDGRPH;undirectedGraph;LL$;7| (63 . =) |UDGRPH;addObject!;$S$;8|
              |UDGRPH;addObject!;$R$;9| (69 . =) (|String|)
              |UDGRPH;addArrow!;$S2Nni$;10| |UDGRPH;addArrow!;$S2NniL$;11|
              |UDGRPH;getVertices;$L;12| |UDGRPH;getArrows;$L;13|
              |UDGRPH;initial;$;14| |UDGRPH;terminal;S$;15| (75 . <=)
              |UDGRPH;cycleOpen;LS$;16| |UDGRPH;cycleClosed;LS$;17|
              |UDGRPH;unit;LS$;18| (81 . ~=) |UDGRPH;kgraph;LS$;19|
              (87 . |concat|) (93 . |concat|) |UDGRPH;+;3$;20|
              (99 . |position|) (105 . |concat|) |UDGRPH;merge;3$;21|
              (111 . |diagramWidth|) (116 . |diagramHeight|) (|Product| 6 6)
              (121 . |construct|)
              (|Record| (|:| |value| 65) (|:| |posX| 18) (|:| |posY| 18))
              (|List| 67) (127 . |concat|) (133 . |isDirectSuccessor?|)
              (140 . |arrowName|) (|List| $) (147 . |concat|)
              (|UndirectedGraph| 65) (152 . |undirectedGraph|)
              |UDGRPH;*;2$Ug;24| |UDGRPH;cartesian;2$Ug;25| (|Mapping| 6 6 6)
              |UDGRPH;closedTensor;2$M$;27| |UDGRPH;closedCartesian;2$M$;28|
              (158 . |elt|) (164 . |setelt!|) |UDGRPH;map;$LL2I$;29|
              |UDGRPH;mapContra;$LL2I$;30| |UDGRPH;coerce;Fp$;31| (|Void|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 32) (|Matrix| 18)
              (|List| (|Loop|)) (|List| 92) (|Tree| 32) (|DirectedGraph| $)
              (|SingleInteger|) (|OutputForm|) (|HashState|))
           '#(~= 171 |unit| 177 |undirectedGraph| 183 |terminal| 216
              |subdiagramSvg| 221 |spanningTreeNode| 229 |spanningTreeArrow|
              235 |spanningForestNode| 241 |spanningForestArrow| 246
              |routeNodes| 251 |routeArrows| 258 |outDegree| 265 |nodeToNode|
              271 |nodeToArrow| 277 |nodeFromNode| 283 |nodeFromArrow| 289
              |min| 295 |merge| 306 |max| 312 |mapContra| 323 |map| 332
              |looseEquals| 341 |loopsNodes| 347 |loopsAtNode| 352
              |loopsArrows| 358 |latex| 363 |laplacianMatrix| 368 |kgraph| 373
              |isGreaterThan?| 379 |isFunctional?| 386 |isFixPoint?| 391
              |isDirected?| 397 |isDirectSuccessor?| 401 |isAcyclic?| 408
              |initial| 413 |incidenceMatrix| 417 |inDegree| 422 |hashUpdate!|
              428 |hash| 434 |getVertices| 439 |getVertexIndex| 444 |getArrows|
              450 |getArrowIndex| 455 |flatten| 462 |distanceMatrix| 467
              |distance| 472 |diagramWidth| 479 |diagramSvg| 484
              |diagramHeight| 491 |deepDiagramSvg| 496 |cycleOpen| 503
              |cycleClosed| 509 |createY| 515 |createX| 521 |createWidth| 527
              |coerce| 532 |closedTensor| 547 |closedCartesian| 554 |cartesian|
              561 |arrowsToNode| 567 |arrowsToArrow| 573 |arrowsFromNode| 579
              |arrowsFromArrow| 585 |arrowName| 591 |adjacencyMatrix| 598
              |addObject!| 603 |addArrow!| 615 = 640 + 646 * 652)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|) (|CoercibleTo| 95)
                           (|BasicType|))
                        (|makeByteWordVec2| 96
                                            '(2 0 18 18 18 19 2 0 18 18 18 20 2
                                              13 0 0 12 21 2 16 0 0 15 22 1 26
                                              10 0 27 1 26 28 0 29 2 24 0 0 23
                                              30 2 10 6 0 32 33 2 35 34 0 32 36
                                              1 34 18 0 37 2 34 18 0 32 38 2 13
                                              8 0 0 40 2 16 8 0 0 43 2 18 8 0 0
                                              51 2 18 8 0 0 55 2 13 0 0 0 57 2
                                              16 0 0 0 58 2 13 32 12 0 60 2 34
                                              0 0 18 61 1 0 18 0 63 1 0 18 0 64
                                              2 65 0 6 6 66 2 68 0 0 67 69 3 0
                                              8 0 18 18 70 3 0 44 0 18 18 71 1
                                              44 0 72 73 2 74 0 68 16 75 2 13
                                              12 0 32 81 3 13 12 0 32 12 82 2 0
                                              8 0 0 1 2 0 0 10 44 54 1 0 0 26
                                              31 2 0 0 10 35 39 2 0 0 10 24 25
                                              1 0 0 13 14 2 0 0 13 16 17 1 0 0
                                              10 11 1 0 0 6 50 4 0 86 87 0 8 8
                                              1 2 0 92 0 18 1 2 0 92 0 18 1 1 0
                                              91 0 1 1 0 91 0 1 3 0 34 0 18 18
                                              1 3 0 34 0 18 18 1 2 0 18 0 18 1
                                              2 0 34 0 18 1 2 0 34 0 18 1 2 0
                                              34 0 18 1 2 0 34 0 18 1 1 0 18 0
                                              1 2 0 18 0 34 1 2 0 0 0 0 62 1 0
                                              18 0 1 2 0 18 0 34 1 5 0 0 0 34
                                              10 32 32 84 5 0 0 0 34 10 32 32
                                              83 2 0 8 0 0 1 1 0 90 0 1 2 0 90
                                              0 18 1 1 0 90 0 1 1 0 44 0 1 1 0
                                              88 0 1 2 0 0 10 44 56 3 0 8 0 18
                                              18 1 1 0 8 0 1 2 0 8 0 18 1 0 0 8
                                              9 3 0 8 0 18 18 70 1 0 8 0 1 0 0
                                              0 49 1 0 88 0 1 2 0 18 0 18 1 2 0
                                              96 96 0 1 1 0 94 0 1 1 0 13 0 47
                                              2 0 18 0 6 1 1 0 16 0 48 3 0 18 0
                                              18 18 1 1 0 0 93 1 1 0 88 0 1 3 0
                                              32 0 18 18 1 1 0 18 0 63 3 0 86
                                              44 0 8 1 1 0 18 0 64 3 0 86 44 0
                                              8 1 2 0 0 10 44 52 2 0 0 10 44 53
                                              2 0 18 18 18 20 2 0 18 18 18 19 1
                                              0 18 18 1 1 0 0 26 85 1 0 95 0 1
                                              1 0 95 0 1 3 0 0 0 0 78 79 3 0 0
                                              0 0 78 80 2 0 74 0 0 77 2 0 34 0
                                              18 1 2 0 34 0 18 1 2 0 34 0 18 1
                                              2 0 34 0 18 1 3 0 44 0 18 18 71 1
                                              0 89 0 1 2 0 0 0 12 42 2 0 0 0 6
                                              41 4 0 0 0 44 6 6 1 4 0 0 0 44 18
                                              18 45 5 0 0 0 44 18 18 34 46 2 0
                                              8 0 0 1 2 0 0 0 0 59 2 0 74 0 0
                                              76)))))
           '|lookupComplete|)) 
