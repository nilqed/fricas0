
(SDEFUN |EXP3D;faceIndex|
        ((|subSp| |SubSpace| 3 (|DoubleFloat|))
         ($ |List| (|NonNegativeInteger|)))
        (SPROG
         ((|faceIndexList| (|List| (|NonNegativeInteger|))) (#1=#:G710 NIL)
          (|poly| NIL))
         (SEQ (LETT |faceIndexList| NIL . #2=(|EXP3D;faceIndex|))
              (SEQ (LETT |poly| NIL . #2#)
                   (LETT #1# (SPADCALL |subSp| (QREFELT $ 8)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |poly| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |faceIndexList|
                           (CONS (SPADCALL |poly| (QREFELT $ 10))
                                 |faceIndexList|)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (REVERSE |faceIndexList|))))) 

(SDEFUN |EXP3D;writePolygon|
        ((|f1| |TextFile|) (|curves| |List| (|SubSpace| 3 (|DoubleFloat|)))
         ($ |Void|))
        (SPROG
         ((|s| (|String|)) (#1=#:G718 NIL) (|i| NIL)
          (|faceIndexList| (|List| (|NonNegativeInteger|))) (#2=#:G717 NIL)
          (|curve| NIL))
         (SEQ (LETT |faceIndexList| NIL . #3=(|EXP3D;writePolygon|))
              (SEQ (LETT |curve| NIL . #3#) (LETT #2# |curves| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |curve| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |faceIndexList|
                           (SPADCALL |faceIndexList|
                                     (|EXP3D;faceIndex| |curve| $)
                                     (QREFELT $ 12))
                           . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (LETT |s| "f " . #3#)
              (SEQ (LETT |i| NIL . #3#) (LETT #1# |faceIndexList| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (STRCONC |s| (STRINGIMAGE |i|)) . #3#)
                        (EXIT (LETT |s| (STRCONC |s| " ") . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |f1| |s| (QREFELT $ 15)))))) 

(SDEFUN |EXP3D;writeMesh|
        ((|f1| |TextFile|) (|curves| |List| (|SubSpace| 3 (|DoubleFloat|)))
         ($ |Void|))
        (SPROG
         ((|s| (|String|)) (#1=#:G737 NIL) (|j| NIL) (#2=#:G736 NIL) (|i| NIL)
          (|colLength| (|NonNegativeInteger|))
          (|rowLength| (|NonNegativeInteger|))
          (|meshIndexArray| (|List| (|List| (|NonNegativeInteger|))))
          (#3=#:G735 NIL) (|curve| NIL))
         (SEQ (LETT |meshIndexArray| NIL . #4=(|EXP3D;writeMesh|))
              (SEQ (LETT |curve| NIL . #4#) (LETT #3# |curves| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |curve| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |meshIndexArray|
                           (CONS (|EXP3D;faceIndex| |curve| $)
                                 |meshIndexArray|)
                           . #4#)))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |meshIndexArray| (REVERSE |meshIndexArray|) . #4#)
              (LETT |rowLength| (LENGTH |meshIndexArray|) . #4#)
              (LETT |colLength|
                    (SPADCALL (SPADCALL |meshIndexArray| 1 (QREFELT $ 18))
                              (QREFELT $ 19))
                    . #4#)
              (EXIT
               (SEQ (LETT |i| 1 . #4#) (LETT #2# (- |rowLength| 1) . #4#) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |j| 1 . #4#)
                           (LETT #1# (- |colLength| 1) . #4#) G190
                           (COND ((|greater_SI| |j| #1#) (GO G191)))
                           (SEQ
                            (LETT |s|
                                  (SPADCALL
                                   (LIST "f "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| |i|
                                                     (QREFELT $ 18))
                                           |j| (QREFELT $ 20)))
                                         " "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| (+ |i| 1)
                                                     (QREFELT $ 18))
                                           |j| (QREFELT $ 20)))
                                         " "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| (+ |i| 1)
                                                     (QREFELT $ 18))
                                           (+ |j| 1) (QREFELT $ 20)))
                                         " "
                                         (STRINGIMAGE
                                          (SPADCALL
                                           (SPADCALL |meshIndexArray| |i|
                                                     (QREFELT $ 18))
                                           (+ |j| 1) (QREFELT $ 20))))
                                   (QREFELT $ 21))
                                  . #4#)
                            (EXIT (SPADCALL |f1| |s| (QREFELT $ 15))))
                           (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191
                           (EXIT NIL))))
                    (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                    (EXIT NIL)))))) 

(SDEFUN |EXP3D;toString| ((|d| |DoubleFloat|) ($ |String|))
        (SPADCALL (SPADCALL |d| (QREFELT $ 24)) (QREFELT $ 25))) 

(SDEFUN |EXP3D;writeObj;SsSV;5|
        ((|subSp| |SubSpace| 3 (|DoubleFloat|)) (|filename| |String|)
         ($ |Void|))
        (SPROG
         ((|curves| (|List| (|SubSpace| 3 (|DoubleFloat|)))) (#1=#:G749 NIL)
          (|component| NIL) (#2=#:G748 NIL) (|v| NIL)
          (|verts| (|List| (|Point| (|DoubleFloat|)))) (|f1| (|TextFile|)))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT $ 27)) "output"
                          (QREFELT $ 28))
                . #3=(|EXP3D;writeObj;SsSV;5|))
          (SPADCALL |f1| "# mesh generated by axiom" (QREFELT $ 15))
          (LETT |verts| (SPADCALL |subSp| (QREFELT $ 30)) . #3#)
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |verts| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((< (SPADCALL |v| (QREFELT $ 32)) 3)
                   (|error| "Can't write OBJ file from 2D points"))
                  ('T
                   (SPADCALL |f1|
                             (SPADCALL
                              (LIST "v "
                                    (|EXP3D;toString|
                                     (SPADCALL |v| 1 (QREFELT $ 33)) $)
                                    " "
                                    (|EXP3D;toString|
                                     (SPADCALL |v| 2 (QREFELT $ 33)) $)
                                    " "
                                    (|EXP3D;toString|
                                     (SPADCALL |v| 3 (QREFELT $ 33)) $))
                              (QREFELT $ 21))
                             (QREFELT $ 15))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |component| NIL . #3#)
               (LETT #1# (SPADCALL |subSp| (QREFELT $ 8)) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |component| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |curves| (SPADCALL |component| (QREFELT $ 8)) . #3#)
                    (COND
                     ((< (LENGTH |curves|) 2)
                      (|sayBrightly|
                       "Can't write point or curve to OBJ file")))
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |curves|) 1 (QREFELT $ 35))
                       (SEQ
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |curves| 1 (QREFELT $ 37))
                                     (QREFELT $ 38))
                           1)
                          (|EXP3D;writePolygon| |f1| |curves| $)))
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |curves| 1 (QREFELT $ 37))
                                      (QREFELT $ 38))
                            1 (QREFELT $ 35))
                           (|EXP3D;writeMesh| |f1| |curves| $)))))))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT $ 39)))))) 

