
(PUT '|IPADIC;characteristic;Nni;1| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |IPADIC;characteristic;Nni;1| (($ |NonNegativeInteger|)) 0) 

(SDEFUN |IPADIC;euclideanSize;$Nni;2| ((|x| $) ($ |NonNegativeInteger|))
        (SPADCALL |x| (QREFELT $ 15))) 

(PUT '|IPADIC;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPADIC;stream| ((|x| $) ($ |Stream| (|Integer|))) |x|) 

(PUT '|IPADIC;padic| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IPADIC;padic| ((|x| |Stream| (|Integer|)) ($ $)) |x|) 

(SDEFUN |IPADIC;digits;$S;5| ((|x| $) ($ |Stream| (|Integer|)))
        (|IPADIC;stream| |x| $)) 

(SDEFUN |IPADIC;extend;$I$;6| ((|x| $) (|n| |Integer|) ($ $))
        (SPADCALL |x| (+ |n| 1) (QREFELT $ 20))) 

(SDEFUN |IPADIC;complete;2$;7| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 22))) 

(SDEFUN |IPADIC;modP| ((|n| |Integer|) ($ |Integer|))
        (COND
         ((OR (QREFELT $ 7) (EQL (QREFELT $ 6) 2))
          (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 24)))
         ('T (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 25))))) 

(SDEFUN |IPADIC;modPInfo|
        ((|n| |Integer|)
         ($ |Record| (|:| |digit| (|Integer|)) (|:| |carry| (|Integer|))))
        (SPROG
         ((|q| #1=(|Integer|)) (|r| (|Integer|)) (|r0| #2=(|Integer|))
          (|dv| (|Record| (|:| |quotient| #1#) (|:| |remainder| #2#))))
         (SEQ (LETT |dv| (DIVIDE2 |n| (QREFELT $ 6)) . #3=(|IPADIC;modPInfo|))
              (LETT |r0| (QCDR |dv|) . #3#) (LETT |q| (QCAR |dv|) . #3#)
              (COND
               ((SPADCALL (LETT |r| (|IPADIC;modP| |r0| $) . #3#) |r0|
                          (QREFELT $ 27))
                (LETT |q| (+ |q| (QUOTIENT2 (- |r0| |r|) (QREFELT $ 6)))
                      . #3#)))
              (EXIT (CONS |r| |q|))))) 

(SDEFUN |IPADIC;invModP| ((|n| |Integer|) ($ |Integer|))
        (SPADCALL |n| (QREFELT $ 6) (QREFELT $ 28))) 

(SDEFUN |IPADIC;modulus;I;11| (($ |Integer|)) (QREFELT $ 6)) 

(SDEFUN |IPADIC;moduloP;$I;12| ((|x| $) ($ |Integer|))
        (COND ((SPADCALL |x| (QREFELT $ 30)) 0)
              ('T (SPADCALL |x| (QREFELT $ 31))))) 

(SDEFUN |IPADIC;quotientByP;2$;13| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 30)) |x|)
              ('T (SPADCALL |x| (QREFELT $ 33))))) 

(SDEFUN |IPADIC;approximate;$2I;14| ((|x| $) (|n| . #1=(|Integer|)) ($ . #1#))
        (COND
         ((OR (SPADCALL |n| 0 (QREFELT $ 36)) (SPADCALL |x| (QREFELT $ 30))) 0)
         ('T
          (+ (SPADCALL |x| (QREFELT $ 31))
             (* (QREFELT $ 6)
                (SPADCALL (SPADCALL |x| (QREFELT $ 33)) (- |n| 1)
                          (QREFELT $ 37))))))) 

(SDEFUN |IPADIC;=;2$B;15| ((|x| $) (|y| $) ($ |Boolean|))
        (SPROG
         ((|st| (|Stream| (|Integer|))) (#1=#:G774 NIL) (#2=#:G775 NIL)
          (|i| NIL) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |st| (|IPADIC;stream| (SPADCALL |x| |y| (QREFELT $ 38)) $)
                  . #3=(|IPADIC;=;2$B;15|))
            (LETT |n| |$streamCount| . #3#)
            (SEQ (LETT |i| 0 . #3#) (LETT #2# |n| . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |st| (QREFELT $ 30))
                     (PROGN (LETT #1# 'T . #3#) (GO #4=#:G773)))
                    ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0 (QREFELT $ 27))
                     (PROGN (LETT #1# NIL . #3#) (GO #4#)))
                    ('T (LETT |st| (SPADCALL |st| (QREFELT $ 39)) . #3#)))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |st| (QREFELT $ 30)))))
          #4# (EXIT #1#)))) 

(SDEFUN |IPADIC;order;$Nni;16| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((|st| ($)) (#1=#:G781 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |st| (|IPADIC;stream| |x| $)
                        . #2=(|IPADIC;order;$Nni;16|))
                  (SEQ (LETT |i| 0 . #2#) G190
                       (COND ((|greater_SI| |i| 1000) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |st| (QREFELT $ 30))
                           (PROGN (LETT #1# 0 . #2#) (GO #3=#:G780)))
                          ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0
                                     (QREFELT $ 27))
                           (PROGN (LETT #1# |i| . #2#) (GO #3#)))
                          ('T
                           (LETT |st| (SPADCALL |st| (QREFELT $ 33)) . #2#)))))
                       (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (|error|
                    "order: series has more than 1000 leading zero coefs"))))
                #3# (EXIT #1#)))) 

(SDEFUN |IPADIC;Zero;$;17| (($ $))
        (|IPADIC;padic| (SPADCALL 0 (SPADCALL (QREFELT $ 41)) (QREFELT $ 42))
         $)) 

(SDEFUN |IPADIC;One;$;18| (($ $))
        (|IPADIC;padic| (SPADCALL 1 (SPADCALL (QREFELT $ 41)) (QREFELT $ 42))
         $)) 

(SDEFUN |IPADIC;intToPAdic| ((|n| |Integer|) ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intToPAdic!0| (VECTOR $ |n|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;intToPAdic!0| (($$ NIL))
        (PROG (|n| $)
          (LETT |n| (QREFELT $$ 1) . #1=(|IPADIC;intToPAdic|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |n| (|spadConstant| $ 43) (QREFELT $ 44))
                      (SPADCALL (QREFELT $ 41)))
                     ('T
                      (SEQ (LETT |modp| (|IPADIC;modPInfo| |n| $) NIL)
                           (EXIT
                            (SPADCALL (QCAR |modp|)
                                      (|IPADIC;intToPAdic| (QCDR |modp|) $)
                                      (QREFELT $ 42)))))))))))) 

(SDEFUN |IPADIC;intPlusPAdic|
        ((|n| |Integer|) (|x| |Stream| (|Integer|)) ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intPlusPAdic!0| (VECTOR |n| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;intPlusPAdic!0| (($$ NIL))
        (PROG (|x| $ |n|)
          (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;intPlusPAdic|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 30))
                      (|IPADIC;intToPAdic| |n| $))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                        (QREFELT $ 48))
                              $)
                             NIL)
                       (EXIT
                        (SPADCALL (QCAR |modp|)
                                  (|IPADIC;intPlusPAdic| (QCDR |modp|)
                                   (SPADCALL |x| (QREFELT $ 39)) $)
                                  (QREFELT $ 42)))))))))))) 

(SDEFUN |IPADIC;intMinusPAdic|
        ((|n| |Integer|) (|x| |Stream| (|Integer|)) ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intMinusPAdic!0| (VECTOR |n| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;intMinusPAdic!0| (($$ NIL))
        (PROG (|x| $ |n|)
          (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;intMinusPAdic|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 30))
                      (|IPADIC;intToPAdic| |n| $))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                        (QREFELT $ 50))
                              $)
                             NIL)
                       (EXIT
                        (SPADCALL (QCAR |modp|)
                                  (|IPADIC;intMinusPAdic| (QCDR |modp|)
                                   (SPADCALL |x| (QREFELT $ 39)) $)
                                  (QREFELT $ 42)))))))))))) 

(SDEFUN |IPADIC;plusAux|
        ((|n| |Integer|) (|x| |Stream| (|Integer|)) (|y| |Stream| (|Integer|))
         ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;plusAux!0| (VECTOR |n| |y| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;plusAux!0| (($$ NIL))
        (PROG (|x| $ |y| |n|)
          (LETT |x| (QREFELT $$ 3) . #1=(|IPADIC;plusAux|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |y| (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 30))
                      (COND
                       ((SPADCALL |y| (QREFELT $ 30))
                        (EXIT (|IPADIC;intToPAdic| |n| $))))))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (QREFELT $ 30))
                       (|IPADIC;intPlusPAdic| |n| |y| $))
                      ((SPADCALL |y| (QREFELT $ 30))
                       (|IPADIC;intPlusPAdic| |n| |x| $))
                      ('T
                       (SEQ
                        (LETT |modp|
                              (|IPADIC;modPInfo|
                               (SPADCALL
                                (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                          (QREFELT $ 48))
                                (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 48))
                               $)
                              NIL)
                        (EXIT
                         (SPADCALL (QCAR |modp|)
                                   (|IPADIC;plusAux| (QCDR |modp|)
                                    (SPADCALL |x| (QREFELT $ 39))
                                    (SPADCALL |y| (QREFELT $ 39)) $)
                                   (QREFELT $ 42))))))))))))) 

(SDEFUN |IPADIC;minusAux|
        ((|n| |Integer|) (|x| |Stream| (|Integer|)) (|y| |Stream| (|Integer|))
         ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;minusAux!0| (VECTOR |n| |y| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;minusAux!0| (($$ NIL))
        (PROG (|x| $ |y| |n|)
          (LETT |x| (QREFELT $$ 3) . #1=(|IPADIC;minusAux|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |y| (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 30))
                      (COND
                       ((SPADCALL |y| (QREFELT $ 30))
                        (EXIT (|IPADIC;intToPAdic| |n| $))))))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (QREFELT $ 30))
                       (|IPADIC;intMinusPAdic| |n| |y| $))
                      ((SPADCALL |y| (QREFELT $ 30))
                       (|IPADIC;intPlusPAdic| |n| |x| $))
                      ('T
                       (SEQ
                        (LETT |modp|
                              (|IPADIC;modPInfo|
                               (SPADCALL
                                (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                          (QREFELT $ 48))
                                (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 50))
                               $)
                              NIL)
                        (EXIT
                         (SPADCALL (QCAR |modp|)
                                   (|IPADIC;minusAux| (QCDR |modp|)
                                    (SPADCALL |x| (QREFELT $ 39))
                                    (SPADCALL |y| (QREFELT $ 39)) $)
                                   (QREFELT $ 42))))))))))))) 

(SDEFUN |IPADIC;+;3$;24| ((|x| $) (|y| $) ($ $))
        (|IPADIC;padic|
         (|IPADIC;plusAux| 0 (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) $)
         $)) 

(SDEFUN |IPADIC;-;3$;25| ((|x| $) (|y| $) ($ $))
        (|IPADIC;padic|
         (|IPADIC;minusAux| 0 (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $)
          $)
         $)) 

(SDEFUN |IPADIC;-;2$;26| ((|y| $) ($ $))
        (|IPADIC;padic| (|IPADIC;intMinusPAdic| 0 (|IPADIC;stream| |y| $) $) $)) 

(SDEFUN |IPADIC;coerce;I$;27| ((|n| |Integer|) ($ $))
        (|IPADIC;padic| (|IPADIC;intToPAdic| |n| $) $)) 

(SDEFUN |IPADIC;intMult|
        ((|n| |Integer|) (|x| |Stream| (|Integer|)) ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;intMult!0| (VECTOR |n| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;intMult!0| (($$ NIL))
        (PROG (|x| $ |n|)
          (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;intMult|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 30)) (SPADCALL (QREFELT $ 41)))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL |n| (SPADCALL |x| (QREFELT $ 31))
                                        (QREFELT $ 54))
                              $)
                             NIL)
                       (EXIT
                        (SPADCALL (QCAR |modp|)
                                  (|IPADIC;intPlusPAdic| (QCDR |modp|)
                                   (|IPADIC;intMult| |n|
                                    (SPADCALL |x| (QREFELT $ 39)) $)
                                   $)
                                  (QREFELT $ 42)))))))))))) 

