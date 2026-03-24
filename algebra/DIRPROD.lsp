
(SDEFUN |DIRPROD;coerce;%V;1| ((|z| (%)) (% (|Vector| R)))
        (SPADCALL |z| (QREFELT % 9))) 

(SDEFUN |DIRPROD;coerce;R%;2| ((|r| (R)) (% (%))) (MAKEARR1 (QREFELT % 6) |r|)) 

(PUT '|DIRPROD;parts;%L;3| '|SPADreplace| 'VEC2LIST) 

(SDEFUN |DIRPROD;parts;%L;3| ((|x| (%)) (% (|List| R))) (VEC2LIST |x|)) 

(SDEFUN |DIRPROD;directProduct;V%;4| ((|z| (|Vector| R)) (% (%)))
        (COND
         ((SPADCALL |z| (QREFELT % 6) (QREFELT % 16))
          (SPADCALL |z| (QREFELT % 9)))
         ('T (|error| "Not of the correct length")))) 

(SDEFUN |DIRPROD;same?| ((|z| (%)) (% (|Boolean|)))
        (SPROG ((|z1| (R)))
               (SEQ
                (LETT |z1|
                      (SPADCALL |z| (SPADCALL |z| (QREFELT % 19))
                                (QREFELT % 20)))
                (EXIT
                 (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR % |z1|)) |z|
                           (QREFELT % 23)))))) 

(SDEFUN |DIRPROD;same?!0| ((|x| NIL) ($$ NIL))
        (PROG (|z1| %)
          (LETT |z1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |z1| (QREFELT % 21)))))) 

