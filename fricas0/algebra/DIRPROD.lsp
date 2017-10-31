
(SDEFUN |DIRPROD;coerce;$V;1| ((|z| $) ($ |Vector| R))
        (SPADCALL |z| (QREFELT $ 9))) 

(SDEFUN |DIRPROD;coerce;R$;2| ((|r| R) ($ $)) (MAKEARR1 (QREFELT $ 6) |r|)) 

(PUT '|DIRPROD;parts;$L;3| '|SPADreplace| 'VEC2LIST) 

(SDEFUN |DIRPROD;parts;$L;3| ((|x| $) ($ |List| R)) (VEC2LIST |x|)) 

(SDEFUN |DIRPROD;directProduct;V$;4| ((|z| |Vector| R) ($ $))
        (COND
         ((SPADCALL |z| (QREFELT $ 6) (QREFELT $ 16))
          (SPADCALL |z| (QREFELT $ 9)))
         ('T (|error| "Not of the correct length")))) 

(SDEFUN |DIRPROD;same?| ((|z| $) ($ |Boolean|))
        (SPROG NIL
               (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR $ |z|)) |z|
                         (QREFELT $ 23)))) 

(SDEFUN |DIRPROD;same?!0| ((|x| NIL) ($$ NIL))
        (PROG (|z| $)
          (LETT |z| (QREFELT $$ 1) . #1=(|DIRPROD;same?|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x|
                      (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19))
                                (QREFELT $ 20))
                      (QREFELT $ 21)))))) 