(SDEFUN |IPADIC;*;I2$;29| ((|n| |Integer|) (|x| $) ($ $))
        (|IPADIC;padic| (|IPADIC;intMult| |n| (|IPADIC;stream| |x| $) $) $)) 

(SDEFUN |IPADIC;timesAux|
        ((|x| |Stream| (|Integer|)) (|y| |Stream| (|Integer|))
         ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;timesAux!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;timesAux!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;timesAux|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|modp| NIL) (|car| NIL) (|cdr| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |x| (QREFELT $ 30))
                          (SPADCALL |y| (QREFELT $ 30)))
                      (SPADCALL (QREFELT $ 41)))
                     ('T
                      (SEQ
                       (LETT |modp|
                             (|IPADIC;modPInfo|
                              (SPADCALL (SPADCALL |x| (QREFELT $ 31))
                                        (SPADCALL |y| (QREFELT $ 31))
                                        (QREFELT $ 54))
                              $)
                             NIL)
                       (LETT |car| (QCAR |modp|) NIL)
                       (LETT |cdr|
                             (|IPADIC;plusAux| (QCDR |modp|)
                              (|IPADIC;intMult| (SPADCALL |x| (QREFELT $ 31))
                               (SPADCALL |y| (QREFELT $ 39)) $)
                              (|IPADIC;timesAux| (SPADCALL |x| (QREFELT $ 39))
                               |y| $)
                              $)
                             NIL)
                       (EXIT (SPADCALL |car| |cdr| (QREFELT $ 42)))))))))))) 

