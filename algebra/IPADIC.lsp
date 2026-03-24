
(PUT '|IPADIC;characteristic;Nni;1| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |IPADIC;characteristic;Nni;1| ((% (|NonNegativeInteger|))) 0) 

(SDEFUN |IPADIC;euclideanSize;%Nni;2| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 15))) 

(PUT '|IPADIC;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPADIC;stream| ((|x| (%)) (% (|Stream| (|Integer|)))) |x|) 

(PUT '|IPADIC;padic| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPADIC;padic| ((|x| (|Stream| (|Integer|))) (% (%))) |x|) 

(SDEFUN |IPADIC;digits;%S;5| ((|x| (%)) (% (|Stream| (|Integer|))))
        (|IPADIC;stream| |x| %)) 

(SDEFUN |IPADIC;extend;%I%;6| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPADCALL |x| (+ |n| 1) (QREFELT % 20))) 

(SDEFUN |IPADIC;complete;2%;7| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 22))) 

(SDEFUN |IPADIC;modP| ((|n| (|Integer|)) (% (|Integer|)))
        (COND
         ((OR (QREFELT % 7) (EQL (QREFELT % 6) 2))
          (SPADCALL |n| (QREFELT % 6) (QREFELT % 24)))
         ('T (SPADCALL |n| (QREFELT % 6) (QREFELT % 25))))) 

(SDEFUN |IPADIC;modPInfo|
        ((|n| (|Integer|))
         (% (|Record| (|:| |digit| (|Integer|)) (|:| |carry| (|Integer|)))))
        (SPROG
         ((|q| #1=(|Integer|)) (|r| (|Integer|)) (|r0| #2=(|Integer|))
          (|dv| (|Record| (|:| |quotient| #1#) (|:| |remainder| #2#))))
         (SEQ (LETT |dv| (DIVIDE2 |n| (QREFELT % 6))) (LETT |r0| (QCDR |dv|))
              (LETT |q| (QCAR |dv|))
              (COND
               ((SPADCALL (LETT |r| (|IPADIC;modP| |r0| %)) |r0|
                          (QREFELT % 27))
                (LETT |q| (+ |q| (QUOTIENT2 (- |r0| |r|) (QREFELT % 6))))))
              (EXIT (CONS |r| |q|))))) 

(SDEFUN |IPADIC;invModP| ((|n| (|Integer|)) (% (|Integer|)))
        (SPADCALL |n| (QREFELT % 6) (QREFELT % 28))) 

(SDEFUN |IPADIC;modulus;I;11| ((% (|Integer|))) (QREFELT % 6)) 

(SDEFUN |IPADIC;moduloP;%I;12| ((|x| (%)) (% (|Integer|)))
        (COND ((SPADCALL |x| (QREFELT % 30)) 0)
              ('T (SPADCALL |x| (QREFELT % 31))))) 

(SDEFUN |IPADIC;quotientByP;2%;13| ((|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 30)) |x|)
              ('T (SPADCALL |x| (QREFELT % 33))))) 

(SDEFUN |IPADIC;approximate;%2I;14| ((|x| (%)) (|n| #1=(|Integer|)) (% #1#))
        (COND ((OR (<= |n| 0) (SPADCALL |x| (QREFELT % 30))) 0)
              ('T
               (+ (SPADCALL |x| (QREFELT % 31))
                  (* (QREFELT % 6)
                     (SPADCALL (SPADCALL |x| (QREFELT % 33)) (- |n| 1)
                               (QREFELT % 36))))))) 

(SDEFUN |IPADIC;=;2%B;15| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG
         ((|st| (|Stream| (|Integer|))) (#1=#:G78 NIL) (#2=#:G79 NIL) (|i| NIL)
          (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |st| (|IPADIC;stream| (SPADCALL |x| |y| (QREFELT % 37)) %))
            (LETT |n| |$streamCount|)
            (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |st| (QREFELT % 30))
                     (PROGN (LETT #1# 'T) (GO #3=#:G77)))
                    ((SPADCALL (SPADCALL |st| (QREFELT % 31)) 0 (QREFELT % 27))
                     (PROGN (LETT #1# NIL) (GO #3#)))
                    ('T (LETT |st| (SPADCALL |st| (QREFELT % 38)))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |st| (QREFELT % 30)))))
          #3# (EXIT #1#)))) 

(SDEFUN |IPADIC;order;%Nni;16| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((|st| (%)) (#1=#:G86 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |st| (|IPADIC;stream| |x| %))
                      (SEQ (LETT |i| 0) G190
                           (COND ((|greater_SI| |i| 1000) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |st| (QREFELT % 30))
                               (PROGN (LETT #1# 0) (GO #2=#:G85)))
                              ((SPADCALL (SPADCALL |st| (QREFELT % 31)) 0
                                         (QREFELT % 27))
                               (PROGN (LETT #1# |i|) (GO #2#)))
                              ('T
                               (LETT |st| (SPADCALL |st| (QREFELT % 33)))))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (|error|
                        "order: series has more than 1000 leading zero coefs"))))
                #2# (EXIT #1#)))) 

(SDEFUN |IPADIC;Zero;%;17| ((% (%)))
        (|IPADIC;padic| (SPADCALL 0 (SPADCALL (QREFELT % 40)) (QREFELT % 41))
         %)) 

(SDEFUN |IPADIC;One;%;18| ((% (%)))
        (|IPADIC;padic| (SPADCALL 1 (SPADCALL (QREFELT % 40)) (QREFELT % 41))
         %)) 

(SDEFUN |IPADIC;intToPAdic| ((|n| (|Integer|)) (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intToPAdic!0| (VECTOR % |n|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;intToPAdic!0| (($$ NIL))
        (PROG (|n| %)
          (LETT |n| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |n| (|spadConstant| % 42) (QREFELT % 43))
                      (SPADCALL (QREFELT % 40)))
                     ('T
                      (SEQ (LETT |modp| (|IPADIC;modPInfo| |n| %))
                           (EXIT
                            (SPADCALL (QCAR |modp|)
                                      (|IPADIC;intToPAdic| (QCDR |modp|) %)
                                      (QREFELT % 41)))))))))))) 

(SDEFUN |IPADIC;intPlusPAdic|
        ((|n| (|Integer|)) (|x| (|Stream| (|Integer|)))
         (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intPlusPAdic!0| (VECTOR |n| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;intPlusPAdic!0| (($$ NIL))
        (PROG (|x| % |n|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT % 30))
                      (|IPADIC;intToPAdic| |n| %))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL |n| (SPADCALL |x| (QREFELT % 31))
                                        (QREFELT % 47))
                              %))
                       (EXIT
                        (SPADCALL (QCAR |modp|)
                                  (|IPADIC;intPlusPAdic| (QCDR |modp|)
                                   (SPADCALL |x| (QREFELT % 38)) %)
                                  (QREFELT % 41)))))))))))) 

(SDEFUN |IPADIC;intMinusPAdic|
        ((|n| (|Integer|)) (|x| (|Stream| (|Integer|)))
         (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intMinusPAdic!0| (VECTOR |n| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;intMinusPAdic!0| (($$ NIL))
        (PROG (|x| % |n|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT % 30))
                      (|IPADIC;intToPAdic| |n| %))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL |n| (SPADCALL |x| (QREFELT % 31))
                                        (QREFELT % 49))
                              %))
                       (EXIT
                        (SPADCALL (QCAR |modp|)
                                  (|IPADIC;intMinusPAdic| (QCDR |modp|)
                                   (SPADCALL |x| (QREFELT % 38)) %)
                                  (QREFELT % 41)))))))))))) 

(SDEFUN |IPADIC;plusAux|
        ((|n| (|Integer|)) (|x| (|Stream| (|Integer|)))
         (|y| (|Stream| (|Integer|))) (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;plusAux!0| (VECTOR |n| |y| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;plusAux!0| (($$ NIL))
        (PROG (|x| % |y| |n|)
          (LETT |x| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |y| (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT % 30))
                      (COND
                       ((SPADCALL |y| (QREFELT % 30))
                        (EXIT (|IPADIC;intToPAdic| |n| %))))))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (QREFELT % 30))
                       (|IPADIC;intPlusPAdic| |n| |y| %))
                      ((SPADCALL |y| (QREFELT % 30))
                       (|IPADIC;intPlusPAdic| |n| |x| %))
                      ('T
                       (SEQ
                        (LETT |modp|
                              (|IPADIC;modPInfo|
                               (SPADCALL
                                (SPADCALL |n| (SPADCALL |x| (QREFELT % 31))
                                          (QREFELT % 47))
                                (SPADCALL |y| (QREFELT % 31)) (QREFELT % 47))
                               %))
                        (EXIT
                         (SPADCALL (QCAR |modp|)
                                   (|IPADIC;plusAux| (QCDR |modp|)
                                    (SPADCALL |x| (QREFELT % 38))
                                    (SPADCALL |y| (QREFELT % 38)) %)
                                   (QREFELT % 41))))))))))))) 

(SDEFUN |IPADIC;minusAux|
        ((|n| (|Integer|)) (|x| (|Stream| (|Integer|)))
         (|y| (|Stream| (|Integer|))) (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;minusAux!0| (VECTOR |n| |y| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;minusAux!0| (($$ NIL))
        (PROG (|x| % |y| |n|)
          (LETT |x| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |y| (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT % 30))
                      (COND
                       ((SPADCALL |y| (QREFELT % 30))
                        (EXIT (|IPADIC;intToPAdic| |n| %))))))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (QREFELT % 30))
                       (|IPADIC;intMinusPAdic| |n| |y| %))
                      ((SPADCALL |y| (QREFELT % 30))
                       (|IPADIC;intPlusPAdic| |n| |x| %))
                      ('T
                       (SEQ
                        (LETT |modp|
                              (|IPADIC;modPInfo|
                               (SPADCALL
                                (SPADCALL |n| (SPADCALL |x| (QREFELT % 31))
                                          (QREFELT % 47))
                                (SPADCALL |y| (QREFELT % 31)) (QREFELT % 49))
                               %))
                        (EXIT
                         (SPADCALL (QCAR |modp|)
                                   (|IPADIC;minusAux| (QCDR |modp|)
                                    (SPADCALL |x| (QREFELT % 38))
                                    (SPADCALL |y| (QREFELT % 38)) %)
                                   (QREFELT % 41))))))))))))) 

