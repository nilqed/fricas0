
(SDEFUN |LATMOFJ;proposition| ((|s| |String|) ($ $))
        (LIST (LIST (CONS 1 (LIST |s|))))) 

(SDEFUN |LATMOFJ;logicT;$;2| (($ $)) (LIST (LIST (CONS 0 (LIST 'T))))) 

(SDEFUN |LATMOFJ;logicF;$;3| (($ $)) (LIST (LIST (CONS 0 (LIST 'F))))) 

(SDEFUN |LATMOFJ;variable;S$;4| ((|v| |String|) ($ $))
        (LIST (LIST (CONS 1 (LIST |v|))))) 

(SDEFUN |LATMOFJ;latticeMeetOfJoins;U$;5|
        ((|e| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ $))
        (LIST (LIST |e|))) 

(PUT '|LATMOFJ;emptyLattice;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LATMOFJ;emptyLattice;$;6| (($ $)) NIL) 

(PUT '|LATMOFJ;empty?;$B;7| '|SPADreplace| 'NULL) 

(SDEFUN |LATMOFJ;empty?;$B;7| ((|n| $) ($ |Boolean|)) (NULL |n|)) 

(SDEFUN |LATMOFJ;/\\;3$;8| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G779 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 17))
                    (PROGN
                     (LETT #1# |b| . #2=(|LATMOFJ;/\\;3$;8|))
                     (GO #3=#:G778))))
                  (COND
                   ((SPADCALL |b| (QREFELT $ 17))
                    (PROGN (LETT #1# |a| . #2#) (GO #3#))))
                  (EXIT
                   (SPADCALL (SPADCALL |a| |b| (QREFELT $ 19))
                             (QREFELT $ 20)))))
                #3# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;\\/;3$;9| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|))))))))
          (|term|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termRight|
           #1=(|List|
               (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                        (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termLeft| #1#) (#2=#:G795 NIL) (|innerb| NIL) (#3=#:G794 NIL)
          (|innera| NIL) (#4=#:G793 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |a| (QREFELT $ 17))
              (PROGN (LETT #4# |b| . #5=(|LATMOFJ;\\/;3$;9|)) (GO #6=#:G792))))
            (COND
             ((SPADCALL |b| (QREFELT $ 17))
              (PROGN (LETT #4# |a| . #5#) (GO #6#))))
            (LETT |r| NIL . #5#)
            (SEQ (LETT |innera| NIL . #5#) (LETT #3# |a| . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |innera| (CAR #3#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |innerb| NIL . #5#) (LETT #2# |b| . #5#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |innerb| (CAR #2#) . #5#) NIL))
                          (GO G191)))
                        (SEQ (LETT |termLeft| |innera| . #5#)
                             (LETT |termRight| |innerb| . #5#)
                             (LETT |term|
                                   (SPADCALL |termLeft| |termRight|
                                             (QREFELT $ 23))
                                   . #5#)
                             (EXIT
                              (LETT |r| (SPADCALL |r| |term| (QREFELT $ 24))
                                    . #5#)))
                        (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |r| (QREFELT $ 20)))))
          #6# (EXIT #4#)))) 

(SDEFUN |LATMOFJ;meet;L$;10| ((|ln| |List| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G799 NIL) (|ele| NIL))
               (SEQ
                (LETT |r| (SPADCALL (QREFELT $ 15))
                      . #2=(|LATMOFJ;meet;L$;10|))
                (SEQ (LETT |ele| NIL . #2#) (LETT #1# |ln| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r| (SPADCALL |r| |ele| (QREFELT $ 21)) . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(SDEFUN |LATMOFJ;join;L$;11| ((|ln| |List| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G803 NIL) (|ele| NIL))
               (SEQ
                (LETT |r| (SPADCALL (QREFELT $ 15))
                      . #2=(|LATMOFJ;join;L$;11|))
                (SEQ (LETT |ele| NIL . #2#) (LETT #1# |ln| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |r| (SPADCALL |r| |ele| (QREFELT $ 25)) . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(SDEFUN |LATMOFJ;equalElements|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         (|b| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |Boolean|))
        (SPROG ((#1=#:G817 NIL) (#2=#:G806 NIL) (#3=#:G807 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1#
                           (EQUAL (QCAR (CDR |a|))
                                  (QCAR
                                   (PROG2
                                       (LETT #3# |b|
                                             . #4=(|LATMOFJ;equalElements|))
                                       (QCDR #3#)
                                     (|check_union2| (QEQCAR #3# 1)
                                                     (|Record|
                                                      (|:| |str| (|String|)))
                                                     (|Union|
                                                      (|:| |const|
                                                           (|Record|
                                                            (|:| |val|
                                                                 (|Symbol|))))
                                                      (|:| |var|
                                                           (|Record|
                                                            (|:| |str|
                                                                 (|String|)))))
                                                     #3#))))
                           . #4#)
                     (GO #5=#:G816))))
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((QEQCAR |b| 0)
                      (PROGN
                       (LETT #1#
                             (EQUAL
                              (QCAR
                               (PROG2 (LETT #2# |a| . #4#)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Record|
                                                  (|:| |val| (|Symbol|)))
                                                 (|Union|
                                                  (|:| |const|
                                                       (|Record|
                                                        (|:| |val|
                                                             (|Symbol|))))
                                                  (|:| |var|
                                                       (|Record|
                                                        (|:| |str|
                                                             (|String|)))))
                                                 #2#)))
                              (QCAR (CDR |b|)))
                             . #4#)
                       (GO #5#))))))
                  (EXIT NIL)))
                #5# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;removeDuplicatesInTerm|
        ((|n| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|)))))))
        (SPROG
         ((|r|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|match| (|Boolean|)) (#1=#:G833 NIL) (|e2| NIL) (#2=#:G834 NIL)
          (|ne2| NIL) (#3=#:G831 NIL) (|e1| NIL) (#4=#:G832 NIL) (|ne1| NIL))
         (SEQ (LETT |r| NIL . #5=(|LATMOFJ;removeDuplicatesInTerm|))
              (SEQ (LETT |ne1| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
                   (LETT |e1| NIL . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |e1| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |ne1| #4#))
                     (GO G191)))
                   (SEQ (LETT |match| NIL . #5#)
                        (SEQ (LETT |ne2| 1 . #5#) (LETT #2# (LENGTH |n|) . #5#)
                             (LETT |e2| NIL . #5#) (LETT #1# |n| . #5#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e2| (CAR #1#) . #5#) NIL)
                                   (|greater_SI| |ne2| #2#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |e1| |e2| (QREFELT $ 29))
                                 (COND
                                  ((< |ne1| |ne2|)
                                   (LETT |match| 'T . #5#)))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |ne2| (|inc_SI| |ne2|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |match|)
                           (LETT |r| (SPADCALL |r| |e1| (QREFELT $ 30))
                                 . #5#)))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |ne1| (|inc_SI| |ne1|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATMOFJ;equalTerms|
        ((|a| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G850 NIL) (|found| (|Boolean|)) (#2=#:G852 NIL) (|b1| NIL)
          (#3=#:G851 NIL) (|a1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 32))
              (PROGN
               (LETT #1# NIL . #4=(|LATMOFJ;equalTerms|))
               (GO #5=#:G849))))
            (SEQ (LETT |a1| NIL . #4#) (LETT #3# |a| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL . #4#)
                      (SEQ (LETT |b1| NIL . #4#) (LETT #2# |b| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |b1| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATMOFJ;equalElements| |a1| |b1| $)
                               (LETT |found| 'T . #4#)))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|)
                         (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;subTerm|
        ((|a| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G868 NIL) (|found| (|Boolean|)) (#2=#:G870 NIL) (|b1| NIL)
          (#3=#:G869 NIL) (|a1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((>= (LENGTH |a|) (LENGTH |b|))
              (PROGN (LETT #1# NIL . #4=(|LATMOFJ;subTerm|)) (GO #5=#:G867))))
            (SEQ (LETT |a1| NIL . #4#) (LETT #3# |a| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL . #4#)
                      (SEQ (LETT |b1| NIL . #4#) (LETT #2# |b| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |b1| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATMOFJ;equalElements| |a1| |b1| $)
                               (LETT |found| 'T . #4#)))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|)
                         (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;redux;2$;16| ((|n| $) ($ $))
        (SPROG
         ((|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|))))))))
          (|modified| #1=(|Boolean|)) (|isSubTerm| #1#) (#2=#:G884 NIL)
          (|inner| NIL) (|match| #1#) (#3=#:G882 NIL) (#4=#:G883 NIL)
          (|innern| NIL)
          (|newinnerList|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (#5=#:G880 NIL) (|outer| NIL) (#6=#:G881 NIL) (|outern| NIL))
         (SEQ (LETT |r| NIL . #7=(|LATMOFJ;redux;2$;16|))
              (LETT |modified| NIL . #7#)
              (SEQ (LETT |outern| 1 . #7#) (LETT #6# (LENGTH |n|) . #7#)
                   (LETT |outer| NIL . #7#) (LETT #5# |n| . #7#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |outer| (CAR #5#) . #7#) NIL)
                         (|greater_SI| |outern| #6#))
                     (GO G191)))
                   (SEQ
                    (LETT |newinnerList|
                          (|LATMOFJ;removeDuplicatesInTerm| |outer| $) . #7#)
                    (COND
                     ((NULL (|LATMOFJ;equalTerms| |newinnerList| |outer| $))
                      (LETT |modified| 'T . #7#)))
                    (LETT |match| NIL . #7#)
                    (SEQ (LETT |innern| 1 . #7#) (LETT #4# (LENGTH |n|) . #7#)
                         (LETT |inner| NIL . #7#) (LETT #3# |n| . #7#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |inner| (CAR #3#) . #7#) NIL)
                               (|greater_SI| |innern| #4#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATMOFJ;equalTerms| |inner| |outer| $)
                             (COND
                              ((< |innern| |outern|)
                               (LETT |match| 'T . #7#)))))))
                         (LETT #3#
                               (PROG1 (CDR #3#)
                                 (LETT |innern| (|inc_SI| |innern|) . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))
                    (LETT |isSubTerm| NIL . #7#)
                    (SEQ (LETT |inner| NIL . #7#) (LETT #2# |n| . #7#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |inner| (CAR #2#) . #7#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATMOFJ;subTerm| |inner| |outer| $)
                             (LETT |isSubTerm| 'T . #7#)))))
                         (LETT #2# (CDR #2#) . #7#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((OR |match| |isSubTerm|) (LETT |modified| 'T . #7#))
                      ('T
                       (LETT |r| (SPADCALL |r| |newinnerList| (QREFELT $ 24))
                             . #7#)))))
                   (LETT #5#
                         (PROG1 (CDR #5#)
                           (LETT |outern| (|inc_SI| |outern|) . #7#))
                         . #7#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|modified| (SPADCALL |r| (QREFELT $ 20))) ('T |r|)))))) 

(PUT '|LATMOFJ;factor;$L;17| '|SPADreplace| 'LIST) 

(SDEFUN |LATMOFJ;factor;$L;17| ((|n| $) ($ |List| $)) (LIST |n|)) 

(PUT '|LATMOFJ;removeDup| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |LATMOFJ;removeDup| ((|a| |List| $) (|b| |List| $) ($ |List| $)) |a|) 

(PUT '|LATMOFJ;deductions;2L;19| '|SPADreplace| '(XLAM (|ln|) |ln|)) 

(SDEFUN |LATMOFJ;deductions;2L;19| ((|ln| |List| $) ($ |List| $)) |ln|) 

(PUT '|LATMOFJ;opType;$S;20| '|SPADreplace| '(XLAM (|n|) 'OTHER)) 

(SDEFUN |LATMOFJ;opType;$S;20| ((|n| $) ($ |Symbol|)) 'OTHER) 

(PUT '|LATMOFJ;atom?;$B;21| '|SPADreplace| '(XLAM (|n|) NIL)) 

(SDEFUN |LATMOFJ;atom?;$B;21| ((|n| $) ($ |Boolean|)) NIL) 

(PUT '|LATMOFJ;value;$S;22| '|SPADreplace| '(XLAM (|n|) 'C)) 

(SDEFUN |LATMOFJ;value;$S;22| ((|n| $) ($ |Symbol|)) 'C) 

(PUT '|LATMOFJ;getChildren;$L;23| '|SPADreplace| 'LIST) 

(SDEFUN |LATMOFJ;getChildren;$L;23| ((|n| $) ($ |List| $)) (LIST |n|)) 

(PUT '|LATMOFJ;=;2$B;24| '|SPADreplace| '(XLAM (|a| |b|) NIL)) 

(SDEFUN |LATMOFJ;=;2$B;24| ((|a| $) (|b| $) ($ |Boolean|)) NIL) 

(SDEFUN |LATMOFJ;toString;$S;25| ((|n| $) ($ |String|))
        (SPROG ((|a| (|String|)))
               (SEQ
                (LETT |a| (STRCONC "(" (SPADCALL |n| (QREFELT $ 41)))
                      . #1=(|LATMOFJ;toString;$S;25|))
                (LETT |a| (STRCONC |a| ")") . #1#) (EXIT |a|)))) 

(SDEFUN |LATMOFJ;stringVarOrLit|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |String|))
        (SPROG ((#1=#:G899 NIL) (#2=#:G820 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1# (QCAR (CDR |a|))
                           . #3=(|LATMOFJ;stringVarOrLit|))
                     (GO #4=#:G898))))
                  (COND
                   ((QEQCAR |a| 0)
                    (SEQ
                     (COND
                      ((EQUAL
                        (QCAR
                         (PROG2 (LETT #2# |a| . #3#)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|Record| (|:| |val| (|Symbol|)))
                                           (|Union|
                                            (|:| |const|
                                                 (|Record|
                                                  (|:| |val| (|Symbol|))))
                                            (|:| |var|
                                                 (|Record|
                                                  (|:| |str| (|String|)))))
                                           #2#)))
                        'T)
                       (PROGN (LETT #1# "T" . #3#) (GO #4#))))
                     (EXIT (PROGN (LETT #1# "F" . #3#) (GO #4#))))))
                  (EXIT "error")))
                #4# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;toStringUnwrapped;$S;27| ((|n| $) ($ |String|))
        (SPROG
         ((|r| (|String|)) (#1=#:G912 NIL) (|inner| NIL) (#2=#:G913 NIL)
          (|innern| NIL) (|innerList| (|List| (|String|))) (#3=#:G910 NIL)
          (|outer| NIL) (#4=#:G911 NIL) (|outern| NIL)
          (|outerList| (|List| (|String|))))
         (SEQ (LETT |outerList| NIL . #5=(|LATMOFJ;toStringUnwrapped;$S;27|))
              (LETT |r| "" . #5#)
              (SEQ (LETT |outern| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
                   (LETT |outer| NIL . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |outern| #4#))
                     (GO G191)))
                   (SEQ (LETT |innerList| NIL . #5#)
                        (SEQ (LETT |innern| 1 . #5#)
                             (LETT #2# (LENGTH |outer|) . #5#)
                             (LETT |inner| NIL . #5#) (LETT #1# |outer| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |inner| (CAR #1#) . #5#) NIL)
                                   (|greater_SI| |innern| #2#))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (STRCONC |r|
                                             (|LATMOFJ;stringVarOrLit| |inner|
                                              $))
                                    . #5#)
                              (EXIT
                               (COND
                                ((SPADCALL |innern| (LENGTH |outer|)
                                           (QREFELT $ 32))
                                 (LETT |r| (STRCONC |r| "\\/") . #5#)))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |innern| (|inc_SI| |innern|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |outern| (LENGTH |n|) (QREFELT $ 32))
                           (LETT |r| (STRCONC |r| ")/\\(") . #5#)))))
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT |outern| (|inc_SI| |outern|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATMOFJ;outputVarOrLit|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |OutputForm|))
        (SPROG ((#1=#:G916 NIL) (#2=#:G820 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1# (SPADCALL (QCAR (CDR |a|)) (QREFELT $ 44))
                           . #3=(|LATMOFJ;outputVarOrLit|))
                     (GO #4=#:G915))))
                  (COND
                   ((QEQCAR |a| 0)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (QCAR
                             (PROG2 (LETT #2# |a| . #3#)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Record|
                                                (|:| |val| (|Symbol|)))
                                               (|Union|
                                                (|:| |const|
                                                     (|Record|
                                                      (|:| |val| (|Symbol|))))
                                                (|:| |var|
                                                     (|Record|
                                                      (|:| |str| (|String|)))))
                                               #2#)))
                            (QREFELT $ 45))
                           . #3#)
                     (GO #4#))))
                  (EXIT "error")))
                #4# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;coerce;$Of;29| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (#1=#:G929 NIL) (|inner| NIL) (#2=#:G930 NIL)
          (|innern| NIL) (|innerList| (|List| (|OutputForm|))) (#3=#:G927 NIL)
          (|outer| NIL) (#4=#:G928 NIL) (|outern| NIL)
          (|outerList| (|List| (|OutputForm|))))
         (SEQ (LETT |outerList| NIL . #5=(|LATMOFJ;coerce;$Of;29|))
              (LETT |r| "(" . #5#)
              (SEQ (LETT |outern| 1 . #5#) (LETT #4# (LENGTH |n|) . #5#)
                   (LETT |outer| NIL . #5#) (LETT #3# |n| . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#) . #5#) NIL)
                         (|greater_SI| |outern| #4#))
                     (GO G191)))
                   (SEQ (LETT |innerList| NIL . #5#)
                        (SEQ (LETT |innern| 1 . #5#)
                             (LETT #2# (LENGTH |outer|) . #5#)
                             (LETT |inner| NIL . #5#) (LETT #1# |outer| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |inner| (CAR #1#) . #5#) NIL)
                                   (|greater_SI| |innern| #2#))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (SPADCALL |r|
                                              (|LATMOFJ;outputVarOrLit| |inner|
                                               $)
                                              (QREFELT $ 46))
                                    . #5#)
                              (EXIT
                               (COND
                                ((SPADCALL |innern| (LENGTH |outer|)
                                           (QREFELT $ 32))
                                 (LETT |r| (SPADCALL |r| "\\/" (QREFELT $ 46))
                                       . #5#)))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |innern| (|inc_SI| |innern|) . #5#))
                                   . #5#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |outern| (LENGTH |n|) (QREFELT $ 32))
                           (LETT |r| (SPADCALL |r| ")/\\(" (QREFELT $ 46))
                                 . #5#)))))
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT |outern| (|inc_SI| |outern|) . #5#))
                         . #5#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |r| ")" (QREFELT $ 46)))))) 

(DECLAIM (NOTINLINE |LatticeMeetOfJoins;|)) 

(DEFUN |LatticeMeetOfJoins| ()
  (SPROG NIL
         (PROG (#1=#:G932)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LatticeMeetOfJoins|)
                    . #2=(|LatticeMeetOfJoins|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LatticeMeetOfJoins|
                             (LIST
                              (CONS NIL (CONS 1 (|LatticeMeetOfJoins;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|LatticeMeetOfJoins|)))))))))) 

(DEFUN |LatticeMeetOfJoins;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LatticeMeetOfJoins|) . #1=(|LatticeMeetOfJoins|))
          (LETT $ (GETREFV 50) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LatticeMeetOfJoins| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|List|
                     (|List|
                      (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                               (|:| |var|
                                    (|Record| (|:| |str| (|String|))))))))
          $))) 

(MAKEPROP '|LatticeMeetOfJoins| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| |LATMOFJ;logicT;$;2|
              |LATMOFJ;logicF;$;3| (|String|) |LATMOFJ;variable;S$;4|
              (|Record| (|:| |val| 35)) (|Record| (|:| |str| 9))
              (|Union| (|:| |const| 11) (|:| |var| 12))
              |LATMOFJ;latticeMeetOfJoins;U$;5| |LATMOFJ;emptyLattice;$;6|
              (|Boolean|) |LATMOFJ;empty?;$B;7| (|List| 22) (0 . |concat|)
              |LATMOFJ;redux;2$;16| |LATMOFJ;/\\;3$;8| (|List| 13)
              (6 . |concat|) (12 . |concat|) |LATMOFJ;\\/;3$;9| (|List| $)
              |LATMOFJ;meet;L$;10| |LATMOFJ;join;L$;11| (18 . =)
              (24 . |concat|) (|NonNegativeInteger|) (30 . ~=)
              |LATMOFJ;factor;$L;17| |LATMOFJ;deductions;2L;19| (|Symbol|)
              |LATMOFJ;opType;$S;20| |LATMOFJ;atom?;$B;21|
              |LATMOFJ;value;$S;22| |LATMOFJ;getChildren;$L;23|
              |LATMOFJ;=;2$B;24| |LATMOFJ;toStringUnwrapped;$S;27|
              |LATMOFJ;toString;$S;25| (|OutputForm|) (36 . |coerce|)
              (41 . |coerce|) (46 . |hconcat|) |LATMOFJ;coerce;$Of;29|
              (|HashState|) (|SingleInteger|))
           '#(~= 52 |variable| 58 |value| 63 |toStringUnwrapped| 68 |toString|
              73 |redux| 78 |opType| 83 |meet| 88 |logicT| 93 |logicF| 97
              |latticeMeetOfJoins| 101 |latex| 106 |join| 111 |hashUpdate!| 116
              |hash| 122 |getChildren| 127 |factor| 132 |emptyLattice| 137
              |empty?| 141 |deductions| 146 |coerce| 151 |atom?| 156 |_\|_| 161
              |\\/| 165 T$ 171 = 175 |/\\| 181)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL NIL NIL NIL NIL |SetCategory&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|BoundedDistributiveLattice|) (|BoundedLattice|)
                      (|DistributiveLattice|) (|BoundedMeetSemilattice|)
                      (|Lattice|) (|BoundedJoinSemilattice|)
                      (|MeetSemilattice|) (|JoinSemilattice|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 43))
                   (|makeByteWordVec2| 49
                                       '(2 18 0 0 0 19 2 22 0 0 0 23 2 18 0 0
                                         22 24 2 13 16 0 0 29 2 22 0 0 13 30 2
                                         31 16 0 0 32 1 9 43 0 44 1 35 43 0 45
                                         2 43 0 0 0 46 2 0 16 0 0 1 1 0 0 9 10
                                         1 0 35 0 38 1 0 9 0 41 1 0 9 0 42 1 0
                                         0 0 20 1 0 35 0 36 1 0 0 26 27 0 0 0 7
                                         0 0 0 8 1 0 0 13 14 1 0 9 0 1 1 0 0 26
                                         28 2 0 48 48 0 1 1 0 49 0 1 1 0 26 0
                                         39 1 0 26 0 33 0 0 0 15 1 0 16 0 17 1
                                         0 26 26 34 1 0 43 0 47 1 0 16 0 37 0 0
                                         0 1 2 0 0 0 0 25 0 0 0 1 2 0 16 0 0 40
                                         2 0 0 0 0 21)))))
           '|lookupComplete|)) 

(MAKEPROP '|LatticeMeetOfJoins| 'NILADIC T) 