(SDEFUN |IPADIC;*;3$;31| ((|x| $) (|y| $) ($ $))
        (|IPADIC;padic|
         (|IPADIC;timesAux| (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) $)
         $)) 

(SDEFUN |IPADIC;quotientAux|
        ((|x| |Stream| (|Integer|)) (|y| |Stream| (|Integer|))
         ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|IPADIC;quotientAux!0| (VECTOR |y| $ |x|))
                          (QREFELT $ 47))))) 

(SDEFUN |IPADIC;quotientAux!0| (($$ NIL))
        (PROG (|x| $ |y|)
          (LETT |x| (QREFELT $$ 2) . #1=(|IPADIC;quotientAux|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |y| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|z0| NIL) (|yy| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |x| (QREFELT $ 30))
                      (|error| "quotientAux: first argument"))
                     ((SPADCALL |y| (QREFELT $ 30)) (SPADCALL (QREFELT $ 41)))
                     ((SPADCALL (|IPADIC;modP| (SPADCALL |x| (QREFELT $ 31)) $)
                                (|spadConstant| $ 43) (QREFELT $ 44))
                      (COND
                       ((SPADCALL
                         (|IPADIC;modP| (SPADCALL |y| (QREFELT $ 31)) $)
                         (|spadConstant| $ 43) (QREFELT $ 44))
                        (|IPADIC;quotientAux| (SPADCALL |x| (QREFELT $ 39))
                         (SPADCALL |y| (QREFELT $ 39)) $))
                       ('T (|error| "quotient: quotient not integral"))))
                     ('T
                      (SEQ
                       (LETT |z0|
                             (|IPADIC;modP|
                              (SPADCALL
                               (|IPADIC;invModP| (SPADCALL |x| (QREFELT $ 31))
                                $)
                               (SPADCALL |y| (QREFELT $ 31)) (QREFELT $ 54))
                              $)
                             NIL)
                       (LETT |yy|
                             (SPADCALL
                              (|IPADIC;minusAux| (|spadConstant| $ 57) |y|
                               (|IPADIC;intMult| |z0| |x| $) $)
                              (QREFELT $ 58))
                             NIL)
                       (EXIT
                        (SPADCALL |z0| (|IPADIC;quotientAux| |x| |yy| $)
                                  (QREFELT $ 42)))))))))))) 

