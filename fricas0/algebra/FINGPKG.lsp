
(SDEFUN |FINGPKG;permutationRepresentation;GP;1|
        ((|x| G) ($ |Permutation| (|Integer|)))
        (SPROG
         ((|p| (|Permutation| (|Integer|))) (|imag| (|List| (|Integer|)))
          (#1=#:G714 NIL) (|a| NIL) (#2=#:G713 NIL)
          (|preimag| (|List| (|Integer|))) (#3=#:G712 NIL) (|k| NIL)
          (#4=#:G711 NIL) (|xall| (|List| G)) (#5=#:G710 NIL) (#6=#:G709 NIL)
          (|n| (|Integer|)) (|all| (|List| G)))
         (SEQ
          (LETT |all| (SPADCALL (QREFELT $ 8))
                . #7=(|FINGPKG;permutationRepresentation;GP;1|))
          (LETT |n| (LENGTH |all|) . #7#)
          (LETT |xall|
                (PROGN
                 (LETT #6# NIL . #7#)
                 (SEQ (LETT |a| NIL . #7#) (LETT #5# |all| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #6# (CONS (SPADCALL |x| |a| (QREFELT $ 9)) #6#)
                              . #7#)))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #6#))))
                . #7#)
          (LETT |preimag|
                (PROGN
                 (LETT #4# NIL . #7#)
                 (SEQ (LETT |k| 1 . #7#) (LETT #3# |n| . #7#) G190
                      (COND ((|greater_SI| |k| #3#) (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS |k| #4#) . #7#)))
                      (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #7#)
          (LETT |imag|
                (PROGN
                 (LETT #2# NIL . #7#)
                 (SEQ (LETT |a| NIL . #7#) (LETT #1# |all| . #7#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |a| |xall| (QREFELT $ 12)) #2#)
                              . #7#)))
                      (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #7#)
          (EXIT
           (LETT |p| (SPADCALL (LIST |preimag| |imag|) (QREFELT $ 15))
                 . #7#))))) 

(SDEFUN |FINGPKG;regularRepresentation;GM;2| ((|x| G) ($ |Matrix| (|Integer|)))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL (QREFELT $ 18))
                      |FINGPKG;regularRepresentation;GM;2|)
                (EXIT
                 (SPADCALL (SPADCALL |x| (QREFELT $ 16)) |n| (QREFELT $ 21)))))) 

(DECLAIM (NOTINLINE |FiniteGroupPackage;|)) 

(DEFUN |FiniteGroupPackage| (#1=#:G718)
  (SPROG NIL
         (PROG (#2=#:G719)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteGroupPackage|)
                                               '|domainEqualList|)
                    . #3=(|FiniteGroupPackage|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FiniteGroupPackage;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteGroupPackage|)))))))))) 

(DEFUN |FiniteGroupPackage;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteGroupPackage|))
          (LETT |dv$| (LIST '|FiniteGroupPackage| DV$1) . #1#)
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FiniteGroupPackage| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FiniteGroupPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| $)
              (0 . |enumerate|) (4 . *) (|Integer|) (|List| 6)
              (10 . |position|) (|List| (|List| 10)) (|Permutation| 10)
              (16 . |coercePreimagesImages|)
              |FINGPKG;permutationRepresentation;GP;1| (|NonNegativeInteger|)
              (21 . |size|) (|Matrix| 10) (|RepresentationPackage1| 10)
              (25 . |permutationRepresentation|)
              |FINGPKG;regularRepresentation;GM;2|)
           '#(|regularRepresentation| 31 |permutationRepresentation| 36) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(0 6 7 8 2 6 0 0 0 9 2 11 10
                                                   6 0 12 1 14 0 13 15 0 6 17
                                                   18 2 20 19 14 10 21 1 0 19 6
                                                   22 1 0 14 6 16)))))
           '|lookupComplete|)) 