(SDEFUN |DIRPROD;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G717 NIL) (#2=#:G718 NIL) (#3=#:G719 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0 . #4=(|DIRPROD;=;2$B;6|))
                         (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G716))
                                    . #4#)
                              (GO #6=#:G714))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G724 NIL) (#2=#:G725 NIL) (#3=#:G726 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0 . #4=(|DIRPROD;=;2$B;7|))
                         (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G723))
                                    . #4#)
                              (GO #6=#:G721))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G731 NIL) (#2=#:G732 NIL) (#3=#:G733 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 1 . #4=(|DIRPROD;=;2$B;8|))
                         (LETT #3# (QREFELT $ 6) . #4#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF1O |x| |i| 1) (QAREF1O |y| |i| 1)
                                        (QREFELT $ 21)))
                             (PROGN
                              (LETT #1#
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G730))
                                    . #4#)
                              (GO #6=#:G728))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;$R;9| ((|z| $) ($ R))
        (COND
         ((|DIRPROD;same?| |z| $)
          (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20)))
         ('T (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;$U;10| ((|z| $) ($ |Union| R "failed"))
        (COND
         ((|DIRPROD;same?| |z| $)
          (CONS 0 (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi$;11| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((L (|List| R)) (#1=#:G745 NIL) (|p| (|Integer|)) (#2=#:G750 NIL)
          (|i| NIL) (#3=#:G744 NIL) (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #4=(|DIRPROD;index;Pi$;11|))
              (LETT |p| (- |n| 1) . #4#)
              (LETT L
                    (LIST
                     (SPADCALL
                      (PROG1 (LETT #3# (+ (REM |p| N) 1) . #4#)
                        (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                          '(|Integer|) #3#))
                      (QREFELT $ 30)))
                    . #4#)
              (SEQ (LETT |i| 2 . #4#) (LETT #2# (QREFELT $ 6) . #4#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |p| (QUOTIENT2 |p| N) . #4#)
                        (EXIT
                         (LETT L
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #1# (+ (REM |p| N) 1) . #4#)
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT $ 30))
                                L)
                               . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL L (QREFELT $ 31)))))) 

(SDEFUN |DIRPROD;random;$;12| (($ $))
        (SPROG ((#1=#:G753 NIL) (#2=#:G755 NIL) (|i| NIL) (#3=#:G754 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6))
                       . #5=(|DIRPROD;random;$;12|))
                 (SEQ (LETT |i| 1 . #5#) (LETT #2# #4# . #5#)
                      (LETT #1# 0 . #5#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT $ 33)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#)
                              (LETT |i| (|inc_SI| |i|) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DIRPROD;lookup;$Pi;13| ((|x| $) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G757 NIL) (L (|Integer|)) (#2=#:G760 NIL) (|i| NIL)
          (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #3=(|DIRPROD;lookup;$Pi;13|))
              (LETT L
                    (-
                     (SPADCALL (SPADCALL |x| 1 (QREFELT $ 20)) (QREFELT $ 35))
                     1)
                    . #3#)
              (SEQ (LETT |i| 2 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT L
                           (-
                            (+ (* L N)
                               (SPADCALL (SPADCALL |x| |i| (QREFELT $ 20))
                                         (QREFELT $ 35)))
                            1)
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (+ L 1) . #3#)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))))) 

(SDEFUN |DIRPROD;Zero;$;14| (($ $)) (SPADCALL (QREFELT $ 6) (QREFELT $ 37))) 

(SDEFUN |DIRPROD;*;3$;15| ((|u| $) (|v| $) ($ $))
        (SPADCALL (ELT $ 39) |u| |v| (QREFELT $ 41))) 

(SDEFUN |DIRPROD;subtractIfCan;2$U;16| ((|u| $) (|v| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G775 NIL) (|c| (|Union| R "failed")) (#2=#:G776 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43))
                  . #3=(|DIRPROD;subtractIfCan;2$U;16|))
            (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 6) . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |c|
                        (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                                  (QREFELT $ 45))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |c| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #4=#:G774)))
                    ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |w|))))
          #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;One;$;17| (($ $))
        (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))) 

(SDEFUN |DIRPROD;recip;$U;18| ((|z| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G788 NIL) (|u| (|Union| R #1#)) (#3=#:G789 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))
                  . #4=(|DIRPROD;recip;$U;18|))
            (SEQ (LETT |i| (SPADCALL |w| (QREFELT $ 19)) . #4#)
                 (LETT #3# (SPADCALL |w| (QREFELT $ 49)) . #4#) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (LETT |u|
                        (SPADCALL (SPADCALL |z| |i| (QREFELT $ 50))
                                  (QREFELT $ 51))
                        . #4#)
                  (EXIT
                   (COND
                    ((QEQCAR |u| 1)
                     (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #5=#:G787)))
                    ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                 (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |w|))))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;unitVector;Pi$;19| ((|i| |PositiveInteger|) ($ $))
        (SPROG ((|v| ($)))
               (SEQ
                (LETT |v| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43))
                      |DIRPROD;unitVector;Pi$;19|)
                (SPADCALL |v| |i| (|spadConstant| $ 47) (QREFELT $ 53))
                (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2$B;20| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G797 NIL) (#2=#:G798 NIL) (|b| (R)) (|a| (R)) (#3=#:G799 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;20|))
                 (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |a| (QREFELT |x| |i|) . #4#)
                      (LETT |b| (QREFELT |y| |i|) . #4#)
                      (EXIT
                       (COND
                        ((QLESSP |a| |b|)
                         (PROGN (LETT #2# 'T . #4#) (GO #5=#:G796)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((QLESSP |b| |a|)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                    . #4#)
                              (GO #6=#:G792)))))
                          #6# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2$B;21| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G805 NIL) (#2=#:G806 NIL) (|b| (R)) (|a| (R)) (#3=#:G807 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| 0 . #4=(|DIRPROD;<;2$B;21|))
                 (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ (LETT |a| (QREFELT |x| |i|) . #4#)
                      (LETT |b| (QREFELT |y| |i|) . #4#)
                      (EXIT
                       (COND
                        ((QLESSP |a| |b|)
                         (PROGN (LETT #2# 'T . #4#) (GO #5=#:G804)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((QLESSP |b| |a|)
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                    . #4#)
                              (GO #6=#:G800)))))
                          #6# (EXIT #1#))))))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G813 NIL) (#2=#:G814 NIL) (#3=#:G815 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1 . #4=(|DIRPROD;<;2$B;22|))
                       (LETT #3# (QREFELT $ 6) . #4#) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 50))
                                     (SPADCALL |y| |i| (QREFELT $ 50))
                                     (QREFELT $ 56))
                           (PROGN (LETT #2# 'T . #4#) (GO #5=#:G812)))
                          ('T
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |x| |i| (QREFELT $ 50))
                                         (SPADCALL |y| |i| (QREFELT $ 50))
                                         (QREFELT $ 57))
                               (PROGN
                                (LETT #1# (PROGN (LETT #2# NIL . #4#) (GO #5#))
                                      . #4#)
                                (GO #6=#:G808)))))
                            #6# (EXIT #1#))))))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;sup;3$;23| ((|x| $) (|y| $) ($ $))
        (SPADCALL (ELT $ 58) |x| |y| (QREFELT $ 41))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct| (&REST #1=#:G840)
  (SPROG NIL
         (PROG (#2=#:G841)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DirectProduct|)
                                               '|domainEqualList|)
                    . #3=(|DirectProduct|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProduct;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|)))))))))) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G832 NIL) (#2=#:G833 NIL) (#3=#:G834 NIL) (#4=#:G835 NIL)
    (#5=#:G836 NIL) (#6=#:G837 NIL) (#7=#:G838 NIL) (#8=#:G839 NIL) ($ NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #9=(|DirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #9#)
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2) . #9#)
    (LETT $ (GETREFV 84) . #9#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Field|))
                                             (|HasCategory| |#2| '(|SemiRng|))
                                             (|HasCategory| |#2|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #8#
                                                   (|HasCategory| |#2|
                                                                  '(|OrderedRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#)
                                             (|HasCategory| |#2| '(|Ring|))
                                             (|HasCategory| |#2| '(|Monoid|))
                                             (|HasCategory| |#2|
                                                            '(|unitsKnown|))
                                             (LETT #7#
                                                   (|HasCategory| |#2|
                                                                  '(|CommutativeRing|))
                                                   . #9#)
                                             (OR #7#
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (OR #7#
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                             (OR #7#
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                             (LETT #6#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|))
                                                   . #9#)
                                             (OR #6#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #8#)
                                             (OR (|HasCategory| |#2| '(|Ring|))
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#2|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #5#
                                                   (|HasCategory| |#2|
                                                                  '(|DifferentialRing|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5# #8#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #7# #5# #8#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #7# #5# #8#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (|HasCategory| |#2|
                                                            '(|SetCategory|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#2|)))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (|HasCategory| |#2|
                                                            '(|BasicType|))
                                             (|HasCategory| (|Integer|)
                                                            '(|OrderedSet|))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (AND #5#
                                                  (|HasCategory| |#2|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #4#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiGroup|))
                                                   . #9#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                             (OR
                                              (|HasCategory| |#2| '(|Monoid|))
                                              #4#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                             (LETT #3#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianMonoid|))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5#
                                              (|HasCategory| |#2| '(|Field|))
                                              #6#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #4#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5#
                                              (|HasCategory| |#2| '(|Field|))
                                              #6#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #8#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #4#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #3#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5#
                                              (|HasCategory| |#2| '(|Field|))
                                              #8#
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #3#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|))
                                              #7# #5# #8#
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (AND #3#
                                                  (|HasCategory| |#2|
                                                                 '(|Monoid|)))
                                             (AND #3#
                                                  (|HasCategory| |#2|
                                                                 '(|SemiRng|)))
                                             (OR #3#
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (|HasCategory| |#2|
                                                            '(|CoercibleTo|
                                                              (|OutputForm|)))
                                             (LETT #2#
                                                   (AND
                                                    (|HasCategory| |#2|
                                                                   '(|RetractableTo|
                                                                     (|Integer|)))
                                                    (|HasCategory| |#2|
                                                                   '(|SetCategory|)))
                                                   . #9#)
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #2#)
                                             (OR #2#
                                                 (|HasCategory| |#2|
                                                                '(|Ring|)))
                                             (LETT #1#
                                                   (AND
                                                    (|HasCategory| |#2|
                                                                   '(|RetractableTo|
                                                                     (|Fraction|
                                                                      (|Integer|))))
                                                    (|HasCategory| |#2|
                                                                   '(|SetCategory|)))
                                                   . #9#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#2|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|)))
                                              #1# #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               #7#
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND #3#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                              (AND #3#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiRng|))))
                                             (OR
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|)))))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|CancellationAbelianMonoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #7#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #5#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|Monoid|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|OrderedAbelianMonoidSup|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #1#)))
                    . #9#))
    (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 281474976710656))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| $ '(|finiteAggregate|))
         (|augmentPredVector| $ 562949953421312))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| $ 2251799813685248))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;6|) $)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;7|) $)))
        ('T (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;8|) $))))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |DIRPROD;retract;$R;9|) $))
       (QSETREFV $ 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;$U;10|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 32 (CONS (|dispatchFunction| |DIRPROD;index;Pi$;11|) $))
       (QSETREFV $ 34 (CONS (|dispatchFunction| |DIRPROD;random;$;12|) $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |DIRPROD;lookup;$Pi;13|) $)))))
    (COND
     ((|testBitVector| |pv$| 34)
      (QSETREFV $ 38
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;Zero;$;14|) $ 38)))))
    (COND
     ((|testBitVector| |pv$| 29)
      (QSETREFV $ 42 (CONS (|dispatchFunction| |DIRPROD;*;3$;15|) $))))
    (COND
     ((|HasCategory| |#2| '(|CancellationAbelianMonoid|))
      (QSETREFV $ 46
                (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2$U;16|) $))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV $ 48
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;One;$;17|) $ 48)))
       (QSETREFV $ 52 (CONS (|dispatchFunction| |DIRPROD;recip;$U;18|) $)))))
    (COND
     ((|testBitVector| |pv$| 34)
      (COND
       ((|testBitVector| |pv$| 7)
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi$;19|)
                        $))))))
    (COND
     ((|HasCategory| |#2| '(|OrderedSet|))
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;20|) $)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;21|) $)))
       ('T (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;22|) $))))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV $ 59 (CONS (|dispatchFunction| |DIRPROD;sup;3$;23|) $))))
    $))) 

(MAKEPROP '|DirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 7) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |copy|) |DIRPROD;coerce;$V;1| |DIRPROD;coerce;R$;2|
              (|List| 7) |DIRPROD;parts;$L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . |size?|) |DIRPROD;directProduct;V$;4|
              (|Integer|) (11 . |minIndex|) (16 . |elt|) (22 . =)
              (|Mapping| 14 7) (28 . |every?|) (34 . =) (40 . |retract|)
              (|Union| 7 '"failed") (45 . |retractIfCan|) (50 . |size|)
              (|PositiveInteger|) (54 . |index|) (59 . |vector|) (64 . |index|)
              (69 . |random|) (73 . |random|) (77 . |lookup|) (82 . |lookup|)
              (87 . |zero|) (92 . |Zero|) (96 . *) (|Mapping| 7 7 7)
              (102 . |map|) (109 . *) (115 . |Zero|) (|Union| $ '"failed")
              (119 . |subtractIfCan|) (125 . |subtractIfCan|) (131 . |One|)
              (135 . |One|) (139 . |maxIndex|) (144 . |qelt|) (150 . |recip|)
              (155 . |recip|) (160 . |setelt!|) (167 . |unitVector|) (172 . <)
              (178 . <) (184 . >) (190 . |sup|) (196 . |sup|) (|Equation| 7)
              (|List| 60) (|Matrix| 18) (|Matrix| $)
              (|Record| (|:| |mat| 62) (|:| |vec| (|Vector| 18))) (|Vector| $)
              (|List| 68) (|List| 15) (|Symbol|) (|Union| 70 '#1="failed")
              (|Fraction| 18) (|Union| 18 '#1#) (|Void|) (|Mapping| 7 7)
              (|OutputForm|) (|CardinalNumber|) (|InputForm|) (|List| $)
              (|Record| (|:| |mat| 79) (|:| |vec| 5)) (|Matrix| 7)
              (|HashState|) (|SingleInteger|) (|String|) (|List| 18))
           '#(~= 202 |zero?| 208 |unitVector| 213 |swap!| 218 |sup| 225
              |subtractIfCan| 231 |smaller?| 237 |size?| 243 |size| 249 |sign|
              253 |setelt!| 258 |sample| 265 |retractIfCan| 269 |retract| 284
              |reducedSystem| 299 |recip| 321 |random| 326 |qsetelt!| 330
              |qelt| 337 |positive?| 343 |parts| 348 |opposite?| 353 |one?| 359
              |negative?| 364 |more?| 369 |minIndex| 375 |min| 380 |members|
              386 |member?| 391 |maxIndex| 397 |max| 402 |map!| 408 |map| 414
              |lookup| 420 |less?| 425 |latex| 431 |indices| 436 |index?| 441
              |index| 447 |hashUpdate!| 452 |hash| 458 |first| 463 |fill!| 468
              |every?| 474 |eval| 480 |eq?| 506 |enumerate| 512 |entry?| 516
              |entries| 522 |empty?| 527 |empty| 532 |elt| 536 |dot| 549
              |directProduct| 555 |dimension| 560 |differentiate| 564 |count|
              614 |copy| 626 |convert| 631 |coerce| 636 |characteristic| 661
              |any?| 665 |annihilate?| 671 |abs| 677 ^ 682 |Zero| 694 |One| 698
              D 702 >= 752 > 758 = 764 <= 770 < 776 / 782 - 788 + 799 * 805 |#|
              841)
           'NIL
           (CONS
            (|makeByteWordVec2| 48
                                '(0 1 4 9 6 6 11 4 9 6 16 17 18 10 3 4 9 21 10
                                  2 5 12 9 21 5 20 5 6 19 0 5 7 13 15 38 0 14
                                  31 37 0 0 30 36 22 0 0 0 0 30 47 5 8 9 13 35
                                  22 48 44))
            (CONS
             '#(|DirectProductCategory&| |VectorSpace&| |OrderedRing&|
                |Algebra&| |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| |Module&| NIL NIL NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL
                NIL |IndexedAggregate&| |OrderedSet&| |Monoid&| |Finite&| NIL
                |AbelianMonoid&| |HomogeneousAggregate&| NIL |SemiGroup&|
                |AbelianSemiGroup&| |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| |FullyRetractableTo&| NIL NIL NIL
                NIL |InnerEvalable&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|VectorSpace| 7)
                 (|OrderedRing|) (|Algebra| 7) (|FullyLinearlyExplicitOver| 7)
                 (|DifferentialExtension| 7) (|Module| 7)
                 (|CharacteristicZero|) (|CommutativeRing|)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 18)
                 (|PartialDifferentialRing| 68) (|DifferentialRing|)
                 (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|OrderedAbelianGroup|) (|BiModule| $$ $$) (|Ring|)
                 (|LeftModule| 7) (|RightModule| 7)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|RightModule| $$) (|Rng|) (|OrderedAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|IndexedAggregate| 18 7)
                 (|OrderedSet|) (|Monoid|) (|Finite|) (|SemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 7) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 18 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 18 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 74) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 76)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 70)
                 (|RetractableTo| 18))
              (|makeByteWordVec2| 83
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 1 7 29 0 35 1 0 29 0 36 1 5 0 15 37
                                    0 0 0 38 2 7 0 0 0 39 3 8 0 40 0 0 41 2 0 0
                                    0 0 42 0 7 0 43 2 7 44 0 0 45 2 0 44 0 0 46
                                    0 7 0 47 0 0 0 48 1 0 18 0 49 2 0 7 0 18 50
                                    1 7 44 0 51 1 0 44 0 52 3 8 7 0 18 7 53 1 0
                                    0 29 54 2 0 14 0 0 55 2 7 14 0 0 56 2 7 14
                                    0 0 57 2 7 0 0 0 58 2 0 0 0 0 59 2 52 14 0
                                    0 1 1 34 14 0 1 1 39 0 29 54 3 51 72 0 18
                                    18 1 2 3 0 0 0 59 2 33 44 0 0 46 2 14 14 0
                                    0 1 2 0 14 0 15 16 0 13 15 1 1 4 18 0 1 3
                                    51 7 0 18 7 1 0 0 0 1 1 46 69 0 1 1 43 71 0
                                    1 1 22 26 0 27 1 46 70 0 1 1 43 18 0 1 1 22
                                    7 0 25 1 26 62 63 1 2 26 64 63 65 1 2 6 78
                                    63 65 1 1 6 79 63 1 1 7 44 0 52 0 13 0 34 3
                                    51 7 0 18 7 1 2 0 7 0 18 50 1 4 14 0 1 1 49
                                    12 0 13 2 34 14 0 0 1 1 7 14 0 1 1 4 14 0 1
                                    2 0 14 0 15 1 1 25 18 0 19 2 5 0 0 0 1 1 49
                                    12 0 1 2 50 14 7 0 1 1 25 18 0 49 2 5 0 0 0
                                    1 2 51 0 73 0 1 2 0 0 73 0 1 1 13 29 0 36 2
                                    0 14 0 15 1 1 22 82 0 1 1 0 83 0 1 2 0 14
                                    18 0 1 1 13 0 29 32 2 22 80 80 0 1 1 22 81
                                    0 1 1 25 7 0 1 2 51 0 0 7 1 2 49 14 22 0 23
                                    3 23 0 0 12 12 1 2 23 0 0 60 1 3 23 0 0 7 7
                                    1 2 23 0 0 61 1 2 0 14 0 0 1 0 13 77 1 2 50
                                    14 7 0 1 1 0 12 0 1 1 0 14 0 1 0 0 0 1 2 0
                                    7 0 18 20 3 0 7 0 18 7 1 2 40 7 0 0 1 1 0 0
                                    5 17 0 1 75 1 2 27 0 0 15 1 1 27 0 0 1 3 28
                                    0 0 66 67 1 2 28 0 0 66 1 3 28 0 0 68 15 1
                                    2 28 0 0 68 1 3 6 0 0 73 15 1 2 6 0 0 73 1
                                    2 50 15 7 0 1 2 49 15 22 0 1 1 0 0 0 1 1 13
                                    76 0 1 1 46 0 70 1 1 45 0 18 1 1 42 74 0 1
                                    1 22 0 7 11 1 0 5 0 10 0 6 15 1 2 49 14 22
                                    0 1 2 6 14 0 0 1 1 4 0 0 1 2 7 0 0 15 1 2
                                    29 0 0 29 1 0 34 0 38 0 7 0 48 2 27 0 0 15
                                    1 1 27 0 0 1 3 28 0 0 66 67 1 2 28 0 0 66 1
                                    3 28 0 0 68 15 1 2 28 0 0 68 1 3 6 0 0 73
                                    15 1 2 6 0 0 73 1 2 5 14 0 0 1 2 5 14 0 0 1
                                    2 52 14 0 0 24 2 5 14 0 0 1 2 5 14 0 0 55 2
                                    1 0 0 7 1 2 32 0 0 0 1 1 32 0 0 1 2 41 0 0
                                    0 1 2 32 0 18 0 1 2 41 0 29 0 1 2 34 0 15 0
                                    1 2 29 0 0 0 42 2 29 0 0 7 1 2 29 0 7 0 1 1
                                    49 15 0 1)))))
           '|lookupComplete|)) 
