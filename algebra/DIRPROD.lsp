
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
        (SPROG ((#1=#:G716 NIL) (#2=#:G717 NIL) (#3=#:G718 NIL) (|i| NIL))
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
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G715))
                                    . #4#)
                              (GO #6=#:G713))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2$B;7| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G723 NIL) (#2=#:G724 NIL) (#3=#:G725 NIL) (|i| NIL))
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
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G722))
                                    . #4#)
                              (GO #6=#:G720))))))
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
                    (SEQ (LETT |i| 0 . #4=(|DIRPROD;=;2$B;8|))
                         (LETT #3# (- (QREFELT $ 6) 1) . #4#) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
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

(SDEFUN |DIRPROD;=;2$B;9| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G738 NIL) (#2=#:G739 NIL) (#3=#:G740 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 1 . #4=(|DIRPROD;=;2$B;9|))
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
                                    (PROGN (LETT #2# NIL . #4#) (GO #5=#:G737))
                                    . #4#)
                              (GO #6=#:G735))))))
                         (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                         (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT 'T)))
                #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;$R;10| ((|z| $) ($ R))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT $ 6) 0))
           (COND
            ((|DIRPROD;same?| |z| $)
             (EXIT
              (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19)) (QREFELT $ 20)))))))
         (EXIT (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;$U;11| ((|z| $) ($ |Union| R "failed"))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT $ 6) 0))
           (COND
            ((|DIRPROD;same?| |z| $)
             (EXIT
              (CONS 0
                    (SPADCALL |z| (SPADCALL |z| (QREFELT $ 19))
                              (QREFELT $ 20))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi$;12| ((|n| |PositiveInteger|) ($ $))
        (SPROG
         ((L (|List| R)) (#1=#:G754 NIL) (|p| (|Integer|)) (#2=#:G759 NIL)
          (|i| NIL) (#3=#:G753 NIL) (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #4=(|DIRPROD;index;Pi$;12|))
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

(SDEFUN |DIRPROD;random;$;13| (($ $))
        (SPROG ((#1=#:G762 NIL) (#2=#:G764 NIL) (|i| NIL) (#3=#:G763 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT $ 6))
                       . #5=(|DIRPROD;random;$;13|))
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

(SDEFUN |DIRPROD;lookup;$Pi;14| ((|x| $) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G766 NIL) (L (|Integer|)) (#2=#:G769 NIL) (|i| NIL)
          (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT $ 28)) . #3=(|DIRPROD;lookup;$Pi;14|))
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

(SDEFUN |DIRPROD;Zero;$;15| (($ $)) (SPADCALL (QREFELT $ 6) (QREFELT $ 37))) 

(SDEFUN |DIRPROD;*;3$;16| ((|u| $) (|v| $) ($ $))
        (SPADCALL (ELT $ 39) |u| |v| (QREFELT $ 41))) 

(SDEFUN |DIRPROD;subtractIfCan;2$U;17| ((|u| $) (|v| $) ($ |Union| $ "failed"))
        (SPROG
         ((#1=#:G784 NIL) (|c| (|Union| R "failed")) (#2=#:G785 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43))
                  . #3=(|DIRPROD;subtractIfCan;2$U;17|))
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
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #4=#:G783)))
                    ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |w|))))
          #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;One;$;18| (($ $))
        (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))) 

(SDEFUN |DIRPROD;recip;$U;19| ((|z| $) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G797 NIL) (|u| (|Union| R #1#)) (#3=#:G798 NIL) (|i| NIL)
          (|w| ($)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |w| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 47))
                  . #4=(|DIRPROD;recip;$U;19|))
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
                     (PROGN (LETT #2# (CONS 1 "failed") . #4#) (GO #5=#:G796)))
                    ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                 (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |w|))))
          #5# (EXIT #2#)))) 

(SDEFUN |DIRPROD;unitVector;Pi$;20| ((|i| |PositiveInteger|) ($ $))
        (SPROG ((|v| ($)))
               (SEQ
                (LETT |v| (MAKEARR1 (QREFELT $ 6) (|spadConstant| $ 43))
                      |DIRPROD;unitVector;Pi$;20|)
                (SPADCALL |v| |i| (|spadConstant| $ 47) (QREFELT $ 53))
                (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2$B;21| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G805 NIL) (|b| (R)) (|a| (R)) (#2=#:G806 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|DIRPROD;<;2$B;21|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|) . #3#)
                            (LETT |b| (QREFELT |y| |i|) . #3#)
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T . #3#) (GO #4=#:G804)))
                              ((< |b| |a|)
                               (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2$B;22| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G811 NIL) (|b| (R)) (|a| (R)) (#2=#:G812 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|DIRPROD;<;2$B;22|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|) . #3#)
                            (LETT |b| (QREFELT |y| |i|) . #3#)
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T . #3#) (GO #4=#:G810)))
                              ((< |b| |a|)
                               (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2$B;23| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G817 NIL) (|b| (R)) (|a| (R)) (#2=#:G818 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|DIRPROD;<;2$B;23|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|) . #3#)
                            (LETT |b| (QREFELT |y| |i|) . #3#)
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T . #3#) (GO #4=#:G816)))
                              ((< |b| |a|)
                               (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2$B;24| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG ((#1=#:G823 NIL) (|b| (R)) (|a| (R)) (#2=#:G824 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0 . #3=(|DIRPROD;<;2$B;24|))
                       (LETT #2# (- (QREFELT $ 6) 1) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|) . #3#)
                            (LETT |b| (QREFELT |y| |i|) . #3#)
                            (EXIT
                             (COND
                              ((SPADCALL |a| |b| (QREFELT $ 56))
                               (PROGN (LETT #1# 'T . #3#) (GO #4=#:G822)))
                              ((SPADCALL |b| |a| (QREFELT $ 56))
                               (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |DIRPROD;sup;3$;25| ((|x| $) (|y| $) ($ $))
        (SPADCALL (ELT $ 57) |x| |y| (QREFELT $ 41))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct| (&REST #1=#:G851)
  (SPROG NIL
         (PROG (#2=#:G852)
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
   ((|pv$| NIL) (#1=#:G842 NIL) (#2=#:G843 NIL) (#3=#:G844 NIL) (#4=#:G845 NIL)
    (#5=#:G846 NIL) (#6=#:G847 NIL) (#7=#:G848 NIL) (#8=#:G849 NIL)
    (#9=#:G850 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #10=(|DirectProduct|))
    (LETT DV$2 (|devaluate| |#2|) . #10#)
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2) . #10#)
    (LETT $ (GETREFV 83) . #10#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Field|))
                                             (|HasCategory| |#2| '(|SemiRng|))
                                             (|HasCategory| |#2|
                                                            '(|AbelianGroup|))
                                             (|HasCategory| |#2|
                                                            '(|OrderedAbelianMonoidSup|))
                                             (LETT #9#
                                                   (|HasCategory| |#2|
                                                                  '(|OrderedSet|))
                                                   . #10#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #9#)
                                             (|HasCategory| |#2|
                                                            '(|unitsKnown|))
                                             (LETT #8#
                                                   (|HasCategory| |#2|
                                                                  '(|CommutativeRing|))
                                                   . #10#)
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|Field|))
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|Field|)))
                                             (|HasCategory| |#2| '(|Ring|))
                                             (|HasCategory| |#2| '(|Monoid|))
                                             (OR #8#
                                                 (|HasCategory| |#2|
                                                                '(|SemiRng|)))
                                             (LETT #7#
                                                   (|HasCategory| |#2|
                                                                  '(|Finite|))
                                                   . #10#)
                                             (OR #7#
                                                 (|HasCategory| |#2|
                                                                '(|OrderedAbelianMonoidSup|))
                                                 #9#)
                                             (|HasCategory| |#2|
                                                            '(|LinearlyExplicitOver|
                                                              (|Integer|)))
                                             (|HasCategory| |#2|
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (LETT #6#
                                                   (|HasCategory| |#2|
                                                                  '(|DifferentialRing|))
                                                   . #10#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              #8# #6#
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
                                              #8# #6#
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
                                             (OR #7# #9#)
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (AND #6#
                                                  (|HasCategory| |#2|
                                                                 '(|Ring|)))
                                             (AND
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2| '(|Ring|)))
                                             (LETT #5#
                                                   (|HasCategory| |#2|
                                                                  '(|AbelianMonoid|))
                                                   . #10#)
                                             (AND #5#
                                                  (|HasCategory| |#2|
                                                                 '(|Monoid|)))
                                             (AND #5#
                                                  (|HasCategory| |#2|
                                                                 '(|SemiRng|)))
                                             (LETT #4#
                                                   (|HasCategory| |#2|
                                                                  '(|CancellationAbelianMonoid|))
                                                   . #10#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5# #4#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #4#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5# #4# #8# #6#
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|)))
                                             (LETT #3#
                                                   (|HasCategory| |#2|
                                                                  '(|SemiGroup|))
                                                   . #10#)
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
                                               #4#)
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
                                               #6#)
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
                                               #7#)
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
                                               #9#)
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
                                               #3#)
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
                                              #3#)
                                             (OR
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5#
                                              (|HasCategory| |#2|
                                                             '(|BasicType|))
                                              #4# #8# #6#
                                              (|HasCategory| |#2| '(|Field|))
                                              #7#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #9#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
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
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              #5# #4# #8# #6#
                                              (|HasCategory| |#2| '(|Field|))
                                              #7#
                                              (|HasCategory| |#2| '(|Monoid|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianMonoidSup|))
                                              #9#
                                              (|HasCategory| |#2| '(|Ring|))
                                              #3#
                                              (|HasCategory| |#2| '(|SemiRng|))
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                             (OR #5#
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
                                                   . #10#)
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
                                               #4#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #8#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #6#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #7#)
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
                                               #9#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               #3#)
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
                                                   . #10#)
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
                                               (|HasCategory| |#2| '(|Field|)))
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|AbelianGroup|))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              (AND #5#
                                                   (|HasCategory| |#2|
                                                                  '(|Field|)))
                                              (AND #5#
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
                                               #4#)
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
                                               #6#)
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
                                               #7#)
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
                                               #9#)
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
                                               #3#)
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SemiRng|)))
                                              #1#)))
                    . #10#))
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
     (OR #5#
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianMonoid|))))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Field|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #4#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND (|HasCategory| |#2| '(|SemiRng|))
              (|HasCategory| $ '(|AbelianGroup|))))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| $ '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| $ 18014398509481984))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 21)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;6|) $)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;7|) $)))
        ((|domainEqual| |#2| (|PositiveInteger|))
         (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;8|) $)))
        ('T (QSETREFV $ 24 (CONS (|dispatchFunction| |DIRPROD;=;2$B;9|) $))))
       (QSETREFV $ 25 (CONS (|dispatchFunction| |DIRPROD;retract;$R;10|) $))
       (QSETREFV $ 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;$U;11|) $)))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV $ 32 (CONS (|dispatchFunction| |DIRPROD;index;Pi$;12|) $))
       (QSETREFV $ 34 (CONS (|dispatchFunction| |DIRPROD;random;$;13|) $))
       (QSETREFV $ 36 (CONS (|dispatchFunction| |DIRPROD;lookup;$Pi;14|) $)))))
    (COND
     ((|testBitVector| |pv$| 29)
      (QSETREFV $ 38
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;Zero;$;15|) $ 38)))))
    (COND
     ((|testBitVector| |pv$| 36)
      (QSETREFV $ 42 (CONS (|dispatchFunction| |DIRPROD;*;3$;16|) $))))
    (COND
     ((|testBitVector| |pv$| 32)
      (QSETREFV $ 46
                (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2$U;17|) $))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV $ 48
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;One;$;18|) $ 48)))
       (QSETREFV $ 52 (CONS (|dispatchFunction| |DIRPROD;recip;$U;19|) $)))))
    (COND
     ((|testBitVector| |pv$| 29)
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV $ 54
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi$;20|)
                        $))))))
    (COND
     ((|testBitVector| |pv$| 5)
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;21|) $)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;22|) $)))
       ((|domainEqual| |#2| (|PositiveInteger|))
        (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;23|) $)))
       ('T (QSETREFV $ 55 (CONS (|dispatchFunction| |DIRPROD;<;2$B;24|) $))))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 58 (CONS (|dispatchFunction| |DIRPROD;sup;3$;25|) $))))
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
              (178 . <) (184 . |sup|) (190 . |sup|) (|List| 60) (|Equation| 7)
              (|Record| (|:| |mat| 64) (|:| |vec| (|Vector| 18))) (|Matrix| $)
              (|Vector| $) (|Matrix| 18) (|List| 67) (|List| 15) (|Symbol|)
              (|Union| 69 '#1="failed") (|Fraction| 18) (|Union| 18 '#1#)
              (|Void|) (|Mapping| 7 7) (|OutputForm|) (|CardinalNumber|)
              (|InputForm|) (|List| $) (|Record| (|:| |mat| 78) (|:| |vec| 5))
              (|Matrix| 7) (|SingleInteger|) (|String|) (|HashState|)
              (|List| 18))
           '#(~= 196 |zero?| 202 |unitVector| 207 |swap!| 212 |sup| 219
              |subtractIfCan| 225 |smaller?| 231 |size?| 237 |size| 243
              |setelt!| 247 |sample| 254 |rightRecip| 258 |rightPower| 263
              |retractIfCan| 275 |retract| 290 |reducedSystem| 305 |recip| 327
              |random| 332 |qsetelt!| 336 |qelt| 343 |parts| 349 |opposite?|
              354 |one?| 360 |more?| 365 |minIndex| 371 |min| 376 |members| 382
              |member?| 387 |maxIndex| 393 |max| 398 |map!| 404 |map| 410
              |lookup| 416 |less?| 421 |leftRecip| 427 |leftPower| 432 |latex|
              444 |indices| 449 |index?| 454 |index| 460 |hashUpdate!| 465
              |hash| 471 |first| 476 |fill!| 481 |every?| 487 |eval| 493 |eq?|
              519 |enumerate| 525 |entry?| 529 |entries| 535 |empty?| 540
              |empty| 545 |elt| 549 |dot| 562 |directProduct| 568 |dimension|
              573 |differentiate| 577 |count| 627 |copy| 639 |convert| 644
              |commutator| 649 |coerce| 655 |characteristic| 685 |associator|
              689 |any?| 696 |antiCommutator| 702 |annihilate?| 708 ^ 714
              |Zero| 726 |One| 730 D 734 >= 784 > 790 = 796 <= 802 < 808 / 814
              - 820 + 831 * 837 |#| 873)
           'NIL
           (CONS
            (|makeByteWordVec2| 48
                                '(0 8 11 11 8 8 11 16 17 18 20 1 11 20 10 2 8 9
                                  4 11 13 0 9 2 4 2 13 20 3 4 4 34 11 12 0 6 33
                                  12 14 38 19 0 15 38 35 0 0 37 40 21 0 0 0 0
                                  37 47 5 7 8 14 39 21 48 44))
            (CONS
             '#(|DirectProductCategory&| NIL |FullyLinearlyExplicitOver&|
                |DifferentialExtension&| |Algebra&| |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |VectorSpace&| NIL |Rng&| |Module&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL NIL NIL
                |IndexedAggregate&| |OrderedSet&| |AbelianMonoid&|
                |MagmaWithUnit&| |Finite&| NIL |NonAssociativeSemiRng&|
                |HomogeneousAggregate&| NIL |Magma&| |AbelianSemiGroup&|
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&|
                |FullyRetractableTo&| NIL NIL NIL NIL |InnerEvalable&| NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|DirectProductCategory| 6 7) (|CommutativeRing|)
                 (|FullyLinearlyExplicitOver| 7) (|DifferentialExtension| 7)
                 (|Algebra| $$) (|Algebra| 7) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 18) (|PartialDifferentialRing| 67)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 7) (|SemiRing|)
                 (|Rng|) (|Module| 7) (|SemiRng|) (|Module| $$)
                 (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|OrderedCancellationAbelianMonoid|)
                 (|RightModule| $$) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|IndexedAggregate| 18 7) (|OrderedSet|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 7)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|Aggregate|)
                 (|EltableAggregate| 18 7) (|Evalable| 7) (|SetCategory|)
                 (|FullyRetractableTo| 7) (|Type|) (|finiteAggregate|)
                 (|CoercibleTo| (|Vector| 7)) (|Eltable| 18 7)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 73) (|PartialOrder|)
                 (|unitsKnown|) (|CommutativeStar|) (|ConvertibleTo| 75)
                 (|BasicType|) (|RetractableTo| 7) (|RetractableTo| 69)
                 (|RetractableTo| 18))
              (|makeByteWordVec2| 82
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 1 7 29 0 35 1 0 29 0 36 1 5 0 15 37
                                    0 0 0 38 2 7 0 0 0 39 3 8 0 40 0 0 41 2 0 0
                                    0 0 42 0 7 0 43 2 7 44 0 0 45 2 0 44 0 0 46
                                    0 7 0 47 0 0 0 48 1 0 18 0 49 2 0 7 0 18 50
                                    1 7 44 0 51 1 0 44 0 52 3 8 7 0 18 7 53 1 0
                                    0 29 54 2 0 14 0 0 55 2 7 14 0 0 56 2 7 0 0
                                    0 57 2 0 0 0 0 58 2 55 14 0 0 1 1 52 14 0 1
                                    1 30 0 29 54 3 51 71 0 18 18 1 2 4 0 0 0 58
                                    2 53 44 0 0 46 2 25 14 0 0 1 2 0 14 0 15 16
                                    0 14 15 1 3 51 7 0 18 7 1 0 0 0 1 1 12 44 0
                                    1 2 12 0 0 15 1 2 36 0 0 29 1 1 46 68 0 1 1
                                    43 70 0 1 1 21 26 0 27 1 46 69 0 1 1 43 18
                                    0 1 1 21 7 0 25 2 26 61 62 63 1 1 26 64 62
                                    1 2 11 77 62 63 1 1 11 78 62 1 1 12 44 0 52
                                    0 14 0 34 3 51 7 0 18 7 1 2 0 7 0 18 50 1
                                    49 12 0 13 2 52 14 0 0 1 1 12 14 0 1 2 0 14
                                    0 15 1 1 24 18 0 19 2 5 0 0 0 1 1 49 12 0 1
                                    2 50 14 7 0 1 1 24 18 0 49 2 5 0 0 0 1 2 51
                                    0 72 0 1 2 0 0 72 0 1 1 14 29 0 36 2 0 14 0
                                    15 1 1 12 44 0 1 2 12 0 0 15 1 2 36 0 0 29
                                    1 1 21 80 0 1 1 0 82 0 1 2 0 14 18 0 1 1 14
                                    0 29 32 2 21 81 81 0 1 1 21 79 0 1 1 24 7 0
                                    1 2 51 0 0 7 1 2 49 14 22 0 23 3 22 0 0 7 7
                                    1 3 22 0 0 12 12 1 2 22 0 0 59 1 2 22 0 0
                                    60 1 2 0 14 0 0 1 0 14 76 1 2 50 14 7 0 1 1
                                    0 12 0 1 1 0 14 0 1 0 0 0 1 2 0 7 0 18 20 3
                                    0 7 0 18 7 1 2 31 7 0 0 1 1 0 0 5 17 0 1 74
                                    1 2 27 0 0 15 1 1 27 0 0 1 3 28 0 0 67 15 1
                                    3 28 0 0 65 66 1 2 28 0 0 67 1 2 28 0 0 65
                                    1 2 11 0 0 72 1 3 11 0 0 72 15 1 2 50 15 7
                                    0 1 2 49 15 22 0 1 1 0 0 0 1 1 14 75 0 1 2
                                    11 0 0 0 1 1 46 0 69 1 1 45 0 18 1 1 42 73
                                    0 1 1 8 0 0 1 1 21 0 7 11 1 0 5 0 10 0 11
                                    15 1 3 11 0 0 0 0 1 2 49 14 22 0 1 2 2 0 0
                                    0 1 2 11 14 0 0 1 2 12 0 0 15 1 2 36 0 0 29
                                    1 0 52 0 38 0 12 0 48 2 27 0 0 15 1 1 27 0
                                    0 1 3 28 0 0 65 66 1 2 28 0 0 65 1 3 28 0 0
                                    67 15 1 2 28 0 0 67 1 2 11 0 0 72 1 3 11 0
                                    0 72 15 1 2 5 14 0 0 1 2 5 14 0 0 1 2 55 14
                                    0 0 24 2 5 14 0 0 1 2 5 14 0 0 55 2 1 0 0 7
                                    1 2 54 0 0 0 1 1 54 0 0 1 2 41 0 0 0 1 2 54
                                    0 18 0 1 2 52 0 15 0 1 2 41 0 29 0 1 2 36 0
                                    0 0 42 2 36 0 7 0 1 2 36 0 0 7 1 1 49 15 0
                                    1)))))
           '|lookupComplete|)) 
