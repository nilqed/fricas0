
(SDEFUN |JLF;statistics;V;1| (($ |Void|))
        (SEQ
         (SPADCALL
          (SPADCALL "Number of lazy differentiations"
                    (SPADCALL (QREFELT $ 8) (QREFELT $ 12)) (QREFELT $ 13))
          (QREFELT $ 15))
         (SPADCALL
          (SPADCALL "Number of subsequent evaluations"
                    (SPADCALL (QREFELT $ 9) (QREFELT $ 12)) (QREFELT $ 13))
          (QREFELT $ 15))
         (EXIT (SPADCALL (QREFELT $ 16))))) 

(SDEFUN |JLF;emptyDer?| ((|der| |LazyDer|) ($ |Boolean|))
        (SPROG ((#1=#:G779 NIL))
               (COND
                ((OR (SPADCALL (QVELT |der| 1) (CONS 1 '|0|) (QREFELT $ 33))
                     (QEQCAR (QVELT |der| 2) 1))
                 NIL)
                ('T
                 (SPADCALL
                  (PROG2 (LETT #1# (QVELT |der| 2) |JLF;emptyDer?|)
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                    (|Union| (QREFELT $ 7) $) #1#))
                  (QREFELT $ 34)))))) 

(SDEFUN |JLF;groundFlag?| ((|exp| $) ($ |Boolean|))
        (QVELT (SPADCALL |exp| (QREFELT $ 35)) 2)) 

(SDEFUN |JLF;extract| ((|exp| $) ($ D))
        (SPROG ((#1=#:G779 NIL))
               (PROG2
                   (LETT #1#
                         (QVELT
                          (SPADCALL
                           (|SPADfirst|
                            (QVELT (SPADCALL |exp| (QREFELT $ 35)) 5))
                           (QREFELT $ 36))
                          3)
                         |JLF;extract|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) $) #1#)))) 

(SDEFUN |JLF;jetVars| ((|f| |Union| D $) ($ |List| JB))
        (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT $ 38)))
              ('T (SPADCALL (QCDR |f|) (QREFELT $ 39))))) 

(SDEFUN |JLF;greater|
        ((|lt1| |Reference| |LazyTerm|) (|lt2| |Reference| |LazyTerm|)
         ($ |Boolean|))
        (SPADCALL (QVELT (SPADCALL |lt1| (QREFELT $ 36)) 0)
                  (QVELT (SPADCALL |lt2| (QREFELT $ 36)) 0) (QREFELT $ 40))) 

(SDEFUN |JLF;lazyTerm| ((|d| D) ($ |LazyTerm|))
        (VECTOR (SPADCALL |d| (QREFELT $ 41)) 'T 'T (CONS 0 |d|)
                (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))) 

(SDEFUN |JLF;convert| ((|lt| |LazyTerm|) ($ $))
        (SPROG ((JV (|List| JB)))
               (SEQ
                (LETT JV
                      (SPADCALL
                       (SPADCALL (ELT $ 40) (|JLF;jetVars| (QVELT |lt| 3) $)
                                 (|JLF;jetVars|
                                  (QVELT
                                   (SPADCALL (QVELT |lt| 4) (QREFELT $ 42)) 2)
                                  $)
                                 (QREFELT $ 44))
                       (QREFELT $ 45))
                      |JLF;convert|)
                (EXIT
                 (SPADCALL
                  (VECTOR (QVELT |lt| 0) (QVELT |lt| 1) (QVELT |lt| 2) NIL JV
                          (LIST (SPADCALL |lt| (QREFELT $ 29))))
                  (QREFELT $ 46)))))) 

(SDEFUN |JLF;adapt|
        ((|rec| |RepRec|) (|newLazy| |List| (|Reference| |LazyTerm|))
         ($ |RepRec|))
        (SPROG
         ((|newJV2| (|List| JB)) (|newJV1| (|List| JB))
          (|newSharp?| (|Boolean|)) (|newLD| (JB)) (|lt| (|LazyTerm|)))
         (SEQ
          (COND ((NULL |newLazy|) (QREFELT $ 30))
                (#1='T
                 (SEQ
                  (LETT |lt| (SPADCALL (|SPADfirst| |newLazy|) (QREFELT $ 36))
                        . #2=(|JLF;adapt|))
                  (LETT |newLD| (QVELT |lt| 0) . #2#)
                  (LETT |newSharp?|
                        (COND
                         ((QVELT |lt| 1)
                          (COND ((NULL (CDR |newLazy|)) 'T)
                                (#1#
                                 (SPADCALL |newLD|
                                           (QVELT
                                            (SPADCALL
                                             (SPADCALL |newLazy|
                                                       (QREFELT $ 48))
                                             (QREFELT $ 36))
                                            0)
                                           (QREFELT $ 40)))))
                         (#1# NIL))
                        . #2#)
                  (LETT |newJV1| (QVELT |rec| 3) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((NULL |newJV1|) NIL)
                                ('T
                                 (SPADCALL (|SPADfirst| |newJV1|) |newLD|
                                           (QREFELT $ 40)))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |newJV1| (CDR |newJV1|) . #2#))) NIL
                       (GO G190) G191 (EXIT NIL))
                  (LETT |newJV2| (QVELT |rec| 4) . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((NULL |newJV2|) NIL)
                                ('T
                                 (SPADCALL (|SPADfirst| |newJV2|) |newLD|
                                           (QREFELT $ 40)))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |newJV2| (CDR |newJV2|) . #2#))) NIL
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR |newLD| |newSharp?| (QVELT |rec| 2) |newJV1|
                           |newJV2| |newLazy|)))))))) 

(SDEFUN |JLF;zeroU?| ((|f| |Union| D $) ($ |Boolean|))
        (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT $ 49)))
              ('T (SPADCALL (QCDR |f|) (QREFELT $ 50))))) 

(SDEFUN |JLF;oneU?| ((|f| |Union| D $) ($ |Boolean|))
        (COND ((QEQCAR |f| 0) (SPADCALL (QCDR |f|) (QREFELT $ 34)))
              ('T (SPADCALL (QCDR |f|) (QREFELT $ 51))))) 

(SDEFUN |JLF;minus| ((|f| |Union| D $) ($ |Union| D $))
        (SPROG ((|fs| ($)))
               (SEQ
                (COND
                 ((QEQCAR |f| 0) (CONS 0 (SPADCALL (QCDR |f|) (QREFELT $ 52))))
                 (#1='T
                  (SEQ (LETT |fs| (QCDR |f|) |JLF;minus|)
                       (EXIT
                        (COND
                         ((|JLF;groundFlag?| (QCDR |f|) $)
                          (CONS 0
                                (SPADCALL (|JLF;extract| |fs| $)
                                          (QREFELT $ 52))))
                         (#1# (CONS 1 (SPADCALL |fs| (QREFELT $ 53)))))))))))) 

(SDEFUN |JLF;mult| ((|f| |Union| D $) (|g| |Union| D $) ($ |Union| D $))
        (SPROG ((|gs| ($)) (|fs| ($)) (|fd| (D)))
               (SEQ
                (COND
                 ((QEQCAR |f| 0)
                  (SEQ (LETT |fd| (QCDR |f|) . #1=(|JLF;mult|))
                       (EXIT
                        (COND
                         ((QEQCAR |g| 0)
                          (CONS 0 (SPADCALL |fd| (QCDR |g|) (QREFELT $ 54))))
                         (#2='T
                          (SEQ (LETT |gs| (QCDR |g|) . #1#)
                               (EXIT
                                (COND
                                 ((|JLF;groundFlag?| |gs| $)
                                  (CONS 0
                                        (SPADCALL |fd| (|JLF;extract| |gs| $)
                                                  (QREFELT $ 54))))
                                 (#2#
                                  (CONS 1
                                        (SPADCALL |fd| |gs|
                                                  (QREFELT $ 55))))))))))))
                 (#2#
                  (SEQ (LETT |fs| (QCDR |f|) . #1#)
                       (EXIT
                        (COND
                         ((QEQCAR |g| 0)
                          (CONS 1 (SPADCALL (QCDR |g|) |fs| (QREFELT $ 55))))
                         (#2#
                          (SEQ (LETT |gs| (QCDR |g|) . #1#)
                               (EXIT
                                (COND
                                 ((|JLF;groundFlag?| |gs| $)
                                  (CONS 1
                                        (SPADCALL (|JLF;extract| |gs| $) |fs|
                                                  (QREFELT $ 55))))
                                 (#2#
                                  (CONS 1
                                        (SPADCALL |fs| |gs|
                                                  (QREFELT $ 56)))))))))))))))) 

(SDEFUN |JLF;multLazy|
        ((|rlt1| |Reference| |LazyTerm|) (|rlt2| |Reference| |LazyTerm|)
         ($ |Reference| |LazyTerm|))
        (SPROG
         ((|resDer| (|Reference| |LazyDer|)) (|resCoeff| (|Union| D $))
          (|resEval?| (|Boolean|)) (|resSharp?| (|Boolean|)) (|resLD| (JB))
          (|lt2| (|LazyTerm|)) (|lt1| (|LazyTerm|)))
         (SEQ
          (LETT |lt1| (SPADCALL |rlt1| (QREFELT $ 36)) . #1=(|JLF;multLazy|))
          (LETT |lt2| (SPADCALL |rlt2| (QREFELT $ 36)) . #1#)
          (COND
           ((SPADCALL (QVELT |lt1| 0) (QVELT |lt2| 0) (QREFELT $ 40))
            (SEQ (LETT |resLD| (QVELT |lt1| 0) . #1#)
                 (EXIT (LETT |resSharp?| (QVELT |lt1| 1) . #1#))))
           ((SPADCALL (QVELT |lt1| 0) (QVELT |lt2| 0) (QREFELT $ 57))
            (SEQ (LETT |resLD| (QVELT |lt2| 0) . #1#)
                 (EXIT (LETT |resSharp?| (QVELT |lt2| 1) . #1#))))
           (#2='T
            (SEQ (LETT |resLD| (QVELT |lt1| 0) . #1#)
                 (EXIT
                  (LETT |resSharp?|
                        (COND ((QVELT |lt1| 1) 'T) (#2# (QVELT |lt2| 1)))
                        . #1#)))))
          (LETT |resEval?| NIL . #1#)
          (COND
           ((QVELT |lt1| 2)
            (SEQ
             (LETT |resCoeff| (|JLF;mult| (QVELT |lt1| 3) (QVELT |lt2| 3) $)
                   . #1#)
             (EXIT
              (COND
               ((QVELT |lt2| 2)
                (SEQ
                 (LETT |resDer| (SPADCALL (QREFELT $ 23) (QREFELT $ 27)) . #1#)
                 (EXIT (LETT |resEval?| 'T . #1#))))
               (#2# (LETT |resDer| (QVELT |lt2| 4) . #1#))))))
           ((QVELT |lt2| 2)
            (SEQ
             (LETT |resCoeff| (|JLF;mult| (QVELT |lt1| 3) (QVELT |lt2| 3) $)
                   . #1#)
             (EXIT (LETT |resDer| (QVELT |lt1| 4) . #1#))))
           (#2#
            (SEQ
             (LETT |resCoeff|
                   (|JLF;mult| (CONS 1 (|JLF;convert| |lt1| $)) (QVELT |lt2| 3)
                    $)
                   . #1#)
             (EXIT (LETT |resDer| (QVELT |lt2| 4) . #1#)))))
          (EXIT
           (SPADCALL
            (VECTOR |resLD| |resSharp?| |resEval?| |resCoeff| |resDer|)
            (QREFELT $ 29)))))) 

(SDEFUN |JLF;coerce;JB$;15| ((|jv| JB) ($ $))
        (SPADCALL
         (VECTOR |jv| 'T 'T (LIST |jv|) NIL
                 (LIST
                  (SPADCALL
                   (VECTOR |jv| 'T 'T (CONS 0 (SPADCALL |jv| (QREFELT $ 58)))
                           (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
                   (QREFELT $ 29))))
         (QREFELT $ 46))) 

(SDEFUN |JLF;coerce;D$;16| ((|d| D) ($ $))
        (SPROG ((JV (|List| JB)) (|ld| (JB)))
               (SEQ
                (LETT |ld| (SPADCALL |d| (QREFELT $ 41))
                      . #1=(|JLF;coerce;D$;16|))
                (LETT JV (SPADCALL |d| (QREFELT $ 38)) . #1#)
                (EXIT
                 (SPADCALL
                  (VECTOR |ld| 'T 'T JV NIL
                          (LIST
                           (SPADCALL
                            (VECTOR |ld| 'T 'T (CONS 0 |d|)
                                    (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
                            (QREFELT $ 29))))
                  (QREFELT $ 46)))))) 

(SDEFUN |JLF;coerce;$D;17| ((|exp| $) ($ D))
        (SEQ (LETT |exp| (SPADCALL |exp| (QREFELT $ 61)) |JLF;coerce;$D;17|)
             (EXIT (|JLF;extract| |exp| $)))) 

(SDEFUN |JLF;printFun| ((|fun| |Union| D $) ($ |OutputForm|))
        (COND ((QEQCAR |fun| 0) (SPADCALL (QCDR |fun|) (QREFELT $ 63)))
              ('T (SPADCALL (QCDR |fun|) (QREFELT $ 64))))) 

(SDEFUN |JLF;printDiff| ((|der| |LazyDer|) ($ |OutputForm|))
        (COND ((QVELT |der| 0) (|JLF;printFun| (QVELT |der| 2) $))
              ('T
               (SPADCALL (SPADCALL "diff" (QREFELT $ 66))
                         (LIST (|JLF;printFun| (QVELT |der| 2) $)
                               (SPADCALL (QVELT |der| 1) (QREFELT $ 67)))
                         (QREFELT $ 69))))) 

(SDEFUN |JLF;printLazyTerm| ((|lt| |LazyTerm|) ($ |OutputForm|))
        (SPROG ((|co| (|Union| D $)))
               (SEQ
                (COND ((QVELT |lt| 2) (|JLF;printFun| (QVELT |lt| 3) $))
                      ('T
                       (SEQ (LETT |co| (QVELT |lt| 3) |JLF;printLazyTerm|)
                            (EXIT
                             (SPADCALL (|JLF;printFun| |co| $)
                                       (|JLF;printDiff|
                                        (SPADCALL (QVELT |lt| 4)
                                                  (QREFELT $ 42))
                                        $)
                                       (QREFELT $ 70))))))))) 

(SDEFUN |JLF;printLazy|
        ((|llt| |List| (|Reference| |LazyTerm|)) ($ |OutputForm|))
        (COND
         ((EQL (LENGTH |llt|) 1)
          (|JLF;printLazyTerm| (SPADCALL (|SPADfirst| |llt|) (QREFELT $ 36))
           $))
         ('T
          (SPADCALL
           (|JLF;printLazyTerm| (SPADCALL (|SPADfirst| |llt|) (QREFELT $ 36))
            $)
           (|JLF;printLazy| (CDR |llt|) $) (QREFELT $ 71))))) 

(SDEFUN |JLF;coerce;$Of;22| ((|exp| $) ($ |OutputForm|))
        (COND
         ((|JLF;groundFlag?| |exp| $)
          (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 63)))
         ('T (|JLF;printLazy| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 5) $)))) 

(SDEFUN |JLF;collect;2$;23| ((|exp| $) ($ $))
        (SPROG
         ((|rec| (|RepRec|)) (|newLazy| (|List| (|Reference| |LazyTerm|)))
          (|res| #1=(|Boolean|)) (|co| (D)) (#2=#:G780 NIL) (|newSharp?| #1#)
          (|newLD| (JB)) (|newCoeff| #3=(|Union| D $)) (|newEval?| #1#)
          (|d| (D)) (#4=#:G779 NIL) (|prod| #3#) (|der| (|LazyDer|))
          (|lt| (|LazyTerm|)) (#5=#:G878 NIL) (|rlt| NIL))
         (SEQ
          (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                . #6=(|JLF;collect;2$;23|))
          (EXIT
           (COND
            ((NULL (QVELT |rec| 5))
             (SEQ (SPADCALL |exp| (QREFELT $ 30) (QREFELT $ 72)) (EXIT |exp|)))
            ('T
             (SEQ (LETT |d| (|spadConstant| $ 25) . #6#) (LETT |res| 'T . #6#)
                  (LETT |newLazy| NIL . #6#)
                  (SEQ (LETT |rlt| NIL . #6#) (LETT #5# (QVELT |rec| 5) . #6#)
                       G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |rlt| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36)) . #6#)
                            (EXIT
                             (COND
                              ((QVELT |lt| 2)
                               (LETT |d|
                                     (SPADCALL |d|
                                               (PROG2
                                                   (LETT #4# (QVELT |lt| 3)
                                                         . #6#)
                                                   (QCDR #4#)
                                                 (|check_union2| (QEQCAR #4# 0)
                                                                 (QREFELT $ 7)
                                                                 (|Union|
                                                                  (QREFELT $ 7)
                                                                  $)
                                                                 #4#))
                                               (QREFELT $ 73))
                                     . #6#))
                              ('T
                               (SEQ
                                (LETT |der|
                                      (SPADCALL (QVELT |lt| 4) (QREFELT $ 42))
                                      . #6#)
                                (EXIT
                                 (COND
                                  ((QVELT |der| 0)
                                   (SEQ
                                    (COND
                                     ((|JLF;emptyDer?| |der| $)
                                      (LETT |prod| (QVELT |lt| 3) . #6#))
                                     ('T
                                      (LETT |prod|
                                            (|JLF;mult| (QVELT |der| 2)
                                             (QVELT |lt| 3) $)
                                            . #6#)))
                                    (COND
                                     ((OR (QEQCAR |prod| 0)
                                          (SPADCALL (QCDR |prod|)
                                                    (QREFELT $ 74)))
                                      (SEQ
                                       (COND
                                        ((QEQCAR |prod| 0)
                                         (LETT |newCoeff| |prod| . #6#))
                                        ('T
                                         (LETT |newCoeff|
                                               (CONS 0
                                                     (|JLF;extract|
                                                      (QCDR |prod|) $))
                                               . #6#)))
                                       (LETT |newEval?| 'T . #6#)
                                       (LETT |newLD|
                                             (SPADCALL
                                              (PROG2
                                                  (LETT #4# |newCoeff| . #6#)
                                                  (QCDR #4#)
                                                (|check_union2| (QEQCAR #4# 0)
                                                                (QREFELT $ 7)
                                                                (|Union|
                                                                 (QREFELT $ 7)
                                                                 $)
                                                                #4#))
                                              (QREFELT $ 41))
                                             . #6#)
                                       (LETT |newSharp?| 'T . #6#)
                                       (EXIT
                                        (LETT |d|
                                              (SPADCALL |d|
                                                        (PROG2
                                                            (LETT #4#
                                                                  |newCoeff|
                                                                  . #6#)
                                                            (QCDR #4#)
                                                          (|check_union2|
                                                           (QEQCAR #4# 0)
                                                           (QREFELT $ 7)
                                                           (|Union|
                                                            (QREFELT $ 7) $)
                                                           #4#))
                                                        (QREFELT $ 73))
                                              . #6#))))
                                     ('T
                                      (SEQ (LETT |newEval?| NIL . #6#)
                                           (LETT |newCoeff| |prod| . #6#)
                                           (LETT |newLD| (QVELT |lt| 0) . #6#)
                                           (LETT |newSharp?| (QVELT |lt| 1)
                                                 . #6#)
                                           (EXIT (LETT |res| NIL . #6#)))))
                                    (SPADCALL |rlt|
                                              (VECTOR |newLD| |newSharp?|
                                                      |newEval?| |newCoeff|
                                                      (SPADCALL (QREFELT $ 23)
                                                                (QREFELT $
                                                                         27)))
                                              (QREFELT $ 75))
                                    (EXIT
                                     (COND
                                      ((NULL |newEval?|)
                                       (LETT |newLazy|
                                             (SPADCALL |newLazy| (LIST |rlt|)
                                                       (QREFELT $ 76))
                                             . #6#))))))
                                  ((QEQCAR (QVELT |lt| 3) 1)
                                   (COND
                                    ((SPADCALL
                                      (PROG2 (LETT #2# (QVELT |lt| 3) . #6#)
                                          (QCDR #2#)
                                        (|check_union2| (QEQCAR #2# 1) $
                                                        (|Union| (QREFELT $ 7)
                                                                 $)
                                                        #2#))
                                      (QREFELT $ 74))
                                     (SEQ
                                      (LETT |co|
                                            (|JLF;extract|
                                             (PROG2
                                                 (LETT #2# (QVELT |lt| 3)
                                                       . #6#)
                                                 (QCDR #2#)
                                               (|check_union2| (QEQCAR #2# 1) $
                                                               (|Union|
                                                                (QREFELT $ 7)
                                                                $)
                                                               #2#))
                                             $)
                                            . #6#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL |co| (QREFELT $ 49))
                                         (SPADCALL |rlt|
                                                   (|JLF;lazyTerm|
                                                    (|spadConstant| $ 25) $)
                                                   (QREFELT $ 75)))
                                        ('T
                                         (SEQ (QSETVELT |lt| 3 (CONS 0 |co|))
                                              (SPADCALL |rlt| |lt|
                                                        (QREFELT $ 75))
                                              (LETT |res| NIL . #6#)
                                              (EXIT
                                               (LETT |newLazy|
                                                     (SPADCALL |newLazy|
                                                               (LIST |rlt|)
                                                               (QREFELT $ 76))
                                                     . #6#))))))))
                                    ('T
                                     (SEQ (LETT |res| NIL . #6#)
                                          (EXIT
                                           (LETT |newLazy|
                                                 (SPADCALL |newLazy|
                                                           (LIST |rlt|)
                                                           (QREFELT $ 76))
                                                 . #6#))))))
                                  ('T
                                   (SEQ (LETT |res| NIL . #6#)
                                        (EXIT
                                         (LETT |newLazy|
                                               (SPADCALL |newLazy| (LIST |rlt|)
                                                         (QREFELT $ 76))
                                               . #6#)))))))))))
                       (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND
                   ((NULL (SPADCALL |d| (QREFELT $ 49)))
                    (LETT |newLazy|
                          (SPADCALL (CONS (|function| |JLF;greater|) $)
                                    |newLazy|
                                    (LIST
                                     (SPADCALL (|JLF;lazyTerm| |d| $)
                                               (QREFELT $ 29)))
                                    (QREFELT $ 78))
                          . #6#)))
                  (LETT |rec| (|JLF;adapt| |rec| |newLazy| $) . #6#)
                  (QSETVELT |rec| 2 |res|)
                  (SPADCALL |exp| |rec| (QREFELT $ 72)) (EXIT |exp|)))))))) 

(SDEFUN |JLF;ground?;$B;24| ((|exp| $) ($ |Boolean|))
        (|JLF;groundFlag?| (SPADCALL |exp| (QREFELT $ 79)) $)) 

(SDEFUN |JLF;evalDeriv|
        ((|rder| |Reference| |LazyDer|) ($ |Reference| |LazyDer|))
        (SPROG
         ((|dfun| (D)) (#1=#:G777 NIL) (#2=#:G776 NIL) (|fun| (D))
          (#3=#:G780 NIL) (#4=#:G779 NIL) (|der| (|LazyDer|)))
         (SEQ
          (LETT |der| (SPADCALL |rder| (QREFELT $ 42)) . #5=(|JLF;evalDeriv|))
          (EXIT
           (COND ((QVELT |der| 0) |rder|)
                 (#6='T
                  (SEQ
                   (COND
                    ((|JLF;zeroU?| (QVELT |der| 2) $)
                     (LETT |dfun| (|spadConstant| $ 25) . #5#))
                    (#6#
                     (SEQ
                      (LETT |fun|
                            (COND
                             ((QEQCAR (QVELT |der| 2) 0)
                              (PROG2 (LETT #4# (QVELT |der| 2) . #5#)
                                  (QCDR #4#)
                                (|check_union2| (QEQCAR #4# 0) (QREFELT $ 7)
                                                (|Union| (QREFELT $ 7) $)
                                                #4#)))
                             (#6#
                              (SPADCALL
                               (PROG2 (LETT #3# (QVELT |der| 2) . #5#)
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 1) $
                                                 (|Union| (QREFELT $ 7) $)
                                                 #3#))
                               (QREFELT $ 62))))
                            . #5#)
                      (SETELT $ 9 (+ (QREFELT $ 9) 1))
                      (EXIT
                       (LETT |dfun|
                             (COND
                              ((QEQCAR (QVELT |der| 1) 0)
                               (SPADCALL |fun|
                                         (PROG2
                                             (LETT #2# (QVELT |der| 1) . #5#)
                                             (QCDR #2#)
                                           (|check_union2| (QEQCAR #2# 0)
                                                           (QREFELT $ 6)
                                                           (|Union|
                                                            (QREFELT $ 6)
                                                            (|Symbol|))
                                                           #2#))
                                         (QREFELT $ 81)))
                              (#6#
                               (SPADCALL |fun|
                                         (PROG2
                                             (LETT #1# (QVELT |der| 1) . #5#)
                                             (QCDR #1#)
                                           (|check_union2| (QEQCAR #1# 1)
                                                           (|Symbol|)
                                                           (|Union|
                                                            (QREFELT $ 6)
                                                            (|Symbol|))
                                                           #1#))
                                         (QREFELT $ 83))))
                             . #5#)))))
                   (SPADCALL |rder| (VECTOR 'T (CONS 1 '|0|) (CONS 0 |dfun|))
                             (QREFELT $ 84))
                   (EXIT |rder|)))))))) 

(SDEFUN |JLF;evalTerm|
        ((|rlt| |Reference| |LazyTerm|) ($ |Reference| |LazyTerm|))
        (SPROG
         ((|res| (D)) (#1=#:G779 NIL) (|co| (D)) (#2=#:G780 NIL)
          (|lt| (|LazyTerm|)))
         (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36)) . #3=(|JLF;evalTerm|))
              (EXIT
               (COND ((QVELT |lt| 2) |rlt|)
                     (#4='T
                      (SEQ
                       (LETT |co|
                             (COND
                              ((QEQCAR (QVELT |lt| 3) 0)
                               (PROG2 (LETT #1# (QVELT |lt| 3) . #3#)
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                                 (|Union| (QREFELT $ 7) $)
                                                 #1#)))
                              (#4#
                               (SPADCALL
                                (PROG2 (LETT #2# (QVELT |lt| 3) . #3#)
                                    (QCDR #2#)
                                  (|check_union2| (QEQCAR #2# 1) $
                                                  (|Union| (QREFELT $ 7) $)
                                                  #2#))
                                (QREFELT $ 62))))
                             . #3#)
                       (EXIT
                        (COND
                         ((SPADCALL |co| (QREFELT $ 49))
                          (SEQ
                           (SPADCALL |rlt|
                                     (|JLF;lazyTerm| (|spadConstant| $ 25) $)
                                     (QREFELT $ 75))
                           (EXIT |rlt|)))
                         (#4#
                          (SEQ
                           (LETT |res|
                                 (SPADCALL |co|
                                           (PROG2
                                               (LETT #1#
                                                     (QVELT
                                                      (SPADCALL
                                                       (|JLF;evalDeriv|
                                                        (QVELT |lt| 4) $)
                                                       (QREFELT $ 42))
                                                      2)
                                                     . #3#)
                                               (QCDR #1#)
                                             (|check_union2| (QEQCAR #1# 0)
                                                             (QREFELT $ 7)
                                                             (|Union|
                                                              (QREFELT $ 7) $)
                                                             #1#))
                                           (QREFELT $ 54))
                                 . #3#)
                           (SPADCALL |rlt| (|JLF;lazyTerm| |res| $)
                                     (QREFELT $ 75))
                           (EXIT |rlt|)))))))))))) 

(SDEFUN |JLF;eval1;2$;27| ((|exp| $) ($ $))
        (SPROG
         ((|lazy| (|List| (|Reference| |LazyTerm|))) (|ld| (JB))
          (|rlt| (|Reference| |LazyTerm|)) (|d| (D)) (|co| (D)) (#1=#:G779 NIL)
          (|rco| (|LazyTerm|)) (#2=#:G907 NIL) (#3=#:G908 NIL)
          (|rec| (|RepRec|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                  . #4=(|JLF;eval1;2$;27|))
            (EXIT
             (COND ((QVELT |rec| 2) |exp|)
                   (#5='T
                    (SEQ (LETT |lazy| (QVELT |rec| 5) . #4#)
                         (EXIT
                          (COND
                           ((NULL |lazy|)
                            (SEQ (SPADCALL |exp| (QREFELT $ 30) (QREFELT $ 72))
                                 (EXIT |exp|)))
                           (#5#
                            (SEQ (LETT |rlt| (|SPADfirst| |lazy|) . #4#)
                                 (LETT |rco| (SPADCALL |rlt| (QREFELT $ 36))
                                       . #4#)
                                 (LETT |d| (|spadConstant| $ 25) . #4#)
                                 (LETT |ld| (QVELT |rco| 0) . #4#)
                                 (SEQ (LETT #3# NIL . #4#) G190
                                      (COND (#3# (GO G191)))
                                      (SEQ
                                       (SEQ G190
                                            (COND
                                             ((NULL (QVELT |rco| 2))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |d|
                                                   (SPADCALL |d|
                                                             (PROG2
                                                                 (LETT #1#
                                                                       (QVELT
                                                                        |rco|
                                                                        3)
                                                                       . #4#)
                                                                 (QCDR #1#)
                                                               (|check_union2|
                                                                (QEQCAR #1# 0)
                                                                (QREFELT $ 7)
                                                                (|Union|
                                                                 (QREFELT $ 7)
                                                                 $)
                                                                #1#))
                                                             (QREFELT $ 73))
                                                   . #4#)
                                             (LETT |lazy| (CDR |lazy|) . #4#)
                                             (EXIT
                                              (COND
                                               ((NULL |lazy|)
                                                (PROGN
                                                 (LETT #2#
                                                       (SPADCALL |d|
                                                                 (QREFELT $
                                                                          60))
                                                       . #4#)
                                                 (GO #6=#:G906)))
                                               ('T
                                                (SEQ
                                                 (LETT |rlt|
                                                       (|SPADfirst| |lazy|)
                                                       . #4#)
                                                 (EXIT
                                                  (LETT |rco|
                                                        (SPADCALL |rlt|
                                                                  (QREFELT $
                                                                           36))
                                                        . #4#)))))))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (LETT |lazy| (CDR |lazy|) . #4#)
                                       (LETT |co|
                                             (PROG2
                                                 (LETT #1#
                                                       (QVELT
                                                        (SPADCALL
                                                         (|JLF;evalTerm| |rlt|
                                                          $)
                                                         (QREFELT $ 36))
                                                        3)
                                                       . #4#)
                                                 (QCDR #1#)
                                               (|check_union2| (QEQCAR #1# 0)
                                                               (QREFELT $ 7)
                                                               (|Union|
                                                                (QREFELT $ 7)
                                                                $)
                                                               #1#))
                                             . #4#)
                                       (LETT |d|
                                             (SPADCALL |d| |co| (QREFELT $ 73))
                                             . #4#)
                                       (LETT |rlt|
                                             (SPADCALL (|JLF;lazyTerm| |d| $)
                                                       (QREFELT $ 29))
                                             . #4#)
                                       (EXIT
                                        (LETT |ld|
                                              (QVELT
                                               (SPADCALL |rlt| (QREFELT $ 36))
                                               0)
                                              . #4#)))
                                      (LETT #3#
                                            (COND ((NULL |lazy|) 'T)
                                                  (#5#
                                                   (SPADCALL
                                                    (QVELT
                                                     (SPADCALL
                                                      (|SPADfirst| |lazy|)
                                                      (QREFELT $ 36))
                                                     0)
                                                    |ld| (QREFELT $ 57))))
                                            . #4#)
                                      (GO G190) G191 (EXIT NIL))
                                 (COND
                                  ((NULL (SPADCALL |d| (QREFELT $ 49)))
                                   (LETT |lazy|
                                         (SPADCALL
                                          (CONS (|function| |JLF;greater|) $)
                                          |lazy| (LIST |rlt|) (QREFELT $ 78))
                                         . #4#)))
                                 (SPADCALL |exp| (|JLF;adapt| |rec| |lazy| $)
                                           (QREFELT $ 72))
                                 (EXIT |exp|)))))))))))
          #6# (EXIT #2#)))) 

(SDEFUN |JLF;eval;2$;28| ((|exp| $) ($ $))
        (SEQ
         (SEQ G190
              (COND ((NULL (NULL (SPADCALL |exp| (QREFELT $ 74)))) (GO G191)))
              (SEQ
               (EXIT
                (LETT |exp| (SPADCALL |exp| (QREFELT $ 85)) |JLF;eval;2$;28|)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT |exp|))) 

(SDEFUN |JLF;Zero;$;29| (($ $)) (SPADCALL (QREFELT $ 30) (QREFELT $ 46))) 

(SDEFUN |JLF;One;$;30| (($ $))
        (SPADCALL
         (VECTOR (|spadConstant| $ 24) 'T 'T NIL NIL
                 (LIST
                  (SPADCALL
                   (VECTOR (|spadConstant| $ 24) 'T 'T
                           (CONS 0 (|spadConstant| $ 22))
                           (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
                   (QREFELT $ 29))))
         (QREFELT $ 46))) 

(SDEFUN |JLF;zero?;$B;31| ((|exp| $) ($ |Boolean|))
        (SPROG ((|ld| (JB)))
               (SEQ
                (COND
                 ((SPADCALL |exp| (QREFELT $ 74))
                  (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 49)))
                 (#1='T
                  (SEQ
                   (LETT |ld| (SPADCALL |exp| (QREFELT $ 87))
                         |JLF;zero?;$B;31|)
                   (EXIT
                    (COND
                     ((EQUAL (SPADCALL |ld| (QREFELT $ 88)) '|Const|)
                      (SPADCALL
                       (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                       (QREFELT $ 49)))
                     (#1# NIL))))))))) 

(SDEFUN |JLF;eqRep?;2$B;32| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| (QREFELT $ 35)) (SPADCALL |y| (QREFELT $ 35))
                  (QREFELT $ 89))) 

(SDEFUN |JLF;=;2$B;33| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((SPADCALL |x| |y| (QREFELT $ 90)) 'T)
              ('T (SPADCALL (SPADCALL |x| |y| (QREFELT $ 91)) (QREFELT $ 50))))) 

(SDEFUN |JLF;one?;$B;34| ((|exp| $) ($ |Boolean|))
        (SPROG ((|ld| (JB)))
               (SEQ
                (COND
                 ((SPADCALL |exp| (QREFELT $ 74))
                  (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 34)))
                 (#1='T
                  (SEQ
                   (LETT |ld| (SPADCALL |exp| (QREFELT $ 87)) |JLF;one?;$B;34|)
                   (EXIT
                    (COND
                     ((EQUAL (SPADCALL |ld| (QREFELT $ 88)) '|Const|)
                      (SPADCALL
                       (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61)) $)
                       (QREFELT $ 34)))
                     (#1# NIL))))))))) 

(PUT '|JLF;numerator;2$;35| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(SDEFUN |JLF;numerator;2$;35| ((|exp| $) ($ $)) |exp|) 

(SDEFUN |JLF;denominator;2$;36| ((|exp| $) ($ $)) (|spadConstant| $ 80)) 

(SDEFUN |JLF;-;2$;37| ((|x| $) ($ $))
        (SPROG
         ((|resLazy| (|List| (|Reference| |LazyTerm|))) (|lt| (|LazyTerm|))
          (#1=#:G946 NIL) (|rlt| NIL) (#2=#:G945 NIL) (|rec| (|RepRec|)))
         (SEQ (LETT |rec| (SPADCALL |x| (QREFELT $ 35)) . #3=(|JLF;-;2$;37|))
              (LETT |resLazy|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |rlt| NIL . #3#)
                          (LETT #1# (QVELT |rec| 5) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |rlt| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SEQ
                                    (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36))
                                          . #3#)
                                    (EXIT
                                     (SPADCALL
                                      (VECTOR (QVELT |lt| 0) (QVELT |lt| 1)
                                              (QVELT |lt| 2)
                                              (|JLF;minus| (QVELT |lt| 3) $)
                                              (QVELT |lt| 4))
                                      (QREFELT $ 29))))
                                   #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT
               (SPADCALL
                (VECTOR (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                        (QVELT |rec| 3) (QVELT |rec| 4) |resLazy|)
                (QREFELT $ 46)))))) 

(SDEFUN |JLF;+;3$;38| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|resJV2| #1=(|List| JB)) (|resJV1| #1#) (|yJV| #2=(|List| JB))
          (|xJV| #2#) (|resSharp?| (|Boolean|)) (|resLD| (JB))
          (|resLazy| (|List| (|Reference| |LazyTerm|))) (|yrec| (|RepRec|))
          (|xrec| (|RepRec|)))
         (SEQ (LETT |xrec| (SPADCALL |x| (QREFELT $ 35)) . #3=(|JLF;+;3$;38|))
              (LETT |yrec| (SPADCALL |y| (QREFELT $ 35)) . #3#)
              (LETT |resLazy|
                    (SPADCALL (CONS (|function| |JLF;greater|) $)
                              (QVELT |xrec| 5) (QVELT |yrec| 5) (QREFELT $ 78))
                    . #3#)
              (COND
               ((SPADCALL (QVELT |xrec| 0) (QVELT |yrec| 0) (QREFELT $ 40))
                (SEQ (LETT |resLD| (QVELT |xrec| 0) . #3#)
                     (EXIT (LETT |resSharp?| (QVELT |xrec| 1) . #3#))))
               ((SPADCALL (QVELT |yrec| 0) (QVELT |xrec| 0) (QREFELT $ 40))
                (SEQ (LETT |resLD| (QVELT |yrec| 0) . #3#)
                     (EXIT (LETT |resSharp?| (QVELT |yrec| 1) . #3#))))
               ('T
                (SEQ (LETT |resLD| (QVELT |xrec| 0) . #3#)
                     (EXIT (LETT |resSharp?| NIL . #3#)))))
              (LETT |xJV|
                    (SPADCALL
                     (SPADCALL (QVELT |xrec| 3) (QVELT |xrec| 4)
                               (QREFELT $ 95))
                     (QREFELT $ 45))
                    . #3#)
              (LETT |yJV|
                    (SPADCALL
                     (SPADCALL (QVELT |yrec| 3) (QVELT |yrec| 4)
                               (QREFELT $ 95))
                     (QREFELT $ 45))
                    . #3#)
              (LETT |resJV1|
                    (SPADCALL (ELT $ 40)
                              (SPADCALL
                               (SPADCALL (QVELT |xrec| 3) |yJV| (QREFELT $ 96))
                               (SPADCALL (QVELT |yrec| 3) |xJV| (QREFELT $ 96))
                               (QREFELT $ 97))
                              (QREFELT $ 98))
                    . #3#)
              (LETT |resJV2|
                    (SPADCALL (ELT $ 40)
                              (SPADCALL (SPADCALL |xJV| |yJV| (QREFELT $ 97))
                                        |resJV1| (QREFELT $ 96))
                              (QREFELT $ 98))
                    . #3#)
              (EXIT
               (SPADCALL
                (VECTOR |resLD| |resSharp?| NIL |resJV1| |resJV2| |resLazy|)
                (QREFELT $ 46)))))) 

(SDEFUN |JLF;*;I2$;39| ((|i| |Integer|) (|x| $) ($ $))
        (SPROG
         ((|resLazy| (|List| (|Reference| |LazyTerm|))) (|lt| (|LazyTerm|))
          (#1=#:G965 NIL) (|rlt| NIL) (|rec| (|RepRec|)))
         (SEQ (LETT |rec| (SPADCALL |x| (QREFELT $ 35)) . #2=(|JLF;*;I2$;39|))
              (LETT |resLazy| NIL . #2#)
              (SEQ (LETT |rlt| NIL . #2#) (LETT #1# (QVELT |rec| 5) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rlt| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |lt| (SPADCALL |rlt| (QREFELT $ 36)) . #2#)
                        (EXIT
                         (LETT |resLazy|
                               (SPADCALL |resLazy|
                                         (LIST
                                          (SPADCALL
                                           (VECTOR (QVELT |lt| 0)
                                                   (QVELT |lt| 1)
                                                   (QVELT |lt| 2)
                                                   (|JLF;mult|
                                                    (CONS 0
                                                          (SPADCALL |i|
                                                                    (QREFELT $
                                                                             101)))
                                                    (QVELT |lt| 3) $)
                                                   (QVELT |lt| 4))
                                           (QREFELT $ 29)))
                                         (QREFELT $ 102))
                               . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (VECTOR (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
                        (QVELT |rec| 3) (QVELT |rec| 4) |resLazy|)
                (QREFELT $ 46)))))) 

(SDEFUN |JLF;*;D2$;40| ((|d| D) (|x| $) ($ $))
        (SPADCALL (SPADCALL |d| (QREFELT $ 60)) |x| (QREFELT $ 56))) 

(SDEFUN |JLF;*;3$;41| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((|resSharp?| (|Boolean|)) (|resLD| (JB)) (|resJV2| #1=(|List| JB))
          (|resJV1| #1#) (|resLazy| (|List| (|Reference| |LazyTerm|)))
          (#2=#:G982 NIL) (|ylt| NIL) (#3=#:G981 NIL) (|xlt| NIL)
          (|yrec| (|RepRec|)) (|xrec| (|RepRec|)))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (|spadConstant| $ 86) (QREFELT $ 90))
                (SPADCALL |y| (|spadConstant| $ 86) (QREFELT $ 90)))
            (|spadConstant| $ 86))
           ('T
            (SEQ
             (COND
              ((SPADCALL |x| (QREFELT $ 74))
               (COND
                ((SPADCALL |y| (QREFELT $ 74))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (|JLF;extract| |x| $) (|JLF;extract| |y| $)
                             (QREFELT $ 54))
                   (QREFELT $ 60)))))))
             (LETT |xrec| (SPADCALL |x| (QREFELT $ 35)) . #4=(|JLF;*;3$;41|))
             (LETT |yrec| (SPADCALL |y| (QREFELT $ 35)) . #4#)
             (LETT |resLazy| NIL . #4#)
             (SEQ (LETT |xlt| NIL . #4#) (LETT #3# (QVELT |xrec| 5) . #4#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |xlt| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (SEQ (LETT |ylt| NIL . #4#)
                        (LETT #2# (QVELT |yrec| 5) . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |ylt| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT |resLazy|
                                (SPADCALL (CONS (|function| |JLF;greater|) $)
                                          |resLazy|
                                          (LIST (|JLF;multLazy| |xlt| |ylt| $))
                                          (QREFELT $ 78))
                                . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
                   (LETT |resJV1|
                         (SPADCALL
                          (SPADCALL (QVELT |xrec| 3) (QVELT |yrec| 3)
                                    (QREFELT $ 95))
                          (QREFELT $ 45))
                         . #4#)
                   (EXIT
                    (LETT |resJV2|
                          (SPADCALL
                           (SPADCALL (QVELT |xrec| 4) (QVELT |yrec| 4)
                                     (QREFELT $ 95))
                           (QREFELT $ 45))
                          . #4#)))
                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
             (COND
              ((OR (SPADCALL (QVELT |xrec| 0) (QVELT |yrec| 0) (QREFELT $ 40))
                   (NULL
                    (SPADCALL (QVELT |yrec| 0) (QVELT |xrec| 0)
                              (QREFELT $ 40))))
               (LETT |resLD| (QVELT |xrec| 0) . #4#))
              ('T (LETT |resLD| (QVELT |yrec| 0) . #4#)))
             (LETT |resSharp?|
                   (COND ((QVELT |xrec| 1) (QVELT |yrec| 1)) ('T NIL)) . #4#)
             (EXIT
              (SPADCALL
               (VECTOR |resLD| |resSharp?| NIL |resJV1| |resJV2| |resLazy|)
               (QREFELT $ 46))))))))) 

(SDEFUN |JLF;recip;$U;42| ((|exp| $) ($ |Union| $ "failed"))
        (SPROG ((|rd| (|Union| D "failed")))
               (SEQ
                (COND
                 ((SPADCALL |exp| (QREFELT $ 74))
                  (SEQ
                   (LETT |rd|
                         (SPADCALL (|JLF;extract| |exp| $) (QREFELT $ 105))
                         |JLF;recip;$U;42|)
                   (EXIT
                    (COND ((QEQCAR |rd| 1) (CONS 1 "failed"))
                          (#1='T
                           (CONS 0 (SPADCALL (QCDR |rd|) (QREFELT $ 60))))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |JLF;const?;$B;43| ((|exp| $) ($ |Boolean|))
        (SPROG ((|rec| (|RepRec|)))
               (SEQ
                (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) |JLF;const?;$B;43|)
                (EXIT
                 (COND
                  ((NULL (QVELT |rec| 3))
                   (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) (QREFELT $ 107)))
                  ('T NIL)))))) 

(SDEFUN |JLF;order;$Nni;44| ((|exp| $) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |exp| (QREFELT $ 87)) (QREFELT $ 109))) 

(SDEFUN |JLF;class;$Nni;45| ((|exp| $) ($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL |exp| (QREFELT $ 87)) (QREFELT $ 111))) 

(SDEFUN |JLF;jetVariables;$L;46| ((|exp| $) ($ |List| JB))
        (SPROG ((|rec| (|RepRec|)))
               (SEQ
                (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                      |JLF;jetVariables;$L;46|)
                (EXIT
                 (SPADCALL (ELT $ 40) (QVELT |rec| 3) (QVELT |rec| 4)
                           (QREFELT $ 44)))))) 

(SDEFUN |JLF;differentiate;$JB$;47| ((|exp| $) (|jv| JB) ($ $))
        (SPROG ((|newJV| (|List| JB)) (|ld| (JB)) (|rec| (|RepRec|)))
               (SEQ
                (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                      . #1=(|JLF;differentiate;$JB$;47|))
                (LETT |ld| (QVELT |rec| 0) . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |jv| |ld| (QREFELT $ 40)) (|spadConstant| $ 86))
                  ('T
                   (SEQ
                    (LETT |newJV|
                          (SPADCALL
                           (SPADCALL (ELT $ 40) (QVELT |rec| 3) (QVELT |rec| 4)
                                     (QREFELT $ 44))
                           (QREFELT $ 45))
                          . #1#)
                    (COND
                     ((NULL (SPADCALL |jv| |newJV| (QREFELT $ 113)))
                      (EXIT (|spadConstant| $ 86))))
                    (SETELT $ 8 (+ (QREFELT $ 8) 1))
                    (EXIT
                     (SPADCALL
                      (VECTOR |ld| NIL NIL NIL |newJV|
                              (LIST
                               (SPADCALL
                                (VECTOR |ld| NIL NIL
                                        (CONS 0 (|spadConstant| $ 22))
                                        (SPADCALL
                                         (VECTOR NIL (CONS 0 |jv|)
                                                 (CONS 1 |exp|))
                                         (QREFELT $ 27)))
                                (QREFELT $ 29))))
                      (QREFELT $ 46)))))))))) 

(SDEFUN |JLF;differentiate;$S$;48| ((|exp| $) (|x| |Symbol|) ($ $))
        (SPROG ((|newJV| (|List| JB)) (|ld| (JB)) (|rec| (|RepRec|)))
               (SEQ (SETELT $ 8 (+ (QREFELT $ 8) 1))
                    (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                          . #1=(|JLF;differentiate;$S$;48|))
                    (LETT |ld| (QVELT |rec| 0) . #1#)
                    (LETT |newJV|
                          (SPADCALL
                           (SPADCALL (ELT $ 40) (QVELT |rec| 3) (QVELT |rec| 4)
                                     (QREFELT $ 44))
                           (QREFELT $ 45))
                          . #1#)
                    (EXIT
                     (SPADCALL
                      (VECTOR |ld| NIL NIL NIL |newJV|
                              (LIST
                               (SPADCALL
                                (VECTOR |ld| NIL NIL
                                        (CONS 0 (|spadConstant| $ 22))
                                        (SPADCALL
                                         (VECTOR NIL (CONS 1 |x|)
                                                 (CONS 1 |exp|))
                                         (QREFELT $ 27)))
                                (QREFELT $ 29))))
                      (QREFELT $ 46)))))) 

(SDEFUN |JLF;formalDiff2;LPiSemR;49|
        ((|Sys| |List| $) (|i| |PositiveInteger|)
         (JM |SparseEchelonMatrix| JB $)
         ($ |Record| (|:| |DSys| (|List| $))
          (|:| |JVars| (|List| (|List| JB)))))
        (SPROG
         ((LJV (|List| (|List| JB))) (JV (|List| JB)) (|LRes| (|List| $))
          (|res| ($)) (|djv| (|Union| JB "0")) (#1=#:G1038 NIL) (|df| NIL)
          (#2=#:G1039 NIL) (|jv| NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| $))))
          (#3=#:G1036 NIL) (|l| NIL) (#4=#:G1037 NIL) (|f| NIL)
          (#5=#:G1035 NIL) (|eq| NIL) (#6=#:G1034 NIL) (#7=#:G1033 NIL)
          (#8=#:G1032 NIL) (|inds| (|List| JB)))
         (SEQ
          (LETT |inds| (SPADCALL JM (QREFELT $ 117))
                . #9=(|JLF;formalDiff2;LPiSemR;49|))
          (EXIT
           (COND
            ((NULL |inds|)
             (CONS
              (PROGN
               (LETT #8# NIL . #9#)
               (SEQ (LETT |eq| NIL . #9#) (LETT #7# |Sys| . #9#) G190
                    (COND
                     ((OR (ATOM #7#) (PROGN (LETT |eq| (CAR #7#) . #9#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT (LETT #8# (CONS (|spadConstant| $ 86) #8#) . #9#)))
                    (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                    (EXIT (NREVERSE #8#))))
              (PROGN
               (LETT #6# NIL . #9#)
               (SEQ (LETT |eq| NIL . #9#) (LETT #5# |Sys| . #9#) G190
                    (COND
                     ((OR (ATOM #5#) (PROGN (LETT |eq| (CAR #5#) . #9#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (LETT #6# (CONS NIL #6#) . #9#)))
                    (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                    (EXIT (NREVERSE #6#))))))
            ('T
             (SEQ (LETT |LRes| (SPADCALL (QREFELT $ 119)) . #9#)
                  (LETT LJV NIL . #9#)
                  (SEQ (LETT |f| NIL . #9#) (LETT #4# |Sys| . #9#)
                       (LETT |l| 1 . #9#)
                       (LETT #3# (SPADCALL JM (QREFELT $ 120)) . #9#) G190
                       (COND
                        ((OR (|greater_SI| |l| #3#) (ATOM #4#)
                             (PROGN (LETT |f| (CAR #4#) . #9#) NIL))
                         (GO G191)))
                       (SEQ (LETT |r| (SPADCALL JM |l| (QREFELT $ 122)) . #9#)
                            (LETT |res| (|spadConstant| $ 86) . #9#)
                            (LETT JV NIL . #9#)
                            (SEQ (LETT |jv| NIL . #9#)
                                 (LETT #2# (REVERSE (QCAR |r|)) . #9#)
                                 (LETT |df| NIL . #9#)
                                 (LETT #1#
                                       (SPADCALL (QCDR |r|) (QREFELT $ 123))
                                       . #9#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |df| (CAR #1#) . #9#) NIL)
                                       (ATOM #2#)
                                       (PROGN (LETT |jv| (CAR #2#) . #9#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL |df| (|spadConstant| $ 86)
                                                (QREFELT $ 90)))
                                     (SEQ
                                      (LETT |djv|
                                            (SPADCALL |jv| |i| (QREFELT $ 126))
                                            . #9#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |djv| 1)
                                         (LETT JV (CONS |jv| JV) . #9#))
                                        ((SPADCALL (QCDR |djv|)
                                                   (QREFELT $ 127))
                                         (SEQ
                                          (LETT |res|
                                                (SPADCALL |res| |df|
                                                          (QREFELT $ 99))
                                                . #9#)
                                          (EXIT
                                           (LETT JV (CONS |jv| JV) . #9#))))
                                        ('T
                                         (SEQ
                                          (LETT |res|
                                                (SPADCALL |res|
                                                          (SPADCALL |df|
                                                                    (SPADCALL
                                                                     (QCDR
                                                                      |djv|)
                                                                     (QREFELT $
                                                                              59))
                                                                    (QREFELT $
                                                                             56))
                                                          (QREFELT $ 99))
                                                . #9#)
                                          (EXIT
                                           (LETT JV
                                                 (SPADCALL
                                                  (LIST |jv| (QCDR |djv|)) JV
                                                  (QREFELT $ 95))
                                                 . #9#)))))))))))
                                 (LETT #1#
                                       (PROG1 (CDR #1#)
                                         (LETT #2# (CDR #2#) . #9#))
                                       . #9#)
                                 (GO G190) G191 (EXIT NIL))
                            (COND
                             ((QVELT (SPADCALL |f| (QREFELT $ 35)) 1)
                              (QSETVELT (SPADCALL |res| (QREFELT $ 35)) 1 'T)))
                            (LETT |LRes|
                                  (SPADCALL |res| |LRes| (QREFELT $ 128))
                                  . #9#)
                            (LETT JV
                                  (SPADCALL (ELT $ 40)
                                            (SPADCALL JV (QREFELT $ 45))
                                            (QREFELT $ 98))
                                  . #9#)
                            (EXIT (LETT LJV (CONS JV LJV) . #9#)))
                       (LETT |l|
                             (PROG1 (|inc_SI| |l|) (LETT #4# (CDR #4#) . #9#))
                             . #9#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS (SPADCALL |LRes| (QREFELT $ 129))
                         (NREVERSE LJV)))))))))) 

(SDEFUN |JLF;leadingDer;$JB;50| ((|exp| $) ($ JB))
        (SPROG ((|rec| (|RepRec|)))
               (SEQ
                (LETT |rec| (SPADCALL |exp| (QREFELT $ 35))
                      . #1=(|JLF;leadingDer;$JB;50|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((QVELT |rec| 1) NIL)
                              ('T (NULL (SPADCALL |exp| (QREFELT $ 74))))))
                       (GO G191)))
                     (SEQ (LETT |exp| (SPADCALL |exp| (QREFELT $ 85)) . #1#)
                          (EXIT
                           (LETT |rec| (SPADCALL |exp| (QREFELT $ 35)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((QVELT |rec| 1) (QVELT |rec| 0))
                       ('T
                        (SPADCALL (SPADCALL |exp| (QREFELT $ 62))
                                  (QREFELT $ 41)))))))) 

(SDEFUN |JLF;freeOf?;$JBB;51| ((|exp| $) (|jv| JB) ($ |Boolean|))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND
                  ((SPADCALL |jv| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 3)
                             (QREFELT $ 113))
                   NIL)
                  ('T (NULL (SPADCALL |exp| (QREFELT $ 74))))))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT |exp| (SPADCALL |exp| (QREFELT $ 85))
                      |JLF;freeOf?;$JBB;51|)))
              NIL (GO G190) G191 (EXIT NIL))
         (EXIT
          (COND
           ((SPADCALL |jv| (QVELT (SPADCALL |exp| (QREFELT $ 35)) 3)
                      (QREFELT $ 113))
            NIL)
           ('T
            (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) |jv| (QREFELT $ 133))))))) 

(SDEFUN |JLF;solveFor;$JBU;52| ((|exp| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG ((|sf| (|Union| D "failed")))
               (SEQ
                (LETT |sf|
                      (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) |jv|
                                (QREFELT $ 135))
                      |JLF;solveFor;$JBU;52|)
                (EXIT
                 (COND ((QEQCAR |sf| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |sf|) (QREFELT $ 60))))))))) 

(SDEFUN |JLF;subst;$JB2$;53| ((|exp| $) (|jv| JB) (|sub| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |exp| (QREFELT $ 62)) |jv|
                   (SPADCALL |sub| (QREFELT $ 62)) (QREFELT $ 137))
         (QREFELT $ 60))) 

(SDEFUN |JLF;ld|
        ((|r| |Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
          (|:| |Fun| $))
         ($ JB))
        (QVELT (SPADCALL (QCDR |r|) (QREFELT $ 35)) 0)) 

(SDEFUN |JLF;greaterLD|
        ((|r1| |Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
          (|:| |Fun| $))
         (|r2| |Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
          (|:| |Fun| $))
         ($ |Boolean|))
        (SPADCALL (|JLF;ld| |r1| $) (|JLF;ld| |r2| $) (QREFELT $ 40))) 

(SDEFUN |JLF;simpLD|
        ((|l| |List|
          (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|))) (|:| |Fun| $)))
         ($ |List|
          (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                    (|:| |Fun| $))))
        (SPROG
         ((|newL|
           (|List|
            (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| $))))
          (#1=#:G1124 NIL) (|deq| NIL) (#2=#:G1125 NIL)
          (|dep| (|List| (|NonNegativeInteger|))) (#3=#:G1123 NIL)
          (|newDep| (|List| (|List| (|NonNegativeInteger|))))
          (|ndep| (|List| (|NonNegativeInteger|))) (#4=#:G1122 NIL) (|d| NIL)
          (#5=#:G1121 NIL) (#6=#:G1089 NIL) (#7=#:G1120 NIL) (|eq| NIL)
          (#8=#:G1119 NIL)
          (|tmp|
           (|Record| (|:| |Sys| (|List| D))
                     (|:| JM (|SparseEchelonMatrix| JB D))
                     (|:| |Depend|
                          (|Union| #9="failed"
                                   (|List| (|List| (|NonNegativeInteger|)))))))
          (|oldDep| (|List| (|List| (|NonNegativeInteger|)))) (#10=#:G1118 NIL)
          (#11=#:G1117 NIL) (|sys| (|List| D)) (#12=#:G1116 NIL)
          (#13=#:G1115 NIL) (|newld| (JB)) (|neweq| ($)) (#14=#:G1071 NIL)
          (#15=#:G1114 NIL)
          (|seq|
           (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                     (|:| |Fun| $)))
          (|solvable?| (|Boolean|)) (|s| (|Union| $ #9#)) (#16=#:G1112 NIL)
          (#17=#:G1113 NIL)
          (|eqLD|
           (|List|
            #18=(|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                          (|:| |Fun| $))))
          (|fl| #18#) (|cld| (JB)) (|cur| #18#))
         (SEQ
          (COND ((< (LENGTH |l|) 2) |l|)
                (#19='T
                 (SEQ
                  (LETT |cur| (SPADCALL |l| (QREFELT $ 141))
                        . #20=(|JLF;simpLD|))
                  (LETT |cld| (|JLF;ld| |cur| $) . #20#)
                  (LETT |l| (CDR |l|) . #20#)
                  (EXIT
                   (COND
                    ((SPADCALL |cld|
                               (|JLF;ld| (SPADCALL |l| (QREFELT $ 141)) $)
                               (QREFELT $ 142))
                     (SPADCALL |cur| (|JLF;simpLD| |l| $) (QREFELT $ 143)))
                    (#19#
                     (SEQ (LETT |eqLD| (LIST |cur|) . #20#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((NULL |l|) NIL)
                                        ('T
                                         (SPADCALL |cld|
                                                   (|JLF;ld|
                                                    (LETT |fl|
                                                          (SPADCALL |l|
                                                                    (QREFELT $
                                                                             141))
                                                          . #20#)
                                                    $)
                                                   (QREFELT $ 144)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |eqLD|
                                      (SPADCALL |fl| |eqLD| (QREFELT $ 143))
                                      . #20#)
                                (EXIT (LETT |l| (CDR |l|) . #20#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |solvable?| NIL . #20#)
                          (SEQ (LETT #17# NIL . #20#) (LETT |eq| NIL . #20#)
                               (LETT #16# |eqLD| . #20#) G190
                               (COND
                                ((OR (ATOM #16#)
                                     (PROGN (LETT |eq| (CAR #16#) . #20#) NIL)
                                     #17#)
                                 (GO G191)))
                               (SEQ
                                (LETT |s|
                                      (SPADCALL (QCDR |eq|) |cld|
                                                (QREFELT $ 136))
                                      . #20#)
                                (LETT |solvable?| (QEQCAR |s| 0) . #20#)
                                (EXIT (LETT |seq| |eq| . #20#)))
                               (LETT #16#
                                     (PROG1 (CDR #16#)
                                       (LETT #17# |solvable?| . #20#))
                                     . #20#)
                               (GO G190) G191 (EXIT NIL))
                          (LETT |newL| NIL . #20#)
                          (COND
                           (|solvable?|
                            (SEQ (LETT |eq| NIL . #20#)
                                 (LETT #15# |eqLD| . #20#) G190
                                 (COND
                                  ((OR (ATOM #15#)
                                       (PROGN
                                        (LETT |eq| (CAR #15#) . #20#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |eq| |seq| (QREFELT $ 145))
                                     (SEQ
                                      (LETT |neweq|
                                            (SPADCALL
                                             (SPADCALL (QCDR |eq|) |cld|
                                                       (PROG2
                                                           (LETT #14# |s|
                                                                 . #20#)
                                                           (QCDR #14#)
                                                         (|check_union2|
                                                          (QEQCAR #14# 0) $
                                                          (|Union| $ #9#)
                                                          #14#))
                                                       (QREFELT $ 138))
                                             (QREFELT $ 93))
                                            . #20#)
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (SPADCALL |neweq| (QREFELT $ 50)))
                                         (SEQ
                                          (LETT |newld|
                                                (SPADCALL |neweq|
                                                          (QREFELT $ 87))
                                                . #20#)
                                          (EXIT
                                           (LETT |newL|
                                                 (SPADCALL
                                                  (CONS
                                                   (|function| |JLF;greaterLD|)
                                                   $)
                                                  |newL|
                                                  (LIST
                                                   (CONS
                                                    (SPADCALL (QCAR |eq|)
                                                              (QCAR |seq|)
                                                              (QREFELT $ 147))
                                                    |neweq|))
                                                  (QREFELT $ 149))
                                                 . #20#)))))))))))
                                 (LETT #15# (CDR #15#) . #20#) (GO G190) G191
                                 (EXIT NIL)))
                           (#19#
                            (SEQ
                             (LETT |sys|
                                   (PROGN
                                    (LETT #13# NIL . #20#)
                                    (SEQ (LETT |eq| NIL . #20#)
                                         (LETT #12# |eqLD| . #20#) G190
                                         (COND
                                          ((OR (ATOM #12#)
                                               (PROGN
                                                (LETT |eq| (CAR #12#) . #20#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #13#
                                                 (CONS
                                                  (SPADCALL (QCDR |eq|)
                                                            (QREFELT $ 62))
                                                  #13#)
                                                 . #20#)))
                                         (LETT #12# (CDR #12#) . #20#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #13#))))
                                   . #20#)
                             (LETT |oldDep|
                                   (PROGN
                                    (LETT #11# NIL . #20#)
                                    (SEQ (LETT |eq| NIL . #20#)
                                         (LETT #10# |eqLD| . #20#) G190
                                         (COND
                                          ((OR (ATOM #10#)
                                               (PROGN
                                                (LETT |eq| (CAR #10#) . #20#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #11# (CONS (QCAR |eq|) #11#)
                                                 . #20#)))
                                         (LETT #10# (CDR #10#) . #20#)
                                         (GO G190) G191
                                         (EXIT (NREVERSE #11#))))
                                   . #20#)
                             (LETT |tmp|
                                   (SPADCALL |sys|
                                             (SPADCALL |sys| (QREFELT $ 150))
                                             (QREFELT $ 153))
                                   . #20#)
                             (COND
                              ((SPADCALL (QVELT |tmp| 2) (CONS 0 "failed")
                                         (QREFELT $ 154))
                               (SEQ
                                (LETT |dep|
                                      (SPADCALL
                                       (SPADCALL (ELT $ 147) |oldDep| NIL
                                                 (QREFELT $ 157))
                                       (QREFELT $ 158))
                                      . #20#)
                                (EXIT
                                 (LETT |newDep|
                                       (PROGN
                                        (LETT #8# NIL . #20#)
                                        (SEQ (LETT |eq| NIL . #20#)
                                             (LETT #7# (QVELT |tmp| 0) . #20#)
                                             G190
                                             (COND
                                              ((OR (ATOM #7#)
                                                   (PROGN
                                                    (LETT |eq| (CAR #7#)
                                                          . #20#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #8# (CONS |dep| #8#)
                                                     . #20#)))
                                             (LETT #7# (CDR #7#) . #20#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #8#))))
                                       . #20#))))
                              (#19#
                               (SEQ (LETT |newDep| NIL . #20#)
                                    (SEQ (LETT |dep| NIL . #20#)
                                         (LETT #5#
                                               (PROG2
                                                   (LETT #6# (QVELT |tmp| 2)
                                                         . #20#)
                                                   (QCDR #6#)
                                                 (|check_union2| (QEQCAR #6# 1)
                                                                 (|List|
                                                                  (|List|
                                                                   (|NonNegativeInteger|)))
                                                                 (|Union| #9#
                                                                          (|List|
                                                                           (|List|
                                                                            (|NonNegativeInteger|))))
                                                                 #6#))
                                               . #20#)
                                         G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT |dep| (CAR #5#) . #20#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ (LETT |ndep| NIL . #20#)
                                              (SEQ (LETT |d| NIL . #20#)
                                                   (LETT #4# |dep| . #20#) G190
                                                   (COND
                                                    ((OR (ATOM #4#)
                                                         (PROGN
                                                          (LETT |d| (CAR #4#)
                                                                . #20#)
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |ndep|
                                                           (SPADCALL
                                                            (SPADCALL |ndep|
                                                                      (SPADCALL
                                                                       |oldDep|
                                                                       |d|
                                                                       (QREFELT
                                                                        $ 159))
                                                                      (QREFELT
                                                                       $ 160))
                                                            (QREFELT $ 158))
                                                           . #20#)))
                                                   (LETT #4# (CDR #4#) . #20#)
                                                   (GO G190) G191 (EXIT NIL))
                                              (EXIT
                                               (LETT |newDep|
                                                     (CONS |ndep| |newDep|)
                                                     . #20#)))
                                         (LETT #5# (CDR #5#) . #20#) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT
                                     (LETT |newDep| (NREVERSE |newDep|)
                                           . #20#)))))
                             (LETT |newL|
                                   (PROGN
                                    (LETT #3# NIL . #20#)
                                    (SEQ (LETT |dep| NIL . #20#)
                                         (LETT #2# |newDep| . #20#)
                                         (LETT |deq| NIL . #20#)
                                         (LETT #1# (QVELT |tmp| 0) . #20#) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |deq| (CAR #1#) . #20#)
                                                NIL)
                                               (ATOM #2#)
                                               (PROGN
                                                (LETT |dep| (CAR #2#) . #20#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #3#
                                                 (CONS
                                                  (CONS |dep|
                                                        (SPADCALL |deq|
                                                                  (QREFELT $
                                                                           60)))
                                                  #3#)
                                                 . #20#)))
                                         (LETT #1#
                                               (PROG1 (CDR #1#)
                                                 (LETT #2# (CDR #2#) . #20#))
                                               . #20#)
                                         (GO G190) G191 (EXIT (NREVERSE #3#))))
                                   . #20#)
                             (EXIT
                              (LETT |newL|
                                    (SPADCALL
                                     (CONS (|function| |JLF;greaterLD|) $)
                                     |newL| (QREFELT $ 161))
                                    . #20#)))))
                          (EXIT
                           (SPADCALL |seq|
                                     (|JLF;simpLD|
                                      (SPADCALL
                                       (CONS (|function| |JLF;greaterLD|) $)
                                       |l| |newL| (QREFELT $ 149))
                                      $)
                                     (QREFELT $ 143))))))))))))) 

(SDEFUN |JLF;simplify;LSemR;57|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| $))))
          (|tmp| (|SparseEchelonMatrix| JB $)) (#1=#:G1151 NIL) (|eq| NIL)
          (#2=#:G1152 NIL) (|dep| NIL) (|i| NIL)
          (|resJM| (|SparseEchelonMatrix| JB $)) (|inds| (|List| JB))
          (|resDep| (|List| (|List| (|NonNegativeInteger|)))) (#3=#:G1150 NIL)
          (|l| NIL) (#4=#:G1149 NIL) (|resSys| (|List| $)) (#5=#:G1148 NIL)
          (#6=#:G1147 NIL)
          (|sl|
           (|List|
            (|Record| (|:| |Dep| (|List| (|NonNegativeInteger|)))
                      (|:| |Fun| $))))
          (#7=#:G1146 NIL) (|f| NIL) (#8=#:G1145 NIL))
         (SEQ
          (LETT |sl|
                (PROGN
                 (LETT #8# NIL . #9=(|JLF;simplify;LSemR;57|))
                 (SEQ (LETT |i| 1 . #9#) (LETT |f| NIL . #9#)
                      (LETT #7# |sys| . #9#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8# (CONS (CONS (LIST |i|) |f|) #8#) . #9#)))
                      (LETT #7#
                            (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |sl|
                (|JLF;simpLD|
                 (SPADCALL (CONS (|function| |JLF;greaterLD|) $) |sl|
                           (QREFELT $ 161))
                 $)
                . #9#)
          (LETT |resSys|
                (PROGN
                 (LETT #6# NIL . #9#)
                 (SEQ (LETT |l| NIL . #9#) (LETT #5# |sl| . #9#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |l| (CAR #5#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6#
                              (CONS (SPADCALL (QCDR |l|) (QREFELT $ 79)) #6#)
                              . #9#)))
                      (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #9#)
          (LETT |resDep|
                (PROGN
                 (LETT #4# NIL . #9#)
                 (SEQ (LETT |l| NIL . #9#) (LETT #3# |sl| . #9#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |l| (CAR #3#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS (QCAR |l|) #4#) . #9#)))
                      (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #9#)
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 117)) . #9#)
          (LETT |resJM| (SPADCALL |inds| (LENGTH |sl|) (QREFELT $ 162)) . #9#)
          (SEQ (LETT |i| 1 . #9#) (LETT |dep| NIL . #9#)
               (LETT #2# |resDep| . #9#) (LETT |eq| NIL . #9#)
               (LETT #1# |resSys| . #9#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #9#) NIL)
                     (ATOM #2#) (PROGN (LETT |dep| (CAR #2#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |dep| (QREFELT $ 163)) 1)
                  (LETT |r| (SPADCALL |jm| (|SPADfirst| |dep|) (QREFELT $ 122))
                        . #9#))
                 ('T
                  (SEQ
                   (LETT |tmp|
                         (SPADCALL (LIST |eq|) (LIST |inds|) (QREFELT $ 165))
                         . #9#)
                   (EXIT
                    (LETT |r| (SPADCALL |tmp| 1 (QREFELT $ 122)) . #9#)))))
                (EXIT (SPADCALL |resJM| |i| |r| (QREFELT $ 166))))
               (LETT #1#
                     (PROG1 (CDR #1#)
                       (LETT #2#
                             (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #9#))
                             . #9#))
                     . #9#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |resSys| |resJM| (CONS 1 |resDep|)))))) 

(SDEFUN |JLF;reduceMod;3L;58|
        ((|sys1| . #1=(|List| $)) (|sys2| . #1#) ($ |List| $))
        (SPROG
         ((#2=#:G1163 NIL) (|d| NIL) (#3=#:G1162 NIL) (|sys2D| (|List| D))
          (#4=#:G1161 NIL) (|exp| NIL) (#5=#:G1160 NIL) (|sys1D| (|List| D))
          (#6=#:G1159 NIL) (#7=#:G1158 NIL))
         (SEQ
          (LETT |sys1D|
                (PROGN
                 (LETT #7# NIL . #8=(|JLF;reduceMod;3L;58|))
                 (SEQ (LETT |exp| NIL . #8#) (LETT #6# |sys1| . #8#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |exp| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61))
                                $)
                               #7#)
                              . #8#)))
                      (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #8#)
          (LETT |sys2D|
                (PROGN
                 (LETT #5# NIL . #8#)
                 (SEQ (LETT |exp| NIL . #8#) (LETT #4# |sys2| . #8#) G190
                      (COND
                       ((OR (ATOM #4#)
                            (PROGN (LETT |exp| (CAR #4#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61))
                                $)
                               #5#)
                              . #8#)))
                      (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #3# NIL . #8#)
            (SEQ (LETT |d| NIL . #8#)
                 (LETT #2# (SPADCALL |sys1D| |sys2D| (QREFELT $ 168)) . #8#)
                 G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #3# (CONS (SPADCALL |d| (QREFELT $ 60)) #3#) . #8#)))
                 (LETT #2# (CDR #2#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |JLF;autoReduce;2L;59| ((|sys| |List| $) ($ |List| $))
        (SPROG
         ((#1=#:G1171 NIL) (|d| NIL) (#2=#:G1170 NIL) (|sysD| (|List| D))
          (#3=#:G1169 NIL) (|exp| NIL) (#4=#:G1168 NIL))
         (SEQ
          (LETT |sysD|
                (PROGN
                 (LETT #4# NIL . #5=(|JLF;autoReduce;2L;59|))
                 (SEQ (LETT |exp| NIL . #5#) (LETT #3# |sys| . #5#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |exp| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (|JLF;extract| (SPADCALL |exp| (QREFELT $ 61))
                                $)
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |d| NIL . #5#)
                 (LETT #1# (SPADCALL |sysD| (QREFELT $ 170)) . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2# (CONS (SPADCALL |d| (QREFELT $ 60)) #2#) . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(DECLAIM (NOTINLINE |JetLazyFunction;|)) 

(DEFUN |JetLazyFunction| (&REST #1=#:G1179)
  (SPROG NIL
         (PROG (#2=#:G1180)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetLazyFunction|)
                                               '|domainEqualList|)
                    . #3=(|JetLazyFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetLazyFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetLazyFunction|)))))))))) 

(DEFUN |JetLazyFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|JetLazyFunction|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|JetLazyFunction| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 180) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|JetLazyFunction| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 0)
          (QSETREFV $ 9 0)
          (QSETREFV $ 18
                    (|Record| (|:| |DEval?| (|Boolean|))
                              (|:| DX (|Union| |#1| (|Symbol|)))
                              (|:| |DFun| (|Union| |#2| $))))
          (QSETREFV $ 19
                    (|Record| (|:| LLD |#1|) (|:| |LSharp?| (|Boolean|))
                              (|:| |LEval?| (|Boolean|))
                              (|:| |LCoeff| (|Union| |#2| $))
                              (|:| |LDer| (|Reference| (QREFELT $ 18)))))
          (QSETREFV $ 20
                    (|Record| (|:| LD |#1|) (|:| |Sharp?| (|Boolean|))
                              (|:| |Ground?| (|Boolean|))
                              (|:| JV1 (|List| |#1|)) (|:| JV2 (|List| |#1|))
                              (|:| |Lazy|
                                   (|List| (|Reference| (QREFELT $ 19))))))
          (QSETREFV $ 21 (|Reference| (QREFELT $ 20)))
          (QSETREFV $ 23
                    (VECTOR 'T (CONS 1 '|0|) (CONS 0 (|spadConstant| $ 22))))
          (QSETREFV $ 30
                    (VECTOR (|spadConstant| $ 24) 'T 'T NIL NIL
                            (LIST
                             (SPADCALL
                              (VECTOR (|spadConstant| $ 24) 'T 'T
                                      (CONS 0 (|spadConstant| $ 25))
                                      (SPADCALL (QREFELT $ 23) (QREFELT $ 27)))
                              (QREFELT $ 29)))))
          $))) 

(MAKEPROP '|JetLazyFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|LazyDiff|
              '|LazyEval| (|OutputForm|) (|NonNegativeInteger|) (0 . |coerce|)
              (5 . |assign|) (|Void|) (11 . |print|) (16 . |void|)
              |JLF;statistics;V;1| '|LazyDer| '|LazyTerm| '|RepRec| '|Rep|
              (20 . |One|) '|emptyDer| (24 . |One|) (28 . |Zero|)
              (|Reference| 18) (32 . |ref|) (|Reference| 19) (37 . |ref|)
              '|zeroRec| (|Boolean|) (|Union| 6 82) (42 . ~=) (48 . |one?|)
              (53 . |deref|) (58 . |deref|) (|List| 6) (63 . |jetVariables|)
              |JLF;jetVariables;$L;46| (68 . >) (74 . |leadingDer|)
              (79 . |deref|) (|Mapping| 31 6 6) (84 . |merge|)
              (91 . |removeDuplicates!|) (96 . |ref|) (|List| 28)
              (101 . |second|) (106 . |zero?|) |JLF;zero?;$B;31|
              |JLF;one?;$B;34| (111 . -) |JLF;-;2$;37| (116 . *) |JLF;*;D2$;40|
              |JLF;*;3$;41| (122 . <) (128 . |coerce|) |JLF;coerce;JB$;15|
              |JLF;coerce;D$;16| |JLF;eval;2$;28| |JLF;coerce;$D;17|
              (133 . |coerce|) |JLF;coerce;$Of;22| (|String|) (138 . |message|)
              (143 . |coerce|) (|List| $) (148 . |prefix|) (154 . *) (160 . +)
              (166 . |setref|) (172 . +) |JLF;ground?;$B;24| (178 . |setref|)
              (184 . |append|) (|Mapping| 31 28 28) (190 . |merge|)
              |JLF;collect;2$;23|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JLF;One;$;30|) $))
              (197 . |differentiate|) (|Symbol|) (203 . |differentiate|)
              (209 . |setref|) |JLF;eval1;2$;27|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JLF;Zero;$;29|) $))
              |JLF;leadingDer;$JB;50| (215 . |type|) (220 . =)
              |JLF;eqRep?;2$B;32| (226 . -) |JLF;=;2$B;33|
              |JLF;numerator;2$;35| |JLF;denominator;2$;36| (232 . |append|)
              (238 . |setDifference|) (244 . |concat!|) (250 . |sort!|)
              |JLF;+;3$;38| (|Integer|) (256 . |coerce|) (261 . |concat!|)
              |JLF;*;I2$;39| (|Union| $ '"failed") (267 . |recip|)
              |JLF;recip;$U;42| (272 . |const?|) |JLF;const?;$B;43|
              (277 . |order|) |JLF;order;$Nni;44| (282 . |class|)
              |JLF;class;$Nni;45| (287 . |member?|) |JLF;differentiate;$JB$;47|
              |JLF;differentiate;$S$;48| (|SparseEchelonMatrix| 6 $$)
              (293 . |allIndices|) (|List| $$) (298 . |empty|) (302 . |nrows|)
              (|Record| (|:| |Indices| 37) (|:| |Entries| 118)) (307 . |row|)
              (313 . |reverse|) (|Union| $ '"0") (|PositiveInteger|)
              (318 . |differentiate|) (324 . |one?|) (329 . |cons|)
              (335 . |reverse!|) (|Record| (|:| |DSys| 68) (|:| |JVars| 164))
              (|SparseEchelonMatrix| 6 $) |JLF;formalDiff2;LPiSemR;49|
              (340 . |freeOf?|) |JLF;freeOf?;$JBB;51| (346 . |solveFor|)
              |JLF;solveFor;$JBU;52| (352 . |subst|) |JLF;subst;$JB2$;53|
              (|Record| (|:| |Dep| 146) (|:| |Fun| $$)) (|List| 139)
              (359 . |first|) (364 . ~=) (370 . |cons|) (376 . =) (382 . ~=)
              (|List| 11) (388 . |append|) (|Mapping| 31 139 139)
              (394 . |merge|) (401 . |jacobiMatrix|) (|Union| '"failed" 156)
              (|Record| (|:| |Sys| 68) (|:| JM 131) (|:| |Depend| 151))
              (406 . |simplify|) (412 . =) (|Mapping| 146 146 146) (|List| 146)
              (418 . |reduce|) (425 . |removeDuplicates!|) (430 . |qelt|)
              (436 . |concat!|) (442 . |sort!|) (448 . |new|) (454 . |#|)
              (|List| 37) (459 . |jacobiMatrix|) (465 . |setRow!|)
              |JLF;simplify;LSemR;57| (472 . |reduceMod|) |JLF;reduceMod;3L;58|
              (478 . |autoReduce|) |JLF;autoReduce;2L;59|
              (|Record| (|:| |DPhi| $) (|:| |JVars| 37)) (|Union| 6 '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $) (|List| 82) (|HashState|)
              (|SingleInteger|))
           '#(~= 483 |zero?| 489 |unitNormal| 494 |unitCanonical| 499 |unit?|
              504 |symbol| 509 |subtractIfCan| 514 |subst| 520 |statistics| 527
              |sortLD| 531 |solveFor| 536 |simplify| 542 |simpOne| 548
              |simpMod| 553 |setNotation| 566 |sample| 571 |retractIfCan| 575
              |retract| 580 |reduceMod| 585 |recip| 591 |orderDim| 596 |order|
              603 |opposite?| 608 |one?| 614 |numerator| 619 |numIndVar| 624
              |numDepVar| 628 |leadingDer| 632 |lcmCoef| 637 |lcm| 643 |latex|
              654 |jetVariables| 659 |jacobiMatrix| 664 |hashUpdate!| 675
              |hash| 681 |ground?| 686 |getNotation| 691 |gcdPolynomial| 695
              |gcd| 701 |freeOf?| 712 |formalDiff2| 718 |formalDiff| 732
              |extractSymbol| 750 |exquo| 755 |eval1| 761 |eval| 766 |eqRep?|
              771 |dimension| 777 |differentiate| 784 |denominator| 816
              |dSubst| 821 |const?| 828 |collect| 833 |coerce| 838 |class| 868
              |characteristic| 873 |autoReduce| 877 |associates?| 882
              |annihilate?| 888 ^ 894 |Zero| 906 X 910 U 919 P 928 |One| 950 =
              954 - 960 + 971 * 977 |#2| 1007)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |EntireRing&| |Module&| NIL NIL
                |Ring&| NIL NIL |Rng&| |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| |SetCategory&|
                NIL |RetractableTo&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|LeftOreRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 82) (|EntireRing|) (|Module| $$)
                 (|CommutativeRing|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| $$) (|RightModule| $$) (|Rng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|lazyRepresentation|) (|RetractableTo| 6)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 10))
              (|makeByteWordVec2| 179
                                  '(1 11 10 0 12 2 10 0 0 0 13 1 10 14 0 15 0
                                    14 0 16 0 7 0 22 0 6 0 24 0 7 0 25 1 26 0
                                    18 27 1 28 0 19 29 2 32 31 0 0 33 1 7 31 0
                                    34 1 21 20 0 35 1 28 19 0 36 1 7 37 0 38 2
                                    6 31 0 0 40 1 7 6 0 41 1 26 18 0 42 3 37 0
                                    43 0 0 44 1 37 0 0 45 1 21 0 20 46 1 47 28
                                    0 48 1 7 31 0 49 1 7 0 0 52 2 7 0 0 0 54 2
                                    6 31 0 0 57 1 7 0 6 58 1 7 10 0 63 1 10 0
                                    65 66 1 32 10 0 67 2 10 0 0 68 69 2 10 0 0
                                    0 70 2 10 0 0 0 71 2 21 20 0 20 72 2 7 0 0
                                    0 73 2 28 19 0 19 75 2 47 0 0 0 76 3 47 0
                                    77 0 0 78 2 7 0 0 6 81 2 7 0 0 82 83 2 26
                                    18 0 18 84 1 6 82 0 88 2 20 31 0 0 89 2 0 0
                                    0 0 91 2 37 0 0 0 95 2 37 0 0 0 96 2 37 0 0
                                    0 97 2 37 0 43 0 98 1 7 0 100 101 2 47 0 0
                                    0 102 1 7 104 0 105 1 7 31 0 107 1 6 11 0
                                    109 1 6 11 0 111 2 37 31 6 0 113 1 116 37 0
                                    117 0 118 0 119 1 116 11 0 120 2 116 121 0
                                    100 122 1 118 0 0 123 2 6 124 0 125 126 1 6
                                    31 0 127 2 118 0 2 0 128 1 118 0 0 129 2 7
                                    31 0 6 133 2 7 104 0 6 135 3 7 0 0 6 0 137
                                    1 140 139 0 141 2 6 31 0 0 142 2 140 0 139
                                    0 143 2 6 31 0 0 144 2 139 31 0 0 145 2 146
                                    0 0 0 147 3 140 0 148 0 0 149 1 7 131 68
                                    150 2 7 152 68 131 153 2 151 31 0 0 154 3
                                    156 146 155 0 146 157 1 146 0 0 158 2 156
                                    146 0 100 159 2 146 0 0 0 160 2 140 0 148 0
                                    161 2 116 0 37 100 162 1 146 11 0 163 2 0
                                    131 68 164 165 3 116 14 0 100 121 166 2 7
                                    68 68 68 168 1 7 68 68 170 2 0 31 0 0 1 1 0
                                    31 0 50 1 0 174 0 1 1 0 0 0 1 1 0 31 0 1 1
                                    0 131 68 1 2 0 104 0 0 1 3 0 0 0 6 0 138 0
                                    0 14 17 1 0 68 68 1 2 0 104 0 6 136 2 0 152
                                    68 131 167 1 0 0 0 1 3 0 152 68 131 68 1 2
                                    0 68 68 68 1 1 0 14 82 1 0 0 0 1 1 0 173 0
                                    1 1 0 6 0 1 2 0 68 68 68 169 1 0 104 0 106
                                    3 0 11 68 131 11 1 1 0 11 0 110 2 0 31 0 0
                                    1 1 0 31 0 51 1 0 0 0 93 0 0 125 1 0 0 125
                                    1 1 0 6 0 87 2 0 175 0 0 1 1 0 0 68 1 2 0 0
                                    0 0 1 1 0 65 0 1 1 0 37 0 39 2 0 131 68 164
                                    165 1 0 131 68 1 2 0 178 178 0 1 1 0 179 0
                                    1 1 0 31 0 74 0 0 82 1 2 0 176 176 176 1 2
                                    0 0 0 0 1 1 0 0 68 1 2 0 31 0 6 134 3 0 172
                                    0 125 131 1 3 0 130 68 125 131 132 2 0 68
                                    68 125 1 2 0 0 0 125 1 2 0 0 0 146 1 1 0
                                    131 131 1 2 0 104 0 0 1 1 0 0 0 85 1 0 0 0
                                    61 2 0 31 0 0 90 3 0 11 68 131 11 1 2 0 0 0
                                    6 114 3 0 0 0 177 146 1 2 0 0 0 177 1 3 0 0
                                    0 82 11 1 2 0 0 0 82 115 1 0 0 0 94 3 0 0 0
                                    6 0 1 1 0 31 0 108 1 0 0 0 79 1 0 0 7 60 1
                                    0 7 0 62 1 0 0 6 59 1 0 0 0 1 1 0 0 100 1 1
                                    0 10 0 64 1 0 11 0 112 0 0 11 1 1 0 68 68
                                    171 2 0 31 0 0 1 2 0 31 0 0 1 2 0 0 0 11 1
                                    2 0 0 0 125 1 0 0 0 86 0 0 0 1 1 0 0 125 1
                                    0 0 0 1 1 0 0 125 1 1 0 0 11 1 1 0 0 146 1
                                    2 0 0 125 11 1 2 0 0 125 146 1 0 0 0 80 2 0
                                    31 0 0 92 2 0 0 0 0 91 1 0 0 0 53 2 0 0 0 0
                                    99 2 0 0 7 0 55 2 0 0 100 0 103 2 0 0 0 0
                                    56 2 0 0 11 0 1 2 0 0 125 0 1 3 0 0 0 82 11
                                    1 3 0 0 0 177 146 1 2 0 0 0 177 1 2 0 0 0
                                    82 1)))))
           '|lookupComplete|)) 
