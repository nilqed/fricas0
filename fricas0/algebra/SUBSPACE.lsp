
(SDEFUN |SUBSPACE;leaf?;$B;1| ((|space| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |space| (QREFELT $ 11)) (QREFELT $ 14))) 

(SDEFUN |SUBSPACE;root?;$B;2| ((|space| $) ($ |Boolean|))
        (EQL (QVELT |space| 5) 0)) 

(SDEFUN |SUBSPACE;internal?;$B;3| ((|space| $) ($ |Boolean|))
        (COND
         ((SPADCALL |space| (QREFELT $ 16))
          (NULL (SPADCALL |space| (QREFELT $ 15))))
         ('T 'T))) 

(SDEFUN |SUBSPACE;new;$;4| (($ $))
        (VECTOR (SPADCALL NIL (QREFELT $ 20)) 0 (SPADCALL (QREFELT $ 22))
                (SPADCALL (QREFELT $ 23)) (SPADCALL (QREFELT $ 23)) 0 NIL NIL 0
                0 (SPADCALL (QREFELT $ 23)))) 

(SDEFUN |SUBSPACE;subspace;$;5| (($ $)) (SPADCALL (QREFELT $ 24))) 

(SDEFUN |SUBSPACE;birth;2$;6| ((|momma| $) ($ $))
        (SPROG ((|lastKid| (|List| $)) (|baby| ($)))
               (SEQ
                (LETT |baby| (SPADCALL (QREFELT $ 24))
                      . #1=(|SUBSPACE;birth;2$;6|))
                (QSETVELT |baby| 5 (+ (QVELT |momma| 5) 1))
                (QSETVELT |baby| 10 (LIST |momma|))
                (COND
                 ((NULL
                   (SPADCALL (LETT |lastKid| (QVELT |momma| 4) . #1#)
                             (QREFELT $ 14)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |lastKid| (QREFELT $ 26))
                               (QREFELT $ 14)))
                    (EXIT (|error| (QREFELT $ 9)))))))
                (COND
                 ((SPADCALL |lastKid| (QREFELT $ 14))
                  (SEQ (QSETVELT |momma| 3 (LIST |baby|))
                       (QSETVELT |momma| 4 (QVELT |momma| 3))
                       (EXIT (QSETVELT |momma| 9 1))))
                 ('T
                  (SEQ (SPADCALL |lastKid| (LIST |baby|) (QREFELT $ 27))
                       (QSETVELT |momma| 4 (SPADCALL |lastKid| (QREFELT $ 26)))
                       (EXIT (QSETVELT |momma| 9 (+ (QVELT |momma| 9) 1))))))
                (EXIT |baby|)))) 

(SDEFUN |SUBSPACE;child;$Nni$;7|
        ((|space| $) (|num| |NonNegativeInteger|) ($ $))
        (SPADCALL (QVELT |space| 3) |num| (QREFELT $ 30))) 