(SDEFUN |IPADIC;+;3%;24| ((|x| (%)) (|y| (%)) (% (%)))
        (|IPADIC;padic|
         (|IPADIC;plusAux| 0 (|IPADIC;stream| |x| %) (|IPADIC;stream| |y| %) %)
         %)) 

(SDEFUN |IPADIC;-;3%;25| ((|x| (%)) (|y| (%)) (% (%)))
        (|IPADIC;padic|
         (|IPADIC;minusAux| 0 (|IPADIC;stream| |x| %) (|IPADIC;stream| |y| %)
          %)
         %)) 

(SDEFUN |IPADIC;-;2%;26| ((|y| (%)) (% (%)))
        (|IPADIC;padic| (|IPADIC;intMinusPAdic| 0 (|IPADIC;stream| |y| %) %) %)) 

(SDEFUN |IPADIC;coerce;I%;27| ((|n| (|Integer|)) (% (%)))
        (|IPADIC;padic| (|IPADIC;intToPAdic| |n| %) %)) 

(SDEFUN |IPADIC;intMult|
        ((|n| (|Integer|)) (|x| (|Stream| (|Integer|)))
         (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intMult!0| (VECTOR |n| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;intMult!0| (($$ NIL))
        (PROG (|x| % |n|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT % 30)) (SPADCALL (QREFELT % 40)))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL |n| (SPADCALL |x| (QREFELT % 31))
                                        (QREFELT % 53))
                              %))
                       (EXIT
                        (SPADCALL (QCAR |modp|)
                                  (|IPADIC;intPlusPAdic| (QCDR |modp|)
                                   (|IPADIC;intMult| |n|
                                    (SPADCALL |x| (QREFELT % 38)) %)
                                   %)
                                  (QREFELT % 41)))))))))))) 