(SDEFUN |DIRPROD;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G18 NIL) (#2=#:G19 NIL) (#3=#:G20 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G17)))
                              (GO #5=#:G15))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G26 NIL) (#2=#:G27 NIL) (#3=#:G28 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G25)))
                              (GO #5=#:G23))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;8| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G34 NIL) (#2=#:G35 NIL) (#3=#:G36 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #3# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G33)))
                              (GO #5=#:G31))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;9| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G42 NIL) (#2=#:G43 NIL) (#3=#:G44 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 6)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF1O |x| |i| 1) (QAREF1O |y| |i| 1)
                                        (QREFELT % 21)))
                             (PROGN
                              (LETT #1# (PROGN (LETT #2# NIL) (GO #4=#:G41)))
                              (GO #5=#:G39))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;%R;10| ((|z| (%)) (% (R)))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT % 6) 0))
           (COND
            ((|DIRPROD;same?| |z| %)
             (EXIT
              (SPADCALL |z| (SPADCALL |z| (QREFELT % 19)) (QREFELT % 20)))))))
         (EXIT (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;%U;11| ((|z| (%)) (% (|Union| R "failed")))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT % 6) 0))
           (COND
            ((|DIRPROD;same?| |z| %)
             (EXIT
              (CONS 0
                    (SPADCALL |z| (SPADCALL |z| (QREFELT % 19))
                              (QREFELT % 20))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi%;12| ((|n| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((L (|List| R)) (#1=#:G59 NIL) (|p| (|Integer|)) (#2=#:G64 NIL)
          (|i| NIL) (#3=#:G57 NIL) (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT % 28))) (LETT |p| (- |n| 1))
              (LETT L
                    (LIST
                     (SPADCALL
                      (PROG1 (LETT #3# (+ (REM |p| N) 1))
                        (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                          '(|Integer|) #3#))
                      (QREFELT % 30))))
              (SEQ (LETT |i| 2) (LETT #2# (QREFELT % 6)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |p| (QUOTIENT2 |p| N))
                        (EXIT
                         (LETT L
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #1# (+ (REM |p| N) 1))
                                   (|check_subtype2| (> #1# 0)
                                                     '(|PositiveInteger|)
                                                     '(|Integer|) #1#))
                                 (QREFELT % 30))
                                L))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL L (QREFELT % 31)))))) 

(SDEFUN |DIRPROD;random;%;13| ((% (%)))
        (SPROG ((#1=#:G68 NIL) (#2=#:G70 NIL) (|i| NIL) (#3=#:G69 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (SETELT #3# #1# (SPADCALL (QREFELT % 33)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(SDEFUN |DIRPROD;lookup;%Pi;14| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((#1=#:G73 NIL) (L (|Integer|)) (#2=#:G76 NIL) (|i| NIL)
          (N (|Integer|)))
         (SEQ (LETT N (SPADCALL (QREFELT % 28)))
              (LETT L
                    (-
                     (SPADCALL (SPADCALL |x| 1 (QREFELT % 20)) (QREFELT % 35))
                     1))
              (SEQ (LETT |i| 2) (LETT #2# (QREFELT % 6)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT L
                           (-
                            (+ (* L N)
                               (SPADCALL (SPADCALL |x| |i| (QREFELT % 20))
                                         (QREFELT % 35)))
                            1))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROG1 (LETT #1# (+ L 1))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))))) 

(SDEFUN |DIRPROD;Zero;%;15| ((% (%))) (SPADCALL (QREFELT % 6) (QREFELT % 37))) 

(SDEFUN |DIRPROD;*;3%;16| ((|u| (%)) (|v| (%)) (% (%)))
        (SPADCALL (ELT % 39) |u| |v| (QREFELT % 41))) 

(SDEFUN |DIRPROD;subtractIfCan;2%U;17|
        ((|u| (%)) (|v| (%)) (% (|Union| % "failed")))
        (SPROG
         ((#1=#:G92 NIL) (|c| (|Union| R "failed")) (#2=#:G93 NIL) (|i| NIL)
          (|w| (%)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT % 44))
                (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 6)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                                      (QREFELT % 46)))
                      (EXIT
                       (COND
                        ((QEQCAR |c| 1)
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #3=#:G91)))
                        ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT % 9))))))
          #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;One;%;18| ((% (%)))
        (MAKEARR1 (QREFELT % 6) (|spadConstant| % 48))) 

(SDEFUN |DIRPROD;recip;%U;19| ((|z| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((#2=#:G106 NIL) (|u| (|Union| R #1#)) (#3=#:G107 NIL) (|i| NIL)
          (|w| (%)))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT % 50))
                (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 6)) G190
                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL (SPADCALL |z| |i| (QREFELT % 51))
                                      (QREFELT % 52)))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #2# (CONS 1 "failed")) (GO #4=#:G105)))
                        ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT % 9))))))
          #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;unitVector;Pi%;20| ((|i| (|PositiveInteger|)) (% (%)))
        (SPROG ((|v| (%)))
               (SEQ (LETT |v| (MAKEARR1 (QREFELT % 6) (|spadConstant| % 43)))
                    (SPADCALL |v| |i| (|spadConstant| % 48) (QREFELT % 54))
                    (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2%B;21| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G115 NIL) (|b| (R)) (|a| (R)) (#2=#:G116 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T) (GO #3=#:G114)))
                              ((< |b| |a|) (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2%B;22| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G122 NIL) (|b| (R)) (|a| (R)) (#2=#:G123 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T) (GO #3=#:G121)))
                              ((< |b| |a|) (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2%B;23| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G129 NIL) (|b| (R)) (|a| (R)) (#2=#:G130 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #1# 'T) (GO #3=#:G128)))
                              ((< |b| |a|) (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;<;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G136 NIL) (|b| (R)) (|a| (R)) (#2=#:G137 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((SPADCALL |a| |b| (QREFELT % 57))
                               (PROGN (LETT #1# 'T) (GO #3=#:G135)))
                              ((SPADCALL |b| |a| (QREFELT % 57))
                               (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |DIRPROD;sup;3%;25| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (ELT % 58) |x| |y| (QREFELT % 41))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G151 NIL) (#2=#:G152 NIL) (#3=#:G153 NIL) (#4=#:G154 NIL)
    (#5=#:G155 NIL) (#6=#:G157 NIL) (#7=#:G156 NIL) (#8=#:G158 NIL)
    (#9=#:G159 NIL) (#10=#:G160 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2))
    (LETT % (GETREFV 84))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#2| '(|unitsKnown|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#2| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#2| '(|Ring|))
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|SetCategory|))
                                        (|HasCategory| |#2| '(|Hashable|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #7# #8#) #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|)))
                                        (AND #5#
                                             (|HasCategory| |#2| '(|Monoid|)))
                                        (AND #5#
                                             (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|)))
                                        (OR
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
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
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #10#)
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
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                                        (OR (|HasCategory| |#2| '(|Monoid|))
                                            #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#2| '(|Ring|))
                                         #3# (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5#
                                         (|HasCategory| |#2| '(|BasicType|))
                                         #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#2| '(|Hashable|))
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#2| '(|Ring|))
                                         #3# (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR #5#
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #10#)
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
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #2#)
                                        (OR #2# (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
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
                                         #6# #1# #2#
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND #5#
                                              (|HasCategory| |#2| '(|Ring|)))
                                         (AND #5#
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|))))
                                        (OR
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
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
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
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
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
                                          #10#)
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
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #5#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #4#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|Hashable|)) (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| % 288230376151711744))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;6|) %)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;7|) %)))
        ((|domainEqual| |#2| (|PositiveInteger|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;8|) %)))
        ('T (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;9|) %))))
       (QSETREFV % 25 (CONS (|dispatchFunction| |DIRPROD;retract;%R;10|) %))
       (QSETREFV % 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;%U;11|) %)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV % 32 (CONS (|dispatchFunction| |DIRPROD;index;Pi%;12|) %))
       (QSETREFV % 34 (CONS (|dispatchFunction| |DIRPROD;random;%;13|) %))
       (QSETREFV % 36 (CONS (|dispatchFunction| |DIRPROD;lookup;%Pi;14|) %)))))
    (COND
     ((|testBitVector| |pv$| 31)
      (QSETREFV % 38
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;Zero;%;15|) % 38)))))
    (COND
     ((|testBitVector| |pv$| 39)
      (QSETREFV % 42 (CONS (|dispatchFunction| |DIRPROD;*;3%;16|) %))))
    (COND
     ((|testBitVector| |pv$| 35)
      (PROGN
       (QSETREFV % 44 (MAKEARR1 |#1| (|spadConstant| % 43)))
       (QSETREFV % 47
                 (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2%U;17|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 10)
      (PROGN
       (QSETREFV % 49
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;One;%;18|) % 49)))
       (QSETREFV % 50 (MAKEARR1 |#1| (|spadConstant| % 48)))
       (QSETREFV % 53 (CONS (|dispatchFunction| |DIRPROD;recip;%U;19|) %)))))
    (COND
     ((|testBitVector| |pv$| 31)
      (COND
       ((|testBitVector| |pv$| 10)
        (QSETREFV % 55
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi%;20|)
                        %))))))
    (COND
     ((|testBitVector| |pv$| 3)
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV % 56 (CONS (|dispatchFunction| |DIRPROD;<;2%B;21|) %)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV % 56 (CONS (|dispatchFunction| |DIRPROD;<;2%B;22|) %)))
       ((|domainEqual| |#2| (|PositiveInteger|))
        (QSETREFV % 56 (CONS (|dispatchFunction| |DIRPROD;<;2%B;23|) %)))
       ('T (QSETREFV % 56 (CONS (|dispatchFunction| |DIRPROD;<;2%B;24|) %))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 59 (CONS (|dispatchFunction| |DIRPROD;sup;3%;25|) %))))
    %))) 

(DEFUN |DirectProduct| (&REST #1=#:G161)
  (SPROG NIL
         (PROG (#2=#:G162)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|DirectProduct|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|)))))))))) 

(MAKEPROP '|DirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 7) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |copy|) |DIRPROD;coerce;%V;1| |DIRPROD;coerce;R%;2|
              (|List| 7) |DIRPROD;parts;%L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . |size?|) |DIRPROD;directProduct;V%;4|
              (|Integer|) (11 . |minIndex|) (16 . |elt|) (22 . =)
              (|Mapping| 14 7) (28 . |every?|) (34 . =) (40 . |retract|)
              (|Union| 7 '"failed") (45 . |retractIfCan|) (50 . |size|)
              (|PositiveInteger|) (54 . |index|) (59 . |vector|) (64 . |index|)
              (69 . |random|) (73 . |random|) (77 . |lookup|) (82 . |lookup|)
              (87 . |zero|) (92 . |Zero|) (96 . *) (|Mapping| 7 7 7)
              (102 . |map|) (109 . *) (115 . |Zero|) '|tmp0|
              (|Union| % '"failed") (119 . |subtractIfCan|)
              (125 . |subtractIfCan|) (131 . |One|) (135 . |One|) '|tmp1|
              (139 . |qelt|) (145 . |recip|) (150 . |recip|) (155 . |setelt!|)
              (162 . |unitVector|) (167 . <) (173 . <) (179 . |sup|)
              (185 . |sup|) (|Mapping| 7 7) (|List| 18) (|List| 63)
              (|Equation| 7) (|Matrix| 18) (|Matrix| %)
              (|Record| (|:| |mat| 64) (|:| |vec| (|Vector| 18))) (|Vector| %)
              (|List| 69) (|Symbol|) (|List| 15) (|Fraction| 18)
              (|Union| 71 '#1="failed") (|Union| 18 '#1#) (|Mapping| 14 7 7)
              (|Void|) (|OutputForm|) (|List| %) (|InputForm|)
              (|SingleInteger|) (|HashState|)
              (|Record| (|:| |mat| 82) (|:| |vec| 5)) (|Matrix| 7) (|String|))
           '#(~= 191 |zero?| 197 |unitVector| 202 |swap!| 207 |sup| 214
              |subtractIfCan| 220 |smaller?| 226 |size?| 232 |size| 238
              |setelt!| 242 |sample| 249 |rightRecip| 253 |rightPower| 258
              |retractIfCan| 270 |retract| 285 |reducedSystem| 300 |recip| 322
              |random| 327 |qsetelt!| 331 |qelt| 338 |plenaryPower| 344 |parts|
              350 |opposite?| 355 |one?| 361 |more?| 366 |minIndex| 372 |min|
              377 |members| 388 |member?| 393 |maxIndex| 399 |max| 404 |map!|
              421 |map| 427 |lookup| 433 |less?| 438 |leftRecip| 444
              |leftPower| 449 |latex| 461 |inf| 466 |indices| 472 |index?| 477
              |index| 483 |hashUpdate!| 488 |hash| 494 |first| 499 |fill!| 504
              |every?| 510 |eval| 516 |eq?| 542 |enumerate| 548 |entry?| 552
              |entries| 558 |empty?| 563 |empty| 568 |elt| 572 |dot| 585
              |directProduct| 591 |differentiate| 596 |count| 646 |copy| 658
              |convert| 663 |commutator| 668 |coerce| 674 |characteristic| 704
              |associator| 708 |any?| 715 |antiCommutator| 721 |annihilate?|
              727 ^ 733 |Zero| 745 |One| 749 D 753 >= 803 > 809 = 815 <= 821 <
              827 - 833 + 844 * 850 |#| 892)
           'NIL
           (CONS
            (|makeByteWordVec2| 51
                                '(0 9 6 16 15 6 6 18 18 6 6 9 9 6 6 8 29 9 11
                                  11 9 1 18 29 14 11 11 8 1 0 7 2 10 9 37 2 17
                                  41 12 10 36 4 0 19 38 41 13 0 20 47 51 19 42
                                  6 40 0 0 43 47 51 19 12 6 5 3 50 40 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL NIL |NonAssociativeSemiRng&|
                NIL |Finite&| |MagmaWithUnit&| |AbelianMonoid&| |OrderedSet&|
                |IndexedAggregate&| |FullyRetractableTo&| |AbelianSemiGroup&|
                |Magma&| NIL |HomogeneousAggregate&| |Hashable&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| NIL |Evalable&| |EltableAggregate&| |Aggregate&|
                |BasicType&| NIL NIL NIL NIL NIL NIL |PartialOrder&| NIL
                |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 7) (|DifferentialExtension| 7)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 69) (|Algebra| 7) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 18)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianMonoidSup|)
                 (|NonAssociativeRng|) (|RightModule| 18) (|RightModule| 7)
                 (|LeftModule| 7) (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedCancellationAbelianMonoid|)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|OrderedAbelianMonoid|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedAbelianSemiGroup|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|Finite|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|OrderedSet|)
                 (|IndexedAggregate| 18 7) (|FullyRetractableTo| 7)
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|HomogeneousAggregate| 7) (|Hashable|) (|RetractableTo| 18)
                 (|RetractableTo| 71) (|RetractableTo| 7) (|SetCategory|)
                 (|CommutativeStar|) (|Evalable| 7) (|EltableAggregate| 18 7)
                 (|Aggregate|) (|BasicType|) (|CoercibleFrom| 18)
                 (|CoercibleFrom| 71) (|CoercibleFrom| 7) (|ConvertibleTo| 78)
                 (|TwoSidedRecip|) (|unitsKnown|) (|PartialOrder|)
                 (|CoercibleTo| 76) (|InnerEvalable| 7 7) (|Eltable| 18 7)
                 (|CoercibleTo| (|Vector| 7)) (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 83
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 7 15 28 1 7
                                    0 29 30 1 8 0 12 31 1 0 0 29 32 0 7 0 33 0
                                    0 0 34 1 7 29 0 35 1 0 29 0 36 1 5 0 15 37
                                    0 0 0 38 2 7 0 0 0 39 3 8 0 40 0 0 41 2 0 0
                                    0 0 42 0 7 0 43 2 7 45 0 0 46 2 0 45 0 0 47
                                    0 7 0 48 0 0 0 49 2 0 7 0 18 51 1 7 45 0 52
                                    1 0 45 0 53 3 8 7 0 18 7 54 1 0 0 29 55 2 0
                                    14 0 0 56 2 7 14 0 0 57 2 7 0 0 0 58 2 0 0
                                    0 0 59 2 59 14 0 0 1 1 56 14 0 1 1 32 0 29
                                    55 3 55 75 0 18 18 1 2 1 0 0 0 59 2 57 45 0
                                    0 47 2 24 14 0 0 1 2 0 14 0 15 16 0 12 15 1
                                    3 55 7 0 18 7 1 0 0 0 1 1 10 45 0 1 2 10 0
                                    0 15 1 2 39 0 0 29 1 1 49 72 0 1 1 46 73 0
                                    1 1 19 26 0 27 1 49 71 0 1 1 46 18 0 1 1 19
                                    7 0 25 1 28 64 65 1 2 28 66 65 67 1 2 9 81
                                    65 67 1 1 9 82 65 1 1 10 45 0 53 0 12 0 34
                                    3 55 7 0 18 7 1 2 0 7 0 18 51 2 6 0 0 29 1
                                    1 52 12 0 13 2 56 14 0 0 1 1 10 14 0 1 2 0
                                    14 0 15 1 1 23 18 0 19 1 53 7 0 1 2 3 0 0 0
                                    1 1 52 12 0 1 2 54 14 7 0 1 1 23 18 0 1 1
                                    53 7 0 1 2 52 7 74 0 1 2 3 0 0 0 1 2 55 0
                                    60 0 1 2 0 0 60 0 1 1 12 29 0 36 2 0 14 0
                                    15 1 1 10 45 0 1 2 10 0 0 15 1 2 39 0 0 29
                                    1 1 19 83 0 1 2 1 0 0 0 1 1 0 61 0 1 2 0 14
                                    18 0 1 1 12 0 29 32 2 20 80 80 0 1 1 20 79
                                    0 1 1 23 7 0 1 2 55 0 0 7 1 2 52 14 22 0 23
                                    2 21 0 0 62 1 3 21 0 0 7 7 1 2 21 0 0 63 1
                                    3 21 0 0 12 12 1 2 0 14 0 0 1 0 12 77 1 2
                                    54 14 7 0 1 1 0 12 0 1 1 0 14 0 1 0 0 0 1 2
                                    0 7 0 18 20 3 0 7 0 18 7 1 2 33 7 0 0 1 1 0
                                    0 5 17 1 25 0 0 1 2 25 0 0 15 1 2 26 0 0 68
                                    1 2 26 0 0 69 1 3 26 0 0 68 70 1 3 26 0 0
                                    69 15 1 2 9 0 0 60 1 3 9 0 0 60 15 1 2 54
                                    15 7 0 1 2 52 15 22 0 1 1 0 0 0 1 1 12 78 0
                                    1 2 9 0 0 0 1 1 0 5 0 10 1 49 0 71 1 1 48 0
                                    18 1 1 45 76 0 1 1 6 0 0 1 1 19 0 7 11 0 9
                                    15 1 3 9 0 0 0 0 1 2 52 14 22 0 1 2 8 0 0 0
                                    1 2 9 14 0 0 1 2 10 0 0 15 1 2 39 0 0 29 1
                                    0 56 0 38 0 10 0 49 1 25 0 0 1 2 25 0 0 15
                                    1 2 26 0 0 68 1 2 26 0 0 69 1 3 26 0 0 68
                                    70 1 3 26 0 0 69 15 1 2 9 0 0 60 1 3 9 0 0
                                    60 15 1 2 3 14 0 0 1 2 3 14 0 0 1 2 59 14 0
                                    0 24 2 3 14 0 0 1 2 3 14 0 0 56 2 58 0 0 0
                                    1 1 58 0 0 1 2 44 0 0 0 1 2 28 0 0 18 1 2
                                    58 0 18 0 1 2 56 0 15 0 1 2 44 0 29 0 1 2
                                    39 0 7 0 1 2 39 0 0 7 1 2 39 0 0 0 42 1 52
                                    15 0 1)))))
           '|lookupComplete|)) 
