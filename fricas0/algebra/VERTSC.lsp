
(PUT '|VERTSC;vertexSet;L$;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |VERTSC;vertexSet;L$;1| ((|v| |List| (|PrimitiveArray| F)) ($ $)) |v|) 

(SDEFUN |VERTSC;dimension;$Nni;2| ((|a| $) ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G705 NIL) (|b| NIL))
               (SEQ (LETT |res| 0 . #2=(|VERTSC;dimension;$Nni;2|))
                    (SEQ (LETT |b| NIL . #2#) (LETT #1# |a| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |b| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (QVSIZE |b|) |res| (QREFELT $ 12))
                             (LETT |res| (QVSIZE |b|) . #2#)))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(PUT '|VERTSC;maxFaces;$Nni;3| '|SPADreplace| 'LENGTH) 

(SDEFUN |VERTSC;maxFaces;$Nni;3| ((|a| $) ($ |NonNegativeInteger|))
        (LENGTH |a|)) 

(SDEFUN |VERTSC;setMaxFaces;$NniV;4|
        ((|a| $) (|b| |NonNegativeInteger|) ($ |Void|))
        (SPROG ((#1=#:G714 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (LENGTH |a|) |b| (QREFELT $ 15))
                    (PROGN
                     (LETT #1# (SPADCALL (QREFELT $ 17))
                           |VERTSC;setMaxFaces;$NniV;4|)
                     (GO #2=#:G713))))
                  (|error| "too few coordinates")
                  (EXIT (SPADCALL (QREFELT $ 17)))))
                #2# (EXIT #1#)))) 

(SDEFUN |VERTSC;join;3$;5| ((|a| $) (|b| $) ($ $))
        (SPADCALL |a| |b| (QREFELT $ 19))) 

(PUT '|VERTSC;prod;3$;6| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |VERTSC;prod;3$;6| ((|a| $) (|b| $) ($ $)) |a|) 

(SDEFUN |VERTSC;coerce;$Of;7| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|mat| (|List| (|List| (|OutputForm|))))
          (|row| (|List| (|OutputForm|))) (#1=#:G734 NIL) (|b| NIL)
          (#2=#:G733 NIL) (|a| NIL) (#3=#:G732 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL |s|)
              (PROGN
               (LETT #3# (SPADCALL (SPADCALL (QREFELT $ 23)) (QREFELT $ 24))
                     . #4=(|VERTSC;coerce;$Of;7|))
               (GO #5=#:G731))))
            (LETT |mat| NIL . #4#)
            (SEQ (LETT |a| NIL . #4#) (LETT #2# |s| . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |row| NIL . #4#)
                      (COND
                       ((NULL (SPADCALL |a| (QREFELT $ 27)))
                        (LETT |row|
                              (SPADCALL |row|
                                        (SPADCALL (SPADCALL (QREFELT $ 23))
                                                  (QREFELT $ 24))
                                        (QREFELT $ 29))
                              . #4#))
                       ('T
                        (SEQ (LETT |b| NIL . #4#)
                             (LETT #1# (SPADCALL |a| (QREFELT $ 27)) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |b| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |row|
                                     (SPADCALL |row|
                                               (SPADCALL |b| (QREFELT $ 30))
                                               (QREFELT $ 29))
                                     . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT NIL))))
                      (EXIT
                       (LETT |mat| (SPADCALL |mat| |row| (QREFELT $ 32))
                             . #4#)))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |mat| (QREFELT $ 34)))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |VertexSetCoord;|)) 

(DEFUN |VertexSetCoord| (#1=#:G736)
  (SPROG NIL
         (PROG (#2=#:G737)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|VertexSetCoord|)
                                               '|domainEqualList|)
                    . #3=(|VertexSetCoord|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|VertexSetCoord;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|VertexSetCoord|)))))))))) 

(DEFUN |VertexSetCoord;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|VertexSetCoord|))
          (LETT |dv$| (LIST '|VertexSetCoord| DV$1) . #1#)
          (LETT $ (GETREFV 39) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|VertexSetCoord| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|List| (|PrimitiveArray| |#1|)))
          $))) 

(MAKEPROP '|VertexSetCoord| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 26)
              |VERTSC;vertexSet;L$;1| (|Boolean|) (|NonNegativeInteger|)
              (0 . >) |VERTSC;dimension;$Nni;2| |VERTSC;maxFaces;$Nni;3|
              (6 . <=) (|Void|) (12 . |void|) |VERTSC;setMaxFaces;$NniV;4|
              (16 . |concat|) |VERTSC;join;3$;5| |VERTSC;prod;3$;6|
              (|OutputForm|) (22 . |empty|) (26 . |bracket|) (|List| 6)
              (|PrimitiveArray| 6) (31 . |members|) (|List| 22) (36 . |concat|)
              (42 . |coerce|) (|List| 28) (47 . |concat|) (|List| (|List| $))
              (53 . |matrix|) |VERTSC;coerce;$Of;7| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 58 |vertexSet| 64 |setMaxFaces| 69 |prod| 75 |maxFaces| 81
              |latex| 86 |join| 91 |hashUpdate!| 97 |hash| 103 |dimension| 108
              |coerce| 113 = 118)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|VertexSet|) (|SetCategory|) (|BasicType|)
                           (|CoercibleTo| 22))
                        (|makeByteWordVec2| 38
                                            '(2 11 10 0 0 12 2 11 10 0 0 15 0
                                              16 0 17 2 7 0 0 0 19 0 22 0 23 1
                                              22 0 0 24 1 26 25 0 27 2 28 0 0
                                              22 29 1 6 22 0 30 2 31 0 0 28 32
                                              1 22 0 33 34 2 0 10 0 0 1 1 0 0 8
                                              9 2 0 16 0 11 18 2 0 0 0 0 21 1 0
                                              11 0 14 1 0 36 0 1 2 0 0 0 0 20 2
                                              0 38 38 0 1 1 0 37 0 1 1 0 11 0
                                              13 1 0 22 0 35 2 0 10 0 0 1)))))
           '|lookupComplete|)) 
