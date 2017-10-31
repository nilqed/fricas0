
(SDEFUN |FCTOOL;newFortranTempVar;S;1| (($ |Symbol|))
        (SPROG
         ((|def_type| (|Symbol|)) (|new_sym| (|Symbol|))
          (|nr| (|SingleInteger|)))
         (SEQ
          (LETT |nr| (|add_SI| 1 |$exp2FortTempVarIndex|)
                . #1=(|FCTOOL;newFortranTempVar;S;1|))
          (SETF |$exp2FortTempVarIndex| |nr|)
          (LETT |new_sym|
                (SPADCALL (STRCONC "T" (STRINGIMAGE |nr|)) (QREFELT $ 8))
                . #1#)
          (LETT |def_type| |$defaultFortranType| . #1#)
          (SPADCALL |new_sym|
                    (SPADCALL (SPADCALL |def_type| (QREFELT $ 10))
                              (QREFELT $ 12))
                    (QREFELT $ 14))
          (EXIT |new_sym|)))) 

(SDEFUN |FCTOOL;checkType;2S;2| ((|t| |String|) ($ |String|))
        (COND
         ((EQUAL |$fortranPrecision| '|double|)
          (COND ((EQUAL |t| "REAL") "DOUBLE PRECISION")
                ((EQUAL |t| "COMPLEX") "DOUBLE COMPLEX") (#1='T |t|)))
         (#1# |t|))) 

(SDEFUN |FCTOOL;fortranCleanUp| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|oldTok| (|String|)) (|m| (|List| (|String|))) (#1=#:G833 NIL)
          (|e| NIL))
         (SEQ (LETT |oldTok| "" . #2=(|FCTOOL;fortranCleanUp|))
              (LETT |m| NIL . #2#)
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQUAL |oldTok| "-")
                      (COND
                       ((NULL (EQUAL |e| "+"))
                        (LETT |m| (CONS |e| |m|) . #2#))))
                     ('T (LETT |m| (CONS |e| |m|) . #2#)))
                    (EXIT (LETT |oldTok| |e| . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |FCTOOL;exp2FortFn|
        ((|op| . #1=(|String|)) (|args| |List| (|OutputForm|))
         (|nargs| |Integer|) ($ |List| (|String|)))
        (SPROG ((|s| (|List| #1#)) (#2=#:G838 NIL) (|arg| NIL))
               (SEQ (LETT |s| (LIST "(" |op|) . #3=(|FCTOOL;exp2FortFn|))
                    (EXIT
                     (COND ((EQL |nargs| 0) (CONS ")" |s|))
                           ('T
                            (SEQ
                             (SEQ (LETT |arg| NIL . #3#)
                                  (LETT #2# |args| . #3#) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |arg| (CAR #2#) . #3#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |s|
                                          (CONS ","
                                                (SPADCALL
                                                 (|FCTOOL;exp2Fort2| |arg| 0
                                                  |op| $)
                                                 |s| (QREFELT $ 24)))
                                          . #3#)))
                                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS ")" (CDR |s|)))))))))) 

(SDEFUN |FCTOOL;exp2Fort2|
        ((|e| |OutputForm|) (|prec| |Integer|) (|oldOp| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|s| (|List| (|String|))) (#1=#:G867 NIL) (|op1| (|String|))
          (|args1| #2=(|List| (|OutputForm|))) (#3=#:G868 NIL) (|arg| NIL)
          (|nprec| (|Integer|)) (|p| (|Integer|)) (|op| (|String|))
          (|nargs| (|NonNegativeInteger|)) (|args| #2#) (|op0| (|OutputForm|)))
         (SEQ
          (COND ((NULL |e|) NIL)
                ((SPADCALL |e| (QREFELT $ 29)) (LIST (|object2String| |e|)))
                (#4='T
                 (SEQ
                  (LETT |op0| (SPADCALL |e| (QREFELT $ 30))
                        . #5=(|FCTOOL;exp2Fort2|))
                  (LETT |args| (SPADCALL |e| (QREFELT $ 32)) . #5#)
                  (LETT |nargs| (LENGTH |args|) . #5#)
                  (LETT |op| (|object2String| |op0|) . #5#)
                  (COND
                   ((EQL |nargs| 2)
                    (COND
                     ((EQUAL |op| "=")
                      (EXIT
                       (CONS "%l"
                             (SPADCALL
                              (|FCTOOL;exp2Fort2|
                               (SPADCALL |args| 2 (QREFELT $ 34)) |prec| " " $)
                              (CONS "="
                                    (|FCTOOL;exp2Fort2|
                                     (SPADCALL |args| 1 (QREFELT $ 34)) |prec|
                                     " " $))
                              (QREFELT $ 24))))))))
                  (EXIT
                   (COND
                    ((EQL |nargs| 0) (|FCTOOL;exp2FortFn| |op| |args| 0 $))
                    ((EQL |nargs| 1)
                     (SEQ
                      (LETT |p| (SPADCALL |op| (QREFELT $ 17) (QREFELT $ 35))
                            . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |p| 0 (QREFELT $ 36))
                         (SEQ
                          (LETT |nprec|
                                (SPADCALL (QREFELT $ 18) |p| (QREFELT $ 38))
                                . #5#)
                          (LETT |s|
                                (SPADCALL
                                 (|FCTOOL;exp2Fort2| (|SPADfirst| |args|)
                                  |nprec| |op| $)
                                 (CONS |op| NIL) (QREFELT $ 24))
                                . #5#)
                          (COND
                           ((EQUAL |op| "-")
                            (COND
                             ((SPADCALL (|SPADfirst| |args|) (QREFELT $ 29))
                              (EXIT |s|)))))
                          (EXIT
                           (COND
                            ((SPADCALL |nprec| |prec| (QREFELT $ 39))
                             (CONS ")"
                                   (SPADCALL |s| (CONS "(" NIL)
                                             (QREFELT $ 24))))
                            (#4# |s|)))))
                        (#4# (|FCTOOL;exp2FortFn| |op| |args| |nargs| $))))))
                    ((EQUAL |op| "CMPLX")
                     (COND
                      ((SPADCALL |nargs| 2 (QREFELT $ 41))
                       (|error| "Bad number of arguments to CMPLX"))
                      (#4#
                       (CONS ")"
                             (SPADCALL
                              (|FCTOOL;exp2Fort2|
                               (SPADCALL |args| (QREFELT $ 42)) |prec| |op| $)
                              (CONS ","
                                    (SPADCALL
                                     (|FCTOOL;exp2Fort2| (|SPADfirst| |args|)
                                      |prec| |op| $)
                                     (CONS "(" NIL) (QREFELT $ 24)))
                              (QREFELT $ 24))))))
                    (#4#
                     (COND
                      ((SPADCALL |op| (QREFELT $ 25) (QREFELT $ 43))
                       (SEQ
                        (LETT |p| (SPADCALL |op| (QREFELT $ 19) (QREFELT $ 35))
                              . #5#)
                        (COND
                         ((EQL |p| 0)
                          (SEQ
                           (LETT |p|
                                 (SPADCALL |op| (QREFELT $ 21) (QREFELT $ 35))
                                 . #5#)
                           (EXIT
                            (LETT |nprec|
                                  (SPADCALL (QREFELT $ 22) |p| (QREFELT $ 38))
                                  . #5#))))
                         (#4#
                          (LETT |nprec|
                                (SPADCALL (QREFELT $ 20) |p| (QREFELT $ 38))
                                . #5#)))
                        (LETT |s| NIL . #5#)
                        (SEQ (LETT |arg| NIL . #5#) (LETT #3# |args| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |arg| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (COND
                                 ((EQUAL |op| "+")
                                  (COND
                                   ((NULL (SPADCALL |arg| (QREFELT $ 29)))
                                    (COND
                                     ((EQL
                                       (LENGTH
                                        (LETT |args1|
                                              (SPADCALL |arg| (QREFELT $ 32))
                                              . #5#))
                                       1)
                                      (SEQ
                                       (LETT |op1|
                                             (|object2String|
                                              (SPADCALL |arg| (QREFELT $ 30)))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((EQUAL |op1| "-")
                                          (PROGN
                                           (LETT #1#
                                                 (SEQ
                                                  (COND
                                                   ((NULL |s|)
                                                    (LETT |s| (LIST "junk")
                                                          . #5#)))
                                                  (EXIT
                                                   (LETT |s|
                                                         (CONS |op|
                                                               (SPADCALL
                                                                (|FCTOOL;exp2Fort2|
                                                                 (|SPADfirst|
                                                                  |args1|)
                                                                 |nprec| |op|
                                                                 $)
                                                                (CONS "-"
                                                                      (CDR
                                                                       |s|))
                                                                (QREFELT $
                                                                         24)))
                                                         . #5#)))
                                                 . #5#)
                                           (GO #6=#:G859))))))))))))
                                (EXIT
                                 (LETT |s|
                                       (CONS |op|
                                             (SPADCALL
                                              (|FCTOOL;exp2Fort2| |arg| |nprec|
                                               |op| $)
                                              |s| (QREFELT $ 24)))
                                       . #5#))))
                              #6# (EXIT #1#))
                             (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |s| (CDR |s|) . #5#)
                        (COND
                         ((EQUAL |op| |oldOp|)
                          (COND
                           ((OR (EQUAL |op| "*") (EQUAL |op| "+"))
                            (EXIT |s|)))))
                        (EXIT
                         (COND
                          ((SPADCALL |nprec| |prec| (QREFELT $ 39))
                           (CONS ")"
                                 (SPADCALL |s| (CONS "(" NIL) (QREFELT $ 24))))
                          (#4# |s|)))))
                      (#4#
                       (|FCTOOL;exp2FortFn| |op| |args| |nargs| $)))))))))))) 

(SDEFUN |FCTOOL;exp2Fort1| ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG
         ((|res| (|List| (|String|))) (|l1| (|List| (|String|)))
          (#1=#:G873 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL . #2=(|FCTOOL;exp2Fort1|))
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (|FCTOOL;exp2Fort2| |e| 0 "" $) . #2#)
                        (EXIT
                         (LETT |res| (SPADCALL |l1| |res| (QREFELT $ 24))
                               . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;tempLen| (($ |Integer|))
        (+ 1 (QCSIZE (STRINGIMAGE |$exp2FortTempVarIndex|)))) 

(SDEFUN |FCTOOL;fortExpSize_f|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) ($ |Integer|))
        (SPROG
         ((#1=#:G876 NIL) (#2=#:G875 #3=(|Integer|)) (#4=#:G877 #3#)
          (#5=#:G879 NIL) (|a| NIL))
         (SEQ
          (+ (+ 1 (LENGTH |args|))
             (PROGN
              (LETT #1# NIL . #6=(|FCTOOL;fortExpSize_f|))
              (SEQ (LETT |a| NIL . #6#) (LETT #5# (CONS |op| |args|) . #6#)
                   G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #4# (|FCTOOL;fortExpSize| |a| $) . #6#)
                      (COND (#1# (LETT #2# (+ #2# #4#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #4# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) ('T 0))))))) 

(SDEFUN |FCTOOL;same_subtree|
        ((|op| |String|) (|e| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op2| (|String|)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 29)) NIL)
                      ('T
                       (SEQ
                        (LETT |op2| (STRINGIMAGE (SPADCALL |e| (QREFELT $ 30)))
                              |FCTOOL;same_subtree|)
                        (EXIT (EQUAL |op| |op2|)))))))) 

(SDEFUN |FCTOOL;same_subtree2|
        ((|op| |Symbol|) (|e| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op2| (|OutputForm|)))
               (COND
                ((OR (SPADCALL |e| (QREFELT $ 29))
                     (NULL
                      (SPADCALL
                       (LETT |op2| (SPADCALL |e| (QREFELT $ 30))
                             |FCTOOL;same_subtree2|)
                       (QREFELT $ 44))))
                 NIL)
                ('T (EQUAL |op| (SPADCALL |op2| (QREFELT $ 45))))))) 

(SDEFUN |FCTOOL;fortExpSize| ((|e| |OutputForm|) ($ |Integer|))
        (SPROG
         ((|narys| (|List| (|String|))) (|ops| (|String|))
          (|arg2| #1=(|OutputForm|)) (|arg1| #1#)
          (|args| (|List| (|OutputForm|))) (|op| (|OutputForm|))
          (|s| (|String|)))
         (SEQ
          (COND
           ((SPADCALL |e| (QREFELT $ 29))
            (SEQ (LETT |s| (STRINGIMAGE |e|) . #2=(|FCTOOL;fortExpSize|))
                 (EXIT (QCSIZE |s|))))
           (#3='T
            (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 30)) . #2#)
                 (LETT |args| (SPADCALL |e| (QREFELT $ 32)) . #2#)
                 (EXIT
                  (COND
                   ((OR (SPADCALL (LENGTH |args|) 2 (QREFELT $ 36))
                        (< (LENGTH |args|) 2))
                    (|FCTOOL;fortExpSize_f| |op| |args| $))
                   ('T
                    (SEQ (LETT |arg1| (SPADCALL |args| 1 (QREFELT $ 34)) . #2#)
                         (LETT |arg2| (SPADCALL |args| 2 (QREFELT $ 34)) . #2#)
                         (LETT |ops| (STRINGIMAGE |op|) . #2#)
                         (EXIT
                          (COND
                           ((EQUAL |ops| "CMPLX")
                            (+ (+ 5 (|FCTOOL;fortExpSize| |arg1| $))
                               (|FCTOOL;fortExpSize| |arg2| $)))
                           (#3#
                            (SEQ (LETT |narys| (LIST "+" "*") . #2#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ops| |narys| (QREFELT $ 43))
                                    (SEQ
                                     (COND
                                      ((|FCTOOL;same_subtree| |ops| |arg1| $)
                                       (COND
                                        ((NULL
                                          (|FCTOOL;same_subtree| |ops| |arg2|
                                           $))
                                         (EXIT
                                          (|FCTOOL;fortExpSize_f| |op| |args|
                                           $)))))
                                      (#3#
                                       (EXIT
                                        (|FCTOOL;fortExpSize_f| |op| |args|
                                         $))))
                                     (EXIT
                                      (+ (+ 1 (|FCTOOL;fortExpSize| |arg1| $))
                                         (|FCTOOL;fortExpSize| |arg2| $)))))
                                   (#3#
                                    (|FCTOOL;fortExpSize_f| |op| |args|
                                     $)))))))))))))))))) 

(SDEFUN |FCTOOL;mk_assign2|
        ((|name| |OutputForm|) (|val| |OutputForm|) ($ |OutputForm|))
        (SPADCALL (QREFELT $ 47) (LIST |name| |val|) (QREFELT $ 49))) 

(SDEFUN |FCTOOL;mk_assign1|
        ((|name| |Symbol|) (|val| |OutputForm|) ($ |OutputForm|))
        (|FCTOOL;mk_assign2| (SPADCALL |name| (QREFELT $ 46)) |val| $)) 

(SDEFUN |FCTOOL;segment2l|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|))
         (|topSize| |Integer|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|newVar| #1=(|Symbol|)) (|new_e1| (|OutputForm|))
          (|newE| (|List| (|OutputForm|))) (|exprs| (|List| (|OutputForm|)))
          (|new_var_f| (|OutputForm|)) (|new_var| #1#) (|subSize| (|Integer|))
          (|subE| (|List| (|OutputForm|))) (#2=#:G908 NIL) (|e| NIL)
          (|maxSize| (|Integer|)))
         (SEQ
          (LETT |maxSize|
                (- (- |$maximumFortranExpressionLength| (|FCTOOL;tempLen| $))
                   1)
                . #3=(|FCTOOL;segment2l|))
          (LETT |exprs| NIL . #3#) (LETT |newE| NIL . #3#)
          (LETT |topSize|
                (- |topSize|
                   (|FCTOOL;fortExpSize| (SPADCALL |op| NIL (QREFELT $ 49)) $))
                . #3#)
          (SEQ (LETT |e| NIL . #3#) (LETT #2# |args| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |subSize| (|FCTOOL;fortExpSize| |e| $) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |subSize| |maxSize| (QREFELT $ 36))
                       (SEQ
                        (LETT |subE| (|FCTOOL;segment2| |e| |maxSize| $) . #3#)
                        (LETT |exprs|
                              (SPADCALL (CDR |subE|) |exprs| (QREFELT $ 50))
                              . #3#)
                        (LETT |subSize|
                              (|FCTOOL;fortExpSize| (|SPADfirst| |subE|) $)
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |subSize| |topSize| (QREFELT $ 39))
                           (SEQ
                            (LETT |newE|
                                  (SPADCALL |newE|
                                            (CONS (|SPADfirst| |subE|) NIL)
                                            (QREFELT $ 50))
                                  . #3#)
                            (EXIT
                             (LETT |topSize| (- |topSize| |subSize|) . #3#))))
                          ('T
                           (SEQ
                            (LETT |new_var| (SPADCALL (QREFELT $ 15)) . #3#)
                            (LETT |new_var_f|
                                  (SPADCALL |new_var| (QREFELT $ 46)) . #3#)
                            (LETT |newE|
                                  (SPADCALL |newE| (CONS |new_var_f| NIL)
                                            (QREFELT $ 50))
                                  . #3#)
                            (LETT |exprs|
                                  (CONS
                                   (|FCTOOL;mk_assign1| |new_var|
                                    (|SPADfirst| |subE|) $)
                                   |exprs|)
                                  . #3#)
                            (EXIT
                             (LETT |topSize|
                                   (- |topSize|
                                      (|FCTOOL;fortExpSize| |new_var_f| $))
                                   . #3#))))))))
                      ('T
                       (SEQ
                        (LETT |newE|
                              (SPADCALL |newE| (CONS |e| NIL) (QREFELT $ 50))
                              . #3#)
                        (EXIT
                         (LETT |topSize| (- |topSize| |subSize|) . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |new_e1| (SPADCALL |op| |newE| (QREFELT $ 49)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |topSize| 0 (QREFELT $ 36)) (CONS |new_e1| |exprs|))
            ('T
             (SEQ (LETT |newVar| (SPADCALL (QREFELT $ 15)) . #3#)
                  (EXIT
                   (CONS (SPADCALL |newVar| (QREFELT $ 46))
                         (CONS (|FCTOOL;mk_assign1| |newVar| |new_e1| $)
                               |exprs|)))))))))) 

(SDEFUN |FCTOOL;segment2|
        ((|e| |OutputForm|) (|topSize| |Integer|) ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |e| (QREFELT $ 29)) (LIST |e|))
              ('T
               (|FCTOOL;segment2l| (SPADCALL |e| (QREFELT $ 30))
                (SPADCALL |e| (QREFELT $ 32)) |topSize| $)))) 

(SDEFUN |FCTOOL;segment1l|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|))
         (|maxSize| |Integer|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|safeSize| (|Integer|)) (|new_args| (|List| (|OutputForm|)))
          (|expressions| (|List| (|OutputForm|)))
          (|exprs| (|List| (|OutputForm|))) (|subSize| (|Integer|))
          (#1=#:G917 NIL) (|e| NIL))
         (SEQ (LETT |expressions| NIL . #2=(|FCTOOL;segment1l|))
              (LETT |new_args| NIL . #2#)
              (LETT |safeSize|
                    (-
                     (- |maxSize|
                        (* (LENGTH |args|) (+ (|FCTOOL;tempLen| $) 1)))
                     (|FCTOOL;fortExpSize| (SPADCALL |op| NIL (QREFELT $ 49))
                      $))
                    . #2#)
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |args| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |subSize| (|FCTOOL;fortExpSize| |e| $) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |subSize| |safeSize| (QREFELT $ 39))
                           (SEQ
                            (LETT |safeSize| (- |safeSize| |subSize|) . #2#)
                            (EXIT
                             (LETT |new_args|
                                   (SPADCALL |new_args| (CONS |e| NIL)
                                             (QREFELT $ 50))
                                   . #2#))))
                          ('T
                           (SEQ
                            (LETT |exprs| (|FCTOOL;segment2| |e| |safeSize| $)
                                  . #2#)
                            (LETT |expressions|
                                  (SPADCALL (CDR |exprs|) |expressions|
                                            (QREFELT $ 50))
                                  . #2#)
                            (LETT |new_args|
                                  (SPADCALL |new_args|
                                            (CONS (|SPADfirst| |exprs|) NIL)
                                            (QREFELT $ 50))
                                  . #2#)
                            (EXIT
                             (LETT |safeSize|
                                   (- |safeSize|
                                      (|FCTOOL;fortExpSize|
                                       (|SPADfirst| |exprs|) $))
                                   . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (SPADCALL |op| |new_args| (QREFELT $ 49))
                     |expressions|))))) 

(SDEFUN |FCTOOL;segment1|
        ((|e| |OutputForm|) (|maxSize| |Integer|) ($ |List| (|OutputForm|)))
        (COND ((< (|FCTOOL;fortExpSize| |e| $) |maxSize|) (LIST |e|))
              ((SPADCALL |e| (QREFELT $ 29))
               (|error| "segment1 expecting composite form"))
              ('T
               (|FCTOOL;segment1l| (SPADCALL |e| (QREFELT $ 30))
                (SPADCALL |e| (QREFELT $ 32)) |maxSize| $)))) 

(SDEFUN |FCTOOL;segment|
        ((|l| |List| (|OutputForm|)) ($ |List| (|OutputForm|)))
        (SPROG
         ((|s| (|List| (|OutputForm|))) (|exprs| (|List| (|OutputForm|)))
          (|var| (|OutputForm|)) (|args| (|List| (|OutputForm|)))
          (|e1s| (|Symbol|)) (|e1f| (|OutputForm|)) (#1=#:G931 NIL) (|e| NIL))
         (SEQ
          (COND ((NULL |$fortranSegment|) |l|)
                ('T
                 (SEQ (LETT |s| NIL . #2=(|FCTOOL;segment|))
                      (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 29))
                               (LETT |s| (CONS |e| |s|) . #2#))
                              ('T
                               (SEQ
                                (LETT |e1f| (SPADCALL |e| (QREFELT $ 30))
                                      . #2#)
                                (COND
                                 ((NULL (SPADCALL |e1f| (QREFELT $ 44)))
                                  (EXIT (LETT |s| (CONS |e| |s|) . #2#))))
                                (LETT |e1s| (SPADCALL |e1f| (QREFELT $ 45))
                                      . #2#)
                                (LETT |args| (SPADCALL |e| (QREFELT $ 32))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((EQUAL |e1s| '=)
                                   (SEQ
                                    (LETT |var|
                                          (SPADCALL |args| 1 (QREFELT $ 34))
                                          . #2#)
                                    (LETT |exprs|
                                          (|FCTOOL;segment1|
                                           (SPADCALL |args| 2 (QREFELT $ 34))
                                           (-
                                            (-
                                             |$maximumFortranExpressionLength|
                                             1)
                                            (|FCTOOL;fortExpSize| |var| $))
                                           $)
                                          . #2#)
                                    (EXIT
                                     (LETT |s|
                                           (CONS
                                            (SPADCALL |e1f|
                                                      (LIST |var|
                                                            (|SPADfirst|
                                                             |exprs|))
                                                      (QREFELT $ 49))
                                            (SPADCALL (CDR |exprs|) |s|
                                                      (QREFELT $ 50)))
                                           . #2#))))
                                  ((EQUAL |e1s| 'RETURN)
                                   (SEQ
                                    (LETT |exprs|
                                          (|FCTOOL;segment1|
                                           (SPADCALL |args| 1 (QREFELT $ 34))
                                           (-
                                            (-
                                             |$maximumFortranExpressionLength|
                                             2)
                                            (|FCTOOL;fortExpSize|
                                             (SPADCALL |args| 1 (QREFELT $ 34))
                                             $))
                                           $)
                                          . #2#)
                                    (EXIT
                                     (LETT |s|
                                           (CONS
                                            (SPADCALL |e1f|
                                                      (LIST
                                                       (|SPADfirst| |exprs|))
                                                      (QREFELT $ 49))
                                            (SPADCALL (CDR |exprs|) |s|
                                                      (QREFELT $ 50)))
                                           . #2#))))
                                  ('T (LETT |s| (CONS |e| |s|) . #2#)))))))))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (NREVERSE |s|)))))))) 

(PUT '|FCTOOL;fortError1| '|SPADreplace| '|fortError1|) 

(SDEFUN |FCTOOL;fortError1| ((|e| |OutputForm|) ($ |OutputForm|))
        (|fortError1| |e|)) 

(SDEFUN |FCTOOL;fortError1l|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FCTOOL;fortError1|
         (SPADCALL (SPADCALL |op| (QREFELT $ 46)) |args| (QREFELT $ 49)) $)) 

(SDEFUN |FCTOOL;push_expr_stack| ((|e| |OutputForm|) ($ |Void|))
        (SETELT $ 51 (CONS |e| (QREFELT $ 51)))) 

(SDEFUN |FCTOOL;pop_expr_stack| (($ |OutputForm|))
        (SPROG ((|res| (|OutputForm|)))
               (SEQ
                (LETT |res| (|SPADfirst| (QREFELT $ 51))
                      |FCTOOL;pop_expr_stack|)
                (SETELT $ 51 (CDR (QREFELT $ 51))) (EXIT |res|)))) 

(SDEFUN |FCTOOL;clear_used_intrinsics;V;23| (($ |Void|)) (SETELT $ 52 NIL)) 

(SDEFUN |FCTOOL;get_used_intrinsics;L;24| (($ |List| (|String|)))
        (SPROG ((#1=#:G941 NIL) (|sy| NIL) (#2=#:G940 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;get_used_intrinsics;L;24|))
                 (SEQ (LETT |sy| NIL . #3#) (LETT #1# (QREFELT $ 52) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sy| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |sy| (QREFELT $ 55)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;record_intrinsic| ((|sy| |Symbol|) ($ |Void|))
        (COND
         ((NULL (SPADCALL |sy| (QREFELT $ 52) (QREFELT $ 58)))
          (SETELT $ 52 (CONS |sy| (QREFELT $ 52)))))) 

(SDEFUN |FCTOOL;fortranifyIntrinsicFunctionName|
        ((|sy| |Symbol|) (|nargs| |Integer|) ($ |Symbol|))
        (SPROG
         ((#1=#:G955 NIL) (#2=#:G956 NIL) (|r1| NIL)
          (|use_double| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |use_double|
                  (COND (|$useIntrinsicFunctions| NIL)
                        (#3='T (EQUAL |$fortranPrecision| '|double|)))
                  . #4=(|FCTOOL;fortranifyIntrinsicFunctionName|))
            (COND
             ((EQUAL |sy| '|atan|)
              (COND
               ((EQL |nargs| 2)
                (EXIT
                 (COND
                  (|$useIntrinsicFunctions|
                   (SEQ (|FCTOOL;record_intrinsic| 'ATAN2 $) (EXIT 'ATAN2)))
                  (|use_double| 'DATAN2) (#3# 'ATAN2)))))))
            (SEQ (LETT |r1| NIL . #4#) (LETT #2# (QREFELT $ 59) . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |r1| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL (QVELT |r1| 0) |sy|)
                     (COND
                      (|$useIntrinsicFunctions|
                       (SEQ (|FCTOOL;record_intrinsic| (QVELT |r1| 1) $)
                            (EXIT
                             (PROGN
                              (LETT #1# (QVELT |r1| 1) . #4#)
                              (GO #5=#:G954)))))
                      (|use_double|
                       (PROGN (LETT #1# (QVELT |r1| 2) . #4#) (GO #5#)))
                      ('T
                       (PROGN (LETT #1# (QVELT |r1| 1) . #4#) (GO #5#))))))))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |sy|)))
          #5# (EXIT #1#)))) 

(SDEFUN |FCTOOL;fortranifyFunctionName|
        ((|sy| |Symbol|) (|nargs| |Integer|) ($ |Symbol|))
        (SPROG ((#1=#:G962 NIL) (#2=#:G963 NIL) (|p1| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |p1| NIL . #3=(|FCTOOL;fortranifyFunctionName|))
                       (LETT #2# (QREFELT $ 60) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |p1| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQUAL (QCAR |p1|) |sy|)
                           (PROGN
                            (LETT #1# (QCDR |p1|) . #3#)
                            (GO #4=#:G961))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (|FCTOOL;fortranifyIntrinsicFunctionName| |sy| |nargs| $))))
                #4# (EXIT #1#)))) 

(SDEFUN |FCTOOL;mkFortFn|
        ((|name| . #1=(|OutputForm|)) (|args| |List| (|OutputForm|))
         (|nargs| |Integer|) ($ |OutputForm|))
        (SPROG ((#2=#:G970 NIL) (|arg| NIL) (#3=#:G969 NIL) (|nn| #1#))
               (SEQ
                (LETT |nn|
                      (COND ((NULL (SPADCALL |name| (QREFELT $ 44))) |name|)
                            ('T
                             (SPADCALL
                              (|FCTOOL;fortranifyFunctionName|
                               (SPADCALL |name| (QREFELT $ 45)) |nargs| $)
                              (QREFELT $ 46))))
                      . #4=(|FCTOOL;mkFortFn|))
                (EXIT
                 (SPADCALL |nn|
                           (PROGN
                            (LETT #3# NIL . #4#)
                            (SEQ (LETT |arg| NIL . #4#) (LETT #2# |args| . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |arg| (CAR #2#) . #4#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS (|FCTOOL;fortPre1| |arg| $) #3#)
                                         . #4#)))
                                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           (QREFELT $ 49)))))) 

(SDEFUN |FCTOOL;mkMat| ((|args| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ
                (LETT |save_fortInts2Floats| |$fortInts2Floats| |FCTOOL;mkMat|)
                (EXIT
                 (|finally|
                  (SEQ (SETF |$fortInts2Floats| NIL)
                       (EXIT
                        (|FCTOOL;mkFortFn| (|SPADfirst| |args|) (CDR |args|)
                         (LENGTH (CDR |args|)) $)))
                  (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;fortPreRoot| ((|e| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ
                (LETT |save_fortInts2Floats| |$fortInts2Floats|
                      |FCTOOL;fortPreRoot|)
                (EXIT
                 (|finally|
                  (SEQ (SETF |$fortInts2Floats| 'T)
                       (EXIT (|FCTOOL;fortPre1| |e| $)))
                  (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;exp2FortSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|nargs| |Integer|)
         ($ |OutputForm|))
        (SPROG
         ((|as1| (|OutputForm|)) (#1=#:G1055 NIL) (|c| NIL) (|cx| NIL)
          (|rx_f| (|OutputForm|)) (#2=#:G1054 NIL) (|r| NIL) (|rx| NIL)
          (|si| (|Integer|)) (|rows| (|List| (|OutputForm|)))
          (|var| (|OutputForm|)) (#3=#:G1053 NIL) (|e| NIL) (|i| NIL)
          (|elts| #4=(|List| (|OutputForm|))) (#5=#:G1052 NIL) (|ii| NIL)
          (|i2| #6=(|Integer|)) (|i1| #6#) (|sArgs| #4#)
          (|sOp| #7=(|OutputForm|)) (|op1| #7#) (|old_Ints2Floats| (|Boolean|))
          (|tailPart| (|List| (|String|))) (#8=#:G1051 NIL) (|x| NIL)
          (#9=#:G1050 NIL) (|n_args| #4#) (|arg| (|OutputForm|)))
         (SEQ
          (COND
           ((EQUAL |op| 'CONCAT)
            (COND
             ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 34)) (QREFELT $ 44))
              (COND
               ((SPADCALL
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 34)) (QREFELT $ 45))
                 (LIST '< '> '<= '>= '~ '|and| '|or|) (QREFELT $ 58))
                (EXIT
                 (SEQ
                  (LETT |n_args|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 34))
                                    (QREFELT $ 32))
                          1 (QREFELT $ 34))
                         (QREFELT $ 32))
                        . #10=(|FCTOOL;exp2FortSpecial|))
                  (EXIT
                   (|FCTOOL;mkFortFn| (|SPADfirst| |args|) |n_args|
                    (LENGTH |n_args|) $))))))))))
          (COND
           ((EQUAL |op| 'CONCAT)
            (COND
             ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 34)) (QREFELT $ 44))
              (COND
               ((EQUAL
                 (SPADCALL (SPADCALL |args| 2 (QREFELT $ 34)) (QREFELT $ 45))
                 'EQ)
                (EXIT
                 (|FCTOOL;mkFortFn| (SPADCALL |args| 2 (QREFELT $ 34))
                  (LIST (|SPADfirst| |args|)
                        (SPADCALL |args| 3 (QREFELT $ 34)))
                  2 $))))))))
          (EXIT
           (COND
            ((EQUAL |op| 'QUOTE)
             (COND
              ((SPADCALL (LETT |arg| (|SPADfirst| |args|) . #10#)
                         (QREFELT $ 29))
               (STRINGIMAGE |arg|))
              (#11='T
               (SEQ (LETT |n_args| (SPADCALL |arg| (QREFELT $ 32)) . #10#)
                    (LETT |tailPart|
                          (PROGN
                           (LETT #9# NIL . #10#)
                           (SEQ (LETT |x| NIL . #10#)
                                (LETT #8# |n_args| . #10#) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |x| (CAR #8#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #9#
                                        (CONS
                                         (STRCONC ","
                                                  (SPADCALL |x|
                                                            (QREFELT $ 61)))
                                         #9#)
                                        . #10#)))
                                (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #9#))))
                          . #10#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS "["
                             (CONS
                              (SPADCALL (SPADCALL |arg| (QREFELT $ 30))
                                        (QREFELT $ 61))
                              (SPADCALL |tailPart| (CONS "]" NIL)
                                        (QREFELT $ 24))))
                       (QREFELT $ 62))
                      (QREFELT $ 63)))))))
            ((EQUAL |op| 'PAREN)
             (SEQ
              (LETT |op1|
                    (SPADCALL (SPADCALL |args| 1 (QREFELT $ 34))
                              (QREFELT $ 30))
                    . #10#)
              (COND
               ((SPADCALL |op1| (QREFELT $ 44))
                (COND
                 ((NULL (EQUAL (SPADCALL |op1| (QREFELT $ 45)) 'CONCATB))
                  (EXIT
                   (|FCTOOL;fortPre1| (SPADCALL |args| 1 (QREFELT $ 34)) $)))))
               (#11#
                (EXIT
                 (|FCTOOL;fortPre1| (SPADCALL |args| 1 (QREFELT $ 34)) $))))
              (EXIT
               (|FCTOOL;mkMat|
                (SPADCALL (SPADCALL |args| 1 (QREFELT $ 34)) (QREFELT $ 32))
                $))))
            ((EQUAL |op| 'SUB)
             (SEQ (LETT |old_Ints2Floats| |$fortInts2Floats| . #10#)
                  (EXIT
                   (|finally|
                    (SEQ (SETF |$fortInts2Floats| NIL)
                         (EXIT
                          (|FCTOOL;mkFortFn| (|SPADfirst| |args|) (CDR |args|)
                           (LENGTH (CDR |args|)) $)))
                    (SETF |$fortInts2Floats| |old_Ints2Floats|)))))
            ((OR (EQUAL |op| 'BRACE) (EQUAL |op| 'BRACKET))
             (SEQ
              (COND
               ((EQL (LENGTH |args|) 2)
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |args| 2 (QREFELT $ 34))
                             (QREFELT $ 29)))
                  (COND
                   ((SPADCALL
                     (LETT |op1|
                           (SPADCALL (SPADCALL |args| 2 (QREFELT $ 34))
                                     (QREFELT $ 30))
                           . #10#)
                     (QREFELT $ 44))
                    (COND
                     ((EQUAL (SPADCALL |op1| (QREFELT $ 45)) 'AGGLST)
                      (EXIT
                       (SEQ
                        (LETT |var| (SPADCALL |args| 1 (QREFELT $ 34)) . #10#)
                        (LETT |elts|
                              (SPADCALL (SPADCALL |args| 2 (QREFELT $ 34))
                                        (QREFELT $ 32))
                              . #10#)
                        (LETT |si| |$fortranArrayStartingIndex| . #10#)
                        (COND
                         ((EQL (LENGTH |elts|) 1)
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 34))
                                       (QREFELT $ 29)))
                            (SEQ
                             (LETT |sOp|
                                   (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 34))
                                             (QREFELT $ 30))
                                   . #10#)
                             (LETT |sArgs|
                                   (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 34))
                                             (QREFELT $ 32))
                                   . #10#)
                             (EXIT
                              (COND
                               ((SPADCALL |sOp| (QREFELT $ 44))
                                (COND
                                 ((EQUAL (SPADCALL |sOp| (QREFELT $ 45))
                                         'SEGMENT)
                                  (COND
                                   ((EQL (LENGTH |sArgs|) 1)
                                    (|FCTOOL;fortError1| (|SPADfirst| |elts|)
                                     $))
                                   (#11#
                                    (SEQ
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |sArgs| 1 (QREFELT $ 34))
                                        (QREFELT $ 64))
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (SPADCALL |sArgs| 2 (QREFELT $ 34))
                                           (QREFELT $ 64)))
                                         (EXIT
                                          (|fortError|
                                           #12="Cannot expand segment: "
                                           (|SPADfirst| |elts|))))))
                                      (#11#
                                       (EXIT
                                        (|fortError| #12#
                                                     (|SPADfirst| |elts|)))))
                                     (LETT |i1|
                                           (SPADCALL
                                            (SPADCALL |sArgs| 1 (QREFELT $ 34))
                                            (QREFELT $ 65))
                                           . #10#)
                                     (LETT |i2|
                                           (SPADCALL
                                            (SPADCALL |sArgs| 2 (QREFELT $ 34))
                                            (QREFELT $ 65))
                                           . #10#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |i1| |i2| (QREFELT $ 36))
                                        (|FCTOOL;fortError1|
                                         (SPADCALL
                                          "Lower bound of segment exceeds upper bound."
                                          (QREFELT $ 63))
                                         $))
                                       (#11#
                                        (SEQ
                                         (SEQ (LETT |i| |si| . #10#)
                                              (LETT |ii| |i1| . #10#)
                                              (LETT #5# |i2| . #10#) G190
                                              (COND ((> |ii| #5#) (GO G191)))
                                              (SEQ
                                               (LETT |as1|
                                                     (|FCTOOL;mk_assign2|
                                                      (SPADCALL |var|
                                                                (LIST
                                                                 (SPADCALL |i|
                                                                           (QREFELT
                                                                            $
                                                                            66)))
                                                                (QREFELT $ 49))
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL |ii|
                                                                 (QREFELT $
                                                                          66))
                                                       $)
                                                      $)
                                                     . #10#)
                                               (EXIT
                                                (|FCTOOL;push_expr_stack| |as1|
                                                 $)))
                                              (LETT |ii|
                                                    (PROG1 (+ |ii| 1)
                                                      (LETT |i| (+ |i| 1)
                                                            . #10#))
                                                    . #10#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (LETT |elts| NIL
                                                . #10#)))))))))))))))))))
                        (SEQ (LETT |i| |si| . #10#) (LETT |e| NIL . #10#)
                             (LETT #3# |elts| . #10#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |e| (CAR #3#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |as1|
                                    (|FCTOOL;mk_assign2|
                                     (SPADCALL |var|
                                               (LIST
                                                (SPADCALL |i| (QREFELT $ 66)))
                                               (QREFELT $ 49))
                                     (|FCTOOL;fortPre1| |e| $) $)
                                    . #10#)
                              (EXIT (|FCTOOL;push_expr_stack| |as1| $)))
                             (LETT #3#
                                   (PROG1 (CDR #3#)
                                     (LETT |i| (+ |i| 1) . #10#))
                                   . #10#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (|FCTOOL;pop_expr_stack| $))))))))))))
              (EXIT (|FCTOOL;fortError1l| |op| |args| $))))
            ((OR (EQUAL |op| 'CONCAT) (EQUAL |op| 'CONCATB))
             (COND ((EQL |nargs| 0) NIL)
                   ((EQL |nargs| 1) (|FCTOOL;fortPre1| (|SPADfirst| |args|) $))
                   (#11#
                    (SEQ
                     (COND
                      ((EQL |nargs| 2)
                       (COND
                        ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 34))
                                   (QREFELT $ 44))
                         (COND
                          ((EQUAL
                            (SPADCALL (SPADCALL |args| 2 (QREFELT $ 34))
                                      (QREFELT $ 45))
                            '!)
                           (EXIT
                            (|FCTOOL;mkFortFn| 'FACTORIAL
                             (LIST (|SPADfirst| |args|)) 1 $))))))))
                     (EXIT (|FCTOOL;fortError1l| |op| |args| $))))))
            ('T
             (COND
              ((EQUAL |op| 'MATRIX)
               (SEQ (LETT |var| (SPADCALL |args| 1 (QREFELT $ 34)) . #10#)
                    (LETT |rows| (CDR (CDR |args|)) . #10#)
                    (LETT |si| |$fortranArrayStartingIndex| . #10#)
                    (SEQ (LETT |rx| |si| . #10#) (LETT |r| NIL . #10#)
                         (LETT #2# |rows| . #10#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |r| (CAR #2#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |rx_f| (SPADCALL |rx| (QREFELT $ 66)) . #10#)
                          (EXIT
                           (SEQ (LETT |cx| |si| . #10#) (LETT |c| NIL . #10#)
                                (LETT #1# (SPADCALL |r| (QREFELT $ 32)) . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |c| (CAR #1#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |as1|
                                       (|FCTOOL;mk_assign2|
                                        (SPADCALL |var|
                                                  (LIST |rx_f|
                                                        (SPADCALL |cx|
                                                                  (QREFELT $
                                                                           66)))
                                                  (QREFELT $ 49))
                                        (|FCTOOL;fortPre1| |c| $) $)
                                       . #10#)
                                 (EXIT (|FCTOOL;push_expr_stack| |as1| $)))
                                (LETT #1#
                                      (PROG1 (CDR #1#)
                                        (LETT |cx| (+ |cx| 1) . #10#))
                                      . #10#)
                                (GO G190) G191 (EXIT NIL))))
                         (LETT #2#
                               (PROG1 (CDR #2#) (LETT |rx| (+ |rx| 1) . #10#))
                               . #10#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT (|FCTOOL;pop_expr_stack| $))))
              (#11# (|FCTOOL;fortError1l| |op| |args| $))))))))) 

(SDEFUN |FCTOOL;is_imaginary| ((|x| |OutputForm|) ($ |Boolean|))
        (COND ((NULL (SPADCALL |x| (QREFELT $ 44))) NIL)
              ('T (EQUAL (SPADCALL |x| (QREFELT $ 45)) '|%i|)))) 

(SDEFUN |FCTOOL;fix2FortranFloat| ((|i| |Integer|) ($ |OutputForm|))
        (SPROG ((|ss| (|String|)))
               (SEQ
                (LETT |ss| (STRINGIMAGE |i|) . #1=(|FCTOOL;fix2FortranFloat|))
                (LETT |ss|
                      (STRCONC |ss|
                               (COND
                                ((EQUAL |$fortranPrecision| '|double|) ".0D0")
                                ('T ".0")))
                      . #1#)
                (EXIT (SPADCALL |ss| (QREFELT $ 63)))))) 

(SDEFUN |FCTOOL;checkPrecision1| ((|s| |String|) ($ |String|))
        (SPROG ((|p2| #1=(|Integer|)) (|p1| #1#) (|s2| (|String|)))
               (SEQ
                (COND
                 ((|eql_SI| (SPADCALL |s| 1 (QREFELT $ 70))
                            (|STR_to_CHAR| "\""))
                  |s|)
                 (#2='T
                  (SEQ
                   (LETT |s2|
                         (SPADCALL (|STR_to_CHAR| " ")
                                   (SPADCALL (|STR_to_CHAR| "_") |s|
                                             (QREFELT $ 72))
                                   (QREFELT $ 72))
                         . #3=(|FCTOOL;checkPrecision1|))
                   (LETT |p1|
                         (SPADCALL (|STR_to_CHAR| ".") |s2| (QREFELT $ 73))
                         . #3#)
                   (EXIT
                    (COND ((< |p1| 1) |s|)
                          ((SPADCALL |$fortranPrecision| '|double|
                                     (QREFELT $ 74))
                           |s2|)
                          (#2#
                           (SEQ
                            (LETT |p2|
                                  (SPADCALL (|STR_to_CHAR| "E") |s2|
                                            (QREFELT $ 73))
                                  . #3#)
                            (EXIT
                             (COND
                              ((SPADCALL |p2| 0 (QREFELT $ 36))
                               (SEQ
                                (SPADCALL |s2| |p2|
                                          (SPADCALL "D" 1 (QREFELT $ 70))
                                          (QREFELT $ 75))
                                (EXIT |s2|)))
                              (#2# (STRCONC |s2| "D0")))))))))))))) 

(SDEFUN |FCTOOL;checkPrecision| ((|s| |String|) ($ |OutputForm|))
        (SPADCALL (|FCTOOL;checkPrecision1| |s| $) (QREFELT $ 63))) 

(SDEFUN |FCTOOL;fortPre1| ((|e| |OutputForm|) ($ . #1=(|OutputForm|)))
        (SPROG
         ((|n_args| #2=(|List| (|OutputForm|))) (|arg2| #3=(|OutputForm|))
          (|arg1| #3#) (|im_op| (|OutputForm|)) (|binaryExpr| #1#)
          (#4=#:G1113 NIL) (|e1| NIL) (|op| (|OutputForm|))
          (|sy| #5=(|Symbol|)) (#6=#:G1112 NIL) (|sr| #5#) (|exponent| #3#)
          (|rand| #3#) (|args| #2#) (|ss| (|String|)) (|ii| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |e| (QREFELT $ 29))
             (COND
              ((SPADCALL |e| (QREFELT $ 64))
               (COND
                (|$fortInts2Floats|
                 (SEQ
                  (LETT |ii| (SPADCALL |e| (QREFELT $ 65))
                        . #7=(|FCTOOL;fortPre1|))
                  (EXIT
                   (COND ((>= |ii| 0) (|FCTOOL;fix2FortranFloat| |ii| $))
                         (#8='T
                          (SPADCALL (SPADCALL '- (QREFELT $ 76))
                                    (LIST
                                     (|FCTOOL;fix2FortranFloat| (- |ii|) $))
                                    (QREFELT $ 49)))))))
                (#8# |e|)))
              ((SPADCALL |e| (QREFELT $ 77))
               (|FCTOOL;checkPrecision| (SPADCALL |e| (QREFELT $ 61)) $))
              ((SPADCALL |e| (QREFELT $ 44))
               (SEQ (LETT |sy| (SPADCALL |e| (QREFELT $ 45)) . #7#)
                    (EXIT
                     (COND
                      ((EQUAL |sy| '|%e|)
                       (|FCTOOL;fortPre1|
                        (SPADCALL (SPADCALL '|exp| (QREFELT $ 46))
                                  (LIST (SPADCALL 1 (QREFELT $ 66)))
                                  (QREFELT $ 49))
                        $))
                      ((EQUAL |sy| '|%i|)
                       (SPADCALL (SPADCALL 'CMPLX (QREFELT $ 46))
                                 (LIST
                                  (|FCTOOL;fortPre1|
                                   (SPADCALL 0 (QREFELT $ 66)) $)
                                  (|FCTOOL;fortPre1|
                                   (SPADCALL 1 (QREFELT $ 66)) $))
                                 (QREFELT $ 49)))
                      (#8#
                       (SEQ (LETT |ss| (SPADCALL |sy| (QREFELT $ 55)) . #7#)
                            (EXIT
                             (COND
                              ((|eql_SI| (SPADCALL |ss| 1 (QREFELT $ 70))
                                         (|STR_to_CHAR| "%"))
                               (SPADCALL
                                (SPADCALL |ss| (SPADCALL 2 (QREFELT $ 79))
                                          (QREFELT $ 80))
                                (QREFELT $ 63)))
                              (#8# |e|)))))))))
              (#8# |e|)))
            (#8#
             (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 30)) . #7#)
                  (LETT |args| (SPADCALL |e| (QREFELT $ 32)) . #7#)
                  (EXIT
                   (COND
                    ((SPADCALL |op| (QREFELT $ 44))
                     (SEQ (LETT |sy| (SPADCALL |op| (QREFELT $ 45)) . #7#)
                          (EXIT
                           (COND
                            ((EQUAL |sy| '^)
                             (SEQ
                              (LETT |rand| (SPADCALL |args| 1 (QREFELT $ 34))
                                    . #7#)
                              (LETT |exponent|
                                    (SPADCALL |args| 2 (QREFELT $ 34)) . #7#)
                              (COND
                               ((SPADCALL |rand| (QREFELT $ 44))
                                (SEQ
                                 (LETT |sr| (SPADCALL |rand| (QREFELT $ 45))
                                       . #7#)
                                 (EXIT
                                  (COND
                                   ((EQUAL |sr| '|%e|)
                                    (PROGN
                                     (LETT #6#
                                           (|FCTOOL;fortPre1|
                                            (SPADCALL
                                             (SPADCALL '|exp| (QREFELT $ 46))
                                             (LIST |exponent|) (QREFELT $ 49))
                                            $)
                                           . #7#)
                                     (GO #9=#:G1111)))
                                   ((SPADCALL |exponent| (QREFELT $ 64))
                                    (COND
                                     ((EQL (SPADCALL |exponent| (QREFELT $ 65))
                                           2)
                                      (PROGN
                                       (LETT #6#
                                             (SPADCALL
                                              (SPADCALL '* (QREFELT $ 46))
                                              (LIST |rand| |rand|)
                                              (QREFELT $ 49))
                                             . #7#)
                                       (GO #9#))))))))))
                              (COND
                               ((SPADCALL |exponent| (QREFELT $ 64))
                                (COND
                                 ((< (ABS (SPADCALL |exponent| (QREFELT $ 65)))
                                     32768)
                                  (EXIT
                                   (SPADCALL (QREFELT $ 68)
                                             (LIST (|FCTOOL;fortPre1| |rand| $)
                                                   |exponent|)
                                             (QREFELT $ 49)))))))
                              (EXIT
                               (SPADCALL (QREFELT $ 68)
                                         (LIST (|FCTOOL;fortPre1| |rand| $)
                                               (|FCTOOL;fortPre1| |exponent|
                                                $))
                                         (QREFELT $ 49)))))
                            ((EQUAL |sy| 'ROOT)
                             (COND
                              ((EQL (LENGTH |args|) 1)
                               (|FCTOOL;fortPreRoot|
                                (SPADCALL (SPADCALL '|sqrt| (QREFELT $ 46))
                                          (LIST (|SPADfirst| |args|))
                                          (QREFELT $ 49))
                                $))
                              (#8#
                               (SPADCALL (QREFELT $ 68)
                                         (LIST
                                          (|FCTOOL;fortPreRoot|
                                           (|SPADfirst| |args|) $)
                                          (SPADCALL
                                           (SPADCALL '/ (QREFELT $ 46))
                                           (LIST (SPADCALL 1 (QREFELT $ 66))
                                                 (|FCTOOL;fortPreRoot|
                                                  (SPADCALL |args| 2
                                                            (QREFELT $ 34))
                                                  $))
                                           (QREFELT $ 49)))
                                         (QREFELT $ 49)))))
                            (#8#
                             (SEQ
                              (COND
                               ((OR (EQUAL |sy| 'OVER) (EQUAL |sy| 'SLASH))
                                (SEQ (LETT |sy| '/ . #7#)
                                     (EXIT
                                      (LETT |op| (SPADCALL |sy| (QREFELT $ 46))
                                            . #7#)))))
                              (EXIT
                               (COND
                                ((SPADCALL |sy| (QREFELT $ 67) (QREFELT $ 58))
                                 (|FCTOOL;exp2FortSpecial| |sy| |args|
                                  (LENGTH |args|) $))
                                (#8#
                                 (SEQ
                                  (COND
                                   ((SPADCALL |sy| (LIST '* '+ '-)
                                              (QREFELT $ 58))
                                    (COND
                                     ((SPADCALL (LENGTH |args|) 2
                                                (QREFELT $ 81))
                                      (EXIT
                                       (SEQ
                                        (LETT |binaryExpr|
                                              (|FCTOOL;fortPre1|
                                               (SPADCALL |op|
                                                         (LIST
                                                          (SPADCALL |args| 1
                                                                    (QREFELT $
                                                                             34))
                                                          (SPADCALL |args| 2
                                                                    (QREFELT $
                                                                             34)))
                                                         (QREFELT $ 49))
                                               $)
                                              . #7#)
                                        (SEQ (LETT |e1| NIL . #7#)
                                             (LETT #4# (CDR (CDR |args|))
                                                   . #7#)
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |e1| (CAR #4#) . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |binaryExpr|
                                                     (SPADCALL |op|
                                                               (LIST
                                                                |binaryExpr|
                                                                (|FCTOOL;fortPre1|
                                                                 |e1| $))
                                                               (QREFELT $ 49))
                                                     . #7#)))
                                             (LETT #4# (CDR #4#) . #7#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |binaryExpr|)))))))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |args|) 2)
                                     (SEQ
                                      (LETT |im_op|
                                            (SPADCALL 'CMPLX (QREFELT $ 46))
                                            . #7#)
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 34))
                                            . #7#)
                                      (LETT |arg2|
                                            (SPADCALL |args| 2 (QREFELT $ 34))
                                            . #7#)
                                      (EXIT
                                       (COND
                                        ((|FCTOOL;is_imaginary| |arg2| $)
                                         (COND
                                          ((EQUAL |sy| '*)
                                           (SPADCALL |im_op|
                                                     (LIST
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL 0
                                                                 (QREFELT $
                                                                          66))
                                                       $)
                                                      (|FCTOOL;fortPre1| |arg1|
                                                       $))
                                                     (QREFELT $ 49)))
                                          ((EQUAL |sy| '+)
                                           (SPADCALL |im_op|
                                                     (LIST
                                                      (|FCTOOL;fortPre1| |arg1|
                                                       $)
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL 1
                                                                 (QREFELT $
                                                                          66))
                                                       $))
                                                     (QREFELT $ 49)))
                                          (#8#
                                           (|FCTOOL;mkFortFn| |op| |args| 2
                                            $))))
                                        ((NULL (EQUAL |sy| '+))
                                         (|FCTOOL;mkFortFn| |op| |args| 2 $))
                                        ('T
                                         (COND
                                          ((|FCTOOL;same_subtree2| '* |arg2| $)
                                           (SEQ
                                            (LETT |n_args|
                                                  (SPADCALL |arg2|
                                                            (QREFELT $ 32))
                                                  . #7#)
                                            (EXIT
                                             (COND
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 2
                                                          (QREFELT $ 34))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg1| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 1
                                                                     (QREFELT $
                                                                              34))
                                                           $))
                                                         (QREFELT $ 49)))
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 1
                                                          (QREFELT $ 34))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg1| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 2
                                                                     (QREFELT $
                                                                              34))
                                                           $))
                                                         (QREFELT $ 49)))
                                              (#8#
                                               (|FCTOOL;mkFortFn| |op| |args| 2
                                                $))))))
                                          ((|FCTOOL;same_subtree2| '* |arg1| $)
                                           (SEQ
                                            (LETT |n_args|
                                                  (SPADCALL |arg1|
                                                            (QREFELT $ 32))
                                                  . #7#)
                                            (EXIT
                                             (COND
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 2
                                                          (QREFELT $ 34))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg2| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 1
                                                                     (QREFELT $
                                                                              34))
                                                           $))
                                                         (QREFELT $ 49)))
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 1
                                                          (QREFELT $ 34))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg2| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 2
                                                                     (QREFELT $
                                                                              34))
                                                           $))
                                                         (QREFELT $ 49)))
                                              (#8#
                                               (|FCTOOL;mkFortFn| |op| |args| 2
                                                $))))))
                                          (#8#
                                           (|FCTOOL;mkFortFn| |op| |args| 2
                                            $))))))))
                                    (#8#
                                     (|FCTOOL;mkFortFn| |op| |args|
                                      (LENGTH |args|) $))))))))))))))
                    (#8#
                     (|FCTOOL;mkFortFn| |op| |args| (LENGTH |args|) $))))))))
          #9# (EXIT #6#)))) 

(SDEFUN |FCTOOL;fortPre|
        ((|l| |List| (|OutputForm|)) ($ |List| (|OutputForm|)))
        (SPROG
         ((|res| (|List| (|OutputForm|))) (|new| (|OutputForm|))
          (#1=#:G1118 NIL) (|e| NIL))
         (SEQ (SETELT $ 51 NIL)
              (SEQ (LETT |e| NIL . #2=(|FCTOOL;fortPre|)) (LETT #1# |l| . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |new| (|FCTOOL;fortPre1| |e| $) . #2#)
                        (EXIT (|FCTOOL;push_expr_stack| |new| $)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (NREVERSE (QREFELT $ 51)) . #2#) (SETELT $ 51 NIL)
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;get_fort_indent;I;38| (($ |Integer|)) (QREFELT $ 82)) 

(SDEFUN |FCTOOL;indentFortLevel;IV;39| ((|i| |Integer|) ($ |Void|))
        (SEQ
         (SETF |$maximumFortranExpressionLength|
                 (- |$maximumFortranExpressionLength|
                    (SPADCALL 2 |i| (QREFELT $ 85))))
         (EXIT
          (SETELT $ 82 (+ (QREFELT $ 82) (SPADCALL 2 |i| (QREFELT $ 85))))))) 

(SDEFUN |FCTOOL;make_spaces| ((|x| |Integer|) ($ |String|))
        (SPROG ((#1=#:G1123 NIL))
               (|make_full_CVEC|
                (PROG1 (LETT #1# |x| |FCTOOL;make_spaces|)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                (STR_ELT "   " 0)))) 

(SDEFUN |FCTOOL;fortran2Lines1|
        ((|f| |List| (|String|)) (|res| |List| (|String|))
         ($ |List| (|String|)))
        (SPROG
         ((|line| #1=(|String|)) (|ll| (|Integer|)) (|ff| (|String|))
          (|spaceLeft| (|Integer|)) (#2=#:G1135 NIL) (|sff| (|Integer|))
          (|contPref| (|String|)) (|normPref| #1#))
         (SEQ
          (LETT |normPref| (|FCTOOL;make_spaces| (QREFELT $ 82) $)
                . #3=(|FCTOOL;fortran2Lines1|))
          (LETT |contPref|
                (STRCONC "     &"
                         (|FCTOOL;make_spaces| (- (QREFELT $ 82) 6) $))
                . #3#)
          (LETT |ll| (QREFELT $ 82) . #3#)
          (SEQ G190 (COND ((NULL (NULL (NULL |f|))) (GO G191)))
               (SEQ (LETT |line| |normPref| . #3#)
                    (LETT |ff| (|SPADfirst| |f|) . #3#)
                    (SEQ
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (+ |ll| (LETT |sff| (QCSIZE |ff|) . #3#))
                                |$fortLength| (QREFELT $ 39))
                               (SEQ (LETT |ll| (+ |ll| |sff|) . #3#)
                                    (LETT |line| (STRCONC |line| |ff|) . #3#)
                                    (LETT |f| (CDR |f|) . #3#)
                                    (EXIT
                                     (COND
                                      ((NULL |f|)
                                       (PROGN
                                        (LETT #2# |$NoValue| . #3#)
                                        (GO #4=#:G1130)))
                                      ('T
                                       (LETT |ff| (|SPADfirst| |f|) . #3#))))))
                              ('T
                               (SEQ
                                (LETT |spaceLeft| (- |$fortLength| |ll|) . #3#)
                                (EXIT
                                 (COND
                                  ((< |spaceLeft| 0)
                                   (|error| "too deep indentation"))
                                  ('T
                                   (SEQ
                                    (LETT |line|
                                          (STRCONC |line|
                                                   (SPADCALL |ff|
                                                             (SPADCALL 1
                                                                       |spaceLeft|
                                                                       (QREFELT
                                                                        $ 87))
                                                             (QREFELT $ 80)))
                                          . #3#)
                                    (LETT |ff|
                                          (SPADCALL |ff|
                                                    (SPADCALL (+ |spaceLeft| 1)
                                                              (QREFELT $ 79))
                                                    (QREFELT $ 80))
                                          . #3#)
                                    (LETT |res| (CONS |line| |res|) . #3#)
                                    (LETT |ll| (QREFELT $ 82) . #3#)
                                    (EXIT
                                     (LETT |line| |contPref| . #3#)))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #4# (EXIT #2#))
                    (EXIT
                     (COND
                      ((SPADCALL |ll| (QREFELT $ 82) (QREFELT $ 36))
                       (LETT |res| (CONS |line| |res|) . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FCTOOL;fort_clean_lines;2L;42|
        ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|nl| (|List| (|String|))) (|res| (|List| (|String|)))
          (|el| (|String|)))
         (SEQ (LETT |nl| NIL . #1=(|FCTOOL;fort_clean_lines;2L;42|))
              (LETT |res| NIL . #1#)
              (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |l|) NIL)
                                  ('T
                                   (SPADCALL
                                    (LETT |el| (|SPADfirst| |l|) . #1#) "%l"
                                    (QREFELT $ 88)))))
                           (GO G191)))
                         (SEQ (LETT |nl| (CONS |el| |nl|) . #1#)
                              (EXIT (LETT |l| (CDR |l|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND ((NULL (NULL |l|)) (LETT |l| (CDR |l|) . #1#)))
                    (LETT |res|
                          (|FCTOOL;fortran2Lines1| (NREVERSE |nl|) |res| $)
                          . #1#)
                    (EXIT (LETT |nl| NIL . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(PUT '|FCTOOL;do_with_error_env3;MV;43| '|SPADreplace| '|do_with_error_env3|) 

(SDEFUN |FCTOOL;do_with_error_env3;MV;43| ((|f| |Mapping| (|Void|)) ($ |Void|))
        (|do_with_error_env3| |f|)) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;44|
        ((|int_to_floats?| |Boolean|) (|f| |Mapping| (|List| (|String|)))
         ($ |List| (|String|)))
        (SPROG NIL
               (|do_with_error_env2| |int_to_floats?|
                                     (CONS
                                      #'|FCTOOL;do_with_error_env2;BML;44!0|
                                      (VECTOR $ |f|))))) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;44!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|FCTOOL;do_with_error_env2;BML;44|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |f|) (QREFELT $ 89)))))) 

(PUT '|FCTOOL;do_with_error_env0;ML;45| '|SPADreplace| '|do_with_error_env0|) 

(SDEFUN |FCTOOL;do_with_error_env0;ML;45|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (|do_with_error_env0| |f|)) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;46|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FCTOOL;do_with_error_env1;ML;46!0| (VECTOR $ |f|))
                (QREFELT $ 94)))) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;46!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|FCTOOL;do_with_error_env1;ML;46|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |f|) (QREFELT $ 89)))))) 

(SDEFUN |FCTOOL;do_expression_to_fortran|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPROG ((|ol| (|List| (|OutputForm|))))
               (SEQ
                (LETT |ol| (|exp2FortOptimize| (SPADCALL |of| (QREFELT $ 96)))
                      |FCTOOL;do_expression_to_fortran|)
                (EXIT
                 (|FCTOOL;fortranCleanUp|
                  (|FCTOOL;exp2Fort1|
                   (|FCTOOL;segment| (|FCTOOL;fortPre| |ol| $) $) $)
                  $))))) 

(SDEFUN |FCTOOL;expression2Fortran1;MOfBL;48|
        ((|nf| |Mapping| (|Symbol|)) (|of| |OutputForm|)
         (|int_to_floats?| |Boolean|) ($ |List| (|String|)))
        (SPROG NIL
               (|do_with_error_env4| |nf| |int_to_floats?|
                                     (CONS
                                      #'|FCTOOL;expression2Fortran1;MOfBL;48!0|
                                      (VECTOR $ |of|))))) 

(SDEFUN |FCTOOL;expression2Fortran1;MOfBL;48!0| (($$ NIL))
        (PROG (|of| $)
          (LETT |of| (QREFELT $$ 1)
                . #1=(|FCTOOL;expression2Fortran1;MOfBL;48|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FCTOOL;do_expression_to_fortran| |of| $))))) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;49|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL (LIST #'|FCTOOL;statement2Fortran;OfL;49!0|) |of| NIL
                  (QREFELT $ 98))) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;49!0| (($$ NIL)) 'DUMMY) 

(SDEFUN |FCTOOL;expression2Fortran;OfL;50|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL (ELT $ 15) |of| NIL (QREFELT $ 98))) 

(PUT '|FCTOOL;changeExprLength;IV;51| '|SPADreplace| '|changeExprLength|) 

(SDEFUN |FCTOOL;changeExprLength;IV;51| ((|i| |Integer|) ($ |Void|))
        (|changeExprLength| |i|)) 

(SDEFUN |FCTOOL;getStatement;OfBL;52|
        ((|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FCTOOL;getStatement;OfBL;52!0|
                               (VECTOR $ |of|))
                         (QREFELT $ 93)))) 

(SDEFUN |FCTOOL;getStatement;OfBL;52!0| (($$ NIL))
        (PROG (|of| $)
          (LETT |of| (QREFELT $$ 1) . #1=(|FCTOOL;getStatement;OfBL;52|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |of| (QREFELT $ 99)))))) 

(PUT '|FCTOOL;displayLines;LV;53| '|SPADreplace| '|displayLines|) 

(SDEFUN |FCTOOL;displayLines;LV;53| ((|l| |List| (|String|)) ($ |Void|))
        (|displayLines| |l|)) 

(PUT '|FCTOOL;displayLines1;LV;54| '|SPADreplace| '|displayLines1|) 

(SDEFUN |FCTOOL;displayLines1;LV;54| ((|l| |List| (|String|)) ($ |Void|))
        (|displayLines1| |l|)) 

(SDEFUN |FCTOOL;dispStatement;OfV;55| ((|of| |OutputForm|) ($ |Void|))
        (SPROG ((|l| (|List| (|String|))))
               (SEQ
                (LETT |l| (SPADCALL |of| NIL (QREFELT $ 102))
                      |FCTOOL;dispStatement;OfV;55|)
                (EXIT (SPADCALL |l| (QREFELT $ 104)))))) 

(SDEFUN |FCTOOL;fortFormatHead1|
        ((|name| |Symbol|) (|asp| |List| (|String|)) (|args| |List| (|Symbol|))
         ($ |List| (|String|)))
        (SPROG
         ((|of| (|OutputForm|)) (#1=#:G1172 NIL) (|arg| NIL) (#2=#:G1171 NIL))
         (SEQ
          (LETT |of|
                (SPADCALL (SPADCALL |name| (QREFELT $ 76))
                          (PROGN
                           (LETT #2# NIL . #3=(|FCTOOL;fortFormatHead1|))
                           (SEQ (LETT |arg| NIL . #3#) (LETT #1# |args| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |arg| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |arg| (QREFELT $ 76))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 49))
                . #3#)
          (EXIT
           (SPADCALL |asp| (SPADCALL |of| (QREFELT $ 99)) (QREFELT $ 24)))))) 

(SDEFUN |FCTOOL;fortFormatHead;SULV;57|
        ((|name| |Symbol|)
         (|returnType| |Union| (|:| |fst| (|FortranScalarType|))
          (|:| |void| "void"))
         (|args| |List| (|Symbol|)) ($ |Void|))
        (SPROG
         ((|lines| (|List| (|String|))) (|l| (|Integer|))
          (|asp| (|List| (|String|))) (|s| (|String|)) (#1=#:G1173 NIL))
         (SEQ
          (COND
           ((QEQCAR |returnType| 1)
            (SEQ
             (LETT |asp| (LIST "SUBROUTINE ")
                   . #2=(|FCTOOL;fortFormatHead;SULV;57|))
             (EXIT (SPADCALL (LETT |l| -11 . #2#) (QREFELT $ 101)))))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL
                    (SPADCALL
                     (PROG2 (LETT #1# |returnType| . #2#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|FortranScalarType|)
                                       (|Union|
                                        (|:| |fst| (|FortranScalarType|))
                                        (|:| |void| "void"))
                                       #1#))
                     (QREFELT $ 106))
                    (QREFELT $ 16))
                   . #2#)
             (LETT |asp| (LIST |s| " FUNCTION ") . #2#)
             (EXIT
              (SPADCALL (LETT |l| (- -10 (QCSIZE |s|)) . #2#)
                        (QREFELT $ 101))))))
          (LETT |lines|
                (SPADCALL
                 (CONS #'|FCTOOL;fortFormatHead;SULV;57!0|
                       (VECTOR $ |args| |asp| |name|))
                 (QREFELT $ 95))
                . #2#)
          (SPADCALL |lines| (QREFELT $ 104))
          (EXIT (SPADCALL (- |l|) (QREFELT $ 101)))))) 

(SDEFUN |FCTOOL;fortFormatHead;SULV;57!0| (($$ NIL))
        (PROG (|name| |asp| |args| $)
          (LETT |name| (QREFELT $$ 3) . #1=(|FCTOOL;fortFormatHead;SULV;57|))
          (LETT |asp| (QREFELT $$ 2) . #1#)
          (LETT |args| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FCTOOL;fortFormatHead1| |name| |asp| |args| $))))) 

(SDEFUN |FCTOOL;addCommas| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G1186 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) |l|)
                      ('T
                       (SEQ
                        (LETT |r| (LIST (|SPADfirst| |l|))
                              . #2=(|FCTOOL;addCommas|))
                        (SEQ (LETT |e| NIL . #2#) (LETT #1# (CDR |l|) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r| (CONS |e| (CONS "," |r|)) . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (NREVERSE |r|)))))))) 

(SDEFUN |FCTOOL;nameLen| ((|n| |List| (|String|)) ($ |Integer|))
        (SPROG
         ((#1=#:G1188 NIL) (#2=#:G1187 #3=(|Integer|)) (#4=#:G1189 #3#)
          (#5=#:G1191 NIL) (|u| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|FCTOOL;nameLen|))
           (SEQ (LETT |u| NIL . #6#) (LETT #5# |n| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (+ 1 (QCSIZE |u|)) . #6#)
                   (COND (#1# (LETT #2# (+ #2# #4#) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 0)))))) 

(SDEFUN |FCTOOL;fortFormatTypeLines;SLV;60|
        ((|typeName| |String|) (|l| |List| (|String|)) ($ |Void|))
        (SPROG ((|l1| (|List| (|String|))))
               (SEQ
                (LETT |l1|
                      (CONS |typeName| (CONS " " (|FCTOOL;addCommas| |l| $)))
                      |FCTOOL;fortFormatTypeLines;SLV;60|)
                (EXIT
                 (SPADCALL (SPADCALL |l1| (QREFELT $ 89)) (QREFELT $ 103)))))) 

(SDEFUN |FCTOOL;fortFormatTypes1|
        ((|typeName| |String|) (|names| |List| (|String|)) ($ |Void|))
        (SPROG ((|n| (|List| (|String|))) (|ln| (|Integer|)) (|l| (|Integer|)))
               (SEQ
                (LETT |l|
                      (- (- |$maximumFortranExpressionLength| 1)
                         (QCSIZE |typeName|))
                      . #1=(|FCTOOL;fortFormatTypes1|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (|FCTOOL;nameLen| |names| $) |l|
                                  (QREFELT $ 36)))
                       (GO G191)))
                     (SEQ (LETT |n| NIL . #1#) (LETT |ln| 0 . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (<
                                   (LETT |ln|
                                         (+
                                          (+ |ln|
                                             (QCSIZE (|SPADfirst| |names|)))
                                          1)
                                         . #1#)
                                   |l|))
                                 (GO G191)))
                               (SEQ
                                (LETT |n| (CONS (|SPADfirst| |names|) |n|)
                                      . #1#)
                                (EXIT (LETT |names| (CDR |names|) . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |typeName| |n| (QREFELT $ 109))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |typeName| |names| (QREFELT $ 109)))))) 

(SDEFUN |FCTOOL;par2string2| ((|u| |List| (|OutputForm|)) ($ |String|))
        (SPROG
         ((|l| (|List| (|String|))) (|ll| (|List| (|List| (|String|))))
          (#1=#:G1204 NIL) (|v| NIL) (#2=#:G1203 NIL))
         (SEQ
          (LETT |ll|
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;par2string2|))
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# (CDR |u|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS "," (SPADCALL |v| (QREFELT $ 99)))
                                    #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |l|
                (SPADCALL (CDR (SPADCALL |ll| (QREFELT $ 110))) ")"
                          (QREFELT $ 111))
                . #3#)
          (EXIT
           (SPADCALL
            (SPADCALL (LIST (STRINGIMAGE (|SPADfirst| |u|)) "(") |l|
                      (QREFELT $ 24))
            (QREFELT $ 62)))))) 

(SDEFUN |FCTOOL;unravel_par| ((|u| |OutputForm|) ($ |OutputForm|))
        (SEQ
         (COND ((SPADCALL |u| (QREFELT $ 29)) |u|)
               ('T
                (SEQ
                 (LETT |u| (|SPADfirst| (SPADCALL |u| (QREFELT $ 32)))
                       |FCTOOL;unravel_par|)
                 (EXIT (CDR |u|))))))) 

(SDEFUN |FCTOOL;par2string| ((|u| |OutputForm|) ($ |String|))
        (COND ((SPADCALL |u| (QREFELT $ 29)) (STRINGIMAGE |u|))
              ('T (|FCTOOL;par2string2| (|FCTOOL;unravel_par| |u| $) $)))) 

(SDEFUN |FCTOOL;mkParameterList|
        ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G1213 NIL) (|u| NIL) (#2=#:G1212 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;mkParameterList|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FCTOOL;par2string| |u| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;mkParameterList2|
        ((|l| |List| (|List| (|OutputForm|))) ($ |List| (|String|)))
        (SPROG ((#1=#:G1217 NIL) (|u| NIL) (#2=#:G1216 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;mkParameterList2|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FCTOOL;par2string2| |u| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;mkCharName| ((|v| |Integer|) ($ |String|))
        (STRCONC "CHARACTER*(" (STRCONC (STRINGIMAGE |v|) ")"))) 

(SDEFUN |FCTOOL;insertEntry|
        ((|m| |Integer|) (|n| |OutputForm|)
         (|Tabl| |AssociationList| (|Integer|) (|List| (|OutputForm|)))
         ($ |Void|))
        (SPROG ((|u| (|Union| (|List| (|OutputForm|)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 114))
                      |FCTOOL;insertEntry|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (SPADCALL |Tabl| |m| (LIST |n|) (QREFELT $ 115)))
                  ('T
                   (SPADCALL |Tabl| |m| (CONS |n| (QCDR |u|))
                             (QREFELT $ 115)))))))) 

(SDEFUN |FCTOOL;fortFormatCharacterTypes|
        ((|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((#1=#:G1233 NIL) (|u2| NIL)
          (|genuineArrays| (|List| (|List| (|OutputForm|))))
          (|u1| (|List| (|OutputForm|))) (#2=#:G1232 NIL) (|u| NIL)
          (|sortedByLength|
           (|AssociationList| (|Integer|) (|List| (|OutputForm|)))))
         (SEQ
          (LETT |sortedByLength| (SPADCALL (QREFELT $ 116))
                . #3=(|FCTOOL;fortFormatCharacterTypes|))
          (LETT |genuineArrays| NIL . #3#)
          (SEQ (LETT |u| NIL . #3#) (LETT #2# |names| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |u| (QREFELT $ 29))
                   (|FCTOOL;insertEntry| 0 |u| |sortedByLength| $))
                  ('T
                   (SEQ (LETT |u1| |u| . #3#)
                        (EXIT
                         (COND
                          ((EQL (LENGTH |u1|) 2)
                           (|FCTOOL;insertEntry| (SPADCALL |u1| (QREFELT $ 42))
                            (|SPADfirst| |u1|) |sortedByLength| $))
                          ('T
                           (LETT |genuineArrays| (CONS |u1| |genuineArrays|)
                                 . #3#)))))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |u2| NIL . #3#)
               (LETT #1# (SPADCALL |sortedByLength| (QREFELT $ 119)) . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u2| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (|FCTOOL;fortFormatTypes1| (|FCTOOL;mkCharName| (QCAR |u2|) $)
                  (|FCTOOL;mkParameterList| (QCDR |u2|) $) $)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL (NULL |genuineArrays|))
             (|FCTOOL;fortFormatTypes1| "CHARACTER"
              (|FCTOOL;mkParameterList2| |genuineArrays| $) $))))))) 

(SDEFUN |FCTOOL;fort_format_types1|
        ((|typeName| |String|) (|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG ((#1=#:G1237 NIL) (|u| NIL) (#2=#:G1236 NIL))
               (SEQ
                (COND
                 ((EQUAL |typeName| "CHARACTER")
                  (|FCTOOL;fortFormatCharacterTypes|
                   (PROGN
                    (LETT #2# NIL . #3=(|FCTOOL;fort_format_types1|))
                    (SEQ (LETT |u| NIL . #3#) (LETT #1# |names| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|FCTOOL;unravel_par| |u| $) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   $))
                 ('T
                  (|FCTOOL;fortFormatTypes1| |typeName|
                   (|FCTOOL;mkParameterList| |names| $) $)))))) 

(SDEFUN |FCTOOL;fort_format_types;SLV;71|
        ((|typeName| |String|) (|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG NIL
               (COND ((NULL |names|) (SPADCALL (QREFELT $ 120)))
                     ('T
                      (SPADCALL
                       (CONS #'|FCTOOL;fort_format_types;SLV;71!0|
                             (VECTOR |names| $ |typeName|))
                       (QREFELT $ 91)))))) 

(SDEFUN |FCTOOL;fort_format_types;SLV;71!0| (($$ NIL))
        (PROG (|typeName| $ |names|)
          (LETT |typeName| (QREFELT $$ 2)
                . #1=(|FCTOOL;fort_format_types;SLV;71|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |names| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|FCTOOL;fort_format_types1| (SPADCALL |typeName| (QREFELT $ 16))
             |names| $))))) 

(DECLAIM (NOTINLINE |FortranCodeTools;|)) 

(DEFUN |FortranCodeTools| ()
  (SPROG NIL
         (PROG (#1=#:G1242)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCodeTools|)
                    . #2=(|FortranCodeTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCodeTools|
                             (LIST (CONS NIL (CONS 1 (|FortranCodeTools;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranCodeTools|)))))))))) 

(DEFUN |FortranCodeTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCodeTools|) . #1=(|FortranCodeTools|))
          (LETT $ (GETREFV 122) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCodeTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 17 (LIST #2="-" "~"))
          (QSETREFV $ 18 '(700 50))
          (QSETREFV $ 19
                    (LIST "|" "**" "/" ".LT." ".GT." ".EQ." ".LE." ".GE."
                          ".AND." ".OR."))
          (QSETREFV $ 20 (LIST 0 900 800 400 400 400 400 400 800 70 90))
          (QSETREFV $ 21 (LIST #2# "+" "*" "," " " "ROW" ""))
          (QSETREFV $ 22 (LIST 700 700 800 110 0 0 0))
          (QSETREFV $ 25
                    (SPADCALL (QREFELT $ 19) (QREFELT $ 21) (QREFELT $ 24)))
          (QSETREFV $ 47 (SPADCALL '= (QREFELT $ 46)))
          (QSETREFV $ 51 NIL)
          (QSETREFV $ 52 NIL)
          (QSETREFV $ 59
                    (LIST (VECTOR '|abs| 'ABS 'DABS)
                          (VECTOR '|acos| 'ACOS 'DACOS)
                          (VECTOR '|asin| 'ASIN 'DASIN)
                          (VECTOR '|atan| 'ATAN 'DATAN)
                          (VECTOR '|cos| 'COS 'DCOS)
                          (VECTOR '|cosh| 'COSH 'DCOSH)
                          (VECTOR '|cot| 'COTAN 'DCOTAN)
                          (VECTOR '|erf| 'ERF 'DERF) (VECTOR '|exp| 'EXP 'DEXP)
                          (VECTOR '|log| 'LOG 'DLOG)
                          (VECTOR '|log10| 'LOG10 'DLOG10)
                          (VECTOR '|sin| 'SIN 'DSIN)
                          (VECTOR '|sinh| 'SINH 'DSINH)
                          (VECTOR '|sqrt| 'SQRT 'DSQRT)
                          (VECTOR '|tan| 'TAN 'DTAN)
                          (VECTOR '|tanh| 'TANH 'DTANH)))
          (QSETREFV $ 60
                    (LIST (CONS '< '.LT.) (CONS '> '.GT.) (CONS '<= '.LE.)
                          (CONS '>= '.GE.) (CONS 'EQ '.EQ.)
                          (CONS '|and| '.AND.) (CONS '|or| '.OR.)
                          (CONS '~ '.NOT.)))
          (QSETREFV $ 67
                    '(BRACKET BRACE SUB AGGLST SUPERSUB MATRIX SEGMENT
                      ALTSUPERSUB PAREN CONCAT CONCATB QUOTE STRING SIGMA STEP
                      IN SIGMA2 INTSIGN PI PI2))
          (QSETREFV $ 68 (SPADCALL '** (QREFELT $ 46)))
          (QSETREFV $ 82 6)
          $))) 

(MAKEPROP '|FortranCodeTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|Symbol|) (0 . |coerce|)
              (|FortranScalarType|) (5 . |coerce|) (|FortranType|)
              (10 . |coerce|) (|TheSymbolTable|) (15 . |declare!|)
              |FCTOOL;newFortranTempVar;S;1| |FCTOOL;checkType;2S;2|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| (|List| 6) (21 . |append|) '|nonUnaryOps|
              (|Boolean|) (|OutputForm|) (|OutputFormTools|) (27 . |atom?|)
              (32 . |operator|) (|List| 27) (37 . |arguments|) (|Integer|)
              (42 . |elt|) (48 . |position|) (54 . >) (|List| 33) (60 . |elt|)
              (66 . <=) (|NonNegativeInteger|) (72 . ~=) (78 . |second|)
              (83 . |member?|) (89 . |symbol?|) (94 . |symbol|)
              (99 . |outputForm|) '|ass_form| (|List| $) (104 . |elt|)
              (110 . |append|) '|exprStack| '|used_intrinsics| (|Void|)
              |FCTOOL;clear_used_intrinsics;V;23| (116 . |string|)
              |FCTOOL;get_used_intrinsics;L;24| (|List| 7) (121 . |member?|)
              '|fort_intrinsics| '|fort_ops| (127 . |string|) (132 . |concat|)
              (137 . |message|) (142 . |integer?|) (147 . |integer|)
              (152 . |outputForm|) '|specialOps| '|pow_form| (|Character|)
              (157 . |elt|) (163 . |char|) (168 . |remove|) (174 . |position|)
              (180 . ~=) (186 . |setelt!|) (193 . |coerce|) (198 . |string?|)
              (|UniversalSegment| 33) (203 . SEGMENT) (208 . |elt|) (214 . >)
              '|fort_indent| |FCTOOL;get_fort_indent;I;38| (|PositiveInteger|)
              (220 . *) |FCTOOL;indentFortLevel;IV;39| (226 . SEGMENT)
              (232 . ~=) |FCTOOL;fort_clean_lines;2L;42| (|Mapping| 53)
              |FCTOOL;do_with_error_env3;MV;43| (|Mapping| 23)
              |FCTOOL;do_with_error_env2;BML;44|
              |FCTOOL;do_with_error_env0;ML;45|
              |FCTOOL;do_with_error_env1;ML;46| (238 . |precondition|)
              (|Mapping| 7) |FCTOOL;expression2Fortran1;MOfBL;48|
              |FCTOOL;statement2Fortran;OfL;49|
              |FCTOOL;expression2Fortran;OfL;50|
              |FCTOOL;changeExprLength;IV;51| |FCTOOL;getStatement;OfBL;52|
              |FCTOOL;displayLines;LV;53| |FCTOOL;displayLines1;LV;54|
              |FCTOOL;dispStatement;OfV;55| (243 . |coerce|)
              (|Union| (|:| |fst| 9) (|:| |void| '"void"))
              |FCTOOL;fortFormatHead;SULV;57|
              |FCTOOL;fortFormatTypeLines;SLV;60| (248 . |concat|)
              (253 . |concat|) (|Union| 31 '"failed") (|AssociationList| 33 31)
              (259 . |search|) (265 . |setelt!|) (272 . |empty|)
              (|Record| (|:| |key| 33) (|:| |entry| 31)) (|List| 117)
              (276 . |entries|) (281 . |void|)
              |FCTOOL;fort_format_types;SLV;71|)
           '#(|statement2Fortran| 285 |newFortranTempVar| 290 |indentFortLevel|
              294 |get_used_intrinsics| 299 |get_fort_indent| 303
              |getStatement| 307 |fort_format_types| 313 |fort_clean_lines| 319
              |fortFormatTypeLines| 324 |fortFormatHead| 330
              |expression2Fortran1| 337 |expression2Fortran| 344
              |do_with_error_env3| 349 |do_with_error_env2| 354
              |do_with_error_env1| 360 |do_with_error_env0| 365 |displayLines1|
              370 |displayLines| 375 |dispStatement| 380
              |clear_used_intrinsics| 385 |checkType| 389 |changeExprLength|
              394)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 121
                                                 '(1 7 0 6 8 1 9 0 7 10 1 11 0
                                                   9 12 2 13 11 7 11 14 2 23 0
                                                   0 0 24 1 28 26 27 29 1 28 27
                                                   27 30 1 28 31 27 32 2 31 27
                                                   0 33 34 2 23 33 6 0 35 2 33
                                                   26 0 0 36 2 37 33 0 33 38 2
                                                   33 26 0 0 39 2 40 26 0 0 41
                                                   1 31 27 0 42 2 23 26 6 0 43
                                                   1 28 26 27 44 1 28 7 27 45 1
                                                   27 0 7 46 2 27 0 0 48 49 2
                                                   31 0 0 0 50 1 7 6 0 55 2 57
                                                   26 7 0 58 1 28 6 27 61 1 6 0
                                                   48 62 1 27 0 6 63 1 28 26 27
                                                   64 1 28 33 27 65 1 27 0 33
                                                   66 2 6 69 0 33 70 1 69 0 6
                                                   71 2 6 0 69 0 72 2 6 33 69 0
                                                   73 2 7 26 0 0 74 3 6 69 0 33
                                                   69 75 1 7 27 0 76 1 28 26 27
                                                   77 1 78 0 33 79 2 6 0 0 78
                                                   80 2 40 26 0 0 81 2 33 0 84
                                                   0 85 2 78 0 33 33 87 2 6 26
                                                   0 0 88 1 28 27 27 96 1 9 6 0
                                                   106 1 23 0 48 110 2 23 0 0 6
                                                   111 2 113 112 33 0 114 3 113
                                                   31 0 33 31 115 0 113 0 116 1
                                                   113 118 0 119 0 53 0 120 1 0
                                                   23 27 99 0 0 7 15 1 0 53 33
                                                   86 0 0 23 56 0 0 33 83 2 0
                                                   23 27 26 102 2 0 53 6 31 121
                                                   1 0 23 23 89 2 0 53 6 23 109
                                                   3 0 53 7 107 57 108 3 0 23
                                                   97 27 26 98 1 0 23 27 100 1
                                                   0 53 90 91 2 0 23 26 92 93 1
                                                   0 23 92 95 1 0 23 92 94 1 0
                                                   53 23 104 1 0 53 23 103 1 0
                                                   53 27 105 0 0 53 54 1 0 6 6
                                                   16 1 0 53 33 101)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCodeTools| 'NILADIC T) 