(SDEFUN |IPADIC;*;I2%;29| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (|IPADIC;padic| (|IPADIC;intMult| |n| (|IPADIC;stream| |x| %) %) %)) 

(SDEFUN |IPADIC;timesAux|
        ((|x| (|Stream| (|Integer|))) (|y| (|Stream| (|Integer|)))
         (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;timesAux!0| (VECTOR |y| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;timesAux!0| (($$ NIL))
        (PROG (|x| % |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL) (|car| NIL) (|cdr| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |x| (QREFELT % 30))
                          (SPADCALL |y| (QREFELT % 30)))
                      (SPADCALL (QREFELT % 40)))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL (SPADCALL |x| (QREFELT % 31))
                                        (SPADCALL |y| (QREFELT % 31))
                                        (QREFELT % 53))
                              %))
                       (LETT |car| (QCAR |modp|))
                       (LETT |cdr|
                             (|IPADIC;plusAux| (QCDR |modp|)
                              (|IPADIC;intMult| (SPADCALL |x| (QREFELT % 31))
                               (SPADCALL |y| (QREFELT % 38)) %)
                              (|IPADIC;timesAux| (SPADCALL |x| (QREFELT % 38))
                               |y| %)
                              %))
                       (EXIT (SPADCALL |car| |cdr| (QREFELT % 41)))))))))))) 

(SDEFUN |IPADIC;*;3%;31| ((|x| (%)) (|y| (%)) (% (%)))
        (|IPADIC;padic|
         (|IPADIC;timesAux| (|IPADIC;stream| |x| %) (|IPADIC;stream| |y| %) %)
         %)) 