(SDEFUN |IPADIC;recip;$U;33| ((|x| $) ($ |Union| $ "failed"))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 30))
              (EQL (|IPADIC;modP| (SPADCALL |x| (QREFELT $ 31)) $) 0))
          (CONS 1 "failed"))
         ('T
          (CONS 0
                (|IPADIC;padic|
                 (|IPADIC;quotientAux| (|IPADIC;stream| |x| $)
                  (SPADCALL 1 (SPADCALL (QREFELT $ 41)) (QREFELT $ 42)) $)
                 $))))) 

(SDEFUN |IPADIC;iExquo|
        ((|xx| $) (|yy| $) (|n| |Integer|) ($ |Union| $ "failed"))
        (SPROG ((|rec| (|Union| $ "failed")))
               (SEQ
                (COND
                 ((SPADCALL |n| 1000 (QREFELT $ 61))
                  (|error|
                   "exquo: quotient by series with many leading zero coefs"))
                 ((SPADCALL |yy| (QREFELT $ 30)) (CONS 1 "failed"))
                 ((SPADCALL |xx| (QREFELT $ 30))
                  (CONS 0 (|spadConstant| $ 35)))
                 ((ZEROP (SPADCALL |yy| (QREFELT $ 31)))
                  (COND
                   ((ZEROP (SPADCALL |xx| (QREFELT $ 31)))
                    (|IPADIC;iExquo| (SPADCALL |xx| (QREFELT $ 33))
                     (SPADCALL |yy| (QREFELT $ 33)) (+ |n| 1) $))
                   (#1='T (CONS 1 "failed"))))
                 (#1#
                  (SEQ
                   (LETT |rec| (SPADCALL |yy| (QREFELT $ 60)) |IPADIC;iExquo|)
                   (EXIT
                    (COND ((QEQCAR |rec| 1) (CONS 1 "failed"))
                          (#1#
                           (CONS 0
                                 (SPADCALL |xx| (QCDR |rec|)
                                           (QREFELT $ 56)))))))))))) 

(SDEFUN |IPADIC;exquo;2$U;35| ((|x| $) (|y| $) ($ |Union| $ "failed"))
        (|IPADIC;iExquo| (|IPADIC;stream| |x| $) (|IPADIC;stream| |y| $) 0 $)) 

(SDEFUN |IPADIC;divide;2$R;36|
        ((|x| $) (|y| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG ((|z| (|Union| $ "failed")))
               (SEQ
                (LETT |z| (SPADCALL |x| |y| (QREFELT $ 62))
                      |IPADIC;divide;2$R;36|)
                (EXIT
                 (COND ((QEQCAR |z| 1) (CONS (|spadConstant| $ 35) |x|))
                       ('T (CONS (QCDR |z|) (|spadConstant| $ 35)))))))) 

(SDEFUN |IPADIC;iSqrt|
        ((|pn| |Integer|) (|an| |Integer|) (|bn| |Integer|) (|bSt| $) ($ $))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|IPADIC;iSqrt!0|
                       (VECTOR (QREFELT $ 6) |an| |pn| |bn| $ |bSt|))
                 (QREFELT $ 68))))) 

(SDEFUN |IPADIC;iSqrt!0| (($$ NIL))
        (PROG (|bSt| $ |bn| |pn| |an| |p|)
          (LETT |bSt| (QREFELT $$ 5) . #1=(|IPADIC;iSqrt|))
          (LETT $ (QREFELT $$ 4) . #1#)
          (LETT |bn| (QREFELT $$ 3) . #1#)
          (LETT |pn| (QREFELT $$ 2) . #1#)
          (LETT |an| (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|bn1| NIL) (|c| NIL) (|aa| NIL) (|nSt| NIL))
                   (SEQ
                    (LETT |bn1|
                          (COND ((SPADCALL |bSt| (QREFELT $ 30)) |bn|)
                                ('T
                                 (SPADCALL |bn|
                                           (SPADCALL |pn|
                                                     (SPADCALL |bSt|
                                                               (QREFELT $ 31))
                                                     (QREFELT $ 54))
                                           (QREFELT $ 48))))
                          NIL)
                    (LETT |c|
                          (SPADCALL
                           (SPADCALL |bn1| (SPADCALL |an| |an| (QREFELT $ 54))
                                     (QREFELT $ 50))
                           |pn| (QREFELT $ 65))
                          NIL)
                    (LETT |aa|
                          (|IPADIC;modP|
                           (SPADCALL |c|
                                     (SPADCALL (SPADCALL 2 |an| (QREFELT $ 67))
                                               |p| (QREFELT $ 28))
                                     (QREFELT $ 54))
                           $)
                          NIL)
                    (LETT |nSt|
                          (COND ((SPADCALL |bSt| (QREFELT $ 30)) |bSt|)
                                ('T (SPADCALL |bSt| (QREFELT $ 33))))
                          NIL)
                    (EXIT
                     (SPADCALL |aa|
                               (|IPADIC;iSqrt|
                                (SPADCALL |pn| |p| (QREFELT $ 54))
                                (SPADCALL |an|
                                          (SPADCALL |pn| |aa| (QREFELT $ 54))
                                          (QREFELT $ 48))
                                |bn1| |nSt| $)
                               (QREFELT $ 49))))))))) 

(SDEFUN |IPADIC;sqrt;$I$;38| ((|b| $) (|a| |Integer|) ($ $))
        (SPROG ((|bb| (|Integer|)))
               (SEQ
                (COND
                 ((EQL (QREFELT $ 6) 2)
                  (|error| "sqrt: no square roots in Z2 yet"))
                 ((NULL
                   (ZEROP
                    (|IPADIC;modP|
                     (- (* |a| |a|)
                        (LETT |bb| (SPADCALL |b| (QREFELT $ 32))
                              . #1=(|IPADIC;sqrt;$I$;38|)))
                     $)))
                  (|error| "sqrt: not a square root (mod p)"))
                 ('T
                  (SEQ
                   (LETT |b|
                         (COND ((SPADCALL |b| (QREFELT $ 30)) |b|)
                               ('T (SPADCALL |b| (QREFELT $ 33))))
                         . #1#)
                   (LETT |a| (|IPADIC;modP| |a| $) . #1#)
                   (EXIT
                    (SPADCALL |a| (|IPADIC;iSqrt| (QREFELT $ 6) |a| |bb| |b| $)
                              (QREFELT $ 49))))))))) 

(SDEFUN |IPADIC;iRoot|
        ((|f| |SparseUnivariatePolynomial| (|Integer|)) (|alpha| |Integer|)
         (|invFpx0| |Integer|) (|pPow| |Integer|) ($ |Stream| (|Integer|)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|IPADIC;iRoot!0|
                       (VECTOR (QREFELT $ 6) |invFpx0| |pPow| $ |alpha| |f|))
                 (QREFELT $ 47))))) 

(SDEFUN |IPADIC;iRoot!0| (($$ NIL))
        (PROG (|f| |alpha| $ |pPow| |invFpx0| |p|)
          (LETT |f| (QREFELT $$ 5) . #1=(|IPADIC;iRoot|))
          (LETT |alpha| (QREFELT $$ 4) . #1#)
          (LETT $ (QREFELT $$ 3) . #1#)
          (LETT |pPow| (QREFELT $$ 2) . #1#)
          (LETT |invFpx0| (QREFELT $$ 1) . #1#)
          (LETT |p| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((#2=#:G924 NIL) (|num| NIL) (|digit| NIL))
                   (SEQ
                    (LETT |num|
                          (SPADCALL
                           (PROG2
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL |f| |alpha| (QREFELT $ 71))
                                      |pPow| (QREFELT $ 72))
                                     NIL)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                             (|Union| (|Integer|) "failed")
                                             #2#))
                           (QREFELT $ 73))
                          NIL)
                    (LETT |digit|
                          (|IPADIC;modP|
                           (SPADCALL |num| |invFpx0| (QREFELT $ 54)) $)
                          NIL)
                    (EXIT
                     (SPADCALL |digit|
                               (|IPADIC;iRoot| |f|
                                (SPADCALL |alpha|
                                          (SPADCALL |digit| |pPow|
                                                    (QREFELT $ 54))
                                          (QREFELT $ 48))
                                |invFpx0| (SPADCALL |p| |pPow| (QREFELT $ 54))
                                $)
                               (QREFELT $ 42))))))))) 

(SDEFUN |IPADIC;root;SupI$;40|
        ((|f| |SparseUnivariatePolynomial| #1=(|Integer|)) (|x0| . #1#) ($ $))
        (SPROG ((|invFpx0| #2=(|Integer|)) (|fpx0| #2#))
               (SEQ
                (LETT |x0| (|IPADIC;modP| |x0| $)
                      . #3=(|IPADIC;root;SupI$;40|))
                (COND
                 ((NULL
                   (ZEROP
                    (|IPADIC;modP| (SPADCALL |f| |x0| (QREFELT $ 71)) $)))
                  (EXIT (|error| "root: not a root (mod p)"))))
                (LETT |fpx0|
                      (|IPADIC;modP|
                       (SPADCALL (SPADCALL |f| (QREFELT $ 74)) |x0|
                                 (QREFELT $ 71))
                       $)
                      . #3#)
                (EXIT
                 (COND
                  ((ZEROP |fpx0|)
                   (|error|
                    "root: approximate root must be a simple root (mod p)"))
                  ('T
                   (SEQ
                    (LETT |invFpx0|
                          (|IPADIC;modP| (|IPADIC;invModP| |fpx0| $) $) . #3#)
                    (EXIT
                     (|IPADIC;padic|
                      (SPADCALL |x0|
                                (|IPADIC;iRoot| |f| |x0| |invFpx0|
                                 (QREFELT $ 6) $)
                                (QREFELT $ 42))
                      $))))))))) 

(SDEFUN |IPADIC;termOutput| ((|k| |Integer|) (|c| |Integer|) ($ |OutputForm|))
        (SPROG ((|mon| (|OutputForm|)))
               (SEQ
                (COND ((EQL |k| 0) (SPADCALL |c| (QREFELT $ 10)))
                      (#1='T
                       (SEQ
                        (LETT |mon|
                              (COND ((EQL |k| 1) (QREFELT $ 11))
                                    (#1#
                                     (SPADCALL (QREFELT $ 11)
                                               (SPADCALL |k| (QREFELT $ 10))
                                               (QREFELT $ 76))))
                              |IPADIC;termOutput|)
                        (EXIT
                         (COND ((EQL |c| 1) |mon|)
                               ((EQL |c| -1) (SPADCALL |mon| (QREFELT $ 77)))
                               (#1#
                                (SPADCALL (SPADCALL |c| (QREFELT $ 10)) |mon|
                                          (QREFELT $ 78))))))))))) 

(PUT '|IPADIC;showAll?| '|SPADreplace| '(XLAM NIL |$streamsShowAll|)) 

(SDEFUN |IPADIC;showAll?| (($ |Boolean|)) |$streamsShowAll|) 

(SDEFUN |IPADIC;coerce;$Of;43| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (|st| ($)) (|st1| ($)) (|n| NIL)
          (#1=#:G976 NIL) (|count| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((SPADCALL
             (LETT |st| (|IPADIC;stream| |x| $) . #2=(|IPADIC;coerce;$Of;43|))
             (QREFELT $ 30))
            (SPADCALL 0 (QREFELT $ 10)))
           (#3='T
            (SEQ (LETT |count| |$streamCount| . #2#) (LETT |l| NIL . #2#)
                 (SEQ (LETT |n| 0 . #2#) (LETT #1# |count| . #2#) G190
                      (COND
                       ((OR (|greater_SI| |n| #1#)
                            (NULL (NULL (SPADCALL |st| (QREFELT $ 30)))))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0
                                   (QREFELT $ 27))
                         (LETT |l|
                               (CONS
                                (|IPADIC;termOutput| |n|
                                 (SPADCALL |st| (QREFELT $ 31)) $)
                                |l|)
                               . #2#)))
                       (EXIT (LETT |st| (SPADCALL |st| (QREFELT $ 33)) . #2#)))
                      (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191
                      (EXIT NIL))
                 (COND
                  ((|IPADIC;showAll?| $)
                   (SEQ (LETT |st1| |st| . #2#)
                        (EXIT
                         (SEQ (LETT |n| (+ |count| 1) . #2#) G190
                              (COND
                               ((NULL
                                 (COND
                                  ((SPADCALL |st| (QREFELT $ 79))
                                   (NULL
                                    (SPADCALL |st1|
                                              (SPADCALL |st| (QREFELT $ 33))
                                              (QREFELT $ 80))))
                                  ('T NIL)))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |st| (QREFELT $ 31)) 0
                                           (QREFELT $ 27))
                                 (LETT |l|
                                       (CONS
                                        (|IPADIC;termOutput| |n|
                                         (SPADCALL |st| (QREFELT $ 31)) $)
                                        |l|)
                                       . #2#)))
                               (COND
                                ((ODDP |n|)
                                 (LETT |st1| (SPADCALL |st1| (QREFELT $ 33))
                                       . #2#)))
                               (EXIT
                                (LETT |st| (SPADCALL |st| (QREFELT $ 33))
                                      . #2#)))
                              (LETT |n| (+ |n| 1) . #2#) (GO G190) G191
                              (EXIT NIL))))))
                 (LETT |l|
                       (COND ((SPADCALL |st| (QREFELT $ 81)) |l|)
                             (#3#
                              (SEQ
                               (COND
                                ((SPADCALL |st| (SPADCALL |st| (QREFELT $ 33))
                                           (QREFELT $ 80))
                                 (COND
                                  ((EQL (SPADCALL |st| (QREFELT $ 31)) 0)
                                   (EXIT |l|)))))
                               (EXIT
                                (CONS
                                 (SPADCALL (SPADCALL 'O (QREFELT $ 83))
                                           (LIST
                                            (SPADCALL (QREFELT $ 11)
                                                      (SPADCALL |n|
                                                                (QREFELT $ 84))
                                                      (QREFELT $ 76)))
                                           (QREFELT $ 86))
                                 |l|)))))
                       . #2#)
                 (EXIT
                  (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 84)))
                        (#3#
                         (SPADCALL (ELT $ 87) (NREVERSE |l|)
                                   (QREFELT $ 90))))))))))) 

(DECLAIM (NOTINLINE |InnerPAdicInteger;|)) 

(DEFUN |InnerPAdicInteger| (&REST #1=#:G988)
  (SPROG NIL
         (PROG (#2=#:G989)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerPAdicInteger|)
                                               '|domainEqualList|)
                    . #3=(|InnerPAdicInteger|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerPAdicInteger;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerPAdicInteger|)))))))))) 

(DEFUN |InnerPAdicInteger;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerPAdicInteger|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|InnerPAdicInteger| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 103) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InnerPAdicInteger| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 11 (SPADCALL |#1| (QREFELT $ 10)))
          (QSETREFV $ 12 (|Stream| (|Integer|)))
          $))) 

(MAKEPROP '|InnerPAdicInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|OutputForm|) (|Integer|) (0 . |coerce|) 'PEXPR '|Rep|
              (|NonNegativeInteger|) |IPADIC;characteristic;Nni;1|
              |IPADIC;order;$Nni;16| |IPADIC;euclideanSize;$Nni;2| (|Stream| 9)
              |IPADIC;digits;$S;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IPADIC;One;$;18|) $))
              (5 . |extend|) |IPADIC;extend;$I$;6| (11 . |complete|)
              |IPADIC;complete;2$;7| (16 . |positiveRemainder|)
              (22 . |symmetricRemainder|) (|Boolean|) (28 . ~=) (34 . |invmod|)
              |IPADIC;modulus;I;11| (40 . |empty?|) (45 . |frst|)
              |IPADIC;moduloP;$I;12| (50 . |rst|) |IPADIC;quotientByP;2$;13|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |IPADIC;Zero;$;17|) $))
              (55 . <=) |IPADIC;approximate;$2I;14| |IPADIC;-;3$;25|
              (61 . |rst|) |IPADIC;=;2$B;15| (66 . |empty|) (70 . |concat|)
              (76 . |Zero|) (80 . =) (86 . |empty|) (|Mapping| $)
              (90 . |delay|) (95 . +) (101 . |concat|) (107 . -)
              |IPADIC;+;3$;24| |IPADIC;-;2$;26| |IPADIC;coerce;I$;27| (113 . *)
              |IPADIC;*;I2$;29| |IPADIC;*;3$;31| (119 . |Zero|) (123 . |rest|)
              (|Union| $ '"failed") |IPADIC;recip;$U;33| (128 . >)
              |IPADIC;exquo;2$U;35|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |IPADIC;divide;2$R;36| (134 . |quo|) (|PositiveInteger|)
              (140 . *) (146 . |delay|) |IPADIC;sqrt;$I$;38|
              (|SparseUnivariatePolynomial| 9) (151 . |elt|) (157 . |exquo|)
              (163 . -) (168 . |differentiate|) |IPADIC;root;SupI$;40|
              (173 . ^) (179 . -) (184 . *) (190 . |explicitEntries?|)
              (195 . |eq?|) (201 . |explicitlyEmpty?|) (|Symbol|)
              (206 . |coerce|) (211 . |coerce|) (|List| $) (216 . |prefix|)
              (222 . +) (|Mapping| 8 8 8) (|List| 8) (228 . |reduce|)
              |IPADIC;coerce;$Of;43| (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 92 '#1="failed") (|Union| 85 '#1#)
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef| 85) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 234 |zero?| 240 |unitNormal| 245 |unitCanonical| 250 |unit?|
              255 |subtractIfCan| 260 |sqrt| 266 |sizeLess?| 272 |sample| 278
              |root| 282 |rightRecip| 288 |rightPower| 293 |rem| 305 |recip|
              311 |quotientByP| 316 |quo| 321 |principalIdeal| 327 |order| 332
              |opposite?| 337 |one?| 343 |multiEuclidean| 348 |modulus| 354
              |moduloP| 358 |leftRecip| 363 |leftPower| 368 |lcmCoef| 380 |lcm|
              386 |latex| 397 |hashUpdate!| 402 |hash| 408 |gcdPolynomial| 413
              |gcd| 419 |extendedEuclidean| 430 |extend| 443 |exquo| 449
              |expressIdealMember| 455 |euclideanSize| 461 |divide| 466
              |digits| 472 |complete| 477 |commutator| 482 |coerce| 488
              |characteristic| 503 |associator| 507 |associates?| 514
              |approximate| 520 |antiCommutator| 526 |annihilate?| 532 ^ 538
              |Zero| 550 |One| 554 = 558 - 564 + 575 * 581)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(NIL |EuclideanDomain&| NIL |GcdDomain&| NIL NIL NIL NIL
                |EntireRing&| |Algebra&| NIL |Rng&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| |SetCategory&| NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|PAdicIntegerCategory| 6) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|CommutativeRing|) (|LeftOreRing|) (|CharacteristicZero|)
                 (|EntireRing|) (|Algebra| $$) (|Ring|) (|Rng|) (|SemiRing|)
                 (|Module| $$) (|SemiRng|) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 8))
              (|makeByteWordVec2| 102
                                  '(1 9 8 0 10 2 12 0 0 9 20 1 12 0 0 22 2 9 0
                                    0 0 24 2 9 0 0 0 25 2 9 26 0 0 27 2 9 0 0 0
                                    28 1 12 26 0 30 1 12 9 0 31 1 12 0 0 33 2 9
                                    26 0 0 36 1 17 0 0 39 0 17 0 41 2 17 0 9 0
                                    42 0 9 0 43 2 9 26 0 0 44 0 8 0 45 1 17 0
                                    46 47 2 9 0 0 0 48 2 12 0 9 0 49 2 9 0 0 0
                                    50 2 9 0 0 0 54 0 13 0 57 1 17 0 0 58 2 9
                                    26 0 0 61 2 9 0 0 0 65 2 9 0 66 0 67 1 12 0
                                    46 68 2 70 9 0 9 71 2 9 59 0 0 72 1 9 0 0
                                    73 1 70 0 0 74 2 8 0 0 0 76 1 8 0 0 77 2 8
                                    0 0 0 78 1 12 26 0 79 2 12 26 0 0 80 1 12
                                    26 0 81 1 82 8 0 83 1 13 8 0 84 2 8 0 0 85
                                    86 2 8 0 0 0 87 2 89 8 88 0 90 2 0 26 0 0 1
                                    1 0 26 0 1 1 0 99 0 1 1 0 0 0 1 1 0 26 0 1
                                    2 0 59 0 0 1 2 0 0 0 9 69 2 0 26 0 0 1 0 0
                                    0 1 2 0 0 70 9 75 1 0 59 0 1 2 0 0 0 13 1 2
                                    0 0 0 66 1 2 0 0 0 0 1 1 0 59 0 60 1 0 0 0
                                    34 2 0 0 0 0 1 1 0 96 85 1 1 0 13 0 15 2 0
                                    26 0 0 1 1 0 26 0 1 2 0 94 85 0 1 0 0 9 29
                                    1 0 9 0 32 1 0 59 0 1 2 0 0 0 13 1 2 0 0 0
                                    66 1 2 0 98 0 0 1 1 0 0 85 1 2 0 0 0 0 1 1
                                    0 100 0 1 2 0 102 102 0 1 1 0 101 0 1 2 0
                                    97 97 97 1 1 0 0 85 1 2 0 0 0 0 1 3 0 93 0
                                    0 0 1 2 0 95 0 0 1 2 0 0 0 9 21 2 0 59 0 0
                                    62 2 0 94 85 0 1 1 0 13 0 16 2 0 63 0 0 64
                                    1 0 17 0 18 1 0 0 0 23 2 0 0 0 0 1 1 0 0 0
                                    1 1 0 0 9 53 1 0 8 0 91 0 0 13 14 3 0 0 0 0
                                    0 1 2 0 26 0 0 1 2 0 9 0 9 37 2 0 0 0 0 1 2
                                    0 26 0 0 1 2 0 0 0 13 1 2 0 0 0 66 1 0 0 0
                                    35 0 0 0 19 2 0 26 0 0 40 1 0 0 0 52 2 0 0
                                    0 0 38 2 0 0 0 0 51 2 0 0 13 0 1 2 0 0 9 0
                                    55 2 0 0 0 0 56 2 0 0 66 0 1)))))
           '|lookupComplete|)) 
