
(SDEFUN |SPACE3;convertSpace| ((|space| $) ($ $))
        (SPROG
         ((|lllipt| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|llprop| (|List| (|List| (|SubSpaceComponentProperty|))))
          (|tmpllipt| (|List| (|List| (|NonNegativeInteger|))))
          (|tmplipt| (|List| (|NonNegativeInteger|))) (#1=#:G747 NIL)
          (|point| NIL) (|tmplprop| (|List| (|SubSpaceComponentProperty|)))
          (#2=#:G746 NIL) (|curve| NIL)
          (|lprop| (|List| (|SubSpaceComponentProperty|))) (#3=#:G745 NIL)
          (|component| NIL))
         (SEQ
          (COND ((QVELT |space| 4) |space|)
                ('T
                 (SEQ (QSETVELT |space| 4 'T)
                      (LETT |lllipt| NIL . #4=(|SPACE3;convertSpace|))
                      (LETT |llprop| NIL . #4#) (LETT |lprop| NIL . #4#)
                      (SEQ (LETT |component| NIL . #4#)
                           (LETT #3#
                                 (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                                 . #4#)
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN
                                  (LETT |component| (CAR #3#) . #4#)
                                  NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lprop|
                                  (CONS (SPADCALL |component| (QREFELT $ 12))
                                        |lprop|)
                                  . #4#)
                            (LETT |tmpllipt| NIL . #4#)
                            (LETT |tmplprop| NIL . #4#)
                            (SEQ (LETT |curve| NIL . #4#)
                                 (LETT #2#
                                       (SPADCALL |component| (QREFELT $ 10))
                                       . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |curve| (CAR #2#) . #4#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |tmplprop|
                                        (CONS (SPADCALL |curve| (QREFELT $ 12))
                                              |tmplprop|)
                                        . #4#)
                                  (LETT |tmplipt| NIL . #4#)
                                  (SEQ (LETT |point| NIL . #4#)
                                       (LETT #1#
                                             (SPADCALL |curve| (QREFELT $ 10))
                                             . #4#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |point| (CAR #1#) . #4#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |tmplipt|
                                               (CONS
                                                (SPADCALL |point|
                                                          (QREFELT $ 14))
                                                |tmplipt|)
                                               . #4#)))
                                       (LETT #1# (CDR #1#) . #4#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |tmpllipt|
                                         (CONS (NREVERSE |tmplipt|) |tmpllipt|)
                                         . #4#)))
                                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |llprop|
                                  (CONS (NREVERSE |tmplprop|) |llprop|) . #4#)
                            (EXIT
                             (LETT |lllipt|
                                   (CONS (NREVERSE |tmpllipt|) |lllipt|)
                                   . #4#)))
                           (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (QSETVELT |space| 2
                                (VECTOR
                                 (SPADCALL (QVELT |space| 0) (QREFELT $ 16))
                                 (NREVERSE |lllipt|) (NREVERSE |llprop|)
                                 (NREVERSE |lprop|)))
                      (EXIT |space|))))))) 

(SDEFUN |SPACE3;polygon;$L$;2|
        ((|space| $) (|points| |List| (|Point| R)) ($ $))
        (SPROG ((#1=#:G752 NIL) (|p| NIL) (|pt| (|SubSpace| 3 R)))
               (SEQ
                (COND
                 ((< (LENGTH |points|) 3)
                  (|error| "You need at least 3 points to define a polygon"))
                 ('T
                  (SEQ
                   (LETT |pt|
                         (SPADCALL (QVELT |space| 0) (|SPADfirst| |points|)
                                   (QREFELT $ 18))
                         . #2=(|SPACE3;polygon;$L$;2|))
                   (LETT |points| (CDR |points|) . #2#)
                   (SPADCALL (QVELT |space| 0) |pt| (|SPADfirst| |points|) 1
                             (QREFELT $ 19))
                   (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |points|) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL (QVELT |space| 0) |pt| |p| 2
                                    (QREFELT $ 19))))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (QSETVELT |space| 4 NIL) (EXIT |space|))))))) 

(SDEFUN |SPACE3;create3Space;$;3| (($ $))
        (VECTOR (SPADCALL (QREFELT $ 21)) NIL (VECTOR NIL NIL NIL NIL)
                (VECTOR 0 0 0 0) NIL)) 

(SDEFUN |SPACE3;create3Space;Ss$;4| ((|s| |SubSpace| 3 R) ($ $))
        (VECTOR |s| NIL (VECTOR NIL NIL NIL NIL) (VECTOR 0 0 0 0) NIL)) 

(SDEFUN |SPACE3;numberOfComponents;$Nni;5|
        ((|space| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))) 

(SDEFUN |SPACE3;numberOfComposites;$Nni;6|
        ((|space| $) ($ |NonNegativeInteger|)) (LENGTH (QVELT |space| 1))) 

(SDEFUN |SPACE3;merge;L$;7| ((|listOfThreeSpaces| |List| $) ($ $))
        (SPROG
         ((#1=#:G767 NIL) (|ts| NIL) (|newspace| ($)) (#2=#:G766 NIL)
          (#3=#:G765 NIL))
         (SEQ
          (LETT |newspace|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|SPACE3;merge;L$;7|))
                   (SEQ (LETT |ts| NIL . #4#)
                        (LETT #2# |listOfThreeSpaces| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |ts| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #3# (CONS (QVELT |ts| 0) #3#) . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 27))
                 (QREFELT $ 24))
                . #4#)
          (SEQ (LETT |ts| NIL . #4#) (LETT #1# |listOfThreeSpaces| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ts| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETVELT |newspace| 1
                           (SPADCALL (QVELT |ts| 1) (QVELT |newspace| 1)
                                     (QREFELT $ 29)))))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |newspace|)))) 

(SDEFUN |SPACE3;merge;3$;8| ((|s1| $) (|s2| $) ($ $))
        (SPADCALL (LIST |s1| |s2|) (QREFELT $ 30))) 

(SDEFUN |SPACE3;composite;L$;9| ((|listOfThreeSpaces| |List| $) ($ $))
        (SPROG ((#1=#:G773 NIL) (|s| NIL) (#2=#:G772 NIL) (|space| ($)))
               (SEQ
                (LETT |space| (SPADCALL (QREFELT $ 23))
                      . #3=(|SPACE3;composite;L$;9|))
                (QSETVELT |space| 0
                          (SPADCALL
                           (PROGN
                            (LETT #2# NIL . #3#)
                            (SEQ (LETT |s| NIL . #3#)
                                 (LETT #1# |listOfThreeSpaces| . #3#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (QVELT |s| 0) #2#) . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 27)))
                (QSETVELT |space| 1
                          (LIST (SPADCALL (QVELT |space| 0) (QREFELT $ 32))))
                (EXIT |space|)))) 

(SDEFUN |SPACE3;components;$L;10| ((|space| $) ($ |List| $))
        (SPROG ((#1=#:G777 NIL) (|s| NIL) (#2=#:G776 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SPACE3;components;$L;10|))
                 (SEQ (LETT |s| NIL . #3#)
                      (LETT #1# (SPADCALL (QVELT |space| 0) (QREFELT $ 34))
                            . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 24)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SPACE3;composites;$L;11| ((|space| $) ($ |List| $))
        (SPROG ((#1=#:G781 NIL) (|s| NIL) (#2=#:G780 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SPACE3;composites;$L;11|))
                 (SEQ (LETT |s| NIL . #3#) (LETT #1# (QVELT |space| 1) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 24)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SPACE3;copy;2$;12| ((|space| $) ($ $))
        (SPROG ((#1=#:G786 NIL) (|s| NIL) (#2=#:G785 NIL) (|spc| ($)))
               (SEQ
                (LETT |spc|
                      (SPADCALL (SPADCALL (QVELT |space| 0) (QREFELT $ 32))
                                (QREFELT $ 24))
                      . #3=(|SPACE3;copy;2$;12|))
                (QSETVELT |spc| 1
                          (PROGN
                           (LETT #2# NIL . #3#)
                           (SEQ (LETT |s| NIL . #3#)
                                (LETT #1# (QVELT |space| 1) . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |s| (QREFELT $ 32))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                (EXIT |spc|)))) 

(SDEFUN |SPACE3;enterPointData;$LNni;13|
        ((|space| $) (|listOfPoints| |List| (|Point| R))
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G790 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL . #2=(|SPACE3;enterPointData;$LNni;13|))
                     (LETT #1# |listOfPoints| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT (SPADCALL (QVELT |space| 0) |p| (QREFELT $ 38))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 16))))))) 

(SDEFUN |SPACE3;modifyPointData;$NniP$;14|
        ((|space| $) (|i| |NonNegativeInteger|) (|p| |Point| R) ($ $))
        (SEQ (SPADCALL (QVELT |space| 0) |i| |p| (QREFELT $ 40))
             (EXIT |space|))) 

(SDEFUN |SPACE3;point?;$B;15| ((|space| $) ($ |Boolean|))
        (SPROG ((|kid| #1=(|List| (|SubSpace| 3 R))) (|c| #1#))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         . #2=(|SPACE3;point?;$B;15|)))
                  1 (QREFELT $ 43))
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10))
                         . #2#))
                  1)
                 (EQL (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10)))
                      1))
                ('T NIL)))) 

(SDEFUN |SPACE3;point;$P;16| ((|space| $) ($ |Point| R))
        (COND
         ((SPADCALL |space| (QREFELT $ 44))
          (SPADCALL (SPADCALL (QVELT |space| 0) (LIST 1 1 1) (QREFELT $ 46))
                    (QREFELT $ 47)))
         ('T
          (|error|
           "This ThreeSpace holds something other than a single point - try the objects() command")))) 

(SDEFUN |SPACE3;point;P$;17| ((|aPoint| |Point| R) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |aPoint| (QREFELT $ 49))) 

(SDEFUN |SPACE3;point;$P$;18| ((|space| $) (|aPoint| |Point| R) ($ $))
        (SEQ (SPADCALL (QVELT |space| 0) NIL |aPoint| (QREFELT $ 51))
             (QSETVELT |space| 4 NIL) (EXIT |space|))) 

(SDEFUN |SPACE3;point;$L$;19| ((|space| $) (|l| |List| R) ($ $))
        (SPROG ((|pt| (|Point| R)))
               (SEQ
                (LETT |pt| (SPADCALL |l| (QREFELT $ 53)) |SPACE3;point;$L$;19|)
                (EXIT (SPADCALL |space| |pt| (QREFELT $ 49)))))) 

(SDEFUN |SPACE3;point;$Nni$;20| ((|space| $) (|i| |NonNegativeInteger|) ($ $))
        (SEQ (SPADCALL (QVELT |space| 0) NIL |i| (QREFELT $ 55))
             (QSETVELT |space| 4 NIL) (EXIT |space|))) 

(SDEFUN |SPACE3;curve?;$B;21| ((|space| $) ($ |Boolean|))
        (SPROG ((|c| (|List| (|SubSpace| 3 R))))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         |SPACE3;curve?;$B;21|))
                  1 (QREFELT $ 43))
                 (|error| "This ThreeSpace has more than one component"))
                ('T
                 (EQL (LENGTH (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10)))
                      1))))) 

(SDEFUN |SPACE3;curve;$L;22| ((|space| $) ($ |List| (|Point| R)))
        (SPROG
         ((#1=#:G814 NIL) (|s| NIL) (#2=#:G813 NIL) (|spc| (|SubSpace| 3 R)))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 57))
            (SEQ
             (LETT |spc|
                   (|SPADfirst|
                    (SPADCALL
                     (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                     (QREFELT $ 10)))
                   . #3=(|SPACE3;curve;$L;22|))
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |s| NIL . #3#)
                    (LETT #1# (SPADCALL |spc| (QREFELT $ 10)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 47)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a curve - try the objects() command")))))) 

(SDEFUN |SPACE3;curve;L$;23| ((|points| |List| (|Point| R)) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| (QREFELT $ 59))) 

(SDEFUN |SPACE3;curve;$L$;24| ((|space| $) (|points| |List| (|Point| R)) ($ $))
        (SPROG
         ((#1=#:G819 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|))))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| |points|)
                    (QREFELT $ 51))
          (LETT |path|
                (LIST (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 10))) 1)
                . #2=(|SPACE3;curve;$L$;24|))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |points|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 51))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;curve;$L$;25| ((|space| $) (|points| |List| (|List| R)) ($ $))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ
                (LETT |pts| (SPADCALL (ELT $ 53) |points| (QREFELT $ 64))
                      |SPACE3;curve;$L$;25|)
                (EXIT (SPADCALL |space| |pts| (QREFELT $ 59)))))) 

(SDEFUN |SPACE3;closedCurve?;$B;26| ((|space| $) ($ |Boolean|))
        (SPROG ((|kid| #1=(|List| (|SubSpace| 3 R))) (|c| #1#))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         . #2=(|SPACE3;closedCurve?;$B;26|)))
                  1 (QREFELT $ 43))
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10))
                         . #2#))
                  1)
                 (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 66)))
                ('T NIL)))) 

(SDEFUN |SPACE3;closedCurve;$L;27| ((|space| $) ($ |List| (|Point| R)))
        (SPROG
         ((#1=#:G833 NIL) (|s| NIL) (#2=#:G832 NIL) (|spc| (|SubSpace| 3 R)))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 67))
            (SEQ
             (LETT |spc|
                   (|SPADfirst|
                    (SPADCALL
                     (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                     (QREFELT $ 10)))
                   . #3=(|SPACE3;closedCurve;$L;27|))
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |s| NIL . #3#)
                    (LETT #1# (SPADCALL |spc| (QREFELT $ 10)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 47)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a curve - try the objects() command")))))) 

(SDEFUN |SPACE3;closedCurve;L$;28| ((|points| |List| (|Point| R)) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| (QREFELT $ 69))) 

(SDEFUN |SPACE3;closedCurve;$L$;29|
        ((|space| $) (|points| |List| (|Point| R)) ($ $))
        (SPROG
         ((#1=#:G838 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|))))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| |points|)
                    (QREFELT $ 51))
          (LETT |path|
                (LIST (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 10))) 1)
                . #2=(|SPACE3;closedCurve;$L$;29|))
          (SPADCALL (QVELT |space| 0) |path| 'T (QREFELT $ 71))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |points|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 51))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;closedCurve;$L$;30|
        ((|space| $) (|points| |List| (|List| R)) ($ $))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ
                (LETT |pts| (SPADCALL (ELT $ 53) |points| (QREFELT $ 64))
                      |SPACE3;closedCurve;$L$;30|)
                (EXIT (SPADCALL |space| |pts| (QREFELT $ 69)))))) 

(SDEFUN |SPACE3;polygon?;$B;31| ((|space| $) ($ |Boolean|))
        (SPROG ((|kid| #1=(|List| (|SubSpace| 3 R))) (|c| #1#))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         . #2=(|SPACE3;polygon?;$B;31|)))
                  1 (QREFELT $ 43))
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10))
                         . #2#))
                  2)
                 (COND
                  ((EQL (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10)))
                        1)
                   (SPADCALL
                    (LENGTH
                     (SPADCALL (SPADCALL |kid| (QREFELT $ 73)) (QREFELT $ 10)))
                    2 (QREFELT $ 43)))
                  (#3='T NIL)))
                (#3# NIL)))) 

(SDEFUN |SPACE3;polygon;$L;32| ((|space| $) ($ |List| (|Point| R)))
        (SPROG
         ((#1=#:G855 NIL) (|s| NIL) (#2=#:G854 NIL)
          (|listOfPoints| (|List| (|Point| R)))
          (|cs| (|List| (|SubSpace| 3 R))))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 74))
            (SEQ
             (LETT |listOfPoints|
                   (LIST
                    (SPADCALL
                     (|SPADfirst|
                      (SPADCALL
                       (|SPADfirst|
                        (LETT |cs|
                              (SPADCALL
                               (|SPADfirst|
                                (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                               (QREFELT $ 10))
                              . #3=(|SPACE3;polygon;$L;32|)))
                       (QREFELT $ 10)))
                     (QREFELT $ 47)))
                   . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |s| NIL . #3#)
                    (LETT #1#
                          (SPADCALL (SPADCALL |cs| (QREFELT $ 73))
                                    (QREFELT $ 10))
                          . #3#)
                    G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 47)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a polygon - try the objects() command")))))) 

(SDEFUN |SPACE3;polygon;L$;33| ((|points| |List| (|Point| R)) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| (QREFELT $ 20))) 

(SDEFUN |SPACE3;polygon;$L$;34|
        ((|space| $) (|points| |List| (|List| R)) ($ $))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ
                (LETT |pts| (SPADCALL (ELT $ 53) |points| (QREFELT $ 64))
                      |SPACE3;polygon;$L$;34|)
                (EXIT (SPADCALL |space| |pts| (QREFELT $ 20)))))) 

(SDEFUN |SPACE3;mesh?;$B;35| ((|space| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G867 NIL) (|eachCurve| NIL)
          (|whatSizes| (|Set| (|NonNegativeInteger|)))
          (|kid| #2=(|List| (|SubSpace| 3 R))) (|c| #2#))
         (SEQ
          (COND
           ((SPADCALL
             (LENGTH
              (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                    . #3=(|SPACE3;mesh?;$B;35|)))
             1 (QREFELT $ 43))
            (|error| "This ThreeSpace has more than one component"))
           ((SPADCALL
             (LENGTH
              (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10)) . #3#))
             1 (QREFELT $ 43))
            (SEQ (LETT |whatSizes| (SPADCALL (QREFELT $ 79)) . #3#)
                 (SEQ (LETT |eachCurve| NIL . #3#) (LETT #1# |kid| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |eachCurve| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL
                         (LENGTH (SPADCALL |eachCurve| (QREFELT $ 10)))
                         |whatSizes| (QREFELT $ 80))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |whatSizes| (QREFELT $ 81)) 1
                              (QREFELT $ 43))
                    (|error| "Mesh defined with curves of different sizes"))
                   ((< (|SPADfirst| (SPADCALL |whatSizes| (QREFELT $ 82))) 2)
                    (|error|
                     "Mesh defined with single point curves (use curve())"))
                   (#4='T 'T)))))
           (#4# NIL))))) 

(SDEFUN |SPACE3;mesh;$L;36| ((|space| $) ($ |List| (|List| (|Point| R))))
        (SPROG
         ((|llp| (|List| (|List| (|Point| R)))) (#1=#:G875 NIL) (|s| NIL)
          (#2=#:G874 NIL) (#3=#:G873 NIL) (|lpSpace| NIL))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 83))
            (SEQ (LETT |llp| NIL . #4=(|SPACE3;mesh;$L;36|))
                 (SEQ (LETT |lpSpace| NIL . #4#)
                      (LETT #3#
                            (SPADCALL
                             (|SPADfirst|
                              (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                             (QREFELT $ 10))
                            . #4#)
                      G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |lpSpace| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |llp|
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #4#)
                                (SEQ (LETT |s| NIL . #4#)
                                     (LETT #1#
                                           (SPADCALL |lpSpace| (QREFELT $ 10))
                                           . #4#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |s| (CAR #1#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |s| (QREFELT $ 47))
                                              #2#)
                                             . #4#)))
                                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               |llp|)
                              . #4#)))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                 (EXIT |llp|)))
           ('T
            (|error|
             "This ThreeSpace holds something other than a mesh - try the objects() command")))))) 

(SDEFUN |SPACE3;mesh;L$;37| ((|points| |List| (|List| (|Point| R))) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| NIL NIL (QREFELT $ 86))) 

(SDEFUN |SPACE3;mesh;L2B$;38|
        ((|points| |List| (|List| (|Point| R))) (|prop1| . #1=(|Boolean|))
         (|prop2| . #1#) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| |prop1| |prop2|
                  (QREFELT $ 86))) 

(SDEFUN |SPACE3;mesh;$LLSscp$;39|
        ((|space| $) (|llpoints| |List| (|List| (|List| R)))
         (|lprops| |List| #1=(|SubSpaceComponentProperty|)) (|prop| . #1#)
         ($ $))
        (SPROG
         ((|pts| (|List| (|List| (|Point| R)))) (#2=#:G884 NIL) (|points| NIL)
          (#3=#:G883 NIL))
         (SEQ
          (LETT |pts|
                (PROGN
                 (LETT #3# NIL . #4=(|SPACE3;mesh;$LLSscp$;39|))
                 (SEQ (LETT |points| NIL . #4#) (LETT #2# |llpoints| . #4#)
                      G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |points| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (ELT $ 53) |points| (QREFELT $ 64))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT (SPADCALL |space| |pts| |lprops| |prop| (QREFELT $ 90)))))) 

(SDEFUN |SPACE3;mesh;$LLSscp$;40|
        ((|space| $) (|llp| |List| (|List| (|Point| R)))
         (|lprops| |List| #1=(|SubSpaceComponentProperty|)) (|prop| . #1#)
         ($ $))
        (SPROG
         ((#2=#:G896 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|)))
          (#3=#:G894 NIL) (|lp| NIL) (#4=#:G895 NIL) (|aProp| NIL)
          (|count| NIL) (#5=#:G893 NIL))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| (|SPADfirst| |llp|))
                    (QREFELT $ 51))
          (SPADCALL (QVELT |space| 0)
                    (LETT |path|
                          (LIST
                           (LENGTH
                            (SPADCALL (QVELT |space| 0) (QREFELT $ 10))))
                          . #6=(|SPACE3;mesh;$LLSscp$;40|))
                    |prop| (QREFELT $ 93))
          (LETT |path| (SPADCALL |path| (LIST 1) (QREFELT $ 94)) . #6#)
          (SPADCALL (QVELT |space| 0) |path| (|SPADfirst| |lprops|)
                    (QREFELT $ 93))
          (SEQ (LETT |p| NIL . #6#) (LETT #5# (CDR (|SPADfirst| |llp|)) . #6#)
               G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 51))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |count| 2 . #6#) (LETT |aProp| NIL . #6#)
               (LETT #4# (CDR |lprops|) . #6#) (LETT |lp| NIL . #6#)
               (LETT #3# (CDR |llp|) . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |lp| (CAR #3#) . #6#) NIL)
                     (ATOM #4#) (PROGN (LETT |aProp| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (SPADCALL (QVELT |space| 0)
                          (LETT |path| (LIST (|SPADfirst| |path|)) . #6#)
                          (|SPADfirst| |lp|) (QREFELT $ 51))
                (LETT |path| (SPADCALL |path| (LIST |count|) (QREFELT $ 94))
                      . #6#)
                (SPADCALL (QVELT |space| 0) |path| |aProp| (QREFELT $ 93))
                (EXIT
                 (SEQ (LETT |p| NIL . #6#) (LETT #2# (CDR |lp|) . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |space| 0) |path| |p|
                                  (QREFELT $ 51))))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))))
               (LETT #3#
                     (PROG1 (CDR #3#)
                       (LETT #4#
                             (PROG1 (CDR #4#)
                               (LETT |count| (|inc_SI| |count|) . #6#))
                             . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;mesh;$L2B$;41|
        ((|space| $) (|llpoints| |List| (|List| (|List| R)))
         (|prop1| . #1=(|Boolean|)) (|prop2| . #1#) ($ $))
        (SPROG
         ((|pts| (|List| (|List| (|Point| R)))) (#2=#:G903 NIL) (|points| NIL)
          (#3=#:G902 NIL))
         (SEQ
          (LETT |pts|
                (PROGN
                 (LETT #3# NIL . #4=(|SPACE3;mesh;$L2B$;41|))
                 (SEQ (LETT |points| NIL . #4#) (LETT #2# |llpoints| . #4#)
                      G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |points| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (ELT $ 53) |points| (QREFELT $ 64))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT (SPADCALL |space| |pts| |prop1| |prop2| (QREFELT $ 86)))))) 

(SDEFUN |SPACE3;mesh;$L2B$;42|
        ((|space| $) (|llp| |List| (|List| (|Point| R)))
         (|prop1| . #1=(|Boolean|)) (|prop2| . #1#) ($ $))
        (SPROG
         ((#2=#:G912 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|)))
          (#3=#:G911 NIL) (|lp| NIL) (|count| NIL) (#4=#:G910 NIL)
          (|propB| #5=(|SubSpaceComponentProperty|)) (|propA| #5#))
         (SEQ
          (LETT |propA| (SPADCALL (QREFELT $ 96))
                . #6=(|SPACE3;mesh;$L2B$;42|))
          (SPADCALL |propA| |prop1| (QREFELT $ 97))
          (LETT |propB| (SPADCALL (QREFELT $ 96)) . #6#)
          (SPADCALL |propB| |prop2| (QREFELT $ 97))
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| (|SPADfirst| |llp|))
                    (QREFELT $ 51))
          (SPADCALL (QVELT |space| 0)
                    (LETT |path|
                          (LIST
                           (LENGTH
                            (SPADCALL (QVELT |space| 0) (QREFELT $ 10))))
                          . #6#)
                    |propB| (QREFELT $ 93))
          (LETT |path| (SPADCALL |path| (LIST 1) (QREFELT $ 94)) . #6#)
          (SPADCALL (QVELT |space| 0) |path| |propA| (QREFELT $ 93))
          (SEQ (LETT |p| NIL . #6#) (LETT #4# (CDR (|SPADfirst| |llp|)) . #6#)
               G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 51))))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |count| 2 . #6#) (LETT |lp| NIL . #6#)
               (LETT #3# (CDR |llp|) . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |lp| (CAR #3#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (SPADCALL (QVELT |space| 0)
                          (LETT |path| (LIST (|SPADfirst| |path|)) . #6#)
                          (|SPADfirst| |lp|) (QREFELT $ 51))
                (LETT |path| (SPADCALL |path| (LIST |count|) (QREFELT $ 94))
                      . #6#)
                (SPADCALL (QVELT |space| 0) |path| |propA| (QREFELT $ 93))
                (EXIT
                 (SEQ (LETT |p| NIL . #6#) (LETT #2# (CDR |lp|) . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |space| 0) |path| |p|
                                  (QREFELT $ 51))))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))))
               (LETT #3#
                     (PROG1 (CDR #3#) (LETT |count| (|inc_SI| |count|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;lp;$L;43| ((|space| $) ($ |List| (|Point| R)))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $) |SPACE3;lp;$L;43|)))
         (EXIT (QVELT (QVELT |space| 2) 0)))) 

(SDEFUN |SPACE3;lllip;$L;44|
        ((|space| $) ($ |List| (|List| (|List| (|NonNegativeInteger|)))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $)
                 |SPACE3;lllip;$L;44|)))
         (EXIT (QVELT (QVELT |space| 2) 1)))) 

(SDEFUN |SPACE3;llprop;$L;45|
        ((|space| $) ($ |List| (|List| (|SubSpaceComponentProperty|))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $)
                 |SPACE3;llprop;$L;45|)))
         (EXIT (QVELT (QVELT |space| 2) 2)))) 

(SDEFUN |SPACE3;lprop;$L;46|
        ((|space| $) ($ |List| (|SubSpaceComponentProperty|)))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $)
                 |SPACE3;lprop;$L;46|)))
         (EXIT (QVELT (QVELT |space| 2) 3)))) 

(SDEFUN |SPACE3;objects;$R;47|
        ((|space| $)
         ($ |Record| (|:| |points| #1=(|NonNegativeInteger|))
          (|:| |curves| #1#) (|:| |polygons| #1#) (|:| |constructs| #1#)))
        (SPROG
         ((|numConstructs| #2=(|NonNegativeInteger|)) (|numPolys| #2#)
          (|numCurves| #2#) (|numPts| #2#) (|kid| (|List| (|SubSpace| 3 R)))
          (#3=#:G942 NIL) (|component| NIL))
         (SEQ
          (COND
           ((NULL (QVELT |space| 4))
            (LETT |space| (|SPACE3;convertSpace| |space| $)
                  . #4=(|SPACE3;objects;$R;47|))))
          (LETT |numPts| 0 . #4#) (LETT |numCurves| 0 . #4#)
          (LETT |numPolys| 0 . #4#) (LETT |numConstructs| 0 . #4#)
          (SEQ (LETT |component| NIL . #4#)
               (LETT #3# (SPADCALL (QVELT |space| 0) (QREFELT $ 10)) . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |component| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL
                    (LENGTH
                     (LETT |kid| (SPADCALL |component| (QREFELT $ 10)) . #4#))
                    1)
                   (COND
                    ((EQL
                      (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10))) 1)
                     (LETT |numPts| (+ |numPts| 1) . #4#))
                    ('T (LETT |numCurves| (+ |numCurves| 1) . #4#))))
                  ('T
                   (SEQ
                    (COND
                     ((EQL (LENGTH |kid|) 2)
                      (COND
                       ((EQL
                         (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10)))
                         1)
                        (COND
                         ((SPADCALL
                           (LENGTH
                            (SPADCALL (|SPADfirst| (CDR |kid|))
                                      (QREFELT $ 10)))
                           1 (QREFELT $ 105))
                          (EXIT (LETT |numPolys| (+ |numPolys| 1) . #4#))))))))
                    (EXIT
                     (LETT |numConstructs| (+ |numConstructs| 1) . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |numPts| |numCurves| |numPolys| |numConstructs|))))) 

(SDEFUN |SPACE3;check;2$;48| ((|s| $) ($ $))
        (COND ((NULL (QVELT |s| 4)) (|SPACE3;convertSpace| |s| $)) ('T |s|))) 

(PUT '|SPACE3;subspace;$Ss;49| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SPACE3;subspace;$Ss;49| ((|s| $) ($ |SubSpace| 3 R)) (QVELT |s| 0)) 

(SDEFUN |SPACE3;coerce;$Of;50| ((|s| $) ($ |OutputForm|))
        (SPROG ((|sizo| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((NULL (QVELT |s| 4))
                  (LETT |s| (|SPACE3;convertSpace| |s| $)
                        . #1=(|SPACE3;coerce;$Of;50|))))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL "3-Space with " (QREFELT $ 112))
                        (SPADCALL
                         (LETT |sizo| (LENGTH (QVELT (QVELT |s| 2) 1)) . #1#)
                         (QREFELT $ 113))
                        (SPADCALL
                         (COND ((EQL |sizo| 1) " component")
                               ('T " components"))
                         (QREFELT $ 112)))
                  (QREFELT $ 114)))))) 

(DECLAIM (NOTINLINE |ThreeSpace;|)) 

(DEFUN |ThreeSpace| (#1=#:G951)
  (SPROG NIL
         (PROG (#2=#:G952)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ThreeSpace|)
                                               '|domainEqualList|)
                    . #3=(|ThreeSpace|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|ThreeSpace;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ThreeSpace|)))))))))) 

(DEFUN |ThreeSpace;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ThreeSpace|))
          (LETT |dv$| (LIST '|ThreeSpace| DV$1) . #1#)
          (LETT $ (GETREFV 119) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ThreeSpace| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |subspaceField| (|SubSpace| 3 |#1|))
                              (|:| |compositesField|
                                   (|List| (|SubSpace| 3 |#1|)))
                              (|:| |rep3DField|
                                   (|Record| (|:| |lp| (|List| (|Point| |#1|)))
                                             (|:| |llliPt|
                                                  (|List|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|)))))
                                             (|:| |llProp|
                                                  (|List|
                                                   (|List|
                                                    (|SubSpaceComponentProperty|))))
                                             (|:| |lProp|
                                                  (|List|
                                                   (|SubSpaceComponentProperty|)))))
                              (|:| |objectsField|
                                   (|Record|
                                    (|:| |points| (|NonNegativeInteger|))
                                    (|:| |curves| (|NonNegativeInteger|))
                                    (|:| |polygons| (|NonNegativeInteger|))
                                    (|:| |constructs| (|NonNegativeInteger|))))
                              (|:| |converted| (|Boolean|))))
          $))) 

(MAKEPROP '|ThreeSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| $)
              (|SubSpace| '3 6) (0 . |children|) (|SubSpaceComponentProperty|)
              (5 . |extractProperty|) (|NonNegativeInteger|)
              (10 . |extractIndex|) (|List| 17) (15 . |pointData|) (|Point| 6)
              (20 . |addPoint2|) (26 . |addPointLast|) |SPACE3;polygon;$L$;2|
              (34 . |new|) (38 . |Zero|) |SPACE3;create3Space;$;3|
              |SPACE3;create3Space;Ss$;4| |SPACE3;numberOfComponents;$Nni;5|
              |SPACE3;numberOfComposites;$Nni;6| (42 . |merge|) (|List| 9)
              (47 . |append|) |SPACE3;merge;L$;7| |SPACE3;merge;3$;8|
              (53 . |deepCopy|) |SPACE3;composite;L$;9| (58 . |separate|)
              |SPACE3;components;$L;10| |SPACE3;composites;$L;11|
              |SPACE3;copy;2$;12| (63 . |addPoint|)
              |SPACE3;enterPointData;$LNni;13| (69 . |modifyPoint|)
              |SPACE3;modifyPointData;$NniP$;14| (|Boolean|) (76 . >)
              |SPACE3;point?;$B;15| (|List| 13) (82 . |traverse|)
              (88 . |extractPoint|) |SPACE3;point;$P;16| |SPACE3;point;$P$;18|
              |SPACE3;point;P$;17| (93 . |addPoint|) (|List| 6) (100 . |point|)
              |SPACE3;point;$L$;19| (105 . |addPoint|) |SPACE3;point;$Nni$;20|
              |SPACE3;curve?;$B;21| |SPACE3;curve;$L;22| |SPACE3;curve;$L$;24|
              |SPACE3;curve;L$;23| (|Mapping| 17 52) (|List| 52)
              (|ListFunctions2| 52 17) (112 . |map|) |SPACE3;curve;$L$;25|
              (118 . |extractClosed|) |SPACE3;closedCurve?;$B;26|
              |SPACE3;closedCurve;$L;27| |SPACE3;closedCurve;$L$;29|
              |SPACE3;closedCurve;L$;28| (123 . |closeComponent|)
              |SPACE3;closedCurve;$L$;30| (130 . |second|)
              |SPACE3;polygon?;$B;31| |SPACE3;polygon;$L;32|
              |SPACE3;polygon;L$;33| |SPACE3;polygon;$L$;34| (|Set| 13)
              (135 . |empty|) (139 . |insert!|) (145 . |#|) (150 . |parts|)
              |SPACE3;mesh?;$B;35| (|List| 15) |SPACE3;mesh;$L;36|
              |SPACE3;mesh;$L2B$;42| |SPACE3;mesh;L$;37| |SPACE3;mesh;L2B$;38|
              (|List| 11) |SPACE3;mesh;$LLSscp$;40| (|List| 62)
              |SPACE3;mesh;$LLSscp$;39| (155 . |defineProperty|)
              (162 . |append|) |SPACE3;mesh;$L2B$;41| (168 . |new|)
              (172 . |close|) |SPACE3;lp;$L;43| (|List| (|List| 45))
              |SPACE3;lllip;$L;44| (|List| 89) |SPACE3;llprop;$L;45|
              |SPACE3;lprop;$L;46| (178 . |One|) (182 . ~=)
              (|Record| (|:| |points| 13) (|:| |curves| 13) (|:| |polygons| 13)
                        (|:| |constructs| 13))
              |SPACE3;objects;$R;47| |SPACE3;check;2$;48|
              |SPACE3;subspace;$Ss;49| (|String|) (|OutputForm|)
              (188 . |message|) (193 . |coerce|) (198 . |hconcat|)
              |SPACE3;coerce;$Of;50| (|List| 84) (|HashState|)
              (|SingleInteger|))
           '#(~= 203 |subspace| 209 |polygon?| 214 |polygon| 219 |point?| 241
              |point| 246 |objects| 274 |numberOfComposites| 279
              |numberOfComponents| 284 |modifyPointData| 289 |mesh?| 296 |mesh|
              301 |merge| 350 |lprop| 361 |lp| 366 |llprop| 371 |lllp| 376
              |lllip| 381 |latex| 386 |hashUpdate!| 391 |hash| 397
              |enterPointData| 402 |curve?| 408 |curve| 413 |create3Space| 435
              |copy| 444 |composites| 449 |composite| 454 |components| 459
              |coerce| 464 |closedCurve?| 469 |closedCurve| 474 |check| 496 =
              501)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|ThreeSpaceCategory| 6) (|SetCategory|)
                           (|BasicType|) (|CoercibleTo| 111))
                        (|makeByteWordVec2| 118
                                            '(1 9 8 0 10 1 9 11 0 12 1 9 13 0
                                              14 1 9 15 0 16 2 9 0 0 17 18 4 9
                                              0 0 0 17 13 19 0 9 0 21 0 6 0 22
                                              1 9 0 8 27 2 28 0 0 0 29 1 9 0 0
                                              32 1 9 8 0 34 2 9 13 0 17 38 3 9
                                              0 0 13 17 40 2 13 42 0 0 43 2 9 0
                                              0 45 46 1 9 17 0 47 3 9 0 0 45 17
                                              51 1 17 0 52 53 3 9 0 0 45 13 55
                                              2 63 15 61 62 64 1 9 42 0 66 3 9
                                              0 0 45 42 71 1 28 9 0 73 0 78 0
                                              79 2 78 0 13 0 80 1 78 13 0 81 1
                                              78 45 0 82 3 9 0 0 45 11 93 2 45
                                              0 0 0 94 0 11 0 96 2 11 42 0 42
                                              97 0 6 0 104 2 13 42 0 0 105 1
                                              111 0 110 112 1 13 111 0 113 1
                                              111 0 8 114 2 0 42 0 0 1 1 0 9 0
                                              109 1 0 42 0 74 1 0 15 0 75 2 0 0
                                              0 62 77 1 0 0 15 76 2 0 0 0 15 20
                                              1 0 42 0 44 1 0 0 17 50 1 0 17 0
                                              48 2 0 0 0 13 56 2 0 0 0 17 49 2
                                              0 0 0 52 54 1 0 106 0 107 1 0 13
                                              0 26 1 0 13 0 25 3 0 0 0 13 17 41
                                              1 0 42 0 83 3 0 0 84 42 42 88 1 0
                                              84 0 85 4 0 0 0 91 42 42 95 1 0 0
                                              84 87 4 0 0 0 84 42 42 86 4 0 0 0
                                              84 89 11 90 4 0 0 0 91 89 11 92 2
                                              0 0 0 0 31 1 0 0 8 30 1 0 89 0
                                              103 1 0 15 0 98 1 0 101 0 102 1 0
                                              116 0 1 1 0 99 0 100 1 0 110 0 1
                                              2 0 117 117 0 1 1 0 118 0 1 2 0
                                              13 0 15 39 1 0 42 0 57 1 0 15 0
                                              58 2 0 0 0 62 65 1 0 0 15 60 2 0
                                              0 0 15 59 1 0 0 9 24 0 0 0 23 1 0
                                              0 0 37 1 0 8 0 36 1 0 0 8 33 1 0
                                              8 0 35 1 0 111 0 115 1 0 42 0 67
                                              1 0 15 0 68 2 0 0 0 62 72 1 0 0
                                              15 70 2 0 0 0 15 69 1 0 0 0 108 2
                                              0 42 0 0 1)))))
           '|lookupComplete|)) 
