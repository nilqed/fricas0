
(SDEFUN |FORT;setLegalFortranSourceExtensions;2L;1|
        ((|l| |List| (|String|)) ($ |List| (|String|))) (SETELT $ 6 |l|)) 

(SDEFUN |FORT;checkExtension| ((|fn| |FileName|) ($ |String|))
        (SPROG ((|stringFn| (|String|)))
               (SEQ
                (LETT |stringFn| (SPADCALL |fn| (QREFELT $ 11))
                      |FORT;checkExtension|)
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |fn| (QREFELT $ 12)) (QREFELT $ 6)
                             (QREFELT $ 14)))
                  (EXIT
                   (|error|
                    (LIST '|mathprint|
                          (SPADCALL
                           (LIST |stringFn|
                                 "is not a legal Fortran Source File.")
                           (QREFELT $ 16)))))))
                (EXIT |stringFn|)))) 

(SDEFUN |FORT;outputAsFortran;FnV;3| ((|fn| |FileName|) ($ |Void|))
        (SPROG
         ((|command| (|String|)) (|target| (|String|)) (|source| (|String|)))
         (SEQ
          (LETT |source| (SPADCALL |fn| (QREFELT $ 11))
                . #1=(|FORT;outputAsFortran;FnV;3|))
          (COND
           ((NULL (SPADCALL |fn| (QREFELT $ 17)))
            (EXIT
             (SEQ (SPADCALL (QREFELT $ 20))
                  (EXIT
                   (|error|
                    (LIST '|mathprint|
                          (SPADCALL (LIST |source| "is not readable")
                                    (QREFELT $ 16)))))))))
          (LETT |target| (SPADCALL (QREFELT $ 21)) . #1#)
          (LETT |command|
                (SPADCALL
                 (LIST "sys rm -f " |target| " ; cp " |source| " " |target|)
                 (QREFELT $ 23))
                . #1#)
          (SPADCALL |command| (QREFELT $ 25))
          (EXIT (SPADCALL (QREFELT $ 26)))))) 

(PUT '|FORT;linkToFortran;SLLLSe;4| '|SPADreplace|
     '(XLAM (|name| |args| |decls| |res|)
       (|makeFort| |name| |args| |decls| |res| NIL NIL))) 

(SDEFUN |FORT;linkToFortran;SLLLSe;4|
        ((|name| |Symbol|)
         (|args| |List|
          (|Union| (|:| |array| (|List| (|Symbol|)))
                   (|:| |scalar| (|Symbol|))))
         (|decls| |List|
          (|List|
           (|Union| (|:| |array| (|List| (|Symbol|)))
                    (|:| |scalar| (|Symbol|)))))
         (|res| |List| (|Symbol|)) ($ |SExpression|))
        (|makeFort| |name| |args| |decls| |res| NIL NIL)) 

(PUT '|FORT;linkToFortran;SLLLSSe;5| '|SPADreplace|
     '(XLAM (|name| |args| |decls| |res| |returnType|)
       (|makeFort| |name| |args| |decls| |res| |returnType| NIL))) 

(SDEFUN |FORT;linkToFortran;SLLLSSe;5|
        ((|name| |Symbol|)
         (|args| |List|
          (|Union| (|:| |array| (|List| (|Symbol|)))
                   (|:| |scalar| (|Symbol|))))
         (|decls| |List|
          (|List|
           (|Union| (|:| |array| (|List| (|Symbol|)))
                    (|:| |scalar| (|Symbol|)))))
         (|res| |List| (|Symbol|)) (|returnType| |Symbol|) ($ |SExpression|))
        (|makeFort| |name| |args| |decls| |res| |returnType| NIL)) 

(SDEFUN |FORT;dimensions| ((|type| |FortranType|) ($ |SExpression|))
        (SPROG ((#1=#:G736 NIL) (|u| NIL) (#2=#:G735 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|FORT;dimensions|))
                  (SEQ (LETT |u| NIL . #3#)
                       (LETT #1# (SPADCALL |type| (QREFELT $ 38)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |u| (QREFELT $ 41))
                                          (QREFELT $ 42))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 43))))) 

(SDEFUN |FORT;ftype|
        ((|name| |Symbol|) (|type| |FortranType|) ($ |SExpression|))
        (|construct| |name| (SPADCALL |type| (QREFELT $ 45))
                     (|FORT;dimensions| |type| $)
                     (SPADCALL |type| (QREFELT $ 46)))) 

(SDEFUN |FORT;makeAspList|
        ((|asp| |Symbol|) (|syms| |TheSymbolTable|) ($ |SExpression|))
        (SPROG
         ((#1=#:G748 NIL) (|u| NIL) (#2=#:G747 NIL) (|symtab| (|SymbolTable|)))
         (SEQ
          (LETT |symtab| (SPADCALL |asp| |syms| (QREFELT $ 49))
                . #3=(|FORT;makeAspList|))
          (EXIT
           (|construct| |asp| (SPADCALL |asp| |syms| (QREFELT $ 50))
                        (SPADCALL |asp| |syms| (QREFELT $ 51))
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |u| NIL . #3#)
                              (LETT #1# (SPADCALL |symtab| (QREFELT $ 52))
                                    . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (|FORT;ftype| |u|
                                        (SPADCALL |u| |symtab| (QREFELT $ 53))
                                        $)
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FORT;linkToFortran;SLTstLSe;9|
        ((|name| |Symbol|) (|aArgs| |List| (|Symbol|))
         (|syms| |TheSymbolTable|) (|res| |List| (|Symbol|)) ($ |SExpression|))
        (SPROG
         ((|asps| (|List| (|SExpression|))) (#1=#:G755 NIL) (|u| NIL)
          (#2=#:G754 NIL)
          (|rt|
           (|Union| (|:| |fst| (|FortranScalarType|)) (|:| |void| "void")))
          (|symbolList| (|SExpression|)) (|symbolTable| (|SymbolTable|))
          (|dummies| (|List| (|Symbol|))) (|arguments| (|List| (|Symbol|))))
         (SEQ
          (LETT |arguments| (SPADCALL |name| |syms| (QREFELT $ 51))
                . #3=(|FORT;linkToFortran;SLTstLSe;9|))
          (LETT |dummies| (SPADCALL |arguments| |aArgs| (QREFELT $ 54)) . #3#)
          (LETT |symbolTable| (SPADCALL |name| |syms| (QREFELT $ 49)) . #3#)
          (LETT |symbolList| (SPADCALL |symbolTable| (QREFELT $ 55)) . #3#)
          (LETT |rt| (SPADCALL |name| |syms| (QREFELT $ 50)) . #3#)
          (LETT |asps|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |u| NIL . #3#)
                      (LETT #1# (SPADCALL |symbolTable| (QREFELT $ 56)) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FORT;makeAspList| |u| |syms| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND
            ((QEQCAR |rt| 0)
             (|makeFort1| |name| |arguments| |aArgs| |dummies| |symbolList|
                          |res| (SPADCALL (CDR |rt|) (QREFELT $ 58)) |asps|))
            ('T
             (|makeFort1| |name| |arguments| |aArgs| |dummies| |symbolList|
                          |res| NIL |asps|))))))) 

(DECLAIM (NOTINLINE |FortranPackage;|)) 

(DEFUN |FortranPackage| ()
  (SPROG NIL
         (PROG (#1=#:G757)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranPackage|)
                    . #2=(|FortranPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranPackage|
                             (LIST (CONS NIL (CONS 1 (|FortranPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranPackage|)))))))))) 

(DEFUN |FortranPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranPackage|) . #1=(|FortranPackage|))
          (LETT $ (GETREFV 60) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranPackage| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (LIST "f"))
          $))) 

(MAKEPROP '|FortranPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|legalFortranSourceExtensions|
              (|List| 9) |FORT;setLegalFortranSourceExtensions;2L;1| (|String|)
              (|FileName|) (0 . |coerce|) (5 . |extension|) (|Boolean|)
              (10 . |member?|) (|OutputForm|) (16 . |coerce|)
              (21 . |readable?|) (|Void|) (|FortranOutputStackPackage|)
              (26 . |popFortranOutputStack|) (30 . |topFortranOutputStack|)
              (|List| $) (34 . |concat|) (|MoreSystemCommands|)
              (39 . |systemCommand|) (44 . |void|) |FORT;outputAsFortran;FnV;3|
              (|SExpression|) (|Symbol|)
              (|Union| (|:| |array| 33) (|:| |scalar| 29)) (|List| 30)
              (|List| 31) (|List| 29) |FORT;linkToFortran;SLLLSe;4|
              |FORT;linkToFortran;SLLLSSe;5| (|List| 40) (|FortranType|)
              (48 . |dimensionsOf|) (|InputForm|) (|Polynomial| (|Integer|))
              (53 . |convert|) (58 . |convert|) (63 . |convert|)
              (|Union| (|:| |fst| 57) (|:| |void| '"void"))
              (68 . |scalarTypeOf|) (73 . |external?|) (|SymbolTable|)
              (|TheSymbolTable|) (78 . |symbolTableOf|) (84 . |returnTypeOf|)
              (90 . |argumentListOf|) (96 . |parametersOf|)
              (101 . |fortranTypeOf|) (107 . |setDifference|)
              (113 . |newTypeLists|) (118 . |externalList|)
              (|FortranScalarType|) (123 . |coerce|)
              |FORT;linkToFortran;SLTstLSe;9|)
           '#(|setLegalFortranSourceExtensions| 128 |outputAsFortran| 133
              |linkToFortran| 138)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 59
                                                 '(1 10 9 0 11 1 10 9 0 12 2 7
                                                   13 9 0 14 1 7 15 0 16 1 10
                                                   13 0 17 0 19 18 20 0 19 9 21
                                                   1 9 0 22 23 1 24 18 9 25 0
                                                   18 0 26 1 37 36 0 38 1 40 39
                                                   0 41 1 39 28 0 42 1 28 0 22
                                                   43 1 37 44 0 45 1 37 13 0 46
                                                   2 48 47 29 0 49 2 48 44 29 0
                                                   50 2 48 33 29 0 51 1 47 33 0
                                                   52 2 47 37 29 0 53 2 33 0 0
                                                   0 54 1 47 28 0 55 1 47 33 0
                                                   56 1 57 29 0 58 1 0 7 7 8 1
                                                   0 18 10 27 5 0 28 29 31 32
                                                   33 29 35 4 0 28 29 31 32 33
                                                   34 4 0 28 29 33 48 33
                                                   59)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranPackage| 'NILADIC T) 