(SDEFUN |IPADIC;quotientAux|
        ((|x| (|Stream| (|Integer|))) (|y| (|Stream| (|Integer|)))
         (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;quotientAux!0| (VECTOR |y| % |x|))
                          (QREFELT % 46))))) 

(SDEFUN |IPADIC;quotientAux!0| (($$ NIL))
        (PROG (|x| % |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|z0| NIL) (|yy| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT % 30))
                      (|error| "quotientAux: first argument"))
                     ((SPADCALL |y| (QREFELT % 30)) (SPADCALL (QREFELT % 40)))
                     ((SPADCALL (|IPADIC;modP| (SPADCALL |x| (QREFELT % 31)) %)
                                (|spadConstant| % 42) (QREFELT % 43))
                      (COND
                       ((SPADCALL
                         (|IPADIC;modP| (SPADCALL |y| (QREFELT % 31)) %)
                         (|spadConstant| % 42) (QREFELT % 43))
                        (|IPADIC;quotientAux| (SPADCALL |x| (QREFELT % 38))
                         (SPADCALL |y| (QREFELT % 38)) %))
                       ('T (|error| "quotient: quotient not integral"))))
                     ('T
                      (SEQ
                       (LETT |z0|
                             (|IPADIC;modP|
                              (SPADCALL
                               (|IPADIC;invModP| (SPADCALL |x| (QREFELT % 31))
                                %)
                               (SPADCALL |y| (QREFELT % 31)) (QREFELT % 53))
                              %))
                       (LETT |yy|
                             (SPADCALL
                              (|IPADIC;minusAux| (|spadConstant| % 42) |y|
                               (|IPADIC;intMult| |z0| |x| %) %)
                              (QREFELT % 56)))
                       (EXIT
                        (SPADCALL |z0| (|IPADIC;quotientAux| |x| |yy| %)
                                  (QREFELT % 41)))))))))))) 

(SDEFUN |IPADIC;recip;%U;33| ((|x| (%)) (% (|Union| % "failed")))
        (COND
         ((OR (SPADCALL |x| (QREFELT % 30))
              (EQL (|IPADIC;modP| (SPADCALL |x| (QREFELT % 31)) %) 0))
          (CONS 1 "failed"))
         ('T
          (CONS 0
                (|IPADIC;padic|
                 (|IPADIC;quotientAux| (|IPADIC;stream| |x| %)
                  (SPADCALL 1 (SPADCALL (QREFELT % 40)) (QREFELT % 41)) %)
                 %))))) 

(SDEFUN |IPADIC;iExquo|
        ((|xx| (%)) (|yy| (%)) (|n| (|Integer|)) (% (|Union| % "failed")))
        (SPROG ((|rec| (|Union| % "failed")))
               (SEQ
                (COND
                 ((> |n| 1000)
                  (|error|
                   "exquo: quotient by series with many leading zero coefs"))
                 ((SPADCALL |yy| (QREFELT % 30)) (CONS 1 "failed"))
                 ((SPADCALL |xx| (QREFELT % 30))
                  (CONS 0 (|spadConstant| % 35)))
                 ((ZEROP (SPADCALL |yy| (QREFELT % 31)))
                  (COND
                   ((ZEROP (SPADCALL |xx| (QREFELT % 31)))
                    (|IPADIC;iExquo| (SPADCALL |xx| (QREFELT % 33))
                     (SPADCALL |yy| (QREFELT % 33)) (+ |n| 1) %))
                   (#1='T (CONS 1 "failed"))))
                 (#1#
                  (SEQ (LETT |rec| (SPADCALL |yy| (QREFELT % 58)))
                       (EXIT
                        (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL |xx| (QCDR |rec|)
                                               (QREFELT % 55)))))))))))) 

(SDEFUN |IPADIC;exquo;2%U;35| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (|IPADIC;iExquo| (|IPADIC;stream| |x| %) (|IPADIC;stream| |y| %) 0 %)) 

