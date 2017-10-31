
(SDEFUN |GROUPP;groupPresentation;LL$;1|
        ((|gens1| |List| (|NonNegativeInteger|))
         (|rels1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G732 NIL) (|r| NIL)
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |g| (SPADCALL |gens1| (QREFELT $ 9))
                . #2=(|GROUPP;groupPresentation;LL$;1|))
          (LETT |rels2| NIL . #2#)
          (SEQ (LETT |r| NIL . #2#) (LETT #1# |rels1| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (NULL |r|))
                   (LETT |rels2| (SPADCALL |rels2| |r| (QREFELT $ 12))
                         . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |g| |rels2|))))) 

(SDEFUN |GROUPP;groupPresentation;L$;2|
        ((|gens1| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |g| (SPADCALL |gens1| (QREFELT $ 9))
                . #1=(|GROUPP;groupPresentation;L$;2|))
          (LETT |rels2| NIL . #1#) (EXIT (CONS |g| |rels2|))))) 

(SDEFUN |GROUPP;groupPresentation;$;3| (($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| NIL . #1=(|GROUPP;groupPresentation;$;3|))
              (LETT |rels1| NIL . #1#)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;mapGen|
        ((|a| |Integer|)
         (|ms| |List|
          (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                    (|:| |NewGen| (|NonNegativeInteger|))))
         ($ |Integer|))
        (SPROG ((#1=#:G745 NIL) (#2=#:G746 NIL) (|m| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |m| NIL . #3=(|GROUPP;mapGen|))
                       (LETT #2# |ms| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (COND
                         ((EQL (ABS |a|) (QCAR |m|))
                          (PROGN (LETT #1# (QCDR |m|) . #3#) (GO #4=#:G744))))
                        (EXIT
                         (COND
                          ((EQL (ABS |a|) (- (QCAR |m|)))
                           (PROGN (LETT #1# (- (QCDR |m|)) . #3#) (GO #4#))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (|error|
                   (SPADCALL
                    (LIST "cant map " (STRINGIMAGE |a|) " in refactor")
                    (QREFELT $ 18)))
                  (EXIT |a|)))
                #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;refactor;2$;5| ((|a| $) ($ $))
        (SPROG
         ((|gens1| (|List| (|NonNegativeInteger|))) (#1=#:G763 NIL) (|gn| NIL)
          (#2=#:G762 NIL) (|rels1| (|List| (|List| (|Integer|))))
          (|newRule| (|List| (|Integer|))) (|newEle| (|Integer|))
          (#3=#:G761 NIL) (|ele| NIL) (#4=#:G760 NIL) (|rule| NIL)
          (|gms|
           (|List|
            (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                      (|:| |NewGen| (|NonNegativeInteger|)))))
          (|gm|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|))))
          (#5=#:G758 NIL) (|g| NIL) (#6=#:G759 NIL))
         (SEQ (LETT |gms| NIL . #7=(|GROUPP;refactor;2$;5|))
              (SEQ (LETT |gn| 1 . #7#)
                   (LETT #6# (SPADCALL (QCAR |a|) (QREFELT $ 21)) . #7#)
                   (LETT |g| NIL . #7#)
                   (LETT #5# (SPADCALL (QCAR |a|) (QREFELT $ 19)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |gn| #6#))
                     (GO G191)))
                   (SEQ (LETT |gm| (CONS |g| |gn|) . #7#)
                        (EXIT
                         (LETT |gms| (SPADCALL |gms| |gm| (QREFELT $ 24))
                               . #7#)))
                   (LETT #5#
                         (PROG1 (CDR #5#) (LETT |gn| (|inc_SI| |gn|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |rels1| NIL . #7#)
              (SEQ (LETT |rule| NIL . #7#) (LETT #4# (QCDR |a|) . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |rule| (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |newRule| NIL . #7#)
                        (SEQ (LETT |ele| NIL . #7#) (LETT #3# |rule| . #7#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |ele| (CAR #3#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newEle| (|GROUPP;mapGen| |ele| |gms| $)
                                    . #7#)
                              (EXIT
                               (LETT |newRule|
                                     (SPADCALL |newRule| |newEle|
                                               (QREFELT $ 26))
                                     . #7#)))
                             (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels1|
                               (SPADCALL |rels1| |newRule| (QREFELT $ 12))
                               . #7#)))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (LETT |gens1|
                    (PROGN
                     (LETT #2# NIL . #7#)
                     (SEQ (LETT |gn| 1 . #7#)
                          (LETT #1# (SPADCALL (QCAR |a|) (QREFELT $ 21)) . #7#)
                          G190 (COND ((|greater_SI| |gn| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |gn| #2#) . #7#)))
                          (LETT |gn| (|inc_SI| |gn|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #7#)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 13)))))) 

(SDEFUN |GROUPP;=;2$B;6| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|brs| #1=(|List| (|List| (|Integer|)))) (|ars| #1#) (#2=#:G768 NIL)
          (|bgs| #3=(|List| (|NonNegativeInteger|))) (|ags| #3#) (|br| ($))
          (|ar| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ar| (SPADCALL |a| (QREFELT $ 27)) . #4=(|GROUPP;=;2$B;6|))
            (LETT |br| (SPADCALL |b| (QREFELT $ 27)) . #4#)
            (LETT |ags| (SPADCALL (QCAR |ar|) (QREFELT $ 19)) . #4#)
            (LETT |bgs| (SPADCALL (QCAR |br|) (QREFELT $ 19)) . #4#)
            (COND
             ((SPADCALL (SPADCALL |ags| (QREFELT $ 29))
                        (SPADCALL |bgs| (QREFELT $ 29)) (QREFELT $ 31))
              (PROGN (LETT #2# NIL . #4#) (GO #5=#:G767))))
            (LETT |ars| (SPADCALL (QCDR |ar|) (QREFELT $ 32)) . #4#)
            (LETT |brs| (SPADCALL (QCDR |br|) (QREFELT $ 32)) . #4#)
            (EXIT
             (SPADCALL (SPADCALL |ars| (QREFELT $ 34))
                       (SPADCALL |brs| (QREFELT $ 34)) (QREFELT $ 35)))))
          #5# (EXIT #2#)))) 

(SDEFUN |GROUPP;genName| ((|i2| |Integer|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G772 NIL) (|n| (|OutputForm|)) (|letters| (|String|))
          (|i| #2=(|Integer|)) (|suffix| #3=(|Integer|))
          (|#G18| (|Record| (|:| |quotient| #3#) (|:| |remainder| #2#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G18| (DIVIDE2 (ABS |i2|) 25) . #4=(|GROUPP;genName|))
             (LETT |suffix| (QCAR |#G18|) . #4#)
             (LETT |i| (QCDR |#G18|) . #4#)
             |#G18|)
            (LETT |letters| "abcdfghijklmnopqrstuvwxyz" . #4#)
            (LETT |n|
                  (SPADCALL (SPADCALL |letters| (+ |i| 1) (QREFELT $ 38))
                            (QREFELT $ 40))
                  . #4#)
            (COND
             ((SPADCALL |suffix| 0 (QREFELT $ 41))
              (PROGN
               (LETT #1#
                     (SPADCALL |n| (SPADCALL (+ |suffix| 1) (QREFELT $ 42))
                               (QREFELT $ 43))
                     . #4#)
               (GO #5=#:G771))))
            (EXIT |n|)))
          #5# (EXIT #1#)))) 

(SDEFUN |GROUPP;genName2| ((|i2| |List| (|List| (|Integer|))) ($ |OutputForm|))
        (SPROG
         ((|rels1| (|List| (|OutputForm|))) (|seperator| #1=(|OutputForm|))
          (|eleout| #1#) (|newterm| (|OutputForm|)) (#2=#:G780 NIL) (|ele| NIL)
          (#3=#:G779 NIL) (|r| NIL))
         (SEQ (LETT |rels1| NIL . #4=(|GROUPP;genName2|))
              (SEQ (LETT |r| NIL . #4#) (LETT #3# |i2| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |eleout| (SPADCALL " " (QREFELT $ 44)) . #4#)
                        (LETT |seperator| (SPADCALL " " (QREFELT $ 44)) . #4#)
                        (SEQ (LETT |ele| NIL . #4#) (LETT #2# |r| . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newterm| (|GROUPP;genName| |ele| $) . #4#)
                              (LETT |eleout|
                                    (SPADCALL
                                     (LIST |eleout| |seperator| |newterm|)
                                     (QREFELT $ 45))
                                    . #4#)
                              (EXIT
                               (LETT |seperator| (SPADCALL "*" (QREFELT $ 44))
                                     . #4#)))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels1|
                               (SPADCALL |rels1| |eleout| (QREFELT $ 47))
                               . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |rels1| (QREFELT $ 48)))))) 

(SDEFUN |GROUPP;removeGen|
        ((|gens1| |PrimitiveArray| (|NonNegativeInteger|))
         (|val| |NonNegativeInteger|)
         ($ |PrimitiveArray| (|NonNegativeInteger|)))
        (SPADCALL |val| |gens1| (QREFELT $ 49))) 

(SDEFUN |GROUPP;removeGen2|
        ((|rels1| |List| (|List| (|Integer|))) (|val| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG ((#1=#:G785 NIL) (|rule| NIL) (#2=#:G784 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GROUPP;removeGen2|))
                 (SEQ (LETT |rule| NIL . #3#) (LETT #1# |rels1| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rule| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (- |val|)
                                         (SPADCALL |val| |rule| (QREFELT $ 50))
                                         (QREFELT $ 50))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GROUPP;replaceGen|
        ((|rels1| |List| (|List| (|Integer|))) (|val1| |NonNegativeInteger|)
         (|val2| |Integer|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|rule2| (|List| (|Integer|))) (|e| (|Integer|)) (#1=#:G794 NIL)
          (|ele| NIL) (#2=#:G793 NIL) (|rule| NIL))
         (SEQ (LETT |rels2| NIL . #3=(|GROUPP;replaceGen|))
              (SEQ (LETT |rule| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rule| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rule2| NIL . #3#)
                        (SEQ (LETT |ele| NIL . #3#) (LETT #1# |rule| . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ (LETT |e| (ABS |ele|) . #3#)
                                  (COND
                                   ((EQL |e| |val1|) (LETT |e| |val2| . #3#)))
                                  (COND ((< |ele| 0) (LETT |e| (- |e|) . #3#)))
                                  (EXIT
                                   (LETT |rule2|
                                         (SPADCALL |rule2| |e| (QREFELT $ 26))
                                         . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels2|
                               (SPADCALL |rels2| |rule2| (QREFELT $ 12))
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |rels2|)))) 

(SDEFUN |GROUPP;TTRemoveGeneratorIfIdentity|
        ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G800 NIL)
          (|toBeRemoved| (|NonNegativeInteger|)) (#2=#:G801 NIL) (|rule| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gens1| (QCAR |s|)
                  . #3=(|GROUPP;TTRemoveGeneratorIfIdentity|))
            (LETT |rels1| (QCDR |s|) . #3#) (LETT |toBeRemoved| 0 . #3#)
            (SEQ (LETT |rule| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |rule| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (LENGTH |rule|) 1)
                     (COND
                      ((EQL |toBeRemoved| 0)
                       (LETT |toBeRemoved| (ABS (|SPADfirst| |rule|))
                             . #3#)))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (COND
             ((EQL |toBeRemoved| 0)
              (PROGN (LETT #1# |s| . #3#) (GO #4=#:G799))))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (LIST "simplify: generator '"
                      (|GROUPP;genName| |toBeRemoved| $)
                      "' is identity so remove it")
                (QREFELT $ 45))
               (QREFELT $ 52))))
            (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $) . #3#)
            (LETT |rels1| (|GROUPP;removeGen2| |rels1| |toBeRemoved| $) . #3#)
            (COND
             (|trace| (SPADCALL (|GROUPP;genName2| |rels1| $) (QREFELT $ 52))))
            (EXIT (CONS |gens1| |rels1|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRenameGenerator| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G811 NIL)
          (|replaceFrom| (|NonNegativeInteger|)) (|replaceTo| (|Integer|))
          (#2=#:G812 NIL) (|rule| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|) . #3=(|GROUPP;TTRenameGenerator|))
                (LETT |rels1| (QCDR |s|) . #3#) (LETT |replaceFrom| 0 . #3#)
                (LETT |replaceTo| 0 . #3#)
                (SEQ (LETT |rule| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |rule| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rule|) 2)
                         (COND
                          ((EQL |replaceFrom| 0)
                           (SEQ
                            (LETT |replaceTo| (SPADCALL |rule| (QREFELT $ 53))
                                  . #3#)
                            (LETT |replaceFrom| (ABS (|SPADfirst| |rule|))
                                  . #3#)
                            (COND
                             ((SPADCALL (|SPADfirst| |rule|) 0 (QREFELT $ 41))
                              (LETT |replaceTo| (- |replaceTo|) . #3#)))
                            (EXIT
                             (COND
                              ((EQL |replaceFrom| (ABS |replaceTo|))
                               (LETT |replaceFrom| 0 . #3#)))))))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |replaceFrom| 0)
                  (PROGN (LETT #1# |s| . #3#) (GO #4=#:G810))))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (LIST "simplify: generator '"
                          (|GROUPP;genName| |replaceFrom| $)
                          "' is replaced by '" (|GROUPP;genName| |replaceTo| $)
                          "'")
                    (QREFELT $ 45))
                   (QREFELT $ 52))))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |replaceFrom| $)
                      . #3#)
                (LETT |rels1|
                      (|GROUPP;replaceGen| |rels1| |replaceFrom| |replaceTo| $)
                      . #3#)
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;genName2| |rels1| $) (QREFELT $ 52))))
                (EXIT (CONS |gens1| |rels1|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveEmpty| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G817 NIL) (|rule| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #2=(|GROUPP;TTRemoveEmpty|))
              (LETT |rels1| (QCDR |s|) . #2#) (LETT |rels2| NIL . #2#)
              (SEQ (LETT |rule| NIL . #2#) (LETT #1# |rels1| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rule| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL |rule|))
                       (LETT |rels2| (SPADCALL |rels2| |rule| (QREFELT $ 12))
                             . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTRemoveZero| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #1=(|GROUPP;TTRemoveZero|))
              (LETT |rels1| (QCDR |s|) . #1#)
              (LETT |gens1| (|GROUPP;removeGen| |gens1| 0 $) . #1#)
              (LETT |rels1| (|GROUPP;removeGen2| |rels1| 0 $) . #1#)
              (EXIT (CONS |gens1| |rels1|))))) 

(SDEFUN |GROUPP;TTRemoveEleTimesInverse| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|rule2| (|List| (|Integer|))) (|lastele| (|Integer|))
          (|changed| (|Boolean|)) (#1=#:G835 NIL) (|ele| NIL) (#2=#:G834 NIL)
          (|rule| NIL) (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #3=(|GROUPP;TTRemoveEleTimesInverse|))
              (LETT |rels1| (QCDR |s|) . #3#) (LETT |rels2| NIL . #3#)
              (LETT |changed| NIL . #3#)
              (SEQ (LETT |rule| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rule| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rule2| NIL . #3#) (LETT |lastele| 0 . #3#)
                        (SEQ (LETT |ele| NIL . #3#) (LETT #1# |rule| . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL (ABS |ele|) (ABS |lastele|))
                                 (COND
                                  ((SPADCALL (SPADCALL |ele| (QREFELT $ 54))
                                             (SPADCALL |lastele|
                                                       (QREFELT $ 54))
                                             (QREFELT $ 55))
                                   (SEQ
                                    (COND
                                     (|trace|
                                      (SPADCALL
                                       (SPADCALL
                                        (LIST "simplify: generator '"
                                              (|GROUPP;genName| |ele| $)
                                              "' is adjacent to its inverse")
                                        (QREFELT $ 45))
                                       (QREFELT $ 52))))
                                    (LETT |changed| 'T . #3#)
                                    (EXIT (LETT |lastele| 0 . #3#))))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((SPADCALL |lastele| 0 (QREFELT $ 55))
                                      (LETT |rule2|
                                            (SPADCALL |rule2| |lastele|
                                                      (QREFELT $ 26))
                                            . #3#)))
                                    (EXIT (LETT |lastele| |ele| . #3#))))))
                                ('T
                                 (SEQ
                                  (COND
                                   ((SPADCALL |lastele| 0 (QREFELT $ 55))
                                    (LETT |rule2|
                                          (SPADCALL |rule2| |lastele|
                                                    (QREFELT $ 26))
                                          . #3#)))
                                  (EXIT (LETT |lastele| |ele| . #3#)))))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((SPADCALL |lastele| 0 (QREFELT $ 55))
                          (LETT |rule2|
                                (SPADCALL |rule2| |lastele| (QREFELT $ 26))
                                . #3#)))
                        (EXIT
                         (COND
                          ((NULL (NULL |rule2|))
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rule2| (QREFELT $ 12))
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (COND
               (|trace|
                (COND
                 (|changed|
                  (SPADCALL (|GROUPP;genName2| |rels2| $) (QREFELT $ 52))))))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTMinimiseInverses| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|rule2| (|List| (|Integer|))) (#1=#:G845 NIL) (|ele| NIL)
          (|numNonInverts| #2=(|NonNegativeInteger|)) (|numInverts| #2#)
          (#3=#:G844 NIL) (#4=#:G843 NIL) (|rule| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #5=(|GROUPP;TTMinimiseInverses|))
              (LETT |rels1| (QCDR |s|) . #5#) (LETT |rels2| NIL . #5#)
              (SEQ (LETT |rule| NIL . #5#) (LETT #4# |rels1| . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |rule| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |numInverts| 0 . #5#)
                        (LETT |numNonInverts| 0 . #5#)
                        (SEQ (LETT |ele| NIL . #5#) (LETT #3# |rule| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |ele| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< |ele| 0)
                                 (LETT |numInverts| (+ |numInverts| 1) . #5#))
                                ('T
                                 (LETT |numNonInverts| (+ |numNonInverts| 1)
                                       . #5#)))))
                             (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |numInverts| |numNonInverts|
                                     (QREFELT $ 56))
                           (SEQ (LETT |rule2| NIL . #5#)
                                (SEQ (LETT |ele| NIL . #5#)
                                     (LETT #1# |rule| . #5#) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |ele| (CAR #1#) . #5#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |rule2| (CONS (- |ele|) |rule2|)
                                             . #5#)))
                                     (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT
                                 (LETT |rels2|
                                       (SPADCALL |rels2| |rule2|
                                                 (QREFELT $ 12))
                                       . #5#))))
                          ('T
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rule| (QREFELT $ 12))
                                 . #5#)))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;isSimpler?| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G852 NIL) (|ruleCompleityB| #2=(|NonNegativeInteger|))
          (#3=#:G854 NIL) (|rule| NIL) (|ruleCompleityA| #2#) (#4=#:G853 NIL)
          (|relsb| #5=(|List| (|List| (|Integer|))))
          (|gensb| #6=(|PrimitiveArray| (|NonNegativeInteger|))) (|relsa| #5#)
          (|gensa| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |gensa| (QCAR |a|) . #7=(|GROUPP;isSimpler?|))
                (LETT |relsa| (QCDR |a|) . #7#) (LETT |gensb| (QCAR |b|) . #7#)
                (LETT |relsb| (QCDR |b|) . #7#)
                (COND
                 ((< (SPADCALL |gensa| (QREFELT $ 21))
                     (SPADCALL |gensb| (QREFELT $ 21)))
                  (PROGN (LETT #1# 'T . #7#) (GO #8=#:G851))))
                (COND
                 ((< (LENGTH |relsa|) (LENGTH |relsb|))
                  (PROGN (LETT #1# 'T . #7#) (GO #8#))))
                (LETT |ruleCompleityA| 0 . #7#)
                (SEQ (LETT |rule| NIL . #7#) (LETT #4# |relsa| . #7#) G190
                     (COND
                      ((OR (ATOM #4#)
                           (PROGN (LETT |rule| (CAR #4#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ruleCompleityA|
                             (+ |ruleCompleityA| (LENGTH |rule|)) . #7#)))
                     (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |ruleCompleityB| 0 . #7#)
                (SEQ (LETT |rule| NIL . #7#) (LETT #3# |relsb| . #7#) G190
                     (COND
                      ((OR (ATOM #3#)
                           (PROGN (LETT |rule| (CAR #3#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ruleCompleityB|
                             (+ |ruleCompleityB| (LENGTH |rule|)) . #7#)))
                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |ruleCompleityA| |ruleCompleityB|)
                  (PROGN (LETT #1# 'T . #7#) (GO #8#))))
                (EXIT NIL)))
          #8# (EXIT #1#)))) 

(SDEFUN |GROUPP;simplify;2$;19| ((|s| $) ($ $))
        (SPADCALL |s| NIL (QREFELT $ 57))) 

(SDEFUN |GROUPP;simplify;$B$;20| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|lastpass| ($)) (|rep| #1=(|Boolean|)) (|res| ($))
          (|lastpassInner| ($)) (|repInner| #1#))
         (SEQ
          (COND
           (|trace|
            (SPADCALL
             (SPADCALL "before simplification :=" (SPADCALL |s| (QREFELT $ 59))
                       (QREFELT $ 43))
             (QREFELT $ 52))))
          (LETT |res| |s| . #2=(|GROUPP;simplify;$B$;20|))
          (LETT |lastpass| |s| . #2#) (LETT |rep| 'T . #2#)
          (SEQ G190 (COND ((NULL |rep|) (GO G191)))
               (SEQ (LETT |res| (|GROUPP;TTRemoveEmpty| |res| |trace| $) . #2#)
                    (LETT |res| (|GROUPP;TTRemoveZero| |res| |trace| $) . #2#)
                    (LETT |lastpassInner| |res| . #2#)
                    (LETT |repInner| 'T . #2#)
                    (SEQ G190 (COND ((NULL |repInner|) (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GROUPP;TTRemoveGeneratorIfIdentity| |res|
                                 |trace| $)
                                . #2#)
                          (LETT |repInner|
                                (|GROUPP;isSimpler?| |res| |lastpassInner| $)
                                . #2#)
                          (EXIT (LETT |lastpassInner| |res| . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |res| (|GROUPP;TTRenameGenerator| |res| |trace| $)
                          . #2#)
                    (LETT |lastpassInner| |res| . #2#)
                    (LETT |repInner| 'T . #2#)
                    (SEQ G190 (COND ((NULL |repInner|) (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GROUPP;TTRemoveEleTimesInverse| |res| |trace|
                                 $)
                                . #2#)
                          (LETT |repInner|
                                (|GROUPP;isSimpler?| |res| |lastpassInner| $)
                                . #2#)
                          (EXIT (LETT |lastpassInner| |res| . #2#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |res| (|GROUPP;TTMinimiseInverses| |res| |trace| $)
                          . #2#)
                    (LETT |rep| (|GROUPP;isSimpler?| |res| |lastpass| $) . #2#)
                    (EXIT (LETT |lastpass| |res| . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |GROUPP;coerce;$Of;21| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|r| #1=(|OutputForm|)) (|g| #1#)
          (|rels1| #2=(|List| (|OutputForm|))) (|seperator| #1#) (|eleout| #1#)
          (|newterm| (|OutputForm|)) (#3=#:G875 NIL) (|ele| NIL)
          (#4=#:G874 NIL) (|rs| (|List| (|List| (|Integer|)))) (|gens1| #2#)
          (#5=#:G873 NIL) (|p| NIL) (|ps| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |ps| (SPADCALL (QCAR |s|) (QREFELT $ 60))
                . #6=(|GROUPP;coerce;$Of;21|))
          (LETT |gens1| NIL . #6#)
          (SEQ (LETT |p| NIL . #6#) (LETT #5# |ps| . #6#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |gens1|
                       (SPADCALL |gens1| (|GROUPP;genName| |p| $)
                                 (QREFELT $ 47))
                       . #6#)))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |rs| (QCDR |s|) . #6#) (LETT |rels1| NIL . #6#)
          (SEQ (LETT |r| NIL . #6#) (LETT #4# |rs| . #6#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ (LETT |eleout| (SPADCALL " " (QREFELT $ 44)) . #6#)
                    (LETT |seperator| (SPADCALL " " (QREFELT $ 44)) . #6#)
                    (SEQ (LETT |ele| NIL . #6#) (LETT #3# |r| . #6#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |ele| (CAR #3#) . #6#) NIL))
                           (GO G191)))
                         (SEQ (LETT |newterm| (|GROUPP;genName| |ele| $) . #6#)
                              (LETT |eleout|
                                    (SPADCALL
                                     (LIST |eleout| |seperator| |newterm|)
                                     (QREFELT $ 45))
                                    . #6#)
                              (EXIT
                               (LETT |seperator| (SPADCALL "*" (QREFELT $ 44))
                                     . #6#)))
                         (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |rels1| (SPADCALL |rels1| |eleout| (QREFELT $ 47))
                           . #6#)))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |g| (SPADCALL " " (QREFELT $ 44)) . #6#)
          (COND
           ((SPADCALL (LENGTH |gens1|) 0 (QREFELT $ 56))
            (LETT |g| (SPADCALL |gens1| (QREFELT $ 48)) . #6#)))
          (LETT |r| (SPADCALL " " (QREFELT $ 44)) . #6#)
          (COND
           ((SPADCALL (LENGTH |rels1|) 0 (QREFELT $ 56))
            (LETT |r| (SPADCALL |rels1| (QREFELT $ 61)) . #6#)))
          (EXIT
           (SPADCALL
            (LIST (SPADCALL "<" (QREFELT $ 44)) |g|
                  (SPADCALL " | " (QREFELT $ 44)) |r|
                  (SPADCALL ">" (QREFELT $ 44)))
            (QREFELT $ 45)))))) 

(DECLAIM (NOTINLINE |GroupPresentation;|)) 

(DEFUN |GroupPresentation| ()
  (SPROG NIL
         (PROG (#1=#:G877)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|GroupPresentation|)
                    . #2=(|GroupPresentation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|GroupPresentation|
                             (LIST
                              (CONS NIL (CONS 1 (|GroupPresentation;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|GroupPresentation|)))))))))) 

(DEFUN |GroupPresentation;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GroupPresentation|) . #1=(|GroupPresentation|))
          (LETT $ (GETREFV 64) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GroupPresentation| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record|
                     (|:| |gens| (|PrimitiveArray| (|NonNegativeInteger|)))
                     (|:| |rels| (|List| (|List| (|Integer|))))))
          $))) 

(MAKEPROP '|GroupPresentation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 20) (|PrimitiveArray| 20)
              (0 . |construct|) (|List| 25) (|List| 10) (5 . |concat|)
              |GROUPP;groupPresentation;LL$;1| |GROUPP;groupPresentation;L$;2|
              |GROUPP;groupPresentation;$;3| (|List| $) (|String|)
              (11 . |concat|) (16 . |entries|) (|NonNegativeInteger|)
              (21 . |#|) (|Record| (|:| |OldGen| 20) (|:| |NewGen| 20))
              (|List| 22) (26 . |concat|) (|Integer|) (32 . |concat|)
              |GROUPP;refactor;2$;5| (|Set| 20) (38 . |set|) (|Boolean|)
              (43 . ~=) (49 . |entries|) (|Set| 10) (54 . |set|) (59 . =)
              |GROUPP;=;2$B;6| (|Character|) (65 . |elt|) (|OutputForm|)
              (71 . |coerce|) (76 . >) (82 . |outputForm|) (87 . |hconcat|)
              (93 . |outputForm|) (98 . |hconcat|) (|List| 39) (103 . |concat|)
              (109 . |blankSeparate|) (114 . |remove|) (120 . |remove|)
              (|Void|) (126 . |print|) (131 . |second|) (136 . |sign|)
              (141 . ~=) (147 . >) |GROUPP;simplify;$B$;20|
              |GROUPP;simplify;2$;19| |GROUPP;coerce;$Of;21| (153 . |parts|)
              (158 . |commaSeparate|) (|SingleInteger|) (|HashState|))
           '#(~= 163 |simplify| 169 |refactor| 180 |latex| 185 |hashUpdate!|
              190 |hash| 196 |groupPresentation| 201 |coerce| 216 = 221)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 39))
                        (|makeByteWordVec2| 63
                                            '(1 8 0 7 9 2 11 0 0 10 12 1 17 0
                                              16 18 1 8 7 0 19 1 8 20 0 21 2 23
                                              0 0 22 24 2 10 0 0 25 26 1 28 0 7
                                              29 2 28 30 0 0 31 1 11 11 0 32 1
                                              33 0 11 34 2 33 30 0 0 35 2 17 37
                                              0 25 38 1 37 39 0 40 2 25 30 0 0
                                              41 1 39 0 25 42 2 39 0 0 0 43 1
                                              39 0 17 44 1 39 0 16 45 2 46 0 0
                                              39 47 1 39 0 16 48 2 8 0 20 0 49
                                              2 10 0 25 0 50 1 39 51 0 52 1 10
                                              25 0 53 1 25 25 0 54 2 25 30 0 0
                                              55 2 20 30 0 0 56 1 8 7 0 60 1 39
                                              0 16 61 2 0 30 0 0 1 1 0 0 0 58 2
                                              0 0 0 30 57 1 0 0 0 27 1 0 17 0 1
                                              2 0 63 63 0 1 1 0 62 0 1 0 0 0 15
                                              2 0 0 7 11 13 1 0 0 7 14 1 0 39 0
                                              59 2 0 30 0 0 36)))))
           '|lookupComplete|)) 

(MAKEPROP '|GroupPresentation| 'NILADIC T) 