(PUT '|SUBSPACE;children;$L;8| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 3))) 

(SDEFUN |SUBSPACE;children;$L;8| ((|space| $) ($ |List| $)) (QVELT |space| 3)) 

(PUT '|SUBSPACE;numberOfChildren;$Nni;9| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 9))) 

(SDEFUN |SUBSPACE;numberOfChildren;$Nni;9|
        ((|space| $) ($ |NonNegativeInteger|)) (QVELT |space| 9)) 

(SDEFUN |SUBSPACE;shallowCopy;2$;10| ((|space| $) ($ $))
        (SPROG ((|node| ($)))
               (SEQ
                (LETT |node| (SPADCALL (QREFELT $ 24))
                      |SUBSPACE;shallowCopy;2$;10|)
                (QSETVELT |node| 0 (QVELT |space| 0))
                (QSETVELT |node| 1 (QVELT |space| 1))
                (QSETVELT |node| 2 (SPADCALL (QVELT |space| 2) (QREFELT $ 34)))
                (QSETVELT |node| 5 (QVELT |space| 5))
                (QSETVELT |node| 10 (SPADCALL (QREFELT $ 23)))
                (COND
                 ((SPADCALL |space| (QREFELT $ 16))
                  (SEQ
                   (QSETVELT |node| 6
                             (SPADCALL (QVELT |space| 6) (QREFELT $ 36)))
                   (QSETVELT |node| 7
                             (SPADCALL (QVELT |node| 6) (QREFELT $ 37)))
                   (EXIT (QSETVELT |node| 8 (QVELT |space| 8))))))
                (EXIT |node|)))) 

(SDEFUN |SUBSPACE;deepCopy;2$;11| ((|space| $) ($ $))
        (SPROG ((|cc| ($)) (#1=#:G772 NIL) (|c| NIL) (|node| ($)))
               (SEQ
                (LETT |node| (SPADCALL |space| (QREFELT $ 38))
                      . #2=(|SUBSPACE;deepCopy;2$;11|))
                (EXIT
                 (COND ((SPADCALL |space| (QREFELT $ 15)) |node|)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL . #2#)
                              (LETT #1# (SPADCALL |space| (QREFELT $ 11))
                                    . #2#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |cc| (SPADCALL |c| (QREFELT $ 39)) . #2#)
                               (QSETVELT |cc| 10 (LIST |node|))
                               (EXIT
                                (QSETVELT |node| 3
                                          (SPADCALL |cc| (QVELT |node| 3)
                                                    (QREFELT $ 40)))))
                              (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                              (EXIT NIL))
                         (QSETVELT |node| 3
                                   (SPADCALL (QVELT |node| 3) (QREFELT $ 41)))
                         (QSETVELT |node| 4
                                   (SPADCALL (QVELT |node| 3) (QREFELT $ 42)))
                         (EXIT |node|)))))))) 

(SDEFUN |SUBSPACE;merge;3$;12| ((|s1| $) (|s2| $) ($ $))
        (SPROG ((|n2| (|Rep|)) (|n1| (|Rep|)))
               (SEQ
                (LETT |n1| (SPADCALL |s1| (QREFELT $ 39))
                      . #1=(|SUBSPACE;merge;3$;12|))
                (LETT |n2| (SPADCALL |s2| (QREFELT $ 39)) . #1#)
                (QSETVELT |n1| 3
                          (SPADCALL (SPADCALL |n1| (QREFELT $ 11))
                                    (SPADCALL |n2| (QREFELT $ 11))
                                    (QREFELT $ 43)))
                (EXIT |n1|)))) 

(SDEFUN |SUBSPACE;merge;L$;13| ((|listOfSpaces| |List| $) ($ $))
        (SPROG
         ((#1=#:G782 NIL) (|c| NIL) (#2=#:G781 NIL) (#3=#:G780 NIL) (|s| NIL)
          (|space| ($)))
         (SEQ
          (COND
           ((SPADCALL |listOfSpaces| (QREFELT $ 14))
            (|error| "empty list passed as argument to merge"))
           ('T
            (SEQ
             (LETT |space|
                   (SPADCALL (SPADCALL |listOfSpaces| (QREFELT $ 45))
                             (QREFELT $ 39))
                   . #4=(|SUBSPACE;merge;L$;13|))
             (SEQ (LETT |s| NIL . #4#)
                  (LETT #3# (SPADCALL |listOfSpaces| (QREFELT $ 26)) . #4#)
                  G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETVELT |space| 3
                              (SPADCALL (QVELT |space| 3)
                                        (PROGN
                                         (LETT #2# NIL . #4#)
                                         (SEQ (LETT |c| NIL . #4#)
                                              (LETT #1# (QVELT |s| 3) . #4#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |c| (CAR #1#) . #4#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |c|
                                                                 (QREFELT $
                                                                          39))
                                                       #2#)
                                                      . #4#)))
                                              (LETT #1# (CDR #1#) . #4#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 43)))))
                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT |space|))))))) 

(SDEFUN |SUBSPACE;separate;$L;14| ((|space| $) ($ |List| $))
        (SPROG ((|spaceList| (|List| $)) (|spc| ($)) (#1=#:G787 NIL) (|s| NIL))
               (SEQ
                (LETT |spaceList| (SPADCALL (QREFELT $ 23))
                      . #2=(|SUBSPACE;separate;$L;14|))
                (SEQ (LETT |s| NIL . #2#) (LETT #1# (QVELT |space| 3) . #2#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (LETT |spc| (SPADCALL |space| (QREFELT $ 38)) . #2#)
                          (QSETVELT |spc| 3
                                    (LIST (SPADCALL |s| (QREFELT $ 39))))
                          (EXIT
                           (LETT |spaceList|
                                 (SPADCALL |spc| |spaceList| (QREFELT $ 40))
                                 . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |spaceList|)))) 

(SDEFUN |SUBSPACE;addPoint;$LP$;15|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) (|point| |Point| R)
         ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G800 NIL) (|more| NIL)
          (|depth| (|NonNegativeInteger|)) (#2=#:G799 NIL) (|i| NIL)
          (|which| (|NonNegativeInteger|)) (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #3=(|SUBSPACE;addPoint;$LP$;15|))))
            (COND
             ((NULL (NULL (CDR |lastPt|))) (EXIT (|error| (QREFELT $ 9)))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 48))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #3#) (LETT |node| |space| . #3#)
          (LETT |depth| 0 . #3#)
          (SEQ (LETT |i| NIL . #3#) (LETT #2# |path| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |node| (SPADCALL |node| |i| (QREFELT $ 32)) . #3#)
                    (EXIT (LETT |depth| (+ |depth| 1) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |more| |depth| . #3#) (LETT #1# (- (QREFELT $ 6) 1) . #3#)
               G190 (COND ((> |more| #1#) (GO G191)))
               (SEQ
                (EXIT (LETT |node| (SPADCALL |node| (QREFELT $ 28)) . #3#)))
               (LETT |more| (+ |more| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |space|)))) 

(SDEFUN |SUBSPACE;addPoint2;$P$;16| ((|space| $) (|point| |Point| R) ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G809 NIL) (|more| NIL) (|first| ($))
          (|depth| (|NonNegativeInteger|)) (|which| (|NonNegativeInteger|))
          (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #2=(|SUBSPACE;addPoint2;$P$;16|))))
            (COND
             ((NULL (NULL (CDR |lastPt|))) (EXIT (|error| (QREFELT $ 9)))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 48))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #2#) (LETT |node| |space| . #2#)
          (LETT |depth| 0 . #2#)
          (LETT |node| (SPADCALL |node| (QREFELT $ 28)) . #2#)
          (LETT |first| |node| . #2#)
          (SEQ (LETT |more| 1 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |more| #1#) (GO G191)))
               (SEQ
                (EXIT (LETT |node| (SPADCALL |node| (QREFELT $ 28)) . #2#)))
               (LETT |more| (|inc_SI| |more|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |first|)))) 

(SDEFUN |SUBSPACE;addPointLast;2$PNni$;17|
        ((|space| $) (|node| $) (|point| |Point| R)
         (|depth| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G818 NIL) (|more| NIL) (|which| (|NonNegativeInteger|))
          (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #2=(|SUBSPACE;addPointLast;2$PNni$;17|))))
            (COND
             ((NULL (NULL (CDR |lastPt|))) (EXIT (|error| (QREFELT $ 9)))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 48))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #2#)
          (COND
           ((EQL |depth| 2)
            (LETT |node| (SPADCALL |node| 2 (QREFELT $ 32)) . #2#)))
          (SEQ (LETT |more| |depth| . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
               G190 (COND ((> |more| #1#) (GO G191)))
               (SEQ
                (EXIT (LETT |node| (SPADCALL |node| (QREFELT $ 28)) . #2#)))
               (LETT |more| (+ |more| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |node|)))) 

(SDEFUN |SUBSPACE;addPoint;$LNni$;18|
        ((|space| $) (|path| |List| (|NonNegativeInteger|))
         (|which| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G826 NIL) (|more| NIL)
          (|depth| (|NonNegativeInteger|)) (#2=#:G825 NIL) (|i| NIL))
         (SEQ (LETT |node| |space| . #3=(|SUBSPACE;addPoint;$LNni$;18|))
              (LETT |depth| 0 . #3#)
              (SEQ (LETT |i| NIL . #3#) (LETT #2# |path| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |node| (SPADCALL |node| |i| (QREFELT $ 32)) . #3#)
                    (EXIT (LETT |depth| (+ |depth| 1) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |more| |depth| . #3#)
                   (LETT #1# (- (QREFELT $ 6) 1) . #3#) G190
                   (COND ((> |more| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |node| (SPADCALL |node| (QREFELT $ 28)) . #3#)))
                   (LETT |more| (+ |more| 1) . #3#) (GO G190) G191 (EXIT NIL))
              (QSETVELT |node| 0
                        (SPADCALL (QVELT |space| 6) |which| (QREFELT $ 53)))
              (QSETVELT |node| 1 |which|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;addPoint;$PNni;19|
        ((|space| $) (|point| |Point| R) ($ |NonNegativeInteger|))
        (SPROG ((|lastPt| (|List| (|Point| R))))
               (SEQ
                (COND
                 ((SPADCALL |space| (QREFELT $ 16))
                  (SEQ
                   (COND
                    ((NULL
                      (NULL
                       (LETT |lastPt| (QVELT |space| 7)
                             |SUBSPACE;addPoint;$PNni;19|)))
                     (COND
                      ((NULL (NULL (CDR |lastPt|)))
                       (EXIT (|error| (QREFELT $ 9)))))))
                   (COND
                    ((NULL |lastPt|)
                     (SEQ (QSETVELT |space| 6 (LIST |point|))
                          (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
                    (#1='T
                     (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 48))
                          (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
                   (EXIT (QSETVELT |space| 8 (+ (QVELT |space| 8) 1)))))
                 (#1#
                  (|error|
                   "You need to pass a top level SubSpace (level should be zero)")))))) 

(SDEFUN |SUBSPACE;modifyPoint;$LP$;20|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) (|point| |Point| R)
         ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G843 NIL) (|i| NIL)
          (|which| (|NonNegativeInteger|)) (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #2=(|SUBSPACE;modifyPoint;$LP$;20|))))
            (COND
             ((NULL (NULL (CDR |lastPt|))) (EXIT (|error| (QREFELT $ 9)))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 48))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #2#) (LETT |node| |space| . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |node| (SPADCALL |node| |i| (QREFELT $ 32)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |space|)))) 

(SDEFUN |SUBSPACE;modifyPoint;$LNni$;21|
        ((|space| $) (|path| |List| (|NonNegativeInteger|))
         (|which| |NonNegativeInteger|) ($ $))
        (SPROG ((|node| ($)) (#1=#:G848 NIL) (|i| NIL))
               (SEQ
                (LETT |node| |space| . #2=(|SUBSPACE;modifyPoint;$LNni$;21|))
                (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |node| (SPADCALL |node| |i| (QREFELT $ 32))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETVELT |node| 0
                          (SPADCALL (QVELT |space| 6) |which| (QREFELT $ 53)))
                (QSETVELT |node| 1 |which|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;modifyPoint;$NniP$;22|
        ((|space| $) (|which| |NonNegativeInteger|) (|point| |Point| R) ($ $))
        (SEQ
         (COND
          ((SPADCALL |space| (QREFELT $ 16))
           (SEQ (SPADCALL (QVELT |space| 6) |which| |point| (QREFELT $ 58))
                (EXIT |space|)))
          ('T
           (|error|
            "You need to pass a top level SubSpace (level should be zero)"))))) 

(SDEFUN |SUBSPACE;closeComponent;$LB$;23|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) (|val| |Boolean|)
         ($ $))
        (SPROG ((|node| ($)) (#1=#:G856 NIL) (|i| NIL))
               (SEQ
                (LETT |node| |space| . #2=(|SUBSPACE;closeComponent;$LB$;23|))
                (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |node| (SPADCALL |node| |i| (QREFELT $ 32))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (SPADCALL (QVELT |node| 2) |val| (QREFELT $ 60))
                (EXIT |space|)))) 

(SDEFUN |SUBSPACE;defineProperty;$LSscp$;24|
        ((|space| $) (|path| |List| (|NonNegativeInteger|))
         (|prop| |SubSpaceComponentProperty|) ($ $))
        (SPROG ((|node| ($)) (#1=#:G860 NIL) (|i| NIL))
               (SEQ
                (LETT |node| |space|
                      . #2=(|SUBSPACE;defineProperty;$LSscp$;24|))
                (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |node| (SPADCALL |node| |i| (QREFELT $ 32))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETVELT |node| 2 |prop|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;traverse;$L$;25|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG ((#1=#:G864 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| NIL . #2=(|SUBSPACE;traverse;$L$;25|))
                     (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |space| (SPADCALL |space| |i| (QREFELT $ 32))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |space|)))) 

(SDEFUN |SUBSPACE;extractPoint;$P;26| ((|space| $) ($ |Point| R))
        (SPROG ((|node| ($)))
               (SEQ (LETT |node| |space| . #1=(|SUBSPACE;extractPoint;$P;26|))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |node| (QREFELT $ 16))))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| (QREFELT $ 64))
                                 . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL (QVELT |node| 6) (QVELT |space| 1)
                               (QREFELT $ 53)))))) 

(PUT '|SUBSPACE;extractIndex;$Nni;27| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 1))) 

(SDEFUN |SUBSPACE;extractIndex;$Nni;27| ((|space| $) ($ |NonNegativeInteger|))
        (QVELT |space| 1)) 

(SDEFUN |SUBSPACE;extractClosed;$B;28| ((|space| $) ($ |Boolean|))
        (SPADCALL (QVELT |space| 2) (QREFELT $ 67))) 

(PUT '|SUBSPACE;extractProperty;$Sscp;29| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 2))) 

(SDEFUN |SUBSPACE;extractProperty;$Sscp;29|
        ((|space| $) ($ |SubSpaceComponentProperty|)) (QVELT |space| 2)) 

(SDEFUN |SUBSPACE;parent;2$;30| ((|space| $) ($ $))
        (COND
         ((SPADCALL (QVELT |space| 10) (QREFELT $ 14))
          (|error| "This is a top level SubSpace - it does not have a parent"))
         ('T (SPADCALL (QVELT |space| 10) (QREFELT $ 45))))) 

(PUT '|SUBSPACE;pointData;$L;31| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 6))) 

(SDEFUN |SUBSPACE;pointData;$L;31| ((|space| $) ($ |List| (|Point| R)))
        (QVELT |space| 6)) 

(PUT '|SUBSPACE;level;$Nni;32| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 5))) 

(SDEFUN |SUBSPACE;level;$Nni;32| ((|space| $) ($ |NonNegativeInteger|))
        (QVELT |space| 5)) 

(SDEFUN |SUBSPACE;=;2$B;33| ((|s1| $) (|s2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G883 NIL) (#2=#:G882 #3=(|Boolean|)) (#4=#:G884 #3#)
          (#5=#:G889 NIL) (|c1| NIL) (#6=#:G890 NIL) (|c2| NIL))
         (SEQ
          (COND
           ((SPADCALL |s1| (QREFELT $ 15))
            (COND
             ((SPADCALL |s2| (QREFELT $ 15))
              (EXIT
               (COND
                ((SPADCALL (QVELT |s1| 0) (QVELT |s2| 0) (QREFELT $ 72))
                 (COND
                  ((SPADCALL (QVELT |s1| 2) (QVELT |s2| 2) (QREFELT $ 73))
                   (EQL (QVELT |s1| 5) (QVELT |s2| 5)))
                  (#7='T NIL)))
                (#7# NIL)))))))
          (EXIT
           (COND
            ((OR
              (OR
               (SPADCALL (SPADCALL (QVELT |s1| 3) (QREFELT $ 74))
                         (SPADCALL (QVELT |s2| 3) (QREFELT $ 74))
                         (QREFELT $ 75))
               (NULL
                (PROGN
                 (LETT #1# NIL . #8=(|SUBSPACE;=;2$B;33|))
                 (SEQ (LETT |c2| NIL . #8#) (LETT #6# (QVELT |s2| 3) . #8#)
                      (LETT |c1| NIL . #8#) (LETT #5# (QVELT |s1| 3) . #8#)
                      G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |c1| (CAR #5#) . #8#) NIL)
                            (ATOM #6#) (PROGN (LETT |c2| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL |c1| |c2| (QREFELT $ 76)) . #8#)
                         (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL)) . #8#))
                               ('T
                                (PROGN
                                 (LETT #2# #4# . #8#)
                                 (LETT #1# 'T . #8#)))))))
                      (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) (#7# 'T)))))
              (NULL (SPADCALL (QVELT |s1| 2) (QVELT |s2| 2) (QREFELT $ 73))))
             NIL)
            ('T (EQL (QVELT |s1| 5) (QVELT |s2| 5)))))))) 

(SDEFUN |SUBSPACE;coerce;$Of;34| ((|space| $) ($ |OutputForm|))
        (SPROG ((|s| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 6) (QREFELT $ 79))
                      "-Space with depth of "
                      (SPADCALL (- (QREFELT $ 6) (QVELT |space| 5))
                                (QREFELT $ 80))
                      " and "
                      (SPADCALL
                       (LETT |s| (SPADCALL (QVELT |space| 3) (QREFELT $ 74))
                             |SUBSPACE;coerce;$Of;34|)
                       (QREFELT $ 81))
                      (COND ((EQL |s| 1) " component") ('T " components")))
                (QREFELT $ 82)))) 

(DECLAIM (NOTINLINE |SubSpace;|)) 

(DEFUN |SubSpace| (&REST #1=#:G892)
  (SPROG NIL
         (PROG (#2=#:G893)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SubSpace|)
                                               '|domainEqualList|)
                    . #3=(|SubSpace|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SubSpace;|) #1#)
                    (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|SubSpace|)))))))))) 

(DEFUN |SubSpace;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SubSpace|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SubSpace| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 87) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SubSpace| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |pt| (|Point| |#2|))
                              (|:| |index| (|NonNegativeInteger|))
                              (|:| |property| (|SubSpaceComponentProperty|))
                              (|:| |childrenField| (|List| $))
                              (|:| |lastChild| (|List| $))
                              (|:| |levelField| (|NonNegativeInteger|))
                              (|:| |pointDataField| (|List| (|Point| |#2|)))
                              (|:| |lastPoint| (|List| (|Point| |#2|)))
                              (|:| |noPoints| (|NonNegativeInteger|))
                              (|:| |noChildren| (|NonNegativeInteger|))
                              (|:| |parentField| (|List| $))))
          (QSETREFV $ 9 "Non-null list: Please inform Stephen Watt")
          $))) 

(MAKEPROP '|SubSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              'TELLWATT (|List| $) |SUBSPACE;children;$L;8| (|Boolean|)
              (|List| $$) (0 . |empty?|) |SUBSPACE;leaf?;$B;1|
              |SUBSPACE;root?;$B;2| |SUBSPACE;internal?;$B;3| (|List| 7)
              (|Point| 7) (5 . |point|) (|SubSpaceComponentProperty|)
              (10 . |new|) (14 . |nil|) |SUBSPACE;new;$;4|
              |SUBSPACE;subspace;$;5| (18 . |rest|) (23 . |setrest!|)
              |SUBSPACE;birth;2$;6| (|Integer|) (29 . |elt|)
              (|NonNegativeInteger|) |SUBSPACE;child;$Nni$;7|
              |SUBSPACE;numberOfChildren;$Nni;9| (35 . |copy|) (|List| 19)
              (40 . |copy|) (45 . |tail|) |SUBSPACE;shallowCopy;2$;10|
              |SUBSPACE;deepCopy;2$;11| (50 . |cons|) (56 . |reverse!|)
              (61 . |tail|) (66 . |append|) |SUBSPACE;merge;3$;12|
              (72 . |first|) |SUBSPACE;merge;L$;13| |SUBSPACE;separate;$L;14|
              (77 . |setrest!|) (|List| 31) |SUBSPACE;addPoint;$LP$;15|
              |SUBSPACE;addPoint2;$P$;16| |SUBSPACE;addPointLast;2$PNni$;17|
              (83 . |elt|) |SUBSPACE;addPoint;$LNni$;18|
              |SUBSPACE;addPoint;$PNni;19| |SUBSPACE;modifyPoint;$LP$;20|
              |SUBSPACE;modifyPoint;$LNni$;21| (89 . |setelt!|)
              |SUBSPACE;modifyPoint;$NniP$;22| (96 . |close|)
              |SUBSPACE;closeComponent;$LB$;23|
              |SUBSPACE;defineProperty;$LSscp$;24| |SUBSPACE;traverse;$L$;25|
              |SUBSPACE;parent;2$;30| |SUBSPACE;extractPoint;$P;26|
              |SUBSPACE;extractIndex;$Nni;27| (102 . |closed?|)
              |SUBSPACE;extractClosed;$B;28|
              |SUBSPACE;extractProperty;$Sscp;29| |SUBSPACE;pointData;$L;31|
              |SUBSPACE;level;$Nni;32| (107 . =) (113 . =) (119 . |#|)
              (124 . ~=) |SUBSPACE;=;2$B;33| (|OutputForm|) (|PositiveInteger|)
              (130 . |coerce|) (135 . |coerce|) (140 . |coerce|)
              (145 . |hconcat|) |SUBSPACE;coerce;$Of;34| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 150 |traverse| 156 |subspace| 162 |shallowCopy| 166 |separate|
              171 |root?| 176 |pointData| 181 |parent| 186 |numberOfChildren|
              191 |new| 196 |modifyPoint| 200 |merge| 221 |level| 232 |leaf?|
              237 |latex| 242 |internal?| 247 |hashUpdate!| 252 |hash| 258
              |extractProperty| 263 |extractPoint| 268 |extractIndex| 273
              |extractClosed| 278 |defineProperty| 283 |deepCopy| 290 |coerce|
              295 |closeComponent| 300 |children| 307 |child| 312 |birth| 318
              |addPointLast| 323 |addPoint2| 331 |addPoint| 337 = 357)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 77))
                        (|makeByteWordVec2| 86
                                            '(1 13 12 0 14 1 19 0 18 20 0 21 0
                                              22 0 13 0 23 1 13 0 0 26 2 13 0 0
                                              0 27 2 13 2 0 29 30 1 21 0 0 34 1
                                              35 0 0 36 1 35 0 0 37 2 13 0 2 0
                                              40 1 13 0 0 41 1 13 0 0 42 2 13 0
                                              0 0 43 1 13 2 0 45 2 35 0 0 0 48
                                              2 35 19 0 29 53 3 35 19 0 29 19
                                              58 2 21 12 0 12 60 1 21 12 0 67 2
                                              19 12 0 0 72 2 21 12 0 0 73 1 13
                                              31 0 74 2 31 12 0 0 75 1 78 77 0
                                              79 1 29 77 0 80 1 31 77 0 81 1 77
                                              0 10 82 2 0 12 0 0 1 2 0 0 0 49
                                              63 0 0 0 25 1 0 0 0 38 1 0 10 0
                                              47 1 0 12 0 16 1 0 35 0 70 1 0 0
                                              0 64 1 0 31 0 33 0 0 0 24 3 0 0 0
                                              31 19 59 3 0 0 0 49 31 57 3 0 0 0
                                              49 19 56 2 0 0 0 0 44 1 0 0 10 46
                                              1 0 31 0 71 1 0 12 0 15 1 0 84 0
                                              1 1 0 12 0 17 2 0 86 86 0 1 1 0
                                              85 0 1 1 0 21 0 69 1 0 19 0 65 1
                                              0 31 0 66 1 0 12 0 68 3 0 0 0 49
                                              21 62 1 0 0 0 39 1 0 77 0 83 3 0
                                              0 0 49 12 61 1 0 10 0 11 2 0 0 0
                                              31 32 1 0 0 0 28 4 0 0 0 0 19 31
                                              52 2 0 0 0 19 51 2 0 31 0 19 55 3
                                              0 0 0 49 31 54 3 0 0 0 49 19 50 2
                                              0 12 0 0 76)))))
           '|lookupComplete|)) 
