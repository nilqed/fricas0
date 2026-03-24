
(SDEFUN |MODMON;setPoly;2Rep;1| ((|mon| (|Rep|)) (% (|Rep|)))
        (SPROG
         ((#1=#:G22 NIL) (|i| NIL) (#2=#:G10 NIL) (|copymon| (|Rep|))
          (|oldm| (|Rep|)))
         (SEQ
          (COND ((SPADCALL |mon| (QREFELT % 12) (QREFELT % 25)) |mon|)
                (#3='T
                 (SEQ (LETT |oldm| (QREFELT % 12))
                      (EXIT
                       (COND
                        ((SPADCALL (|MODMON;leadingCoefficient| |mon| %)
                                   (|spadConstant| % 9) (QREFELT % 26))
                         (|error| "polynomial must be monic"))
                        (#3#
                         (SEQ (LETT |copymon| (|spadConstant| % 18))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (NULL (SPADCALL |mon| (QREFELT % 27))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |copymon|
                                          (SPADCALL
                                           (SPADCALL
                                            (|MODMON;leadingCoefficient| |mon|
                                             %)
                                            (|MODMON;degree| |mon| %)
                                            (QREFELT % 11))
                                           |copymon| (QREFELT % 28)))
                                    (EXIT
                                     (LETT |mon| (|MODMON;reductum| |mon| %))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (SETELT % 12 |copymon|)
                              (SETELT % 14
                                      (SPADCALL (QREFELT % 12) (QREFELT % 13)))
                              (SETELT % 15
                                      (PROG1 (LETT #2# (- (QREFELT % 14) 1))
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#)))
                              (SETELT % 16 (+ (* 2 (QREFELT % 15)) 1))
                              (SETELT % 22 (|MODMON;computePowers| %))
                              (COND
                               ((QREFELT % 17)
                                (SEQ
                                 (COND
                                  ((> (|MODMON;degree| |oldm| %) 1)
                                   (COND
                                    ((NULL
                                      (QEQCAR
                                       (SPADCALL |oldm| (QREFELT % 12)
                                                 (QREFELT % 30))
                                       1))
                                     (EXIT
                                      (SEQ (LETT |i| 1)
                                           (LETT #1# (QREFELT % 15)) G190
                                           (COND
                                            ((|greater_SI| |i| #1#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL (QREFELT % 23) |i|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 23) |i|
                                                          (QREFELT % 32))
                                                         (QREFELT % 33))
                                                        (QREFELT % 34))
                                                       (QREFELT % 35))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL)))))))
                                 (EXIT
                                  (SETELT % 23
                                          (|MODMON;computeFrobeniusPowers|
                                           %))))))
                              (EXIT (QREFELT % 12)))))))))))) 

(SDEFUN |MODMON;modulus;Rep;2| ((% (|Rep|))) (QREFELT % 12)) 

(SDEFUN |MODMON;size;Nni;3| ((% (|NonNegativeInteger|)))
        (* (QREFELT % 14) (SPADCALL (QREFELT % 38)))) 

(SDEFUN |MODMON;random;%;4| ((% (%)))
        (SPROG ((#1=#:G29 NIL) (|i| NIL) (#2=#:G28 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 15))))
                  (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT % 40)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  #2#)
                 (QREFELT % 42))))) 

(SDEFUN |MODMON;index;Pi%;5| ((|np| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((|n| (|Integer|)) (|res| (%)) (|cp| (|PositiveInteger|))
          (|c1| (|Integer|)) (#1=#:G35 NIL) (|i| NIL)
          (|s1| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (- |np| 1)) (LETT |s1| (SPADCALL (QREFELT % 38)))
              (LETT |res| (|spadConstant| % 18))
              (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 14) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c1| (REM |n| |s1|)) (LETT |cp| (+ |c1| 1))
                        (LETT |res|
                              (SPADCALL |res|
                                        (|MODMON;monomial|
                                         (SPADCALL |cp| (QREFELT % 45)) |i| %)
                                        (QREFELT % 28)))
                        (EXIT (LETT |n| (QUOTIENT2 |n| |s1|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODMON;lookup;%Pi;6| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((|res| (|Integer|)) (|c1| (R)) (|dd1| (|NonNegativeInteger|))
          (|dd| NIL) (|s1| (|NonNegativeInteger|)))
         (SEQ (LETT |res| 0) (LETT |s1| (SPADCALL (QREFELT % 38)))
              (SEQ (LETT |dd| (- (QREFELT % 14) 1)) G190
                   (COND ((< |dd| 0) (GO G191)))
                   (SEQ (LETT |dd1| (|MODMON;degree| |x| %))
                        (LETT |c1|
                              (COND
                               ((EQL |dd| |dd1|)
                                (SEQ
                                 (LETT |c1|
                                       (|MODMON;leadingCoefficient| |x| %))
                                 (LETT |x| (|MODMON;reductum| |x| %))
                                 (EXIT |c1|)))
                               ('T (|spadConstant| % 19))))
                        (EXIT
                         (LETT |res|
                               (-
                                (+ (* |res| |s1|)
                                   (SPADCALL |c1| (QREFELT % 47)))
                                1))))
                   (LETT |dd| (+ |dd| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |res| 1))))) 

(SDEFUN |MODMON;Zero;%;7| ((% (%))) (|spadConstant| % 49)) 

(SDEFUN |MODMON;One;%;8| ((% (%))) (|spadConstant| % 50)) 

(SDEFUN |MODMON;*;R2%;9| ((|c| (R)) (|x| (%)) (% (%)))
        (SPADCALL |c| |x| (QREFELT % 51))) 

(SDEFUN |MODMON;*;I2%;10| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |n| (QREFELT % 53)) |x| (QREFELT % 51))) 

(SDEFUN |MODMON;coerce;R%;11| ((|c| (R)) (% (%)))
        (SPADCALL |c| 0 (QREFELT % 11))) 

(SDEFUN |MODMON;coerce;%Of;12| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 57))) 

(SDEFUN |MODMON;coefficient| ((|x| (%)) (|e| (|NonNegativeInteger|)) (% (R)))
        (SPADCALL |x| |e| (QREFELT % 59))) 

(SDEFUN |MODMON;reductum| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 60))) 

(SDEFUN |MODMON;leadingCoefficient| ((|x| (%)) (% (R)))
        (SPADCALL |x| (QREFELT % 61))) 

(SDEFUN |MODMON;degree| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 13))) 

(PUT '|MODMON;lift;%Rep;17| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MODMON;lift;%Rep;17| ((|x| (%)) (% (|Rep|))) |x|) 

(SDEFUN |MODMON;reduce;Rep%;18| ((|p| (|Rep|)) (% (%)))
        (QCDR (SPADCALL |p| (QREFELT % 12) (QREFELT % 63)))) 

(SDEFUN |MODMON;=;2%B;19| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 25))) 

(SDEFUN |MODMON;+;3%;20| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 65))) 

(SDEFUN |MODMON;-;2%;21| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 66))) 

