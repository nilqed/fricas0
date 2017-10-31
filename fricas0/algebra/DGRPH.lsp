
(SDEFUN |DGRPH;directedGraph;L$;1| ((|objs| |List| S) ($ $))
        (SPROG
         ((|obs|
           (|List|
            #1=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #1#) (#2=#:G739 NIL) (|ob| NIL) (#3=#:G740 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|DGRPH;directedGraph;L$;1|))
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |objs|) . #4#)
                   (LETT |ob| NIL . #4#) (LETT #2# |objs| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#) . #4#) NIL)
                         (|greater_SI| |obn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #4#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #4#)))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| NIL))))) 

(PUT '|DGRPH;directedGraph;L$;2| '|SPADreplace| '(XLAM (|ob|) (CONS |ob| NIL))) 

(SDEFUN |DGRPH;directedGraph;L$;2|
        ((|ob| |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|))))
         ($ $))
        (CONS |ob| NIL)) 

(PUT '|DGRPH;directedGraph;LL$;3| '|SPADreplace| 'CONS) 

(SDEFUN |DGRPH;directedGraph;LL$;3|
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

(SDEFUN |DGRPH;directedGraph;LL$;4|
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
          (#1=#:G762 NIL) (|ar| NIL) (#2=#:G763 NIL) (|arn| NIL)
          (|nodes|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#3=#:G760 NIL) (|ob| NIL) (#4=#:G761 NIL) (|obn| NIL))
         (SEQ (LETT |nodes| NIL . #5=(|DGRPH;directedGraph;LL$;4|))
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |obs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |obs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |obs|) |obn| (QREFELT $ 9))
                                  (SPADCALL (LENGTH |obs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (EXIT
                     (LETT |nodes| (SPADCALL |nodes| |o| (QREFELT $ 13))
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
                                     (QREFELT $ 20))
                           . #5#)))
                   (LETT #1#
                         (PROG1 (CDR #1#) (LETT |arn| (|inc_SI| |arn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |nodes| |edges|))))) 

(SDEFUN |DGRPH;directedGraph;Fp$;5| ((|poset| |FinitePoset| S) ($ $))
        (SPROG
         ((|ars|
           (|List|
            #1=(|Record| (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|)))))
          (|z| #1#) (#2=#:G772 NIL) (|y| NIL) (#3=#:G773 NIL) (|yn| NIL)
          (#4=#:G770 NIL) (|x| NIL) (#5=#:G771 NIL) (|xn| NIL)
          (|mat| (|List| (|List| (|Boolean|)))) (|obs| (|List| S)))
         (SEQ
          (LETT |obs| (SPADCALL |poset| (QREFELT $ 25))
                . #6=(|DGRPH;directedGraph;Fp$;5|))
          (LETT |ars| NIL . #6#)
          (LETT |mat| (SPADCALL |poset| (QREFELT $ 27)) . #6#)
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
                                (LETT |ars| (SPADCALL |ars| |z| (QREFELT $ 28))
                                      . #6#)))))))
                      (LETT #2#
                            (PROG1 (CDR #2#) (LETT |yn| (|inc_SI| |yn|) . #6#))
                            . #6#)
                      (GO G190) G191 (EXIT NIL))))
               (LETT #4# (PROG1 (CDR #4#) (LETT |xn| (|inc_SI| |xn|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |obs| |ars| (QREFELT $ 23)))))) 

(SDEFUN |DGRPH;directedGraph;LL$;6|
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
          (|a| #1#) (#2=#:G790 NIL) (|j| NIL) (#3=#:G789 NIL) (|i| NIL)
          (|obs|
           (|List|
            #4=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #4#) (#5=#:G787 NIL) (|ob| NIL) (#6=#:G788 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #7=(|DGRPH;directedGraph;LL$;6|))
              (SEQ (LETT |obn| 1 . #7#) (LETT #6# (LENGTH |objs|) . #7#)
                   (LETT |ob| NIL . #7#) (LETT #5# |objs| . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |ob| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |obn| #6#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #7#)
                    (EXIT
                     (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #7#)))
                   (LETT #5#
                         (PROG1 (CDR #5#) (LETT |obn| (|inc_SI| |obn|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |ar| NIL . #7#)
              (SEQ (LETT |i| 1 . #7#) (LETT #3# (LENGTH |am|) . #7#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #7#)
                          (LETT #2#
                                (SPADCALL (SPADCALL |am| |i| (QREFELT $ 33))
                                          (QREFELT $ 34))
                                . #7#)
                          G190 (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((EQL
                               (SPADCALL (SPADCALL |am| |i| (QREFELT $ 33)) |j|
                                         (QREFELT $ 35))
                               1)
                              (SEQ
                               (LETT |a| (VECTOR "a" 0 |i| |j| 0 0 NIL) . #7#)
                               (EXIT
                                (LETT |ar| (SPADCALL |ar| |a| (QREFELT $ 20))
                                      . #7#)))))))
                          (LETT |j| (|inc_SI| |j|) . #7#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ar|))))) 

(SDEFUN |DGRPH;directedGraph;L$;7| ((|perms| |List| (|Permutation| S)) ($ $))
        (SPROG
         ((|ars|
           (|List|
            #1=(|Record| (|:| |name| (|String|))
                         (|:| |arrType| (|NonNegativeInteger|))
                         (|:| |fromOb| (|NonNegativeInteger|))
                         (|:| |toOb| (|NonNegativeInteger|))
                         (|:| |xOffset| (|Integer|))
                         (|:| |yOffset| (|Integer|))
                         (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|a| #1#) (#2=#:G966 NIL) (|arrNum| NIL)
          (|verts|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (#4=#:G964 NIL) (|vert| NIL) (#5=#:G965 NIL) (|i| NIL)
          (#6=#:G941 NIL) (#7=#:G940 NIL) (|pout| #8=(|Integer|)) (|pin| #8#)
          (#9=#:G963 NIL) (|pt| NIL) (|preim| #10=(|List| S))
          (|im| #11=(|List| S))
          (|lr| (|Record| (|:| |preimage| #10#) (|:| |image| #11#)))
          (#12=#:G961 NIL) (|perm| NIL) (#13=#:G962 NIL) (|pi| NIL)
          (|tab| (|List| (|List| (|NonNegativeInteger|)))) (#14=#:G960 NIL)
          (#15=#:G959 NIL) (#16=#:G958 NIL) (|b| NIL) (#17=#:G957 NIL)
          (|obs| (|List| S)) (#18=#:G956 NIL) (|v| NIL) (#19=#:G954 NIL)
          (#20=#:G955 NIL) (|px| NIL))
         (SEQ (LETT |obs| NIL . #21=(|DGRPH;directedGraph;L$;7|))
              (SEQ (LETT |px| 1 . #21#) (LETT #20# (LENGTH |perms|) . #21#)
                   (LETT |perm| NIL . #21#) (LETT #19# |perms| . #21#) G190
                   (COND
                    ((OR (ATOM #19#)
                         (PROGN (LETT |perm| (CAR #19#) . #21#) NIL)
                         (|greater_SI| |px| #20#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 39)) . #21#)
                        (LETT |im| (QCDR |lr|) . #21#)
                        (EXIT
                         (COND ((EQL |px| 1) (LETT |obs| |im| . #21#))
                               ('T
                                (SEQ (LETT |v| NIL . #21#)
                                     (LETT #18# |im| . #21#) G190
                                     (COND
                                      ((OR (ATOM #18#)
                                           (PROGN
                                            (LETT |v| (CAR #18#) . #21#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((< (SPADCALL |v| |obs| (QREFELT $ 41))
                                            1)
                                         (LETT |obs|
                                               (SPADCALL |obs| |v|
                                                         (QREFELT $ 42))
                                               . #21#)))))
                                     (LETT #18# (CDR #18#) . #21#) (GO G190)
                                     G191 (EXIT NIL))))))
                   (LETT #19#
                         (PROG1 (CDR #19#) (LETT |px| (|inc_SI| |px|) . #21#))
                         . #21#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |tab|
                    (PROGN
                     (LETT #17# NIL . #21#)
                     (SEQ (LETT |b| 1 . #21#) (LETT #16# (LENGTH |obs|) . #21#)
                          G190 (COND ((|greater_SI| |b| #16#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #17#
                                  (CONS
                                   (PROGN
                                    (LETT #15# NIL . #21#)
                                    (SEQ (LETT |a| 1 . #21#)
                                         (LETT #14# (LENGTH |perms|) . #21#)
                                         G190
                                         (COND
                                          ((|greater_SI| |a| #14#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #15# (CONS |b| #15#) . #21#)))
                                         (LETT |a| (|inc_SI| |a|) . #21#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #15#))))
                                   #17#)
                                  . #21#)))
                          (LETT |b| (|inc_SI| |b|) . #21#) (GO G190) G191
                          (EXIT (NREVERSE #17#))))
                    . #21#)
              (SEQ (LETT |pi| 1 . #21#) (LETT #13# (LENGTH |perms|) . #21#)
                   (LETT |perm| NIL . #21#) (LETT #12# |perms| . #21#) G190
                   (COND
                    ((OR (ATOM #12#)
                         (PROGN (LETT |perm| (CAR #12#) . #21#) NIL)
                         (|greater_SI| |pi| #13#))
                     (GO G191)))
                   (SEQ (LETT |lr| (SPADCALL |perm| (QREFELT $ 39)) . #21#)
                        (LETT |im| (QCDR |lr|) . #21#)
                        (LETT |preim| (QCAR |lr|) . #21#)
                        (EXIT
                         (SEQ (LETT |pt| 1 . #21#)
                              (LETT #9# (LENGTH |im|) . #21#) G190
                              (COND ((|greater_SI| |pt| #9#) (GO G191)))
                              (SEQ
                               (LETT |pin|
                                     (SPADCALL
                                      (SPADCALL |im| |pt| (QREFELT $ 43)) |obs|
                                      (QREFELT $ 41))
                                     . #21#)
                               (LETT |pout|
                                     (SPADCALL
                                      (SPADCALL |preim| |pt| (QREFELT $ 43))
                                      |obs| (QREFELT $ 41))
                                     . #21#)
                               (EXIT
                                (SPADCALL
                                 (SPADCALL |tab|
                                           (PROG1 (LETT #7# |pin| . #21#)
                                             (|check_subtype2| (>= #7# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #7#))
                                           (QREFELT $ 33))
                                 |pi|
                                 (PROG1 (LETT #6# |pout| . #21#)
                                   (|check_subtype2| (>= #6# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #6#))
                                 (QREFELT $ 44))))
                              (LETT |pt| (|inc_SI| |pt|) . #21#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #12#
                         (PROG1 (CDR #12#) (LETT |pi| (|inc_SI| |pi|) . #21#))
                         . #21#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |verts| NIL . #21#) (LETT |ars| NIL . #21#)
              (SEQ (LETT |i| 1 . #21#) (LETT #5# (LENGTH |obs|) . #21#)
                   (LETT |vert| NIL . #21#) (LETT #4# |obs| . #21#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |vert| (CAR #4#) . #21#) NIL)
                         (|greater_SI| |i| #5#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |vert|
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 9))
                                  (SPADCALL (LENGTH |obs|) |i| (QREFELT $ 10)))
                          . #21#)
                    (LETT |verts| (SPADCALL |verts| |o| (QREFELT $ 13)) . #21#)
                    (EXIT
                     (SEQ (LETT |arrNum| NIL . #21#)
                          (LETT #2# (SPADCALL |tab| |i| (QREFELT $ 33)) . #21#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |arrNum| (CAR #2#) . #21#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |a| (VECTOR "a" 0 |i| |arrNum| 0 0 NIL)
                                 . #21#)
                           (EXIT
                            (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 20))
                                  . #21#)))
                          (LETT #2# (CDR #2#) . #21#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT |i| (|inc_SI| |i|) . #21#))
                         . #21#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |verts| |ars|))))) 

(SDEFUN |DGRPH;addObject!;$S$;8| ((|s| $) (|n| S) ($ $))
        (SPROG
         ((|obj|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) . #1=(|DGRPH;addObject!;$S$;8|))
              (LETT |obj| (VECTOR |n| 0 0) . #1#)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 48))
                (PROGN (RPLACA |s| (LIST |obj|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |obj| (QREFELT $ 13)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |DGRPH;addObject!;$R$;9|
        ((|s| $)
         (|n| |Record| (|:| |value| S) (|:| |posX| #1=(|NonNegativeInteger|))
          (|:| |posY| #1#))
         ($ $))
        (SPROG
         ((|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) |DGRPH;addObject!;$R$;9|)
              (COND
               ((SPADCALL |obs| NIL (QREFELT $ 48))
                (PROGN (RPLACA |s| (LIST |n|)) (QCAR |s|)))
               ('T
                (PROGN
                 (RPLACA |s| (SPADCALL |obs| |n| (QREFELT $ 13)))
                 (QCAR |s|))))
              (EXIT |s|)))) 

(SDEFUN |DGRPH;addArrow!;$S2Nni$;10|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) ($ $))
        (SPROG
         ((#2=#:G984 NIL)
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
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|DGRPH;addArrow!;$S2Nni$;10|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 NIL) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 51))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G983)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 20)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |DGRPH;addArrow!;$S2NniL$;11|
        ((|s| $) (|nm| |String|) (|n1| . #1=(|NonNegativeInteger|))
         (|n2| . #1#) (|mp| |List| #1#) ($ $))
        (SPROG
         ((#2=#:G992 NIL)
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
           (SEQ (LETT |arrss| (QCDR |s|) . #3=(|DGRPH;addArrow!;$S2NniL$;11|))
                (LETT |a| (VECTOR |nm| 0 |n1| |n2| 0 0 |mp|) . #3#)
                (EXIT
                 (COND
                  ((SPADCALL |arrss| NIL (QREFELT $ 51))
                   (SEQ (PROGN (RPLACD |s| (LIST |a|)) (QCDR |s|))
                        (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4=#:G991)))))
                  ('T
                   (SEQ
                    (LETT |arrs| (SPADCALL |arrss| |a| (QREFELT $ 20)) . #3#)
                    (PROGN (RPLACD |s| |arrs|) (QCDR |s|))
                    (EXIT (PROGN (LETT #2# |s| . #3#) (GO #4#)))))))))
          #4# (EXIT #2#)))) 

(PUT '|DGRPH;getVertices;$L;12| '|SPADreplace| 'QCAR) 

(SDEFUN |DGRPH;getVertices;$L;12|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                    (|:| |posY| (|NonNegativeInteger|)))))
        (QCAR |s|)) 

(PUT '|DGRPH;getArrows;$L;13| '|SPADreplace| 'QCDR) 

(SDEFUN |DGRPH;getArrows;$L;13|
        ((|s| $)
         ($ |List|
          (|Record| (|:| |name| (|String|))
                    (|:| |arrType| (|NonNegativeInteger|))
                    (|:| |fromOb| (|NonNegativeInteger|))
                    (|:| |toOb| (|NonNegativeInteger|))
                    (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                    (|:| |map| (|List| (|NonNegativeInteger|))))))
        (QCDR |s|)) 

(SDEFUN |DGRPH;flatten;Dg$;14| ((|n| |DirectedGraph| $) ($ $))
        (SPROG
         ((|a|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|arr|
           #1=(|Record| (|:| |name| #2=(|String|))
                        (|:| |arrType| #3=(|NonNegativeInteger|))
                        (|:| |fromOb| (|NonNegativeInteger|))
                        (|:| |toOb| (|NonNegativeInteger|))
                        (|:| |xOffset| #4=(|Integer|))
                        (|:| |yOffset| #5=(|Integer|))
                        (|:| |map| #6=(|List| (|NonNegativeInteger|)))))
          (|toOb3| #7=(|NonNegativeInteger|)) (|fromOb3| #7#) (#8=#:G1022 NIL)
          (|endi| NIL) (#9=#:G1023 NIL) (|starti| NIL) (|map3| #6#)
          (|yOffset3| #5#) (|xOffset3| #4#) (|arrType3| #3#) (|name3| #2#)
          (#10=#:G1021 NIL) (|oa3| NIL)
          (|outerArrows|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|map2| #6#) (|yOffset2| #5#) (|xOffset2| #4#) (|toOb2| #7#)
          (|fromOb2| #7#) (|arrType2| #3#) (|name2| #2#) (#11=#:G1020 NIL)
          (|a3| NIL) (#12=#:G1018 NIL) (|a2| NIL) (#13=#:G1019 NIL) (|a2n| NIL)
          (|iv|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|offset| (|NonNegativeInteger|))
          (|offsets| (|List| (|NonNegativeInteger|)))
          (|innerArrows| (|List| (|List| #1#)))
          (|ina|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|innerValues|
           (|List|
            #14=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                          (|:| |posY| (|NonNegativeInteger|)))))
          (|obs2|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|ob2| #14#) (|py| #7#) (|px| #7#) (#15=#:G1017 NIL) (|ob| NIL)
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|v3| ($)) (#16=#:G1016 NIL) (|v2| NIL)
          (|v|
           (|List|
            (|Record| (|:| |value| $) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |v| (SPADCALL |n| (QREFELT $ 60))
                . #17=(|DGRPH;flatten;Dg$;14|))
          (LETT |innerValues| NIL . #17#) (LETT |offset| 0 . #17#)
          (LETT |offsets| NIL . #17#) (LETT |innerArrows| NIL . #17#)
          (SEQ (LETT |v2| NIL . #17#) (LETT #16# |v| . #17#) G190
               (COND
                ((OR (ATOM #16#) (PROGN (LETT |v2| (CAR #16#) . #17#) NIL))
                 (GO G191)))
               (SEQ (LETT |v3| (QVELT |v2| 0) . #17#)
                    (LETT |obs| (SPADCALL |v3| (QREFELT $ 55)) . #17#)
                    (LETT |obs2| NIL . #17#)
                    (SEQ (LETT |ob| NIL . #17#) (LETT #15# |obs| . #17#) G190
                         (COND
                          ((OR (ATOM #15#)
                               (PROGN (LETT |ob| (CAR #15#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |px|
                                (+ (QVELT |ob| 1)
                                   (SPADCALL 4 (QVELT |v2| 1) (QREFELT $ 62)))
                                . #17#)
                          (LETT |py|
                                (+ (QVELT |ob| 2)
                                   (SPADCALL 4 (QVELT |v2| 2) (QREFELT $ 62)))
                                . #17#)
                          (LETT |ob2| (VECTOR (QVELT |ob| 0) |px| |py|) . #17#)
                          (EXIT
                           (LETT |obs2| (SPADCALL |obs2| |ob2| (QREFELT $ 13))
                                 . #17#)))
                         (LETT #15# (CDR #15#) . #17#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |innerValues|
                          (SPADCALL |innerValues| |obs2| (QREFELT $ 63))
                          . #17#)
                    (LETT |ina| (SPADCALL |v3| (QREFELT $ 56)) . #17#)
                    (LETT |innerArrows|
                          (SPADCALL |innerArrows| |ina| (QREFELT $ 65)) . #17#)
                    (LETT |offsets|
                          (SPADCALL |offsets| |offset| (QREFELT $ 66)) . #17#)
                    (EXIT (LETT |offset| (+ |offset| (LENGTH |obs|)) . #17#)))
               (LETT #16# (CDR #16#) . #17#) (GO G190) G191 (EXIT NIL))
          (LETT |iv| |innerValues| . #17#) (LETT |a| NIL . #17#)
          (SEQ (LETT |a2n| 1 . #17#) (LETT #13# (LENGTH |innerArrows|) . #17#)
               (LETT |a2| NIL . #17#) (LETT #12# |innerArrows| . #17#) G190
               (COND
                ((OR (ATOM #12#) (PROGN (LETT |a2| (CAR #12#) . #17#) NIL)
                     (|greater_SI| |a2n| #13#))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |a3| NIL . #17#) (LETT #11# |a2| . #17#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |a3| (CAR #11#) . #17#) NIL))
                        (GO G191)))
                      (SEQ (LETT |name2| (QVELT |a3| 0) . #17#)
                           (LETT |arrType2| (QVELT |a3| 1) . #17#)
                           (LETT |fromOb2|
                                 (+ (QVELT |a3| 2)
                                    (SPADCALL |offsets| |a2n| (QREFELT $ 35)))
                                 . #17#)
                           (LETT |toOb2|
                                 (+ (QVELT |a3| 3)
                                    (SPADCALL |offsets| |a2n| (QREFELT $ 35)))
                                 . #17#)
                           (LETT |xOffset2| (QVELT |a3| 4) . #17#)
                           (LETT |yOffset2| (QVELT |a3| 5) . #17#)
                           (LETT |map2| (QVELT |a3| 6) . #17#)
                           (LETT |arr|
                                 (VECTOR |name2| |arrType2| |fromOb2| |toOb2|
                                         |xOffset2| |yOffset2| |map2|)
                                 . #17#)
                           (EXIT
                            (LETT |a| (SPADCALL |a| |arr| (QREFELT $ 20))
                                  . #17#)))
                      (LETT #11# (CDR #11#) . #17#) (GO G190) G191
                      (EXIT NIL))))
               (LETT #12#
                     (PROG1 (CDR #12#) (LETT |a2n| (|inc_SI| |a2n|) . #17#))
                     . #17#)
               (GO G190) G191 (EXIT NIL))
          (LETT |outerArrows| (SPADCALL |n| (QREFELT $ 67)) . #17#)
          (SEQ (LETT |oa3| NIL . #17#) (LETT #10# |outerArrows| . #17#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |oa3| (CAR #10#) . #17#) NIL))
                 (GO G191)))
               (SEQ (LETT |name3| (QVELT |oa3| 0) . #17#)
                    (LETT |arrType3| (QVELT |oa3| 1) . #17#)
                    (LETT |fromOb3|
                          (+
                           (SPADCALL |offsets| (QVELT |oa3| 2) (QREFELT $ 35))
                           1)
                          . #17#)
                    (LETT |toOb3|
                          (+
                           (SPADCALL |offsets| (QVELT |oa3| 3) (QREFELT $ 35))
                           1)
                          . #17#)
                    (LETT |xOffset3| (QVELT |oa3| 4) . #17#)
                    (LETT |yOffset3| (QVELT |oa3| 5) . #17#)
                    (LETT |map3| (QVELT |oa3| 6) . #17#)
                    (EXIT
                     (SEQ (LETT |starti| 1 . #17#)
                          (LETT #9# (SPADCALL |map3| (QREFELT $ 34)) . #17#)
                          (LETT |endi| NIL . #17#) (LETT #8# |map3| . #17#)
                          G190
                          (COND
                           ((OR (ATOM #8#)
                                (PROGN (LETT |endi| (CAR #8#) . #17#) NIL)
                                (|greater_SI| |starti| #9#))
                            (GO G191)))
                          (SEQ
                           (LETT |fromOb3|
                                 (+
                                  (SPADCALL |offsets| (QVELT |oa3| 2)
                                            (QREFELT $ 35))
                                  |starti|)
                                 . #17#)
                           (LETT |toOb3|
                                 (+
                                  (SPADCALL |offsets| (QVELT |oa3| 3)
                                            (QREFELT $ 35))
                                  |endi|)
                                 . #17#)
                           (LETT |arr|
                                 (VECTOR |name3| |arrType3| |fromOb3| |toOb3|
                                         |xOffset3| |yOffset3| NIL)
                                 . #17#)
                           (EXIT
                            (LETT |a| (SPADCALL |a| |arr| (QREFELT $ 20))
                                  . #17#)))
                          (LETT #8#
                                (PROG1 (CDR #8#)
                                  (LETT |starti| (|inc_SI| |starti|) . #17#))
                                . #17#)
                          (GO G190) G191 (EXIT NIL))))
               (LETT #10# (CDR #10#) . #17#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |iv| |a|))))) 

(PUT '|DGRPH;initial;$;15| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |DGRPH;initial;$;15| (($ $)) (CONS NIL NIL)) 

(SDEFUN |DGRPH;terminal;S$;16| ((|a| S) ($ $))
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
         (SEQ (LETT |o| (VECTOR |a| 0 0) . #1=(|DGRPH;terminal;S$;16|))
              (LETT |ar| (VECTOR "loop" 0 1 1 0 0 NIL) . #1#)
              (EXIT (CONS (LIST |o|) (LIST |ar|)))))) 

(SDEFUN |DGRPH;cycleOpen;LS$;17|
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
          (|o| #2#) (#3=#:G1040 NIL) (|ob| NIL) (#4=#:G1041 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|DGRPH;cycleOpen;LS$;17|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)
                    (LETT |next| (+ |obn| 1) . #5#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| |obn| . #5#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 72))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #5#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 20)) . #5#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;cycleClosed;LS$;18|
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
          (|o| #2#) (#3=#:G1051 NIL) (|ob| NIL) (#4=#:G1052 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|DGRPH;cycleClosed;LS$;18|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)
                    (LETT |next| (+ |obn| 1) . #5#)
                    (COND
                     ((EQL (- |next| 1) (LENGTH |objs|))
                      (LETT |next| 1 . #5#)))
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |objs|) (QREFELT $ 72))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |next| 0 0 NIL)
                              . #5#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 20)) . #5#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #5#)))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;unit;LS$;19| ((|objs| |List| S) (|arrowName| |String|) ($ $))
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
          (|o| #2#) (#3=#:G1059 NIL) (|ob| NIL) (#4=#:G1060 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #5=(|DGRPH;unit;LS$;19|))
              (LETT |ars| NIL . #5#) (LETT |arn| 1 . #5#)
              (SEQ (LETT |obn| 1 . #5#) (LETT #4# (LENGTH |objs|) . #5#)
                   (LETT |ob| NIL . #5#) (LETT #3# |objs| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |ob| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |obn| #4#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #5#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #5#)
                    (LETT |a|
                          (VECTOR (STRCONC |arrowName| (STRINGIMAGE |arn|)) 0
                                  |obn| |obn| 0 0 NIL)
                          . #5#)
                    (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 20)) . #5#)
                    (EXIT (LETT |arn| (+ |arn| 1) . #5#)))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |obn| (|inc_SI| |obn|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;kgraph;LS$;20| ((|objs| |List| S) (|arrowName| |String|) ($ $))
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
          (|a| #1#) (#2=#:G1072 NIL) (|obm| NIL)
          (|obs|
           (|List|
            #3=(|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                         (|:| |posY| (|NonNegativeInteger|)))))
          (|o| #3#) (#4=#:G1070 NIL) (|ob| NIL) (#5=#:G1071 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #6=(|DGRPH;kgraph;LS$;20|))
              (LETT |ars| NIL . #6#) (LETT |arn| 1 . #6#)
              (SEQ (LETT |obn| 1 . #6#) (LETT #5# (LENGTH |objs|) . #6#)
                   (LETT |ob| NIL . #6#) (LETT #4# |objs| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |ob| (CAR #4#) . #6#) NIL)
                         (|greater_SI| |obn| #5#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 9))
                                  (SPADCALL (LENGTH |objs|) |obn|
                                            (QREFELT $ 10)))
                          . #6#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #6#)
                    (EXIT
                     (SEQ (LETT |obm| 1 . #6#) (LETT #2# (LENGTH |objs|) . #6#)
                          G190 (COND ((|greater_SI| |obm| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |obn| |obm| (QREFELT $ 76))
                              (SEQ
                               (LETT |a|
                                     (VECTOR
                                      (STRCONC |arrowName| (STRINGIMAGE |arn|))
                                      0 |obn| |obm| 0 0 NIL)
                                     . #6#)
                               (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 20))
                                     . #6#)
                               (EXIT (LETT |arn| (+ |arn| 1) . #6#)))))))
                          (LETT |obm| (|inc_SI| |obm|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #4#
                         (PROG1 (CDR #4#) (LETT |obn| (|inc_SI| |obn|) . #6#))
                         . #6#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(SDEFUN |DGRPH;+;3$;21| ((|a| $) (|b| $) ($ $))
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
          (|arr| #1#) (#2=#:G1080 NIL) (|ba| NIL)
          (|bStart| (|NonNegativeInteger|))
          (|lo|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lo| (SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 63))
                . #3=(|DGRPH;+;3$;21|))
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
                              (QVELT |ba| 5) NIL)
                      . #3#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 20)) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 78)) . #3#)
          (EXIT (CONS |lo| |la|))))) 

(SDEFUN |DGRPH;merge;3$;22| ((|a| $) (|b| $) ($ $))
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
          (#3=#:G1101 NIL) (|ba| NIL) (|bStart| #4=(|NonNegativeInteger|))
          (|bmap| (|List| (|NonNegativeInteger|))) (#5=#:G1089 NIL)
          (|newIndex| #4#)
          (|mergedObjects|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|i| (|Integer|)) (#6=#:G1100 NIL) (|bob| NIL) (#7=#:G1099 NIL)
          (|x| NIL) (#8=#:G1098 NIL))
         (SEQ
          (LETT |bmap|
                (PROGN
                 (LETT #8# NIL . #9=(|DGRPH;merge;3$;22|))
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
               (SEQ (LETT |i| (SPADCALL |bob| (QCAR |a|) (QREFELT $ 80)) . #9#)
                    (EXIT
                     (COND
                      ((< |i| 1)
                       (SEQ
                        (LETT |mergedObjects|
                              (SPADCALL |mergedObjects| |bob| (QREFELT $ 13))
                              . #9#)
                        (LETT |newIndex| (+ |newIndex| 1) . #9#)
                        (EXIT
                         (LETT |bmap|
                               (SPADCALL |bmap| |newIndex| (QREFELT $ 66))
                               . #9#))))
                      ('T
                       (LETT |bmap|
                             (SPADCALL |bmap|
                                       (PROG1 (LETT #5# |i| . #9#)
                                         (|check_subtype2| (>= #5# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #5#))
                                       (QREFELT $ 66))
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
                                (QREFELT $ 35))
                      . #9#)
                (LETT |fromI|
                      (SPADCALL |bmap| (+ (QVELT |ba| 2) |bStart|)
                                (QREFELT $ 35))
                      . #9#)
                (LETT |arr|
                      (VECTOR (QVELT |ba| 0) (QVELT |ba| 1) |fromI| |toI|
                              (QVELT |ba| 4) (QVELT |ba| 5) (QVELT |ba| 6))
                      . #9#)
                (EXIT (LETT |lb| (SPADCALL |lb| |arr| (QREFELT $ 20)) . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (LETT |la| (SPADCALL (QCDR |a|) |lb| (QREFELT $ 78)) . #9#)
          (EXIT (CONS |mergedObjects| |la|))))) 

(SDEFUN |DGRPH;objProd|
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
          (|bxi| #3=(|NonNegativeInteger|)) (|bi| (S)) (#4=#:G1112 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #3#) (|ai| (S)) (#5=#:G1111 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|DGRPH;objProd|))
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
                                             (SPADCALL |a| (QREFELT $ 82)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 83)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 82))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 83)) . #6#)
                                   (LETT |sp|
                                         (SPADCALL |ai| |bi| (QREFELT $ 85))
                                         . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 88))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |DGRPH;indexProd|
        ((|aObj| $) (|a| |NonNegativeInteger|) (|b| |NonNegativeInteger|)
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G1113 NIL))
               (+ |a|
                  (*
                   (PROG1 (LETT #1# (- |b| 1) |DGRPH;indexProd|)
                     (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #1#))
                   (LENGTH (QCAR |aObj|)))))) 

(SDEFUN |DGRPH;*;2$Dg;25| ((|a| $) (|b| $) ($ |DirectedGraph| (|Product| S S)))
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G1135 NIL) (|bv| NIL)
          (#3=#:G1134 NIL) (|bu| NIL) (#4=#:G1133 NIL) (|av| NIL)
          (#5=#:G1132 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;*;2$Dg;25|))
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
                                                      (QREFELT $ 89))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 89))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          90))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          90)))
                                                      (QREFELT $ 92))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 20))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 94)))))) 

(SDEFUN |DGRPH;cartesian;2$Dg;26|
        ((|a| $) (|b| $) ($ |DirectedGraph| (|Product| S S)))
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G1160 NIL) (|bv| NIL)
          (#3=#:G1159 NIL) (|bu| NIL) (#4=#:G1158 NIL) (|av| NIL)
          (#5=#:G1157 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;cartesian;2$Dg;26|))
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
                                                        (QREFELT $ 89))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            89))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              90))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 92)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              90))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 92)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            90))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 92))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 20))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 89))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              89))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 90))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 92)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 90))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 92)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              90))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 92))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|DGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|DGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           20))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 89))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            89))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              90))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 92)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              90))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 92)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            90))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 92))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 20))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;objProd| |a| |b| $) |newArrs|
                         (QREFELT $ 94)))))) 

(SDEFUN |DGRPH;closedObjProd|
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
          (|x| #3#) (|byi| #2#) (|bxi| #1#) (|bi| (S)) (#4=#:G1169 NIL)
          (|boi| NIL) (|ayi| #2#) (|axi| #1#) (|ai| (S)) (#5=#:G1168 NIL)
          (|aoi| NIL))
         (SEQ (LETT |newObjs| NIL . #6=(|DGRPH;closedObjProd|))
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
                                             (SPADCALL |a| (QREFELT $ 82)))
                                          |axi|)
                                         . #6#)
                                   (LETT |y|
                                         (+
                                          (* |byi|
                                             (SPADCALL |a| (QREFELT $ 83)))
                                          |ayi|)
                                         . #6#)
                                   (LETT |widtha| (SPADCALL |a| (QREFELT $ 82))
                                         . #6#)
                                   (LETT |heighta|
                                         (SPADCALL |a| (QREFELT $ 83)) . #6#)
                                   (LETT |sp| (SPADCALL |ai| |bi| |f|) . #6#)
                                   (LETT |ob| (VECTOR |sp| |x| |y|) . #6#)
                                   (EXIT
                                    (LETT |newObjs|
                                          (SPADCALL |newObjs| |ob|
                                                    (QREFELT $ 13))
                                          . #6#)))
                              (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                              (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |newObjs|)))) 

(SDEFUN |DGRPH;closedTensor;2$M$;28|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G1190 NIL) (|bv| NIL)
          (#3=#:G1189 NIL) (|bu| NIL) (#4=#:G1188 NIL) (|av| NIL)
          (#5=#:G1187 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;closedTensor;2$M$;28|))
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
                                                      (QREFELT $ 89))
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 89))
                                              (SEQ
                                               (LETT |an|
                                                     (SPADCALL
                                                      (LIST
                                                       (SPADCALL |a| |au| |av|
                                                                 (QREFELT $
                                                                          90))
                                                       "*"
                                                       (SPADCALL |b| |bu| |bv|
                                                                 (QREFELT $
                                                                          90)))
                                                      (QREFELT $ 92))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 20))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 19)))))) 

(SDEFUN |DGRPH;closedCartesian;2$M$;29|
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
          (|arr| #1#) (|an| (|String|)) (#2=#:G1216 NIL) (|bv| NIL)
          (#3=#:G1215 NIL) (|bu| NIL) (#4=#:G1214 NIL) (|av| NIL)
          (#5=#:G1213 NIL) (|au| NIL))
         (SEQ (LETT |newArrs| NIL . #6=(|DGRPH;closedCartesian;2$M$;29|))
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
                                                        (QREFELT $ 89))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            89))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              90))
                                                           #7="#"
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 92)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              90))
                                                           #8="#"
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 92)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            90))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 92))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 20))
                                                      . #6#))))
                                             ((EQL |au| |av|)
                                              (COND
                                               ((SPADCALL |b| |bu| |bv|
                                                          (QREFELT $ 89))
                                                (SEQ
                                                 (LETT |an|
                                                       (COND
                                                        ((EQL |bu| |bv|)
                                                         (COND
                                                          ((SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              89))
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |a| |au|
                                                                       |av|
                                                                       (QREFELT
                                                                        $ 90))
                                                             #7#
                                                             (STRINGIMAGE
                                                              |bv|))
                                                            (QREFELT $ 92)))
                                                          ('T
                                                           (SPADCALL
                                                            (LIST
                                                             (SPADCALL |b| |bu|
                                                                       |bv|
                                                                       (QREFELT
                                                                        $ 90))
                                                             #8#
                                                             (STRINGIMAGE
                                                              |av|))
                                                            (QREFELT $ 92)))))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              90))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 92))))
                                                       . #6#)
                                                 (LETT |arr|
                                                       (VECTOR |an| 0
                                                               (|DGRPH;indexProd|
                                                                |b| |bu| |au|
                                                                $)
                                                               (|DGRPH;indexProd|
                                                                |b| |bv| |av|
                                                                $)
                                                               0 0 NIL)
                                                       . #6#)
                                                 (EXIT
                                                  (LETT |newArrs|
                                                        (SPADCALL |newArrs|
                                                                  |arr|
                                                                  (QREFELT $
                                                                           20))
                                                        . #6#))))))))
                                           ((EQL |au| |av|)
                                            (COND
                                             ((SPADCALL |b| |bu| |bv|
                                                        (QREFELT $ 89))
                                              (SEQ
                                               (LETT |an|
                                                     (COND
                                                      ((EQL |bu| |bv|)
                                                       (COND
                                                        ((SPADCALL |a| |au|
                                                                   |av|
                                                                   (QREFELT $
                                                                            89))
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |a| |au|
                                                                     |av|
                                                                     (QREFELT $
                                                                              90))
                                                           #7#
                                                           (STRINGIMAGE |bv|))
                                                          (QREFELT $ 92)))
                                                        ('T
                                                         (SPADCALL
                                                          (LIST
                                                           (SPADCALL |b| |bu|
                                                                     |bv|
                                                                     (QREFELT $
                                                                              90))
                                                           #8#
                                                           (STRINGIMAGE |av|))
                                                          (QREFELT $ 92)))))
                                                      ('T
                                                       (SPADCALL
                                                        (LIST
                                                         (SPADCALL |b| |bu|
                                                                   |bv|
                                                                   (QREFELT $
                                                                            90))
                                                         #8#
                                                         (STRINGIMAGE |av|))
                                                        (QREFELT $ 92))))
                                                     . #6#)
                                               (LETT |arr|
                                                     (VECTOR |an| 0
                                                             (|DGRPH;indexProd|
                                                              |b| |bu| |au| $)
                                                             (|DGRPH;indexProd|
                                                              |b| |bv| |av| $)
                                                             0 0 NIL)
                                                     . #6#)
                                               (EXIT
                                                (LETT |newArrs|
                                                      (SPADCALL |newArrs| |arr|
                                                                (QREFELT $ 20))
                                                      . #6#)))))))))
                                        (LETT |bv| (|inc_SI| |bv|) . #6#)
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |bu| (|inc_SI| |bu|) . #6#) (GO G190)
                                 G191 (EXIT NIL))))
                          (LETT |av| (|inc_SI| |av|) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |au| (|inc_SI| |au|) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (|DGRPH;closedObjProd| |a| |b| |f| $) |newArrs|
                         (QREFELT $ 19)))))) 

(SDEFUN |DGRPH;~;2$;30| ((|s| $) ($ $))
        (SPROG
         ((|newArrs|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|newArr|
           (|Record| (|:| |name| (|String|))
                     (|:| |arrType| (|NonNegativeInteger|))
                     (|:| |fromOb| (|NonNegativeInteger|))
                     (|:| |toOb| (|NonNegativeInteger|))
                     (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                     (|:| |map| (|List| (|NonNegativeInteger|)))))
          (#1=#:G1227 NIL) (|j| NIL) (#2=#:G1226 NIL) (|i| NIL)
          (|ars|
           (|List|
            (|Record| (|:| |name| (|String|))
                      (|:| |arrType| (|NonNegativeInteger|))
                      (|:| |fromOb| (|NonNegativeInteger|))
                      (|:| |toOb| (|NonNegativeInteger|))
                      (|:| |xOffset| (|Integer|)) (|:| |yOffset| (|Integer|))
                      (|:| |map| (|List| (|NonNegativeInteger|))))))
          (|obs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|))))))
         (SEQ (LETT |obs| (QCAR |s|) . #3=(|DGRPH;~;2$;30|))
              (LETT |ars| (QCDR |s|) . #3#) (LETT |newArrs| NIL . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT #2# (LENGTH |obs|) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1 . #3#) (LETT #1# (LENGTH |obs|) . #3#)
                          G190 (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL (SPADCALL |s| |i| |j| (QREFELT $ 89)))
                              (SEQ
                               (LETT |newArr|
                                     (VECTOR
                                      (STRCONC (STRINGIMAGE |i|)
                                               (STRINGIMAGE |j|))
                                      0 |i| |j| 0 0 NIL)
                                     . #3#)
                               (EXIT
                                (LETT |newArrs|
                                      (SPADCALL |newArrs| |newArr|
                                                (QREFELT $ 20))
                                      . #3#)))))))
                          (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |newArrs|))))) 

(SDEFUN |DGRPH;map;$LL2I$;31|
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
          (|newArr| #2#) (#3=#:G1244 NIL) (|oldArrow| NIL) (#4=#:G1232 NIL)
          (#5=#:G1231 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G1243 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G1242 NIL) (|o| NIL) (#8=#:G1241 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|DGRPH;map;$LL2I$;31|))
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
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 35)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 101))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 101))
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
                                                      (QREFELT $ 101))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 102))))
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
                                        (QREFELT $ 35))
                              (SPADCALL |m| (QVELT |oldArrow| 3)
                                        (QREFELT $ 35))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 20))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |DGRPH;mapContra;$LL2I$;32|
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
          (|newArr| #2#) (#3=#:G1261 NIL) (|oldArrow| NIL) (#4=#:G1249 NIL)
          (#5=#:G1248 NIL) (|i| (|NonNegativeInteger|)) (#6=#:G1260 NIL)
          (|oi| NIL)
          (|newObjs|
           (|List|
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (#7=#:G1259 NIL) (|o| NIL) (#8=#:G1258 NIL))
         (SEQ
          (LETT |newObjs|
                (PROGN
                 (LETT #8# NIL . #9=(|DGRPH;mapContra;$LL2I$;32|))
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
               (SEQ (LETT |i| (SPADCALL |m| |oi| (QREFELT $ 35)) . #9#)
                    (EXIT
                     (SPADCALL |newObjs| |i|
                               (VECTOR
                                (QVELT (SPADCALL |newObjs| |i| (QREFELT $ 101))
                                       0)
                                (PROG1
                                    (LETT #5#
                                          (+
                                           (QVELT
                                            (SPADCALL (QCAR |s|) |oi|
                                                      (QREFELT $ 101))
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
                                                      (QREFELT $ 101))
                                            2)
                                           |offsetY|)
                                          . #9#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                               (QREFELT $ 102))))
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
                                        (QREFELT $ 35))
                              (SPADCALL |m| (QVELT |oldArrow| 2)
                                        (QREFELT $ 35))
                              (QVELT |oldArrow| 4) (QVELT |oldArrow| 5)
                              (QVELT |oldArrow| 6))
                      . #9#)
                (EXIT
                 (LETT |newArrs| (SPADCALL |newArrs| |newArr| (QREFELT $ 20))
                       . #9#)))
               (LETT #3# (CDR #3#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |newObjs| |newArrs|))))) 

(SDEFUN |DGRPH;coerce;Pg$;33| ((|pg| |PermutationGroup| S) ($ $))
        (SPADCALL (SPADCALL |pg| (QREFELT $ 106)) (QREFELT $ 46))) 

(SDEFUN |DGRPH;coerce;Fp$;34| ((|poset| |FinitePoset| S) ($ $))
        (SPADCALL |poset| (QREFELT $ 29))) 

(SDEFUN |DGRPH;coerce;L$;35| ((|lst| |List| S) ($ $))
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
            (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                      (|:| |posY| (|NonNegativeInteger|)))))
          (|o|
           (|Record| (|:| |value| S) (|:| |posX| (|NonNegativeInteger|))
                     (|:| |posY| (|NonNegativeInteger|))))
          (#2=#:G1270 NIL) (|ob| NIL) (#3=#:G1271 NIL) (|obn| NIL))
         (SEQ (LETT |obs| NIL . #4=(|DGRPH;coerce;L$;35|))
              (LETT |ars| NIL . #4#) (LETT |arn| 1 . #4#)
              (SEQ (LETT |obn| 1 . #4#) (LETT #3# (LENGTH |lst|) . #4#)
                   (LETT |ob| NIL . #4#) (LETT #2# |lst| . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |ob| (CAR #2#) . #4#) NIL)
                         (|greater_SI| |obn| #3#))
                     (GO G191)))
                   (SEQ
                    (LETT |o|
                          (VECTOR |ob|
                                  (SPADCALL (LENGTH |lst|) |obn| (QREFELT $ 9))
                                  (SPADCALL (LENGTH |lst|) |obn|
                                            (QREFELT $ 10)))
                          . #4#)
                    (LETT |obs| (SPADCALL |obs| |o| (QREFELT $ 13)) . #4#)
                    (LETT |next| (+ |obn| 1) . #4#)
                    (EXIT
                     (COND
                      ((SPADCALL |next| (LENGTH |lst|) (QREFELT $ 72))
                       (SEQ
                        (LETT |a|
                              (VECTOR (STRCONC "a" (STRINGIMAGE |arn|)) 0 |obn|
                                      |next| 0 0 NIL)
                              . #4#)
                        (LETT |ars| (SPADCALL |ars| |a| (QREFELT $ 20)) . #4#)
                        (EXIT (LETT |arn| (+ |arn| 1) . #4#)))))))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |obn| (|inc_SI| |obn|) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |obs| |ars|))))) 

(DECLAIM (NOTINLINE |DirectedGraph;|)) 

(DEFUN |DirectedGraph| (#1=#:G1274)
  (SPROG NIL
         (PROG (#2=#:G1275)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DirectedGraph|)
                                               '|domainEqualList|)
                    . #3=(|DirectedGraph|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DirectedGraph;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectedGraph|)))))))))) 

(DEFUN |DirectedGraph;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|DirectedGraph|))
          (LETT |dv$| (LIST '|DirectedGraph| DV$1) . #1#)
          (LETT $ (GETREFV 120) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|DirectedGraph| (LIST DV$1)
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

(MAKEPROP '|DirectedGraph| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) (0 . |createX|) (6 . |createY|)
              (|Record| (|:| |value| 6) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 11) (12 . |concat|) (|List| 6) |DGRPH;directedGraph;L$;1|
              |DGRPH;directedGraph;L$;2|
              (|Record| (|:| |name| 52) (|:| |arrType| 8) (|:| |fromOb| 8)
                        (|:| |toOb| 8) (|:| |xOffset| 31) (|:| |yOffset| 31)
                        (|:| |map| 30))
              (|List| 17) |DGRPH;directedGraph;LL$;3| (18 . |concat|)
              (|Record| (|:| |fromOb| 8) (|:| |toOb| 8)) (|List| 21)
              |DGRPH;directedGraph;LL$;4| (|FinitePoset| 6) (24 . |getVert|)
              (|List| (|List| 47)) (29 . |getArr|) (34 . |concat|)
              |DGRPH;directedGraph;Fp$;5| (|List| 8) (|Integer|) (|List| 30)
              (40 . |elt|) (46 . |#|) (51 . |elt|) |DGRPH;directedGraph;LL$;6|
              (|Record| (|:| |preimage| 14) (|:| |image| 14)) (|Permutation| 6)
              (57 . |listRepresentation|) (62 . |One|) (66 . |position|)
              (72 . |concat|) (78 . |elt|) (84 . |setelt!|) (|List| 38)
              |DGRPH;directedGraph;L$;7| (|Boolean|) (91 . =)
              |DGRPH;addObject!;$S$;8| |DGRPH;addObject!;$R$;9| (97 . =)
              (|String|) |DGRPH;addArrow!;$S2Nni$;10|
              |DGRPH;addArrow!;$S2NniL$;11| |DGRPH;getVertices;$L;12|
              |DGRPH;getArrows;$L;13|
              (|Record| (|:| |value| $$) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 57) (|DirectedGraph| $$) (103 . |getVertices|)
              (|PositiveInteger|) (108 . *) (114 . |concat|) (|List| 18)
              (120 . |concat|) (126 . |concat|) (132 . |getArrows|)
              (|DirectedGraph| $) |DGRPH;flatten;Dg$;14| |DGRPH;initial;$;15|
              |DGRPH;terminal;S$;16| (137 . <=) |DGRPH;cycleOpen;LS$;17|
              |DGRPH;cycleClosed;LS$;18| |DGRPH;unit;LS$;19| (143 . ~=)
              |DGRPH;kgraph;LS$;20| (149 . |concat|) |DGRPH;+;3$;21|
              (155 . |position|) |DGRPH;merge;3$;22| (161 . |diagramWidth|)
              (166 . |diagramHeight|) (|Product| 6 6) (171 . |construct|)
              (|Record| (|:| |value| 84) (|:| |posX| 8) (|:| |posY| 8))
              (|List| 86) (177 . |concat|) (183 . |isDirectSuccessor?|)
              (190 . |arrowName|) (|List| $) (197 . |concat|)
              (|DirectedGraph| 84) (202 . |directedGraph|) |DGRPH;*;2$Dg;25|
              |DGRPH;cartesian;2$Dg;26| (|Mapping| 6 6 6)
              |DGRPH;closedTensor;2$M$;28| |DGRPH;closedCartesian;2$M$;29|
              |DGRPH;~;2$;30| (208 . |elt|) (214 . |setelt!|)
              |DGRPH;map;$LL2I$;31| |DGRPH;mapContra;$LL2I$;32|
              (|PermutationGroup| 6) (221 . |coerce|) |DGRPH;coerce;Pg$;33|
              |DGRPH;coerce;Fp$;34| |DGRPH;coerce;L$;35| (|Void|)
              (|Scene| (|SCartesian| '2)) (|Matrix| 31) (|Matrix| 8)
              (|List| (|Loop|)) (|List| 116) (|Tree| 31) (|SingleInteger|)
              (|OutputForm|) (|HashState|))
           '#(~= 226 ~ 232 |unit| 237 |terminal| 243 |subdiagramSvg| 248
              |spanningTreeNode| 256 |spanningTreeArrow| 262
              |spanningForestNode| 268 |spanningForestArrow| 273 |routeNodes|
              278 |routeArrows| 285 |outDegree| 292 |nodeToNode| 298
              |nodeToArrow| 304 |nodeFromNode| 310 |nodeFromArrow| 316 |min|
              322 |merge| 333 |max| 339 |mapContra| 350 |map| 359 |looseEquals|
              368 |loopsNodes| 374 |loopsAtNode| 379 |loopsArrows| 385 |latex|
              390 |laplacianMatrix| 395 |kgraph| 400 |isGreaterThan?| 406
              |isFunctional?| 413 |isFixPoint?| 418 |isDirected?| 424
              |isDirectSuccessor?| 428 |isAcyclic?| 435 |initial| 440
              |incidenceMatrix| 444 |inDegree| 449 |hashUpdate!| 455 |hash| 461
              |getVertices| 466 |getVertexIndex| 471 |getArrows| 477
              |getArrowIndex| 482 |flatten| 489 |distanceMatrix| 494 |distance|
              499 |directedGraph| 506 |diagramWidth| 544 |diagramSvg| 549
              |diagramHeight| 556 |deepDiagramSvg| 561 |cycleOpen| 568
              |cycleClosed| 574 |createY| 580 |createX| 586 |createWidth| 592
              |coerce| 597 |closedTensor| 622 |closedCartesian| 629 |cartesian|
              636 |arrowsToNode| 642 |arrowsToArrow| 648 |arrowsFromNode| 654
              |arrowsFromArrow| 660 |arrowName| 666 |adjacencyMatrix| 673
              |addObject!| 678 |addArrow!| 690 = 715 + 721 * 727)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|FiniteGraph&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|FiniteGraph| 6) (|SetCategory|)
                           (|CoercibleTo| 118) (|BasicType|))
                        (|makeByteWordVec2| 119
                                            '(2 0 8 8 8 9 2 0 8 8 8 10 2 12 0 0
                                              11 13 2 18 0 0 17 20 1 24 14 0 25
                                              1 24 26 0 27 2 22 0 0 21 28 2 32
                                              30 0 31 33 1 30 8 0 34 2 30 8 0
                                              31 35 1 38 37 0 39 0 38 0 40 2 14
                                              31 6 0 41 2 14 0 0 6 42 2 14 6 0
                                              31 43 3 30 8 0 31 8 44 2 12 47 0
                                              0 48 2 18 47 0 0 51 1 59 58 0 60
                                              2 8 0 61 0 62 2 12 0 0 0 63 2 64
                                              0 0 18 65 2 30 0 0 8 66 1 59 18 0
                                              67 2 8 47 0 0 72 2 8 47 0 0 76 2
                                              18 0 0 0 78 2 12 31 11 0 80 1 0 8
                                              0 82 1 0 8 0 83 2 84 0 6 6 85 2
                                              87 0 0 86 88 3 0 47 0 8 8 89 3 0
                                              52 0 8 8 90 1 52 0 91 92 2 93 0
                                              87 18 94 2 12 11 0 31 101 3 12 11
                                              0 31 11 102 1 105 45 0 106 2 0 47
                                              0 0 1 1 0 0 0 100 2 0 0 14 52 75
                                              1 0 0 6 71 4 0 110 111 0 47 47 1
                                              2 0 116 0 8 1 2 0 116 0 8 1 1 0
                                              115 0 1 1 0 115 0 1 3 0 30 0 8 8
                                              1 3 0 30 0 8 8 1 2 0 8 0 8 1 2 0
                                              30 0 8 1 2 0 30 0 8 1 2 0 30 0 8
                                              1 2 0 30 0 8 1 2 0 8 0 30 1 1 0 8
                                              0 1 2 0 0 0 0 81 2 0 8 0 30 1 1 0
                                              8 0 1 5 0 0 0 30 14 31 31 104 5 0
                                              0 0 30 14 31 31 103 2 0 47 0 0 1
                                              1 0 114 0 1 2 0 114 0 8 1 1 0 114
                                              0 1 1 0 52 0 1 1 0 112 0 1 2 0 0
                                              14 52 77 3 0 47 0 8 8 1 1 0 47 0
                                              1 2 0 47 0 8 1 0 0 47 1 3 0 47 0
                                              8 8 89 1 0 47 0 1 0 0 0 70 1 0
                                              112 0 1 2 0 8 0 8 1 2 0 119 119 0
                                              1 1 0 117 0 1 1 0 12 0 55 2 0 8 0
                                              6 1 1 0 18 0 56 3 0 8 0 8 8 1 1 0
                                              0 68 69 1 0 112 0 1 3 0 31 0 8 8
                                              1 1 0 0 45 46 1 0 0 24 29 2 0 0
                                              14 22 23 2 0 0 14 32 36 2 0 0 12
                                              18 19 1 0 0 14 15 1 0 0 12 16 1 0
                                              8 0 82 3 0 110 52 0 47 1 1 0 8 0
                                              83 3 0 110 52 0 47 1 2 0 0 14 52
                                              73 2 0 0 14 52 74 2 0 8 8 8 10 2
                                              0 8 8 8 9 1 0 8 8 1 1 0 0 24 108
                                              1 0 0 14 109 1 0 0 105 107 1 0
                                              118 0 1 1 0 118 0 1 3 0 0 0 0 97
                                              98 3 0 0 0 0 97 99 2 0 93 0 0 96
                                              2 0 30 0 8 1 2 0 30 0 8 1 2 0 30
                                              0 8 1 2 0 30 0 8 1 3 0 52 0 8 8
                                              90 1 0 113 0 1 2 0 0 0 11 50 2 0
                                              0 0 6 49 4 0 0 0 52 6 6 1 4 0 0 0
                                              52 8 8 53 5 0 0 0 52 8 8 30 54 2
                                              0 47 0 0 1 2 0 0 0 0 79 2 0 93 0
                                              0 95)))))
           '|lookupComplete|)) 
