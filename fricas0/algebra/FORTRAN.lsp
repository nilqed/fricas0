
(SDEFUN |FORTRAN;makeRep| ((|b| |List| (|FortranCode|)) ($ $))
        (CONS (SPADCALL (QREFELT $ 12)) |b|)) 

(PUT '|FORTRAN;codeFrom| '|SPADreplace| 'QCDR) 

(SDEFUN |FORTRAN;codeFrom| ((|u| $) ($ |List| (|FortranCode|))) (QCDR |u|)) 

(SDEFUN |FORTRAN;outputAsFortran;$V;3| ((|p| $) ($ |Void|))
        (SPROG
         ((#1=#:G738 NIL) (|expr| NIL) (|intrinsics| (|List| (|String|)))
          (|body| (|List| (|List| (|String|)))) (#2=#:G737 NIL) (|l| NIL)
          (#3=#:G736 NIL) (|tempName| (|Symbol|)))
         (SEQ (SPADCALL (SPADCALL 25000 (QREFELT $ 15)) (QREFELT $ 17))
              (LETT |tempName| 'FPTEMP . #4=(|FORTRAN;outputAsFortran;$V;3|))
              (SPADCALL |tempName| (QREFELT $ 21)) (SPADCALL (QREFELT $ 23))
              (LETT |body|
                    (PROGN
                     (LETT #3# NIL . #4#)
                     (SEQ (LETT |l| NIL . #4#)
                          (LETT #2# (|FORTRAN;codeFrom| |p| $) . #4#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |l| (CAR #2#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3# (CONS (SPADCALL |l| (QREFELT $ 25)) #3#)
                                  . #4#)))
                          (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #4#)
              (LETT |intrinsics| (SPADCALL (QREFELT $ 26)) . #4#)
              (SPADCALL (QREFELT $ 27))
              (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 8)
                        (QREFELT $ 30))
              (SPADCALL (QREFELT $ 9) (QREFELT $ 31))
              (SPADCALL (QCAR |p|) (QREFELT $ 31))
              (SPADCALL |tempName| (QREFELT $ 32))
              (COND
               ((NULL (NULL |intrinsics|))
                (SPADCALL "INTRINSIC" |intrinsics| (QREFELT $ 34))))
              (SPADCALL |tempName| (QREFELT $ 35))
              (SEQ (LETT |expr| NIL . #4#) (LETT #1# |body| . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |expr| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |expr| (QREFELT $ 36))))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (SPADCALL 'END (QREFELT $ 38)) (QREFELT $ 39)))))) 

(SDEFUN |FORTRAN;mkString| ((|l| |List| (|Symbol|)) ($ |String|))
        (SPADCALL (SPADCALL |l| (QREFELT $ 42)) (QREFELT $ 43))) 

(SDEFUN |FORTRAN;checkVariables|
        ((|user| |List| (|Symbol|)) (|target| |List| (|Symbol|)) ($ |Void|))
        (SPROG ((|s2| #1=(|String|)) (|s1| #1#))
               (SEQ
                (COND
                 ((SPADCALL
                   (SPADCALL (SPADCALL (ELT $ 44) |user| (QREFELT $ 46))
                             |target| (QREFELT $ 47))
                   NIL (QREFELT $ 49))
                  (SEQ
                   (LETT |s1| (|FORTRAN;mkString| |user| $)
                         . #2=(|FORTRAN;checkVariables|))
                   (LETT |s2| (|FORTRAN;mkString| |target| $) . #2#)
                   (EXIT
                    (|error|
                     (LIST '|mathprint|
                           (LIST 'CONCAT "Incompatible variable lists:"
                                 (SPADCALL |s1| (QREFELT $ 50))
                                 (SPADCALL |s2| (QREFELT $ 50))))))))
                 ('T (SPADCALL (QREFELT $ 51))))))) 

(SDEFUN |FORTRAN;coerce;E$;6| ((|u| |Expression| (|MachineInteger|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 53))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 54))
                            (SPADCALL (QREFELT $ 55)))
                      |FORTRAN;coerce;E$;6|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;7|
        ((|u| |Equation| (|Expression| (|MachineInteger|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|MachineInteger|)))))
          (#1=#:G765 NIL) (|w| NIL) (#2=#:G766 NIL) (|v| NIL) (#3=#:G764 NIL)
          (|aeList| (|List| (|Expression| (|MachineInteger|)))) (#4=#:G763 NIL)
          (#5=#:G762 NIL) (|veList| (|List| (|Expression| (|MachineInteger|))))
          (#6=#:G761 NIL) (#7=#:G760 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 58)) (QREFELT $ 60)) 1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 58)) (QREFELT $ 53))
                   . #9=(|FORTRAN;coerce;E$;7|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 62))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 63)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 63)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 64))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 65)) |eList|
                             (QREFELT $ 67))
                   (QREFELT $ 56))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;8| ((|u| |Expression| (|MachineFloat|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 70))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 71))
                            (SPADCALL (QREFELT $ 55)))
                      |FORTRAN;coerce;E$;8|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;9|
        ((|u| |Equation| (|Expression| (|MachineFloat|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|MachineFloat|)))))
          (#1=#:G786 NIL) (|w| NIL) (#2=#:G787 NIL) (|v| NIL) (#3=#:G785 NIL)
          (|aeList| (|List| (|Expression| (|MachineFloat|)))) (#4=#:G784 NIL)
          (#5=#:G783 NIL) (|veList| (|List| (|Expression| (|MachineFloat|))))
          (#6=#:G782 NIL) (#7=#:G781 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 74)) (QREFELT $ 75)) 1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 74)) (QREFELT $ 70))
                   . #9=(|FORTRAN;coerce;E$;9|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 62))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 76)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 76)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 77))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 78)) |eList|
                             (QREFELT $ 79))
                   (QREFELT $ 72))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;10| ((|u| |Expression| (|MachineComplex|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 82))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 83))
                            (SPADCALL (QREFELT $ 55)))
                      |FORTRAN;coerce;E$;10|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;11|
        ((|u| |Equation| (|Expression| (|MachineComplex|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|MachineComplex|)))))
          (#1=#:G808 NIL) (|w| NIL) (#2=#:G809 NIL) (|v| NIL) (#3=#:G807 NIL)
          (|aeList| (|List| (|Expression| (|MachineComplex|)))) (#4=#:G806 NIL)
          (#5=#:G805 NIL) (|veList| (|List| (|Expression| (|MachineComplex|))))
          (#6=#:G804 NIL) (#7=#:G803 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 86)) (QREFELT $ 87)) 1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 86)) (QREFELT $ 82))
                   . #9=(|FORTRAN;coerce;E$;11|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 62))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 88)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 88)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 89))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 90)) |eList|
                             (QREFELT $ 91))
                   (QREFELT $ 84))))))))))))) 

(PUT '|FORTRAN;coerce;R$;12| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |FORTRAN;coerce;R$;12|
        ((|u| |Record| (|:| |localSymbols| (|SymbolTable|))
          (|:| |code| (|List| (|FortranCode|))))
         ($ $))
        |u|) 

(SDEFUN |FORTRAN;coerce;$Of;13| ((|u| $) ($ |OutputForm|))
        (SPADCALL (QREFELT $ 6) (QREFELT $ 38))) 

(SDEFUN |FORTRAN;coerce;L$;14| ((|c| |List| (|FortranCode|)) ($ $))
        (|FORTRAN;makeRep| |c| $)) 

(SDEFUN |FORTRAN;coerce;Fc$;15| ((|c| |FortranCode|) ($ $))
        (|FORTRAN;makeRep| (LIST |c|) $)) 

(SDEFUN |FORTRAN;coerce;E$;16| ((|u| |Expression| (|Integer|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 100))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 101))
                            (SPADCALL (QREFELT $ 55)))
                      |FORTRAN;coerce;E$;16|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;17|
        ((|u| |Equation| (|Expression| (|Integer|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|Integer|)))))
          (#1=#:G834 NIL) (|w| NIL) (#2=#:G835 NIL) (|v| NIL) (#3=#:G833 NIL)
          (|aeList| (|List| (|Expression| (|Integer|)))) (#4=#:G832 NIL)
          (#5=#:G831 NIL) (|veList| (|List| (|Expression| (|Integer|))))
          (#6=#:G830 NIL) (#7=#:G829 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 104)) (QREFELT $ 105))
                    1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 104)) (QREFELT $ 100))
                   . #9=(|FORTRAN;coerce;E$;17|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 62))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 106)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 106)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 107))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 108)) |eList|
                             (QREFELT $ 109))
                   (QREFELT $ 102))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;18| ((|u| |Expression| (|Float|)) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 112))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 113))
                            (SPADCALL (QREFELT $ 55)))
                      |FORTRAN;coerce;E$;18|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;19|
        ((|u| |Equation| (|Expression| (|Float|))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|Float|)))))
          (#1=#:G855 NIL) (|w| NIL) (#2=#:G856 NIL) (|v| NIL) (#3=#:G854 NIL)
          (|aeList| (|List| (|Expression| (|Float|)))) (#4=#:G853 NIL)
          (#5=#:G852 NIL) (|veList| (|List| (|Expression| (|Float|))))
          (#6=#:G851 NIL) (#7=#:G850 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 116)) (QREFELT $ 117))
                    1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 116)) (QREFELT $ 112))
                   . #9=(|FORTRAN;coerce;E$;19|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 62))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 118)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 118)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 119))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 120)) |eList|
                             (QREFELT $ 121))
                   (QREFELT $ 114))))))))))))) 

