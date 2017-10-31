
(SDEFUN |PGE;llli2gp|
        ((|l| |List| (|List| (|List| (|Integer|))))
         ($ |PermutationGroup| (|Integer|)))
        (SPADCALL (SPADCALL (ELT $ 8) |l| (QREFELT $ 13)) (QREFELT $ 15))) 

(SDEFUN |PGE;li1n| ((|n| |Integer|) ($ |List| (|Integer|)))
        (SPROG ((#1=#:G718 NIL) (|i| NIL) (#2=#:G717 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|PGE;li1n|))
                 (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |i| #2#) . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |PGE;youngGroup;LPg;3|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|element| (|Integer|))
          (|gens| (|List| (|List| (|List| (|Integer|))))) (#1=#:G731 NIL)
          (|i| NIL) (#2=#:G730 NIL) (#3=#:G729 NIL) (|n| NIL))
         (SEQ (LETT |gens| NIL . #4=(|PGE;youngGroup;LPg;3|))
              (LETT |element| 1 . #4#)
              (SEQ (LETT |n| NIL . #4#) (LETT #3# |l| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |n| 1 (QREFELT $ 19))
                       (SEQ
                        (LETT |gens|
                              (CONS
                               (SPADCALL
                                (PROGN
                                 (LETT #2# NIL . #4#)
                                 (SEQ (LETT |i| |element| . #4#)
                                      (LETT #1# (- (+ |element| |n|) 1) . #4#)
                                      G190 (COND ((> |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT (LETT #2# (CONS |i| #2#) . #4#)))
                                      (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 21))
                               |gens|)
                              . #4#)
                        (COND
                         ((>= |n| 3)
                          (LETT |gens|
                                (CONS (LIST (LIST |element| (+ |element| 1)))
                                      |gens|)
                                . #4#)))
                        (EXIT (LETT |element| (+ |element| |n|) . #4#)))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|PGE;llli2gp|
                (COND ((EQL (LENGTH |gens|) 0) (LIST (LIST (LIST 1))))
                      ('T |gens|))
                $))))) 

(SDEFUN |PGE;youngGroup;PPg;4|
        ((|lambda| |Partition|) ($ |PermutationGroup| (|Integer|)))
        (SPADCALL (SPADCALL |lambda| (QREFELT $ 24)) (QREFELT $ 22))) 

(SDEFUN |PGE;rubiksGroup;Pg;5| (($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|b| (|List| (|List| (|Integer|))))
          (|l| (|List| (|List| (|Integer|))))
          (|d| (|List| (|List| (|Integer|))))
          (|u| (|List| (|List| (|Integer|))))
          (|r| (|List| (|List| (|Integer|))))
          (|f| (|List| (|List| (|Integer|)))))
         (SEQ
          (LETT |f|
                (LIST (LIST 11 13 15 17) (LIST 12 14 16 18) (LIST 51 31 21 41)
                      (LIST 53 33 23 43) (LIST 52 32 22 42))
                . #1=(|PGE;rubiksGroup;Pg;5|))
          (LETT |r|
                (LIST (LIST 21 23 25 27) (LIST 22 24 26 28) (LIST 13 37 67 43)
                      (LIST 15 31 61 45) (LIST 14 38 68 44))
                . #1#)
          (LETT |u|
                (LIST (LIST 31 33 35 37) (LIST 32 34 36 38) (LIST 13 51 63 25)
                      (LIST 11 57 61 23) (LIST 12 58 62 24))
                . #1#)
          (LETT |d|
                (LIST (LIST 41 43 45 47) (LIST 42 44 46 48) (LIST 17 21 67 55)
                      (LIST 15 27 65 53) (LIST 16 28 66 54))
                . #1#)
          (LETT |l|
                (LIST (LIST 51 53 55 57) (LIST 52 54 56 58) (LIST 11 41 65 35)
                      (LIST 17 47 63 33) (LIST 18 48 64 34))
                . #1#)
          (LETT |b|
                (LIST (LIST 61 63 65 67) (LIST 62 64 66 68) (LIST 45 25 35 55)
                      (LIST 47 27 37 57) (LIST 46 26 36 56))
                . #1#)
          (EXIT (|PGE;llli2gp| (LIST |f| |r| |u| |d| |l| |b|) $))))) 

(SDEFUN |PGE;mathieu11;LPg;6|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG ((|a| (|List| (|List| (|Integer|)))))
               (SEQ
                (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                      . #1=(|PGE;mathieu11;LPg;6|))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |l|) 11 (QREFELT $ 28))
                   (|error| "Exactly 11 integers for mathieu11 needed !"))
                  ('T
                   (SEQ
                    (LETT |a|
                          (LIST
                           (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                                 (SPADCALL |l| 10 (QREFELT $ 29)))
                           (LIST (SPADCALL |l| 2 (QREFELT $ 29))
                                 (SPADCALL |l| 8 (QREFELT $ 29)))
                           (LIST (SPADCALL |l| 3 (QREFELT $ 29))
                                 (SPADCALL |l| 11 (QREFELT $ 29)))
                           (LIST (SPADCALL |l| 5 (QREFELT $ 29))
                                 (SPADCALL |l| 7 (QREFELT $ 29))))
                          . #1#)
                    (EXIT
                     (|PGE;llli2gp|
                      (LIST |a|
                            (LIST
                             (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                                   (SPADCALL |l| 4 (QREFELT $ 29))
                                   (SPADCALL |l| 7 (QREFELT $ 29))
                                   (SPADCALL |l| 6 (QREFELT $ 29)))
                             (LIST (SPADCALL |l| 2 (QREFELT $ 29))
                                   (SPADCALL |l| 11 (QREFELT $ 29))
                                   (SPADCALL |l| 10 (QREFELT $ 29))
                                   (SPADCALL |l| 9 (QREFELT $ 29)))))
                      $))))))))) 

(SDEFUN |PGE;mathieu11;Pg;7| (($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| 11 $) (QREFELT $ 30))) 

(SDEFUN |PGE;mathieu12;LPg;8|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG ((|a| (|List| (|List| (|Integer|)))))
               (SEQ
                (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                      . #1=(|PGE;mathieu12;LPg;8|))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |l|) 12 (QREFELT $ 28))
                   (|error| "Exactly 12 integers for mathieu12 needed !"))
                  ('T
                   (SEQ
                    (LETT |a|
                          (LIST
                           (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                                 (SPADCALL |l| 2 (QREFELT $ 29))
                                 (SPADCALL |l| 3 (QREFELT $ 29))
                                 (SPADCALL |l| 4 (QREFELT $ 29))
                                 (SPADCALL |l| 5 (QREFELT $ 29))
                                 (SPADCALL |l| 6 (QREFELT $ 29))
                                 (SPADCALL |l| 7 (QREFELT $ 29))
                                 (SPADCALL |l| 8 (QREFELT $ 29))
                                 (SPADCALL |l| 9 (QREFELT $ 29))
                                 (SPADCALL |l| 10 (QREFELT $ 29))
                                 (SPADCALL |l| 11 (QREFELT $ 29))))
                          . #1#)
                    (EXIT
                     (|PGE;llli2gp|
                      (LIST |a|
                            (LIST
                             (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                                   (SPADCALL |l| 6 (QREFELT $ 29))
                                   (SPADCALL |l| 5 (QREFELT $ 29))
                                   (SPADCALL |l| 8 (QREFELT $ 29))
                                   (SPADCALL |l| 3 (QREFELT $ 29))
                                   (SPADCALL |l| 7 (QREFELT $ 29))
                                   (SPADCALL |l| 4 (QREFELT $ 29))
                                   (SPADCALL |l| 2 (QREFELT $ 29))
                                   (SPADCALL |l| 9 (QREFELT $ 29))
                                   (SPADCALL |l| 10 (QREFELT $ 29)))
                             (LIST (SPADCALL |l| 11 (QREFELT $ 29))
                                   (SPADCALL |l| 12 (QREFELT $ 29)))))
                      $))))))))) 

(SDEFUN |PGE;mathieu12;Pg;9| (($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| 12 $) (QREFELT $ 32))) 

(SDEFUN |PGE;mathieu22;LPg;10|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|b| (|List| (|List| #1=(|Integer|)))) (|a| (|List| (|List| #1#))))
         (SEQ
          (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                . #2=(|PGE;mathieu22;LPg;10|))
          (EXIT
           (COND
            ((SPADCALL (LENGTH |l|) 22 (QREFELT $ 28))
             (|error| "Exactly 22 integers for mathieu22 needed !"))
            ('T
             (SEQ
              (LETT |a|
                    (LIST
                     (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                           (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 4 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29))
                           (SPADCALL |l| 7 (QREFELT $ 29))
                           (SPADCALL |l| 14 (QREFELT $ 29))))
                    . #2#)
              (LETT |b|
                    (LIST
                     (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                           (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 7 (QREFELT $ 29))
                           (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 14 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29))))
                    . #2#)
              (EXIT (|PGE;llli2gp| (LIST |a| |b|) $))))))))) 

(SDEFUN |PGE;mathieu22;Pg;11| (($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| 22 $) (QREFELT $ 34))) 

(SDEFUN |PGE;mathieu23;LPg;12|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|b| (|List| (|List| #1=(|Integer|)))) (|a| (|List| (|List| #1#))))
         (SEQ
          (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                . #2=(|PGE;mathieu23;LPg;12|))
          (EXIT
           (COND
            ((SPADCALL (LENGTH |l|) 23 (QREFELT $ 28))
             (|error| "Exactly 23 integers for mathieu23 needed !"))
            ('T
             (SEQ
              (LETT |a|
                    (LIST
                     (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                           (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 4 (QREFELT $ 29))
                           (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 7 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29))
                           (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 14 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29))
                           (SPADCALL |l| 23 (QREFELT $ 29))))
                    . #2#)
              (LETT |b|
                    (LIST
                     (LIST (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 4 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 7 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29))
                           (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 14 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29))))
                    . #2#)
              (EXIT (|PGE;llli2gp| (LIST |a| |b|) $))))))))) 

(SDEFUN |PGE;mathieu23;Pg;13| (($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| 23 $) (QREFELT $ 36))) 

(SDEFUN |PGE;mathieu24;LPg;14|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|b| (|List| (|List| #1=(|Integer|)))) (|a| (|List| (|List| #1#))))
         (SEQ
          (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                . #2=(|PGE;mathieu24;LPg;14|))
          (EXIT
           (COND
            ((SPADCALL (LENGTH |l|) 24 (QREFELT $ 28))
             (|error| "Exactly 24 integers for mathieu24 needed !"))
            ('T
             (SEQ
              (LETT |a|
                    (LIST
                     (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29))
                           (SPADCALL |l| 24 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 7 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 4 (QREFELT $ 29))
                           (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29))))
                    . #2#)
              (LETT |b|
                    (LIST
                     (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 14 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 10 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 4 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29))
                           (SPADCALL |l| 7 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 23 (QREFELT $ 29))
                           (SPADCALL |l| 24 (QREFELT $ 29))))
                    . #2#)
              (EXIT (|PGE;llli2gp| (LIST |a| |b|) $))))))))) 

(SDEFUN |PGE;mathieu24;Pg;15| (($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| 24 $) (QREFELT $ 38))) 

(SDEFUN |PGE;janko2;LPg;16|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|b| (|List| (|List| #1=(|Integer|)))) (|a| (|List| (|List| #1#))))
         (SEQ
          (LETT |l| (SPADCALL |l| (QREFELT $ 27)) . #2=(|PGE;janko2;LPg;16|))
          (EXIT
           (COND
            ((SPADCALL (LENGTH |l|) 100 (QREFELT $ 28))
             (|error| "Exactly 100 integers for janko2 needed !"))
            ('T
             (SEQ
              (LETT |a|
                    (LIST
                     (LIST (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 4 (QREFELT $ 29))
                           (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 7 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 14 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 23 (QREFELT $ 29))
                           (SPADCALL |l| 24 (QREFELT $ 29))
                           (SPADCALL |l| 25 (QREFELT $ 29))
                           (SPADCALL |l| 26 (QREFELT $ 29))
                           (SPADCALL |l| 27 (QREFELT $ 29))
                           (SPADCALL |l| 28 (QREFELT $ 29))
                           (SPADCALL |l| 29 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 30 (QREFELT $ 29))
                           (SPADCALL |l| 31 (QREFELT $ 29))
                           (SPADCALL |l| 32 (QREFELT $ 29))
                           (SPADCALL |l| 33 (QREFELT $ 29))
                           (SPADCALL |l| 34 (QREFELT $ 29))
                           (SPADCALL |l| 35 (QREFELT $ 29))
                           (SPADCALL |l| 36 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 37 (QREFELT $ 29))
                           (SPADCALL |l| 38 (QREFELT $ 29))
                           (SPADCALL |l| 39 (QREFELT $ 29))
                           (SPADCALL |l| 40 (QREFELT $ 29))
                           (SPADCALL |l| 41 (QREFELT $ 29))
                           (SPADCALL |l| 42 (QREFELT $ 29))
                           (SPADCALL |l| 43 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 44 (QREFELT $ 29))
                           (SPADCALL |l| 45 (QREFELT $ 29))
                           (SPADCALL |l| 46 (QREFELT $ 29))
                           (SPADCALL |l| 47 (QREFELT $ 29))
                           (SPADCALL |l| 48 (QREFELT $ 29))
                           (SPADCALL |l| 49 (QREFELT $ 29))
                           (SPADCALL |l| 50 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 51 (QREFELT $ 29))
                           (SPADCALL |l| 52 (QREFELT $ 29))
                           (SPADCALL |l| 53 (QREFELT $ 29))
                           (SPADCALL |l| 54 (QREFELT $ 29))
                           (SPADCALL |l| 55 (QREFELT $ 29))
                           (SPADCALL |l| 56 (QREFELT $ 29))
                           (SPADCALL |l| 57 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 58 (QREFELT $ 29))
                           (SPADCALL |l| 59 (QREFELT $ 29))
                           (SPADCALL |l| 60 (QREFELT $ 29))
                           (SPADCALL |l| 61 (QREFELT $ 29))
                           (SPADCALL |l| 62 (QREFELT $ 29))
                           (SPADCALL |l| 63 (QREFELT $ 29))
                           (SPADCALL |l| 64 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 65 (QREFELT $ 29))
                           (SPADCALL |l| 66 (QREFELT $ 29))
                           (SPADCALL |l| 67 (QREFELT $ 29))
                           (SPADCALL |l| 68 (QREFELT $ 29))
                           (SPADCALL |l| 69 (QREFELT $ 29))
                           (SPADCALL |l| 70 (QREFELT $ 29))
                           (SPADCALL |l| 71 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 72 (QREFELT $ 29))
                           (SPADCALL |l| 73 (QREFELT $ 29))
                           (SPADCALL |l| 74 (QREFELT $ 29))
                           (SPADCALL |l| 75 (QREFELT $ 29))
                           (SPADCALL |l| 76 (QREFELT $ 29))
                           (SPADCALL |l| 77 (QREFELT $ 29))
                           (SPADCALL |l| 78 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 79 (QREFELT $ 29))
                           (SPADCALL |l| 80 (QREFELT $ 29))
                           (SPADCALL |l| 81 (QREFELT $ 29))
                           (SPADCALL |l| 82 (QREFELT $ 29))
                           (SPADCALL |l| 83 (QREFELT $ 29))
                           (SPADCALL |l| 84 (QREFELT $ 29))
                           (SPADCALL |l| 85 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 86 (QREFELT $ 29))
                           (SPADCALL |l| 87 (QREFELT $ 29))
                           (SPADCALL |l| 88 (QREFELT $ 29))
                           (SPADCALL |l| 89 (QREFELT $ 29))
                           (SPADCALL |l| 90 (QREFELT $ 29))
                           (SPADCALL |l| 91 (QREFELT $ 29))
                           (SPADCALL |l| 92 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 93 (QREFELT $ 29))
                           (SPADCALL |l| 94 (QREFELT $ 29))
                           (SPADCALL |l| 95 (QREFELT $ 29))
                           (SPADCALL |l| 96 (QREFELT $ 29))
                           (SPADCALL |l| 97 (QREFELT $ 29))
                           (SPADCALL |l| 98 (QREFELT $ 29))
                           (SPADCALL |l| 99 (QREFELT $ 29))))
                    . #2#)
              (LETT |b|
                    (LIST
                     (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                           (SPADCALL |l| 74 (QREFELT $ 29))
                           (SPADCALL |l| 83 (QREFELT $ 29))
                           (SPADCALL |l| 21 (QREFELT $ 29))
                           (SPADCALL |l| 36 (QREFELT $ 29))
                           (SPADCALL |l| 77 (QREFELT $ 29))
                           (SPADCALL |l| 44 (QREFELT $ 29))
                           (SPADCALL |l| 80 (QREFELT $ 29))
                           (SPADCALL |l| 64 (QREFELT $ 29))
                           (SPADCALL |l| 2 (QREFELT $ 29))
                           (SPADCALL |l| 34 (QREFELT $ 29))
                           (SPADCALL |l| 75 (QREFELT $ 29))
                           (SPADCALL |l| 48 (QREFELT $ 29))
                           (SPADCALL |l| 17 (QREFELT $ 29))
                           (SPADCALL |l| 100 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 3 (QREFELT $ 29))
                           (SPADCALL |l| 15 (QREFELT $ 29))
                           (SPADCALL |l| 31 (QREFELT $ 29))
                           (SPADCALL |l| 52 (QREFELT $ 29))
                           (SPADCALL |l| 19 (QREFELT $ 29))
                           (SPADCALL |l| 11 (QREFELT $ 29))
                           (SPADCALL |l| 73 (QREFELT $ 29))
                           (SPADCALL |l| 79 (QREFELT $ 29))
                           (SPADCALL |l| 26 (QREFELT $ 29))
                           (SPADCALL |l| 56 (QREFELT $ 29))
                           (SPADCALL |l| 41 (QREFELT $ 29))
                           (SPADCALL |l| 99 (QREFELT $ 29))
                           (SPADCALL |l| 39 (QREFELT $ 29))
                           (SPADCALL |l| 84 (QREFELT $ 29))
                           (SPADCALL |l| 90 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 4 (QREFELT $ 29))
                           (SPADCALL |l| 57 (QREFELT $ 29))
                           (SPADCALL |l| 86 (QREFELT $ 29))
                           (SPADCALL |l| 63 (QREFELT $ 29))
                           (SPADCALL |l| 85 (QREFELT $ 29))
                           (SPADCALL |l| 95 (QREFELT $ 29))
                           (SPADCALL |l| 82 (QREFELT $ 29))
                           (SPADCALL |l| 97 (QREFELT $ 29))
                           (SPADCALL |l| 98 (QREFELT $ 29))
                           (SPADCALL |l| 81 (QREFELT $ 29))
                           (SPADCALL |l| 8 (QREFELT $ 29))
                           (SPADCALL |l| 69 (QREFELT $ 29))
                           (SPADCALL |l| 38 (QREFELT $ 29))
                           (SPADCALL |l| 43 (QREFELT $ 29))
                           (SPADCALL |l| 58 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 5 (QREFELT $ 29))
                           (SPADCALL |l| 66 (QREFELT $ 29))
                           (SPADCALL |l| 49 (QREFELT $ 29))
                           (SPADCALL |l| 59 (QREFELT $ 29))
                           (SPADCALL |l| 61 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 6 (QREFELT $ 29))
                           (SPADCALL |l| 68 (QREFELT $ 29))
                           (SPADCALL |l| 89 (QREFELT $ 29))
                           (SPADCALL |l| 94 (QREFELT $ 29))
                           (SPADCALL |l| 92 (QREFELT $ 29))
                           (SPADCALL |l| 20 (QREFELT $ 29))
                           (SPADCALL |l| 13 (QREFELT $ 29))
                           (SPADCALL |l| 54 (QREFELT $ 29))
                           (SPADCALL |l| 24 (QREFELT $ 29))
                           (SPADCALL |l| 51 (QREFELT $ 29))
                           (SPADCALL |l| 87 (QREFELT $ 29))
                           (SPADCALL |l| 27 (QREFELT $ 29))
                           (SPADCALL |l| 76 (QREFELT $ 29))
                           (SPADCALL |l| 23 (QREFELT $ 29))
                           (SPADCALL |l| 67 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 7 (QREFELT $ 29))
                           (SPADCALL |l| 72 (QREFELT $ 29))
                           (SPADCALL |l| 22 (QREFELT $ 29))
                           (SPADCALL |l| 35 (QREFELT $ 29))
                           (SPADCALL |l| 30 (QREFELT $ 29))
                           (SPADCALL |l| 70 (QREFELT $ 29))
                           (SPADCALL |l| 47 (QREFELT $ 29))
                           (SPADCALL |l| 62 (QREFELT $ 29))
                           (SPADCALL |l| 45 (QREFELT $ 29))
                           (SPADCALL |l| 46 (QREFELT $ 29))
                           (SPADCALL |l| 40 (QREFELT $ 29))
                           (SPADCALL |l| 28 (QREFELT $ 29))
                           (SPADCALL |l| 65 (QREFELT $ 29))
                           (SPADCALL |l| 93 (QREFELT $ 29))
                           (SPADCALL |l| 42 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 9 (QREFELT $ 29))
                           (SPADCALL |l| 71 (QREFELT $ 29))
                           (SPADCALL |l| 37 (QREFELT $ 29))
                           (SPADCALL |l| 91 (QREFELT $ 29))
                           (SPADCALL |l| 18 (QREFELT $ 29))
                           (SPADCALL |l| 55 (QREFELT $ 29))
                           (SPADCALL |l| 96 (QREFELT $ 29))
                           (SPADCALL |l| 60 (QREFELT $ 29))
                           (SPADCALL |l| 16 (QREFELT $ 29))
                           (SPADCALL |l| 53 (QREFELT $ 29))
                           (SPADCALL |l| 50 (QREFELT $ 29))
                           (SPADCALL |l| 25 (QREFELT $ 29))
                           (SPADCALL |l| 32 (QREFELT $ 29))
                           (SPADCALL |l| 14 (QREFELT $ 29))
                           (SPADCALL |l| 33 (QREFELT $ 29)))
                     (LIST (SPADCALL |l| 10 (QREFELT $ 29))
                           (SPADCALL |l| 78 (QREFELT $ 29))
                           (SPADCALL |l| 88 (QREFELT $ 29))
                           (SPADCALL |l| 29 (QREFELT $ 29))
                           (SPADCALL |l| 12 (QREFELT $ 29))))
                    . #2#)
              (EXIT (|PGE;llli2gp| (LIST |a| |b|) $))))))))) 

(SDEFUN |PGE;janko2;Pg;17| (($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| 100 $) (QREFELT $ 40))) 

(SDEFUN |PGE;abelianGroup;LPg;18|
        ((|l| |List| (|PositiveInteger|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|element| (|Integer|))
          (|gens| (|List| (|List| (|List| (|Integer|))))) (#1=#:G775 NIL)
          (|i| NIL) (#2=#:G774 NIL) (#3=#:G773 NIL) (|n| NIL))
         (SEQ (LETT |gens| NIL . #4=(|PGE;abelianGroup;LPg;18|))
              (LETT |element| 1 . #4#)
              (SEQ (LETT |n| NIL . #4#) (LETT #3# |l| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |n| 1 (QREFELT $ 43))
                       (SEQ
                        (LETT |gens|
                              (CONS
                               (SPADCALL
                                (PROGN
                                 (LETT #2# NIL . #4#)
                                 (SEQ (LETT |i| |element| . #4#)
                                      (LETT #1# (- (+ |element| |n|) 1) . #4#)
                                      G190 (COND ((> |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT (LETT #2# (CONS |i| #2#) . #4#)))
                                      (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 21))
                               |gens|)
                              . #4#)
                        (EXIT (LETT |element| (+ |element| |n|) . #4#)))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|PGE;llli2gp|
                (COND ((EQL (LENGTH |gens|) 0) (LIST (LIST (LIST 1))))
                      ('T |gens|))
                $))))) 

(SDEFUN |PGE;alternatingGroup;LPg;19|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|gens| (|List| (|List| (|List| #1=(|Integer|)))))
          (|tmp| (|List| #1#)) (#2=#:G784 NIL) (|i| NIL) (#3=#:G783 NIL))
         (SEQ
          (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                . #4=(|PGE;alternatingGroup;LPg;19|))
          (EXIT
           (COND
            ((EQL (LENGTH |l|) 0)
             (|error| "Cannot construct alternating group on empty set"))
            ((< (LENGTH |l|) 3)
             (|PGE;llli2gp|
              (LIST (LIST (LIST (SPADCALL |l| 1 (QREFELT $ 29))))) $))
            ((EQL (LENGTH |l|) 3)
             (|PGE;llli2gp|
              (LIST
               (LIST
                (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                      (SPADCALL |l| 2 (QREFELT $ 29))
                      (SPADCALL |l| 3 (QREFELT $ 29)))))
              $))
            (#5='T
             (SEQ
              (LETT |tmp|
                    (PROGN
                     (LETT #3# NIL . #4#)
                     (SEQ (LETT |i| 3 . #4#) (LETT #2# (LENGTH |l|) . #4#) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (SPADCALL |l| |i| (QREFELT $ 29)) #3#)
                                  . #4#)))
                          (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #4#)
              (LETT |gens|
                    (LIST (LIST |tmp|)
                          (LIST
                           (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                                 (SPADCALL |l| 2 (QREFELT $ 29))
                                 (SPADCALL |l| 3 (QREFELT $ 29)))))
                    . #4#)
              (EXIT
               (COND ((ODDP (LENGTH |l|)) (|PGE;llli2gp| |gens| $))
                     (#5#
                      (SEQ
                       (SPADCALL |gens| 1
                                 (CONS
                                  (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                                        (SPADCALL |l| 2 (QREFELT $ 29)))
                                  (SPADCALL |gens| 1 (QREFELT $ 46)))
                                 (QREFELT $ 47))
                       (EXIT (|PGE;llli2gp| |gens| $))))))))))))) 

(SDEFUN |PGE;alternatingGroup;PiPg;20|
        ((|n| |PositiveInteger|) ($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| |n| $) (QREFELT $ 48))) 

(SDEFUN |PGE;symmetricGroup;LPg;21|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SEQ
         (LETT |l| (SPADCALL |l| (QREFELT $ 27)) |PGE;symmetricGroup;LPg;21|)
         (EXIT
          (COND
           ((EQL (LENGTH |l|) 0)
            (|error| "Cannot construct symmetric group on empty set !"))
           ((< (LENGTH |l|) 3) (|PGE;llli2gp| (LIST (LIST |l|)) $))
           ('T
            (|PGE;llli2gp|
             (LIST (LIST |l|)
                   (LIST
                    (LIST (SPADCALL |l| 1 (QREFELT $ 29))
                          (SPADCALL |l| 2 (QREFELT $ 29)))))
             $)))))) 

(SDEFUN |PGE;symmetricGroup;PiPg;22|
        ((|n| |PositiveInteger|) ($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| |n| $) (QREFELT $ 50))) 

(SDEFUN |PGE;cyclicGroup;LPg;23|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 27)) |PGE;cyclicGroup;LPg;23|)
             (EXIT
              (COND
               ((EQL (LENGTH |l|) 0)
                (|error| "Cannot construct cyclic group on empty set"))
               ('T (|PGE;llli2gp| (LIST (LIST |l|)) $)))))) 

(SDEFUN |PGE;cyclicGroup;PiPg;24|
        ((|n| |PositiveInteger|) ($ |PermutationGroup| (|Integer|)))
        (SPADCALL (|PGE;li1n| |n| $) (QREFELT $ 52))) 

(SDEFUN |PGE;dihedralGroup;LPg;25|
        ((|l| |List| (|Integer|)) ($ |PermutationGroup| (|Integer|)))
        (SPROG
         ((|tmp| (|List| (|List| (|Integer|)))) (#1=#:G798 NIL) (|i| NIL)
          (#2=#:G797 NIL))
         (SEQ
          (LETT |l| (SPADCALL |l| (QREFELT $ 27))
                . #3=(|PGE;dihedralGroup;LPg;25|))
          (EXIT
           (COND
            ((< (LENGTH |l|) 3)
             (|error| "in dihedralGroup: Minimum of 3 elements needed !"))
            ('T
             (SEQ
              (LETT |tmp|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |i| 1 . #3#)
                          (LETT #1# (QUOTIENT2 (LENGTH |l|) 2) . #3#) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (LIST (SPADCALL |l| |i| (QREFELT $ 29))
                                         (SPADCALL |l|
                                                   (+ (- (LENGTH |l|) |i|) 1)
                                                   (QREFELT $ 29)))
                                   #2#)
                                  . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (|PGE;llli2gp| (LIST (LIST |l|) |tmp|) $))))))))) 

(SDEFUN |PGE;dihedralGroup;PiPg;26|
        ((|n| |PositiveInteger|) ($ |PermutationGroup| (|Integer|)))
        (COND ((EQL |n| 1) (SPADCALL 2 (QREFELT $ 51)))
              ((EQL |n| 2)
               (|PGE;llli2gp| (LIST (LIST (LIST 1 2)) (LIST (LIST 3 4))) $))
              ('T (SPADCALL (|PGE;li1n| |n| $) (QREFELT $ 54))))) 

(DECLAIM (NOTINLINE |PermutationGroupExamples;|)) 

(DEFUN |PermutationGroupExamples| ()
  (SPROG NIL
         (PROG (#1=#:G801)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PermutationGroupExamples|)
                    . #2=(|PermutationGroupExamples|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PermutationGroupExamples|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|PermutationGroupExamples;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|PermutationGroupExamples|)))))))))) 

(DEFUN |PermutationGroupExamples;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PermutationGroupExamples|)
                . #1=(|PermutationGroupExamples|))
          (LETT $ (GETREFV 56) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PermutationGroupExamples| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PermutationGroupExamples| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 20) (|Permutation| 18)
              (0 . |cycles|) (|List| 7) (|Mapping| 7 6) (|List| 6)
              (|ListFunctions2| 6 7) (5 . |map|) (|PermutationGroup| 18)
              (11 . |coerce|) (16 . |One|) (|Boolean|) (|Integer|) (20 . >)
              (|List| 18) (26 . |list|) |PGE;youngGroup;LPg;3| (|Partition|)
              (31 . |convert|) |PGE;youngGroup;PPg;4| |PGE;rubiksGroup;Pg;5|
              (36 . |removeDuplicates|) (41 . ~=) (47 . |elt|)
              |PGE;mathieu11;LPg;6| |PGE;mathieu11;Pg;7| |PGE;mathieu12;LPg;8|
              |PGE;mathieu12;Pg;9| |PGE;mathieu22;LPg;10| |PGE;mathieu22;Pg;11|
              |PGE;mathieu23;LPg;12| |PGE;mathieu23;Pg;13|
              |PGE;mathieu24;LPg;14| |PGE;mathieu24;Pg;15| |PGE;janko2;LPg;16|
              |PGE;janko2;Pg;17| (|PositiveInteger|) (53 . >) (|List| 42)
              |PGE;abelianGroup;LPg;18| (59 . |elt|) (65 . |setelt!|)
              |PGE;alternatingGroup;LPg;19| |PGE;alternatingGroup;PiPg;20|
              |PGE;symmetricGroup;LPg;21| |PGE;symmetricGroup;PiPg;22|
              |PGE;cyclicGroup;LPg;23| |PGE;cyclicGroup;PiPg;24|
              |PGE;dihedralGroup;LPg;25| |PGE;dihedralGroup;PiPg;26|)
           '#(|youngGroup| 72 |symmetricGroup| 82 |rubiksGroup| 92 |mathieu24|
              96 |mathieu23| 105 |mathieu22| 114 |mathieu12| 123 |mathieu11|
              132 |janko2| 141 |dihedralGroup| 150 |cyclicGroup| 160
              |alternatingGroup| 170 |abelianGroup| 180)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 55
                                                 '(1 7 0 6 8 2 12 9 10 11 13 1
                                                   14 0 9 15 0 7 0 16 2 18 17 0
                                                   0 19 1 6 0 20 21 1 23 20 0
                                                   24 1 20 0 0 27 2 18 17 0 0
                                                   28 2 20 18 0 18 29 2 42 17 0
                                                   0 43 2 11 6 0 18 46 3 11 6 0
                                                   18 6 47 1 0 14 23 25 1 0 14
                                                   20 22 1 0 14 42 51 1 0 14 20
                                                   50 0 0 14 26 1 0 14 20 38 0
                                                   0 14 39 1 0 14 20 36 0 0 14
                                                   37 0 0 14 35 1 0 14 20 34 1
                                                   0 14 20 32 0 0 14 33 1 0 14
                                                   20 30 0 0 14 31 0 0 14 41 1
                                                   0 14 20 40 1 0 14 20 54 1 0
                                                   14 42 55 1 0 14 42 53 1 0 14
                                                   20 52 1 0 14 42 49 1 0 14 20
                                                   48 1 0 14 44 45)))))
           '|lookupComplete|)) 

(MAKEPROP '|PermutationGroupExamples| 'NILADIC T) 