(DECLAIM (NOTINLINE |Export3D;|)) 

(DEFUN |Export3D| ()
  (SPROG NIL
         (PROG (#1=#:G751)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Export3D|)
                    . #2=(|Export3D|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Export3D|
                             (LIST (CONS NIL (CONS 1 (|Export3D;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Export3D|)))))))))) 

(DEFUN |Export3D;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Export3D|) . #1=(|Export3D|))
          (LETT $ (GETREFV 42) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Export3D| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|Export3D| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $) (|SubSpace| '3 23)
              (0 . |children|) (|NonNegativeInteger|) (5 . |extractIndex|)
              (|List| 9) (10 . |append|) (|String|) (|TextFile|)
              (16 . |writeLine!|) (|Integer|) (|List| 11) (22 . |elt|)
              (28 . |#|) (33 . |elt|) (39 . |concat|) (|InputForm|)
              (|DoubleFloat|) (44 . |convert|) (49 . |unparse|) (|FileName|)
              (54 . |coerce|) (59 . |open|) (|List| 31) (65 . |pointData|)
              (|Point| 23) (70 . |#|) (75 . |elt|) (|Boolean|) (81 . >)
              (|List| 7) (87 . |elt|) (93 . |numberOfChildren|) (98 . |close!|)
              (|Void|) |EXP3D;writeObj;SsSV;5|)
           '#(|writeObj| 103) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 41
                                                 '(1 7 6 0 8 1 7 9 0 10 2 11 0
                                                   0 0 12 2 14 13 0 13 15 2 17
                                                   11 0 16 18 1 11 9 0 19 2 11
                                                   9 0 16 20 1 13 0 6 21 1 23
                                                   22 0 24 1 22 13 0 25 1 26 0
                                                   13 27 2 14 0 26 13 28 1 7 29
                                                   0 30 1 31 9 0 32 2 31 23 0
                                                   16 33 2 9 34 0 0 35 2 36 7 0
                                                   16 37 1 7 9 0 38 1 14 0 0 39
                                                   2 0 40 7 13 41)))))
           '|lookupComplete|)) 

(MAKEPROP '|Export3D| 'NILADIC T) 