(SDEFUN |IPADIC;divide;2%R;36|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG ((|z| (|Union| % "failed")))
               (SEQ (LETT |z| (SPADCALL |x| |y| (QREFELT % 59)))
                    (EXIT
                     (COND ((QEQCAR |z| 1) (CONS (|spadConstant| % 35) |x|))
                           ('T (CONS (QCDR |z|) (|spadConstant| % 35)))))))) 

(SDEFUN |IPADIC;iSqrt|
        ((|pn| (|Integer|)) (|an| (|Integer|)) (|bn| (|Integer|)) (|bSt| (%))
         (% (%)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|IPADIC;iSqrt!0|
                       (VECTOR (QREFELT % 6) |an| |pn| |bn| % |bSt|))
                 (QREFELT % 65))))) 

(SDEFUN |IPADIC;iSqrt!0| (($$ NIL))
        (PROG (|bSt| % |bn| |pn| |an| |p|)
          (LETT |bSt| (QREFELT $$ 5))
          (LETT % (QREFELT $$ 4))
          (LETT |bn| (QREFELT $$ 3))
          (LETT |pn| (QREFELT $$ 2))
          (LETT |an| (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|bn1| NIL) (|c| NIL) (|aa| NIL) (|nSt| NIL))
                   (SEQ
                    (LETT |bn1|
                          (COND ((SPADCALL |bSt| (QREFELT % 30)) |bn|)
                                ('T
                                 (SPADCALL |bn|
                                           (SPADCALL |pn|
                                                     (SPADCALL |bSt|
                                                               (QREFELT % 31))
                                                     (QREFELT % 53))
                                           (QREFELT % 47)))))
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL |bn1| (SPADCALL |an| |an| (QREFELT % 53))
                                     (QREFELT % 49))
                           |pn| (QREFELT % 62)))
                    (LETT |aa|
                          (|IPADIC;modP|
                           (SPADCALL |c|
                                     (SPADCALL (SPADCALL 2 |an| (QREFELT % 64))
                                               |p| (QREFELT % 28))
                                     (QREFELT % 53))
                           %))
                    (LETT |nSt|
                          (COND ((SPADCALL |bSt| (QREFELT % 30)) |bSt|)
                                ('T (SPADCALL |bSt| (QREFELT % 33)))))
                    (EXIT
                     (SPADCALL |aa|
                               (|IPADIC;iSqrt|
                                (SPADCALL |pn| |p| (QREFELT % 53))
                                (SPADCALL |an|
                                          (SPADCALL |pn| |aa| (QREFELT % 53))
                                          (QREFELT % 47))
                                |bn1| |nSt| %)
                               (QREFELT % 48))))))))) 

(SDEFUN |IPADIC;sqrt;%I%;38| ((|b| (%)) (|a| (|Integer|)) (% (%)))
        (SPROG ((|bb| (|Integer|)))
               (SEQ
                (COND
                 ((EQL (QREFELT % 6) 2)
                  (|error| "sqrt: no square roots in Z2 yet"))
                 ((NULL
                   (ZEROP
                    (|IPADIC;modP|
                     (- (* |a| |a|) (LETT |bb| (SPADCALL |b| (QREFELT % 32))))
                     %)))
                  (|error| "sqrt: not a square root (mod p)"))
                 ('T
                  (SEQ
                   (LETT |b|
                         (COND ((SPADCALL |b| (QREFELT % 30)) |b|)
                               ('T (SPADCALL |b| (QREFELT % 33)))))
                   (LETT |a| (|IPADIC;modP| |a| %))
                   (EXIT
                    (SPADCALL |a| (|IPADIC;iSqrt| (QREFELT % 6) |a| |bb| |b| %)
                              (QREFELT % 48))))))))) 

(SDEFUN |IPADIC;iRoot|
        ((|f| (|SparseUnivariatePolynomial| (|Integer|))) (|alpha| (|Integer|))
         (|invFpx0| (|Integer|)) (|pPow| (|Integer|))
         (% (|Stream| (|Integer|))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|IPADIC;iRoot!0|
                       (VECTOR (QREFELT % 6) |invFpx0| |pPow| % |alpha| |f|))
                 (QREFELT % 46))))) 

(SDEFUN |IPADIC;iRoot!0| (($$ NIL))
        (PROG (|f| |alpha| % |pPow| |invFpx0| |p|)
          (LETT |f| (QREFELT $$ 5))
          (LETT |alpha| (QREFELT $$ 4))
          (LETT % (QREFELT $$ 3))
          (LETT |pPow| (QREFELT $$ 2))
          (LETT |invFpx0| (QREFELT $$ 1))
          (LETT |p| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G228 NIL) (|num| NIL) (|digit| NIL))
                   (SEQ
                    (LETT |num|
                          (SPADCALL
                           (PROG2
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL |f| |alpha| (QREFELT % 68))
                                      |pPow| (QREFELT % 69)))
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                             (|Union| (|Integer|) "failed")
                                             #1#))
                           (QREFELT % 70)))
                    (LETT |digit|
                          (|IPADIC;modP|
                           (SPADCALL |num| |invFpx0| (QREFELT % 53)) %))
                    (EXIT
                     (SPADCALL |digit|
                               (|IPADIC;iRoot| |f|
                                (SPADCALL |alpha|
                                          (SPADCALL |digit| |pPow|
                                                    (QREFELT % 53))
                                          (QREFELT % 47))
                                |invFpx0| (SPADCALL |p| |pPow| (QREFELT % 53))
                                %)
                               (QREFELT % 41))))))))) 