(SDEFUN |FORTRAN;coerce;E$;20| ((|u| |Expression| (|Complex| (|Float|))) ($ $))
        (SPROG ((|l| (|List| (|FortranCode|))))
               (SEQ
                (|FORTRAN;checkVariables| (SPADCALL |u| (QREFELT $ 124))
                 (QREFELT $ 8) $)
                (LETT |l|
                      (LIST (SPADCALL (QREFELT $ 6) |u| (QREFELT $ 125))
                            (SPADCALL (QREFELT $ 55)))
                      |FORTRAN;coerce;E$;20|)
                (EXIT (|FORTRAN;makeRep| |l| $))))) 

(SDEFUN |FORTRAN;coerce;E$;21|
        ((|u| |Equation| (|Expression| (|Complex| (|Float|)))) ($ $))
        (SPROG
         ((|eList| (|List| (|Equation| (|Expression| (|Complex| (|Float|))))))
          (#1=#:G879 NIL) (|w| NIL) (#2=#:G880 NIL) (|v| NIL) (#3=#:G878 NIL)
          (|aeList| (|List| (|Expression| (|Complex| (|Float|)))))
          (#4=#:G877 NIL) (#5=#:G876 NIL)
          (|veList| (|List| (|Expression| (|Complex| (|Float|)))))
          (#6=#:G875 NIL) (#7=#:G874 NIL) (|vList| (|List| (|Symbol|))))
         (SEQ
          (COND
           ((QEQCAR (SPADCALL (SPADCALL |u| (QREFELT $ 128)) (QREFELT $ 129))
                    1)
            (|error| "left hand side is not a kernel"))
           (#8='T
            (SEQ
             (LETT |vList|
                   (SPADCALL (SPADCALL |u| (QREFELT $ 128)) (QREFELT $ 124))
                   . #9=(|FORTRAN;coerce;E$;21|))
             (EXIT
              (COND
               ((SPADCALL (LENGTH |vList|) (LENGTH (QREFELT $ 8))
                          (QREFELT $ 62))
                (|error| "Incorrect number of arguments"))
               (#8#
                (SEQ
                 (LETT |veList|
                       (PROGN
                        (LETT #7# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#) (LETT #6# |vList| . #9#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |w| (CAR #6#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #7#
                                     (CONS (SPADCALL |w| (QREFELT $ 130)) #7#)
                                     . #9#)))
                             (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #7#))))
                       . #9#)
                 (LETT |aeList|
                       (PROGN
                        (LETT #5# NIL . #9#)
                        (SEQ (LETT |w| NIL . #9#)
                             (LETT #4# (QREFELT $ 8) . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |w| (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |w| (QREFELT $ 130)) #5#)
                                     . #9#)))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #9#)
                 (LETT |eList|
                       (PROGN
                        (LETT #3# NIL . #9#)
                        (SEQ (LETT |v| NIL . #9#) (LETT #2# |aeList| . #9#)
                             (LETT |w| NIL . #9#) (LETT #1# |veList| . #9#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |w| (CAR #1#) . #9#) NIL)
                                   (ATOM #2#)
                                   (PROGN (LETT |v| (CAR #2#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |w| |v| (QREFELT $ 131))
                                           #3#)
                                     . #9#)))
                             (LETT #1#
                                   (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT (NREVERSE #3#))))
                       . #9#)
                 (EXIT
                  (SPADCALL
                   (SPADCALL (SPADCALL |u| (QREFELT $ 132)) |eList|
                             (QREFELT $ 133))
                   (QREFELT $ 126))))))))))))) 

(DECLAIM (NOTINLINE |FortranProgram;|)) 

(DEFUN |FortranProgram| (&REST #1=#:G881)
  (SPROG NIL
         (PROG (#2=#:G882)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FortranProgram|)
                                               '|domainEqualList|)
                    . #3=(|FortranProgram|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FortranProgram;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FortranProgram|)))))))))) 

(DEFUN |FortranProgram;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|FortranProgram|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|FortranProgram| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 135) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|FortranProgram|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 10
              (|Record| (|:| |localSymbols| (|SymbolTable|))
                        (|:| |code| (|List| (|FortranCode|)))))
    $))) 

(MAKEPROP '|FortranProgram| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| (|SymbolTable|)
              (0 . |empty|) (|Integer|) (|SingleInteger|) (4 . |coerce|)
              (|FortranCode|) (9 . |setLabelValue|) (|Void|) (|Symbol|)
              (|TheSymbolTable|) (14 . |newSubProgram|) (|FortranCodeTools|)
              (19 . |clear_used_intrinsics|) (|List| 33) (23 . |getCode|)
              (28 . |get_used_intrinsics|) (32 . |endSubProgram|)
              (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| '"void"))
              (|List| 19) (36 . |fortFormatHead|) (43 . |printTypes|)
              (48 . |printTypes|) (|String|) (53 . |fortFormatTypeLines|)
              (59 . |clearTheSymbolTable|) (64 . |displayLines1|)
              (|OutputForm|) (69 . |coerce|) (74 . |dispStatement|)
              |FORTRAN;outputAsFortran;$V;3| (|InputForm|) (79 . |convert|)
              (84 . |unparse|) (89 . |name|) (|Mapping| 19 19) (94 . |map|)
              (100 . |setDifference|) (|Boolean|) (106 . ~=) (112 . |coerce|)
              (117 . |void|) (|Expression| (|MachineInteger|))
              (121 . |variables|) (126 . |assign|) (132 . |returns|)
              |FORTRAN;coerce;E$;6| (|Equation| 52) (136 . |lhs|)
              (|Union| (|Kernel| $) '"failed") (141 . |retractIfCan|)
              (|NonNegativeInteger|) (146 . ~=) (152 . |coerce|)
              (157 . |equation|) (163 . |rhs|) (|List| (|Equation| $))
              (168 . |subst|) |FORTRAN;coerce;E$;7|
              (|Expression| (|MachineFloat|)) (174 . |variables|)
              (179 . |assign|) |FORTRAN;coerce;E$;8| (|Equation| 69)
              (185 . |lhs|) (190 . |retractIfCan|) (195 . |coerce|)
              (200 . |equation|) (206 . |rhs|) (211 . |subst|)
              |FORTRAN;coerce;E$;9| (|Expression| (|MachineComplex|))
              (217 . |variables|) (222 . |assign|) |FORTRAN;coerce;E$;10|
              (|Equation| 81) (228 . |lhs|) (233 . |retractIfCan|)
              (238 . |coerce|) (243 . |equation|) (249 . |rhs|) (254 . |subst|)
              |FORTRAN;coerce;E$;11|
              (|Record| (|:| |localSymbols| 11) (|:| |code| 96))
              |FORTRAN;coerce;R$;12| |FORTRAN;coerce;$Of;13| (|List| 16)
              |FORTRAN;coerce;L$;14| |FORTRAN;coerce;Fc$;15| (|Expression| 13)
              (260 . |variables|) (265 . |assign|) |FORTRAN;coerce;E$;16|
              (|Equation| 99) (271 . |lhs|) (276 . |retractIfCan|)
              (281 . |coerce|) (286 . |equation|) (292 . |rhs|) (297 . |subst|)
              |FORTRAN;coerce;E$;17| (|Expression| (|Float|))
              (303 . |variables|) (308 . |assign|) |FORTRAN;coerce;E$;18|
              (|Equation| 111) (314 . |lhs|) (319 . |retractIfCan|)
              (324 . |coerce|) (329 . |equation|) (335 . |rhs|) (340 . |subst|)
              |FORTRAN;coerce;E$;19| (|Expression| (|Complex| (|Float|)))
              (346 . |variables|) (351 . |assign|) |FORTRAN;coerce;E$;20|
              (|Equation| 123) (357 . |lhs|) (362 . |retractIfCan|)
              (367 . |coerce|) (372 . |equation|) (378 . |rhs|) (383 . |subst|)
              |FORTRAN;coerce;E$;21|)
           '#(|outputAsFortran| 389 |coerce| 394) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(NIL NIL NIL)
                       (CONS
                        '#((|FortranProgramCategory|) (|Type|)
                           (|CoercibleTo| 37))
                        (|makeByteWordVec2| 134
                                            '(0 11 0 12 1 14 0 13 15 1 16 14 14
                                              17 1 20 18 19 21 0 22 18 23 1 16
                                              24 0 25 0 22 24 26 0 20 19 27 3
                                              22 18 19 28 29 30 1 11 18 0 31 1
                                              20 18 19 32 2 22 18 33 24 34 1 20
                                              18 19 35 1 22 18 24 36 1 19 37 0
                                              38 1 22 18 37 39 1 29 41 0 42 1
                                              41 33 0 43 1 19 0 0 44 2 29 0 45
                                              0 46 2 29 0 0 0 47 2 29 48 0 0 49
                                              1 33 37 0 50 0 18 0 51 1 52 29 0
                                              53 2 16 0 19 52 54 0 16 0 55 1 57
                                              52 0 58 1 52 59 0 60 2 61 48 0 0
                                              62 1 52 0 19 63 2 57 0 52 52 64 1
                                              57 52 0 65 2 52 0 0 66 67 1 69 29
                                              0 70 2 16 0 19 69 71 1 73 69 0 74
                                              1 69 59 0 75 1 69 0 19 76 2 73 0
                                              69 69 77 1 73 69 0 78 2 69 0 0 66
                                              79 1 81 29 0 82 2 16 0 19 81 83 1
                                              85 81 0 86 1 81 59 0 87 1 81 0 19
                                              88 2 85 0 81 81 89 1 85 81 0 90 2
                                              81 0 0 66 91 1 99 29 0 100 2 16 0
                                              19 99 101 1 103 99 0 104 1 99 59
                                              0 105 1 99 0 19 106 2 103 0 99 99
                                              107 1 103 99 0 108 2 99 0 0 66
                                              109 1 111 29 0 112 2 16 0 19 111
                                              113 1 115 111 0 116 1 111 59 0
                                              117 1 111 0 19 118 2 115 0 111
                                              111 119 1 115 111 0 120 2 111 0 0
                                              66 121 1 123 29 0 124 2 16 0 19
                                              123 125 1 127 123 0 128 1 123 59
                                              0 129 1 123 0 19 130 2 127 0 123
                                              123 131 1 127 123 0 132 2 123 0 0
                                              66 133 1 0 18 0 40 1 0 0 115 122
                                              1 0 0 127 134 1 0 0 123 126 1 0 0
                                              103 110 1 0 0 99 102 1 0 0 111
                                              114 1 0 0 73 80 1 0 0 85 92 1 0 0
                                              81 84 1 0 0 57 68 1 0 0 52 56 1 0
                                              0 69 72 1 0 0 96 97 1 0 0 93 94 1
                                              0 0 16 98 1 0 37 0 95)))))
           '|lookupComplete|)) 
