
(PUT '|PENDTREE;coerce;%T;1| '|SPADreplace| '(XLAM (|t|) |t|)) 

(SDEFUN |PENDTREE;coerce;%T;1| ((|t| (%)) (% (|Tree| S))) |t|) 

(SDEFUN |PENDTREE;ptree;S%;2| ((|n| (S)) (% (%)))
        (SPADCALL |n| NIL (QREFELT % 11))) 

(SDEFUN |PENDTREE;ptree;3%;3| ((|l| (%)) (|r| (%)) (% (%)))
        (SPADCALL (SPADCALL |r| (QREFELT % 13))
                  (SPADCALL |l| (SPADCALL |r| (QREFELT % 14)) (QREFELT % 16))
                  (QREFELT % 11))) 

(SDEFUN |PENDTREE;leaf?;%B;4| ((|t| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |t| (QREFELT % 14)) (QREFELT % 19))) 

(SDEFUN |PENDTREE;=;2%B;5| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (SPADCALL |t1| |t2| (QREFELT % 21))) 

(SDEFUN |PENDTREE;left;2%;6| ((|b| (%)) (% (%)))
        (COND ((SPADCALL |b| (QREFELT % 20)) (|error| "ptree:no left"))
              ('T (SPADCALL (SPADCALL |b| (QREFELT % 14)) (QREFELT % 22))))) 

(SDEFUN |PENDTREE;right;2%;7| ((|b| (%)) (% (%)))
        (COND ((SPADCALL |b| (QREFELT % 20)) (|error| "ptree:no right"))
              ('T
               (SPADCALL (SPADCALL |b| (QREFELT % 13))
                         (SPADCALL (SPADCALL |b| (QREFELT % 14))
                                   (QREFELT % 24))
                         (QREFELT % 11))))) 

(SDEFUN |PENDTREE;value;%S;8| ((|b| (%)) (% (S)))
        (COND ((SPADCALL |b| (QREFELT % 20)) (SPADCALL |b| (QREFELT % 13)))
              ('T (|error| "the pendant tree has no value")))) 

(SDEFUN |PENDTREE;coerce;%Of;9| ((|b| (%)) (% (|OutputForm|)))
        (COND
         ((SPADCALL |b| (QREFELT % 20))
          (SPADCALL (SPADCALL |b| (QREFELT % 13)) (QREFELT % 28)))
         ('T
          (SPADCALL
           (SPADCALL
            (LIST (SPADCALL (SPADCALL |b| (QREFELT % 23)) (QREFELT % 29))
                  (SPADCALL (SPADCALL |b| (QREFELT % 25)) (QREFELT % 29)))
            (QREFELT % 30))
           (QREFELT % 31))))) 

(DECLAIM (NOTINLINE |PendantTree;|)) 

(DEFUN |PendantTree;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G20 NIL) (#2=#:G21 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|PendantTree| DV$1))
    (LETT % (GETREFV 44))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #2#))))))
    (|haddProp| |$ConstructorCache| '|PendantTree| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 64))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 128))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 256))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| % 512))
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 1024))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Tree| |#1|))
    %))) 

(DEFUN |PendantTree| (#1=#:G22)
  (SPROG NIL
         (PROG (#2=#:G23)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PendantTree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PendantTree;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|PendantTree|)))))))))) 

(MAKEPROP '|PendantTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Tree| 6)
              |PENDTREE;coerce;%T;1| (|List| %) (0 . |tree|)
              |PENDTREE;ptree;S%;2| (6 . |value|) (11 . |children|) (|List| $$)
              (16 . |cons|) |PENDTREE;ptree;3%;3| (|Boolean|) (22 . |empty?|)
              |PENDTREE;leaf?;%B;4| |PENDTREE;=;2%B;5| (27 . |first|)
              |PENDTREE;left;2%;6| (32 . |rest|) |PENDTREE;right;2%;7|
              |PENDTREE;value;%S;8| (|OutputForm|) (37 . |coerce|)
              |PENDTREE;coerce;%Of;9| (42 . |blankSeparate|) (47 . |paren|)
              (|NonNegativeInteger|) (|Mapping| 6 6) '"value" (|List| 6)
              (|Integer|) '"left" '"right" (|Equation| 6) (|List| 39)
              (|Mapping| 18 6) (|Mapping| 18 6 6) (|String|))
           '#(~= 52 |value| 58 |size?| 63 |setvalue!| 69 |setright!| 75
              |setleft!| 81 |setelt!| 87 |setchildren!| 108 |sample| 114
              |right| 118 |ptree| 123 |parts| 134 |nodes| 139 |node?| 144
              |more?| 150 |min| 156 |members| 161 |member?| 166 |max| 172
              |map!| 183 |map| 189 |less?| 195 |left| 201 |leaves| 206 |leaf?|
              211 |latex| 216 |every?| 221 |eval| 227 |eq?| 253 |empty?| 259
              |empty| 264 |elt| 268 |distance| 286 |cyclic?| 292 |count| 297
              |copy| 309 |coerce| 314 |children| 324 |child?| 329 |any?| 335 =
              341 |#| 347)
           'NIL
           (CONS (|makeByteWordVec2| 6 '(0 0 0 1 2 0 6 1 2 0))
                 (CONS
                  '#(|BinaryRecursiveAggregate&| |RecursiveAggregate&|
                     |HomogeneousAggregate&| |SetCategory&| |Evalable&|
                     |Aggregate&| NIL |BasicType&| |InnerEvalable&| NIL)
                  (CONS
                   '#((|BinaryRecursiveAggregate| 6) (|RecursiveAggregate| 6)
                      (|HomogeneousAggregate| 6) (|SetCategory|) (|Evalable| 6)
                      (|Aggregate|) (|CoercibleTo| 27) (|BasicType|)
                      (|InnerEvalable| 6 6) (|Type|))
                   (|makeByteWordVec2| 43
                                       '(2 7 0 6 10 11 1 7 6 0 13 1 7 10 0 14 2
                                         15 0 2 0 16 1 15 18 0 19 1 15 2 0 22 1
                                         15 0 0 24 1 6 27 0 28 1 27 0 10 30 1
                                         27 0 0 31 2 10 18 0 0 1 1 0 6 0 26 2 0
                                         18 0 32 1 2 11 6 0 6 1 2 11 0 0 0 1 2
                                         11 0 0 0 1 3 11 6 0 34 6 1 3 11 0 0 37
                                         0 1 3 11 0 0 38 0 1 2 11 0 0 10 1 0 0
                                         0 1 1 0 0 0 25 2 0 0 0 0 17 1 0 0 6 12
                                         1 7 35 0 1 1 0 10 0 1 2 4 18 0 0 1 2 0
                                         18 0 32 1 1 8 6 0 1 1 7 35 0 1 2 9 18
                                         6 0 1 1 8 6 0 1 2 7 6 42 0 1 2 11 0 33
                                         0 1 2 0 0 33 0 1 2 0 18 0 32 1 1 0 0 0
                                         23 1 0 35 0 1 1 0 18 0 20 1 1 43 0 1 2
                                         7 18 41 0 1 2 2 0 0 39 1 2 2 0 0 40 1
                                         3 2 0 0 6 6 1 3 2 0 0 35 35 1 2 0 18 0
                                         0 1 1 0 18 0 1 0 0 0 1 2 0 6 0 34 1 2
                                         0 0 0 37 1 2 0 0 0 38 1 2 0 36 0 0 1 1
                                         0 18 0 1 2 9 32 6 0 1 2 7 32 41 0 1 1
                                         0 0 0 1 1 0 8 0 9 1 5 27 0 29 1 0 10 0
                                         1 2 4 18 0 0 1 2 7 18 41 0 1 2 10 18 0
                                         0 21 1 7 32 0 1)))))
           '|lookupComplete|)) 
