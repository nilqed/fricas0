
(SDEFUN |FT;coerce;$Of;1| ((|a| $) ($ |OutputForm|))
        (SPROG ((#1=#:G718 NIL) (|u| NIL) (#2=#:G717 NIL) (|t| (|OutputForm|)))
               (SEQ
                (COND
                 ((SPADCALL |a| (QREFELT $ 8))
                  (COND
                   ((QEQCAR (SPADCALL |a| (QREFELT $ 10)) 1)
                    (LETT |t| "EXTERNAL" . #3=(|FT;coerce;$Of;1|)))
                   (#4='T
                    (LETT |t|
                          (SPADCALL
                           (LIST "EXTERNAL"
                                 (SPADCALL (SPADCALL |a| (QREFELT $ 10))
                                           (QREFELT $ 12)))
                           (QREFELT $ 14))
                          . #3#))))
                 (#4#
                  (LETT |t|
                        (SPADCALL (SPADCALL |a| (QREFELT $ 10)) (QREFELT $ 12))
                        . #3#)))
                (EXIT
                 (COND ((NULL (SPADCALL |a| (QREFELT $ 16))) |t|)
                       (#4#
                        (SPADCALL |t|
                                  (SPADCALL
                                   (PROGN
                                    (LETT #2# NIL . #3#)
                                    (SEQ (LETT |u| NIL . #3#)
                                         (LETT #1#
                                               (SPADCALL |a| (QREFELT $ 16))
                                               . #3#)
                                         G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |u| (CAR #1#) . #3#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |u| (QREFELT $ 18))
                                                  #2#)
                                                 . #3#)))
                                         (LETT #1# (CDR #1#) . #3#) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))
                                   (QREFELT $ 19))
                                  (QREFELT $ 20)))))))) 

(PUT '|FT;scalarTypeOf;$U;2| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 0))) 

(SDEFUN |FT;scalarTypeOf;$U;2|
        ((|u| $)
         ($ |Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void")))
        (QVELT |u| 0)) 

(PUT '|FT;dimensionsOf;$L;3| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 1))) 

(SDEFUN |FT;dimensionsOf;$L;3| ((|u| $) ($ |List| (|Polynomial| (|Integer|))))
        (QVELT |u| 1)) 

(PUT '|FT;external?;$B;4| '|SPADreplace| '(XLAM (|u|) (QVELT |u| 2))) 

(SDEFUN |FT;external?;$B;4| ((|u| $) ($ |Boolean|)) (QVELT |u| 2)) 

(SDEFUN |FT;construct;ULB$;5|
        ((|t| |Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void"))
         (|d| |List| (|Symbol|)) (|e| |Boolean|) ($ $))
        (SPROG ((#1=#:G731 NIL) (|l| NIL) (#2=#:G730 NIL))
               (SEQ
                (COND
                 (|e|
                  (COND
                   ((NULL (NULL |d|))
                    (EXIT
                     (|error| "EXTERNAL objects cannot have dimensions"))))))
                (COND
                 ((NULL |e|)
                  (COND
                   ((QEQCAR |t| 1)
                    (EXIT (|error| "VOID objects must be EXTERNAL"))))))
                (EXIT
                 (VECTOR |t|
                         (PROGN
                          (LETT #2# NIL . #3=(|FT;construct;ULB$;5|))
                          (SEQ (LETT |l| NIL . #3#) (LETT #1# |d| . #3#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |l| (QREFELT $ 23)) #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         |e|))))) 

(SDEFUN |FT;construct;ULB$;6|
        ((|t| |Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void"))
         (|d| |List| (|Polynomial| (|Integer|))) (|e| |Boolean|) ($ $))
        (SEQ
         (COND
          (|e|
           (COND
            ((NULL (NULL |d|))
             (EXIT (|error| "EXTERNAL objects cannot have dimensions"))))))
         (COND
          ((NULL |e|)
           (COND
            ((QEQCAR |t| 1)
             (EXIT (|error| "VOID objects must be EXTERNAL"))))))
         (EXIT (VECTOR |t| |d| |e|)))) 

(SDEFUN |FT;coerce;Fst$;7| ((|u| |FortranScalarType|) ($ $))
        (SPADCALL (CONS 0 |u|) NIL NIL (QREFELT $ 26))) 

(SDEFUN |FT;fortranReal;$;8| (($ $))
        (SPADCALL (SPADCALL "real" (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |FT;fortranDouble;$;9| (($ $))
        (SPADCALL (SPADCALL "double precision" (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |FT;fortranInteger;$;10| (($ $))
        (SPADCALL (SPADCALL "integer" (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |FT;fortranComplex;$;11| (($ $))
        (SPADCALL (SPADCALL "complex" (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |FT;fortranDoubleComplex;$;12| (($ $))
        (SPADCALL (SPADCALL "double complex" (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |FT;fortranCharacter;$;13| (($ $))
        (SPADCALL (SPADCALL "character" (QREFELT $ 30)) (QREFELT $ 28))) 

(SDEFUN |FT;fortranLogical;$;14| (($ $))
        (SPADCALL (SPADCALL "logical" (QREFELT $ 30)) (QREFELT $ 28))) 

(DECLAIM (NOTINLINE |FortranType;|)) 

(DEFUN |FortranType| ()
  (SPROG NIL
         (PROG (#1=#:G756)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranType|)
                    . #2=(|FortranType|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranType|
                             (LIST (CONS NIL (CONS 1 (|FortranType;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|FortranType|)))))))))) 

(DEFUN |FortranType;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranType|) . #1=(|FortranType|))
          (LETT $ (GETREFV 40) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranType| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record|
                     (|:| |type|
                          (|Union| (|:| |fst| (|FortranScalarType|))
                                   (|:| |void| "void")))
                     (|:| |dimensions| (|List| (|Polynomial| (|Integer|))))
                     (|:| |external| (|Boolean|))))
          $))) 

(MAKEPROP '|FortranType| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |FT;external?;$B;4|
              (|Union| (|:| |fst| 27) (|:| |void| '"void"))
              |FT;scalarTypeOf;$U;2| (|OutputForm|) (0 . |coerce|) (|List| $)
              (5 . |blankSeparate|) (|List| 17) |FT;dimensionsOf;$L;3|
              (|Polynomial| (|Integer|)) (10 . |coerce|) (15 . |paren|)
              (20 . |sub|) |FT;coerce;$Of;1| (|Symbol|) (26 . |coerce|)
              (|List| 22) |FT;construct;ULB$;5| |FT;construct;ULB$;6|
              (|FortranScalarType|) |FT;coerce;Fst$;7| (|String|)
              (31 . |coerce|) |FT;fortranReal;$;8| |FT;fortranDouble;$;9|
              |FT;fortranInteger;$;10| |FT;fortranComplex;$;11|
              |FT;fortranDoubleComplex;$;12| |FT;fortranCharacter;$;13|
              |FT;fortranLogical;$;14| (|SingleInteger|) (|HashState|))
           '#(~= 36 |scalarTypeOf| 42 |latex| 47 |hashUpdate!| 52 |hash| 58
              |fortranReal| 63 |fortranLogical| 67 |fortranInteger| 71
              |fortranDoubleComplex| 75 |fortranDouble| 79 |fortranComplex| 83
              |fortranCharacter| 87 |external?| 91 |dimensionsOf| 96
              |construct| 101 |coerce| 115 = 125)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 11))
                        (|makeByteWordVec2| 39
                                            '(1 9 11 0 12 1 11 0 13 14 1 17 11
                                              0 18 1 11 0 13 19 2 11 0 0 0 20 1
                                              17 0 22 23 1 27 0 29 30 2 0 7 0 0
                                              1 1 0 9 0 10 1 0 29 0 1 2 0 39 39
                                              0 1 1 0 38 0 1 0 0 0 31 0 0 0 37
                                              0 0 0 33 0 0 0 35 0 0 0 32 0 0 0
                                              34 0 0 0 36 1 0 7 0 8 1 0 15 0 16
                                              3 0 0 9 24 7 25 3 0 0 9 15 7 26 1
                                              0 0 27 28 1 0 11 0 21 2 0 7 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranType| 'NILADIC T) 