(SDEFUN |IPADIC;root;SupI%;40|
        ((|f| (|SparseUnivariatePolynomial| #1=(|Integer|))) (|x0| #1#)
         (% (%)))
        (SPROG ((|invFpx0| #2=(|Integer|)) (|fpx0| #2#))
               (SEQ (LETT |x0| (|IPADIC;modP| |x0| %))
                    (COND
                     ((NULL
                       (ZEROP
                        (|IPADIC;modP| (SPADCALL |f| |x0| (QREFELT % 68)) %)))
                      (EXIT (|error| "root: not a root (mod p)"))))
                    (LETT |fpx0|
                          (|IPADIC;modP|
                           (SPADCALL (SPADCALL |f| (QREFELT % 71)) |x0|
                                     (QREFELT % 68))
                           %))
                    (EXIT
                     (COND
                      ((ZEROP |fpx0|)
                       (|error|
                        "root: approximate root must be a simple root (mod p)"))
                      ('T
                       (SEQ
                        (LETT |invFpx0|
                              (|IPADIC;modP| (|IPADIC;invModP| |fpx0| %) %))
                        (EXIT
                         (|IPADIC;padic|
                          (SPADCALL |x0|
                                    (|IPADIC;iRoot| |f| |x0| |invFpx0|
                                     (QREFELT % 6) %)
                                    (QREFELT % 41))
                          %))))))))) 

(SDEFUN |IPADIC;termOutput|
        ((|k| (|Integer|)) (|c| (|Integer|)) (% (|OutputForm|)))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT % 10)))
                      (#1='T
                       (SEQ
                        (LETT |mon|
                              (COND ((EQL |k| 1) (QREFELT % 11))
                                    (#1#
                                     (SPADCALL (QREFELT % 11)
                                               (SPADCALL |k| (QREFELT % 10))
                                               (QREFELT % 73)))))
                        (EXIT
                         (COND ((EQL |c| 1) |mon|)
                               ((EQL |c| -1) (SPADCALL |mon| (QREFELT % 74)))
                               (#1#
                                (SPADCALL (SPADCALL |c| (QREFELT % 10)) |mon|
                                          (QREFELT % 75))))))))))) 

(PUT '|IPADIC;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |IPADIC;showAll?| ((% (|Boolean|))) |$streamsShowAll|) 

(SDEFUN |IPADIC;coerce;%Of;43| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|st| (%)) (|st1| (%)) (|n| NIL)
          (#1=#:G265 NIL) (|count| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |st| (|IPADIC;stream| |x| %)) (QREFELT % 30))
            (SPADCALL 0 (QREFELT % 10)))
           (#2='T
            (SEQ (LETT |count| |$streamCount|) (LETT |l| NIL)
                 (SEQ (LETT |n| 0) (LETT #1# |count|) G190
                      (COND
                       ((OR (|greater_SI| |n| #1#)
                            (NULL (NULL (SPADCALL |st| (QREFELT % 30)))))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL (SPADCALL |st| (QREFELT % 31)) 0
                                   (QREFELT % 27))
                         (LETT |l|
                               (CONS
                                (|IPADIC;termOutput| |n|
                                 (SPADCALL |st| (QREFELT % 31)) %)
                                |l|))))
                       (EXIT (LETT |st| (SPADCALL |st| (QREFELT % 33)))))
                      (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                 (COND
                  ((|IPADIC;showAll?| %)
                   (SEQ (LETT |st1| |st|)
                        (EXIT
                         (SEQ (LETT |n| (+ |count| 1)) G190
                              (COND
                               ((NULL
                                 (COND
                                  ((SPADCALL |st| (QREFELT % 76))
                                   (NULL
                                    (SPADCALL |st1|
                                              (SPADCALL |st| (QREFELT % 33))
                                              (QREFELT % 77))))
                                  ('T NIL)))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |st| (QREFELT % 31)) 0
                                           (QREFELT % 27))
                                 (LETT |l|
                                       (CONS
                                        (|IPADIC;termOutput| |n|
                                         (SPADCALL |st| (QREFELT % 31)) %)
                                        |l|))))
                               (COND
                                ((ODDP |n|)
                                 (LETT |st1| (SPADCALL |st1| (QREFELT % 33)))))
                               (EXIT
                                (LETT |st| (SPADCALL |st| (QREFELT % 33)))))
                              (LETT |n| (+ |n| 1)) (GO G190) G191
                              (EXIT NIL))))))
                 (LETT |l|
                       (COND ((SPADCALL |st| (QREFELT % 78)) |l|)
                             (#2#
                              (SEQ
                               (COND
                                ((SPADCALL |st| (SPADCALL |st| (QREFELT % 33))
                                           (QREFELT % 77))
                                 (COND
                                  ((EQL (SPADCALL |st| (QREFELT % 31)) 0)
                                   (EXIT |l|)))))
                               (EXIT
                                (CONS
                                 (SPADCALL (SPADCALL 'O (QREFELT % 80))
                                           (LIST
                                            (SPADCALL (QREFELT % 11)
                                                      (SPADCALL |n|
                                                                (QREFELT % 81))
                                                      (QREFELT % 73)))
                                           (QREFELT % 83))
                                 |l|))))))
                 (EXIT
                  (COND ((NULL |l|) (SPADCALL 0 (QREFELT % 81)))
                        (#2#
                         (SPADCALL (ELT % 84) (NREVERSE |l|)
                                   (QREFELT % 87))))))))))) 

(DECLAIM (NOTINLINE |InnerPAdicInteger;|)) 

(DEFUN |InnerPAdicInteger;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|InnerPAdicInteger| DV$1 DV$2))
          (LETT % (GETREFV 98))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InnerPAdicInteger| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (SPADCALL |#1| (QREFELT % 10)))
          (QSETREFV % 12 (|Stream| (|Integer|)))
          %))) 

