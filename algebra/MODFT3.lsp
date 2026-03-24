
(PUT '|MODFT3;get_char;RI;1| '|SPADreplace| 'QCAR) 

(SDEFUN |MODFT3;get_char;RI;1|
        ((|m| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|Integer|)))
        (QCAR |m|)) 

(PUT '|MODFT3;get_extension_degree;RI;2| '|SPADreplace| 'QCDR) 

(SDEFUN |MODFT3;get_extension_degree;RI;2|
        ((|m| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|Integer|)))
        (QCDR |m|)) 

(PUT '|MODFT3;get_mod;RR;3| '|SPADreplace| 'QCAR) 

(SDEFUN |MODFT3;get_mod;RR;3|
        ((|pmd|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (% (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|)))))
        (QCAR |pmd|)) 

(SDEFUN |MODFT3;degree;PaI;4| ((|pol| (|PrimitiveArray| K)) (% (|Integer|)))
        (SPROG
         ((#1=#:G31 NIL) (#2=#:G32 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVSIZE |pol|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1)) G190 (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (QAREF1 |pol| |i|) (|spadConstant| % 14)
                                      (QREFELT % 16)))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# |i|) (GO #3=#:G30)))
                            (GO #4=#:G28))))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL)))
                 #4# (EXIT #1#))
                (EXIT -1)))
          #3# (EXIT #2#)))) 

(PUT '|MODFT3;empty_poly;Pa;5| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |MODFT3;empty_poly;Pa;5| ((% (|PrimitiveArray| K))) (MAKE-ARRAY 0)) 

(SDEFUN |MODFT3;empty_mat?;PtdaB;6|
        ((|mat| (|PrimitiveTwoDimensionalArray| K)) (% (|Boolean|)))
        (SPADCALL |mat| (QREFELT % 21))) 

(PUT '|MODFT3;empty_mat;Ptda;7| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX 0 0))) 

(SDEFUN |MODFT3;empty_mat;Ptda;7| ((% (|PrimitiveTwoDimensionalArray| K)))
        (MAKE_MATRIX 0 0)) 

(SDEFUN |MODFT3;empty_mat?;PtdaB;8|
        ((|mat| (|PrimitiveTwoDimensionalArray| K)) (% (|Boolean|)))
        (SPADCALL |mat| (QREFELT % 21))) 

(SDEFUN |MODFT3;sub_poly;2PaRPa;9|
        ((|pol1| #1=(|PrimitiveArray| K)) (|pol2| #1#)
         (|p| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% #1#))
        (SPROG
         ((#2=#:G42 NIL) (|i| NIL) (|res| (|PrimitiveArray| K))
          (|dr| (|Integer|)) (|d2| #3=(|Integer|)) (|d1| #3#))
         (SEQ (LETT |d1| (SPADCALL |pol1| (QREFELT % 18)))
              (LETT |d2| (SPADCALL |pol2| (QREFELT % 18)))
              (LETT |dr| (MAX |d1| |d2|))
              (LETT |res| (SPADCALL |pol1| (+ |dr| 1) |p| (QREFELT % 24)))
              (SEQ (LETT |i| 0) (LETT #2# |d2|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |res| |i|
                                (SPADCALL (QAREF1 |res| |i|)
                                          (QAREF1 |pol2| |i|)
                                          (QREFELT % 25)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODFT3;trim_pol|
        ((|pol| (|PrimitiveArray| K)) (% (|PrimitiveArray| K)))
        (SPROG
         ((#1=#:G48 NIL) (|i| NIL) (|res| (|PrimitiveArray| K))
          (|n1| (|NonNegativeInteger|)))
         (SEQ (LETT |n1| (+ (SPADCALL |pol| (QREFELT % 18)) 1))
              (EXIT
               (COND
                ((EQL |n1| (QVSIZE |pol|)) (SPADCALL |pol| (QREFELT % 27)))
                ('T
                 (SEQ (LETT |res| (MAKEARR1 |n1| (|spadConstant| % 14)))
                      (SEQ (LETT |i| 0) (LETT #1# (- |n1| 1)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT (QSETAREF1 |res| |i| (QAREF1 |pol| |i|))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFT3;mul_by_scalar;PaIKV;11|
        ((|pol| (|PrimitiveArray| K)) (|n1| (|Integer|)) (|c| (K))
         (% (|Void|)))
        (SPROG ((#1=#:G52 NIL) (|i| NIL))
               (SEQ (LETT |i| 0) (LETT #1# |n1|) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (QSETAREF1 |pol| |i|
                                 (SPADCALL |c| (QAREF1 |pol| |i|)
                                           (QREFELT % 28)))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |MODFT3;ini_rdata;PaRR;12|
        ((|pol| (|PrimitiveArray| K))
         (|md| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (%
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K)))))
        (SPROG ((|n1| (|NonNegativeInteger|)))
               (SEQ (LETT |pol| (|MODFT3;trim_pol| |pol| %))
                    (LETT |n1| (QVSIZE |pol|))
                    (COND
                     ((SPADCALL (QAREF1 |pol| (- |n1| 1)) (|spadConstant| % 13)
                                (QREFELT % 31))
                      (SPADCALL |pol| (- |n1| 1)
                                (SPADCALL (|spadConstant| % 13)
                                          (QAREF1 |pol| (- |n1| 1))
                                          (QREFELT % 32))
                                (QREFELT % 30))))
                    (EXIT (CONS |md| |pol|))))) 

(SDEFUN |MODFT3;monomial1;RPa;13|
        ((|p| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|PrimitiveArray| K)))
        (SPROG ((|res| (|PrimitiveArray| K)))
               (SEQ (LETT |res| (MAKEARR1 2 (|spadConstant| % 14)))
                    (QSETAREF1 |res| 1 (|spadConstant| % 13)) (EXIT |res|)))) 

(SDEFUN |MODFT3;copy_poly;PaIRPa;14|
        ((|pol| (|PrimitiveArray| K)) (|n| (|Integer|))
         (|md| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((#1=#:G67 NIL) (|i| NIL) (|res| (|PrimitiveArray| K))
          (|n0| (|Integer|)))
         (SEQ (LETT |n0| (+ (SPADCALL |pol| (QREFELT % 18)) 1))
              (EXIT
               (COND
                ((< |n| |n0|) (|error| "copy_poly: degree of pol too large"))
                ('T
                 (SEQ (LETT |res| (MAKEARR1 |n| (|spadConstant| % 14)))
                      (SEQ (LETT |i| 0) (LETT #1# (- |n0| 1)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT (QSETAREF1 |res| |i| (QAREF1 |pol| |i|))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFT3;random_poly;IRPa;15|
        ((|n| (|Integer|))
         (|p| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|PrimitiveArray| K)))
        (SPROG ((#1=#:G73 NIL) (|i| NIL) (|res| (|PrimitiveArray| K)))
               (SEQ (LETT |res| (MAKEARR1 (+ |n| 1) (|spadConstant| % 14)))
                    (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |res| |i| (SPADCALL (QREFELT % 35)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |MODFT3;vector_combination|
        ((|v1| (|PrimitiveArray| K)) (|c1| (K)) (|v2| (|PrimitiveArray| K))
         (|c2| (K)) (|n| (|Integer|)) (|delta| (|Integer|)) (% (|Void|)))
        (SPROG
         ((#1=#:G89 NIL) (|i| NIL) (#2=#:G88 NIL) (#3=#:G87 NIL) (#4=#:G86 NIL)
          (|ds| #5=(|SingleInteger|)) (|ns| #5#))
         (SEQ (LETT |ns| |n|) (LETT |ds| |delta|)
              (EXIT
               (COND
                ((SPADCALL |c1| (|spadConstant| % 13) (QREFELT % 16))
                 (SEQ (LETT |i| |ds|) (LETT #4# |ns|) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |v1| |i|
                                   (SPADCALL
                                    (SPADCALL |c2|
                                              (QAREF1 |v2| (|sub_SI| |i| |ds|))
                                              (QREFELT % 28))
                                    (QAREF1 |v1| |i|) (QREFELT % 37)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                ((|less_SI| (|add_SI| |ns| 1) |ds|)
                 (SEQ (LETT |i| 0) (LETT #3# |ns|) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |v1| |i|
                                   (SPADCALL |c1| (QAREF1 |v1| |i|)
                                             (QREFELT % 28)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                ('T
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #2# (|sub_SI| |ds| 1)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (QSETAREF1 |v1| |i|
                                    (SPADCALL |c1| (QAREF1 |v1| |i|)
                                              (QREFELT % 28)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SEQ (LETT |i| |ds|) (LETT #1# |ns|) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (QSETAREF1 |v1| |i|
                                     (SPADCALL
                                      (SPADCALL |c1| (QAREF1 |v1| |i|)
                                                (QREFELT % 28))
                                      (SPADCALL |c2|
                                                (QAREF1 |v2|
                                                        (|sub_SI| |i| |ds|))
                                                (QREFELT % 28))
                                      (QREFELT % 37)))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT NIL)))))))))) 

(SDEFUN |MODFT3;add_poly;2PaRPa;17|
        ((|pol1| #1=(|PrimitiveArray| K)) (|pol2| #1#)
         (|p| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% #1#))
        (SPROG
         ((|res| (|PrimitiveArray| K)) (|dr| (|Integer|)) (|d2| #2=(|Integer|))
          (|d1| #2#))
         (SEQ (LETT |d1| (SPADCALL |pol1| (QREFELT % 18)))
              (LETT |d2| (SPADCALL |pol2| (QREFELT % 18)))
              (LETT |dr| (MAX |d1| |d2|))
              (LETT |res| (SPADCALL |pol1| (+ |dr| 1) |p| (QREFELT % 24)))
              (|MODFT3;vector_combination| |res| (|spadConstant| % 13) |pol2|
               (|spadConstant| % 13) |d2| 0 %)
              (EXIT |res|)))) 

(SDEFUN |MODFT3;divide!;2PaRPa;18|
        ((|r0| #1=(|PrimitiveArray| K)) (|r1| #1#)
         (|md| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((#2=#:G109 NIL) (|dr0| #3=(|SingleInteger|)) (#4=#:G110 NIL)
          (|c1| (K)) (|delta| (|SingleInteger|)) (|c0| (K)) (#5=#:G111 NIL)
          (|res| (|PrimitiveArray| K)) (|dres| (|Integer|)) (|dr1| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |dr0| (SPADCALL |r0| (QREFELT % 18)))
                (LETT |dr1| (SPADCALL |r1| (QREFELT % 18)))
                (EXIT
                 (COND ((|less_SI| |dr1| 0) (|error| "divide!: zero divisor"))
                       (#6='T
                        (SEQ (LETT |dres| (|sub_SI| |dr0| |dr1|))
                             (LETT |res|
                                   (MAKEARR1 (+ |dres| 1)
                                             (|spadConstant| % 14)))
                             (EXIT
                              (COND
                               ((|less_SI| |dr0| 0)
                                (PROGN (LETT #5# |res|) (GO #7=#:G108)))
                               (#6#
                                (SEQ
                                 (LETT |c0|
                                       (SPADCALL (|spadConstant| % 13)
                                                 (QAREF1 |r1| |dr1|)
                                                 (QREFELT % 32)))
                                 (EXIT
                                  (COND
                                   ((|eql_SI| |dr1| 0)
                                    (SEQ
                                     (SEQ G190
                                          (COND
                                           ((NULL (NULL (|less_SI| |dr0| 0)))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |c1|
                                                 (SPADCALL |c0|
                                                           (QAREF1 |r0| |dr0|)
                                                           (QREFELT % 28)))
                                           (QSETAREF1 |res| |dr0| |c1|)
                                           (QSETAREF1 |r0| |dr0|
                                                      (|spadConstant| % 14))
                                           (EXIT
                                            (LETT |dr0| (|sub_SI| |dr0| 1))))
                                          NIL (GO G190) G191 (EXIT NIL))
                                     (EXIT |res|)))
                                   (#6#
                                    (SEQ
                                     (SEQ
                                      (EXIT
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (NULL (|less_SI| |dr0| |dr1|)))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |delta|
                                                   (|sub_SI| |dr0| |dr1|))
                                             (LETT |c1|
                                                   (SPADCALL |c0|
                                                             (QAREF1 |r0|
                                                                     |dr0|)
                                                             (QREFELT % 28)))
                                             (QSETAREF1 |res| |delta| |c1|)
                                             (LETT |c1|
                                                   (SPADCALL |c1|
                                                             (QREFELT % 39)))
                                             (QSETAREF1 |r0| |dr0|
                                                        (|spadConstant| % 14))
                                             (LETT |dr0| (|sub_SI| |dr0| 1))
                                             (COND
                                              ((|less_SI| |dr0| 0)
                                               (PROGN
                                                (LETT #4# |$NoValue|)
                                                (GO #8=#:G103))))
                                             (|MODFT3;vector_combination| |r0|
                                              (|spadConstant| % 13) |r1| |c1|
                                              |dr0| |delta| %)
                                             (EXIT
                                              (SEQ
                                               (EXIT
                                                (SEQ G190
                                                     (COND
                                                      ((NULL
                                                        (SPADCALL
                                                         (QAREF1 |r0| |dr0|)
                                                         (|spadConstant| % 14)
                                                         (QREFELT % 16)))
                                                       (GO G191)))
                                                     (SEQ
                                                      (LETT |dr0|
                                                            (|sub_SI| |dr0| 1))
                                                      (EXIT
                                                       (COND
                                                        ((|less_SI| |dr0| 0)
                                                         (PROGN
                                                          (LETT #2# |$NoValue|)
                                                          (GO #9=#:G101))))))
                                                     NIL (GO G190) G191
                                                     (EXIT NIL)))
                                               #9# (EXIT #2#))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #8# (EXIT #4#))
                                     (EXIT |res|)))))))))))))))
          #7# (EXIT #5#)))) 

(SDEFUN |MODFT3;gcd;2PaRPa;19|
        ((|x| #1=(|PrimitiveArray| K)) (|y| #1#)
         (|p| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((#2=#:G137 NIL) (|dr1| #3=(|SingleInteger|))
          (|r1| #4=(|PrimitiveArray| K)) (|dr0| #3#) (|r0| #4#)
          (|tmp| #5=(|SingleInteger|)) (|tmpp| (|PrimitiveArray| K))
          (#6=#:G136 NIL) (|c0| (K)) (|c1| (K)) (|delta| #5#) (#7=#:G139 NIL)
          (|i| NIL) (#8=#:G138 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |dr0| (SPADCALL |y| (QREFELT % 18)))
                (COND
                 ((|less_SI| |dr0| 0)
                  (SEQ (LETT |tmpp| |x|) (LETT |x| |y|) (LETT |y| |tmpp|)
                       (LETT |dr1| |dr0|)
                       (EXIT (LETT |dr0| (SPADCALL |y| (QREFELT % 18))))))
                 (#9='T (LETT |dr1| (SPADCALL |x| (QREFELT % 18)))))
                (EXIT
                 (COND
                  ((|less_SI| |dr0| 0)
                   (PROGN
                    (LETT #2# (MAKEARR1 1 (|spadConstant| % 14)))
                    (GO #10=#:G135)))
                  (#9#
                   (SEQ
                    (LETT |r0|
                          (MAKEARR1 (|add_SI| |dr0| 1) (|spadConstant| % 14)))
                    (SEQ (LETT |i| 0) (LETT #8# |dr0|) G190
                         (COND ((|greater_SI| |i| #8#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |r0| |i| (QAREF1 |y| |i|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((|less_SI| |dr1| 0)
                       (SEQ
                        (SPADCALL |r0| |dr0|
                                  (SPADCALL (|spadConstant| % 13)
                                            (QAREF1 |r0| |dr0|) (QREFELT % 32))
                                  (QREFELT % 30))
                        (EXIT |r0|)))
                      (#9#
                       (SEQ
                        (LETT |r1|
                              (MAKEARR1 (|add_SI| |dr1| 1)
                                        (|spadConstant| % 14)))
                        (SEQ (LETT |i| 0) (LETT #7# |dr1|) G190
                             (COND ((|greater_SI| |i| #7#) (GO G191)))
                             (SEQ (EXIT (QSETAREF1 |r1| |i| (QAREF1 |x| |i|))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (SEQ G190 (COND ((NULL (|less_SI| 0 |dr1|)) (GO G191)))
                             (SEQ
                              (SEQ G190
                                   (COND
                                    ((NULL (NULL (|less_SI| |dr0| |dr1|)))
                                     (GO G191)))
                                   (SEQ (LETT |delta| (|sub_SI| |dr0| |dr1|))
                                        (LETT |c1|
                                              (SPADCALL (QAREF1 |r0| |dr0|)
                                                        (QREFELT % 39)))
                                        (LETT |c0| (QAREF1 |r1| |dr1|))
                                        (COND
                                         ((SPADCALL |c0| (|spadConstant| % 13)
                                                    (QREFELT % 31))
                                          (COND
                                           ((|less_SI| 30 |delta|)
                                            (SEQ
                                             (SPADCALL |r1| |dr1|
                                                       (SPADCALL
                                                        (|spadConstant| % 13)
                                                        |c0| (QREFELT % 32))
                                                       (QREFELT % 30))
                                             (EXIT
                                              (LETT |c0|
                                                    (|spadConstant| %
                                                                    13))))))))
                                        (QSETAREF1 |r0| |dr0|
                                                   (|spadConstant| % 14))
                                        (LETT |dr0| (|sub_SI| |dr0| 1))
                                        (|MODFT3;vector_combination| |r0| |c0|
                                         |r1| |c1| |dr0| |delta| %)
                                        (EXIT
                                         (SEQ
                                          (EXIT
                                           (SEQ G190
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (QAREF1 |r0| |dr0|)
                                                    (|spadConstant| % 14)
                                                    (QREFELT % 16)))
                                                  (GO G191)))
                                                (SEQ
                                                 (LETT |dr0|
                                                       (|sub_SI| |dr0| 1))
                                                 (EXIT
                                                  (COND
                                                   ((|less_SI| |dr0| 0)
                                                    (PROGN
                                                     (LETT #6# |$NoValue|)
                                                     (GO #11=#:G125))))))
                                                NIL (GO G190) G191 (EXIT NIL)))
                                          #11# (EXIT #6#))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |tmpp| |r0|) (LETT |tmp| |dr0|)
                              (LETT |r0| |r1|) (LETT |dr0| |dr1|)
                              (LETT |r1| |tmpp|) (EXIT (LETT |dr1| |tmp|)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((|less_SI| |dr1| 0)
                           (SEQ
                            (SPADCALL |r0| |dr0|
                                      (SPADCALL (|spadConstant| % 13)
                                                (QAREF1 |r0| |dr0|)
                                                (QREFELT % 32))
                                      (QREFELT % 30))
                            (EXIT |r0|)))
                          (#9#
                           (SEQ (QSETAREF1 |r1| 0 (|spadConstant| % 13))
                                (EXIT
                                 (PROGN
                                  (LETT #2# |r1|)
                                  (GO #10#)))))))))))))))))
          #10# (EXIT #2#)))) 

(SDEFUN |MODFT3;red_pol!;PaRPa;20|
        ((|pol| (|PrimitiveArray| K))
         (|pmd|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((|k| (|Integer|)) (|i| NIL) (|c| (K)) (#1=#:G158 NIL) (|j| NIL)
          (#2=#:G157 NIL) (#3=#:G156 NIL) (|m| (|Integer|))
          (|res| (|PrimitiveArray| K)) (|n0| (|Integer|))
          (|pm| (|PrimitiveArray| K)))
         (SEQ (LETT |pm| (QCDR |pmd|)) (LETT |n0| (- (QVSIZE |pm|) 1))
              (LETT |res| (MAKEARR1 |n0| (|spadConstant| % 14)))
              (LETT |m| (SPADCALL |pol| (QREFELT % 18)))
              (EXIT
               (COND
                ((<= |m| (- |n0| 1))
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #3# |m|) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ (EXIT (QSETAREF1 |res| |i| (QAREF1 |pol| |i|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| (+ |m| 1)) (LETT #2# (- |n0| 1)) G190
                       (COND ((> |i| #2#) (GO G191)))
                       (SEQ (EXIT (QSETAREF1 |res| |i| (|spadConstant| % 14))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T
                 (SEQ (LETT |k| (+ (- |m| |n0|) 1))
                      (SEQ (LETT |j| (- |n0| 1)) (LETT |i| |m|) (LETT #1# |k|)
                           G190 (COND ((OR (< |i| #1#) (< |j| 0)) (GO G191)))
                           (SEQ
                            (EXIT (QSETAREF1 |res| |j| (QAREF1 |pol| |i|))))
                           (LETT |i| (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1))))
                           (GO G190) G191 (EXIT NIL))
                      (SEQ G190 (COND ((NULL (> |k| 0)) (GO G191)))
                           (SEQ
                            (LETT |c|
                                  (SPADCALL (QAREF1 |res| (- |n0| 1))
                                            (QREFELT % 39)))
                            (SEQ (LETT |i| (- |n0| 1)) G190
                                 (COND ((< |i| 1) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF1 |res| |i|
                                              (SPADCALL
                                               (QAREF1 |res| (- |i| 1))
                                               (SPADCALL |c| (QAREF1 |pm| |i|)
                                                         (QREFELT % 28))
                                               (QREFELT % 37)))))
                                 (LETT |i| (+ |i| -1)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |k| (- |k| 1))
                            (EXIT
                             (QSETAREF1 |res| 0
                                        (SPADCALL (QAREF1 |pol| |k|)
                                                  (SPADCALL |c| (QAREF1 |pm| 0)
                                                            (QREFELT % 28))
                                                  (QREFELT % 37)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFT3;mul_and_red|
        ((|pol1| (|PrimitiveArray| K)) (|pol2| (|PrimitiveArray| K))
         (|work| (|PrimitiveArray| K))
         (|rdata|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((#1=#:G171 NIL) (|j| NIL) (|c| (K)) (#2=#:G170 NIL) (|i| NIL)
          (#3=#:G169 NIL) (|n0| (|NonNegativeInteger|)))
         (SEQ (LETT |n0| (QVSIZE |pol1|))
              (SEQ (LETT |i| 0) (LETT #3# (- (* 2 |n0|) 2)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (EXIT (QSETAREF1 |work| |i| (|spadConstant| % 14))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 0) (LETT #2# (- |n0| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |c| (QAREF1 |pol1| |i|))
                        (EXIT
                         (SEQ (LETT |j| 0) (LETT #1# (- |n0| 1)) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |work| (+ |j| |i|)
                                           (SPADCALL
                                            (QAREF1 |work| (+ |j| |i|))
                                            (SPADCALL |c| (QAREF1 |pol2| |j|)
                                                      (QREFELT % 28))
                                            (QREFELT % 37)))))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |work| |rdata| (QREFELT % 42)))))) 

(SDEFUN |MODFT3;mod_exp;PaIRPa;22|
        ((|pol| (|PrimitiveArray| K)) (|n| (|Integer|))
         (|rdata|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((|pow| (|PrimitiveArray| K)) (#1=#:G180 NIL) (|has_res| (|Boolean|))
          (|res| (|PrimitiveArray| K)) (|work| (|PrimitiveArray| K))
          (|n0| (|NonNegativeInteger|)))
         (SEQ (LETT |pow| (SPADCALL |pol| |rdata| (QREFELT % 42)))
              (LETT |n0| (QVSIZE |pow|))
              (LETT |work| (MAKEARR1 (- (* 2 |n0|) 1) (|spadConstant| % 14)))
              (LETT |has_res| NIL)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL (> |n| 0)) (GO G191)))
                     (SEQ
                      (COND
                       ((ODDP |n|)
                        (COND
                         (|has_res|
                          (LETT |res|
                                (|MODFT3;mul_and_red| |res| |pow| |work|
                                 |rdata| %)))
                         ('T
                          (SEQ (LETT |res| (SPADCALL |pow| (QREFELT % 27)))
                               (EXIT (LETT |has_res| 'T)))))))
                      (LETT |n| (QUOTIENT2 |n| 2))
                      (EXIT
                       (COND
                        ((EQL |n| 0)
                         (PROGN (LETT #1# |$NoValue|) (GO #2=#:G177)))
                        ('T
                         (LETT |pow|
                               (|MODFT3;mul_and_red| |pow| |pow| |work| |rdata|
                                %))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |res|)))) 

(SDEFUN |MODFT3;power_matrix;PaNniRR;23|
        ((|xp| (|PrimitiveArray| K)) (|l| (|NonNegativeInteger|))
         (|rdata|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (%
          (|Record| (|:| |matr| (|PrimitiveTwoDimensionalArray| K))
                    (|:| |poly| (|PrimitiveArray| K)))))
        (SPROG
         ((|pow| (|PrimitiveArray| K)) (#1=#:G193 NIL) (|k| NIL)
          (#2=#:G192 NIL) (|j| NIL) (|n1| (|SingleInteger|)) (|l1| (|Integer|))
          (|work| (|PrimitiveArray| K))
          (|pm| (|PrimitiveTwoDimensionalArray| K))
          (|n| (|NonNegativeInteger|)) (|pol_m| (|PrimitiveArray| K))
          (|md| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|)))))
         (SEQ (LETT |md| (QCAR |rdata|)) (LETT |pol_m| (QCDR |rdata|))
              (LETT |n| (SPADCALL |pol_m| (QREFELT % 18)))
              (LETT |pm| (MAKE_MATRIX1 |n| |l| (|spadConstant| % 14)))
              (LETT |work| (MAKEARR1 (+ (* 2 |n|) 1) (|spadConstant| % 14)))
              (QSETAREF2 |pm| 0 0 (|spadConstant| % 13))
              (LETT |pow| (SPADCALL |xp| |n| |md| (QREFELT % 24)))
              (LETT |l1| (- |l| 1)) (LETT |n1| (- |n| 1))
              (SEQ (LETT |j| 1) (LETT #2# |l1|) G190
                   (COND ((|greater_SI| |j| #2#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |k| 0) (LETT #1# (- |n| 1)) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT (QSETAREF2 |pm| |k| |j| (QAREF1 |pow| |k|))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |pow|
                           (|MODFT3;mul_and_red| |pow| |xp| |work| |rdata|
                            %))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |pm| |pow|))))) 

(SDEFUN |MODFT3;copy_mat_part;PtdaIPtda;24|
        ((|m| (|PrimitiveTwoDimensionalArray| K)) (|nr| (|Integer|))
         (% (|PrimitiveTwoDimensionalArray| K)))
        (SPROG
         ((#1=#:G201 NIL) (|j| NIL) (#2=#:G200 NIL) (|i| NIL)
          (|res| (|PrimitiveTwoDimensionalArray| K)) (|nc| (|Integer|)))
         (SEQ (LETT |nc| (MIN (ANCOLS |m|) |nr|))
              (LETT |res| (MAKE_MATRIX1 |nr| |nc| (|spadConstant| % 14)))
              (SEQ (LETT |i| 0) (LETT #2# (- |nr| 1)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (- |nc| 1)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2 |res| |i| |j| (QAREF2 |m| |i| |j|))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODFT3;shift_mat!;Ptda2IV;25|
        ((|m| (|PrimitiveTwoDimensionalArray| K)) (|sa| #1=(|Integer|))
         (|nr| #1#) (% (|Void|)))
        (SPROG
         ((#2=#:G209 NIL) (|j| NIL) (#3=#:G208 NIL) (|i| NIL)
          (|nc| (|Integer|)))
         (SEQ (LETT |nc| (MIN (ANCOLS |m|) |nr|))
              (EXIT
               (SEQ (LETT |i| 0) (LETT #3# (- |nr| 1)) G190
                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 0) (LETT #2# (- |nc| 1)) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (QSETAREF2 |m| |i| |j|
                                        (QAREF2 |m| (+ |i| |sa|) |j|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |MODFT3;trim_mat!;Ptda2IRV;26|
        ((|m| (|PrimitiveTwoDimensionalArray| K)) (|nr0| #1=(|Integer|))
         (|nr1| #1#)
         (|rdata|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (% (|Void|)))
        (SPROG
         ((#2=#:G223 NIL) (|i| NIL) (|tmp1| (|PrimitiveArray| K))
          (#3=#:G222 NIL) (#4=#:G221 NIL) (|j| NIL)
          (|tmp| (|PrimitiveArray| K)) (|nc| (|Integer|)))
         (SEQ
          (COND ((< (ANROWS |m|) |nr0|) (|error| "trim_mat!: m too small"))
                ('T
                 (SEQ (LETT |nc| (MIN (ANCOLS |m|) |nr1|))
                      (LETT |tmp| (MAKEARR1 |nr0| (|spadConstant| % 14)))
                      (EXIT
                       (SEQ (LETT |j| 0) (LETT #4# (- |nc| 1)) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
                            (SEQ
                             (SEQ (LETT |i| 0) (LETT #3# (- |nr0| 1)) G190
                                  (COND ((|greater_SI| |i| #3#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (QSETAREF1 |tmp| |i|
                                               (QAREF2 |m| |i| |j|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |tmp1|
                                   (SPADCALL |tmp| |rdata| (QREFELT % 42)))
                             (EXIT
                              (SEQ (LETT |i| 0) (LETT #2# (- |nr1| 1)) G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (QSETAREF2 |m| |i| |j|
                                                (QAREF1 |tmp1| |i|))))
                                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))))))) 

(SDEFUN |MODFT3;split_mat!;Ptda3I2RV;27|
        ((|m| (|PrimitiveTwoDimensionalArray| K)) (|nr0| #1=(|Integer|))
         (|nr1| #1#) (|nr2| #1#)
         (|rdata1|
          #2=(|Record|
              (|:| |mod_data|
                   (|Record| (|:| |i_mod| (|Integer|))
                             (|:| |deg| (|Integer|))))
              (|:| |p_mod| (|PrimitiveArray| K))))
         (|rdata2| #2#) (% (|Void|)))
        (SPROG
         ((#3=#:G242 NIL) (|i| NIL) (|rtmp| (|PrimitiveArray| K))
          (#4=#:G241 NIL) (#5=#:G240 NIL) (#6=#:G239 NIL) (|j| NIL)
          (|tmp2| #7=(|PrimitiveArray| K)) (|tmp1| #7#) (|nc| (|Integer|)))
         (SEQ
          (COND ((< (ANROWS |m|) |nr1|) (|error| "split_mat!: m too small"))
                ('T
                 (SEQ (LETT |nc| (MIN (ANCOLS |m|) (MAX |nr1| |nr2|)))
                      (LETT |tmp1| (MAKEARR1 |nr0| (|spadConstant| % 14)))
                      (LETT |tmp2| (MAKEARR1 |nr0| (|spadConstant| % 14)))
                      (EXIT
                       (SEQ (LETT |j| 0) (LETT #6# (- |nc| 1)) G190
                            (COND ((|greater_SI| |j| #6#) (GO G191)))
                            (SEQ
                             (SEQ (LETT |i| 0) (LETT #5# (- |nr0| 1)) G190
                                  (COND ((|greater_SI| |i| #5#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (QSETAREF1 |tmp2| |i|
                                               (QSETAREF1 |tmp1| |i|
                                                          (QAREF2 |m| |i|
                                                                  |j|)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (COND
                              ((< |j| |nr1|)
                               (SEQ
                                (LETT |rtmp|
                                      (SPADCALL |tmp1| |rdata1|
                                                (QREFELT % 42)))
                                (EXIT
                                 (SEQ (LETT |i| 0) (LETT #4# (- |nr1| 1)) G190
                                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETAREF2 |m| |i| |j|
                                                   (QAREF1 |rtmp| |i|))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))))))
                             (EXIT
                              (COND
                               ((< |j| |nr2|)
                                (SEQ
                                 (LETT |rtmp|
                                       (SPADCALL |tmp2| |rdata2|
                                                 (QREFELT % 42)))
                                 (EXIT
                                  (SEQ (LETT |i| 0) (LETT #3# (- |nr2| 1)) G190
                                       (COND
                                        ((|greater_SI| |i| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (QSETAREF2 |m| (+ |i| |nr1|) |j|
                                                    (QAREF1 |rtmp| |i|))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))))))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))))))) 

(SDEFUN |MODFT3;mmul|
        ((|m1| (|PrimitiveTwoDimensionalArray| K))
         (|m2| (|PrimitiveTwoDimensionalArray| K)) (|d2| (|Integer|))
         (% (|PrimitiveTwoDimensionalArray| K)))
        (SPROG
         ((|ss| (K)) (#1=#:G256 NIL) (|k| NIL) (#2=#:G255 NIL) (|j| NIL)
          (#3=#:G254 NIL) (|i| NIL) (|res| (|PrimitiveTwoDimensionalArray| K))
          (|nr2| (|NonNegativeInteger|)) (|nc1| (|NonNegativeInteger|))
          (|nr1| (|NonNegativeInteger|)))
         (SEQ (LETT |nr1| (ANROWS |m1|)) (LETT |nc1| (ANCOLS |m1|))
              (EXIT
               (COND
                ((OR (< (ANCOLS |m2|) |nc1|) (< (ANROWS |m2|) |d2|))
                 (|error| "mmul: m2 too small"))
                ('T
                 (SEQ (LETT |nr2| |d2|)
                      (LETT |res|
                            (MAKE_MATRIX1 |nr1| |nr2| (|spadConstant| % 14)))
                      (SEQ (LETT |i| 0) (LETT #3# (- |nr1| 1)) G190
                           (COND ((|greater_SI| |i| #3#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| 0) (LETT #2# (- |nr2| 1)) G190
                                  (COND ((|greater_SI| |j| #2#) (GO G191)))
                                  (SEQ (LETT |ss| (|spadConstant| % 14))
                                       (SEQ (LETT |k| 0) (LETT #1# (- |nc1| 1))
                                            G190
                                            (COND
                                             ((|greater_SI| |k| #1#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |ss|
                                                    (SPADCALL |ss|
                                                              (SPADCALL
                                                               (QAREF2 |m1| |i|
                                                                       |k|)
                                                               (QAREF2 |m2| |j|
                                                                       |k|)
                                                               (QREFELT % 28))
                                                              (QREFELT %
                                                                       37)))))
                                            (LETT |k| (|inc_SI| |k|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (EXIT (QSETAREF2 |res| |i| |j| |ss|)))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MODFT3;modular_compose;PaPtdaPaNniRPa;29|
        ((|pol| #1=(|PrimitiveArray| K))
         (|pm| (|PrimitiveTwoDimensionalArray| K)) (|xp1| #1#)
         (|l1| (|NonNegativeInteger|))
         (|rdata|
          (|Record|
           (|:| |mod_data|
                (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
           (|:| |p_mod| (|PrimitiveArray| K))))
         (% (|PrimitiveArray| K)))
        (SPROG
         ((#2=#:G277 NIL) (|i| (|SingleInteger|))
          (|res| #3=(|PrimitiveArray| K)) (#4=#:G276 NIL) (|k| NIL)
          (|ns1| (|SingleInteger|)) (|work| #3#) (|p1| #3#)
          (|m2| (|PrimitiveTwoDimensionalArray| K)) (#5=#:G275 NIL)
          (#6=#:G274 NIL) (|j| NIL) (|k1| #7=(|SingleInteger|)) (|l1s| #7#)
          (|m1| (|PrimitiveTwoDimensionalArray| K))
          (|l2| #8=(|NonNegativeInteger|)) (|dps1| #7#) (|dp| #8#)
          (|dp0| (|Integer|)) (|ns| #7#) (|n| #8#) (|f| (|PrimitiveArray| K)))
         (SEQ (LETT |f| (QCDR |rdata|))
              (LETT |n| (SPADCALL |f| (QREFELT % 18))) (LETT |ns| |n|)
              (LETT |dp0| (SPADCALL |pol| (QREFELT % 18)))
              (EXIT
               (COND ((< |dp0| 0) (MAKEARR1 |n| (|spadConstant| % 14)))
                     (#9='T
                      (SEQ (LETT |dp| |dp0|) (LETT |dps1| (+ |dp| 1))
                           (LETT |l2| (QUOTIENT2 (+ |dp| |l1|) |l1|))
                           (COND ((EQL |l2| 1) (LETT |l1| (+ |dp| 1))))
                           (LETT |m1|
                                 (MAKE_MATRIX1 |l2| |l1|
                                               (|spadConstant| % 14)))
                           (LETT |i| 0) (LETT |l1s| (- |l1| 1))
                           (LETT |k1| (- |l2| 1))
                           (SEQ (LETT |j| 0) (LETT #6# |k1|) G190
                                (COND ((|greater_SI| |j| #6#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 0) (LETT #5# |l1s|) G190
                                       (COND
                                        ((OR (|greater_SI| |k| #5#)
                                             (NULL (|less_SI| |i| |dps1|)))
                                         (GO G191)))
                                       (SEQ
                                        (QSETAREF2 |m1| |j| |k|
                                                   (QAREF1 |pol| |i|))
                                        (EXIT (LETT |i| (|add_SI| |i| 1))))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |m2| (|MODFT3;mmul| |m1| |pm| |n| %))
                           (EXIT
                            (COND
                             ((SPADCALL (ANCOLS |m2|) |n| (QREFELT % 51))
                              (|error|
                               "modular_compose: unexpected dimension of m2"))
                             (#9#
                              (SEQ
                               (LETT |p1| (MAKEARR1 |n| (|spadConstant| % 14)))
                               (LETT |res|
                                     (MAKEARR1 |n| (|spadConstant| % 14)))
                               (LETT |work|
                                     (MAKEARR1 (- (* 2 |n|) 1)
                                               (|spadConstant| % 14)))
                               (LETT |ns1| (|sub_SI| |ns| 1))
                               (SEQ (LETT |k| |k1|) G190
                                    (COND ((< |k| 0) (GO G191)))
                                    (SEQ
                                     (SEQ (LETT |i| 0) (LETT #4# |ns1|) G190
                                          (COND
                                           ((|greater_SI| |i| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (QSETAREF1 |p1| |i|
                                                       (QAREF2 |m2| |k| |i|))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (COND
                                      ((< |k| |k1|)
                                       (LETT |res|
                                             (|MODFT3;mul_and_red| |res| |xp1|
                                              |work| |rdata| %))))
                                     (EXIT
                                      (SEQ (LETT |i| 0) (LETT #2# |ns1|) G190
                                           (COND
                                            ((|greater_SI| |i| #2#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF1 |res| |i|
                                                        (SPADCALL
                                                         (QAREF1 |res| |i|)
                                                         (QAREF1 |p1| |i|)
                                                         (QREFELT % 37)))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))))
                                    (LETT |k| (+ |k| -1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT |res|)))))))))))) 

(SDEFUN |MODFT3;sub1!;PaRPa;30|
        ((|pol| #1=(|PrimitiveArray| K))
         (|m| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
         (% #1#))
        (SEQ
         (COND
          ((EQL (QVSIZE |pol|) 0)
           (LETT |pol| (MAKEARR1 1 (|spadConstant| % 14)))))
         (QSETAREF1 |pol| 0
                    (SPADCALL (QAREF1 |pol| 0) (|spadConstant| % 13)
                              (QREFELT % 25)))
         (EXIT |pol|))) 

(DECLAIM (NOTINLINE |ModularFactorizationTools3;|)) 

(DEFUN |ModularFactorizationTools3;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ModularFactorizationTools3| DV$1))
          (LETT % (GETREFV 54))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularFactorizationTools3|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ModularFactorizationTools3| (#1=#:G290)
  (SPROG NIL
         (PROG (#2=#:G291)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ModularFactorizationTools3|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ModularFactorizationTools3;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ModularFactorizationTools3|)))))))))) 

(MAKEPROP '|ModularFactorizationTools3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              (|Record| (|:| |i_mod| 7) (|:| |deg| 7)) |MODFT3;get_char;RI;1|
              |MODFT3;get_extension_degree;RI;2|
              (|Record| (|:| |mod_data| 8) (|:| |p_mod| 17))
              |MODFT3;get_mod;RR;3| (0 . |One|) (4 . |Zero|) (|Boolean|)
              (8 . =) (|PrimitiveArray| 6) |MODFT3;degree;PaI;4|
              |MODFT3;empty_poly;Pa;5| (|PrimitiveTwoDimensionalArray| 6)
              (14 . |empty?|) |MODFT3;empty_mat?;PtdaB;8|
              |MODFT3;empty_mat;Ptda;7| |MODFT3;copy_poly;PaIRPa;14| (19 . -)
              |MODFT3;sub_poly;2PaRPa;9| (25 . |copy|) (30 . *) (|Void|)
              |MODFT3;mul_by_scalar;PaIKV;11| (36 . ~=) (42 . /)
              |MODFT3;ini_rdata;PaRR;12| |MODFT3;monomial1;RPa;13|
              (48 . |random|) |MODFT3;random_poly;IRPa;15| (52 . +)
              |MODFT3;add_poly;2PaRPa;17| (58 . -) |MODFT3;divide!;2PaRPa;18|
              |MODFT3;gcd;2PaRPa;19| |MODFT3;red_pol!;PaRPa;20|
              |MODFT3;mod_exp;PaIRPa;22|
              (|Record| (|:| |matr| 20) (|:| |poly| 17)) (|NonNegativeInteger|)
              |MODFT3;power_matrix;PaNniRR;23|
              |MODFT3;copy_mat_part;PtdaIPtda;24|
              |MODFT3;shift_mat!;Ptda2IV;25| |MODFT3;trim_mat!;Ptda2IRV;26|
              |MODFT3;split_mat!;Ptda3I2RV;27| (63 . ~=)
              |MODFT3;modular_compose;PaPtdaPaNniRPa;29|
              |MODFT3;sub1!;PaRPa;30|)
           '#(|trim_mat!| 69 |sub_poly| 77 |sub1!| 84 |split_mat!| 90
              |shift_mat!| 100 |red_pol!| 107 |random_poly| 113 |power_matrix|
              119 |mul_by_scalar| 126 |monomial1| 133 |modular_compose| 138
              |mod_exp| 147 |ini_rdata| 154 |get_mod| 160
              |get_extension_degree| 165 |get_char| 170 |gcd| 175 |empty_poly|
              182 |empty_mat?| 186 |empty_mat| 191 |divide!| 195 |degree| 202
              |copy_poly| 207 |copy_mat_part| 214 |add_poly| 220)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|ModularFactorizationOperations|
                            (|PrimitiveArray| 6)
                            (|PrimitiveTwoDimensionalArray| 6) 8
                            (|Record| (|:| |mod_data| 8)
                                      (|:| |p_mod| (|PrimitiveArray| 6)))))
                        (|makeByteWordVec2| 53
                                            '(0 6 0 13 0 6 0 14 2 6 15 0 0 16 1
                                              20 15 0 21 2 6 0 0 0 25 1 17 0 0
                                              27 2 6 0 0 0 28 2 6 15 0 0 31 2 6
                                              0 0 0 32 0 6 0 35 2 6 0 0 0 37 1
                                              6 0 0 39 2 45 15 0 0 51 4 0 29 20
                                              7 7 11 49 3 0 17 17 17 8 26 2 0
                                              17 17 8 53 6 0 29 20 7 7 7 11 11
                                              50 3 0 29 20 7 7 48 2 0 17 17 11
                                              42 2 0 17 7 8 36 3 0 44 17 45 11
                                              46 3 0 29 17 7 6 30 1 0 17 8 34 5
                                              0 17 17 20 17 45 11 52 3 0 17 17
                                              7 11 43 2 0 11 17 8 33 1 0 8 11
                                              12 1 0 7 8 10 1 0 7 8 9 3 0 17 17
                                              17 8 41 0 0 17 19 1 0 15 20 22 0
                                              0 20 23 3 0 17 17 17 8 40 1 0 7
                                              17 18 3 0 17 17 7 8 24 2 0 20 20
                                              7 47 3 0 17 17 17 8 38)))))
           '|lookupComplete|)) 