(SDEFUN |MODMON;*;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|p| (|Rep|)) (|ans| (%)) (|n| (|Integer|)))
               (SEQ (LETT |p| (SPADCALL |x| |y| (QREFELT % 68)))
                    (LETT |ans| (|spadConstant| % 49))
                    (SEQ G190
                         (COND
                          ((NULL
                            (> (LETT |n| (|MODMON;degree| |p| %))
                               (QREFELT % 15)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (|MODMON;leadingCoefficient| |p| %)
                                           (SPADCALL (QREFELT % 22)
                                                     (- |n| (QREFELT % 14))
                                                     (QREFELT % 32))
                                           (QREFELT % 52))
                                          (QREFELT % 28)))
                          (EXIT (LETT |p| (|MODMON;reductum| |p| %))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |ans| |p| (QREFELT % 28)))))) 

(SDEFUN |MODMON;Vectorise;%V;23| ((|x| (%)) (% (|Vector| R)))
        (SPROG ((#1=#:G67 NIL) (|i| NIL) (#2=#:G66 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 15))))
                 (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (|MODMON;coefficient|
                                 (SPADCALL |x| (QREFELT % 33)) |i| %))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 #2#)))) 

(SDEFUN |MODMON;UnVectorise;V%;24| ((|vect| (|Vector| R)) (% (%)))
        (SPROG
         ((#1=#:G69 NIL) (#2=#:G68 (|Rep|)) (#3=#:G70 (|Rep|)) (#4=#:G72 NIL)
          (|i| NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |i| 0) (LETT #4# (QREFELT % 15)) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (|MODMON;monomial|
                           (SPADCALL |vect| (+ |i| 1) (QREFELT % 71)) |i| %))
                    (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 28))))
                          ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| % 18))))
           (QREFELT % 34))))) 