(DEFUN |InnerPAdicInteger| (&REST #1=#:G277)
  (SPROG NIL
         (PROG (#2=#:G278)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|InnerPAdicInteger|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerPAdicInteger;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerPAdicInteger|)))))))))) 

(MAKEPROP '|InnerPAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OutputForm|) (|Integer|) (0 . |coerce|) 'PEXPR '|Rep|
              (|NonNegativeInteger|) |IPADIC;characteristic;Nni;1|
              |IPADIC;order;%Nni;16| |IPADIC;euclideanSize;%Nni;2| (|Stream| 9)
              |IPADIC;digits;%S;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IPADIC;One;%;18|) %))
              (5 . |extend|) |IPADIC;extend;%I%;6| (11 . |complete|)
              |IPADIC;complete;2%;7| (16 . |positiveRemainder|)
              (22 . |symmetricRemainder|) (|Boolean|) (28 . ~=) (34 . |invmod|)
              |IPADIC;modulus;I;11| (40 . |empty?|) (45 . |frst|)
              |IPADIC;moduloP;%I;12| (50 . |rst|) |IPADIC;quotientByP;2%;13|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IPADIC;Zero;%;17|) %))
              |IPADIC;approximate;%2I;14| |IPADIC;-;3%;25| (55 . |rst|)
              |IPADIC;=;2%B;15| (60 . |empty|) (64 . |concat|) (70 . |Zero|)
              (74 . =) (80 . |empty|) (|Mapping| %) (84 . |delay|) (89 . +)
              (95 . |concat|) (101 . -) |IPADIC;+;3%;24| |IPADIC;-;2%;26|
              |IPADIC;coerce;I%;27| (107 . *) |IPADIC;*;I2%;29|
              |IPADIC;*;3%;31| (113 . |rest|) (|Union| % '"failed")
              |IPADIC;recip;%U;33| |IPADIC;exquo;2%U;35|
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |IPADIC;divide;2%R;36| (118 . |quo|) (|PositiveInteger|)
              (124 . *) (130 . |delay|) |IPADIC;sqrt;%I%;38|
              (|SparseUnivariatePolynomial| 9) (135 . |elt|) (141 . |exquo|)
              (147 . -) (152 . |differentiate|) |IPADIC;root;SupI%;40|
              (157 . ^) (163 . -) (168 . *) (174 . |explicitEntries?|)
              (179 . |eq?|) (185 . |explicitlyEmpty?|) (|Symbol|)
              (190 . |coerce|) (195 . |coerce|) (|List| %) (200 . |prefix|)
              (206 . +) (|Mapping| 8 8 8) (|List| 8) (212 . |reduce|)
              |IPADIC;coerce;%Of;43| (|String|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %) (|Union| 82 '"failed")
              (|Record| (|:| |coef| 82) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 96 '"failed"))
           '#(~= 218 |zero?| 224 |unitNormal| 229 |unitCanonical| 234 |unit?|
              239 |subtractIfCan| 244 |sqrt| 250 |sizeLess?| 256 |sample| 262
              |root| 266 |rightRecip| 272 |rightPower| 277 |rem| 289 |recip|
              295 |quotientByP| 300 |quo| 305 |principalIdeal| 311
              |plenaryPower| 316 |order| 322 |opposite?| 327 |one?| 333
              |multiEuclidean| 338 |modulus| 344 |moduloP| 348 |leftRecip| 353
              |leftPower| 358 |lcmCoef| 370 |lcm| 376 |latex| 387
              |gcdPolynomial| 392 |gcd| 398 |extendedEuclidean| 409 |extend|
              422 |exquo| 428 |expressIdealMember| 434 |euclideanSize| 440
              |divide| 445 |digits| 451 |complete| 456 |commutator| 461
              |coerce| 467 |characteristic| 482 |associator| 486 |associates?|
              493 |approximate| 499 |antiCommutator| 505 |annihilate?| 511 ^
              517 |Zero| 529 |One| 533 = 537 - 543 + 554 * 560)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL NIL NIL |Algebra&|
                |EntireRing&| NIL NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |Module&| |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |Magma&| |SetCategory&| NIL NIL
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicZero|) (|Ring|) (|SemiRing|)
                 (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRng|) (|Module| $$)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|) (|Magma|)
                 (|SetCategory|) (|CommutativeStar|) (|CoercibleTo| 8)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| 97
                                  '(1 9 8 0 10 2 12 0 0 9 20 1 12 0 0 22 2 9 0
                                    0 0 24 2 9 0 0 0 25 2 9 26 0 0 27 2 9 0 0 0
                                    28 1 12 26 0 30 1 12 9 0 31 1 12 0 0 33 1
                                    17 0 0 38 0 17 0 40 2 17 0 9 0 41 0 9 0 42
                                    2 9 26 0 0 43 0 8 0 44 1 17 0 45 46 2 9 0 0
                                    0 47 2 12 0 9 0 48 2 9 0 0 0 49 2 9 0 0 9
                                    53 1 17 0 0 56 2 9 0 0 0 62 2 9 0 63 0 64 1
                                    12 0 45 65 2 67 9 0 9 68 2 9 57 0 0 69 1 9
                                    0 0 70 1 67 0 0 71 2 8 0 0 0 73 1 8 0 0 74
                                    2 8 0 0 0 75 1 12 26 0 76 2 12 26 0 0 77 1
                                    12 26 0 78 1 79 8 0 80 1 13 8 0 81 2 8 0 0
                                    82 83 2 8 0 0 0 84 2 86 8 85 0 87 2 0 26 0
                                    0 1 1 0 26 0 1 1 0 90 0 1 1 0 0 0 1 1 0 26
                                    0 1 2 0 57 0 0 1 2 0 0 0 9 66 2 0 26 0 0 1
                                    0 0 0 1 2 0 0 67 9 72 1 0 57 0 1 2 0 0 0 63
                                    1 2 0 0 0 13 1 2 0 0 0 0 1 1 0 57 0 58 1 0
                                    0 0 34 2 0 0 0 0 1 1 0 94 82 1 2 0 0 0 63 1
                                    1 0 13 0 15 2 0 26 0 0 1 1 0 26 0 1 2 0 93
                                    82 0 1 0 0 9 29 1 0 9 0 32 1 0 57 0 1 2 0 0
                                    0 63 1 2 0 0 0 13 1 2 0 91 0 0 1 2 0 0 0 0
                                    1 1 0 0 82 1 1 0 89 0 1 2 0 92 92 92 1 2 0
                                    0 0 0 1 1 0 0 82 1 2 0 95 0 0 1 3 0 97 0 0
                                    0 1 2 0 0 0 9 21 2 0 57 0 0 59 2 0 93 82 0
                                    1 1 0 13 0 16 2 0 60 0 0 61 1 0 17 0 18 1 0
                                    0 0 23 2 0 0 0 0 1 1 0 8 0 88 1 0 0 9 52 1
                                    0 0 0 1 0 0 13 14 3 0 0 0 0 0 1 2 0 26 0 0
                                    1 2 0 9 0 9 36 2 0 0 0 0 1 2 0 26 0 0 1 2 0
                                    0 0 63 1 2 0 0 0 13 1 0 0 0 35 0 0 0 19 2 0
                                    26 0 0 39 2 0 0 0 0 37 1 0 0 0 51 2 0 0 0 0
                                    50 2 0 0 63 0 1 2 0 0 0 0 55 2 0 0 9 0 54 2
                                    0 0 13 0 1)))))
           '|lookupComplete|)) 
