
(PUT '|PRTITION;Zero;$;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |PRTITION;Zero;$;1| (($ $)) NIL) 

(PUT '|PRTITION;coerce;$L;2| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |PRTITION;coerce;$L;2| ((|s| $) ($ |List| (|Integer|))) |s|) 

(SDEFUN |PRTITION;convert;$L;3| ((|x| $) ($ |List| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 10))) 

(SDEFUN |PRTITION;partition;L$;4| ((|list| |List| (|Integer|)) ($ $))
        (SPADCALL (CONS #'|PRTITION;partition;L$;4!0| $) |list| (QREFELT $ 16))) 

(SDEFUN |PRTITION;partition;L$;4!0| ((|i1| NIL) (|i2| NIL) ($ NIL))
        (SPADCALL |i2| |i1| (QREFELT $ 14))) 

(SDEFUN |PRTITION;<;2$B;5| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((NULL |x|) (NULL (NULL |y|))) ((NULL |y|) NIL)
              ((EQL (|SPADfirst| |x|) (|SPADfirst| |y|))
               (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 18)))
              ('T (< (|SPADfirst| |x|) (|SPADfirst| |y|))))) 

(PUT '|PRTITION;=;2$B;6| '|SPADreplace| 'EQUAL) 

(SDEFUN |PRTITION;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|)) (EQUAL |x| |y|)) 

(SDEFUN |PRTITION;+;3$;7| ((|x| $) (|y| $) ($ $))
        (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
              ((SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 20))
               (CONS (|SPADfirst| |x|)
                     (SPADCALL (CDR |x|) |y| (QREFELT $ 21))))
              ('T
               (CONS (|SPADfirst| |y|)
                     (SPADCALL |x| (CDR |y|) (QREFELT $ 21)))))) 

(SDEFUN |PRTITION;*;Nni2$;8| ((|n| |NonNegativeInteger|) (|x| $) ($ $))
        (SPROG ((#1=#:G740 NIL))
               (COND ((ZEROP |n|) (|spadConstant| $ 7))
                     ('T
                      (SPADCALL |x|
                                (SPADCALL
                                 (PROG2
                                     (LETT #1# (SPADCALL |n| 1 (QREFELT $ 24))
                                           |PRTITION;*;Nni2$;8|)
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0)
                                                   (|NonNegativeInteger|)
                                                   (|Union|
                                                    (|NonNegativeInteger|)
                                                    "failed")
                                                   #1#))
                                 |x| (QREFELT $ 25))
                                (QREFELT $ 21)))))) 

(SDEFUN |PRTITION;dp| ((|i| |Integer|) (|x| $) ($ $))
        (COND ((NULL |x|) (|spadConstant| $ 7))
              ((EQL (|SPADfirst| |x|) |i|) (CDR |x|))
              ('T (CONS (|SPADfirst| |x|) (|PRTITION;dp| |i| (CDR |x|) $))))) 

(SDEFUN |PRTITION;remv| ((|i| |Integer|) (|x| $) ($ |Union| $ "failed"))
        (COND
         ((SPADCALL |i| |x| (QREFELT $ 26)) (CONS 0 (|PRTITION;dp| |i| |x| $)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |PRTITION;subtractIfCan;2$U;11|
        ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (SPROG ((|aa| (|Union| $ "failed")))
               (SEQ
                (COND
                 ((NULL |x|)
                  (COND ((NULL |y|) (CONS 0 (|spadConstant| $ 7)))
                        (#1='T (CONS 1 "failed"))))
                 ((NULL |y|) (CONS 0 |x|))
                 (#1#
                  (SEQ
                   (LETT |aa| (|PRTITION;remv| (|SPADfirst| |y|) |x| $)
                         |PRTITION;subtractIfCan;2$U;11|)
                   (EXIT
                    (COND ((QEQCAR |aa| 1) (CONS 1 "failed"))
                          (#1#
                           (SPADCALL (QCDR |aa|) (CDR |y|)
                                     (QREFELT $ 27))))))))))) 

(SDEFUN |PRTITION;bite|
        ((|i| |Integer|) (|li| |List| (|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|li1| (|List| (|Integer|))))
               (SEQ
                (COND ((NULL |li|) (CONS 0 NIL))
                      ((EQL (|SPADfirst| |li|) |i|)
                       (SEQ
                        (LETT |li1| (|PRTITION;bite| |i| (CDR |li|) $)
                              |PRTITION;bite|)
                        (EXIT (CONS (+ (|SPADfirst| |li1|) 1) (CDR |li1|)))))
                      ('T (CONS 0 |li|)))))) 

(SDEFUN |PRTITION;powers;LL;13|
        ((|l| |List| (|Integer|)) ($ |List| (|List| (|Integer|))))
        (SPROG ((|li| (|List| (|Integer|))))
               (SEQ
                (COND ((NULL |l|) NIL)
                      ('T
                       (SEQ
                        (LETT |li|
                              (|PRTITION;bite| (|SPADfirst| |l|) (CDR |l|) $)
                              |PRTITION;powers;LL;13|)
                        (EXIT
                         (CONS
                          (LIST (|SPADfirst| |l|) (+ (|SPADfirst| |li|) 1))
                          (SPADCALL (CDR |li|) (QREFELT $ 29)))))))))) 

(SDEFUN |PRTITION;conjugate;2$;14| ((|x| $) ($ $))
        (SPADCALL |x| (QREFELT $ 31))) 

(SDEFUN |PRTITION;mkterm| ((|i1| |Integer|) (|i2| |Integer|) ($ |OutputForm|))
        (COND
         ((EQL |i2| 1)
          (SPADCALL (SPADCALL |i1| (QREFELT $ 34))
                    (SPADCALL " " (QREFELT $ 36)) (QREFELT $ 37)))
         ('T
          (SPADCALL (SPADCALL |i1| (QREFELT $ 34))
                    (SPADCALL |i2| (QREFELT $ 34)) (QREFELT $ 37))))) 

(SDEFUN |PRTITION;mkexp1|
        ((|lli| |List| (|List| (|Integer|))) ($ |List| (|OutputForm|)))
        (SPROG ((|li| (|List| (|Integer|))))
               (SEQ
                (COND ((NULL |lli|) NIL)
                      ('T
                       (SEQ (LETT |li| (|SPADfirst| |lli|) |PRTITION;mkexp1|)
                            (COND
                             ((NULL (CDR |lli|))
                              (COND
                               ((EQL (SPADCALL |li| (QREFELT $ 38)) 1)
                                (EXIT
                                 (CONS
                                  (SPADCALL (|SPADfirst| |li|) (QREFELT $ 34))
                                  NIL))))))
                            (EXIT
                             (CONS
                              (|PRTITION;mkterm| (|SPADfirst| |li|)
                               (SPADCALL |li| (QREFELT $ 38)) $)
                              (|PRTITION;mkexp1| (CDR |lli|) $))))))))) 

(SDEFUN |PRTITION;coerce;$Of;17| ((|x| $) ($ |OutputForm|))
        (COND ((NULL |x|) (SPADCALL |x| (QREFELT $ 39)))
              ('T
               (SPADCALL
                (SPADCALL (ELT $ 40)
                          (|PRTITION;mkexp1| (SPADCALL |x| (QREFELT $ 29)) $)
                          (QREFELT $ 43))
                (QREFELT $ 44))))) 

(SDEFUN |PRTITION;pdct;$I;18| ((|x| $) ($ |Integer|))
        (SPROG
         ((#1=#:G781 NIL) (#2=#:G780 #3=(|Integer|)) (#4=#:G782 #3#)
          (#5=#:G784 NIL) (|a| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|PRTITION;pdct;$I;18|))
           (SEQ (LETT |a| NIL . #6#)
                (LETT #5# (SPADCALL |x| (QREFELT $ 29)) . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (*
                          (SPADCALL (SPADCALL |a| (QREFELT $ 38))
                                    (QREFELT $ 46))
                          (EXPT (|SPADfirst| |a|)
                                (SPADCALL |a| (QREFELT $ 38))))
                         . #6#)
                   (COND (#1# (LETT #2# (* #2# #4#) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 1)))))) 

(DECLAIM (NOTINLINE |Partition;|)) 

(DEFUN |Partition| ()
  (SPROG NIL
         (PROG (#1=#:G788)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Partition|)
                    . #2=(|Partition|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Partition|
                             (LIST (CONS NIL (CONS 1 (|Partition;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|Partition|)))))))))) 

(DEFUN |Partition;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Partition|) . #1=(|Partition|))
          (LETT $ (GETREFV 51) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Partition| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|List| (|Integer|)))
          $))) 

(MAKEPROP '|Partition| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |PRTITION;Zero;$;1|) $))
              (|List| 13) |PRTITION;coerce;$L;2| (0 . |copy|)
              |PRTITION;convert;$L;3| (|Boolean|) (|Integer|) (5 . <)
              (|Mapping| 12 13 13) (11 . |sort|) |PRTITION;partition;L$;4|
              |PRTITION;<;2$B;5| |PRTITION;=;2$B;6| (17 . >) |PRTITION;+;3$;7|
              (|Union| $ '"failed") (|NonNegativeInteger|)
              (23 . |subtractIfCan|) |PRTITION;*;Nni2$;8| (29 . |member?|)
              |PRTITION;subtractIfCan;2$U;11| (|List| 8)
              |PRTITION;powers;LL;13| (|PartitionsAndPermutations|)
              (35 . |conjugate|) |PRTITION;conjugate;2$;14| (|OutputForm|)
              (40 . |coerce|) (|String|) (45 . |message|) (50 . ^)
              (56 . |second|) (61 . |coerce|) (66 . *) (|Mapping| 33 33 33)
              (|List| 33) (72 . |reduce|) (78 . |paren|)
              |PRTITION;coerce;$Of;17| (83 . |factorial|) |PRTITION;pdct;$I;18|
              (|PositiveInteger|) (|HashState|) (|SingleInteger|))
           '#(~= 88 |zero?| 94 |subtractIfCan| 99 |smaller?| 105 |sample| 111
              |powers| 115 |pdct| 120 |partition| 125 |opposite?| 130 |min| 136
              |max| 142 |latex| 148 |hashUpdate!| 153 |hash| 159 |convert| 164
              |conjugate| 169 |coerce| 174 |Zero| 184 >= 188 > 194 = 200 <= 206
              < 212 + 218 * 224)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL |OrderedSet&| |AbelianMonoid&| NIL
                     |AbelianSemiGroup&| |SetCategory&| NIL |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedCancellationAbelianMonoid|)
                      (|OrderedAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                      (|CancellationAbelianMonoid|) (|OrderedSet|)
                      (|AbelianMonoid|) (|Comparable|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|ConvertibleTo| 8) (|BasicType|)
                      (|PartialOrder|) (|CoercibleTo| 33))
                   (|makeByteWordVec2| 50
                                       '(1 8 0 0 10 2 13 12 0 0 14 2 6 0 15 0
                                         16 2 13 12 0 0 20 2 23 22 0 0 24 2 6
                                         12 13 0 26 1 30 8 8 31 1 13 33 0 34 1
                                         33 0 35 36 2 33 0 0 0 37 1 6 13 0 38 1
                                         6 33 0 39 2 33 0 0 0 40 2 42 33 41 0
                                         43 1 33 0 0 44 1 13 0 0 46 2 0 12 0 0
                                         1 1 0 12 0 1 2 0 22 0 0 27 2 0 12 0 0
                                         1 0 0 0 1 1 0 28 8 29 1 0 13 0 47 1 0
                                         0 8 17 2 0 12 0 0 1 2 0 0 0 0 1 2 0 0
                                         0 0 1 1 0 35 0 1 2 0 49 49 0 1 1 0 50
                                         0 1 1 0 8 0 11 1 0 0 0 32 1 0 8 0 9 1
                                         0 33 0 45 0 0 0 7 2 0 12 0 0 1 2 0 12
                                         0 0 1 2 0 12 0 0 19 2 0 12 0 0 1 2 0
                                         12 0 0 18 2 0 0 0 0 21 2 0 0 23 0 25 2
                                         0 0 48 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Partition| 'NILADIC T) 
