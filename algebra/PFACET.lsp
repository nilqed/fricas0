
(PUT '|PFACET;productFacet;IL$;1| '|SPADreplace| 'CONS) 

(SDEFUN |PFACET;productFacet;IL$;1|
        ((|mul1| |Integer|)
         (|ind1| |List|
          (|Record| (|:| |left| (|NonNegativeInteger|))
                    (|:| |right| (|NonNegativeInteger|))))
         ($ $))
        (CONS |mul1| |ind1|)) 

(SDEFUN |PFACET;productFacet;I2$;2|
        ((|mul1| |Integer|) (|other| |ProductFacet|) ($ $))
        (CONS |mul1| (SPADCALL |other| (QREFELT $ 12)))) 

(PUT '|PFACET;getIndexs;$L;3| '|SPADreplace| 'QCDR) 

(SDEFUN |PFACET;getIndexs;$L;3|
        ((|orf| $)
         ($ |List|
          (|Record| (|:| |left| (|NonNegativeInteger|))
                    (|:| |right| (|NonNegativeInteger|)))))
        (QCDR |orf|)) 

(SDEFUN |PFACET;getMaxLeft;$Nni;4| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G722 NIL) (|index| NIL)
          (|indexes|
           (|List|
            (|Record| (|:| |left| (|NonNegativeInteger|))
                      (|:| |right| (|NonNegativeInteger|))))))
         (SEQ (LETT |m| 0 . #2=(|PFACET;getMaxLeft;$Nni;4|))
              (LETT |indexes| (SPADCALL |orf| (QREFELT $ 14)) . #2#)
              (SEQ (LETT |index| NIL . #2#) (LETT #1# |indexes| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |index| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QCAR |index|) |m| (QREFELT $ 17))
                       (LETT |m| (QCAR |index|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |PFACET;getMaxRight;$Nni;5| ((|orf| $) ($ |NonNegativeInteger|))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#1=#:G729 NIL) (|index| NIL)
          (|indexes|
           (|List|
            (|Record| (|:| |left| (|NonNegativeInteger|))
                      (|:| |right| (|NonNegativeInteger|))))))
         (SEQ (LETT |m| 0 . #2=(|PFACET;getMaxRight;$Nni;5|))
              (LETT |indexes| (SPADCALL |orf| (QREFELT $ 14)) . #2#)
              (SEQ (LETT |index| NIL . #2#) (LETT #1# |indexes| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |index| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QCDR |index|) |m| (QREFELT $ 17))
                       (LETT |m| (QCDR |index|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |PFACET;order;$Nni;6| ((|f| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL |f| (QREFELT $ 14)))) 

(PUT '|PFACET;getMult;$I;7| '|SPADreplace| 'QCAR) 

(SDEFUN |PFACET;getMult;$I;7| ((|orf| $) ($ |Integer|)) (QCAR |orf|)) 

(SDEFUN |PFACET;setMult!;$I$;8| ((|orf| $) (|m| |Integer|) ($ $))
        (SEQ (PROGN (RPLACA |orf| |m|) (QCAR |orf|)) (EXIT |orf|))) 

(SDEFUN |PFACET;addVertex2;$R$;9|
        ((|sa| $)
         (|v| |Record| (|:| |left| (|NonNegativeInteger|))
          (|:| |right| (|NonNegativeInteger|)))
         ($ $))
        (SPROG
         ((|f|
           (|List|
            (|Record| (|:| |left| (|NonNegativeInteger|))
                      (|:| |right| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |f| (SPADCALL |sa| (QREFELT $ 14))
                . #1=(|PFACET;addVertex2;$R$;9|))
          (LETT |f| (SPADCALL |f| |v| (QREFELT $ 23)) . #1#)
          (EXIT (SPADCALL 1 |f| (QREFELT $ 10)))))) 

(SDEFUN |PFACET;=;2$B;10| ((|a| $) (|b| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G762 NIL) (#2=#:G763 NIL) (|inda| NIL) (#3=#:G764 NIL)
          (|indb| NIL)
          (|indbs|
           #4=(|List|
               (|Record| (|:| |left| (|NonNegativeInteger|))
                         (|:| |right| (|NonNegativeInteger|)))))
          (|indas| #4#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT $ 25))
              (PROGN (LETT #1# NIL . #5=(|PFACET;=;2$B;10|)) (GO #6=#:G761))))
            (LETT |indas| (SPADCALL |a| (QREFELT $ 14)) . #5#)
            (LETT |indbs| (SPADCALL |b| (QREFELT $ 14)) . #5#)
            (COND
             ((SPADCALL (LENGTH |indas|) (LENGTH |indbs|) (QREFELT $ 25))
              (PROGN (LETT #1# NIL . #5#) (GO #6#))))
            (SEQ (LETT |indb| NIL . #5#) (LETT #3# |indbs| . #5#)
                 (LETT |inda| NIL . #5#) (LETT #2# |indas| . #5#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |inda| (CAR #2#) . #5#) NIL)
                       (ATOM #3#) (PROGN (LETT |indb| (CAR #3#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |inda|) (QCAR |indb|) (QREFELT $ 25))
                    (PROGN (LETT #1# NIL . #5#) (GO #6#))))
                  (EXIT
                   (COND
                    ((SPADCALL (QCDR |inda|) (QCDR |indb|) (QREFELT $ 25))
                     (PROGN (LETT #1# NIL . #5#) (GO #6#))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#)) . #5#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #6# (EXIT #1#)))) 

(SDEFUN |PFACET;coerce;$Of;11| ((|s| $) ($ |OutputForm|))
        (SPROG
         ((|body| (|OutputForm|)) (|elements| (|List| (|OutputForm|)))
          (|element| (|OutputForm|)) (|r| (|NonNegativeInteger|))
          (|l| (|NonNegativeInteger|)) (#1=#:G773 NIL) (|x| NIL)
          (|prefix| (|OutputForm|)) (|m| (|Integer|)))
         (SEQ
          (LETT |prefix| (SPADCALL "" (QREFELT $ 29))
                . #2=(|PFACET;coerce;$Of;11|))
          (LETT |m| (QCAR |s|) . #2#)
          (COND
           ((SPADCALL (ABS |m|) 1 (QREFELT $ 25))
            (LETT |prefix|
                  (SPADCALL (SPADCALL |m| (QREFELT $ 30))
                            (SPADCALL "*" (QREFELT $ 29)) (QREFELT $ 31))
                  . #2#)))
          (COND
           ((EQL |m| -1) (LETT |prefix| (SPADCALL "-" (QREFELT $ 29)) . #2#)))
          (LETT |elements| NIL . #2#)
          (SEQ (LETT |x| NIL . #2#) (LETT #1# (QCDR |s|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |l| (QCAR |x|) . #2#) (LETT |r| (QCDR |x|) . #2#)
                    (LETT |element|
                          (SPADCALL
                           (LIST (SPADCALL |l| (QREFELT $ 32))
                                 (SPADCALL |r| (QREFELT $ 32)))
                           (QREFELT $ 34))
                          . #2#)
                    (EXIT
                     (LETT |elements|
                           (SPADCALL |elements| |element| (QREFELT $ 36))
                           . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |body| (SPADCALL |elements| (QREFELT $ 37)) . #2#)
          (EXIT (SPADCALL |prefix| |body| (QREFELT $ 31)))))) 

(DECLAIM (NOTINLINE |ProductFacet;|)) 

(DEFUN |ProductFacet| ()
  (SPROG NIL
         (PROG (#1=#:G777)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ProductFacet|)
                    . #2=(|ProductFacet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ProductFacet|
                             (LIST (CONS NIL (CONS 1 (|ProductFacet;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|ProductFacet|)))))))))) 

(DEFUN |ProductFacet;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ProductFacet|) . #1=(|ProductFacet|))
          (LETT $ (GETREFV 41) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ProductFacet| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |mul| (|Integer|))
                              (|:| |ind|
                                   (|List|
                                    (|Record|
                                     (|:| |left| (|NonNegativeInteger|))
                                     (|:| |right| (|NonNegativeInteger|)))))))
          $))) 

(MAKEPROP '|ProductFacet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Integer|)
              (|Record| (|:| |left| 16) (|:| |right| 16)) (|List| 8)
              |PFACET;productFacet;IL$;1| (|ProductFacet|) (0 . |getIndexs|)
              |PFACET;productFacet;I2$;2| |PFACET;getIndexs;$L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . >) |PFACET;getMaxLeft;$Nni;4|
              |PFACET;getMaxRight;$Nni;5| |PFACET;order;$Nni;6|
              |PFACET;getMult;$I;7| |PFACET;setMult!;$I$;8| (11 . |concat|)
              |PFACET;addVertex2;$R$;9| (17 . ~=) |PFACET;=;2$B;10| (|String|)
              (|OutputForm|) (23 . |message|) (28 . |coerce|) (33 . |hconcat|)
              (39 . |coerce|) (|List| $) (44 . |bracket|) (|List| 28)
              (49 . |concat|) (55 . |paren|) |PFACET;coerce;$Of;11|
              (|SingleInteger|) (|HashState|))
           '#(~= 60 |smaller?| 66 |setMult!| 72 |productFacet| 78 |order| 90
              |min| 95 |max| 101 |latex| 107 |hashUpdate!| 112 |hash| 118
              |getMult| 123 |getMaxRight| 128 |getMaxLeft| 133 |getIndexs| 138
              |empty?| 143 |coerce| 148 |addVertex2| 153 >= 159 > 165 = 171 <=
              177 < 183)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|FacetCategory&| |OrderedSet&| NIL |SetCategory&|
                     |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|FacetCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|PartialOrder|) (|BasicType|)
                      (|CoercibleTo| 28))
                   (|makeByteWordVec2| 40
                                       '(1 11 9 0 12 2 16 15 0 0 17 2 9 0 0 8
                                         23 2 7 15 0 0 25 1 28 0 27 29 1 7 28 0
                                         30 2 28 0 0 0 31 1 16 28 0 32 1 28 0
                                         33 34 2 35 0 0 28 36 1 28 0 33 37 2 0
                                         15 0 0 1 2 0 15 0 0 1 2 0 0 0 7 22 2 0
                                         0 7 11 13 2 0 0 7 9 10 1 0 16 0 20 2 0
                                         0 0 0 1 2 0 0 0 0 1 1 0 27 0 1 2 0 40
                                         40 0 1 1 0 39 0 1 1 0 7 0 21 1 0 16 0
                                         19 1 0 16 0 18 1 0 9 0 14 1 0 15 0 1 1
                                         0 28 0 38 2 0 0 0 8 24 2 0 15 0 0 1 2
                                         0 15 0 0 1 2 0 15 0 0 26 2 0 15 0 0 1
                                         2 0 15 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ProductFacet| 'NILADIC T) 