(SDEFUN |MODMON;computePowers| ((% (|PrimitiveArray| %)))
        (SPROG
         ((#1=#:G78 NIL) (|i| NIL) (|w| (%)) (|mat| (|PrimitiveArray| %)))
         (SEQ
          (LETT |mat|
                (SPADCALL (QREFELT % 14) (|spadConstant| % 18) (QREFELT % 21)))
          (SPADCALL |mat| 0
                    (SPADCALL (SPADCALL (QREFELT % 12) (QREFELT % 67))
                              (QREFELT % 60))
                    (QREFELT % 35))
          (LETT |w| (SPADCALL (|spadConstant| % 9) 1 (QREFELT % 11)))
          (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 15)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (SPADCALL |mat| |i|
                          (SPADCALL |w|
                                    (SPADCALL |mat| (- |i| 1) (QREFELT % 32))
                                    (QREFELT % 68))
                          (QREFELT % 35))
                (EXIT
                 (COND
                  ((EQL (|MODMON;degree| (SPADCALL |mat| |i| (QREFELT % 32)) %)
                        (QREFELT % 14))
                   (SPADCALL |mat| |i|
                             (SPADCALL
                              (|MODMON;reductum|
                               (SPADCALL |mat| |i| (QREFELT % 32)) %)
                              (SPADCALL
                               (|MODMON;leadingCoefficient|
                                (SPADCALL |mat| |i| (QREFELT % 32)) %)
                               (SPADCALL |mat| 0 (QREFELT % 32))
                               (QREFELT % 52))
                              (QREFELT % 28))
                             (QREFELT % 35))))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MODMON;computeFrobeniusPowers| ((% (|PrimitiveArray| %)))
        (SPROG
         ((#1=#:G83 NIL) (|i| NIL) (|mult| (%)) (|mat| (|PrimitiveArray| %)))
         (SEQ
          (LETT |mat|
                (SPADCALL (QREFELT % 14) (|spadConstant| % 8) (QREFELT % 21)))
          (SPADCALL |mat| 1
                    (LETT |mult|
                          (|MODMON;monomial| (|spadConstant| % 9)
                           (SPADCALL (QREFELT % 38)) %))
                    (QREFELT % 35))
          (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 15)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |mat| |i|
                           (SPADCALL |mult|
                                     (SPADCALL |mat| (- |i| 1) (QREFELT % 32))
                                     (QREFELT % 69))
                           (QREFELT % 35))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MODMON;frobenius;2%;27| ((|a| (%)) (% (%)))
        (SPROG ((|aq| (%)))
               (SEQ (LETT |aq| (|spadConstant| % 18))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |a| (|spadConstant| % 18)
                                      (QREFELT % 72)))
                           (GO G191)))
                         (SEQ
                          (LETT |aq|
                                (SPADCALL |aq|
                                          (SPADCALL
                                           (|MODMON;leadingCoefficient| |a| %)
                                           (SPADCALL (QREFELT % 23)
                                                     (|MODMON;degree| |a| %)
                                                     (QREFELT % 32))
                                           (QREFELT % 52))
                                          (QREFELT % 28)))
                          (EXIT (LETT |a| (|MODMON;reductum| |a| %))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |aq|)))) 

(SDEFUN |MODMON;pow;Pa;28| ((% (|PrimitiveArray| %))) (QREFELT % 22)) 

(SDEFUN |MODMON;monomial| ((|c| (R)) (|e| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|k2| (|NonNegativeInteger|)) (#1=#:G90 NIL)
          (|k1| (|NonNegativeInteger|)))
         (SEQ
          (COND ((< |e| (QREFELT % 14)) (SPADCALL |c| |e| (QREFELT % 11)))
                ((<= |e| (QREFELT % 16))
                 (SPADCALL |c|
                           (SPADCALL (QREFELT % 22) (- |e| (QREFELT % 14))
                                     (QREFELT % 32))
                           (QREFELT % 52)))
                ('T
                 (SEQ (LETT |k1| (QUOTIENT2 |e| (QREFELT % 16)))
                      (LETT |k2|
                            (PROG1 (LETT #1# (- |e| (* |k1| (QREFELT % 16))))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 22) (QREFELT % 15)
                                    (QREFELT % 32))
                          |k1| (QREFELT % 76))
                         (|MODMON;monomial| |c| |k2| %) (QREFELT % 69))
                        (QREFELT % 34))))))))) 

(SDEFUN |MODMON;exquo| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG
         ((#1=#:G102 NIL)
          (|uv| (|Union| (|Record| (|:| |coef1| %) (|:| |coef2| %)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |uv|
                  (SPADCALL |y| (SPADCALL (QREFELT % 37)) |x| (QREFELT % 79)))
            (EXIT
             (COND ((QEQCAR |uv| 1) (CONS 1 "failed"))
                   ('T
                    (PROGN
                     (LETT #1#
                           (CONS 0
                                 (SPADCALL (QCAR (QCDR |uv|)) (QREFELT % 34))))
                     (GO #2=#:G101)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |MODMON;recip;%U;31| ((|y| (%)) (% (|Union| % "failed")))
        (|MODMON;exquo| (|spadConstant| % 8) |y| %)) 

(DECLAIM (NOTINLINE |ModMonic;|)) 

(DEFUN |ModMonic| (|#1| |#2|)
  (SPROG ((#1=#:G5 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ModMonic| DV$1 DV$2))
          (LETT % (GETREFV 86))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1| '(|Finite|))
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 12 (SPADCALL (|spadConstant| % 9) 1 (QREFELT % 11)))
          (QSETREFV % 14 (SPADCALL (QREFELT % 12) (QREFELT % 13)))
          (QSETREFV % 15
                    (PROG1 (LETT #1# (- (QREFELT % 14) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
          (QSETREFV % 16 (+ (* 2 (QREFELT % 15)) 1))
          (QSETREFV % 17 (|HasCategory| |#1| '(|FiniteFieldCategory|)))
          (QSETREFV % 22 (SPADCALL 0 (|spadConstant| % 18) (QREFELT % 21)))
          (QSETREFV % 23 (SPADCALL 0 (|spadConstant| % 18) (QREFELT % 21)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 39 (CONS (|dispatchFunction| |MODMON;size;Nni;3|) %))
             (QSETREFV % 43 (CONS (|dispatchFunction| |MODMON;random;%;4|) %))
             (QSETREFV % 46 (CONS (|dispatchFunction| |MODMON;index;Pi%;5|) %))
             (QSETREFV % 48
                       (CONS (|dispatchFunction| |MODMON;lookup;%Pi;6|) %)))))
          (COND
           ((QREFELT % 17)
            (PROGN
             (QSETREFV % 73
                       (CONS (|dispatchFunction| |MODMON;frobenius;2%;27|)
                             %)))))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV % 80
                       (CONS (|dispatchFunction| |MODMON;recip;%U;31|) %)))))
          %))) 

(MAKEPROP '|ModMonic| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MODMON;One;%;8|) %))
              (0 . |One|) (|NonNegativeInteger|) (4 . |monomial|) '|m|
              (10 . |degree|) '|d| '|d1| '|twod| '|frobenius?|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MODMON;Zero;%;7|) %))
              (15 . |Zero|) (|PrimitiveArray| $$) (19 . |new|) '|power|
              '|frobeniusPower| (|Boolean|) (25 . =) (31 . ~=) (37 . |zero?|)
              |MODMON;+;3%;20| (|Union| % '"failed") (42 . |exquo|) (|Integer|)
              (48 . |elt|) |MODMON;lift;%Rep;17| |MODMON;reduce;Rep%;18|
              (54 . |setelt!|) |MODMON;setPoly;2Rep;1| |MODMON;modulus;Rep;2|
              (61 . |size|) (65 . |size|) (69 . |random|) (|Vector| 6)
              |MODMON;UnVectorise;V%;24| (73 . |random|) (|PositiveInteger|)
              (77 . |index|) (82 . |index|) (87 . |lookup|) (92 . |lookup|)
              (97 . |Zero|) (101 . |One|) (105 . *) |MODMON;*;R2%;9|
              (111 . |coerce|) |MODMON;*;I2%;10| |MODMON;coerce;R%;11|
              (|OutputForm|) (116 . |coerce|) |MODMON;coerce;%Of;12|
              (121 . |coefficient|) (127 . |reductum|)
              (132 . |leadingCoefficient|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (137 . |monicDivide|) |MODMON;=;2%B;19| (143 . +) (149 . -)
              |MODMON;-;2%;21| (154 . *) |MODMON;*;3%;22|
              |MODMON;Vectorise;%V;23| (160 . |elt|) (166 . ~=)
              (172 . |frobenius|) (|PrimitiveArray| %) |MODMON;pow;Pa;28|
              (177 . ^) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 77 '"failed") (183 . |extendedEuclidean|)
              (190 . |recip|) (|String|) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|List| %))
           '#(~= 195 |zero?| 201 |subtractIfCan| 206 |smaller?| 212 |size| 218
              |setPoly| 222 |sample| 227 |rightRecip| 231 |rightPower| 236
              |reduce| 248 |recip| 253 |random| 258 |pow| 262 |plenaryPower|
              266 |opposite?| 272 |one?| 278 |modulus| 283 |lookup| 287 |lift|
              292 |leftRecip| 297 |leftPower| 302 |latex| 314 |index| 319
              |hashUpdate!| 324 |hash| 330 |frobenius| 335 |enumerate| 340
              |convert| 344 |commutator| 349 |coerce| 355 |characteristic| 375
              |associator| 379 |antiCommutator| 386 |annihilate?| 392 ^ 398
              |Zero| 410 |Vectorise| 414 |UnVectorise| 419 |One| 424 = 428 -
              434 + 445 * 451)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(2 2 0 2 0 0 2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0
                                  1 0 0 2 1 0 2 1 0 0 0 0))
            (CONS
             '#(NIL |Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL
                |NonAssociativeRng&| NIL |AbelianGroup&| NIL NIL NIL |Finite&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL |AbelianSemiGroup&| |Magma&| NIL |Hashable&| |SetCategory&|
                NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|CommutativeRing|) (|Algebra| $$) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|) (|Rng|)
                 (|Module| $$) (|SemiRng|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Finite|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|Comparable|) (|AbelianSemiGroup|) (|Magma|)
                 (|CommutativeStar|) (|Hashable|) (|SetCategory|)
                 (|TwoSidedRecip|) (|ConvertibleTo| 82) (|CoercibleTo| 56)
                 (|BasicType|) (|unitsKnown|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 85
                                  '(0 6 0 9 2 7 0 6 10 11 1 7 10 0 13 0 6 0 19
                                    2 20 0 10 2 21 2 7 24 0 0 25 2 6 24 0 0 26
                                    1 0 24 0 27 2 7 29 0 0 30 2 20 2 0 31 32 3
                                    20 2 0 31 2 35 0 6 10 38 0 0 10 39 0 6 0 40
                                    0 0 0 43 1 6 0 44 45 1 0 0 44 46 1 6 44 0
                                    47 1 0 44 0 48 0 7 0 49 0 7 0 50 2 7 0 6 0
                                    51 1 6 0 31 53 1 7 56 0 57 2 7 6 0 10 59 1
                                    7 0 0 60 1 7 6 0 61 2 7 62 0 0 63 2 7 0 0 0
                                    65 1 7 0 0 66 2 7 0 0 0 68 2 41 6 0 31 71 2
                                    0 24 0 0 72 1 0 0 0 73 2 0 0 0 10 76 3 7 78
                                    0 0 0 79 1 0 29 0 80 2 0 24 0 0 72 1 0 24 0
                                    27 2 0 29 0 0 1 2 1 24 0 0 1 0 1 10 39 1 0
                                    7 7 36 0 0 0 1 1 0 29 0 1 2 0 0 0 44 1 2 0
                                    0 0 10 1 1 0 0 7 34 1 0 29 0 80 0 1 0 43 0
                                    0 74 75 2 2 0 0 44 1 2 0 24 0 0 1 1 0 24 0
                                    1 0 0 7 37 1 1 44 0 48 1 0 7 0 33 1 0 29 0
                                    1 2 0 0 0 44 1 2 0 0 0 10 1 1 0 81 0 1 1 1
                                    0 44 46 2 1 83 83 0 1 1 1 84 0 1 1 3 0 0 73
                                    0 1 85 1 1 1 82 0 1 2 0 0 0 0 1 1 0 56 0 58
                                    1 0 0 31 1 1 0 0 6 55 1 2 0 0 1 0 0 10 1 3
                                    0 0 0 0 0 1 2 0 0 0 0 1 2 0 24 0 0 1 2 0 0
                                    0 44 1 2 0 0 0 10 76 0 0 0 18 1 0 41 0 70 1
                                    0 0 41 42 0 0 0 8 2 0 24 0 0 64 2 0 0 0 0 1
                                    1 0 0 0 67 2 0 0 0 0 28 2 0 0 44 0 1 2 0 0
                                    0 0 69 2 0 0 31 0 54 2 0 0 10 0 1 2 0 0 6 0
                                    52)))))
           '|lookupComplete|)) 
