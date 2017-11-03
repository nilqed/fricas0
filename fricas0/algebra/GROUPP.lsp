
(SDEFUN |GROUPP;groupPresentation;LL$;1|
        ((|gens1| |List| (|NonNegativeInteger|))
         (|rels1| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((#1=#:G761 NIL) (|r| NIL) (#2=#:G760 NIL)
          (|g| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |g| (SPADCALL |gens1| (QREFELT $ 9))
                . #3=(|GROUPP;groupPresentation;LL$;1|))
          (EXIT
           (CONS |g|
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |r| NIL . #3#) (LETT #1# |rels1| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (NULL |r|))
                           (LETT #2# (CONS |r| #2#) . #3#)))))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))))))) 

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
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;mapGen|
        ((|a| |Integer|)
         (|ms| |List|
          (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                    (|:| |NewGen| (|NonNegativeInteger|))))
         ($ |Integer|))
        (SPROG ((#1=#:G775 NIL) (#2=#:G776 NIL) (|m| NIL))
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
                          (PROGN (LETT #1# (QCDR |m|) . #3#) (GO #4=#:G774))))
                        (EXIT
                         (COND
                          ((EQL (ABS |a|) (- (QCAR |m|)))
                           (PROGN (LETT #1# (- (QCDR |m|)) . #3#) (GO #4#))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (|error|
                   (SPADCALL
                    (LIST "cant map " (STRINGIMAGE |a|) " in refactor")
                    (QREFELT $ 16)))
                  (EXIT |a|)))
                #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;refactor;2$;5| ((|a| $) ($ $))
        (SPROG
         ((|gens1| (|List| (|NonNegativeInteger|))) (#1=#:G801 NIL) (|gn| NIL)
          (#2=#:G800 NIL) (|rels1| (|List| (|List| (|Integer|))))
          (|newRel| (|List| (|Integer|))) (|newEle| (|Integer|))
          (#3=#:G799 NIL) (|ele| NIL) (#4=#:G798 NIL) (|rel| NIL)
          (|gms|
           (|List|
            (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                      (|:| |NewGen| (|NonNegativeInteger|)))))
          (|gm|
           (|Record| (|:| |OldGen| (|NonNegativeInteger|))
                     (|:| |NewGen| (|NonNegativeInteger|))))
          (#5=#:G796 NIL) (|g| NIL) (#6=#:G797 NIL))
         (SEQ (LETT |gms| NIL . #7=(|GROUPP;refactor;2$;5|))
              (SEQ (LETT |gn| 1 . #7#)
                   (LETT #6# (SPADCALL (QCAR |a|) (QREFELT $ 19)) . #7#)
                   (LETT |g| NIL . #7#)
                   (LETT #5# (SPADCALL (QCAR |a|) (QREFELT $ 17)) . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |gn| #6#))
                     (GO G191)))
                   (SEQ (LETT |gm| (CONS |g| |gn|) . #7#)
                        (EXIT
                         (LETT |gms| (SPADCALL |gms| |gm| (QREFELT $ 22))
                               . #7#)))
                   (LETT #5#
                         (PROG1 (CDR #5#) (LETT |gn| (|inc_SI| |gn|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |rels1| NIL . #7#)
              (SEQ (LETT |rel| NIL . #7#) (LETT #4# (QCDR |a|) . #7#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |rel| (CAR #4#) . #7#) NIL))
                     (GO G191)))
                   (SEQ (LETT |newRel| NIL . #7#)
                        (SEQ (LETT |ele| NIL . #7#) (LETT #3# |rel| . #7#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |ele| (CAR #3#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |newEle| (|GROUPP;mapGen| |ele| |gms| $)
                                    . #7#)
                              (EXIT
                               (LETT |newRel|
                                     (SPADCALL |newRel| |newEle|
                                               (QREFELT $ 25))
                                     . #7#)))
                             (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels1|
                               (SPADCALL |rels1| |newRel| (QREFELT $ 26))
                               . #7#)))
                   (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
              (LETT |gens1|
                    (PROGN
                     (LETT #2# NIL . #7#)
                     (SEQ (LETT |gn| 1 . #7#)
                          (LETT #1# (SPADCALL (QCAR |a|) (QREFELT $ 19)) . #7#)
                          G190 (COND ((|greater_SI| |gn| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |gn| #2#) . #7#)))
                          (LETT |gn| (|inc_SI| |gn|) . #7#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #7#)
              (EXIT (SPADCALL |gens1| |rels1| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;=;2$B;6| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((|brs| #1=(|List| (|List| (|Integer|)))) (|ars| #1#) (#2=#:G806 NIL)
          (|bgs| #3=(|List| (|NonNegativeInteger|))) (|ags| #3#) (|br| ($))
          (|ar| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ar| (SPADCALL |a| (QREFELT $ 27)) . #4=(|GROUPP;=;2$B;6|))
            (LETT |br| (SPADCALL |b| (QREFELT $ 27)) . #4#)
            (LETT |ags| (SPADCALL (QCAR |ar|) (QREFELT $ 17)) . #4#)
            (LETT |bgs| (SPADCALL (QCAR |br|) (QREFELT $ 17)) . #4#)
            (COND
             ((SPADCALL (SPADCALL |ags| (QREFELT $ 29))
                        (SPADCALL |bgs| (QREFELT $ 29)) (QREFELT $ 31))
              (PROGN (LETT #2# NIL . #4#) (GO #5=#:G805))))
            (LETT |ars| (SPADCALL (QCDR |ar|) (QREFELT $ 32)) . #4#)
            (LETT |brs| (SPADCALL (QCDR |br|) (QREFELT $ 32)) . #4#)
            (EXIT
             (SPADCALL (SPADCALL |ars| (QREFELT $ 34))
                       (SPADCALL |brs| (QREFELT $ 34)) (QREFELT $ 35)))))
          #5# (EXIT #2#)))) 

(SDEFUN |GROUPP;outputGen| ((|i2| |Integer|) ($ |OutputForm|))
        (SPROG
         ((#1=#:G810 NIL) (|n| (|OutputForm|)) (|letters| (|String|))
          (|i| #2=(|Integer|)) (|suffix| #3=(|Integer|))
          (|#G18| (|Record| (|:| |quotient| #3#) (|:| |remainder| #2#))))
         (SEQ
          (EXIT
           (SEQ
            (PROGN
             (LETT |#G18| (DIVIDE2 (ABS |i2|) 25) . #4=(|GROUPP;outputGen|))
             (LETT |suffix| (QCAR |#G18|) . #4#)
             (LETT |i| (QCDR |#G18|) . #4#)
             |#G18|)
            (LETT |letters| "eabcdfghijklmnopqrstuvwxyz" . #4#)
            (LETT |n|
                  (SPADCALL (SPADCALL |letters| (+ |i| 1) (QREFELT $ 38))
                            (QREFELT $ 40))
                  . #4#)
            (COND
             ((SPADCALL |suffix| 0 (QREFELT $ 41))
              (LETT |n|
                    (SPADCALL |n| (SPADCALL (+ |suffix| 1) (QREFELT $ 42))
                              (QREFELT $ 43))
                    . #4#)))
            (COND
             ((< |i2| 0)
              (PROGN
               (LETT #1#
                     (SPADCALL (SPADCALL "-" (QREFELT $ 44)) |n|
                               (QREFELT $ 43))
                     . #4#)
               (GO #5=#:G809))))
            (EXIT |n|)))
          #5# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputRel| ((|r| |List| (|Integer|)) ($ |OutputForm|))
        (SPROG
         ((|seperator| #1=(|OutputForm|)) (|eleout| #1#)
          (|newterm| (|OutputForm|)) (#2=#:G815 NIL) (|ele| NIL))
         (SEQ
          (LETT |eleout| (SPADCALL "" (QREFELT $ 44))
                . #3=(|GROUPP;outputRel|))
          (LETT |seperator| (SPADCALL " " (QREFELT $ 44)) . #3#)
          (SEQ (LETT |ele| NIL . #3#) (LETT #2# |r| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |ele| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |newterm| (|GROUPP;outputGen| |ele| $) . #3#)
                    (LETT |eleout|
                          (SPADCALL (LIST |eleout| |seperator| |newterm|)
                                    (QREFELT $ 45))
                          . #3#)
                    (EXIT
                     (LETT |seperator| (SPADCALL "*" (QREFELT $ 44)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |eleout|)))) 

(SDEFUN |GROUPP;outputRelList|
        ((|i2| |List| (|List| (|Integer|))) ($ |OutputForm|))
        (SPROG
         ((#1=#:G820 NIL) (|rels1| (|List| (|OutputForm|))) (#2=#:G821 NIL)
          (|r| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rels1| NIL . #3=(|GROUPP;outputRelList|))
                (SEQ (LETT |r| NIL . #3#) (LETT #2# |i2| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |rels1|
                             (SPADCALL |rels1| (|GROUPP;outputRel| |r| $)
                                       (QREFELT $ 47))
                             . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |rels1|) 0 (QREFELT $ 41))
                  (PROGN
                   (LETT #1# (SPADCALL |rels1| (QREFELT $ 48)) . #3#)
                   (GO #4=#:G819))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;outputGenList|
        ((|ps| |List| (|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG
         ((#1=#:G826 NIL) (|gens1| (|List| (|OutputForm|))) (#2=#:G827 NIL)
          (|p| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| NIL . #3=(|GROUPP;outputGenList|))
                (SEQ (LETT |p| NIL . #3#) (LETT #2# |ps| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |gens1|
                             (SPADCALL |gens1| (|GROUPP;outputGen| |p| $)
                                       (QREFELT $ 47))
                             . #3#)))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL (LENGTH |gens1|) 0 (QREFELT $ 49))
                  (PROGN
                   (LETT #1# (SPADCALL |gens1| (QREFELT $ 50)) . #3#)
                   (GO #4=#:G825))))
                (EXIT (SPADCALL " " (QREFELT $ 44)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;indexesOfRelUsingGen|
        ((|s| $) (|gen| |NonNegativeInteger|)
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|res| (|List| (|NonNegativeInteger|))) (#1=#:G834 NIL) (|rel| NIL)
          (#2=#:G835 NIL) (|reln| NIL) (|r| (|List| (|List| (|Integer|)))))
         (SEQ (LETT |res| NIL . #3=(|GROUPP;indexesOfRelUsingGen|))
              (LETT |r| (QCDR |s|) . #3#)
              (SEQ (LETT |reln| 1 . #3#) (LETT #2# (LENGTH |r|) . #3#)
                   (LETT |rel| NIL . #3#) (LETT #1# |r| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#) . #3#) NIL)
                         (|greater_SI| |reln| #2#))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((SPADCALL |gen| |rel| (QREFELT $ 51))
                      (LETT |res| (SPADCALL |res| |reln| (QREFELT $ 52))
                            . #3#)))
                    (EXIT
                     (COND
                      ((SPADCALL |gen| 0 (QREFELT $ 49))
                       (COND
                        ((SPADCALL (- |gen|) |rel| (QREFELT $ 51))
                         (LETT |res| (SPADCALL |res| |reln| (QREFELT $ 52))
                               . #3#)))))))
                   (LETT #1#
                         (PROG1 (CDR #1#)
                           (LETT |reln| (|inc_SI| |reln|) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;removeGen|
        ((|gens1| |PrimitiveArray| (|NonNegativeInteger|))
         (|val| |NonNegativeInteger|)
         ($ |PrimitiveArray| (|NonNegativeInteger|)))
        (SPADCALL |val| |gens1| (QREFELT $ 53))) 

(SDEFUN |GROUPP;removeGen2|
        ((|rels1| |List| (|List| (|Integer|))) (|val| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG ((#1=#:G840 NIL) (|rel| NIL) (#2=#:G839 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|GROUPP;removeGen2|))
                 (SEQ (LETT |rel| NIL . #3#) (LETT #1# |rels1| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |rel| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (- |val|)
                                         (SPADCALL |val| |rel| (QREFELT $ 54))
                                         (QREFELT $ 54))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GROUPP;replaceGen|
        ((|rels1| |List| (|List| (|Integer|))) (|val1| |NonNegativeInteger|)
         (|val2| |Integer|) ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|rel2| (|List| (|Integer|)))
          (|e| (|Integer|)) (#1=#:G849 NIL) (|ele| NIL) (#2=#:G848 NIL)
          (|rel| NIL))
         (SEQ (LETT |rels2| NIL . #3=(|GROUPP;replaceGen|))
              (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL . #3#)
                        (SEQ (LETT |ele| NIL . #3#) (LETT #1# |rel| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ (LETT |e| (ABS |ele|) . #3#)
                                  (COND
                                   ((EQL |e| |val1|) (LETT |e| |val2| . #3#)))
                                  (COND ((< |ele| 0) (LETT |e| (- |e|) . #3#)))
                                  (EXIT
                                   (LETT |rel2|
                                         (SPADCALL |rel2| |e| (QREFELT $ 25))
                                         . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |rels2| (SPADCALL |rels2| |rel2| (QREFELT $ 26))
                               . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |rels2|)))) 

(SDEFUN |GROUPP;TTRemoveGeneratorIfIdentity|
        ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G855 NIL)
          (|toBeRemoved| (|NonNegativeInteger|)) (#2=#:G856 NIL) (|rel| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gens1| (QCAR |s|)
                  . #3=(|GROUPP;TTRemoveGeneratorIfIdentity|))
            (LETT |rels1| (QCDR |s|) . #3#) (LETT |toBeRemoved| 0 . #3#)
            (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (LENGTH |rel|) 1)
                     (COND
                      ((EQL |toBeRemoved| 0)
                       (LETT |toBeRemoved| (ABS (|SPADfirst| |rel|))
                             . #3#)))))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (COND
             ((EQL |toBeRemoved| 0)
              (PROGN (LETT #1# |s| . #3#) (GO #4=#:G854))))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (LIST (SPADCALL "simplify: generator '" (QREFELT $ 44))
                      (|GROUPP;outputGen| |toBeRemoved| $)
                      (SPADCALL "' is identity so remove it" (QREFELT $ 44)))
                (QREFELT $ 45))
               (QREFELT $ 56))))
            (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $) . #3#)
            (LETT |rels1| (|GROUPP;removeGen2| |rels1| |toBeRemoved| $) . #3#)
            (COND
             (|trace|
              (SPADCALL (|GROUPP;outputRelList| |rels1| $) (QREFELT $ 56))))
            (EXIT (CONS |gens1| |rels1|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRenameGenerator| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G866 NIL)
          (|replaceFrom| (|NonNegativeInteger|)) (|replaceTo| (|Integer|))
          (#2=#:G867 NIL) (|rel| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |gens1| (QCAR |s|) . #3=(|GROUPP;TTRenameGenerator|))
                (LETT |rels1| (QCDR |s|) . #3#) (LETT |replaceFrom| 0 . #3#)
                (LETT |replaceTo| 0 . #3#)
                (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |rel|) 2)
                         (COND
                          ((EQL |replaceFrom| 0)
                           (SEQ
                            (LETT |replaceTo| (SPADCALL |rel| (QREFELT $ 57))
                                  . #3#)
                            (LETT |replaceFrom| (ABS (|SPADfirst| |rel|))
                                  . #3#)
                            (COND
                             ((SPADCALL (|SPADfirst| |rel|) 0 (QREFELT $ 41))
                              (LETT |replaceTo| (- |replaceTo|) . #3#)))
                            (EXIT
                             (COND
                              ((EQL |replaceFrom| (ABS |replaceTo|))
                               (LETT |replaceFrom| 0 . #3#)))))))))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |replaceFrom| 0)
                  (PROGN (LETT #1# |s| . #3#) (GO #4=#:G865))))
                (COND
                 (|trace|
                  (SPADCALL
                   (SPADCALL
                    (LIST (SPADCALL "simplify: generator '" (QREFELT $ 44))
                          (|GROUPP;outputGen| |replaceFrom| $)
                          (SPADCALL "' is replaced by '" (QREFELT $ 44))
                          (|GROUPP;outputGen| |replaceTo| $)
                          (SPADCALL "'" (QREFELT $ 44)))
                    (QREFELT $ 45))
                   (QREFELT $ 56))))
                (LETT |gens1| (|GROUPP;removeGen| |gens1| |replaceFrom| $)
                      . #3#)
                (LETT |rels1|
                      (|GROUPP;replaceGen| |rels1| |replaceFrom| |replaceTo| $)
                      . #3#)
                (COND
                 (|trace|
                  (SPADCALL (|GROUPP;outputRelList| |rels1| $)
                            (QREFELT $ 56))))
                (EXIT (CONS |gens1| |rels1|))))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveEmpty| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (#1=#:G872 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #2=(|GROUPP;TTRemoveEmpty|))
              (LETT |rels1| (QCDR |s|) . #2#) (LETT |rels2| NIL . #2#)
              (SEQ (LETT |rel| NIL . #2#) (LETT #1# |rels1| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL |rel|))
                       (LETT |rels2| (SPADCALL |rels2| |rel| (QREFELT $ 26))
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
         ((|rels2| (|List| (|List| (|Integer|)))) (|rel2| (|List| (|Integer|)))
          (|lastele| (|Integer|)) (|changed| (|Boolean|)) (#1=#:G890 NIL)
          (|ele| NIL) (#2=#:G889 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #3=(|GROUPP;TTRemoveEleTimesInverse|))
              (LETT |rels1| (QCDR |s|) . #3#) (LETT |rels2| NIL . #3#)
              (LETT |changed| NIL . #3#)
              (SEQ (LETT |rel| NIL . #3#) (LETT #2# |rels1| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |rel| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |rel2| NIL . #3#) (LETT |lastele| 0 . #3#)
                        (SEQ (LETT |ele| NIL . #3#) (LETT #1# |rel| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ele| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((EQL (ABS |ele|) (ABS |lastele|))
                                 (COND
                                  ((SPADCALL (SPADCALL |ele| (QREFELT $ 58))
                                             (SPADCALL |lastele|
                                                       (QREFELT $ 58))
                                             (QREFELT $ 59))
                                   (SEQ
                                    (COND
                                     (|trace|
                                      (SPADCALL
                                       (SPADCALL
                                        (LIST
                                         (SPADCALL "simplify: generator '"
                                                   (QREFELT $ 44))
                                         (|GROUPP;outputGen| |ele| $)
                                         (SPADCALL
                                          "' is adjacent to its inverse"
                                          (QREFELT $ 44)))
                                        (QREFELT $ 45))
                                       (QREFELT $ 56))))
                                    (LETT |changed| 'T . #3#)
                                    (EXIT (LETT |lastele| 0 . #3#))))
                                  ('T
                                   (SEQ
                                    (COND
                                     ((SPADCALL |lastele| 0 (QREFELT $ 59))
                                      (LETT |rel2|
                                            (SPADCALL |rel2| |lastele|
                                                      (QREFELT $ 25))
                                            . #3#)))
                                    (EXIT (LETT |lastele| |ele| . #3#))))))
                                ('T
                                 (SEQ
                                  (COND
                                   ((SPADCALL |lastele| 0 (QREFELT $ 59))
                                    (LETT |rel2|
                                          (SPADCALL |rel2| |lastele|
                                                    (QREFELT $ 25))
                                          . #3#)))
                                  (EXIT (LETT |lastele| |ele| . #3#)))))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((SPADCALL |lastele| 0 (QREFELT $ 59))
                          (LETT |rel2|
                                (SPADCALL |rel2| |lastele| (QREFELT $ 25))
                                . #3#)))
                        (EXIT
                         (COND
                          ((NULL (NULL |rel2|))
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel2| (QREFELT $ 26))
                                 . #3#)))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (COND
               (|trace|
                (COND
                 (|changed|
                  (SPADCALL (|GROUPP;outputRelList| |rels2| $)
                            (QREFELT $ 56))))))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;invertRelation|
        ((|relationIn| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG
         ((|relationOut| (|List| (|Integer|))) (#1=#:G894 NIL) (|ele| NIL))
         (SEQ (LETT |relationOut| NIL . #2=(|GROUPP;invertRelation|))
              (SEQ (LETT |ele| NIL . #2#) (LETT #1# |relationIn| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |relationOut| (CONS (- |ele|) |relationOut|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;cycleRelation|
        ((|relationIn| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|relationOut| (|List| (|Integer|))))
               (SEQ
                (LETT |relationOut|
                      (SPADCALL (CDR |relationIn|) (|SPADfirst| |relationIn|)
                                (QREFELT $ 25))
                      |GROUPP;cycleRelation|)
                (EXIT |relationOut|)))) 

(SDEFUN |GROUPP;relationEquivalent|
        ((|relA| |List| (|Integer|)) (|relB| |List| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G904 NIL) (|relBCycle| (|List| (|Integer|))) (#2=#:G905 NIL)
          (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |relA|) (LENGTH |relB|) (QREFELT $ 60))
              (PROGN
               (LETT #1# NIL . #3=(|GROUPP;relationEquivalent|))
               (GO #4=#:G903))))
            (COND
             ((SPADCALL |relA| |relB| (QREFELT $ 61))
              (PROGN (LETT #1# 'T . #3#) (GO #4#))))
            (COND
             ((SPADCALL |relA| (|GROUPP;invertRelation| |relB| $)
                        (QREFELT $ 61))
              (PROGN (LETT #1# 'T . #3#) (GO #4#))))
            (LETT |relBCycle| (SPADCALL |relB| (QREFELT $ 62)) . #3#)
            (SEQ (LETT |n| 1 . #3#) (LETT #2# (LENGTH |relA|) . #3#) G190
                 (COND ((|greater_SI| |n| #2#) (GO G191)))
                 (SEQ
                  (LETT |relBCycle| (|GROUPP;cycleRelation| |relBCycle| $)
                        . #3#)
                  (COND
                   ((SPADCALL |relA| |relBCycle| (QREFELT $ 61))
                    (PROGN (LETT #1# 'T . #3#) (GO #4#))))
                  (EXIT
                   (COND
                    ((SPADCALL |relA| (|GROUPP;invertRelation| |relBCycle| $)
                               (QREFELT $ 61))
                     (PROGN (LETT #1# 'T . #3#) (GO #4#))))))
                 (LETT |n| (|inc_SI| |n|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #1#)))) 

(SDEFUN |GROUPP;TTRemoveDuplicateRelation| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|)))) (|include| (|Boolean|))
          (#1=#:G916 NIL) (|relb| NIL) (#2=#:G917 NIL) (|nrelb| NIL)
          (#3=#:G914 NIL) (|rela| NIL) (#4=#:G915 NIL) (|nrela| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |gens1| (QCAR |s|) . #5=(|GROUPP;TTRemoveDuplicateRelation|))
          (LETT |rels1| (QCDR |s|) . #5#) (LETT |rels2| NIL . #5#)
          (SEQ (LETT |nrela| 1 . #5#) (LETT #4# (LENGTH |rels1|) . #5#)
               (LETT |rela| NIL . #5#) (LETT #3# |rels1| . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |rela| (CAR #3#) . #5#) NIL)
                     (|greater_SI| |nrela| #4#))
                 (GO G191)))
               (SEQ (LETT |include| 'T . #5#)
                    (SEQ (LETT |nrelb| 1 . #5#)
                         (LETT #2# (LENGTH |rels1|) . #5#)
                         (LETT |relb| NIL . #5#) (LETT #1# |rels1| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |relb| (CAR #1#) . #5#) NIL)
                               (|greater_SI| |nrelb| #2#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |nrela| |nrelb| (QREFELT $ 49))
                             (COND
                              ((|GROUPP;relationEquivalent| |rela| |relb| $)
                               (SEQ (LETT |include| NIL . #5#)
                                    (EXIT
                                     (COND
                                      (|trace|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            "TTRemoveDuplicateRelation duplicate found "
                                            (QREFELT $ 44))
                                           (SPADCALL |rela| (QREFELT $ 63))
                                           (QREFELT $ 43))
                                          (SPADCALL "=" (QREFELT $ 44))
                                          (QREFELT $ 43))
                                         (SPADCALL |relb| (QREFELT $ 63))
                                         (QREFELT $ 43))
                                        (QREFELT $ 56))))))))))))
                         (LETT #1#
                               (PROG1 (CDR #1#)
                                 (LETT |nrelb| (|inc_SI| |nrelb|) . #5#))
                               . #5#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      (|include|
                       (LETT |rels2| (SPADCALL |rels2| |rela| (QREFELT $ 26))
                             . #5#)))))
               (LETT #3#
                     (PROG1 (CDR #3#) (LETT |nrela| (|inc_SI| |nrela|) . #5#))
                     . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;TTMinimiseInverses| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels2| (|List| (|List| (|Integer|))))
          (|numNonInverts| #1=(|NonNegativeInteger|)) (|numInverts| #1#)
          (#2=#:G924 NIL) (|ele| NIL) (#3=#:G923 NIL) (|rel| NIL)
          (|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))))
         (SEQ (LETT |gens1| (QCAR |s|) . #4=(|GROUPP;TTMinimiseInverses|))
              (LETT |rels1| (QCDR |s|) . #4#) (LETT |rels2| NIL . #4#)
              (SEQ (LETT |rel| NIL . #4#) (LETT #3# |rels1| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |numInverts| 0 . #4#)
                        (LETT |numNonInverts| 0 . #4#)
                        (SEQ (LETT |ele| NIL . #4#) (LETT #2# |rel| . #4#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |ele| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((< |ele| 0)
                                 (LETT |numInverts| (+ |numInverts| 1) . #4#))
                                ('T
                                 (LETT |numNonInverts| (+ |numNonInverts| 1)
                                       . #4#)))))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |numInverts| |numNonInverts|
                                     (QREFELT $ 49))
                           (LETT |rels2|
                                 (SPADCALL |rels2|
                                           (|GROUPP;invertRelation| |rel| $)
                                           (QREFELT $ 26))
                                 . #4#))
                          ('T
                           (LETT |rels2|
                                 (SPADCALL |rels2| |rel| (QREFELT $ 26))
                                 . #4#)))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |gens1| |rels2|))))) 

(SDEFUN |GROUPP;generatorOccurrences|
        ((|rel| |List| (|Integer|)) (|gen| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((|res| (|NonNegativeInteger|)) (#1=#:G931 NIL) (|g| NIL))
               (SEQ (LETT |res| 0 . #2=(|GROUPP;generatorOccurrences|))
                    (SEQ (LETT |g| NIL . #2#) (LETT #1# |rel| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |g| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((EQL |g| |gen|) (LETT |res| (+ |res| 1) . #2#)))
                          (EXIT
                           (COND
                            ((SPADCALL |gen| 0 (QREFELT $ 49))
                             (COND
                              ((EQL |g| (- |gen|))
                               (LETT |res| (+ |res| 1) . #2#)))))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |GROUPP;removeRelations|
        ((|rels1| |List| (|List| (|Integer|))) (|val| |NonNegativeInteger|)
         ($ |List| (|List| (|Integer|))))
        (SPROG
         ((|res| (|List| (|List| (|Integer|)))) (#1=#:G937 NIL) (|rel| NIL))
         (SEQ (LETT |res| NIL . #2=(|GROUPP;removeRelations|))
              (SEQ (LETT |rel| NIL . #2#) (LETT #1# |rels1| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rel| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |val| |rel| (QREFELT $ 51)))
                       (COND
                        ((NULL (SPADCALL (- |val|) |rel| (QREFELT $ 51)))
                         (LETT |res| (SPADCALL |res| |rel| (QREFELT $ 26))
                               . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |GROUPP;TTSubstitute| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|rels1| #1=(|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|)))
          (|newRel| (|List| (|Integer|))) (#2=#:G962 NIL) (|x| (|Integer|))
          (|replacement| (|List| (|Integer|))) (|postr| (|List| (|Integer|)))
          (|restr| (|List| #3=(|Integer|))) (|prer| (|List| (|Integer|)))
          (|genInverted| #4=(|Boolean|)) (|found| #4#) (#5=#:G960 NIL)
          (|genToBeRemoved| #6=(|NonNegativeInteger|)) (|n2| #6#)
          (|r2| (|List| (|Integer|))) (|n1| #6#) (|r1| (|List| #3#))
          (|n3| (|NonNegativeInteger|)) (|r3| (|List| (|Integer|)))
          (|indexes| (|List| (|NonNegativeInteger|))) (#7=#:G961 NIL) (|g| NIL)
          (|rs| #1#) (|gs| (|List| (|NonNegativeInteger|))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |gs| (SPADCALL (QCAR |s|) (QREFELT $ 17))
                  . #8=(|GROUPP;TTSubstitute|))
            (LETT |rs| (QCDR |s|) . #8#) (LETT |r1| NIL . #8#)
            (LETT |r2| NIL . #8#) (LETT |n1| 0 . #8#) (LETT |n2| 0 . #8#)
            (LETT |genToBeRemoved| 0 . #8#)
            (SEQ (LETT |g| NIL . #8#) (LETT #7# |gs| . #8#) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |g| (CAR #7#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |indexes| (|GROUPP;indexesOfRelUsingGen| |s| |g| $)
                        . #8#)
                  (EXIT
                   (COND
                    ((EQL (SPADCALL |indexes| (QREFELT $ 64)) 2)
                     (COND
                      ((EQL |genToBeRemoved| 0)
                       (SEQ (LETT |genToBeRemoved| |g| . #8#)
                            (LETT |r1|
                                  (SPADCALL |rs|
                                            (SPADCALL |indexes| 1
                                                      (QREFELT $ 65))
                                            (QREFELT $ 66))
                                  . #8#)
                            (LETT |r2|
                                  (SPADCALL |rs|
                                            (SPADCALL |indexes| 2
                                                      (QREFELT $ 65))
                                            (QREFELT $ 66))
                                  . #8#)
                            (LETT |n1|
                                  (|GROUPP;generatorOccurrences| |r1| |g| $)
                                  . #8#)
                            (LETT |n2|
                                  (|GROUPP;generatorOccurrences| |r2| |g| $)
                                  . #8#)
                            (COND
                             ((SPADCALL |n1| 1 (QREFELT $ 60))
                              (SEQ (LETT |r3| |r1| . #8#)
                                   (LETT |n3| |n1| . #8#)
                                   (LETT |r1| |r2| . #8#)
                                   (LETT |n1| |n2| . #8#)
                                   (LETT |r2| |r3| . #8#)
                                   (EXIT (LETT |n2| |n3| . #8#)))))
                            (EXIT
                             (COND
                              ((SPADCALL |n1| 1 (QREFELT $ 60))
                               (LETT |genToBeRemoved| 0 . #8#)))))))))))
                 (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |n1| 1 (QREFELT $ 60))
              (PROGN (LETT #5# |s| . #8#) (GO #9=#:G959))))
            (COND
             (|trace|
              (SEQ
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL "simplify: TTSubstitute (" (QREFELT $ 44))
                           (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
                 (SPADCALL ")" (QREFELT $ 44)) (QREFELT $ 43))
                (QREFELT $ 56))
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL "genToBeRemoved=" (QREFELT $ 44))
                              (|GROUPP;outputGen| |genToBeRemoved| $)
                              (QREFELT $ 43))
                    (SPADCALL " r1=" (QREFELT $ 44)) (QREFELT $ 43))
                   (|GROUPP;outputRel| |r1| $) (QREFELT $ 43))
                  (SPADCALL " r2=" (QREFELT $ 44)) (QREFELT $ 43))
                 (|GROUPP;outputRel| |r2| $) (QREFELT $ 43))
                (QREFELT $ 56))
               (EXIT
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL "n1=" (QREFELT $ 44))
                             (SPADCALL |n1| (QREFELT $ 68)) (QREFELT $ 43))
                   (SPADCALL " n2=" (QREFELT $ 44)) (QREFELT $ 43))
                  (SPADCALL |n2| (QREFELT $ 68)) (QREFELT $ 43))
                 (QREFELT $ 56))))))
            (LETT |restr| |r1| . #8#) (LETT |prer| NIL . #8#)
            (LETT |found| NIL . #8#) (LETT |genInverted| NIL . #8#)
            (SEQ G190
                 (COND ((NULL (NULL (OR (NULL |restr|) |found|))) (GO G191)))
                 (SEQ (LETT |x| (|SPADfirst| |restr|) . #8#)
                      (LETT |restr| (CDR |restr|) . #8#)
                      (EXIT
                       (COND
                        ((OR (EQL |x| |genToBeRemoved|)
                             (EQL |x| (- |genToBeRemoved|)))
                         (SEQ (LETT |found| 'T . #8#)
                              (EXIT
                               (COND
                                ((< |x| 0) (LETT |genInverted| 'T . #8#))))))
                        ('T
                         (LETT |prer| (SPADCALL |prer| |x| (QREFELT $ 25))
                               . #8#)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |postr| NIL . #8#)
            (SEQ G190 (COND ((NULL (NULL (NULL |restr|))) (GO G191)))
                 (SEQ (LETT |x| (|SPADfirst| |restr|) . #8#)
                      (LETT |restr| (CDR |restr|) . #8#)
                      (EXIT
                       (LETT |postr| (SPADCALL |postr| |x| (QREFELT $ 25))
                             . #8#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |replacement|
                  (SPADCALL (|GROUPP;invertRelation| |prer| $)
                            (|GROUPP;invertRelation| |postr| $) (QREFELT $ 69))
                  . #8#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL "we will substitute " (QREFELT $ 44))
                             (|GROUPP;outputRel| |replacement| $)
                             (QREFELT $ 43))
                   (SPADCALL " for " (QREFELT $ 44)) (QREFELT $ 43))
                  (|GROUPP;outputGen| |genToBeRemoved| $) (QREFELT $ 43))
                 (SPADCALL " in " (QREFELT $ 44)) (QREFELT $ 43))
                (|GROUPP;outputRel| |r2| $) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |newRel| NIL . #8#)
            (SEQ (LETT |x| NIL . #8#) (LETT #2# |r2| . #8#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQL (ABS |x|) (ABS |genToBeRemoved|))
                     (COND
                      (|genInverted|
                       (LETT |newRel|
                             (SPADCALL |newRel|
                                       (|GROUPP;invertRelation| |replacement|
                                        $)
                                       (QREFELT $ 69))
                             . #8#))
                      ('T
                       (LETT |newRel|
                             (SPADCALL |newRel| |replacement| (QREFELT $ 69))
                             . #8#))))
                    ('T
                     (LETT |newRel| (SPADCALL |newRel| |x| (QREFELT $ 25))
                           . #8#)))))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "newRel=" (QREFELT $ 44))
                         (|GROUPP;outputRel| |newRel| $) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |gens1| (QCAR |s|) . #8#) (LETT |rels1| (QCDR |s|) . #8#)
            (LETT |gens1| (|GROUPP;removeGen| |gens1| |genToBeRemoved| $)
                  . #8#)
            (LETT |rels1| (|GROUPP;removeRelations| |rels1| |genToBeRemoved| $)
                  . #8#)
            (LETT |rels1| (SPADCALL |rels1| |newRel| (QREFELT $ 26)) . #8#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL "gens=" (QREFELT $ 44))
                           (|GROUPP;outputGenList|
                            (SPADCALL |gens1| (QREFELT $ 17)) $)
                           (QREFELT $ 43))
                 (SPADCALL " rels=" (QREFELT $ 44)) (QREFELT $ 43))
                (|GROUPP;outputRelList| |rels1| $) (QREFELT $ 43))
               (QREFELT $ 56))))
            (EXIT (CONS |gens1| |rels1|))))
          #9# (EXIT #5#)))) 

(SDEFUN |GROUPP;isSimpler?| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G969 NIL) (|relationCompleityB| #2=(|NonNegativeInteger|))
          (#3=#:G971 NIL) (|rel| NIL) (|relationCompleityA| #2#)
          (#4=#:G970 NIL) (|relsb| #5=(|List| (|List| (|Integer|))))
          (|gensb| #6=(|PrimitiveArray| (|NonNegativeInteger|))) (|relsa| #5#)
          (|gensa| #6#))
         (SEQ
          (EXIT
           (SEQ (LETT |gensa| (QCAR |a|) . #7=(|GROUPP;isSimpler?|))
                (LETT |relsa| (QCDR |a|) . #7#) (LETT |gensb| (QCAR |b|) . #7#)
                (LETT |relsb| (QCDR |b|) . #7#)
                (COND
                 ((< (SPADCALL |gensa| (QREFELT $ 19))
                     (SPADCALL |gensb| (QREFELT $ 19)))
                  (PROGN (LETT #1# 'T . #7#) (GO #8=#:G968))))
                (COND
                 ((< (LENGTH |relsa|) (LENGTH |relsb|))
                  (PROGN (LETT #1# 'T . #7#) (GO #8#))))
                (LETT |relationCompleityA| 0 . #7#)
                (SEQ (LETT |rel| NIL . #7#) (LETT #4# |relsa| . #7#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |rel| (CAR #4#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationCompleityA|
                             (+ |relationCompleityA| (LENGTH |rel|)) . #7#)))
                     (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                (LETT |relationCompleityB| 0 . #7#)
                (SEQ (LETT |rel| NIL . #7#) (LETT #3# |relsb| . #7#) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |rel| (CAR #3#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |relationCompleityB|
                             (+ |relationCompleityB| (LENGTH |rel|)) . #7#)))
                     (LETT #3# (CDR #3#) . #7#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((< |relationCompleityA| |relationCompleityB|)
                  (PROGN (LETT #1# 'T . #7#) (GO #8#))))
                (EXIT NIL)))
          #8# (EXIT #1#)))) 

(SDEFUN |GROUPP;simplify;2$;29| ((|s| $) ($ $))
        (SPADCALL |s| NIL (QREFELT $ 70))) 

(SDEFUN |GROUPP;simplify;$B$;30| ((|s| $) (|trace| |Boolean|) ($ $))
        (SPROG
         ((|lastpass| ($)) (|level| #1=(|NonNegativeInteger|)) (#2=#:G979 NIL)
          (|res| ($)) (|loopBreaker| #1#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL "simplify(" (QREFELT $ 44))
                          (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
                (SPADCALL ")" (QREFELT $ 44)) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |res| |s| . #3=(|GROUPP;simplify;$B$;30|))
            (LETT |lastpass| |s| . #3#) (LETT |level| 0 . #3#)
            (LETT |loopBreaker| 0 . #3#)
            (SEQ G190 (COND ((NULL (< |loopBreaker| 10000)) (GO G191)))
                 (SEQ (LETT |loopBreaker| (+ |loopBreaker| 1) . #3#)
                      (COND
                       ((EQL |level| 0)
                        (LETT |res| (|GROUPP;TTRemoveEmpty| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 1)
                        (LETT |res| (|GROUPP;TTRemoveZero| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 2)
                        (LETT |res|
                              (|GROUPP;TTRemoveGeneratorIfIdentity| |res|
                               |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 3)
                        (LETT |res|
                              (|GROUPP;TTRenameGenerator| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 4)
                        (LETT |res|
                              (|GROUPP;TTRemoveEleTimesInverse| |res| |trace|
                               $)
                              . #3#)))
                      (COND
                       ((EQL |level| 5)
                        (LETT |res|
                              (|GROUPP;TTRemoveDuplicateRelation| |res| |trace|
                               $)
                              . #3#)))
                      (COND
                       ((EQL |level| 6)
                        (LETT |res| (|GROUPP;TTSubstitute| |res| |trace| $)
                              . #3#)))
                      (COND
                       ((EQL |level| 7)
                        (PROGN
                         (LETT #2#
                               (|GROUPP;TTMinimiseInverses| |res| |trace| $)
                               . #3#)
                         (GO #4=#:G978))))
                      (COND
                       ((|GROUPP;isSimpler?| |res| |lastpass| $)
                        (LETT |level| 0 . #3#))
                       ('T (LETT |level| (+ |level| 1) . #3#)))
                      (COND
                       (|trace|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL " level=" (QREFELT $ 44))
                                       (SPADCALL |level| (QREFELT $ 68))
                                       (QREFELT $ 43))
                             (SPADCALL " loop=" (QREFELT $ 44)) (QREFELT $ 43))
                            (SPADCALL |loopBreaker| (QREFELT $ 68))
                            (QREFELT $ 43))
                           (SPADCALL " res=" (QREFELT $ 44)) (QREFELT $ 43))
                          (SPADCALL |res| (QREFELT $ 67)) (QREFELT $ 43))
                         (QREFELT $ 56))))
                      (EXIT (LETT |lastpass| |res| . #3#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (SPADCALL
             (SPADCALL
              (SPADCALL "simplify excessive time - loop suspected"
                        (QREFELT $ 44))
              (SPADCALL |s| (QREFELT $ 67)) (QREFELT $ 43))
             (QREFELT $ 56))
            (EXIT |res|)))
          #4# (EXIT #2#)))) 

(SDEFUN |GROUPP;offsetIndexes| ((|a| $) (|offset| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|rb| (|List| (|List| (|Integer|)))) (#1=#:G990 NIL) (|y| NIL)
          (#2=#:G989 NIL) (#3=#:G988 NIL) (|z| NIL) (#4=#:G987 NIL)
          (|gb| (|List| (|NonNegativeInteger|))) (#5=#:G986 NIL) (|x| NIL)
          (#6=#:G985 NIL) (|ra| (|List| (|List| (|Integer|))))
          (|ga| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |ga| (SPADCALL (QCAR |a|) (QREFELT $ 17))
                . #7=(|GROUPP;offsetIndexes|))
          (LETT |ra| (QCDR |a|) . #7#)
          (LETT |gb|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |x| NIL . #7#) (LETT #5# |ga| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS (+ |x| |offset|) #6#) . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |rb|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |z| NIL . #7#) (LETT #3# |ra| . #7#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |z| (CAR #3#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #7#)
                                (SEQ (LETT |y| NIL . #7#) (LETT #1# |z| . #7#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |y| (CAR #1#) . #7#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (COND
                                               ((SPADCALL |y| 0 (QREFELT $ 41))
                                                (+ |y| |offset|))
                                               ('T (- |y| |offset|)))
                                              #2#)
                                             . #7#)))
                                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#)
                              . #7#)))
                      (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (EXIT (SPADCALL |gb| |rb| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;quotient;$L$;32|
        ((|a| $) (|remgen| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|PrimitiveArray| (|NonNegativeInteger|))) (#1=#:G995 NIL)
          (|toBeRemoved| NIL))
         (SEQ (LETT |gens1| (QCAR |a|) . #2=(|GROUPP;quotient;$L$;32|))
              (LETT |rels1| (QCDR |a|) . #2#)
              (SEQ (LETT |toBeRemoved| NIL . #2#) (LETT #1# |remgen| . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#)
                         (PROGN (LETT |toBeRemoved| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |gens1| (|GROUPP;removeGen| |gens1| |toBeRemoved| $)
                          . #2#)
                    (EXIT
                     (LETT |rels1|
                           (|GROUPP;removeGen2| |rels1| |toBeRemoved| $)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |gens1| (QREFELT $ 17)) |rels1|
                          (QREFELT $ 11))
                (QREFELT $ 71)))))) 

(SDEFUN |GROUPP;quotient;$L$;33|
        ((|a| $) (|addrel| |List| (|List| (|Integer|))) ($ $))
        (SPROG
         ((|rels1| (|List| (|List| (|Integer|))))
          (|gens1| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |gens1| (SPADCALL (QCAR |a|) (QREFELT $ 17))
                . #1=(|GROUPP;quotient;$L$;33|))
          (LETT |rels1| (QCDR |a|) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |gens1| (QREFELT $ 73))
                      (SPADCALL |rels1| |addrel| (QREFELT $ 74))
                      (QREFELT $ 11))
            (QREFELT $ 71)))))) 

(SDEFUN |GROUPP;directProduct;3$;34| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|rc| (|List| (|List| (|Integer|)))) (|gcx| (|List| (|Integer|)))
          (#1=#:G1004 NIL) (|gbx| NIL) (#2=#:G1003 NIL) (|gax| NIL)
          (|rb| #3=(|List| (|List| (|Integer|))))
          (|gb| #4=(|List| (|NonNegativeInteger|))) (|b2| ($))
          (|sa| (|NonNegativeInteger|)) (|ra| #3#) (|ga| #4#) (|a2| ($)))
         (SEQ
          (LETT |a2| (SPADCALL |a| (QREFELT $ 27))
                . #5=(|GROUPP;directProduct;3$;34|))
          (LETT |ga| (SPADCALL (QCAR |a2|) (QREFELT $ 17)) . #5#)
          (LETT |ra| (QCDR |a2|) . #5#)
          (LETT |sa| (SPADCALL |ga| (QREFELT $ 64)) . #5#)
          (LETT |b2|
                (|GROUPP;offsetIndexes| (SPADCALL |b| (QREFELT $ 27)) |sa| $)
                . #5#)
          (LETT |gb| (SPADCALL (QCAR |b2|) (QREFELT $ 17)) . #5#)
          (LETT |rb| (QCDR |b2|) . #5#) (LETT |rc| NIL . #5#)
          (SEQ (LETT |gax| NIL . #5#) (LETT #2# |ga| . #5#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |gax| (CAR #2#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |gbx| NIL . #5#) (LETT #1# |gb| . #5#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |gbx| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ (LETT |gcx| (LIST |gax| |gbx| |gax| |gbx|) . #5#)
                           (EXIT
                            (LETT |rc| (SPADCALL |rc| |gcx| (QREFELT $ 26))
                                  . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |ga| (QREFELT $ 73)) |gb| (QREFELT $ 76))
            (SPADCALL (LIST |ra| |rb| |rc|) (QREFELT $ 77)) (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;cyclicGroup;Pi$;35| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((|ra| (|List| (|List| (|Integer|)))) (#1=#:G1009 NIL) (|x| NIL)
          (#2=#:G1008 NIL) (|ga| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |ga| (LIST 1) . #3=(|GROUPP;cyclicGroup;Pi$;35|))
              (LETT |ra|
                    (LIST
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |x| 1 . #3#) (LETT #1# |n| . #3#) G190
                           (COND ((|greater_SI| |x| #1#) (GO G191)))
                           (SEQ (EXIT (LETT #2# (CONS 1 #2#) . #3#)))
                           (LETT |x| (|inc_SI| |x|) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#)))))
                    . #3#)
              (EXIT (SPADCALL |ga| |ra| (QREFELT $ 11)))))) 

(SDEFUN |GROUPP;dihedralGroup;Pi$;36| ((|n| |PositiveInteger|) ($ $))
        (SPROG ((|c2| ($)) (|c1| ($)))
               (SEQ
                (LETT |c1| (SPADCALL |n| (QREFELT $ 80))
                      . #1=(|GROUPP;dihedralGroup;Pi$;36|))
                (LETT |c2| (SPADCALL 2 (QREFELT $ 80)) . #1#)
                (EXIT (SPADCALL |c1| |c2| (QREFELT $ 78)))))) 

(SDEFUN |GROUPP;symmetricGroup;Pi$;37| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((|r| (|List| (|List| (|Integer|)))) (|y| (|List| (|Integer|)))
          (#1=#:G1028 NIL) (|b| NIL) (#2=#:G1027 NIL) (|a| NIL)
          (|ga| (|List| (|NonNegativeInteger|))) (#3=#:G1026 NIL) (|x| NIL)
          (#4=#:G1025 NIL) (|m| (|PositiveInteger|)) (#5=#:G1012 NIL)
          (#6=#:G1024 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |n| 2)
              (PROGN
               (LETT #6# (SPADCALL NIL (QREFELT $ 12))
                     . #7=(|GROUPP;symmetricGroup;Pi$;37|))
               (GO #8=#:G1023))))
            (LETT |m|
                  (PROG1 (LETT #5# (- |n| 1) . #7#)
                    (|check_subtype2| (> #5# 0) '(|PositiveInteger|)
                                      '(|Integer|) #5#))
                  . #7#)
            (LETT |ga|
                  (PROGN
                   (LETT #4# NIL . #7#)
                   (SEQ (LETT |x| 1 . #7#) (LETT #3# |m| . #7#) G190
                        (COND ((|greater_SI| |x| #3#) (GO G191)))
                        (SEQ (EXIT (LETT #4# (CONS |x| #4#) . #7#)))
                        (LETT |x| (|inc_SI| |x|) . #7#) (GO G190) G191
                        (EXIT (NREVERSE #4#))))
                  . #7#)
            (LETT |r| NIL . #7#)
            (SEQ (LETT |a| 1 . #7#) (LETT #2# |m| . #7#) G190
                 (COND ((|greater_SI| |a| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |b| 1 . #7#) (LETT #1# |m| . #7#) G190
                        (COND ((|greater_SI| |b| #1#) (GO G191)))
                        (SEQ
                         (COND
                          ((EQL |a| |b|)
                           (SEQ (LETT |y| (LIST |a| |a|) . #7#)
                                (EXIT (LETT |r| (CONS |y| |r|) . #7#)))))
                         (COND
                          ((< (+ |a| 1) |b|)
                           (SEQ (LETT |y| (LIST |a| |b| (- |a|) (- |b|)) . #7#)
                                (EXIT (LETT |r| (CONS |y| |r|) . #7#)))))
                         (EXIT
                          (COND
                           ((EQL (+ |a| 1) |b|)
                            (SEQ
                             (LETT |y| (LIST |a| |b| |a| |b| |a| |b|) . #7#)
                             (EXIT (LETT |r| (CONS |y| |r|) . #7#)))))))
                        (LETT |b| (|inc_SI| |b|) . #7#) (GO G190) G191
                        (EXIT NIL))))
                 (LETT |a| (|inc_SI| |a|) . #7#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |ga| (NREVERSE |r|) (QREFELT $ 11)))))
          #8# (EXIT #6#)))) 

(SDEFUN |GROUPP;outCosetTable|
        ((|ct| |TwoDimensionalArray| (|NonNegativeInteger|))
         (|np| . #1=(|NonNegativeInteger|)) ($ |OutputForm|))
        (SPROG
         ((|cts| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|part2| (|NonNegativeInteger|)) (#2=#:G1030 NIL) (|part1| #1#)
          (#3=#:G1036 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |np| 1)
              (PROGN
               (LETT #3# (SPADCALL |ct| (QREFELT $ 84))
                     . #4=(|GROUPP;outCosetTable|))
               (GO #5=#:G1035))))
            (COND
             ((SPADCALL (SPADCALL |ct| (QREFELT $ 85)) |np| (QREFELT $ 49))
              (SEQ (LETT |part1| |np| . #4#)
                   (LETT |part2|
                         (PROG2
                             (LETT #2#
                                   (SPADCALL (SPADCALL |ct| (QREFELT $ 85))
                                             |np| (QREFELT $ 87))
                                   . #4#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|NonNegativeInteger|)
                                           (|Union| (|NonNegativeInteger|)
                                                    "failed")
                                           #2#))
                         . #4#)
                   (LETT |cts|
                         (SPADCALL |ct| (LIST |part1| |part2|) (QREFELT $ 88))
                         . #4#)
                   (EXIT
                    (LETT |ct| (SPADCALL |cts| 1 (QREFELT $ 90)) . #4#)))))
            (EXIT (SPADCALL |ct| (QREFELT $ 84)))))
          #5# (EXIT #3#)))) 

(SDEFUN |GROUPP;outStatus|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| (|NonNegativeInteger|))
          (|:| |number_of_indices| #2=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         ($ |OutputForm|))
        (SPROG ((|np| #2#) (|ct| #1#))
               (SEQ (LETT |ct| (QVELT |state| 0) . #3=(|GROUPP;outStatus|))
                    (LETT |np| (QVELT |state| 5) . #3#)
                    (EXIT (|GROUPP;outCosetTable| |ct| |np| $))))) 

(SDEFUN |GROUPP;find|
        ((|et| |OneDimensionalArray| (|NonNegativeInteger|))
         (|ind| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|nj| (|NonNegativeInteger|))
          (|pj| (|NonNegativeInteger|)))
         (SEQ
          (COND ((OR (EQL |ind| 0) (EQL (QAREF1O |et| |ind| 1) |ind|)) |ind|)
                ('T
                 (SEQ (LETT |j| |ind| . #1=(|GROUPP;find|)) (LETT |pj| 0 . #1#)
                      (SEQ G190 (COND ((NULL (NULL (EQL |j| |pj|))) (GO G191)))
                           (SEQ (LETT |pj| |j| . #1#)
                                (EXIT (LETT |j| (QAREF1O |et| |j| 1) . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |j| |ind| . #1#)
                      (SEQ G190 (COND ((NULL (NULL (EQL |j| |pj|))) (GO G191)))
                           (SEQ (LETT |nj| (QAREF1O |et| |j| 1) . #1#)
                                (QSETAREF1O |et| |j| |pj| 1)
                                (EXIT (LETT |j| |nj| . #1#)))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |pj|))))))) 

(SDEFUN |GROUPP;infer_coincidencies|
        ((|ct| |TwoDimensionalArray| (|NonNegativeInteger|))
         (|et| |OneDimensionalArray| (|NonNegativeInteger|))
         (|pb| . #1=(|NonNegativeInteger|)) (|pe| . #2=(|NonNegativeInteger|))
         (|trace| |Boolean|) ($ |Void|))
        (SPROG
         ((|i2| #3=(|NonNegativeInteger|)) (|i1| #3#) (#4=#:G1057 NIL)
          (|i| NIL) (#5=#:G1056 NIL) (|nn| (|Integer|)) (|#G135| #1#)
          (|#G134| #2#))
         (SEQ
          (COND
           (|trace|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL "coincidence: begin=" (QREFELT $ 44))
                         (SPADCALL |pb| (QREFELT $ 68)) (QREFELT $ 43))
               (SPADCALL " end=" (QREFELT $ 44)) (QREFELT $ 43))
              (SPADCALL |pe| (QREFELT $ 68)) (QREFELT $ 43))
             (QREFELT $ 56))))
          (COND
           ((< |pe| |pb|)
            (PROGN
             (LETT |#G134| |pe| . #6=(|GROUPP;infer_coincidencies|))
             (LETT |#G135| |pb| . #6#)
             (LETT |pb| |#G134| . #6#)
             (LETT |pe| |#G135| . #6#))))
          (QSETAREF1O |et| |pe| |pb| 1)
          (LETT |nn| (SPADCALL |ct| (QREFELT $ 91)) . #6#)
          (SEQ (LETT |i| 1 . #6#) (LETT #5# |nn| . #6#) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ (LETT |i1| (QAREF2O |ct| |pb| |i| 1 1) . #6#)
                    (LETT |i2| (QAREF2O |ct| |pe| |i| 1 1) . #6#)
                    (EXIT
                     (COND ((EQL |i2| 0) "skip")
                           ((EQL |i1| 0)
                            (QSETAREF2O |ct| |pb| |i| |i2| 1 1)))))
               (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SEQ (LETT |i| 1 . #6#) (LETT #4# |nn| . #6#) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ (LETT |i1| (QAREF2O |ct| |pb| |i| 1 1) . #6#)
                     (EXIT
                      (COND ((EQL |i1| 0) "skip")
                            ('T
                             (SEQ (LETT |i2| (QAREF2O |ct| |pe| |i| 1 1) . #6#)
                                  (EXIT
                                   (COND ((EQL |i2| 0) "skip")
                                         ('T
                                          (SEQ
                                           (LETT |i1|
                                                 (|GROUPP;find| |et| |i1| $)
                                                 . #6#)
                                           (LETT |i2|
                                                 (|GROUPP;find| |et| |i2| $)
                                                 . #6#)
                                           (EXIT
                                            (COND ((EQL |i1| |i2|) "skip")
                                                  ('T
                                                   (|GROUPP;infer_coincidencies|
                                                    |ct| |et| |i1| |i2| |trace|
                                                    $)))))))))))))
                (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |GROUPP;inferFromRelations|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table|
               #3=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| (|NonNegativeInteger|))
          (|:| |number_of_indices| #4=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         (|rels| |List| #5=(|List| (|NonNegativeInteger|)))
         (|rrels| |List| (|List| (|NonNegativeInteger|)))
         (|rel_lens| |List| (|NonNegativeInteger|)) (|trace| |Boolean|)
         ($ |Boolean|))
        (SPROG
         ((#6=#:G1100 NIL) (|npb| #7=(|NonNegativeInteger|)) (|npe| #7#)
          (|genIn| (|Integer|)) (|pb| #8=(|NonNegativeInteger|))
          (|gb| #9=(|NonNegativeInteger|)) (|gap| (|Integer|))
          (|add_gen| (|Integer|)) (|n_ind| #4#) (|o_size| (|Integer|))
          (|et| #2#) (|ct| #1#) (#10=#:G1116 NIL) (|i| #8#) (#11=#:G1115 NIL)
          (|j| NIL) (#12=#:G1114 NIL)
          (|net| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|nct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|n_ct_cols| (|Integer|)) (|n_size| (|NonNegativeInteger|))
          (#13=#:G1104 NIL) (|prel| #5#) (|add_to| #9#) (#14=#:G1113 NIL)
          (#15=#:G1112 NIL) (#16=#:G1111 NIL) (#17=#:G1110 NIL) (|pe| #8#)
          (|ge| #9#) (#18=#:G1101 NIL) (|genInv| (|Integer|)) (#19=#:G1109 NIL)
          (|genIndex| NIL) (#20=#:G1102 NIL) (#21=#:G1108 NIL)
          (#22=#:G1105 NIL) (|rel| NIL) (#23=#:G1106 NIL) (|rrel| NIL)
          (#24=#:G1107 NIL) (|r_len| NIL) (#25=#:G1103 NIL)
          (|closed| (|Boolean|)) (|pn| #8#) (|add_gap| (|Integer|))
          (|inv_tab| #3#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ct| (QVELT |state| 0) . #26=(|GROUPP;inferFromRelations|))
            (LETT |et| (QVELT |state| 1) . #26#)
            (LETT |n_ind| (QVELT |state| 5) . #26#)
            (LETT |inv_tab| (QVELT |state| 2) . #26#)
            (COND
             (|trace|
              (SPADCALL
               (SPADCALL (SPADCALL "inferFromRelations rels=" (QREFELT $ 44))
                         (SPADCALL |rels| (QREFELT $ 93)) (QREFELT $ 43))
               (QREFELT $ 56))))
            (LETT |add_to| 0 . #26#) (LETT |add_gen| 0 . #26#)
            (LETT |add_gap| 0 . #26#)
            (LETT |pn| (+ (QVELT |state| 3) 1) . #26#)
            (EXIT
             (COND ((SPADCALL |pn| |n_ind| (QREFELT $ 49)) NIL)
                   ('T
                    (SEQ (QSETVELT |state| 3 |pn|)
                         (COND
                          ((NULL (EQL (QAREF1O |et| |pn| 1) |pn|)) (EXIT 'T)))
                         (LETT |o_size| (SPADCALL |ct| (QREFELT $ 94)) . #26#)
                         (LETT |closed| NIL . #26#)
                         (SEQ
                          (EXIT
                           (SEQ G190 (COND ((NULL (NULL |closed|)) (GO G191)))
                                (SEQ (LETT |closed| 'T . #26#)
                                     (COND
                                      ((NULL (EQL (QAREF1O |et| |pn| 1) |pn|))
                                       (EXIT
                                        (PROGN
                                         (LETT #25# |$NoValue| . #26#)
                                         (GO #27=#:G1096)))))
                                     (SEQ (LETT |r_len| NIL . #26#)
                                          (LETT #24# |rel_lens| . #26#)
                                          (LETT |rrel| NIL . #26#)
                                          (LETT #23# |rrels| . #26#)
                                          (LETT |rel| NIL . #26#)
                                          (LETT #22# |rels| . #26#) G190
                                          (COND
                                           ((OR (ATOM #22#)
                                                (PROGN
                                                 (LETT |rel| (CAR #22#) . #26#)
                                                 NIL)
                                                (ATOM #23#)
                                                (PROGN
                                                 (LETT |rrel| (CAR #23#)
                                                       . #26#)
                                                 NIL)
                                                (ATOM #24#)
                                                (PROGN
                                                 (LETT |r_len| (CAR #24#)
                                                       . #26#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ (LETT |gb| 0 . #26#)
                                               (LETT |pb| |pn| . #26#)
                                               (LETT |i| |pn| . #26#)
                                               (LETT |genIn| 0 . #26#)
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |genIndex| NIL . #26#)
                                                  (LETT #21# |rel| . #26#) G190
                                                  (COND
                                                   ((OR (ATOM #21#)
                                                        (PROGN
                                                         (LETT |genIndex|
                                                               (CAR #21#)
                                                               . #26#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |genIn| |genIndex|
                                                         . #26#)
                                                   (LETT |i|
                                                         (QAREF2O |ct| |i|
                                                                  |genIndex| 1
                                                                  1)
                                                         . #26#)
                                                   (EXIT
                                                    (COND
                                                     ((EQL |i| 0)
                                                      (PROGN
                                                       (LETT #20# |$NoValue|
                                                             . #26#)
                                                       (GO #28=#:G1064)))
                                                     ('T
                                                      (SEQ
                                                       (LETT |i|
                                                             (|GROUPP;find|
                                                              |et| |i| $)
                                                             . #26#)
                                                       (LETT |gb| (+ |gb| 1)
                                                             . #26#)
                                                       (EXIT
                                                        (LETT |pb| |i|
                                                              . #26#)))))))
                                                  (LETT #21# (CDR #21#) . #26#)
                                                  (GO G190) G191 (EXIT NIL)))
                                                #28# (EXIT #20#))
                                               (LETT |gap| (- |r_len| |gb|)
                                                     . #26#)
                                               (LETT |ge| 0 . #26#)
                                               (LETT |pe| |pn| . #26#)
                                               (LETT |i| |pn| . #26#)
                                               (LETT |genInv| 0 . #26#)
                                               (SEQ
                                                (EXIT
                                                 (SEQ
                                                  (LETT |genIndex| NIL . #26#)
                                                  (LETT #19# |rrel| . #26#)
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #19#)
                                                        (PROGN
                                                         (LETT |genIndex|
                                                               (CAR #19#)
                                                               . #26#)
                                                         NIL)
                                                        (NULL (< |ge| |gap|)))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |genInv| |genIndex|
                                                         . #26#)
                                                   (LETT |i|
                                                         (QAREF2O |ct| |i|
                                                                  |genIndex| 1
                                                                  1)
                                                         . #26#)
                                                   (EXIT
                                                    (COND
                                                     ((EQL |i| 0)
                                                      (PROGN
                                                       (LETT #18# |$NoValue|
                                                             . #26#)
                                                       (GO #29=#:G1067)))
                                                     ('T
                                                      (SEQ
                                                       (LETT |i|
                                                             (|GROUPP;find|
                                                              |et| |i| $)
                                                             . #26#)
                                                       (LETT |ge| (+ |ge| 1)
                                                             . #26#)
                                                       (EXIT
                                                        (LETT |pe| |i|
                                                              . #26#)))))))
                                                  (LETT #19# (CDR #19#) . #26#)
                                                  (GO G190) G191 (EXIT NIL)))
                                                #29# (EXIT #18#))
                                               (LETT |gap| (- |gap| |ge|)
                                                     . #26#)
                                               (COND
                                                ((SPADCALL |gap| 1
                                                           (QREFELT $ 41))
                                                 (SEQ
                                                  (LETT |add_to| |pb| . #26#)
                                                  (LETT |add_gen| |genIn|
                                                        . #26#)
                                                  (SEQ
                                                   (COND
                                                    ((>= |n_ind| |o_size|)
                                                     (COND
                                                      ((EQL |n_ind|
                                                            (QVELT |state| 7))
                                                       (PROGN
                                                        (LETT #13# 'T . #26#)
                                                        (GO #30=#:G1099)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |n_size|
                                                              (MIN
                                                               (SPADCALL 2
                                                                         |o_size|
                                                                         (QREFELT
                                                                          $
                                                                          95))
                                                               (QVELT |state|
                                                                      7))
                                                              . #26#)
                                                        (LETT |n_ct_cols|
                                                              (SPADCALL |ct|
                                                                        (QREFELT
                                                                         $ 91))
                                                              . #26#)
                                                        (LETT |nct|
                                                              (SPADCALL
                                                               |n_size|
                                                               |n_ct_cols| 0
                                                               (QREFELT $ 96))
                                                              . #26#)
                                                        (LETT |net|
                                                              (SPADCALL
                                                               |n_size| 0
                                                               (QREFELT $ 98))
                                                              . #26#)
                                                        (SEQ
                                                         (LETT |i| 1 . #26#)
                                                         (LETT #17# |o_size|
                                                               . #26#)
                                                         G190
                                                         (COND
                                                          ((|greater_SI| |i|
                                                                         #17#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (QSETAREF1O |net| |i|
                                                                      (QAREF1O
                                                                       |et| |i|
                                                                       1)
                                                                      1)
                                                          (EXIT
                                                           (SEQ
                                                            (LETT |j| 1 . #26#)
                                                            (LETT #16#
                                                                  |n_ct_cols|
                                                                  . #26#)
                                                            G190
                                                            (COND
                                                             ((|greater_SI| |j|
                                                                            #16#)
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (QSETAREF2O |nct|
                                                                          |i|
                                                                          |j|
                                                                          (QAREF2O
                                                                           |ct|
                                                                           |i|
                                                                           |j|
                                                                           1 1)
                                                                          1
                                                                          1)))
                                                            (LETT |j|
                                                                  (|inc_SI|
                                                                   |j|)
                                                                  . #26#)
                                                            (GO G190) G191
                                                            (EXIT NIL))))
                                                         (LETT |i|
                                                               (|inc_SI| |i|)
                                                               . #26#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (SEQ
                                                         (LETT |i|
                                                               (+ |o_size| 1)
                                                               . #26#)
                                                         (LETT #15# |n_size|
                                                               . #26#)
                                                         G190
                                                         (COND
                                                          ((> |i| #15#)
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (QSETAREF1O |net|
                                                                       |i| |i|
                                                                       1)))
                                                         (LETT |i| (+ |i| 1)
                                                               . #26#)
                                                         (GO G190) G191
                                                         (EXIT NIL))
                                                        (LETT |ct| |nct|
                                                              . #26#)
                                                        (LETT |et| |net|
                                                              . #26#)
                                                        (LETT |o_size| |n_size|
                                                              . #26#)
                                                        (QSETVELT |state| 0
                                                                  |ct|)
                                                        (EXIT
                                                         (QSETVELT |state| 1
                                                                   |et|)))))))
                                                   (LETT |n_ind| (+ |n_ind| 1)
                                                         . #26#)
                                                   (COND
                                                    (|trace|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            #31="adding action of "
                                                            (QREFELT $ 44))
                                                           (SPADCALL |add_gen|
                                                                     (QREFELT $
                                                                              99))
                                                           (QREFELT $ 43))
                                                          (SPADCALL #32=" on "
                                                                    (QREFELT $
                                                                             44))
                                                          (QREFELT $ 43))
                                                         (SPADCALL |add_to|
                                                                   (QREFELT $
                                                                            68))
                                                         (QREFELT $ 43))
                                                        (SPADCALL #33=" to be "
                                                                  (QREFELT $
                                                                           44))
                                                        (QREFELT $ 43))
                                                       (SPADCALL |n_ind|
                                                                 (QREFELT $
                                                                          68))
                                                       (QREFELT $ 43))
                                                      (QREFELT $ 56))))
                                                   (QSETAREF2O |ct| |add_to|
                                                               |add_gen|
                                                               |n_ind| 1 1)
                                                   (LETT |add_gen|
                                                         (SPADCALL |inv_tab|
                                                                   |add_gen|
                                                                   (QREFELT $
                                                                            100))
                                                         . #26#)
                                                   (QSETAREF2O |ct| |n_ind|
                                                               |add_gen|
                                                               |add_to| 1 1)
                                                   (COND
                                                    (|trace|
                                                     (SPADCALL
                                                      (|GROUPP;outStatus|
                                                       |state| $)
                                                      (QREFELT $ 56))))
                                                   (EXIT
                                                    (QSETVELT |state| 5
                                                              |n_ind|)))
                                                  (LETT |gap| (- |gap| 1)
                                                        . #26#)
                                                  (LETT |prel| |rel| . #26#)
                                                  (SEQ (LETT |i| 0 . #26#)
                                                       (LETT #14# |gb| . #26#)
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |i|
                                                                       #14#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT |prel|
                                                               (CDR |prel|)
                                                               . #26#)))
                                                       (LETT |i| (|inc_SI| |i|)
                                                             . #26#)
                                                       (GO G190) G191
                                                       (EXIT NIL))
                                                  (LETT |gb| (+ |gb| 1) . #26#)
                                                  (SEQ G190
                                                       (COND
                                                        ((NULL
                                                          (SPADCALL |gap| 1
                                                                    (QREFELT $
                                                                             41)))
                                                         (GO G191)))
                                                       (SEQ
                                                        (LETT |add_to| |n_ind|
                                                              . #26#)
                                                        (LETT |add_gen|
                                                              (|SPADfirst|
                                                               |prel|)
                                                              . #26#)
                                                        (LETT |prel|
                                                              (CDR |prel|)
                                                              . #26#)
                                                        (SEQ
                                                         (COND
                                                          ((>= |n_ind|
                                                               |o_size|)
                                                           (COND
                                                            ((EQL |n_ind|
                                                                  (QVELT
                                                                   |state| 7))
                                                             (PROGN
                                                              (LETT #13# 'T
                                                                    . #26#)
                                                              (GO #30#)))
                                                            ('T
                                                             (SEQ
                                                              (LETT |n_size|
                                                                    (MIN
                                                                     (SPADCALL
                                                                      2
                                                                      |o_size|
                                                                      (QREFELT
                                                                       $ 95))
                                                                     (QVELT
                                                                      |state|
                                                                      7))
                                                                    . #26#)
                                                              (LETT |n_ct_cols|
                                                                    (SPADCALL
                                                                     |ct|
                                                                     (QREFELT $
                                                                              91))
                                                                    . #26#)
                                                              (LETT |nct|
                                                                    (SPADCALL
                                                                     |n_size|
                                                                     |n_ct_cols|
                                                                     0
                                                                     (QREFELT $
                                                                              96))
                                                                    . #26#)
                                                              (LETT |net|
                                                                    (SPADCALL
                                                                     |n_size| 0
                                                                     (QREFELT $
                                                                              98))
                                                                    . #26#)
                                                              (SEQ
                                                               (LETT |i| 1
                                                                     . #26#)
                                                               (LETT #12#
                                                                     |o_size|
                                                                     . #26#)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |i| #12#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (QSETAREF1O
                                                                 |net| |i|
                                                                 (QAREF1O |et|
                                                                          |i|
                                                                          1)
                                                                 1)
                                                                (EXIT
                                                                 (SEQ
                                                                  (LETT |j| 1
                                                                        . #26#)
                                                                  (LETT #11#
                                                                        |n_ct_cols|
                                                                        . #26#)
                                                                  G190
                                                                  (COND
                                                                   ((|greater_SI|
                                                                     |j| #11#)
                                                                    (GO G191)))
                                                                  (SEQ
                                                                   (EXIT
                                                                    (QSETAREF2O
                                                                     |nct| |i|
                                                                     |j|
                                                                     (QAREF2O
                                                                      |ct| |i|
                                                                      |j| 1 1)
                                                                     1 1)))
                                                                  (LETT |j|
                                                                        (|inc_SI|
                                                                         |j|)
                                                                        . #26#)
                                                                  (GO G190)
                                                                  G191
                                                                  (EXIT NIL))))
                                                               (LETT |i|
                                                                     (|inc_SI|
                                                                      |i|)
                                                                     . #26#)
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                              (SEQ
                                                               (LETT |i|
                                                                     (+
                                                                      |o_size|
                                                                      1)
                                                                     . #26#)
                                                               (LETT #10#
                                                                     |n_size|
                                                                     . #26#)
                                                               G190
                                                               (COND
                                                                ((> |i| #10#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (QSETAREF1O
                                                                  |net| |i| |i|
                                                                  1)))
                                                               (LETT |i|
                                                                     (+ |i| 1)
                                                                     . #26#)
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                              (LETT |ct| |nct|
                                                                    . #26#)
                                                              (LETT |et| |net|
                                                                    . #26#)
                                                              (LETT |o_size|
                                                                    |n_size|
                                                                    . #26#)
                                                              (QSETVELT |state|
                                                                        0 |ct|)
                                                              (EXIT
                                                               (QSETVELT
                                                                |state| 1
                                                                |et|)))))))
                                                         (LETT |n_ind|
                                                               (+ |n_ind| 1)
                                                               . #26#)
                                                         (COND
                                                          (|trace|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL #31#
                                                                           (QREFELT
                                                                            $
                                                                            44))
                                                                 (SPADCALL
                                                                  |add_gen|
                                                                  (QREFELT $
                                                                           99))
                                                                 (QREFELT $
                                                                          43))
                                                                (SPADCALL #32#
                                                                          (QREFELT
                                                                           $
                                                                           44))
                                                                (QREFELT $ 43))
                                                               (SPADCALL
                                                                |add_to|
                                                                (QREFELT $ 68))
                                                               (QREFELT $ 43))
                                                              (SPADCALL #33#
                                                                        (QREFELT
                                                                         $ 44))
                                                              (QREFELT $ 43))
                                                             (SPADCALL |n_ind|
                                                                       (QREFELT
                                                                        $ 68))
                                                             (QREFELT $ 43))
                                                            (QREFELT $ 56))))
                                                         (QSETAREF2O |ct|
                                                                     |add_to|
                                                                     |add_gen|
                                                                     |n_ind| 1
                                                                     1)
                                                         (LETT |add_gen|
                                                               (SPADCALL
                                                                |inv_tab|
                                                                |add_gen|
                                                                (QREFELT $
                                                                         100))
                                                               . #26#)
                                                         (QSETAREF2O |ct|
                                                                     |n_ind|
                                                                     |add_gen|
                                                                     |add_to| 1
                                                                     1)
                                                         (COND
                                                          (|trace|
                                                           (SPADCALL
                                                            (|GROUPP;outStatus|
                                                             |state| $)
                                                            (QREFELT $ 56))))
                                                         (EXIT
                                                          (QSETVELT |state| 5
                                                                    |n_ind|)))
                                                        (LETT |gap| (- |gap| 1)
                                                              . #26#)
                                                        (EXIT
                                                         (LETT |gb| (+ |gb| 1)
                                                               . #26#)))
                                                       NIL (GO G190) G191
                                                       (EXIT NIL))
                                                  (LETT |pb| |n_ind| . #26#)
                                                  (EXIT
                                                   (LETT |genIn|
                                                         (|SPADfirst| |prel|)
                                                         . #26#)))))
                                               (EXIT
                                                (COND
                                                 ((EQL |gap| 1)
                                                  (SEQ
                                                   (EXIT
                                                    (SEQ
                                                     (SEQ
                                                      (LETT |npe|
                                                            (QAREF2O |ct| |pb|
                                                                     |genIn| 1
                                                                     1)
                                                            . #26#)
                                                      (EXIT
                                                       (COND
                                                        ((NULL (EQL |npe| 0))
                                                         (PROGN
                                                          (LETT #6#
                                                                (COND
                                                                 ((EQL |npe|
                                                                       |pe|)
                                                                  "skip")
                                                                 ('T
                                                                  (SEQ
                                                                   (COND
                                                                    (|trace|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              "coincidence: "
                                                                              (QREFELT
                                                                               $
                                                                               44))
                                                                             (SPADCALL
                                                                              |pe|
                                                                              (QREFELT
                                                                               $
                                                                               68))
                                                                             (QREFELT
                                                                              $
                                                                              43))
                                                                            (SPADCALL
                                                                             " "
                                                                             (QREFELT
                                                                              $
                                                                              44))
                                                                            (QREFELT
                                                                             $
                                                                             43))
                                                                           (SPADCALL
                                                                            |npe|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           (QREFELT
                                                                            $
                                                                            43))
                                                                          (SPADCALL
                                                                           " rel = "
                                                                           (QREFELT
                                                                            $
                                                                            44))
                                                                          (QREFELT
                                                                           $
                                                                           43))
                                                                         (SPADCALL
                                                                          |rel|
                                                                          (QREFELT
                                                                           $
                                                                           101))
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                                        (SPADCALL
                                                                         " pn = "
                                                                         (QREFELT
                                                                          $
                                                                          44))
                                                                        (QREFELT
                                                                         $ 43))
                                                                       (SPADCALL
                                                                        |pn|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (QREFELT
                                                                        $ 43))
                                                                      (QREFELT
                                                                       $ 56))))
                                                                   (EXIT
                                                                    (|GROUPP;infer_coincidencies|
                                                                     |ct| |et|
                                                                     |pe| |npe|
                                                                     |trace|
                                                                     $)))))
                                                                . #26#)
                                                          (GO #34=#:G1091))))))
                                                     (COND
                                                      (|trace|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            "inferFromRelations genIn="
                                                            (QREFELT $ 44))
                                                           (SPADCALL |genIn|
                                                                     (QREFELT $
                                                                              99))
                                                           (QREFELT $ 43))
                                                          (SPADCALL " gb="
                                                                    (QREFELT $
                                                                             44))
                                                          (QREFELT $ 43))
                                                         (SPADCALL |gb|
                                                                   (QREFELT $
                                                                            68))
                                                         (QREFELT $ 43))
                                                        (QREFELT $ 56))))
                                                     (COND
                                                      ((NULL
                                                        (EQL
                                                         (QAREF1O |inv_tab|
                                                                  |genIn| 1)
                                                         |genInv|))
                                                       (EXIT
                                                        (|error|
                                                         "impossible 3"))))
                                                     (QSETAREF2O |ct| |pb|
                                                                 |genIn| |pe| 1
                                                                 1)
                                                     (SEQ
                                                      (LETT |npb|
                                                            (QAREF2O |ct| |pe|
                                                                     |genInv| 1
                                                                     1)
                                                            . #26#)
                                                      (EXIT
                                                       (COND
                                                        ((NULL (EQL |npb| 0))
                                                         (PROGN
                                                          (LETT #6#
                                                                (COND
                                                                 ((EQL |npb|
                                                                       |pb|)
                                                                  "skip")
                                                                 ('T
                                                                  (SEQ
                                                                   (COND
                                                                    (|trace|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              "coincidence: "
                                                                              (QREFELT
                                                                               $
                                                                               44))
                                                                             (SPADCALL
                                                                              |npb|
                                                                              (QREFELT
                                                                               $
                                                                               68))
                                                                             (QREFELT
                                                                              $
                                                                              43))
                                                                            (SPADCALL
                                                                             " "
                                                                             (QREFELT
                                                                              $
                                                                              44))
                                                                            (QREFELT
                                                                             $
                                                                             43))
                                                                           (SPADCALL
                                                                            |pb|
                                                                            (QREFELT
                                                                             $
                                                                             68))
                                                                           (QREFELT
                                                                            $
                                                                            43))
                                                                          (SPADCALL
                                                                           " rel = "
                                                                           (QREFELT
                                                                            $
                                                                            44))
                                                                          (QREFELT
                                                                           $
                                                                           43))
                                                                         (SPADCALL
                                                                          |rel|
                                                                          (QREFELT
                                                                           $
                                                                           101))
                                                                         (QREFELT
                                                                          $
                                                                          43))
                                                                        (SPADCALL
                                                                         " pn = "
                                                                         (QREFELT
                                                                          $
                                                                          44))
                                                                        (QREFELT
                                                                         $ 43))
                                                                       (SPADCALL
                                                                        |pn|
                                                                        (QREFELT
                                                                         $ 68))
                                                                       (QREFELT
                                                                        $ 43))
                                                                      (QREFELT
                                                                       $ 56))))
                                                                   (EXIT
                                                                    (|GROUPP;infer_coincidencies|
                                                                     |ct| |et|
                                                                     |pb| |npb|
                                                                     |trace|
                                                                     $)))))
                                                                . #26#)
                                                          (GO #34#))))))
                                                     (EXIT
                                                      (QSETAREF2O |ct| |pe|
                                                                  |genInv| |pb|
                                                                  1 1))))
                                                   #34# (EXIT #6#)))
                                                 ((EQL |gap| 0)
                                                  (COND
                                                   ((EQL |pb| |pe|) "skip")
                                                   ('T
                                                    (SEQ
                                                     (COND
                                                      (|trace|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL
                                                                "coincidence: "
                                                                (QREFELT $ 44))
                                                               (SPADCALL |pb|
                                                                         (QREFELT
                                                                          $
                                                                          68))
                                                               (QREFELT $ 43))
                                                              (SPADCALL " "
                                                                        (QREFELT
                                                                         $ 44))
                                                              (QREFELT $ 43))
                                                             (SPADCALL |pe|
                                                                       (QREFELT
                                                                        $ 68))
                                                             (QREFELT $ 43))
                                                            (SPADCALL " rel = "
                                                                      (QREFELT
                                                                       $ 44))
                                                            (QREFELT $ 43))
                                                           (SPADCALL |rel|
                                                                     (QREFELT $
                                                                              101))
                                                           (QREFELT $ 43))
                                                          (SPADCALL " pn = "
                                                                    (QREFELT $
                                                                             44))
                                                          (QREFELT $ 43))
                                                         (SPADCALL |pn|
                                                                   (QREFELT $
                                                                            68))
                                                         (QREFELT $ 43))
                                                        (QREFELT $ 56))))
                                                     (EXIT
                                                      (|GROUPP;infer_coincidencies|
                                                       |ct| |et| |pb| |pe|
                                                       |trace| $))))))
                                                 ('T
                                                  (|error| "impossible 4")))))
                                          (LETT #22#
                                                (PROG1 (CDR #22#)
                                                  (LETT #23#
                                                        (PROG1 (CDR #23#)
                                                          (LETT #24# (CDR #24#)
                                                                . #26#))
                                                        . #26#))
                                                . #26#)
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((NULL |closed|)
                                        (|error| "impossible 5")))))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #27# (EXIT #25#))
                         (EXIT 'T)))))))
          #30# (EXIT #13#)))) 

(SDEFUN |GROUPP;invertMap|
        ((|a| |TwoDimensionalArray| (|NonNegativeInteger|))
         ($ |TwoDimensionalArray| (|NonNegativeInteger|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#1=#:G1121 NIL) (|x| NIL)
          (|invm| (|TwoDimensionalArray| (|NonNegativeInteger|))))
         (SEQ
          (LETT |invm|
                (SPADCALL (SPADCALL |a| (QREFELT $ 85))
                          (SPADCALL |a| (QREFELT $ 102)) 0 (QREFELT $ 96))
                . #2=(|GROUPP;invertMap|))
          (SEQ (LETT |x| 1 . #2#)
               (LETT #1# (SPADCALL |a| (QREFELT $ 85)) . #2#) G190
               (COND ((|greater_SI| |x| #1#) (GO G191)))
               (SEQ (LETT |i| (SPADCALL |a| |x| 1 (QREFELT $ 103)) . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL |i| 0 (QREFELT $ 60))
                       (SPADCALL |invm| |i| 1 |x| (QREFELT $ 104))))))
               (LETT |x| (|inc_SI| |x|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |invm|)))) 

(SDEFUN |GROUPP;relatorTables|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| (|NonNegativeInteger|))
          (|:| |number_of_indices| #2=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         (|rels| |List| (|List| (|Integer|)))
         ($ |List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
        (SPROG
         ((|relators| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|relatorTrim| #3=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|cts| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (|part2| (|NonNegativeInteger|)) (#4=#:G1131 NIL) (|part1| #2#)
          (|relator| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|fst| (|Boolean|)) (|relatorn| #3#) (|gNum| (|NonNegativeInteger|))
          (#5=#:G1126 NIL) (#6=#:G1142 NIL) (|g| NIL) (#7=#:G1141 NIL)
          (|r| NIL)
          (|invGenLists|
           (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#8=#:G1140 NIL) (|a| NIL) (#9=#:G1139 NIL)
          (|genLists| (|List| (|TwoDimensionalArray| (|NonNegativeInteger|))))
          (#10=#:G1124 NIL) (|np| #2#) (|ct| #1#))
         (SEQ (LETT |ct| (QVELT |state| 0) . #11=(|GROUPP;relatorTables|))
              (LETT |np| (QVELT |state| 5) . #11#)
              (LETT |genLists|
                    (SPADCALL |ct|
                              (PROG1
                                  (LETT #10# (SPADCALL |ct| (QREFELT $ 102))
                                        . #11#)
                                (|check_subtype2| (> #10# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|)
                                                  #10#))
                              (QREFELT $ 105))
                    . #11#)
              (LETT |invGenLists|
                    (PROGN
                     (LETT #9# NIL . #11#)
                     (SEQ (LETT |a| NIL . #11#) (LETT #8# |genLists| . #11#)
                          G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |a| (CAR #8#) . #11#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9# (CONS (|GROUPP;invertMap| |a| $) #9#)
                                  . #11#)))
                          (LETT #8# (CDR #8#) . #11#) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    . #11#)
              (LETT |relators| NIL . #11#)
              (SEQ (LETT |r| NIL . #11#) (LETT #7# |rels| . #11#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |r| (CAR #7#) . #11#) NIL))
                     (GO G191)))
                   (SEQ (LETT |relator| (SPADCALL 0 0 0 (QREFELT $ 96)) . #11#)
                        (LETT |fst| 'T . #11#)
                        (SEQ (LETT |g| NIL . #11#) (LETT #6# |r| . #11#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |g| (CAR #6#) . #11#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |gNum|
                                    (PROG1 (LETT #5# (ABS |g|) . #11#)
                                      (|check_subtype2| (>= #5# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #5#))
                                    . #11#)
                              (LETT |relatorn|
                                    (COND
                                     ((SPADCALL |g| 0 (QREFELT $ 41))
                                      (SPADCALL |genLists| |gNum|
                                                (QREFELT $ 90)))
                                     ('T
                                      (SPADCALL |invGenLists| |gNum|
                                                (QREFELT $ 90))))
                                    . #11#)
                              (EXIT
                               (COND
                                (|fst|
                                 (SEQ (LETT |relator| |relatorn| . #11#)
                                      (EXIT (LETT |fst| NIL . #11#))))
                                ('T
                                 (LETT |relator|
                                       (SPADCALL |relator| |relatorn|
                                                 (QREFELT $ 106))
                                       . #11#)))))
                             (LETT #6# (CDR #6#) . #11#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |relatorTrim| |relator| . #11#)
                        (COND
                         ((SPADCALL (SPADCALL |relatorTrim| (QREFELT $ 85))
                                    |np| (QREFELT $ 49))
                          (SEQ (LETT |part1| |np| . #11#)
                               (LETT |part2|
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL
                                                (SPADCALL |relatorTrim|
                                                          (QREFELT $ 85))
                                                |np| (QREFELT $ 87))
                                               . #11#)
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0)
                                                       (|NonNegativeInteger|)
                                                       (|Union|
                                                        (|NonNegativeInteger|)
                                                        "failed")
                                                       #4#))
                                     . #11#)
                               (LETT |cts|
                                     (SPADCALL |relatorTrim|
                                               (LIST |part1| |part2|)
                                               (QREFELT $ 88))
                                     . #11#)
                               (EXIT
                                (LETT |relatorTrim|
                                      (SPADCALL |cts| 1 (QREFELT $ 90))
                                      . #11#)))))
                        (EXIT
                         (LETT |relators|
                               (SPADCALL |relators| |relatorTrim|
                                         (QREFELT $ 107))
                               . #11#)))
                   (LETT #7# (CDR #7#) . #11#) (GO G190) G191 (EXIT NIL))
              (EXIT |relators|)))) 

(SDEFUN |GROUPP;generators2Permutation|
        ((|state| |Record|
          (|:| |coset_table| #1=(|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|:| |equiv_table| #2=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |inverse_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
          (|:| |closed_point| (|NonNegativeInteger|))
          (|:| |number_of_generators| #3=(|NonNegativeInteger|))
          (|:| |number_of_indices| #4=(|NonNegativeInteger|))
          (|:| |number_of_points| (|NonNegativeInteger|))
          (|:| |max_number_of_indices| (|NonNegativeInteger|)))
         (|trace| |Boolean|) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|pl| (|List| (|Permutation| (|Integer|))))
          (|p| (|Permutation| (|Integer|))) (|gl| (|List| (|Integer|)))
          (#5=#:G1162 NIL) (|j| (|SingleInteger|))
          (|kk| (|NonNegativeInteger|)) (#6=#:G1161 NIL) (#7=#:G1160 NIL)
          (|i| NIL) (|perm_lists| (|Vector| (|List| (|Integer|))))
          (#8=#:G1159 NIL)
          (|net| (|OneDimensionalArray| (|NonNegativeInteger|))) (|et| #2#)
          (|n_inds| #4#) (|n_gens| #3#) (|ct| #1#))
         (SEQ
          (LETT |ct| (QVELT |state| 0) . #9=(|GROUPP;generators2Permutation|))
          (COND
           (|trace|
            (SPADCALL
             (SPADCALL "generators2Permutation generators=" (QREFELT $ 44))
             (QREFELT $ 56))))
          (LETT |n_gens| (QVELT |state| 4) . #9#)
          (LETT |n_inds| (QVELT |state| 5) . #9#)
          (LETT |et| (QVELT |state| 1) . #9#)
          (LETT |net| (SPADCALL |n_inds| 0 (QREFELT $ 98)) . #9#)
          (LETT |j| 0 . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT #8# |n_inds| . #9#) G190
               (COND ((|greater_SI| |i| #8#) (GO G191)))
               (SEQ
                (EXIT
                 (COND ((NULL (EQL (QAREF1O |et| |i| 1) |i|)) "skip")
                       ('T
                        (SEQ (LETT |j| (|add_SI| |j| 1) . #9#)
                             (EXIT (QSETAREF1O |net| |i| |j| 1)))))))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |perm_lists| (MAKEARR1 |n_gens| NIL) . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT #7# |n_inds| . #9#) G190
               (COND ((|greater_SI| |i| #7#) (GO G191)))
               (SEQ
                (EXIT
                 (COND ((NULL (EQL (QAREF1O |et| |i| 1) |i|)) "skip")
                       ('T
                        (SEQ (LETT |j| 1 . #9#) (LETT #6# |n_gens| . #9#) G190
                             (COND ((|greater_SI| |j| #6#) (GO G191)))
                             (SEQ (LETT |kk| (QAREF2O |ct| |i| |j| 1 1) . #9#)
                                  (EXIT
                                   (COND
                                    ((EQL |kk| 0)
                                     (SEQ
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL "i = " (QREFELT $ 44))
                                            (SPADCALL |i| (QREFELT $ 68))
                                            (QREFELT $ 43))
                                           (SPADCALL " j = " (QREFELT $ 44))
                                           (QREFELT $ 43))
                                          (SPADCALL |j| (QREFELT $ 68))
                                          (QREFELT $ 43))
                                         (SPADCALL " ct(i) = " (QREFELT $ 44))
                                         (QREFELT $ 43))
                                        (SPADCALL
                                         (SPADCALL |ct| |i| (QREFELT $ 108))
                                         (QREFELT $ 109))
                                        (QREFELT $ 43))
                                       (QREFELT $ 56))
                                      (EXIT
                                       (|error| "incomplete coset table"))))
                                    ('T
                                     (SEQ
                                      (LETT |kk|
                                            (QAREF1O |net|
                                                     (|GROUPP;find| |et| |kk|
                                                      $)
                                                     1)
                                            . #9#)
                                      (EXIT
                                       (QSETAREF1O |perm_lists| |j|
                                                   (CONS |kk|
                                                         (QAREF1O |perm_lists|
                                                                  |j| 1))
                                                   1)))))))
                             (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                             (EXIT NIL))))))
               (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |pl| NIL . #9#)
          (COND
           (|trace|
            (SPADCALL (SPADCALL |perm_lists| (QREFELT $ 111)) (QREFELT $ 56))))
          (SEQ (LETT |j| 1 . #9#) (LETT #5# |n_gens| . #9#) G190
               (COND ((|greater_SI| |j| #5#) (GO G191)))
               (SEQ
                (LETT |gl|
                      (NREVERSE (SPADCALL |perm_lists| |j| (QREFELT $ 112)))
                      . #9#)
                (LETT |p| (SPADCALL |gl| (QREFELT $ 114)) . #9#)
                (EXIT (LETT |pl| (CONS |p| |pl|) . #9#)))
               (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |pl| (NREVERSE |pl|) . #9#)
          (EXIT (SPADCALL |pl| (QREFELT $ 117)))))) 

(SDEFUN |GROUPP;toPermutationIfCan;$U;46|
        ((|a| $) ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPADCALL |a| NIL (QREFELT $ 119))) 

(SDEFUN |GROUPP;toPermutationIfCan;$BU;47|
        ((|a| $) (|trace| |Boolean|)
         ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPADCALL |a| NIL |trace| (QREFELT $ 121))) 

(SDEFUN |GROUPP;convert_words|
        ((|words| |List| (|List| #1=(|Integer|)))
         (|inv_tab| |OneDimensionalArray| (|NonNegativeInteger|))
         ($ |List| (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((|nrwords| (|List| (|List| (|NonNegativeInteger|))))
          (|nwords| (|List| (|List| (|NonNegativeInteger|)))) (#2=#:G1181 NIL)
          (|i| NIL) (#3=#:G1180 NIL) (|nword| (|List| (|NonNegativeInteger|)))
          (|gen| #1#) (#4=#:G1179 NIL) (#5=#:G1178 NIL) (|word| NIL))
         (SEQ (LETT |nwords| NIL . #6=(|GROUPP;convert_words|))
              (LETT |nrwords| NIL . #6#)
              (SEQ (LETT |word| NIL . #6#) (LETT #5# |words| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |word| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ (LETT |nword| NIL . #6#)
                        (SEQ (LETT |i| NIL . #6#) (LETT #4# |word| . #6#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |i| (CAR #4#) . #6#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |gen|
                                    (COND ((SPADCALL |i| 0 (QREFELT $ 41)) |i|)
                                          ('T
                                           (SPADCALL |inv_tab| (- |i|)
                                                     (QREFELT $ 100))))
                                    . #6#)
                              (EXIT (LETT |nword| (CONS |gen| |nword|) . #6#)))
                             (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |nwords| (CONS |nword| |nwords|) . #6#)
                        (EXIT
                         (LETT |nrwords|
                               (CONS
                                (NREVERSE
                                 (PROGN
                                  (LETT #3# NIL . #6#)
                                  (SEQ (LETT |i| NIL . #6#)
                                       (LETT #2# |nword| . #6#) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |i| (CAR #2#) . #6#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #3#
                                               (CONS
                                                (SPADCALL |inv_tab| |i|
                                                          (QREFELT $ 100))
                                                #3#)
                                               . #6#)))
                                       (LETT #2# (CDR #2#) . #6#) (GO G190)
                                       G191 (EXIT (NREVERSE #3#)))))
                                |nrwords|)
                               . #6#)))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |nwords| (NREVERSE |nwords|) . #6#)
              (LETT |nrwords| (NREVERSE |nrwords|) . #6#)
              (EXIT (LIST |nwords| |nrwords|))))) 

(SDEFUN |GROUPP;toPermutationIfCan;$LBU;49|
        ((|a| $) (|sg| |List| (|List| (|Integer|))) (|trace| |Boolean|)
         ($ |Union| (|PermutationGroup| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G1201 NIL) (#2=#:G1202 NIL) (#3=#:G1203 NIL)
          (|changedByDeduction| #4=(|Boolean|)) (|dummy| #4#)
          (|sgens_lens| (|List| #5=(|NonNegativeInteger|))) (#6=#:G1208 NIL)
          (|word| NIL) (#7=#:G1207 NIL) (|nrsgens| NIL)
          (|#G191| #8=(|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|nsgens| NIL) (|#G190| #8#)
          (|state|
           (|Record|
            (|:| |coset_table| (|TwoDimensionalArray| (|NonNegativeInteger|)))
            (|:| |equiv_table| (|OneDimensionalArray| (|NonNegativeInteger|)))
            (|:| |inverse_table|
                 (|OneDimensionalArray| (|NonNegativeInteger|)))
            (|:| |closed_point| (|NonNegativeInteger|))
            (|:| |number_of_generators| (|NonNegativeInteger|))
            (|:| |number_of_indices| (|NonNegativeInteger|))
            (|:| |number_of_points| (|NonNegativeInteger|))
            (|:| |max_number_of_indices| (|NonNegativeInteger|))))
          (|loopLimit| (|NonNegativeInteger|))
          (|rel_lens| (|List| (|NonNegativeInteger|))) (#9=#:G1206 NIL)
          (|rel| NIL) (#10=#:G1205 NIL) (|nrrels| NIL) (|#G186| #8#)
          (|nrels| NIL) (|#G185| #8#) (#11=#:G1204 NIL) (|i| NIL)
          (|inv_tab| #12=(|OneDimensionalArray| (|NonNegativeInteger|)))
          (|et| #12#) (|ct| (|TwoDimensionalArray| (|NonNegativeInteger|)))
          (|numGens| #5#) (|unit| (|Permutation| (|Integer|)))
          (|rs| (|List| (|List| (|Integer|))))
          (|gs| (|List| (|NonNegativeInteger|)))
          (|numberPoints| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |numberPoints| 1 . #13=(|GROUPP;toPermutationIfCan;$LBU;49|))
            (LETT |gs| (SPADCALL (QCAR |a|) (QREFELT $ 17)) . #13#)
            (LETT |rs| (QCDR |a|) . #13#)
            (COND
             ((EQL (SPADCALL |gs| (QREFELT $ 64)) 0)
              (COND
               ((EQL (LENGTH |rs|) 0)
                (SEQ (LETT |unit| (|spadConstant| $ 122) . #13#)
                     (EXIT
                      (PROGN
                       (LETT #3#
                             (CONS 0 (SPADCALL (LIST |unit|) (QREFELT $ 117)))
                             . #13#)
                       (GO #14=#:G1200))))))))
            (COND
             ((SPADCALL (SPADCALL |gs| (QREFELT $ 64)) (LENGTH |rs|)
                        (QREFELT $ 49))
              (PROGN (LETT #3# (CONS 1 "failed") . #13#) (GO #14#))))
            (LETT |numGens| (SPADCALL |gs| (QREFELT $ 64)) . #13#)
            (LETT |ct|
                  (SPADCALL 10 (SPADCALL 2 |numGens| (QREFELT $ 123)) 0
                            (QREFELT $ 96))
                  . #13#)
            (LETT |et| (SPADCALL 10 0 (QREFELT $ 98)) . #13#)
            (SEQ (LETT |i| 1 . #13#) G190
                 (COND ((|greater_SI| |i| 10) (GO G191)))
                 (SEQ (EXIT (QSETAREF1O |et| |i| |i| 1)))
                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))
            (LETT |inv_tab|
                  (SPADCALL (SPADCALL 2 |numGens| (QREFELT $ 123)) 0
                            (QREFELT $ 98))
                  . #13#)
            (SEQ (LETT |i| 1 . #13#) (LETT #11# |numGens| . #13#) G190
                 (COND ((|greater_SI| |i| #11#) (GO G191)))
                 (SEQ (QSETAREF1O |inv_tab| |i| (+ |i| |numGens|) 1)
                      (EXIT (QSETAREF1O |inv_tab| (+ |i| |numGens|) |i| 1)))
                 (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191 (EXIT NIL))
            (PROGN
             (LETT |#G185| (|GROUPP;convert_words| |rs| |inv_tab| $) . #13#)
             (LETT |#G186| |#G185| . #13#)
             (LETT |nrels| (|SPADfirst| |#G186|) . #13#)
             (LETT |#G186| (CDR |#G186|) . #13#)
             (LETT |nrrels| (|SPADfirst| |#G186|) . #13#)
             |#G185|)
            (LETT |rel_lens|
                  (PROGN
                   (LETT #10# NIL . #13#)
                   (SEQ (LETT |rel| NIL . #13#) (LETT #9# |nrels| . #13#) G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |rel| (CAR #9#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10#
                                (CONS (SPADCALL |rel| (QREFELT $ 64)) #10#)
                                . #13#)))
                        (LETT #9# (CDR #9#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  . #13#)
            (LETT |loopLimit| (QUOTIENT2 5000000 |numGens|) . #13#)
            (LETT |state|
                  (VECTOR |ct| |et| |inv_tab| 0 |numGens| 1 1 |loopLimit|)
                  . #13#)
            (PROGN
             (LETT |#G190| (|GROUPP;convert_words| |sg| |inv_tab| $) . #13#)
             (LETT |#G191| |#G190| . #13#)
             (LETT |nsgens| (|SPADfirst| |#G191|) . #13#)
             (LETT |#G191| (CDR |#G191|) . #13#)
             (LETT |nrsgens| (|SPADfirst| |#G191|) . #13#)
             |#G190|)
            (LETT |sgens_lens|
                  (PROGN
                   (LETT #7# NIL . #13#)
                   (SEQ (LETT |word| NIL . #13#) (LETT #6# |nsgens| . #13#)
                        G190
                        (COND
                         ((OR (ATOM #6#)
                              (PROGN (LETT |word| (CAR #6#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #7# (CONS (SPADCALL |word| (QREFELT $ 64)) #7#)
                                . #13#)))
                        (LETT #6# (CDR #6#) . #13#) (GO G190) G191
                        (EXIT (NREVERSE #7#))))
                  . #13#)
            (LETT |dummy|
                  (|GROUPP;inferFromRelations| |state|
                   (SPADCALL |nsgens| |nrels| (QREFELT $ 124))
                   (SPADCALL |nrsgens| |nrrels| (QREFELT $ 124))
                   (SPADCALL |sgens_lens| |rel_lens| (QREFELT $ 76)) |trace| $)
                  . #13#)
            (SEQ
             (EXIT
              (SEQ G190 (COND ((NULL 'T) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |changedByDeduction|
                            (|GROUPP;inferFromRelations| |state| |nrels|
                             |nrrels| |rel_lens| |trace| $)
                            . #13#)
                      (COND
                       ((NULL |changedByDeduction|)
                        (SEQ
                         (COND
                          (|trace|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL "finished using " (QREFELT $ 44))
                             (SPADCALL (QVELT |state| 5) (QREFELT $ 68))
                             (QREFELT $ 43))
                            (QREFELT $ 56))))
                         (EXIT
                          (PROGN
                           (LETT #3#
                                 (CONS 0
                                       (|GROUPP;generators2Permutation| |state|
                                        |trace| $))
                                 . #13#)
                           (GO #14#))))))
                      (COND
                       (|trace|
                        (SPADCALL
                         (SPADCALL (SPADCALL "relatorTables=" (QREFELT $ 44))
                                   (SPADCALL
                                    (|GROUPP;relatorTables| |state| |rs| $)
                                    (QREFELT $ 125))
                                   (QREFELT $ 43))
                         (QREFELT $ 56))))
                      (EXIT
                       (COND
                        ((>= (QVELT |state| 5) |loopLimit|)
                         (PROGN
                          (LETT #1#
                                (PROGN
                                 (LETT #2# |$NoValue| . #13#)
                                 (GO #15=#:G1198))
                                . #13#)
                          (GO #16=#:G1197)))))))
                    #16# (EXIT #1#))
                   NIL (GO G190) G191 (EXIT NIL)))
             #15# (EXIT #2#))
            (EXIT (CONS 1 "failed"))))
          #14# (EXIT #3#)))) 

(SDEFUN |GROUPP;coerce;$Of;50| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (|rs| (|List| (|List| (|Integer|))))
          (|g| (|OutputForm|)) (|ps| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |ps| (SPADCALL (QCAR |s|) (QREFELT $ 126))
                . #1=(|GROUPP;coerce;$Of;50|))
          (LETT |g| (|GROUPP;outputGenList| |ps| $) . #1#)
          (LETT |rs| (QCDR |s|) . #1#)
          (LETT |r| (|GROUPP;outputRelList| |rs| $) . #1#)
          (EXIT
           (SPADCALL
            (LIST (SPADCALL "<" (QREFELT $ 44)) |g|
                  (SPADCALL " | " (QREFELT $ 44)) |r|
                  (SPADCALL ">" (QREFELT $ 44)))
            (QREFELT $ 45)))))) 

(DECLAIM (NOTINLINE |GroupPresentation;|)) 

(DEFUN |GroupPresentation| ()
  (SPROG NIL
         (PROG (#1=#:G1212)
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
          (LETT $ (GETREFV 129) . #1#)
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
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 18) (|PrimitiveArray| 18)
              (0 . |construct|) (|List| 24) |GROUPP;groupPresentation;LL$;1|
              |GROUPP;groupPresentation;L$;2| |GROUPP;groupPresentation;$;3|
              (|List| $) (|String|) (5 . |concat|) (10 . |entries|)
              (|NonNegativeInteger|) (15 . |#|)
              (|Record| (|:| |OldGen| 18) (|:| |NewGen| 18)) (|List| 20)
              (20 . |concat|) (|Integer|) (|List| 23) (26 . |concat|)
              (32 . |concat|) |GROUPP;refactor;2$;5| (|Set| 18) (38 . |set|)
              (|Boolean|) (43 . ~=) (49 . |entries|) (|Set| 24) (54 . |set|)
              (59 . =) |GROUPP;=;2$B;6| (|Character|) (65 . |elt|)
              (|OutputForm|) (71 . |coerce|) (76 . >) (82 . |outputForm|)
              (87 . |hconcat|) (93 . |message|) (98 . |hconcat|) (|List| 39)
              (103 . |concat|) (109 . |commaSeparate|) (114 . >)
              (120 . |blankSeparate|) (125 . |member?|) (131 . |concat|)
              (137 . |remove|) (143 . |remove|) (|Void|) (149 . |print|)
              (154 . |second|) (159 . |sign|) (164 . ~=) (170 . ~=) (176 . =)
              (182 . |copy|) (187 . |coerce|) (192 . |#|) (197 . |elt|)
              (203 . |elt|) |GROUPP;coerce;$Of;50| (209 . |coerce|)
              (214 . |concat|) |GROUPP;simplify;$B$;30| |GROUPP;simplify;2$;29|
              |GROUPP;quotient;$L$;32| (220 . |entries|) (225 . |concat|)
              |GROUPP;quotient;$L$;33| (231 . |concat|) (237 . |concat|)
              |GROUPP;directProduct;3$;34| (|PositiveInteger|)
              |GROUPP;cyclicGroup;Pi$;35| |GROUPP;dihedralGroup;Pi$;36|
              |GROUPP;symmetricGroup;Pi$;37| (|TwoDimensionalArray| 18)
              (242 . |coerce|) (247 . |nrows|) (|Union| $ '"failed")
              (252 . |subtractIfCan|) (258 . |vertSplit|) (|List| 83)
              (264 . |elt|) (270 . |maxColIndex|) (|List| 7) (275 . |coerce|)
              (280 . |maxRowIndex|) (285 . *) (291 . |new|)
              (|OneDimensionalArray| 18) (298 . |new|) (304 . |coerce|)
              (309 . |elt|) (315 . |coerce|) (320 . |ncols|) (325 . |elt|)
              (332 . |setelt!|) (340 . |horizSplit|) (346 . |horizConcat|)
              (352 . |concat|) (358 . |row|) (364 . |coerce|) (|Vector| 24)
              (369 . |coerce|) (374 . |elt|) (|Permutation| 23)
              (380 . |coerceImages|) (|List| 113) (|PermutationGroup| 23)
              (385 . |permutationGroup|) (|Union| 116 '"failed")
              |GROUPP;toPermutationIfCan;$BU;47|
              |GROUPP;toPermutationIfCan;$U;46|
              |GROUPP;toPermutationIfCan;$LBU;49| (390 . |One|) (394 . *)
              (400 . |concat|) (406 . |coerce|) (411 . |parts|)
              (|SingleInteger|) (|HashState|))
           '#(~= 416 |toPermutationIfCan| 422 |symmetricGroup| 440 |simplify|
              445 |refactor| 456 |quotient| 461 |latex| 473 |hashUpdate!| 478
              |hash| 484 |groupPresentation| 489 |directProduct| 504
              |dihedralGroup| 510 |cyclicGroup| 515 |coerce| 520 = 525)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 39))
                        (|makeByteWordVec2| 128
                                            '(1 8 0 7 9 1 15 0 14 16 1 8 7 0 17
                                              1 8 18 0 19 2 21 0 0 20 22 2 24 0
                                              0 23 25 2 10 0 0 24 26 1 28 0 7
                                              29 2 28 30 0 0 31 1 10 10 0 32 1
                                              33 0 10 34 2 33 30 0 0 35 2 15 37
                                              0 23 38 1 37 39 0 40 2 23 30 0 0
                                              41 1 39 0 23 42 2 39 0 0 0 43 1
                                              39 0 15 44 1 39 0 14 45 2 46 0 0
                                              39 47 1 39 0 14 48 2 18 30 0 0 49
                                              1 39 0 14 50 2 24 30 23 0 51 2 7
                                              0 0 18 52 2 8 0 18 0 53 2 24 0 23
                                              0 54 1 39 55 0 56 1 24 23 0 57 1
                                              23 23 0 58 2 23 30 0 0 59 2 18 30
                                              0 0 60 2 24 30 0 0 61 1 24 0 0 62
                                              1 24 39 0 63 1 7 18 0 64 2 7 18 0
                                              23 65 2 10 24 0 23 66 1 18 39 0
                                              68 2 24 0 0 0 69 1 7 7 0 73 2 10
                                              0 0 0 74 2 7 0 0 0 76 1 10 0 14
                                              77 1 83 39 0 84 1 83 18 0 85 2 18
                                              86 0 0 87 2 83 14 0 7 88 2 89 83
                                              0 23 90 1 83 23 0 91 1 92 39 0 93
                                              1 83 23 0 94 2 23 0 79 0 95 3 83
                                              0 18 18 18 96 2 97 0 18 18 98 1
                                              23 39 0 99 2 97 18 0 23 100 1 7
                                              39 0 101 1 83 18 0 102 3 83 18 0
                                              23 23 103 4 83 18 0 23 23 18 104
                                              2 83 14 0 79 105 2 83 0 0 0 106 2
                                              89 0 0 83 107 2 83 97 0 23 108 1
                                              97 39 0 109 1 110 39 0 111 2 110
                                              24 0 23 112 1 113 0 24 114 1 116
                                              0 115 117 0 113 0 122 2 18 0 79 0
                                              123 2 92 0 0 0 124 1 89 39 0 125
                                              1 8 7 0 126 2 0 30 0 0 1 2 0 118
                                              0 30 119 3 0 118 0 10 30 121 1 0
                                              118 0 120 1 0 0 79 82 1 0 0 0 71
                                              2 0 0 0 30 70 1 0 0 0 27 2 0 0 0
                                              10 75 2 0 0 0 7 72 1 0 15 0 1 2 0
                                              128 128 0 1 1 0 127 0 1 0 0 0 13
                                              2 0 0 7 10 11 1 0 0 7 12 2 0 0 0
                                              0 78 1 0 0 79 81 1 0 0 79 80 1 0
                                              39 0 67 2 0 30 0 0 36)))))
           '|lookupComplete|)) 

(MAKEPROP '|GroupPresentation| 'NILADIC T) 
