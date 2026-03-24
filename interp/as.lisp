
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $docHash  := MAKE_HASHTABLE('EQUAL)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$docHash| (MAKE_HASHTABLE 'EQUAL)))

; $conHash  := MAKE_HASHTABLE('EQUAL)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$conHash| (MAKE_HASHTABLE 'EQUAL)))

; $opHash   := MAKE_HASHTABLE('EQUAL)

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$opHash| (MAKE_HASHTABLE 'EQUAL)))

; $asyPrint := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$asyPrint| NIL))

; astran asyFile ==
; --global hash tables for new compiler
;   $docHash  := MAKE_HASHTABLE('EQUAL)
;   $conHash := MAKE_HASHTABLE('EQUAL)
;   $constantHash := MAKE_HASHTABLE('EQUAL)
;   $niladics : local := nil
;   $asyFile: local := asyFile
;   $asFilename: local := STRCONC(PATHNAME_-NAME asyFile,'".as")
;   asytran asyFile
;   conlist := [x for x in HKEYS $conHash | HGET($conHash,x) isnt [.,.,"function",:.]]
;   $mmAlist : local :=
;     [[con,:asyConstructorModemap con] for con in conlist]
;   $docAlist : local :=
;     [[con,:REMDUP asyDocumentation con] for con in conlist]
;   $parentsHash : local := MAKE_HASHTABLE('EQUAL)
;   for con in conlist repeat
;     parents := asyParents con
;     HPUT($parentsHash,con,asyParents con)
;   $newConlist := union(conlist, $newConlist)
;   [[x,:asMakeAlist x] for x in HKEYS $conHash]

(DEFUN |astran| (|asyFile|)
  (PROG (|$parentsHash| |$docAlist| |$mmAlist| |$asFilename| |$asyFile|
         |$niladics| |parents| |conlist| |ISTMP#3| |ISTMP#2| |ISTMP#1|)
    (DECLARE
     (SPECIAL |$parentsHash| |$docAlist| |$mmAlist| |$asFilename| |$asyFile|
      |$niladics|))
    (RETURN
     (PROGN
      (SETQ |$docHash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$conHash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$constantHash| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$niladics| NIL)
      (SETQ |$asyFile| |asyFile|)
      (SETQ |$asFilename| (STRCONC (PATHNAME-NAME |asyFile|) ".as"))
      (|asytran| |asyFile|)
      (SETQ |conlist|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1='T
                    (AND
                     (NOT
                      (PROGN
                       (SETQ |ISTMP#1| (HGET |$conHash| |x|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|)
                                  (PROGN
                                   (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                   (AND (CONSP |ISTMP#3|)
                                        (EQ (CAR |ISTMP#3|) '|function|))))))))
                     (SETQ |bfVar#2| (CONS |x| |bfVar#2|)))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL (HKEYS |$conHash|) NIL))
      (SETQ |$mmAlist|
              ((LAMBDA (|bfVar#4| |bfVar#3| |con|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#3|)
                        (PROGN (SETQ |con| (CAR |bfVar#3|)) NIL))
                    (RETURN (NREVERSE |bfVar#4|)))
                   (#1#
                    (SETQ |bfVar#4|
                            (CONS (CONS |con| (|asyConstructorModemap| |con|))
                                  |bfVar#4|))))
                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
               NIL |conlist| NIL))
      (SETQ |$docAlist|
              ((LAMBDA (|bfVar#6| |bfVar#5| |con|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#5|)
                        (PROGN (SETQ |con| (CAR |bfVar#5|)) NIL))
                    (RETURN (NREVERSE |bfVar#6|)))
                   (#1#
                    (SETQ |bfVar#6|
                            (CONS
                             (CONS |con| (REMDUP (|asyDocumentation| |con|)))
                             |bfVar#6|))))
                  (SETQ |bfVar#5| (CDR |bfVar#5|))))
               NIL |conlist| NIL))
      (SETQ |$parentsHash| (MAKE_HASHTABLE 'EQUAL))
      ((LAMBDA (|bfVar#7| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#7|) (PROGN (SETQ |con| (CAR |bfVar#7|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |parents| (|asyParents| |con|))
             (HPUT |$parentsHash| |con| (|asyParents| |con|)))))
          (SETQ |bfVar#7| (CDR |bfVar#7|))))
       |conlist| NIL)
      (SETQ |$newConlist| (|union| |conlist| |$newConlist|))
      ((LAMBDA (|bfVar#9| |bfVar#8| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
            (RETURN (NREVERSE |bfVar#9|)))
           (#1#
            (SETQ |bfVar#9| (CONS (CONS |x| (|asMakeAlist| |x|)) |bfVar#9|))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       NIL (HKEYS |$conHash|) NIL)))))

; asyParents(conform) ==
;   acc := nil
;   con:= opOf conform
;   modemap := LASSOC(con,$mmAlist)
;   $constructorCategory :local := asySubstMapping CADAR modemap
;   for x in folks $constructorCategory repeat
;     acc := [:explodeIfs x,:acc]
;   NREVERSE acc

(DEFUN |asyParents| (|conform|)
  (PROG (|$constructorCategory| |modemap| |con| |acc|)
    (DECLARE (SPECIAL |$constructorCategory|))
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      (SETQ |con| (|opOf| |conform|))
      (SETQ |modemap| (LASSOC |con| |$mmAlist|))
      (SETQ |$constructorCategory| (|asySubstMapping| (CADAR |modemap|)))
      ((LAMBDA (|bfVar#10| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#10|) (PROGN (SETQ |x| (CAR |bfVar#10|)) NIL))
            (RETURN NIL))
           ('T (SETQ |acc| (APPEND (|explodeIfs| |x|) |acc|))))
          (SETQ |bfVar#10| (CDR |bfVar#10|))))
       (|folks| |$constructorCategory|) NIL)
      (NREVERSE |acc|)))))

; asySubstMapping u ==
;   u is [op,:r] =>
;     op = "->" =>
;        [s, t] := r
;        args :=
;           s is [op,:u] and asyComma? op => [asySubstMapping y for y in u]
;           [asySubstMapping s]
;        ['Mapping, asySubstMapping t, :args]
;     [asySubstMapping x for x in u]
;   u

(DEFUN |asySubstMapping| (|u|)
  (PROG (|op| |r| |s| |t| |args|)
    (RETURN
     (COND
      ((AND (CONSP |u|)
            (PROGN (SETQ |op| (CAR |u|)) (SETQ |r| (CDR |u|)) #1='T))
       (COND
        ((EQ |op| '->)
         (PROGN
          (SETQ |s| (CAR |r|))
          (SETQ |t| (CADR |r|))
          (SETQ |args|
                  (COND
                   ((AND (CONSP |s|)
                         (PROGN (SETQ |op| (CAR |s|)) (SETQ |u| (CDR |s|)) #1#)
                         (|asyComma?| |op|))
                    ((LAMBDA (|bfVar#12| |bfVar#11| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#11|)
                              (PROGN (SETQ |y| (CAR |bfVar#11|)) NIL))
                          (RETURN (NREVERSE |bfVar#12|)))
                         (#1#
                          (SETQ |bfVar#12|
                                  (CONS (|asySubstMapping| |y|) |bfVar#12|))))
                        (SETQ |bfVar#11| (CDR |bfVar#11|))))
                     NIL |u| NIL))
                   (#1# (LIST (|asySubstMapping| |s|)))))
          (CONS '|Mapping| (CONS (|asySubstMapping| |t|) |args|))))
        (#1#
         ((LAMBDA (|bfVar#14| |bfVar#13| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#13|) (PROGN (SETQ |x| (CAR |bfVar#13|)) NIL))
               (RETURN (NREVERSE |bfVar#14|)))
              (#1#
               (SETQ |bfVar#14| (CONS (|asySubstMapping| |x|) |bfVar#14|))))
             (SETQ |bfVar#13| (CDR |bfVar#13|))))
          NIL |u| NIL))))
      (#1# |u|)))))

; asyMkSignature(con,sig) ==
; -- following line converts constants into nullary functions
;   atom sig => ['SIGNATURE,con,[sig]]
;   ['SIGNATURE,con,sig]

(DEFUN |asyMkSignature| (|con| |sig|)
  (PROG ()
    (RETURN
     (COND ((ATOM |sig|) (LIST 'SIGNATURE |con| (LIST |sig|)))
           ('T (LIST 'SIGNATURE |con| |sig|))))))

; asMakeAlist con ==
;   record := HGET($conHash,con)
;   [form,sig,predlist,kind,exposure,comments,typeCode,:filename] := first record
; --TTT in case we put the wrong thing in for niladic catgrs
;   if ATOM(form) then form:=[form]
;   kind = 'function => asMakeAlistForFunction con
;   abb := asyAbbreviation(con, #(IFCDR sig))
;   modemap := asySubstMapping LASSOC(con,$mmAlist)
;   $constructorCategory :local := CADAR modemap
;   parents := mySort HGET($parentsHash,con)
;   alists  := HGET($opHash,con)
;   opAlist := SUBLISLIS($FormalMapVariableList, IFCDR form, CDDR alists)
;   ancestorAlist := SUBLISLIS($FormalMapVariableList, IFCDR form, first alists)
;   catAttrs := [[x,:true] for x in getAttributesFromCATEGORY $constructorCategory]
;   attributeAlist := REMDUP [:CADR alists,:catAttrs]
;   documentation :=
;       SUBLISLIS($FormalMapVariableList, IFCDR form, LASSOC(con, $docAlist))
;   filestring := STRCONC(PATHNAME_-NAME STRINGIMAGE filename,'".as")
;   constantPart := HGET($constantHash,con) and [['constant,:true]]
;   niladicPart := MEMQ(con,$niladics) and [['NILADIC,:true]]
;   falist := TAKE(#IFCDR form, $FormalMapVariableList)
;   constructorCategory :=
;     kind = 'category =>
;       talist := TAKE(#IFCDR form, $TriangleVariableList)
;       SUBLISLIS(talist, falist, $constructorCategory)
;     SUBLISLIS(falist, IFCDR form, $constructorCategory)
;   if constructorCategory='Category then kind := 'category
;   exportAlist := asGetExports(kind, form, constructorCategory)
;   constructorModemap  := SUBLISLIS(falist, IFCDR form, modemap)
; --TTT fix a niladic category constructormodemap (remove the joins)
;   if kind = 'category then
;      SETF(CADAR(constructorModemap),['Category])
;   res := [['constructorForm,:form],:constantPart,:niladicPart,
;            ['constructorKind,:kind],
;              ['constructorModemap,:constructorModemap],
;               ['abbreviation,:abb],
;                ['constructorCategory,:constructorCategory],
;                 ['parents,:parents],
;                  ['attributes,:attributeAlist],
;                   ['ancestors,:ancestorAlist],
;                    --                ['children,:children],
;                    ['sourceFile,:filestring],
;                     ['operationAlist,:zeroOneConversion opAlist],
;                      ['modemaps,:asGetModemaps(exportAlist,form,kind,modemap)],
;                        ['sourcefile,:$asFilename],
;                          ['typeCode,:typeCode],
;                           ['documentation,:documentation]]
;   if $asyPrint then asyDisplay(con,res)
;   res

(DEFUN |asMakeAlist| (|con|)
  (PROG (|$constructorCategory| |res| |constructorModemap| |exportAlist|
         |constructorCategory| |talist| |falist| |niladicPart| |constantPart|
         |filestring| |documentation| |attributeAlist| |catAttrs|
         |ancestorAlist| |opAlist| |alists| |parents| |modemap| |abb|
         |filename| |typeCode| |comments| |exposure| |kind| |predlist| |sig|
         |form| |LETTMP#1| |record|)
    (DECLARE (SPECIAL |$constructorCategory|))
    (RETURN
     (PROGN
      (SETQ |record| (HGET |$conHash| |con|))
      (SETQ |LETTMP#1| (CAR |record|))
      (SETQ |form| (CAR |LETTMP#1|))
      (SETQ |sig| (CADR . #1=(|LETTMP#1|)))
      (SETQ |predlist| (CADDR . #1#))
      (SETQ |kind| (CADDDR . #1#))
      (SETQ |exposure| (CAR #2=(CDDDDR . #1#)))
      (SETQ |comments| (CADR . #3=(#2#)))
      (SETQ |typeCode| (CADDR . #3#))
      (SETQ |filename| (CDDDR . #3#))
      (COND ((ATOM |form|) (SETQ |form| (LIST |form|))))
      (COND ((EQ |kind| '|function|) (|asMakeAlistForFunction| |con|))
            (#4='T
             (PROGN
              (SETQ |abb| (|asyAbbreviation| |con| (LENGTH (IFCDR |sig|))))
              (SETQ |modemap| (|asySubstMapping| (LASSOC |con| |$mmAlist|)))
              (SETQ |$constructorCategory| (CADAR |modemap|))
              (SETQ |parents| (|mySort| (HGET |$parentsHash| |con|)))
              (SETQ |alists| (HGET |$opHash| |con|))
              (SETQ |opAlist|
                      (SUBLISLIS |$FormalMapVariableList| (IFCDR |form|)
                       (CDDR |alists|)))
              (SETQ |ancestorAlist|
                      (SUBLISLIS |$FormalMapVariableList| (IFCDR |form|)
                       (CAR |alists|)))
              (SETQ |catAttrs|
                      ((LAMBDA (|bfVar#16| |bfVar#15| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#15|)
                                (PROGN (SETQ |x| (CAR |bfVar#15|)) NIL))
                            (RETURN (NREVERSE |bfVar#16|)))
                           (#4#
                            (SETQ |bfVar#16| (CONS (CONS |x| T) |bfVar#16|))))
                          (SETQ |bfVar#15| (CDR |bfVar#15|))))
                       NIL (|getAttributesFromCATEGORY| |$constructorCategory|)
                       NIL))
              (SETQ |attributeAlist|
                      (REMDUP (APPEND (CADR |alists|) |catAttrs|)))
              (SETQ |documentation|
                      (SUBLISLIS |$FormalMapVariableList| (IFCDR |form|)
                       (LASSOC |con| |$docAlist|)))
              (SETQ |filestring|
                      (STRCONC (PATHNAME-NAME (STRINGIMAGE |filename|)) ".as"))
              (SETQ |constantPart|
                      (AND (HGET |$constantHash| |con|)
                           (LIST (CONS '|constant| T))))
              (SETQ |niladicPart|
                      (AND (MEMQ |con| |$niladics|) (LIST (CONS 'NILADIC T))))
              (SETQ |falist|
                      (TAKE (LENGTH (IFCDR |form|)) |$FormalMapVariableList|))
              (SETQ |constructorCategory|
                      (COND
                       ((EQ |kind| '|category|)
                        (PROGN
                         (SETQ |talist|
                                 (TAKE (LENGTH (IFCDR |form|))
                                  |$TriangleVariableList|))
                         (SUBLISLIS |talist| |falist| |$constructorCategory|)))
                       (#4#
                        (SUBLISLIS |falist| (IFCDR |form|)
                         |$constructorCategory|))))
              (COND
               ((EQ |constructorCategory| '|Category|)
                (SETQ |kind| '|category|)))
              (SETQ |exportAlist|
                      (|asGetExports| |kind| |form| |constructorCategory|))
              (SETQ |constructorModemap|
                      (SUBLISLIS |falist| (IFCDR |form|) |modemap|))
              (COND
               ((EQ |kind| '|category|)
                (SETF (CADAR |constructorModemap|) (LIST '|Category|))))
              (SETQ |res|
                      (CONS (CONS '|constructorForm| |form|)
                            (APPEND |constantPart|
                                    (APPEND |niladicPart|
                                            (CONS
                                             (CONS '|constructorKind| |kind|)
                                             (CONS
                                              (CONS '|constructorModemap|
                                                    |constructorModemap|)
                                              (CONS
                                               (CONS '|abbreviation| |abb|)
                                               (CONS
                                                (CONS '|constructorCategory|
                                                      |constructorCategory|)
                                                (CONS
                                                 (CONS '|parents| |parents|)
                                                 (CONS
                                                  (CONS '|attributes|
                                                        |attributeAlist|)
                                                  (CONS
                                                   (CONS '|ancestors|
                                                         |ancestorAlist|)
                                                   (CONS
                                                    (CONS '|sourceFile|
                                                          |filestring|)
                                                    (CONS
                                                     (CONS '|operationAlist|
                                                           (|zeroOneConversion|
                                                            |opAlist|))
                                                     (CONS
                                                      (CONS '|modemaps|
                                                            (|asGetModemaps|
                                                             |exportAlist|
                                                             |form| |kind|
                                                             |modemap|))
                                                      (CONS
                                                       (CONS '|sourcefile|
                                                             |$asFilename|)
                                                       (CONS
                                                        (CONS '|typeCode|
                                                              |typeCode|)
                                                        (CONS
                                                         (CONS '|documentation|
                                                               |documentation|)
                                                         NIL)))))))))))))))))
              (COND (|$asyPrint| (|asyDisplay| |con| |res|)))
              |res|)))))))

; asGetExports(kind, conform, catform) ==
;   [., :op_lst] := categoryParts1(kind, conform, catform, false) or return nil
;   -- ensure that signatures are lists
;   [[op, sigpred] for [op,sig,:pred] in op_lst] where
;     sigpred ==
;       pred :=
;         pred = "T" => nil
;         pred
;       [sig, nil, :pred]

(DEFUN |asGetExports| (|kind| |conform| |catform|)
  (PROG (|LETTMP#1| |op_lst| |op| |ISTMP#1| |sig| |pred|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1|
              (OR (|categoryParts1| |kind| |conform| |catform| NIL)
                  (RETURN NIL)))
      (SETQ |op_lst| (CDR |LETTMP#1|))
      ((LAMBDA (|bfVar#19| |bfVar#18| |bfVar#17|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#18|)
                (PROGN (SETQ |bfVar#17| (CAR |bfVar#18|)) NIL))
            (RETURN (NREVERSE |bfVar#19|)))
           (#1='T
            (AND (CONSP |bfVar#17|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#17|))
                  (SETQ |ISTMP#1| (CDR |bfVar#17|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |sig| (CAR |ISTMP#1|))
                        (SETQ |pred| (CDR |ISTMP#1|))
                        #1#)))
                 (SETQ |bfVar#19|
                         (CONS
                          (LIST |op|
                                (PROGN
                                 (SETQ |pred|
                                         (COND ((EQ |pred| 'T) NIL)
                                               (#1# |pred|)))
                                 (CONS |sig| (CONS NIL |pred|))))
                          |bfVar#19|)))))
          (SETQ |bfVar#18| (CDR |bfVar#18|))))
       NIL |op_lst| NIL)))))

; asMakeAlistForFunction fn ==
;   record := HGET($conHash,fn)
;   [form,sig,predlist,kind,exposure,comments,typeCode,:filename] := first record
;   modemap := LASSOC(fn,$mmAlist)
;   newsig := asySignature(sig,nil)
;   opAlist := [[fn,[newsig,nil,:predlist]]]
;   res := [['modemaps,:asGetModemaps(opAlist,fn,'function,modemap)],
;             ['typeCode,:typeCode]]
;   if $asyPrint then asyDisplay(fn,res)
;   res

(DEFUN |asMakeAlistForFunction| (|fn|)
  (PROG (|record| |LETTMP#1| |form| |sig| |predlist| |kind| |exposure|
         |comments| |typeCode| |filename| |modemap| |newsig| |opAlist| |res|)
    (RETURN
     (PROGN
      (SETQ |record| (HGET |$conHash| |fn|))
      (SETQ |LETTMP#1| (CAR |record|))
      (SETQ |form| (CAR |LETTMP#1|))
      (SETQ |sig| (CADR . #1=(|LETTMP#1|)))
      (SETQ |predlist| (CADDR . #1#))
      (SETQ |kind| (CADDDR . #1#))
      (SETQ |exposure| (CAR #2=(CDDDDR . #1#)))
      (SETQ |comments| (CADR . #3=(#2#)))
      (SETQ |typeCode| (CADDR . #3#))
      (SETQ |filename| (CDDDR . #3#))
      (SETQ |modemap| (LASSOC |fn| |$mmAlist|))
      (SETQ |newsig| (|asySignature| |sig| NIL))
      (SETQ |opAlist| (LIST (LIST |fn| (CONS |newsig| (CONS NIL |predlist|)))))
      (SETQ |res|
              (LIST
               (CONS '|modemaps|
                     (|asGetModemaps| |opAlist| |fn| '|function| |modemap|))
               (CONS '|typeCode| |typeCode|)))
      (COND (|$asyPrint| (|asyDisplay| |fn| |res|)))
      |res|))))

; getAttributesFromCATEGORY catform ==
;   catform is ['CATEGORY,.,:r] => [y for x in r | x is ['ATTRIBUTE,y]]
;   catform is ['Join,:m,x]     => getAttributesFromCATEGORY x
;   nil

(DEFUN |getAttributesFromCATEGORY| (|catform|)
  (PROG (|ISTMP#1| |r| |y| |ISTMP#2| |x| |m|)
    (RETURN
     (COND
      ((AND (CONSP |catform|) (EQ (CAR |catform|) 'CATEGORY)
            (PROGN
             (SETQ |ISTMP#1| (CDR |catform|))
             (AND (CONSP |ISTMP#1|) (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1='T))))
       ((LAMBDA (|bfVar#21| |bfVar#20| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#20|) (PROGN (SETQ |x| (CAR |bfVar#20|)) NIL))
             (RETURN (NREVERSE |bfVar#21|)))
            (#1#
             (AND (CONSP |x|) (EQ (CAR |x|) 'ATTRIBUTE)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |x|))
                   (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                        (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#)))
                  (SETQ |bfVar#21| (CONS |y| |bfVar#21|)))))
           (SETQ |bfVar#20| (CDR |bfVar#20|))))
        NIL |r| NIL))
      ((AND (CONSP |catform|) (EQ (CAR |catform|) '|Join|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |catform|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1#)
                  (CONSP |ISTMP#2|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#2|))
                   (SETQ |m| (CDR |ISTMP#2|))
                   #1#)
                  (PROGN (SETQ |m| (NREVERSE |m|)) #1#))))
       (|getAttributesFromCATEGORY| |x|))
      (#1# NIL)))))

; zeroOneConversion opAlist == opAlist

(DEFUN |zeroOneConversion| (|opAlist|) (PROG () (RETURN |opAlist|)))

; asyDisplay(con,alist) ==
;   banner := '"=============================="
;   sayBrightly [banner,'" ",con,'" ",banner]
;   for [prop,:value] in alist repeat
;     sayBrightlyNT [prop,'": "]
;     pp value

(DEFUN |asyDisplay| (|con| |alist|)
  (PROG (|banner| |prop| |value|)
    (RETURN
     (PROGN
      (SETQ |banner| "==============================")
      (|sayBrightly| (LIST |banner| " " |con| " " |banner|))
      ((LAMBDA (|bfVar#23| |bfVar#22|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#23|)
                (PROGN (SETQ |bfVar#22| (CAR |bfVar#23|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#22|)
                 (PROGN
                  (SETQ |prop| (CAR |bfVar#22|))
                  (SETQ |value| (CDR |bfVar#22|))
                  #1#)
                 (PROGN (|sayBrightlyNT| (LIST |prop| ": ")) (|pp| |value|)))))
          (SETQ |bfVar#23| (CDR |bfVar#23|))))
       |alist| NIL)))))

; asGetModemaps(opAlist,oform,kind,modemap) ==
;   acc:= nil
;   rpvl:=
;     MEMQ(kind, '(category function)) => rest $PatternVariableList -- *1 is special for $
;     $PatternVariableList
;   form := [opOf oform, :[y for x in IFCDR oform for y in rpvl]]
;   dc :=
;     MEMQ(kind, '(category function)) => "*1"
;     form
;   pred1 :=
;     kind = 'category => [["*1",form]]
;     nil
;   signature  := CDAR modemap
;   domainList :=
;     [[a,m] for a in rest form for m in rest signature |
;        asIsCategoryForm m]
;   catPredList:=
;     kind = 'function => [["isFreeFunction","*1",opOf form]]
;     [['ofCategory,:u] for u in [:pred1,:domainList]]
; --  the code seems to oscillate between generating $FormalMapVariableList
; --  and generating $TriangleVariableList
;   for [op,:itemlist] in SUBLISLIS(rpvl, $FormalMapVariableList,opAlist) repeat
;     for [sig0, pred] in itemlist repeat
;       sig := SUBST(dc, "%", sig0)
;       pred := SUBST(dc, "%", pred)
;       sig := SUBLISLIS(rpvl, IFCDR oform, sig)
;       pred:= SUBLISLIS(rpvl, IFCDR oform, pred)
;       pred := pred or 'T
;   ----------> Constants change <--------------
;       if IDENTP sig0 then
;           sig := [sig]
;           pred := MKPF([pred,'(isAsConstant)],'AND)
;       pred' := MKPF([pred,:catPredList],'AND)
;       mm := [[dc,:sig],[pred']]
;       acc := [[op,:interactiveModemapForm mm],:acc]
;   NREVERSE acc

(DEFUN |asGetModemaps| (|opAlist| |oform| |kind| |modemap|)
  (PROG (|acc| |rpvl| |form| |dc| |pred1| |signature| |domainList|
         |catPredList| |op| |itemlist| |sig0| |ISTMP#1| |pred| |sig| |pred'|
         |mm|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      (SETQ |rpvl|
              (COND
               ((MEMQ |kind| '(|category| |function|))
                (CDR |$PatternVariableList|))
               (#1='T |$PatternVariableList|)))
      (SETQ |form|
              (CONS (|opOf| |oform|)
                    ((LAMBDA (|bfVar#26| |bfVar#24| |x| |bfVar#25| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#24|)
                              (PROGN (SETQ |x| (CAR |bfVar#24|)) NIL)
                              (ATOM |bfVar#25|)
                              (PROGN (SETQ |y| (CAR |bfVar#25|)) NIL))
                          (RETURN (NREVERSE |bfVar#26|)))
                         (#1# (SETQ |bfVar#26| (CONS |y| |bfVar#26|))))
                        (SETQ |bfVar#24| (CDR |bfVar#24|))
                        (SETQ |bfVar#25| (CDR |bfVar#25|))))
                     NIL (IFCDR |oform|) NIL |rpvl| NIL)))
      (SETQ |dc|
              (COND ((MEMQ |kind| '(|category| |function|)) '*1) (#1# |form|)))
      (SETQ |pred1|
              (COND ((EQ |kind| '|category|) (LIST (LIST '*1 |form|)))
                    (#1# NIL)))
      (SETQ |signature| (CDAR |modemap|))
      (SETQ |domainList|
              ((LAMBDA (|bfVar#29| |bfVar#27| |a| |bfVar#28| |m|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#27|)
                        (PROGN (SETQ |a| (CAR |bfVar#27|)) NIL)
                        (ATOM |bfVar#28|)
                        (PROGN (SETQ |m| (CAR |bfVar#28|)) NIL))
                    (RETURN (NREVERSE |bfVar#29|)))
                   (#1#
                    (AND (|asIsCategoryForm| |m|)
                         (SETQ |bfVar#29| (CONS (LIST |a| |m|) |bfVar#29|)))))
                  (SETQ |bfVar#27| (CDR |bfVar#27|))
                  (SETQ |bfVar#28| (CDR |bfVar#28|))))
               NIL (CDR |form|) NIL (CDR |signature|) NIL))
      (SETQ |catPredList|
              (COND
               ((EQ |kind| '|function|)
                (LIST (LIST '|isFreeFunction| '*1 (|opOf| |form|))))
               (#1#
                ((LAMBDA (|bfVar#31| |bfVar#30| |u|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#30|)
                          (PROGN (SETQ |u| (CAR |bfVar#30|)) NIL))
                      (RETURN (NREVERSE |bfVar#31|)))
                     (#1#
                      (SETQ |bfVar#31|
                              (CONS (CONS '|ofCategory| |u|) |bfVar#31|))))
                    (SETQ |bfVar#30| (CDR |bfVar#30|))))
                 NIL (APPEND |pred1| |domainList|) NIL))))
      ((LAMBDA (|bfVar#33| |bfVar#32|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#33|)
                (PROGN (SETQ |bfVar#32| (CAR |bfVar#33|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#32|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#32|))
                  (SETQ |itemlist| (CDR |bfVar#32|))
                  #1#)
                 ((LAMBDA (|bfVar#35| |bfVar#34|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#35|)
                           (PROGN (SETQ |bfVar#34| (CAR |bfVar#35|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (AND (CONSP |bfVar#34|)
                            (PROGN
                             (SETQ |sig0| (CAR |bfVar#34|))
                             (SETQ |ISTMP#1| (CDR |bfVar#34|))
                             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                  (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#)))
                            (PROGN
                             (SETQ |sig| (SUBST |dc| '% |sig0|))
                             (SETQ |pred| (SUBST |dc| '% |pred|))
                             (SETQ |sig|
                                     (SUBLISLIS |rpvl| (IFCDR |oform|) |sig|))
                             (SETQ |pred|
                                     (SUBLISLIS |rpvl| (IFCDR |oform|) |pred|))
                             (SETQ |pred| (OR |pred| 'T))
                             (COND
                              ((IDENTP |sig0|) (SETQ |sig| (LIST |sig|))
                               (SETQ |pred|
                                       (MKPF (LIST |pred| '(|isAsConstant|))
                                        'AND))))
                             (SETQ |pred'|
                                     (MKPF (CONS |pred| |catPredList|) 'AND))
                             (SETQ |mm|
                                     (LIST (CONS |dc| |sig|) (LIST |pred'|)))
                             (SETQ |acc|
                                     (CONS
                                      (CONS |op|
                                            (|interactiveModemapForm| |mm|))
                                      |acc|))))))
                     (SETQ |bfVar#35| (CDR |bfVar#35|))))
                  |itemlist| NIL))))
          (SETQ |bfVar#33| (CDR |bfVar#33|))))
       (SUBLISLIS |rpvl| |$FormalMapVariableList| |opAlist|) NIL)
      (NREVERSE |acc|)))))

; asIsCategoryForm m ==
;     m = 'BasicType or get_database(opOf(m), 'CONSTRUCTORKIND) = 'category

(DEFUN |asIsCategoryForm| (|m|)
  (PROG ()
    (RETURN
     (OR (EQ |m| '|BasicType|)
         (EQ (|get_database| (|opOf| |m|) 'CONSTRUCTORKIND) '|category|)))))

; asyDocumentation con ==
;   docHash := HGET($docHash,con)
;   u := [[op,:[fn(x,op) for x in rec]] for op in HKEYS docHash
;            | rec := HGET(docHash,op)] where fn(x,op) ==
;     [form,sig,pred,origin,where?,comments,:.] := x
;     ----------> Constants change <--------------
;     if IDENTP sig then sig := [sig]
;     [asySignature(sig,nil),trimComments comments]
;   [form,sig,pred,origin,where?,comments] := first HGET($conHash,con)
;   --above "first" assumes only one entry
;   comments := trimComments asyExtractDescription comments
;   [:u,['constructor,[nil,comments]]]

(DEFUN |asyDocumentation| (|con|)
  (PROG (|docHash| |rec| |u| |LETTMP#1| |form| |sig| |pred| |origin| |where?|
         |comments|)
    (RETURN
     (PROGN
      (SETQ |docHash| (HGET |$docHash| |con|))
      (SETQ |u|
              ((LAMBDA (|bfVar#39| |bfVar#38| |op|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#38|)
                        (PROGN (SETQ |op| (CAR |bfVar#38|)) NIL))
                    (RETURN (NREVERSE |bfVar#39|)))
                   (#1='T
                    (AND (SETQ |rec| (HGET |docHash| |op|))
                         (SETQ |bfVar#39|
                                 (CONS
                                  (CONS |op|
                                        ((LAMBDA (|bfVar#37| |bfVar#36| |x|)
                                           (LOOP
                                            (COND
                                             ((OR (ATOM |bfVar#36|)
                                                  (PROGN
                                                   (SETQ |x| (CAR |bfVar#36|))
                                                   NIL))
                                              (RETURN (NREVERSE |bfVar#37|)))
                                             (#1#
                                              (SETQ |bfVar#37|
                                                      (CONS
                                                       (|asyDocumentation,fn|
                                                        |x| |op|)
                                                       |bfVar#37|))))
                                            (SETQ |bfVar#36|
                                                    (CDR |bfVar#36|))))
                                         NIL |rec| NIL))
                                  |bfVar#39|)))))
                  (SETQ |bfVar#38| (CDR |bfVar#38|))))
               NIL (HKEYS |docHash|) NIL))
      (SETQ |LETTMP#1| (CAR (HGET |$conHash| |con|)))
      (SETQ |form| (CAR |LETTMP#1|))
      (SETQ |sig| (CADR . #2=(|LETTMP#1|)))
      (SETQ |pred| (CADDR . #2#))
      (SETQ |origin| (CADDDR . #2#))
      (SETQ |where?| (CAR #3=(CDDDDR . #2#)))
      (SETQ |comments| (CADR #3#))
      (SETQ |comments| (|trimComments| (|asyExtractDescription| |comments|)))
      (APPEND |u| (CONS (LIST '|constructor| (LIST NIL |comments|)) NIL))))))
(DEFUN |asyDocumentation,fn| (|x| |op|)
  (PROG (|form| |sig| |pred| |origin| |where?| |comments|)
    (RETURN
     (PROGN
      (SETQ |form| (CAR |x|))
      (SETQ |sig| (CADR |x|))
      (SETQ |pred| (CADDR |x|))
      (SETQ |origin| (CADDDR |x|))
      (SETQ |where?| (CAR (CDDDDR |x|)))
      (SETQ |comments| (CADR (CDDDDR |x|)))
      (COND ((IDENTP |sig|) (SETQ |sig| (LIST |sig|))))
      (LIST (|asySignature| |sig| NIL) (|trimComments| |comments|))))))

; asyExtractDescription str ==
;   k := STRPOS('"Description:",str,0,nil) => asyExtractDescription SUBSTRING(str,k + 12,nil)
;   k := STRPOS('"Author:",str,0,nil) => asyExtractDescription SUBSTRING(str,0,k)
;   str

(DEFUN |asyExtractDescription| (|str|)
  (PROG (|k|)
    (RETURN
     (COND
      ((SETQ |k| (STRPOS "Description:" |str| 0 NIL))
       (|asyExtractDescription| (SUBSTRING |str| (+ |k| 12) NIL)))
      ((SETQ |k| (STRPOS "Author:" |str| 0 NIL))
       (|asyExtractDescription| (SUBSTRING |str| 0 |k|)))
      ('T |str|)))))

; trimComments str ==
;   null str or str = '"" => '""
;   m := MAXINDEX str
;   str := SUBSTRING(str,0,m)
;   trimString str

(DEFUN |trimComments| (|str|)
  (PROG (|m|)
    (RETURN
     (COND ((OR (NULL |str|) (EQUAL |str| "")) "")
           ('T
            (PROGN
             (SETQ |m| (MAXINDEX |str|))
             (SETQ |str| (SUBSTRING |str| 0 |m|))
             (|trimString| |str|)))))))

; asyExportAlist con ==
; --format of 'operationAlist property of LISPLIBS (as returned from koOps):
; --    <sig slotNumberOrNil optPred optELT>
; --!!! asyFile NEED: need to know if function is implemented by domain!!!
;   docHash := HGET($docHash,con)
;   [[op,:[fn(x,op) for x in rec]] for op in HKEYS docHash | rec := HGET(docHash,op)]
;        where fn(x,op) ==
;     [form,sig,pred,origin,where?,comments,:.] := x
;     tail :=
;       pred => [pred]
;       nil
;     newSig := asySignature(sig,nil)
;     [newSig,nil,:tail]

(DEFUN |asyExportAlist| (|con|)
  (PROG (|docHash| |rec|)
    (RETURN
     (PROGN
      (SETQ |docHash| (HGET |$docHash| |con|))
      ((LAMBDA (|bfVar#43| |bfVar#42| |op|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#42|) (PROGN (SETQ |op| (CAR |bfVar#42|)) NIL))
            (RETURN (NREVERSE |bfVar#43|)))
           (#1='T
            (AND (SETQ |rec| (HGET |docHash| |op|))
                 (SETQ |bfVar#43|
                         (CONS
                          (CONS |op|
                                ((LAMBDA (|bfVar#41| |bfVar#40| |x|)
                                   (LOOP
                                    (COND
                                     ((OR (ATOM |bfVar#40|)
                                          (PROGN
                                           (SETQ |x| (CAR |bfVar#40|))
                                           NIL))
                                      (RETURN (NREVERSE |bfVar#41|)))
                                     (#1#
                                      (SETQ |bfVar#41|
                                              (CONS
                                               (|asyExportAlist,fn| |x| |op|)
                                               |bfVar#41|))))
                                    (SETQ |bfVar#40| (CDR |bfVar#40|))))
                                 NIL |rec| NIL))
                          |bfVar#43|)))))
          (SETQ |bfVar#42| (CDR |bfVar#42|))))
       NIL (HKEYS |docHash|) NIL)))))
(DEFUN |asyExportAlist,fn| (|x| |op|)
  (PROG (|form| |sig| |pred| |origin| |where?| |comments| |tail| |newSig|)
    (RETURN
     (PROGN
      (SETQ |form| (CAR |x|))
      (SETQ |sig| (CADR |x|))
      (SETQ |pred| (CADDR |x|))
      (SETQ |origin| (CADDDR |x|))
      (SETQ |where?| (CAR (CDDDDR |x|)))
      (SETQ |comments| (CADR (CDDDDR |x|)))
      (SETQ |tail| (COND (|pred| (LIST |pred|)) ('T NIL)))
      (SETQ |newSig| (|asySignature| |sig| NIL))
      (CONS |newSig| (CONS NIL |tail|))))))

; asyMakeOperationAlist(con,proplist, key) ==
;   oplist :=
;     u := LASSOC('domExports,proplist) =>
;       kind := 'domain
;       u
;     u := LASSOC('catExports,proplist) =>
;       kind := 'category
;       u
;     key = 'domain =>
;       kind := 'domain
;       u := NIL
;     return nil
;   ht := MAKE_HASHTABLE('EQUAL)
;   ancestorAlist := nil
;   for ['Declare,id,form,r] in oplist repeat
;     id = "%%" =>
;       opOf form = con => nil
;       y := asyAncestors form
;       if opOf(y)~=con then ancestorAlist := [ [y,:true],:ancestorAlist]
;     idForm   :=
;       form is ['Apply,'_-_>,source,target] => [id,:asyArgs source]
;   ----------> Constants change <--------------
;       id
;     pred :=
;       LASSOC('condition,r) is p => hackToRemoveAnd p
;       nil
;     sig := asySignature(asytranForm(form,[idForm],nil),nil)
;     entry :=
;       --id ~= "%%" and IDENTP idForm => [[sig],nil,nil,'ASCONST]
;       id ~= "%%" and IDENTP idForm =>
;           pred => [[sig],nil,asyPredTran pred,'ASCONST]
;           [[sig],nil,true,'ASCONST]
;       pred => [sig,nil,asyPredTran pred]
;       [sig]
;     HPUT(ht,id,[entry,:HGET(ht,id)])
;   opalist := [[op,:REMDUP HGET(ht,op)] for op in HKEYS ht]
;   HPUT($opHash,con,[ancestorAlist,nil,:opalist])

(DEFUN |asyMakeOperationAlist| (|con| |proplist| |key|)
  (PROG (|u| |kind| |oplist| |ht| |ancestorAlist| |ISTMP#1| |id| |ISTMP#2|
         |form| |ISTMP#3| |r| |y| |source| |target| |idForm| |p| |pred| |sig|
         |entry| |opalist|)
    (RETURN
     (PROGN
      (SETQ |oplist|
              (COND
               ((SETQ |u| (LASSOC '|domExports| |proplist|))
                (PROGN (SETQ |kind| '|domain|) |u|))
               ((SETQ |u| (LASSOC '|catExports| |proplist|))
                (PROGN (SETQ |kind| '|category|) |u|))
               ((EQ |key| '|domain|)
                (PROGN (SETQ |kind| '|domain|) (SETQ |u| NIL)))
               (#1='T (RETURN NIL))))
      (SETQ |ht| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |ancestorAlist| NIL)
      ((LAMBDA (|bfVar#45| |bfVar#44|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#45|)
                (PROGN (SETQ |bfVar#44| (CAR |bfVar#45|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#44|) (EQ (CAR |bfVar#44|) '|Declare|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bfVar#44|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |id| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |form| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN (SETQ |r| (CAR |ISTMP#3|)) #1#)))))))
                 (COND
                  ((EQ |id| '%%)
                   (COND ((EQUAL (|opOf| |form|) |con|) NIL)
                         (#1#
                          (PROGN
                           (SETQ |y| (|asyAncestors| |form|))
                           (COND
                            ((NOT (EQUAL (|opOf| |y|) |con|))
                             (SETQ |ancestorAlist|
                                     (CONS (CONS |y| T) |ancestorAlist|))))))))
                  (#1#
                   (PROGN
                    (SETQ |idForm|
                            (COND
                             ((AND (CONSP |form|) (EQ (CAR |form|) '|Apply|)
                                   (PROGN
                                    (SETQ |ISTMP#1| (CDR |form|))
                                    (AND (CONSP |ISTMP#1|)
                                         (EQ (CAR |ISTMP#1|) '->)
                                         (PROGN
                                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                          (AND (CONSP |ISTMP#2|)
                                               (PROGN
                                                (SETQ |source| (CAR |ISTMP#2|))
                                                (SETQ |ISTMP#3|
                                                        (CDR |ISTMP#2|))
                                                (AND (CONSP |ISTMP#3|)
                                                     (EQ (CDR |ISTMP#3|) NIL)
                                                     (PROGN
                                                      (SETQ |target|
                                                              (CAR |ISTMP#3|))
                                                      #1#))))))))
                              (CONS |id| (|asyArgs| |source|)))
                             (#1# |id|)))
                    (SETQ |pred|
                            (COND
                             ((PROGN (SETQ |p| (LASSOC '|condition| |r|)) #1#)
                              (|hackToRemoveAnd| |p|))
                             (#1# NIL)))
                    (SETQ |sig|
                            (|asySignature|
                             (|asytranForm| |form| (LIST |idForm|) NIL) NIL))
                    (SETQ |entry|
                            (COND
                             ((AND (NOT (EQ |id| '%%)) (IDENTP |idForm|))
                              (COND
                               (|pred|
                                (LIST (LIST |sig|) NIL (|asyPredTran| |pred|)
                                      'ASCONST))
                               (#1# (LIST (LIST |sig|) NIL T 'ASCONST))))
                             (|pred| (LIST |sig| NIL (|asyPredTran| |pred|)))
                             (#1# (LIST |sig|))))
                    (HPUT |ht| |id| (CONS |entry| (HGET |ht| |id|)))))))))
          (SETQ |bfVar#45| (CDR |bfVar#45|))))
       |oplist| NIL)
      (SETQ |opalist|
              ((LAMBDA (|bfVar#47| |bfVar#46| |op|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#46|)
                        (PROGN (SETQ |op| (CAR |bfVar#46|)) NIL))
                    (RETURN (NREVERSE |bfVar#47|)))
                   (#1#
                    (SETQ |bfVar#47|
                            (CONS (CONS |op| (REMDUP (HGET |ht| |op|)))
                                  |bfVar#47|))))
                  (SETQ |bfVar#46| (CDR |bfVar#46|))))
               NIL (HKEYS |ht|) NIL))
      (HPUT |$opHash| |con| (CONS |ancestorAlist| (CONS NIL |opalist|)))))))

; hackToRemoveAnd p ==
; ---remove this as soon as .asy files do not contain forms (And pred) forms
;   p is ['And,q,:r] =>
;     r => ['AND,q,:r]
;     q
;   p

(DEFUN |hackToRemoveAnd| (|p|)
  (PROG (|ISTMP#1| |q| |r|)
    (RETURN
     (COND
      ((AND (CONSP |p|) (EQ (CAR |p|) '|And|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |p|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |q| (CAR |ISTMP#1|))
                   (SETQ |r| (CDR |ISTMP#1|))
                   #1='T))))
       (COND (|r| (CONS 'AND (CONS |q| |r|))) (#1# |q|)))
      (#1# |p|)))))

; asyAncestors x ==
;   x is ['Apply,:r] => asyAncestorList r
;   x is [op,y,:.] and MEMQ(op, '(PretendTo RestrictTo)) => asyAncestors y
;   atom x =>
;     x = '_% => '_%
;     MEMQ(x, $niladics)       => [x]
;     get_database(x, 'NILADIC) => [x]
;     x
;   asyAncestorList x

(DEFUN |asyAncestors| (|x|)
  (PROG (|r| |op| |ISTMP#1| |y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Apply|)
            (PROGN (SETQ |r| (CDR |x|)) #1='T))
       (|asyAncestorList| |r|))
      ((AND (CONSP |x|)
            (PROGN
             (SETQ |op| (CAR |x|))
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|) (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#)))
            (MEMQ |op| '(|PretendTo| |RestrictTo|)))
       (|asyAncestors| |y|))
      ((ATOM |x|)
       (COND ((EQ |x| '%) '%) ((MEMQ |x| |$niladics|) (LIST |x|))
             ((|get_database| |x| 'NILADIC) (LIST |x|)) (#1# |x|)))
      (#1# (|asyAncestorList| |x|))))))

; asyAncestorList x == [asyAncestors y for y in x]

(DEFUN |asyAncestorList| (|x|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#49| |bfVar#48| |y|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#48|) (PROGN (SETQ |y| (CAR |bfVar#48|)) NIL))
           (RETURN (NREVERSE |bfVar#49|)))
          ('T (SETQ |bfVar#49| (CONS (|asyAncestors| |y|) |bfVar#49|))))
         (SETQ |bfVar#48| (CDR |bfVar#48|))))
      NIL |x| NIL))))

; asytran fn ==
; --put operations into table format for browser:
; --    <sig pred origin         exposed? comments>
;   inStream := OPEN fn
;   sayBrightly ['"   Reading ",fn]
;   u := READ(inStream)
;   $niladics := mkNiladics u
;   for d in u repeat
;     ['Declare,name,:.] := d
;     name = "%%" => 'skip       --skip over top-level properties
;     $docHashLocal: local := MAKE_HASHTABLE('EQUAL)
;     asytranDeclaration(d,'(top),nil,false)
;     if null name then BREAK()
;     HPUT($docHash,name,$docHashLocal)
;   CLOSE inStream
;   'done

(DEFUN |asytran| (|fn|)
  (PROG (|$docHashLocal| |name| |u| |inStream|)
    (DECLARE (SPECIAL |$docHashLocal|))
    (RETURN
     (PROGN
      (SETQ |inStream| (OPEN |fn|))
      (|sayBrightly| (LIST "   Reading " |fn|))
      (SETQ |u| (READ |inStream|))
      (SETQ |$niladics| (|mkNiladics| |u|))
      ((LAMBDA (|bfVar#50| |d|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#50|) (PROGN (SETQ |d| (CAR |bfVar#50|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |name| (CADR |d|))
             (COND ((EQ |name| '%%) '|skip|)
                   (#1#
                    (PROGN
                     (SETQ |$docHashLocal| (MAKE_HASHTABLE 'EQUAL))
                     (|asytranDeclaration| |d| '(|top|) NIL NIL)
                     (COND ((NULL |name|) (BREAK)))
                     (HPUT |$docHash| |name| |$docHashLocal|)))))))
          (SETQ |bfVar#50| (CDR |bfVar#50|))))
       |u| NIL)
      (CLOSE |inStream|)
      '|done|))))

; mkNiladics u ==
;   [name for x in u | x is ['Declare,name,y,:.] and y isnt ['Apply,'_-_>,:.]]

(DEFUN |mkNiladics| (|u|)
  (PROG (|ISTMP#1| |name| |ISTMP#2| |y|)
    (RETURN
     ((LAMBDA (|bfVar#52| |bfVar#51| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#51|) (PROGN (SETQ |x| (CAR |bfVar#51|)) NIL))
           (RETURN (NREVERSE |bfVar#52|)))
          (#1='T
           (AND (CONSP |x|) (EQ (CAR |x|) '|Declare|)
                (PROGN
                 (SETQ |ISTMP#1| (CDR |x|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |name| (CAR |ISTMP#1|))
                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                       (AND (CONSP |ISTMP#2|)
                            (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1#)))))
                (NOT
                 (AND (CONSP |y|) (EQ (CAR |y|) '|Apply|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |y|))
                       (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '->)))))
                (SETQ |bfVar#52| (CONS |name| |bfVar#52|)))))
         (SETQ |bfVar#51| (CDR |bfVar#51|))))
      NIL |u| NIL))))

; asytranDeclaration(dform,levels,predlist,local?) ==
;   ['Declare,id,form,r] := dform
;   id = 'failed => id
;   IFCAR dform ~= 'Declare => systemError '"asytranDeclaration"
;   if levels = '(top) then
;     if form isnt ['Apply,"->",:.] then HPUT($constantHash,id,true)
;   comments := LASSOC('documentation,r) or '""
;   idForm   :=
;     levels is ['top,:.] =>
;       form is ['Apply,'_-_>,source,target] => [id,:asyArgs source]
;       id
;   ----------> Constants change <--------------
;     id
;   newsig  := asytranForm(form,[idForm,:levels],local?)
;   key :=
;     levels is ['top,:.] =>
;       MEMQ(id,'(%% Category Type)) => 'constant
;       asyLooksLikeCatForm? form => 'category
;       form is ['Apply, '_-_>,.,u] =>
;         if u is ['Apply, construc,:.] then u:= construc
;         get_database(opOf(u), 'CONSTRUCTORKIND) = 'domain  => 'function
;         asyLooksLikeCatForm? u => 'category
;         'domain
;       'domain
;     first levels
;   typeCode := LASSOC('symeTypeCode,r)
;   record := [idForm,newsig,asyMkpred predlist,key,true,comments,typeCode,:$asyFile]
;   if not local? then
;     ht :=
;       levels = '(top) => $conHash
;       $docHashLocal
;     HPUT(ht,id,[record,:HGET(ht,id)])
;   if levels = '(top) then asyMakeOperationAlist(id,r, key)
;   ['Declare,id,newsig,r]

(DEFUN |asytranDeclaration| (|dform| |levels| |predlist| |local?|)
  (PROG (|id| |form| |r| |ISTMP#1| |comments| |ISTMP#2| |source| |ISTMP#3|
         |target| |idForm| |newsig| |u| |construc| |key| |typeCode| |record|
         |ht|)
    (RETURN
     (PROGN
      (SETQ |id| (CADR . #1=(|dform|)))
      (SETQ |form| (CADDR . #1#))
      (SETQ |r| (CADDDR . #1#))
      (COND ((EQ |id| '|failed|) |id|)
            ((NOT (EQ (IFCAR |dform|) '|Declare|))
             (|systemError| "asytranDeclaration"))
            (#2='T
             (PROGN
              (COND
               ((EQUAL |levels| '(|top|))
                (COND
                 ((NOT
                   (AND (CONSP |form|) (EQ (CAR |form|) '|Apply|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |form|))
                         (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '->)))))
                  (HPUT |$constantHash| |id| T)))))
              (SETQ |comments| (OR (LASSOC '|documentation| |r|) ""))
              (SETQ |idForm|
                      (COND
                       ((AND (CONSP |levels|) (EQ (CAR |levels|) '|top|))
                        (COND
                         ((AND (CONSP |form|) (EQ (CAR |form|) '|Apply|)
                               (PROGN
                                (SETQ |ISTMP#1| (CDR |form|))
                                (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '->)
                                     (PROGN
                                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                      (AND (CONSP |ISTMP#2|)
                                           (PROGN
                                            (SETQ |source| (CAR |ISTMP#2|))
                                            (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                            (AND (CONSP |ISTMP#3|)
                                                 (EQ (CDR |ISTMP#3|) NIL)
                                                 (PROGN
                                                  (SETQ |target|
                                                          (CAR |ISTMP#3|))
                                                  #2#))))))))
                          (CONS |id| (|asyArgs| |source|)))
                         (#2# |id|)))
                       (#2# |id|)))
              (SETQ |newsig|
                      (|asytranForm| |form| (CONS |idForm| |levels|) |local?|))
              (SETQ |key|
                      (COND
                       ((AND (CONSP |levels|) (EQ (CAR |levels|) '|top|))
                        (COND ((MEMQ |id| '(%% |Category| |Type|)) '|constant|)
                              ((|asyLooksLikeCatForm?| |form|) '|category|)
                              ((AND (CONSP |form|) (EQ (CAR |form|) '|Apply|)
                                    (PROGN
                                     (SETQ |ISTMP#1| (CDR |form|))
                                     (AND (CONSP |ISTMP#1|)
                                          (EQ (CAR |ISTMP#1|) '->)
                                          (PROGN
                                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                           (AND (CONSP |ISTMP#2|)
                                                (PROGN
                                                 (SETQ |ISTMP#3|
                                                         (CDR |ISTMP#2|))
                                                 (AND (CONSP |ISTMP#3|)
                                                      (EQ (CDR |ISTMP#3|) NIL)
                                                      (PROGN
                                                       (SETQ |u|
                                                               (CAR |ISTMP#3|))
                                                       #2#))))))))
                               (PROGN
                                (COND
                                 ((AND (CONSP |u|) (EQ (CAR |u|) '|Apply|)
                                       (PROGN
                                        (SETQ |ISTMP#1| (CDR |u|))
                                        (AND (CONSP |ISTMP#1|)
                                             (PROGN
                                              (SETQ |construc| (CAR |ISTMP#1|))
                                              #2#))))
                                  (SETQ |u| |construc|)))
                                (COND
                                 ((EQ
                                   (|get_database| (|opOf| |u|)
                                    'CONSTRUCTORKIND)
                                   '|domain|)
                                  '|function|)
                                 ((|asyLooksLikeCatForm?| |u|) '|category|)
                                 (#2# '|domain|))))
                              (#2# '|domain|)))
                       (#2# (CAR |levels|))))
              (SETQ |typeCode| (LASSOC '|symeTypeCode| |r|))
              (SETQ |record|
                      (CONS |idForm|
                            (CONS |newsig|
                                  (CONS (|asyMkpred| |predlist|)
                                        (CONS |key|
                                              (CONS T
                                                    (CONS |comments|
                                                          (CONS |typeCode|
                                                                |$asyFile|))))))))
              (COND
               ((NULL |local?|)
                (SETQ |ht|
                        (COND ((EQUAL |levels| '(|top|)) |$conHash|)
                              (#2# |$docHashLocal|)))
                (HPUT |ht| |id| (CONS |record| (HGET |ht| |id|)))))
              (COND
               ((EQUAL |levels| '(|top|))
                (|asyMakeOperationAlist| |id| |r| |key|)))
              (LIST '|Declare| |id| |newsig| |r|))))))))

; asyLooksLikeCatForm? x ==
; --TTT don't see a Third in my version ....
;   x is ['Define, ['Declare, ., ['Apply, 'Third,:.],:.],:.] or
;    x is ['Define, ['Declare, ., 'Category ],:.]

(DEFUN |asyLooksLikeCatForm?| (|x|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |ISTMP#5| |ISTMP#6|)
    (RETURN
     (OR
      (AND (CONSP |x|) (EQ (CAR |x|) '|Define|)
           (PROGN
            (SETQ |ISTMP#1| (CDR |x|))
            (AND (CONSP |ISTMP#1|)
                 (PROGN
                  (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                  (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Declare|)
                       (PROGN
                        (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                        (AND (CONSP |ISTMP#3|)
                             (PROGN
                              (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                              (AND (CONSP |ISTMP#4|)
                                   (PROGN
                                    (SETQ |ISTMP#5| (CAR |ISTMP#4|))
                                    (AND (CONSP |ISTMP#5|)
                                         (EQ (CAR |ISTMP#5|) '|Apply|)
                                         (PROGN
                                          (SETQ |ISTMP#6| (CDR |ISTMP#5|))
                                          (AND (CONSP |ISTMP#6|)
                                               (EQ (CAR |ISTMP#6|)
                                                   '|Third|))))))))))))))
      (AND (CONSP |x|) (EQ (CAR |x|) '|Define|)
           (PROGN
            (SETQ |ISTMP#1| (CDR |x|))
            (AND (CONSP |ISTMP#1|)
                 (PROGN
                  (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                  (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Declare|)
                       (PROGN
                        (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                        (AND (CONSP |ISTMP#3|)
                             (PROGN
                              (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                              (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                                   (EQ (CAR |ISTMP#4|) '|Category|))))))))))))))

; asyIsCatForm form ==
;   form is ['Apply,:r] =>
;     r is ['_-_>,.,a] => asyIsCatForm a
;     r is ['Third,'Type,:.] => true
;     false
;   false

(DEFUN |asyIsCatForm| (|form|)
  (PROG (|r| |ISTMP#1| |ISTMP#2| |a|)
    (RETURN
     (COND
      ((AND (CONSP |form|) (EQ (CAR |form|) '|Apply|)
            (PROGN (SETQ |r| (CDR |form|)) #1='T))
       (COND
        ((AND (CONSP |r|) (EQ (CAR |r|) '->)
              (PROGN
               (SETQ |ISTMP#1| (CDR |r|))
               (AND (CONSP |ISTMP#1|)
                    (PROGN
                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                          (PROGN (SETQ |a| (CAR |ISTMP#2|)) #1#))))))
         (|asyIsCatForm| |a|))
        ((AND (CONSP |r|) (EQ (CAR |r|) '|Third|)
              (PROGN
               (SETQ |ISTMP#1| (CDR |r|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Type|))))
         T)
        (#1# NIL)))
      (#1# NIL)))))

; asyArgs source ==
;   args :=
;     source is [op,:u] and asyComma? op => u
;     [source]
;   [asyArg x for x in args]

(DEFUN |asyArgs| (|source|)
  (PROG (|op| |u| |args|)
    (RETURN
     (PROGN
      (SETQ |args|
              (COND
               ((AND (CONSP |source|)
                     (PROGN
                      (SETQ |op| (CAR |source|))
                      (SETQ |u| (CDR |source|))
                      #1='T)
                     (|asyComma?| |op|))
                |u|)
               (#1# (LIST |source|))))
      ((LAMBDA (|bfVar#54| |bfVar#53| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#53|) (PROGN (SETQ |x| (CAR |bfVar#53|)) NIL))
            (RETURN (NREVERSE |bfVar#54|)))
           (#1# (SETQ |bfVar#54| (CONS (|asyArg| |x|) |bfVar#54|))))
          (SETQ |bfVar#53| (CDR |bfVar#53|))))
       NIL |args| NIL)))))

; asyArg x ==
;   x is ['Declare,id,:.] => id
;   x

(DEFUN |asyArg| (|x|)
  (PROG (|ISTMP#1| |id|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Declare|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |id| (CAR |ISTMP#1|)) #1='T))))
       |id|)
      (#1# |x|)))))

; asyMkpred predlist ==
;   null predlist => nil
;   predlist is [p] => p
;   ['AND,:predlist]

(DEFUN |asyMkpred| (|predlist|)
  (PROG (|p|)
    (RETURN
     (COND ((NULL |predlist|) NIL)
           ((AND (CONSP |predlist|) (EQ (CDR |predlist|) NIL)
                 (PROGN (SETQ |p| (CAR |predlist|)) #1='T))
            |p|)
           (#1# (CONS 'AND |predlist|))))))

; asytranForm(form,levels,local?) ==
;   u := asytranForm1(form,levels,local?)
;   null u => hahah()
;   u

(DEFUN |asytranForm| (|form| |levels| |local?|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|asytranForm1| |form| |levels| |local?|))
      (COND ((NULL |u|) (|hahah|)) ('T |u|))))))

; asytranForm1(form,levels,local?) ==
;   form is ['With,left,cat] =>
;     asytranCategory(form,levels,nil,local?)
;   form is ['Apply,:.]   => asytranApply(form,levels,local?)
;   form is ['Declare,:.] => asytranDeclaration(form,levels,nil,local?)
;   form is ['Comma,:r]  => ['Comma,:[asytranForm(x,levels,local?) for x in r]]
;   form is [op,a,b] and MEMQ(a,'(PretendTo RestrictTo)) =>
;     asytranForm1(a,levels,local?)
;   form is ['LitInteger,s] =>
;         READ_-FROM_-STRING(s)
;   form is ['Define,:.]  =>
;     form is ['Define,['Declare,.,x,:.],rest] =>
; --TTT i don't know about this one but looks ok
;       x = 'Category => asytranForm1(rest,levels, local?)
;       asytranForm1(x,levels,local?)
;     error '"DEFINE forms are not handled yet"
;   if form = '_% then $hasPerCent := true
;   IDENTP form =>
;     form = "%" => "%"
;     get_database(form, 'NILADIC) => [form]
;     form
;   [asytranForm(x,levels,local?) for x in form]

(DEFUN |asytranForm1| (|form| |levels| |local?|)
  (PROG (|ISTMP#1| |left| |ISTMP#2| |cat| |r| |op| |a| |b| |s| |ISTMP#3|
         |ISTMP#4| |x| |ISTMP#5| CDR)
    (RETURN
     (COND
      ((AND (CONSP |form|) (EQ (CAR |form|) '|With|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |form|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |left| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |cat| (CAR |ISTMP#2|)) #1='T))))))
       (|asytranCategory| |form| |levels| NIL |local?|))
      ((AND (CONSP |form|) (EQ (CAR |form|) '|Apply|))
       (|asytranApply| |form| |levels| |local?|))
      ((AND (CONSP |form|) (EQ (CAR |form|) '|Declare|))
       (|asytranDeclaration| |form| |levels| NIL |local?|))
      ((AND (CONSP |form|) (EQ (CAR |form|) '|Comma|)
            (PROGN (SETQ |r| (CDR |form|)) #1#))
       (CONS '|Comma|
             ((LAMBDA (|bfVar#56| |bfVar#55| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#55|)
                       (PROGN (SETQ |x| (CAR |bfVar#55|)) NIL))
                   (RETURN (NREVERSE |bfVar#56|)))
                  (#1#
                   (SETQ |bfVar#56|
                           (CONS (|asytranForm| |x| |levels| |local?|)
                                 |bfVar#56|))))
                 (SETQ |bfVar#55| (CDR |bfVar#55|))))
              NIL |r| NIL)))
      ((AND (CONSP |form|)
            (PROGN
             (SETQ |op| (CAR |form|))
             (SETQ |ISTMP#1| (CDR |form|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |a| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#)))))
            (MEMQ |a| '(|PretendTo| |RestrictTo|)))
       (|asytranForm1| |a| |levels| |local?|))
      ((AND (CONSP |form|) (EQ (CAR |form|) '|LitInteger|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |form|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |s| (CAR |ISTMP#1|)) #1#))))
       (READ-FROM-STRING |s|))
      ((AND (CONSP |form|) (EQ (CAR |form|) '|Define|))
       (COND
        ((AND (CONSP |form|) (EQ (CAR |form|) '|Define|)
              (PROGN
               (SETQ |ISTMP#1| (CDR |form|))
               (AND (CONSP |ISTMP#1|)
                    (PROGN
                     (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Declare|)
                          (PROGN
                           (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                           (AND (CONSP |ISTMP#3|)
                                (PROGN
                                 (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                 (AND (CONSP |ISTMP#4|)
                                      (PROGN
                                       (SETQ |x| (CAR |ISTMP#4|))
                                       #1#)))))))
                    (PROGN
                     (SETQ |ISTMP#5| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#5|) (EQ (CDR |ISTMP#5|) NIL)
                          (PROGN (SETQ CDR (CAR |ISTMP#5|)) #1#))))))
         (COND ((EQ |x| '|Category|) (|asytranForm1| CDR |levels| |local?|))
               (#1# (|asytranForm1| |x| |levels| |local?|))))
        (#1# (|error| "DEFINE forms are not handled yet"))))
      (#1#
       (PROGN
        (COND ((EQ |form| '%) (SETQ |$hasPerCent| T)))
        (COND
         ((IDENTP |form|)
          (COND ((EQ |form| '%) '%)
                ((|get_database| |form| 'NILADIC) (LIST |form|)) (#1# |form|)))
         (#1#
          ((LAMBDA (|bfVar#58| |bfVar#57| |x|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#57|) (PROGN (SETQ |x| (CAR |bfVar#57|)) NIL))
                (RETURN (NREVERSE |bfVar#58|)))
               (#1#
                (SETQ |bfVar#58|
                        (CONS (|asytranForm| |x| |levels| |local?|)
                              |bfVar#58|))))
              (SETQ |bfVar#57| (CDR |bfVar#57|))))
           NIL |form| NIL)))))))))

; asytranApply(['Apply,name,:arglist],levels,local?) ==
;   MEMQ(name,'(Record Union)) =>
;     [name,:[asytranApplySpecial(x, levels, local?) for x in arglist]]
;   null arglist => [name]
;   name is [ 'RestrictTo, :.] =>
;     asytranApply(['Apply, first rest name, :arglist], levels, local?)
;   name is [ 'Qualify, :.] =>
;     asytranApply(['Apply, first rest name, :arglist], levels, local?)
;   name is 'string => asytranLiteral first arglist
;   name is 'integer => asytranLiteral first arglist
;   name is 'float => asytranLiteral first arglist
;   name = 'Enumeration =>
;     ["Enumeration",:[asytranEnumItem arg for arg in arglist]]
;   [:argl,lastArg] := arglist
;   [name,:[asytranFormSpecial(arg,levels,true) for arg in argl],
;           asytranFormSpecial(lastArg,levels,false)]

(DEFUN |asytranApply| (|bfVar#65| |levels| |local?|)
  (PROG (|name| |arglist| |LETTMP#1| |lastArg| |argl|)
    (RETURN
     (PROGN
      (SETQ |name| (CADR . #1=(|bfVar#65|)))
      (SETQ |arglist| (CDDR . #1#))
      (COND
       ((MEMQ |name| '(|Record| |Union|))
        (CONS |name|
              ((LAMBDA (|bfVar#60| |bfVar#59| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#59|)
                        (PROGN (SETQ |x| (CAR |bfVar#59|)) NIL))
                    (RETURN (NREVERSE |bfVar#60|)))
                   (#2='T
                    (SETQ |bfVar#60|
                            (CONS (|asytranApplySpecial| |x| |levels| |local?|)
                                  |bfVar#60|))))
                  (SETQ |bfVar#59| (CDR |bfVar#59|))))
               NIL |arglist| NIL)))
       ((NULL |arglist|) (LIST |name|))
       ((AND (CONSP |name|) (EQ (CAR |name|) '|RestrictTo|))
        (|asytranApply| (CONS '|Apply| (CONS (CAR (CDR |name|)) |arglist|))
         |levels| |local?|))
       ((AND (CONSP |name|) (EQ (CAR |name|) '|Qualify|))
        (|asytranApply| (CONS '|Apply| (CONS (CAR (CDR |name|)) |arglist|))
         |levels| |local?|))
       ((EQ |name| '|string|) (|asytranLiteral| (CAR |arglist|)))
       ((EQ |name| '|integer|) (|asytranLiteral| (CAR |arglist|)))
       ((EQ |name| '|float|) (|asytranLiteral| (CAR |arglist|)))
       ((EQ |name| '|Enumeration|)
        (CONS '|Enumeration|
              ((LAMBDA (|bfVar#62| |bfVar#61| |arg|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#61|)
                        (PROGN (SETQ |arg| (CAR |bfVar#61|)) NIL))
                    (RETURN (NREVERSE |bfVar#62|)))
                   (#2#
                    (SETQ |bfVar#62|
                            (CONS (|asytranEnumItem| |arg|) |bfVar#62|))))
                  (SETQ |bfVar#61| (CDR |bfVar#61|))))
               NIL |arglist| NIL)))
       (#2#
        (PROGN
         (SETQ |LETTMP#1| (REVERSE |arglist|))
         (SETQ |lastArg| (CAR |LETTMP#1|))
         (SETQ |argl| (NREVERSE (CDR |LETTMP#1|)))
         (CONS |name|
               (APPEND
                ((LAMBDA (|bfVar#64| |bfVar#63| |arg|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#63|)
                          (PROGN (SETQ |arg| (CAR |bfVar#63|)) NIL))
                      (RETURN (NREVERSE |bfVar#64|)))
                     (#2#
                      (SETQ |bfVar#64|
                              (CONS (|asytranFormSpecial| |arg| |levels| T)
                                    |bfVar#64|))))
                    (SETQ |bfVar#63| (CDR |bfVar#63|))))
                 NIL |argl| NIL)
                (CONS (|asytranFormSpecial| |lastArg| |levels| NIL)
                      NIL))))))))))

; asytranLiteral(lit) ==
;   first rest lit

(DEFUN |asytranLiteral| (|lit|) (PROG () (RETURN (CAR (CDR |lit|)))))

; asytranEnumItem arg ==
;   arg is ['Declare, name, :.] => name
;   error '"Bad Enumeration entry"

(DEFUN |asytranEnumItem| (|arg|)
  (PROG (|ISTMP#1| |name|)
    (RETURN
     (COND
      ((AND (CONSP |arg|) (EQ (CAR |arg|) '|Declare|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |arg|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |name| (CAR |ISTMP#1|)) #1='T))))
       |name|)
      (#1# (|error| "Bad Enumeration entry"))))))

; asytranApplySpecial(x, levels, local?) ==
;   x is ['Declare, name, typ, :.] => [":",name,asytranForm(typ, levels, local?)]
;   asytranForm(x, levels, local?)

(DEFUN |asytranApplySpecial| (|x| |levels| |local?|)
  (PROG (|ISTMP#1| |name| |ISTMP#2| |typ|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Declare|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |name| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN (SETQ |typ| (CAR |ISTMP#2|)) #1='T))))))
       (LIST '|:| |name| (|asytranForm| |typ| |levels| |local?|)))
      (#1# (|asytranForm| |x| |levels| |local?|))))))

; asytranFormSpecial(x, levels, local?) ==  --> this throws away variable name (revise later)
;   x is ['Declare, name, typ, :.] => asytranForm(typ, levels, local?)
;   asytranForm(x, levels, local?)

(DEFUN |asytranFormSpecial| (|x| |levels| |local?|)
  (PROG (|ISTMP#1| |name| |ISTMP#2| |typ|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Declare|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |name| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN (SETQ |typ| (CAR |ISTMP#2|)) #1='T))))))
       (|asytranForm| |typ| |levels| |local?|))
      (#1# (|asytranForm| |x| |levels| |local?|))))))

; asytranCategory(form,levels,predlist,local?) ==
;   cat :=
;     form is ['With,left,right] =>
;       right is ['Blank,:.] => ['Sequence]
;       right
;     form
;   left :=
;     form is ['With,left,right] =>
;       left is ['Blank,:.] => nil
;       left
;     nil
;   $hasPerCent: local := nil
;   items :=
;     cat is ['Sequence,:s] => s
;     [cat]
;   catTable := MAKE_HASHTABLE('EQUAL)
;   catList  := nil
;   for x in items | x repeat
;     if null x then systemError()
;     dform := asytranCategoryItem(x,levels,predlist,local?)
;     null dform => nil
;     dform is ['Declare,id,record,r] =>
;       HPUT(catTable,id,[asyWrap(record,predlist),:HGET(catTable,id)])
;     catList := [asyWrap(dform,predlist),:catList]
;   keys := listSort(function GLESSEQP,HKEYS catTable)
;   right1 := NREVERSE catList
;   right2 := [[key,:HGET(catTable,key)] for key in keys]
;   right :=
;     right2 => [:right1,['Exports,:right2]]
;     right1
;   res :=
;     left => [left,:right]
;     right
;   res is [x] and x is ['IF,:.] => x
;   ['With,:res]

(DEFUN |asytranCategory| (|form| |levels| |predlist| |local?|)
  (PROG (|$hasPerCent| |x| |res| |right2| |right1| |keys| |r| |ISTMP#3|
         |record| |id| |dform| |catList| |catTable| |items| |s| |cat| |right|
         |ISTMP#2| |left| |ISTMP#1|)
    (DECLARE (SPECIAL |$hasPerCent|))
    (RETURN
     (PROGN
      (SETQ |cat|
              (COND
               ((AND (CONSP |form|) (EQ (CAR |form|) '|With|)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |form|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |left| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN
                                  (SETQ |right| (CAR |ISTMP#2|))
                                  #1='T))))))
                (COND
                 ((AND (CONSP |right|) (EQ (CAR |right|) '|Blank|))
                  (LIST '|Sequence|))
                 (#1# |right|)))
               (#1# |form|)))
      (SETQ |left|
              (COND
               ((AND (CONSP |form|) (EQ (CAR |form|) '|With|)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |form|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |left| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN
                                  (SETQ |right| (CAR |ISTMP#2|))
                                  #1#))))))
                (COND ((AND (CONSP |left|) (EQ (CAR |left|) '|Blank|)) NIL)
                      (#1# |left|)))
               (#1# NIL)))
      (SETQ |$hasPerCent| NIL)
      (SETQ |items|
              (COND
               ((AND (CONSP |cat|) (EQ (CAR |cat|) '|Sequence|)
                     (PROGN (SETQ |s| (CDR |cat|)) #1#))
                |s|)
               (#1# (LIST |cat|))))
      (SETQ |catTable| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |catList| NIL)
      ((LAMBDA (|bfVar#66| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#66|) (PROGN (SETQ |x| (CAR |bfVar#66|)) NIL))
            (RETURN NIL))
           (#1#
            (AND |x|
                 (PROGN
                  (COND ((NULL |x|) (|systemError|)))
                  (SETQ |dform|
                          (|asytranCategoryItem| |x| |levels| |predlist|
                           |local?|))
                  (COND ((NULL |dform|) NIL)
                        ((AND (CONSP |dform|) (EQ (CAR |dform|) '|Declare|)
                              (PROGN
                               (SETQ |ISTMP#1| (CDR |dform|))
                               (AND (CONSP |ISTMP#1|)
                                    (PROGN
                                     (SETQ |id| (CAR |ISTMP#1|))
                                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                     (AND (CONSP |ISTMP#2|)
                                          (PROGN
                                           (SETQ |record| (CAR |ISTMP#2|))
                                           (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                           (AND (CONSP |ISTMP#3|)
                                                (EQ (CDR |ISTMP#3|) NIL)
                                                (PROGN
                                                 (SETQ |r| (CAR |ISTMP#3|))
                                                 #1#))))))))
                         (HPUT |catTable| |id|
                               (CONS (|asyWrap| |record| |predlist|)
                                     (HGET |catTable| |id|))))
                        (#1#
                         (SETQ |catList|
                                 (CONS (|asyWrap| |dform| |predlist|)
                                       |catList|))))))))
          (SETQ |bfVar#66| (CDR |bfVar#66|))))
       |items| NIL)
      (SETQ |keys| (|listSort| #'GLESSEQP (HKEYS |catTable|)))
      (SETQ |right1| (NREVERSE |catList|))
      (SETQ |right2|
              ((LAMBDA (|bfVar#68| |bfVar#67| |key|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#67|)
                        (PROGN (SETQ |key| (CAR |bfVar#67|)) NIL))
                    (RETURN (NREVERSE |bfVar#68|)))
                   (#1#
                    (SETQ |bfVar#68|
                            (CONS (CONS |key| (HGET |catTable| |key|))
                                  |bfVar#68|))))
                  (SETQ |bfVar#67| (CDR |bfVar#67|))))
               NIL |keys| NIL))
      (SETQ |right|
              (COND
               (|right2|
                (APPEND |right1| (CONS (CONS '|Exports| |right2|) NIL)))
               (#1# |right1|)))
      (SETQ |res| (COND (|left| (CONS |left| |right|)) (#1# |right|)))
      (COND
       ((AND (CONSP |res|) (EQ (CDR |res|) NIL)
             (PROGN (SETQ |x| (CAR |res|)) #1#) (CONSP |x|) (EQ (CAR |x|) 'IF))
        |x|)
       (#1# (CONS '|With| |res|)))))))

; asyWrap(record,predlist) ==
;   predlist => ['IF,MKPF(predlist,'AND),record]
;   record

(DEFUN |asyWrap| (|record| |predlist|)
  (PROG ()
    (RETURN
     (COND (|predlist| (LIST 'IF (MKPF |predlist| 'AND) |record|))
           ('T |record|)))))

; asytranCategoryItem(x,levels,predlist,local?) ==
;   x is ['If,predicate,item,:r] =>
;     IFCAR r => error '"ELSE expressions not allowed yet in conditionals"
;     pred :=
;       predicate is ['Test,r] => r
;       predicate
;     asytranCategory(item,levels,[pred,:predlist],local?)
;   MEMQ(IFCAR x, '(Default Foreign)) => nil
;   x is ['Declare,:.] => asytranDeclaration(x,levels,predlist,local?)
;   x

(DEFUN |asytranCategoryItem| (|x| |levels| |predlist| |local?|)
  (PROG (|ISTMP#1| |predicate| |ISTMP#2| |item| |r| |pred|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|If|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |predicate| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |item| (CAR |ISTMP#2|))
                         (SETQ |r| (CDR |ISTMP#2|))
                         #1='T))))))
       (COND
        ((IFCAR |r|)
         (|error| "ELSE expressions not allowed yet in conditionals"))
        (#1#
         (PROGN
          (SETQ |pred|
                  (COND
                   ((AND (CONSP |predicate|) (EQ (CAR |predicate|) '|Test|)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |predicate|))
                          (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                               (PROGN (SETQ |r| (CAR |ISTMP#1|)) #1#))))
                    |r|)
                   (#1# |predicate|)))
          (|asytranCategory| |item| |levels| (CONS |pred| |predlist|)
           |local?|)))))
      ((MEMQ (IFCAR |x|) '(|Default| |Foreign|)) NIL)
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Declare|))
       (|asytranDeclaration| |x| |levels| |predlist| |local?|))
      (#1# |x|)))))

; extendConstructorDataTable() ==
;   for x in listSort(function GLESSEQP,HKEYS $conHash) repeat
;      record := HGET($conHash,x)
;      [form,sig,predlist,origin,exposure,comments,typeCode,:filename] := first record
;      abb := asyAbbreviation(x,#(rest sig))
;      kind := 'domain
;      --Note: this "first" assumes that there is ONLY one sig per name
;      cosig := [nil,:asyCosig sig]
;      args  := asyConstructorArgs sig
;      tb :=
;        [[x,abb,
;           ['kind,:kind],
;             ['cosig,:cosig],
;               ['libfile,filename],
;                 ['sourceFile,STRINGIMAGE filename],
;                   ['constructorArgs,:args]],:tb]
;   listSort(function GLESSEQP,ASSOCLEFT tb)

(DEFUN |extendConstructorDataTable| ()
  (PROG (|tb| |args| |cosig| |kind| |abb| |filename| |typeCode| |comments|
         |exposure| |origin| |predlist| |sig| |form| |LETTMP#1| |record|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#69| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#69|) (PROGN (SETQ |x| (CAR |bfVar#69|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |record| (HGET |$conHash| |x|))
             (SETQ |LETTMP#1| (CAR |record|))
             (SETQ |form| (CAR |LETTMP#1|))
             (SETQ |sig| (CADR . #1=(|LETTMP#1|)))
             (SETQ |predlist| (CADDR . #1#))
             (SETQ |origin| (CADDDR . #1#))
             (SETQ |exposure| (CAR #2=(CDDDDR . #1#)))
             (SETQ |comments| (CADR . #3=(#2#)))
             (SETQ |typeCode| (CADDR . #3#))
             (SETQ |filename| (CDDDR . #3#))
             (SETQ |abb| (|asyAbbreviation| |x| (LENGTH (CDR |sig|))))
             (SETQ |kind| '|domain|)
             (SETQ |cosig| (CONS NIL (|asyCosig| |sig|)))
             (SETQ |args| (|asyConstructorArgs| |sig|))
             (SETQ |tb|
                     (CONS
                      (LIST |x| |abb| (CONS '|kind| |kind|)
                            (CONS '|cosig| |cosig|)
                            (LIST '|libfile| |filename|)
                            (LIST '|sourceFile| (STRINGIMAGE |filename|))
                            (CONS '|constructorArgs| |args|))
                      |tb|)))))
          (SETQ |bfVar#69| (CDR |bfVar#69|))))
       (|listSort| #'GLESSEQP (HKEYS |$conHash|)) NIL)
      (|listSort| #'GLESSEQP (ASSOCLEFT |tb|))))))

; asyConstructorArgs sig ==
;   sig is ['With,:.] => nil
;   sig is ['_-_>,source,target] =>
;     source is [op,:argl] and asyComma? op => [asyConstructorArg x for x in argl]
;     [asyConstructorArg source]

(DEFUN |asyConstructorArgs| (|sig|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |target| |op| |argl|)
    (RETURN
     (COND ((AND (CONSP |sig|) (EQ (CAR |sig|) '|With|)) NIL)
           ((AND (CONSP |sig|) (EQ (CAR |sig|) '->)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |sig|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |source| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1='T))))))
            (COND
             ((AND (CONSP |source|)
                   (PROGN
                    (SETQ |op| (CAR |source|))
                    (SETQ |argl| (CDR |source|))
                    #1#)
                   (|asyComma?| |op|))
              ((LAMBDA (|bfVar#71| |bfVar#70| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#70|)
                        (PROGN (SETQ |x| (CAR |bfVar#70|)) NIL))
                    (RETURN (NREVERSE |bfVar#71|)))
                   (#1#
                    (SETQ |bfVar#71|
                            (CONS (|asyConstructorArg| |x|) |bfVar#71|))))
                  (SETQ |bfVar#70| (CDR |bfVar#70|))))
               NIL |argl| NIL))
             (#1# (LIST (|asyConstructorArg| |source|)))))))))

; asyConstructorArg x ==
;   x is ['Declare,name,t,:.] => name
;   x

(DEFUN |asyConstructorArg| (|x|)
  (PROG (|ISTMP#1| |name| |ISTMP#2| |t|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Declare|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |name| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1='T))))))
       |name|)
      (#1# |x|)))))

; asyCosig sig ==    --can be a type or could be a signature
;   atom sig or sig is ['With,:.] => nil
;   sig is ['_-_>,source,target] =>
;     source is [op,:argl] and asyComma? op => [asyCosigType x for x in argl]
;     [asyCosigType source]
;   error false

(DEFUN |asyCosig| (|sig|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |target| |op| |argl|)
    (RETURN
     (COND ((OR (ATOM |sig|) (AND (CONSP |sig|) (EQ (CAR |sig|) '|With|))) NIL)
           ((AND (CONSP |sig|) (EQ (CAR |sig|) '->)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |sig|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |source| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1='T))))))
            (COND
             ((AND (CONSP |source|)
                   (PROGN
                    (SETQ |op| (CAR |source|))
                    (SETQ |argl| (CDR |source|))
                    #1#)
                   (|asyComma?| |op|))
              ((LAMBDA (|bfVar#73| |bfVar#72| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#72|)
                        (PROGN (SETQ |x| (CAR |bfVar#72|)) NIL))
                    (RETURN (NREVERSE |bfVar#73|)))
                   (#1#
                    (SETQ |bfVar#73| (CONS (|asyCosigType| |x|) |bfVar#73|))))
                  (SETQ |bfVar#72| (CDR |bfVar#72|))))
               NIL |argl| NIL))
             (#1# (LIST (|asyCosigType| |source|)))))
           (#1# (|error| NIL))))))

; asyCosigType u ==
;   u is [name,t] =>
;     t is [fn,:.] =>
;       asyComma? fn => fn
;       fn = 'With  => 'T
;       nil
;     t = 'Type => 'T
;     error '"Unknown atomic type"
;   error false

(DEFUN |asyCosigType| (|u|)
  (PROG (|name| |ISTMP#1| |t| |fn|)
    (RETURN
     (COND
      ((AND (CONSP |u|)
            (PROGN
             (SETQ |name| (CAR |u|))
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |t| (CAR |ISTMP#1|)) #1='T))))
       (COND
        ((AND (CONSP |t|) (PROGN (SETQ |fn| (CAR |t|)) #1#))
         (COND ((|asyComma?| |fn|) |fn|) ((EQ |fn| '|With|) 'T) (#1# NIL)))
        ((EQ |t| '|Type|) 'T) (#1# (|error| "Unknown atomic type"))))
      (#1# (|error| NIL))))))

; asyAbbreviation(id,n) ==  chk(id,main) where   --> n = number of arguments
;   main ==
;     a := createAbbreviation id => a
;     name := PNAME id
;     parts := asySplit(name,MAXINDEX name)
;     newname := "STRCONC"/[asyShorten x for x in parts]
;     #newname < 8 => INTERN newname
;     tryname := SUBSTRING(name,0,7)
;     not createAbbreviation tryname => INTERN UPCASE tryname
;     nil
;   chk(conname,abb) ==
;     (xx := asyGetAbbrevFromComments conname) => xx
;     con := abbreviation? abb =>
;       conname = con => abb
;       conname
;     abb

(DEFUN |asyAbbreviation| (|id| |n|)
  (PROG (|a| |name| |parts| |newname| |tryname|)
    (RETURN
     (|asyAbbreviation,chk| |id|
      (COND ((SETQ |a| (|createAbbreviation| |id|)) |a|)
            (#1='T
             (PROGN
              (SETQ |name| (PNAME |id|))
              (SETQ |parts| (|asySplit| |name| (MAXINDEX |name|)))
              (SETQ |newname|
                      ((LAMBDA (|bfVar#75| |bfVar#74| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#74|)
                                (PROGN (SETQ |x| (CAR |bfVar#74|)) NIL))
                            (RETURN |bfVar#75|))
                           (#1#
                            (SETQ |bfVar#75|
                                    (STRCONC |bfVar#75| (|asyShorten| |x|)))))
                          (SETQ |bfVar#74| (CDR |bfVar#74|))))
                       "" |parts| NIL))
              (COND ((< (LENGTH |newname|) 8) (INTERN |newname|))
                    (#1#
                     (PROGN
                      (SETQ |tryname| (SUBSTRING |name| 0 7))
                      (COND
                       ((NULL (|createAbbreviation| |tryname|))
                        (INTERN (UPCASE |tryname|)))
                       (#1# NIL))))))))))))
(DEFUN |asyAbbreviation,chk| (|conname| |abb|)
  (PROG (|xx| |con|)
    (RETURN
     (COND ((SETQ |xx| (|asyGetAbbrevFromComments| |conname|)) |xx|)
           ((SETQ |con| (|abbreviation?| |abb|))
            (COND ((EQUAL |conname| |con|) |abb|) (#1='T |conname|)))
           (#1# |abb|)))))

; asyGetAbbrevFromComments con ==
;   docHash := HGET($docHash,con)
;   u := [[op,:[fn(x,op) for x in rec]] for op in HKEYS docHash
;            | rec := HGET(docHash,op)] where fn(x,op) ==
;     [form,sig,pred,origin,where?,comments,:.] := x
;     ----------> Constants change <--------------
;     if IDENTP sig then sig := [sig]
;     [asySignature(sig,nil),trimComments comments]
;   [form,sig,pred,origin,where?,comments] := first HGET($conHash,con)
;   --above "first" assumes only one entry
;   x := asyExtractAbbreviation comments
;   x => intern x
;   NIL

(DEFUN |asyGetAbbrevFromComments| (|con|)
  (PROG (|docHash| |rec| |u| |LETTMP#1| |form| |sig| |pred| |origin| |where?|
         |comments| |x|)
    (RETURN
     (PROGN
      (SETQ |docHash| (HGET |$docHash| |con|))
      (SETQ |u|
              ((LAMBDA (|bfVar#79| |bfVar#78| |op|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#78|)
                        (PROGN (SETQ |op| (CAR |bfVar#78|)) NIL))
                    (RETURN (NREVERSE |bfVar#79|)))
                   (#1='T
                    (AND (SETQ |rec| (HGET |docHash| |op|))
                         (SETQ |bfVar#79|
                                 (CONS
                                  (CONS |op|
                                        ((LAMBDA (|bfVar#77| |bfVar#76| |x|)
                                           (LOOP
                                            (COND
                                             ((OR (ATOM |bfVar#76|)
                                                  (PROGN
                                                   (SETQ |x| (CAR |bfVar#76|))
                                                   NIL))
                                              (RETURN (NREVERSE |bfVar#77|)))
                                             (#1#
                                              (SETQ |bfVar#77|
                                                      (CONS
                                                       (|asyGetAbbrevFromComments,fn|
                                                        |x| |op|)
                                                       |bfVar#77|))))
                                            (SETQ |bfVar#76|
                                                    (CDR |bfVar#76|))))
                                         NIL |rec| NIL))
                                  |bfVar#79|)))))
                  (SETQ |bfVar#78| (CDR |bfVar#78|))))
               NIL (HKEYS |docHash|) NIL))
      (SETQ |LETTMP#1| (CAR (HGET |$conHash| |con|)))
      (SETQ |form| (CAR |LETTMP#1|))
      (SETQ |sig| (CADR . #2=(|LETTMP#1|)))
      (SETQ |pred| (CADDR . #2#))
      (SETQ |origin| (CADDDR . #2#))
      (SETQ |where?| (CAR #3=(CDDDDR . #2#)))
      (SETQ |comments| (CADR #3#))
      (SETQ |x| (|asyExtractAbbreviation| |comments|))
      (COND (|x| (|intern| |x|)) (#1# NIL))))))
(DEFUN |asyGetAbbrevFromComments,fn| (|x| |op|)
  (PROG (|form| |sig| |pred| |origin| |where?| |comments|)
    (RETURN
     (PROGN
      (SETQ |form| (CAR |x|))
      (SETQ |sig| (CADR |x|))
      (SETQ |pred| (CADDR |x|))
      (SETQ |origin| (CADDDR |x|))
      (SETQ |where?| (CAR (CDDDDR |x|)))
      (SETQ |comments| (CADR (CDDDDR |x|)))
      (COND ((IDENTP |sig|) (SETQ |sig| (LIST |sig|))))
      (LIST (|asySignature| |sig| NIL) (|trimComments| |comments|))))))

; asyExtractAbbreviation str ==
;         not (k:= STRPOS('"Abbrev: ",str,0,nil)) => NIL
;         str := SUBSTRING(str, k+8, nil)
;         k := STRPOS($stringNewline, str,0,nil)
;         k => SUBSTRING(str, 0, k)
;         str

(DEFUN |asyExtractAbbreviation| (|str|)
  (PROG (|k|)
    (RETURN
     (COND ((NULL (SETQ |k| (STRPOS "Abbrev: " |str| 0 NIL))) NIL)
           (#1='T
            (PROGN
             (SETQ |str| (SUBSTRING |str| (+ |k| 8) NIL))
             (SETQ |k| (STRPOS |$stringNewline| |str| 0 NIL))
             (COND (|k| (SUBSTRING |str| 0 |k|)) (#1# |str|))))))))

; asyShorten x ==
;   y := createAbbreviation x
;     or LASSOC(x,
;         '(("Small" . "SM") ("Single" ."S") ("Half" . "H")("Point" . "PT")
;             ("Floating" . "F") ("System" . "SYS") ("Number" . "N")
;              ("Inventor" . "IV")
;               ("Finite" . "F") ("Double" . "D") ("Builtin" . "BI"))) => y
;   UPCASE x

(DEFUN |asyShorten| (|x|)
  (PROG (|y|)
    (RETURN
     (COND
      ((SETQ |y|
               (OR (|createAbbreviation| |x|)
                   (LASSOC |x|
                    '(("Small" . "SM") ("Single" . "S") ("Half" . "H")
                      ("Point" . "PT") ("Floating" . "F") ("System" . "SYS")
                      ("Number" . "N") ("Inventor" . "IV") ("Finite" . "F")
                      ("Double" . "D") ("Builtin" . "BI")))))
       |y|)
      ('T (UPCASE |x|))))))

; asySplit(name,end) ==
;   end < 1 => [name]
;   k := 0
;   for i in 1..end while LOWER_-CASE_-P name.i repeat k := i
;   k := k + 1
;   [SUBSTRING(name,0,k),:asySplit(SUBSTRING(name,k,nil),end-k)]

(DEFUN |asySplit| (|name| |end|)
  (PROG (|k|)
    (RETURN
     (COND ((< |end| 1) (LIST |name|))
           (#1='T
            (PROGN
             (SETQ |k| 0)
             ((LAMBDA (|i|)
                (LOOP
                 (COND
                  ((OR (> |i| |end|) (NOT (LOWER-CASE-P (ELT |name| |i|))))
                   (RETURN NIL))
                  (#1# (SETQ |k| |i|)))
                 (SETQ |i| (+ |i| 1))))
              1)
             (SETQ |k| (+ |k| 1))
             (CONS (SUBSTRING |name| 0 |k|)
                   (|asySplit| (SUBSTRING |name| |k| NIL) (- |end| |k|)))))))))

; createAbbreviation s ==
;   if STRINGP s then s := INTERN s
;   a := constructor? s
;   a ~= s => a
;   nil

(DEFUN |createAbbreviation| (|s|)
  (PROG (|a|)
    (RETURN
     (PROGN
      (COND ((STRINGP |s|) (SETQ |s| (INTERN |s|))))
      (SETQ |a| (|constructor?| |s|))
      (COND ((NOT (EQUAL |a| |s|)) |a|) ('T NIL))))))

; asyConstructorModemap con ==
;   HGET($conHash,con) isnt [record,:.] => nil   --not there
;   [form,sig,predlist,kind,exposure,comments,typeCode,:filename] := record
;   $kind: local := kind
;   --NOTE: sig has the form (-> source target) or simply (target)
;   $constructorArgs : local := IFCDR form
;   signature := asySignature(sig,false)
;   formals := ['_%, :TAKE(#$constructorArgs, $FormalMapVariableList)]
;   mm := [[[con,:$constructorArgs],:signature],['T,con]]
;   SUBLISLIS(formals,['_%,:$constructorArgs],mm)

(DEFUN |asyConstructorModemap| (|con|)
  (PROG (|$constructorArgs| |$kind| |mm| |formals| |signature| |filename|
         |typeCode| |comments| |exposure| |kind| |predlist| |sig| |form|
         |record| |ISTMP#1|)
    (DECLARE (SPECIAL |$constructorArgs| |$kind|))
    (RETURN
     (COND
      ((NOT
        (PROGN
         (SETQ |ISTMP#1| (HGET |$conHash| |con|))
         (AND (CONSP |ISTMP#1|)
              (PROGN (SETQ |record| (CAR |ISTMP#1|)) #1='T))))
       NIL)
      (#1#
       (PROGN
        (SETQ |form| (CAR |record|))
        (SETQ |sig| (CADR . #2=(|record|)))
        (SETQ |predlist| (CADDR . #2#))
        (SETQ |kind| (CADDDR . #2#))
        (SETQ |exposure| (CAR #3=(CDDDDR . #2#)))
        (SETQ |comments| (CADR . #4=(#3#)))
        (SETQ |typeCode| (CADDR . #4#))
        (SETQ |filename| (CDDDR . #4#))
        (SETQ |$kind| |kind|)
        (SETQ |$constructorArgs| (IFCDR |form|))
        (SETQ |signature| (|asySignature| |sig| NIL))
        (SETQ |formals|
                (CONS '%
                      (TAKE (LENGTH |$constructorArgs|)
                       |$FormalMapVariableList|)))
        (SETQ |mm|
                (LIST (CONS (CONS |con| |$constructorArgs|) |signature|)
                      (LIST 'T |con|)))
        (SUBLISLIS |formals| (CONS '% |$constructorArgs|) |mm|)))))))

; asySignature(sig,names?) ==
;   sig is ['Join,:.] => [asySig(sig,nil)]
;   sig is ['With,:.] => [asySig(sig,nil)]
;   sig is ['_-_>,source,target] =>
;     target :=
;       names? => ['dummy,target]
;       target
;     source is [op,:argl] and asyComma? op =>
;       [asySigTarget(target,names?),:[asySig(x,names?) for x in argl]]
;     [asySigTarget(target,names?),asySig(source,names?)]
;   ----------> The following is a hack for constants which are category names<--
;   sig is ['Third,:.] => [asySig(sig,nil)]
;   ----------> Constants change <--------------
;   asySig(sig,nil)

(DEFUN |asySignature| (|sig| |names?|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |target| |op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |sig|) (EQ (CAR |sig|) '|Join|))
       (LIST (|asySig| |sig| NIL)))
      ((AND (CONSP |sig|) (EQ (CAR |sig|) '|With|))
       (LIST (|asySig| |sig| NIL)))
      ((AND (CONSP |sig|) (EQ (CAR |sig|) '->)
            (PROGN
             (SETQ |ISTMP#1| (CDR |sig|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |source| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1='T))))))
       (PROGN
        (SETQ |target|
                (COND (|names?| (LIST '|dummy| |target|)) (#1# |target|)))
        (COND
         ((AND (CONSP |source|)
               (PROGN
                (SETQ |op| (CAR |source|))
                (SETQ |argl| (CDR |source|))
                #1#)
               (|asyComma?| |op|))
          (CONS (|asySigTarget| |target| |names?|)
                ((LAMBDA (|bfVar#81| |bfVar#80| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#80|)
                          (PROGN (SETQ |x| (CAR |bfVar#80|)) NIL))
                      (RETURN (NREVERSE |bfVar#81|)))
                     (#1#
                      (SETQ |bfVar#81|
                              (CONS (|asySig| |x| |names?|) |bfVar#81|))))
                    (SETQ |bfVar#80| (CDR |bfVar#80|))))
                 NIL |argl| NIL)))
         (#1#
          (LIST (|asySigTarget| |target| |names?|)
                (|asySig| |source| |names?|))))))
      ((AND (CONSP |sig|) (EQ (CAR |sig|) '|Third|))
       (LIST (|asySig| |sig| NIL)))
      (#1# (|asySig| |sig| NIL))))))

; asySigTarget(u,name?) == asySig1(u,name?,true)

(DEFUN |asySigTarget| (|u| |name?|)
  (PROG () (RETURN (|asySig1| |u| |name?| T))))

; asySig(u,name?) == asySig1(u,name?,false)

(DEFUN |asySig| (|u| |name?|) (PROG () (RETURN (|asySig1| |u| |name?| NIL))))

; asySig1(u,name?,target?) ==
;   x :=
;     name? and u is [name,t] => t
;     u
;   x is [fn,:r] =>
;     fn = 'Join => asyTypeJoin r       ---------> jump out to newer code 4/94
;     MEMQ(fn, '(RestrictTo PretendTo)) => asySig(first r,name?)
;     asyComma? fn =>
;       u := [asySig(x,name?) for x in r]
;       target? =>
;         null u => '(Void)
;         -- this implies a multiple value return, not currently supported
;         -- in the interpreter
;         ['Multi,:u]
;       u
;     fn = 'With  => asyCATEGORY r
;     fn = 'Third =>
;       r is [b] =>
;         b is ['With,:s]  => asyCATEGORY s
;         b is ['Blank,:.] => asyCATEGORY nil
;       error x
;     fn = 'Apply and r is ['_-_>,:s] => asyMapping(s,name?)
;     fn = '_-_> => asyMapping(r,name?)
;     fn = 'Declare and r is [name,typ,:.] =>
;         asySig1(typ, name?, target?)
;     x is '(_%) => '(_%)
;     [fn,:[asySig(x,name?) for x in r]]
;   x = '_% => '_%
;   x

(DEFUN |asySig1| (|u| |name?| |target?|)
  (PROG (|name| |ISTMP#1| |t| |x| |fn| |r| |b| |s| |typ|)
    (RETURN
     (PROGN
      (SETQ |x|
              (COND
               ((AND |name?| (CONSP |u|)
                     (PROGN
                      (SETQ |name| (CAR |u|))
                      (SETQ |ISTMP#1| (CDR |u|))
                      (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                           (PROGN (SETQ |t| (CAR |ISTMP#1|)) #1='T))))
                |t|)
               (#1# |u|)))
      (COND
       ((AND (CONSP |x|)
             (PROGN (SETQ |fn| (CAR |x|)) (SETQ |r| (CDR |x|)) #1#))
        (COND ((EQ |fn| '|Join|) (|asyTypeJoin| |r|))
              ((MEMQ |fn| '(|RestrictTo| |PretendTo|))
               (|asySig| (CAR |r|) |name?|))
              ((|asyComma?| |fn|)
               (PROGN
                (SETQ |u|
                        ((LAMBDA (|bfVar#83| |bfVar#82| |x|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#82|)
                                  (PROGN (SETQ |x| (CAR |bfVar#82|)) NIL))
                              (RETURN (NREVERSE |bfVar#83|)))
                             (#1#
                              (SETQ |bfVar#83|
                                      (CONS (|asySig| |x| |name?|)
                                            |bfVar#83|))))
                            (SETQ |bfVar#82| (CDR |bfVar#82|))))
                         NIL |r| NIL))
                (COND
                 (|target?|
                  (COND ((NULL |u|) '(|Void|)) (#1# (CONS '|Multi| |u|))))
                 (#1# |u|))))
              ((EQ |fn| '|With|) (|asyCATEGORY| |r|))
              ((EQ |fn| '|Third|)
               (COND
                ((AND (CONSP |r|) (EQ (CDR |r|) NIL)
                      (PROGN (SETQ |b| (CAR |r|)) #1#))
                 (COND
                  ((AND (CONSP |b|) (EQ (CAR |b|) '|With|)
                        (PROGN (SETQ |s| (CDR |b|)) #1#))
                   (|asyCATEGORY| |s|))
                  ((AND (CONSP |b|) (EQ (CAR |b|) '|Blank|))
                   (|asyCATEGORY| NIL))))
                (#1# (|error| |x|))))
              ((AND (EQ |fn| '|Apply|) (CONSP |r|) (EQ (CAR |r|) '->)
                    (PROGN (SETQ |s| (CDR |r|)) #1#))
               (|asyMapping| |s| |name?|))
              ((EQ |fn| '->) (|asyMapping| |r| |name?|))
              ((AND (EQ |fn| '|Declare|) (CONSP |r|)
                    (PROGN
                     (SETQ |name| (CAR |r|))
                     (SETQ |ISTMP#1| (CDR |r|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |typ| (CAR |ISTMP#1|)) #1#))))
               (|asySig1| |typ| |name?| |target?|))
              ((EQUAL |x| '(%)) '(%))
              (#1#
               (CONS |fn|
                     ((LAMBDA (|bfVar#85| |bfVar#84| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#84|)
                               (PROGN (SETQ |x| (CAR |bfVar#84|)) NIL))
                           (RETURN (NREVERSE |bfVar#85|)))
                          (#1#
                           (SETQ |bfVar#85|
                                   (CONS (|asySig| |x| |name?|) |bfVar#85|))))
                         (SETQ |bfVar#84| (CDR |bfVar#84|))))
                      NIL |r| NIL)))))
       ((EQ |x| '%) '%) (#1# |x|))))))

; asyMapping([a,b],name?) ==
;   newa := asySig(a,name?)
;   b    := asySig(b,name?)
;   args :=
;     a is [op,:r] and asyComma? op => newa
;     [a]
;   ['Mapping,b,:args]

(DEFUN |asyMapping| (|bfVar#86| |name?|)
  (PROG (|a| |b| |newa| |op| |r| |args|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#86|))
      (SETQ |b| (CADR |bfVar#86|))
      (SETQ |newa| (|asySig| |a| |name?|))
      (SETQ |b| (|asySig| |b| |name?|))
      (SETQ |args|
              (COND
               ((AND (CONSP |a|)
                     (PROGN (SETQ |op| (CAR |a|)) (SETQ |r| (CDR |a|)) #1='T)
                     (|asyComma?| |op|))
                |newa|)
               (#1# (LIST |a|))))
      (CONS '|Mapping| (CONS |b| |args|))))))

; asyType x ==
;   x is [fn,:r] =>
;     fn = 'Join => asyTypeJoin r
;     MEMQ(fn, '(RestrictTo PretendTo)) => asyType first r
;     asyComma? fn =>
;       u := [asyType x for x in r]
;       u
;     fn = 'With  => asyCATEGORY r
;     fn = '_-_> => asyTypeMapping r
;     fn = 'Apply => r
;     x is '(_%) => '(_%)
;     x
;   x = '_% => '_%
;   x

(DEFUN |asyType| (|x|)
  (PROG (|fn| |r| |u|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |fn| (CAR |x|)) (SETQ |r| (CDR |x|)) #1='T))
       (COND ((EQ |fn| '|Join|) (|asyTypeJoin| |r|))
             ((MEMQ |fn| '(|RestrictTo| |PretendTo|)) (|asyType| (CAR |r|)))
             ((|asyComma?| |fn|)
              (PROGN
               (SETQ |u|
                       ((LAMBDA (|bfVar#88| |bfVar#87| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#87|)
                                 (PROGN (SETQ |x| (CAR |bfVar#87|)) NIL))
                             (RETURN (NREVERSE |bfVar#88|)))
                            (#1#
                             (SETQ |bfVar#88|
                                     (CONS (|asyType| |x|) |bfVar#88|))))
                           (SETQ |bfVar#87| (CDR |bfVar#87|))))
                        NIL |r| NIL))
               |u|))
             ((EQ |fn| '|With|) (|asyCATEGORY| |r|))
             ((EQ |fn| '->) (|asyTypeMapping| |r|)) ((EQ |fn| '|Apply|) |r|)
             ((EQUAL |x| '(%)) '(%)) (#1# |x|)))
      ((EQ |x| '%) '%) (#1# |x|)))))

; asyTypeJoin r ==
;   $conStack : local := nil
;   $opStack  : local := nil
;   $predlist : local := nil
;   for x in r repeat asyTypeJoinPart(x,$predlist)
;   catpart :=
;     $opStack => ['CATEGORY,$kind,:asyTypeJoinStack REVERSE $opStack]
;     nil
;   conpart := asyTypeJoinStack REVERSE $conStack
;   conpart =>
;     catpart     => ['Join,:conpart,catpart]
;     rest conpart => ['Join, :conpart]
;     conpart
;   catpart

(DEFUN |asyTypeJoin| (|r|)
  (PROG (|$predlist| |$opStack| |$conStack| |conpart| |catpart|)
    (DECLARE (SPECIAL |$predlist| |$opStack| |$conStack|))
    (RETURN
     (PROGN
      (SETQ |$conStack| NIL)
      (SETQ |$opStack| NIL)
      (SETQ |$predlist| NIL)
      ((LAMBDA (|bfVar#89| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#89|) (PROGN (SETQ |x| (CAR |bfVar#89|)) NIL))
            (RETURN NIL))
           (#1='T (|asyTypeJoinPart| |x| |$predlist|)))
          (SETQ |bfVar#89| (CDR |bfVar#89|))))
       |r| NIL)
      (SETQ |catpart|
              (COND
               (|$opStack|
                (CONS 'CATEGORY
                      (CONS |$kind|
                            (|asyTypeJoinStack| (REVERSE |$opStack|)))))
               (#1# NIL)))
      (SETQ |conpart| (|asyTypeJoinStack| (REVERSE |$conStack|)))
      (COND
       (|conpart|
        (COND
         (|catpart| (CONS '|Join| (APPEND |conpart| (CONS |catpart| NIL))))
         ((CDR |conpart|) (CONS '|Join| |conpart|)) (#1# |conpart|)))
       (#1# |catpart|))))))

; asyTypeJoinPart(x,$predlist) ==
;   x is ['Join,:y] => for z in y repeat asyTypeJoinPart(z, $predlist)
;   x is ['With,:y] => for p in y repeat asyTypeJoinPartWith p
;   asyTypeJoinPartWith x

(DEFUN |asyTypeJoinPart| (|x| |$predlist|)
  (DECLARE (SPECIAL |$predlist|))
  (PROG (|y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Join|)
            (PROGN (SETQ |y| (CDR |x|)) #1='T))
       ((LAMBDA (|bfVar#90| |z|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#90|) (PROGN (SETQ |z| (CAR |bfVar#90|)) NIL))
             (RETURN NIL))
            (#1# (|asyTypeJoinPart| |z| |$predlist|)))
           (SETQ |bfVar#90| (CDR |bfVar#90|))))
        |y| NIL))
      ((AND (CONSP |x|) (EQ (CAR |x|) '|With|)
            (PROGN (SETQ |y| (CDR |x|)) #1#))
       ((LAMBDA (|bfVar#91| |p|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#91|) (PROGN (SETQ |p| (CAR |bfVar#91|)) NIL))
             (RETURN NIL))
            (#1# (|asyTypeJoinPartWith| |p|)))
           (SETQ |bfVar#91| (CDR |bfVar#91|))))
        |y| NIL))
      (#1# (|asyTypeJoinPartWith| |x|))))))

; asyTypeJoinPartWith x ==
;   x is ['Exports,:y] => for p in y repeat asyTypeJoinPartExport p
;   x is ['Exports,:.] => systemError 'exports
;   x is ['Comma]  => nil
;   x is ['Export,:y]  => nil
;   x is ['IF,:r] => asyTypeJoinPartIf r
;   x is ['Sequence,:x] => for y in x repeat asyTypeJoinItem y
;   asyTypeJoinItem x

(DEFUN |asyTypeJoinPartWith| (|x|)
  (PROG (|y| |r|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Exports|)
            (PROGN (SETQ |y| (CDR |x|)) #1='T))
       ((LAMBDA (|bfVar#92| |p|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#92|) (PROGN (SETQ |p| (CAR |bfVar#92|)) NIL))
             (RETURN NIL))
            (#1# (|asyTypeJoinPartExport| |p|)))
           (SETQ |bfVar#92| (CDR |bfVar#92|))))
        |y| NIL))
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Exports|)) (|systemError| '|exports|))
      ((AND (CONSP |x|) (EQ (CDR |x|) NIL) (EQ (CAR |x|) '|Comma|)) NIL)
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Export|)
            (PROGN (SETQ |y| (CDR |x|)) #1#))
       NIL)
      ((AND (CONSP |x|) (EQ (CAR |x|) 'IF) (PROGN (SETQ |r| (CDR |x|)) #1#))
       (|asyTypeJoinPartIf| |r|))
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Sequence|)
            (PROGN (SETQ |x| (CDR |x|)) #1#))
       ((LAMBDA (|bfVar#93| |y|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#93|) (PROGN (SETQ |y| (CAR |bfVar#93|)) NIL))
             (RETURN NIL))
            (#1# (|asyTypeJoinItem| |y|)))
           (SETQ |bfVar#93| (CDR |bfVar#93|))))
        |x| NIL))
      (#1# (|asyTypeJoinItem| |x|))))))

; asyTypeJoinPartIf [pred,value] ==
;   predlist := [asyTypeJoinPartPred pred,:$predlist]
;   asyTypeJoinPart(value,predlist)

(DEFUN |asyTypeJoinPartIf| (|bfVar#94|)
  (PROG (|pred| |value| |predlist|)
    (RETURN
     (PROGN
      (SETQ |pred| (CAR |bfVar#94|))
      (SETQ |value| (CADR |bfVar#94|))
      (SETQ |predlist| (CONS (|asyTypeJoinPartPred| |pred|) |$predlist|))
      (|asyTypeJoinPart| |value| |predlist|)))))

; asyTypeJoinPartPred x ==
;   x is ['Test, y] => asyTypeUnit y
;   asyTypeUnit x

(DEFUN |asyTypeJoinPartPred| (|x|)
  (PROG (|ISTMP#1| |y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Test|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1='T))))
       (|asyTypeUnit| |y|))
      (#1# (|asyTypeUnit| |x|))))))

; asyTypeJoinItem x ==
;   result := asyTypeUnit x
;   isLowerCaseLetter (PNAME opOf result).0 =>
;     $opStack := [[['ATTRIBUTE,result],:$predlist],:$opStack]
;   $conStack := [[result,:$predlist],:$conStack]

(DEFUN |asyTypeJoinItem| (|x|)
  (PROG (|result|)
    (RETURN
     (PROGN
      (SETQ |result| (|asyTypeUnit| |x|))
      (COND
       ((|isLowerCaseLetter| (ELT (PNAME (|opOf| |result|)) 0))
        (SETQ |$opStack|
                (CONS (CONS (LIST 'ATTRIBUTE |result|) |$predlist|)
                      |$opStack|)))
       ('T
        (SETQ |$conStack| (CONS (CONS |result| |$predlist|) |$conStack|))))))))

; asyTypeMapping([a,b]) ==
;   a := asyTypeUnit a
;   b := asyTypeUnit b
;   args :=
;     a is [op,:r] and asyComma? op => r
;     [a]
;   ['Mapping,b,:args]

(DEFUN |asyTypeMapping| (|bfVar#95|)
  (PROG (|a| |b| |op| |r| |args|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#95|))
      (SETQ |b| (CADR |bfVar#95|))
      (SETQ |a| (|asyTypeUnit| |a|))
      (SETQ |b| (|asyTypeUnit| |b|))
      (SETQ |args|
              (COND
               ((AND (CONSP |a|)
                     (PROGN (SETQ |op| (CAR |a|)) (SETQ |r| (CDR |a|)) #1='T)
                     (|asyComma?| |op|))
                |r|)
               (#1# (LIST |a|))))
      (CONS '|Mapping| (CONS |b| |args|))))))

; asyTypeUnit x ==
;   x is [fn,:r] =>
;     fn = 'Join => systemError 'Join ----->asyTypeJoin r
;     MEMQ(fn, '(RestrictTo PretendTo)) => asyTypeUnit first r
;     asyComma? fn =>
;       u := [asyTypeUnit x for x in r]
;       u
;     fn = 'With  => asyCATEGORY r
;     fn = '_-_> => asyTypeMapping r
;     fn = 'Apply => asyTypeUnitList r
;     fn = 'Declare and r is [name,typ,:.] => asyTypeUnitDeclare(name,typ)
;     x is '(_%) => '(_%)
;     [fn,:asyTypeUnitList r]
;   get_database(x, 'NILADIC) => [x]
;   x = '_% => '_%
;   x

(DEFUN |asyTypeUnit| (|x|)
  (PROG (|fn| |r| |u| |name| |ISTMP#1| |typ|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |fn| (CAR |x|)) (SETQ |r| (CDR |x|)) #1='T))
       (COND ((EQ |fn| '|Join|) (|systemError| '|Join|))
             ((MEMQ |fn| '(|RestrictTo| |PretendTo|))
              (|asyTypeUnit| (CAR |r|)))
             ((|asyComma?| |fn|)
              (PROGN
               (SETQ |u|
                       ((LAMBDA (|bfVar#97| |bfVar#96| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#96|)
                                 (PROGN (SETQ |x| (CAR |bfVar#96|)) NIL))
                             (RETURN (NREVERSE |bfVar#97|)))
                            (#1#
                             (SETQ |bfVar#97|
                                     (CONS (|asyTypeUnit| |x|) |bfVar#97|))))
                           (SETQ |bfVar#96| (CDR |bfVar#96|))))
                        NIL |r| NIL))
               |u|))
             ((EQ |fn| '|With|) (|asyCATEGORY| |r|))
             ((EQ |fn| '->) (|asyTypeMapping| |r|))
             ((EQ |fn| '|Apply|) (|asyTypeUnitList| |r|))
             ((AND (EQ |fn| '|Declare|) (CONSP |r|)
                   (PROGN
                    (SETQ |name| (CAR |r|))
                    (SETQ |ISTMP#1| (CDR |r|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN (SETQ |typ| (CAR |ISTMP#1|)) #1#))))
              (|asyTypeUnitDeclare| |name| |typ|))
             ((EQUAL |x| '(%)) '(%))
             (#1# (CONS |fn| (|asyTypeUnitList| |r|)))))
      ((|get_database| |x| 'NILADIC) (LIST |x|)) ((EQ |x| '%) '%) (#1# |x|)))))

; asyTypeUnitList x == [asyTypeUnit y for y in x]

(DEFUN |asyTypeUnitList| (|x|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#99| |bfVar#98| |y|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#98|) (PROGN (SETQ |y| (CAR |bfVar#98|)) NIL))
           (RETURN (NREVERSE |bfVar#99|)))
          ('T (SETQ |bfVar#99| (CONS (|asyTypeUnit| |y|) |bfVar#99|))))
         (SETQ |bfVar#98| (CDR |bfVar#98|))))
      NIL |x| NIL))))

; asyTypeUnitDeclare(op,typ) ==
;   typ is ['Apply, :r] => asyCatSignature(op,r)
;   asyTypeUnit typ

(DEFUN |asyTypeUnitDeclare| (|op| |typ|)
  (PROG (|r|)
    (RETURN
     (COND
      ((AND (CONSP |typ|) (EQ (CAR |typ|) '|Apply|)
            (PROGN (SETQ |r| (CDR |typ|)) #1='T))
       (|asyCatSignature| |op| |r|))
      (#1# (|asyTypeUnit| |typ|))))))

; asyCATEGORY x ==
;   if x is [join,:y] and join is ['Apply,:s] then
;     exports := y
;     joins :=
;       s is ['Join,:r] => [asyJoinPart u for u in r]
;       [asyJoinPart s]
;   else if x is [id,:y] and IDENTP id then
;     joins := [[id]]
;     exports := y
;   else
;     joins   := nil
;     exports := x
;   cats       := exports
;   operations := nil
;   if exports is [:r,['Exports,:ops]] then
;     cats := r
;     operations := ops
;   exportPart :=
;     ['CATEGORY,'domain,:"APPEND"/[asyCatItem y for y in operations]]
;   cats := "append"/[asyCattran c for c in cats]
;   joins or cats =>
;     ['Join,:joins,:cats, exportPart]
;   exportPart

(DEFUN |asyCATEGORY| (|x|)
  (PROG (|join| |y| |s| |exports| |r| |joins| |id| |cats| |operations|
         |ISTMP#1| |ISTMP#2| |ops| |exportPart|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |x|)
             (PROGN (SETQ |join| (CAR |x|)) (SETQ |y| (CDR |x|)) #1='T)
             (CONSP |join|) (EQ (CAR |join|) '|Apply|)
             (PROGN (SETQ |s| (CDR |join|)) #1#))
        (SETQ |exports| |y|)
        (SETQ |joins|
                (COND
                 ((AND (CONSP |s|) (EQ (CAR |s|) '|Join|)
                       (PROGN (SETQ |r| (CDR |s|)) #1#))
                  ((LAMBDA (|bfVar#101| |bfVar#100| |u|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#100|)
                            (PROGN (SETQ |u| (CAR |bfVar#100|)) NIL))
                        (RETURN (NREVERSE |bfVar#101|)))
                       (#1#
                        (SETQ |bfVar#101|
                                (CONS (|asyJoinPart| |u|) |bfVar#101|))))
                      (SETQ |bfVar#100| (CDR |bfVar#100|))))
                   NIL |r| NIL))
                 (#1# (LIST (|asyJoinPart| |s|))))))
       ((AND (CONSP |x|) (PROGN (SETQ |id| (CAR |x|)) (SETQ |y| (CDR |x|)) #1#)
             (IDENTP |id|))
        (SETQ |joins| (LIST (LIST |id|))) (SETQ |exports| |y|))
       (#1# (SETQ |joins| NIL) (SETQ |exports| |x|)))
      (SETQ |cats| |exports|)
      (SETQ |operations| NIL)
      (COND
       ((AND (CONSP |exports|) (PROGN (SETQ |ISTMP#1| (REVERSE |exports|)) #1#)
             (CONSP |ISTMP#1|)
             (PROGN
              (SETQ |ISTMP#2| (CAR |ISTMP#1|))
              (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Exports|)
                   (PROGN (SETQ |ops| (CDR |ISTMP#2|)) #1#)))
             (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1#)
             (PROGN (SETQ |r| (NREVERSE |r|)) #1#))
        (SETQ |cats| |r|) (SETQ |operations| |ops|)))
      (SETQ |exportPart|
              (CONS 'CATEGORY
                    (CONS '|domain|
                          ((LAMBDA (|bfVar#103| |bfVar#102| |y|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#102|)
                                    (PROGN (SETQ |y| (CAR |bfVar#102|)) NIL))
                                (RETURN |bfVar#103|))
                               (#1#
                                (SETQ |bfVar#103|
                                        (APPEND |bfVar#103|
                                                (|asyCatItem| |y|)))))
                              (SETQ |bfVar#102| (CDR |bfVar#102|))))
                           NIL |operations| NIL))))
      (SETQ |cats|
              ((LAMBDA (|bfVar#105| |bfVar#104| |c|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#104|)
                        (PROGN (SETQ |c| (CAR |bfVar#104|)) NIL))
                    (RETURN |bfVar#105|))
                   (#1#
                    (SETQ |bfVar#105|
                            (APPEND |bfVar#105| (|asyCattran| |c|)))))
                  (SETQ |bfVar#104| (CDR |bfVar#104|))))
               NIL |cats| NIL))
      (COND
       ((OR |joins| |cats|)
        (CONS '|Join|
              (APPEND |joins| (APPEND |cats| (CONS |exportPart| NIL)))))
       (#1# |exportPart|))))))

; simpCattran x ==
;   u := asyCattran x
;   u is [y] => y
;   ['Join,:u]

(DEFUN |simpCattran| (|x|)
  (PROG (|u| |y|)
    (RETURN
     (PROGN
      (SETQ |u| (|asyCattran| |x|))
      (COND
       ((AND (CONSP |u|) (EQ (CDR |u|) NIL) (PROGN (SETQ |y| (CAR |u|)) #1='T))
        |y|)
       (#1# (CONS '|Join| |u|)))))))

; asyCattran x ==
;   x is ['With,:r] => "append"/[asyCattran1 x for x in r]
;   x is ['IF,:.]   => "append"/[asyCattranConstructors(x,nil)]
;   [x]

(DEFUN |asyCattran| (|x|)
  (PROG (|r|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|With|)
            (PROGN (SETQ |r| (CDR |x|)) #1='T))
       ((LAMBDA (|bfVar#107| |bfVar#106| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#106|) (PROGN (SETQ |x| (CAR |bfVar#106|)) NIL))
             (RETURN |bfVar#107|))
            (#1# (SETQ |bfVar#107| (APPEND |bfVar#107| (|asyCattran1| |x|)))))
           (SETQ |bfVar#106| (CDR |bfVar#106|))))
        NIL |r| NIL))
      ((AND (CONSP |x|) (EQ (CAR |x|) 'IF))
       ((LAMBDA (|bfVar#108| |bfVar#110| |bfVar#109|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#110|)
                 (PROGN (SETQ |bfVar#109| (CAR |bfVar#110|)) NIL))
             (RETURN |bfVar#108|))
            (#1# (SETQ |bfVar#108| (APPEND |bfVar#108| |bfVar#109|))))
           (SETQ |bfVar#110| (CDR |bfVar#110|))))
        NIL (LIST (|asyCattranConstructors| |x| NIL)) NIL))
      (#1# (LIST |x|))))))

; asyCattran1 x ==
;   x is ['Exports,:y] => "append"/[asyCattranOp u for u in y]
;   x is ['IF,:.]      => "append"/[asyCattranConstructors(x,nil)]
;   systemError nil

(DEFUN |asyCattran1| (|x|)
  (PROG (|y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|Exports|)
            (PROGN (SETQ |y| (CDR |x|)) #1='T))
       ((LAMBDA (|bfVar#112| |bfVar#111| |u|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#111|) (PROGN (SETQ |u| (CAR |bfVar#111|)) NIL))
             (RETURN |bfVar#112|))
            (#1# (SETQ |bfVar#112| (APPEND |bfVar#112| (|asyCattranOp| |u|)))))
           (SETQ |bfVar#111| (CDR |bfVar#111|))))
        NIL |y| NIL))
      ((AND (CONSP |x|) (EQ (CAR |x|) 'IF))
       ((LAMBDA (|bfVar#113| |bfVar#115| |bfVar#114|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#115|)
                 (PROGN (SETQ |bfVar#114| (CAR |bfVar#115|)) NIL))
             (RETURN |bfVar#113|))
            (#1# (SETQ |bfVar#113| (APPEND |bfVar#113| |bfVar#114|))))
           (SETQ |bfVar#115| (CDR |bfVar#115|))))
        NIL (LIST (|asyCattranConstructors| |x| NIL)) NIL))
      (#1# (|systemError| NIL))))))

; asyCattranOp [op,:items] ==
;   "append"/[asyCattranOp1(op,item,nil) for item in items]

(DEFUN |asyCattranOp| (|bfVar#118|)
  (PROG (|op| |items|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#118|))
      (SETQ |items| (CDR |bfVar#118|))
      ((LAMBDA (|bfVar#117| |bfVar#116| |item|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#116|) (PROGN (SETQ |item| (CAR |bfVar#116|)) NIL))
            (RETURN |bfVar#117|))
           ('T
            (SETQ |bfVar#117|
                    (APPEND |bfVar#117| (|asyCattranOp1| |op| |item| NIL)))))
          (SETQ |bfVar#116| (CDR |bfVar#116|))))
       NIL |items| NIL)))))

; asyCattranOp1(op, item, predlist) ==
;   item is ['IF, p, x] =>
;     pred := asyPredTran
;       p is ['Test,t] => t
;       p
; --    x is ['IF,:.] => "append"/[asyCattranOp1('IF, x, [pred,:predlist])]
; --  This line used to call asyCattranOp1 with too few arguments.  Following
; --  fix suggested by RDJ.
;     x is ['IF,:.] => "append"/[asyCattranOp1(op,y,[pred,:predlist]) for y in x]
;     [['IF, asySimpPred(pred,predlist), asyCattranSig(op,x), 'noBranch]]
;   [asyCattranSig(op,item)]

(DEFUN |asyCattranOp1| (|op| |item| |predlist|)
  (PROG (|ISTMP#1| |p| |ISTMP#2| |x| |t| |pred|)
    (RETURN
     (COND
      ((AND (CONSP |item|) (EQ (CAR |item|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |item|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |p| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |x| (CAR |ISTMP#2|)) #1='T))))))
       (PROGN
        (SETQ |pred|
                (|asyPredTran|
                 (COND
                  ((AND (CONSP |p|) (EQ (CAR |p|) '|Test|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |p|))
                         (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                              (PROGN (SETQ |t| (CAR |ISTMP#1|)) #1#))))
                   |t|)
                  (#1# |p|))))
        (COND
         ((AND (CONSP |x|) (EQ (CAR |x|) 'IF))
          ((LAMBDA (|bfVar#120| |bfVar#119| |y|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#119|)
                    (PROGN (SETQ |y| (CAR |bfVar#119|)) NIL))
                (RETURN |bfVar#120|))
               (#1#
                (SETQ |bfVar#120|
                        (APPEND |bfVar#120|
                                (|asyCattranOp1| |op| |y|
                                 (CONS |pred| |predlist|))))))
              (SETQ |bfVar#119| (CDR |bfVar#119|))))
           NIL |x| NIL))
         (#1#
          (LIST
           (LIST 'IF (|asySimpPred| |pred| |predlist|)
                 (|asyCattranSig| |op| |x|) '|noBranch|))))))
      (#1# (LIST (|asyCattranSig| |op| |item|)))))))

; asyPredTran p == asyPredTran1 asyJoinPart p

(DEFUN |asyPredTran| (|p|)
  (PROG () (RETURN (|asyPredTran1| (|asyJoinPart| |p|)))))

; asyPredTran1 p ==
;   p is ['Has,x,y] => ['has,x, simpCattran y]
;   p is ['Test, q] => asyPredTran1 q
;   p is [op,:r] and MEMQ(op,'(AND OR NOT)) =>
;     [op,:[asyPredTran1 q for q in r]]
;   p

(DEFUN |asyPredTran1| (|p|)
  (PROG (|ISTMP#1| |x| |ISTMP#2| |y| |q| |op| |r|)
    (RETURN
     (COND
      ((AND (CONSP |p|) (EQ (CAR |p|) '|Has|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |p|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1='T))))))
       (LIST '|has| |x| (|simpCattran| |y|)))
      ((AND (CONSP |p|) (EQ (CAR |p|) '|Test|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |p|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |q| (CAR |ISTMP#1|)) #1#))))
       (|asyPredTran1| |q|))
      ((AND (CONSP |p|) (PROGN (SETQ |op| (CAR |p|)) (SETQ |r| (CDR |p|)) #1#)
            (MEMQ |op| '(AND OR NOT)))
       (CONS |op|
             ((LAMBDA (|bfVar#122| |bfVar#121| |q|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#121|)
                       (PROGN (SETQ |q| (CAR |bfVar#121|)) NIL))
                   (RETURN (NREVERSE |bfVar#122|)))
                  (#1#
                   (SETQ |bfVar#122| (CONS (|asyPredTran1| |q|) |bfVar#122|))))
                 (SETQ |bfVar#121| (CDR |bfVar#121|))))
              NIL |r| NIL)))
      (#1# |p|)))))

; asyCattranConstructors(item, predlist) ==
;   item is ['IF, p, x] =>
;     pred := asyPredTran
;       p is ['Test,t] => t
;       p
;     x is ['IF,:.] => "append"/[asyCattranConstructors(x, [pred,:predlist])]
;     form := ['ATTRIBUTE, asyJoinPart x]
;     [['IF, asySimpPred(pred,predlist), form, 'noBranch]]
;   systemError()

(DEFUN |asyCattranConstructors| (|item| |predlist|)
  (PROG (|ISTMP#1| |p| |ISTMP#2| |x| |t| |pred| |form|)
    (RETURN
     (COND
      ((AND (CONSP |item|) (EQ (CAR |item|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |item|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |p| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |x| (CAR |ISTMP#2|)) #1='T))))))
       (PROGN
        (SETQ |pred|
                (|asyPredTran|
                 (COND
                  ((AND (CONSP |p|) (EQ (CAR |p|) '|Test|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |p|))
                         (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                              (PROGN (SETQ |t| (CAR |ISTMP#1|)) #1#))))
                   |t|)
                  (#1# |p|))))
        (COND
         ((AND (CONSP |x|) (EQ (CAR |x|) 'IF))
          ((LAMBDA (|bfVar#123| |bfVar#125| |bfVar#124|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#125|)
                    (PROGN (SETQ |bfVar#124| (CAR |bfVar#125|)) NIL))
                (RETURN |bfVar#123|))
               (#1# (SETQ |bfVar#123| (APPEND |bfVar#123| |bfVar#124|))))
              (SETQ |bfVar#125| (CDR |bfVar#125|))))
           NIL (LIST (|asyCattranConstructors| |x| (CONS |pred| |predlist|)))
           NIL))
         (#1#
          (PROGN
           (SETQ |form| (LIST 'ATTRIBUTE (|asyJoinPart| |x|)))
           (LIST
            (LIST 'IF (|asySimpPred| |pred| |predlist|) |form|
                  '|noBranch|)))))))
      (#1# (|systemError|))))))

; asySimpPred(p, predlist) ==
;   while predlist is [q,:predlist] repeat p := quickAnd(q,p)
;   p

(DEFUN |asySimpPred| (|p| |predlist|)
  (PROG (|q|)
    (RETURN
     (PROGN
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT
             (AND (CONSP |predlist|)
                  (PROGN
                   (SETQ |q| (CAR |predlist|))
                   (SETQ |predlist| (CDR |predlist|))
                   #1='T)))
            (RETURN NIL))
           (#1# (SETQ |p| (|quickAnd| |q| |p|)))))))
      |p|))))

; asyCattranSig(op,y) ==
;   y isnt ["->",source,t] =>
; -- following makes constants into nullary functions
;      ['SIGNATURE, op, [asyTypeUnit y]]
;   s :=
;     source is ['Comma,:s] => [asyTypeUnit z for z in s]
;     [asyTypeUnit source]
;   t := asyTypeUnit t
;   null t => ['SIGNATURE,op,s]
;   ['SIGNATURE,op,[t,:s]]

(DEFUN |asyCattranSig| (|op| |y|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |t| |s|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |y|) (EQ (CAR |y|) '->)
             (PROGN
              (SETQ |ISTMP#1| (CDR |y|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |source| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1='T)))))))
       (LIST 'SIGNATURE |op| (LIST (|asyTypeUnit| |y|))))
      (#1#
       (PROGN
        (SETQ |s|
                (COND
                 ((AND (CONSP |source|) (EQ (CAR |source|) '|Comma|)
                       (PROGN (SETQ |s| (CDR |source|)) #1#))
                  ((LAMBDA (|bfVar#127| |bfVar#126| |z|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#126|)
                            (PROGN (SETQ |z| (CAR |bfVar#126|)) NIL))
                        (RETURN (NREVERSE |bfVar#127|)))
                       (#1#
                        (SETQ |bfVar#127|
                                (CONS (|asyTypeUnit| |z|) |bfVar#127|))))
                      (SETQ |bfVar#126| (CDR |bfVar#126|))))
                   NIL |s| NIL))
                 (#1# (LIST (|asyTypeUnit| |source|)))))
        (SETQ |t| (|asyTypeUnit| |t|))
        (COND ((NULL |t|) (LIST 'SIGNATURE |op| |s|))
              (#1# (LIST 'SIGNATURE |op| (CONS |t| |s|))))))))))

; asyJoinPart x ==
;   IDENTP x => [x]
;   asytranForm(x,nil,true)

(DEFUN |asyJoinPart| (|x|)
  (PROG ()
    (RETURN (COND ((IDENTP |x|) (LIST |x|)) ('T (|asytranForm| |x| NIL T))))))

; asyCatItem item ==
;   atom item  => [item]
;   item is ['IF,.,.] => [item]
;   [op,:sigs] := item
;   [asyCatSignature(op,sig) for sig in sigs | sig]

(DEFUN |asyCatItem| (|item|)
  (PROG (|ISTMP#1| |ISTMP#2| |op| |sigs|)
    (RETURN
     (COND ((ATOM |item|) (LIST |item|))
           ((AND (CONSP |item|) (EQ (CAR |item|) 'IF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |item|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL))))))
            (LIST |item|))
           (#1='T
            (PROGN
             (SETQ |op| (CAR |item|))
             (SETQ |sigs| (CDR |item|))
             ((LAMBDA (|bfVar#129| |bfVar#128| |sig|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#128|)
                       (PROGN (SETQ |sig| (CAR |bfVar#128|)) NIL))
                   (RETURN (NREVERSE |bfVar#129|)))
                  (#1#
                   (AND |sig|
                        (SETQ |bfVar#129|
                                (CONS (|asyCatSignature| |op| |sig|)
                                      |bfVar#129|)))))
                 (SETQ |bfVar#128| (CDR |bfVar#128|))))
              NIL |sigs| NIL)))))))

; asyCatSignature(op,sig) ==
;   sig is ['_-_>,source,target] =>
;      ['SIGNATURE,op, [asyTypeItem target,:asyUnTuple source]]
;   ----------> Constants change <--------------
; -- following line converts constants into nullary functions
;   ['SIGNATURE,op,[asyTypeItem sig]]

(DEFUN |asyCatSignature| (|op| |sig|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |target|)
    (RETURN
     (COND
      ((AND (CONSP |sig|) (EQ (CAR |sig|) '->)
            (PROGN
             (SETQ |ISTMP#1| (CDR |sig|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |source| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1='T))))))
       (LIST 'SIGNATURE |op|
             (CONS (|asyTypeItem| |target|) (|asyUnTuple| |source|))))
      (#1# (LIST 'SIGNATURE |op| (LIST (|asyTypeItem| |sig|))))))))

; asyUnTuple x ==
;   x is [op,:u] and asyComma? op => [asyTypeItem y for y in u]
;   [asyTypeItem x]

(DEFUN |asyUnTuple| (|x|)
  (PROG (|op| |u|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |u| (CDR |x|)) #1='T)
            (|asyComma?| |op|))
       ((LAMBDA (|bfVar#131| |bfVar#130| |y|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#130|) (PROGN (SETQ |y| (CAR |bfVar#130|)) NIL))
             (RETURN (NREVERSE |bfVar#131|)))
            (#1# (SETQ |bfVar#131| (CONS (|asyTypeItem| |y|) |bfVar#131|))))
           (SETQ |bfVar#130| (CDR |bfVar#130|))))
        NIL |u| NIL))
      (#1# (LIST (|asyTypeItem| |x|)))))))

; asyTypeItem x ==
;   atom x =>
;     x = '_%         => '_%
;     x
;   x is ['_-_>,a,b] =>
;       ['Mapping,b,:asyUnTuple a]
;   x is ['Apply,:r] =>
;     r is ['_-_>,a,b] =>
;       ['Mapping,b,:asyUnTuple a]
;     r is ['Record,:parts] =>
;       ['Record,:[[":",a,b] for ['Declare,a,b,:.] in parts]]
;     r is ['Segment,:parts] =>
;       ['Segment,:[asyTypeItem x for x in parts]]
;     asytranApply(x,nil,true)
;   x is ['Declare,.,t,:.] => asyTypeItem t
;   x is ['Comma,:args] =>
;     -- this implies a multiple value return, not currently supported
;     -- in the interpreter
;     args => ['Multi,:[asyTypeItem y for y in args]]
;     ['Void]
;   [asyTypeItem y for y in x]

(DEFUN |asyTypeItem| (|x|)
  (PROG (|ISTMP#1| |a| |ISTMP#2| |b| |r| |parts| |t| |args|)
    (RETURN
     (COND ((ATOM |x|) (COND ((EQ |x| '%) '%) (#1='T |x|)))
           ((AND (CONSP |x|) (EQ (CAR |x|) '->)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |a| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
            (CONS '|Mapping| (CONS |b| (|asyUnTuple| |a|))))
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Apply|)
                 (PROGN (SETQ |r| (CDR |x|)) #1#))
            (COND
             ((AND (CONSP |r|) (EQ (CAR |r|) '->)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |r|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |a| (CAR |ISTMP#1|))
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
              (CONS '|Mapping| (CONS |b| (|asyUnTuple| |a|))))
             ((AND (CONSP |r|) (EQ (CAR |r|) '|Record|)
                   (PROGN (SETQ |parts| (CDR |r|)) #1#))
              (CONS '|Record|
                    ((LAMBDA (|bfVar#134| |bfVar#133| |bfVar#132|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#133|)
                              (PROGN (SETQ |bfVar#132| (CAR |bfVar#133|)) NIL))
                          (RETURN (NREVERSE |bfVar#134|)))
                         (#1#
                          (AND (CONSP |bfVar#132|)
                               (EQ (CAR |bfVar#132|) '|Declare|)
                               (PROGN
                                (SETQ |ISTMP#1| (CDR |bfVar#132|))
                                (AND (CONSP |ISTMP#1|)
                                     (PROGN
                                      (SETQ |a| (CAR |ISTMP#1|))
                                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                      (AND (CONSP |ISTMP#2|)
                                           (PROGN
                                            (SETQ |b| (CAR |ISTMP#2|))
                                            #1#)))))
                               (SETQ |bfVar#134|
                                       (CONS (LIST '|:| |a| |b|)
                                             |bfVar#134|)))))
                        (SETQ |bfVar#133| (CDR |bfVar#133|))))
                     NIL |parts| NIL)))
             ((AND (CONSP |r|) (EQ (CAR |r|) '|Segment|)
                   (PROGN (SETQ |parts| (CDR |r|)) #1#))
              (CONS '|Segment|
                    ((LAMBDA (|bfVar#136| |bfVar#135| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#135|)
                              (PROGN (SETQ |x| (CAR |bfVar#135|)) NIL))
                          (RETURN (NREVERSE |bfVar#136|)))
                         (#1#
                          (SETQ |bfVar#136|
                                  (CONS (|asyTypeItem| |x|) |bfVar#136|))))
                        (SETQ |bfVar#135| (CDR |bfVar#135|))))
                     NIL |parts| NIL)))
             (#1# (|asytranApply| |x| NIL T))))
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Declare|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1#))))))
            (|asyTypeItem| |t|))
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Comma|)
                 (PROGN (SETQ |args| (CDR |x|)) #1#))
            (COND
             (|args|
              (CONS '|Multi|
                    ((LAMBDA (|bfVar#138| |bfVar#137| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#137|)
                              (PROGN (SETQ |y| (CAR |bfVar#137|)) NIL))
                          (RETURN (NREVERSE |bfVar#138|)))
                         (#1#
                          (SETQ |bfVar#138|
                                  (CONS (|asyTypeItem| |y|) |bfVar#138|))))
                        (SETQ |bfVar#137| (CDR |bfVar#137|))))
                     NIL |args| NIL)))
             (#1# (LIST '|Void|))))
           (#1#
            ((LAMBDA (|bfVar#140| |bfVar#139| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#139|)
                      (PROGN (SETQ |y| (CAR |bfVar#139|)) NIL))
                  (RETURN (NREVERSE |bfVar#140|)))
                 (#1#
                  (SETQ |bfVar#140| (CONS (|asyTypeItem| |y|) |bfVar#140|))))
                (SETQ |bfVar#139| (CDR |bfVar#139|))))
             NIL |x| NIL))))))

; asyComma? op == MEMQ(op,'(Comma Multi))

(DEFUN |asyComma?| (|op|) (PROG () (RETURN (MEMQ |op| '(|Comma| |Multi|)))))

; hput(table,name,value) ==
;   if null name then systemError()
;   HPUT(table,name,value)

(DEFUN |hput| (|table| |name| |value|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((NULL |name|) (|systemError|)))
      (HPUT |table| |name| |value|)))))

; asyTypeJoinPartExport x ==
;   [op,:items] := x
;   for y in items repeat
;     y isnt ["->",source,t] =>
; -- converts constants to nullary functions (this code isn't dead)
;        sig := ['SIGNATURE, op, [asyTypeUnit y]]
;        $opStack := [[sig,:$predlist],:$opStack]
;     s :=
;       source is ['Comma,:s] => [asyTypeUnit z for z in s]
;       [asyTypeUnit source]
;     t := asyTypeUnit t
;     sig :=
;       null t => ['SIGNATURE,op,s]
;       ['SIGNATURE,op,[t,:s]]
;     $opStack := [[sig,:$predlist],:$opStack]

(DEFUN |asyTypeJoinPartExport| (|x|)
  (PROG (|op| |items| |ISTMP#1| |source| |ISTMP#2| |t| |sig| |s|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |x|))
      (SETQ |items| (CDR |x|))
      ((LAMBDA (|bfVar#141| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#141|) (PROGN (SETQ |y| (CAR |bfVar#141|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((NOT
               (AND (CONSP |y|) (EQ (CAR |y|) '->)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |y|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |source| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |t| (CAR |ISTMP#2|)) #1#)))))))
              (PROGN
               (SETQ |sig| (LIST 'SIGNATURE |op| (LIST (|asyTypeUnit| |y|))))
               (SETQ |$opStack| (CONS (CONS |sig| |$predlist|) |$opStack|))))
             (#1#
              (PROGN
               (SETQ |s|
                       (COND
                        ((AND (CONSP |source|) (EQ (CAR |source|) '|Comma|)
                              (PROGN (SETQ |s| (CDR |source|)) #1#))
                         ((LAMBDA (|bfVar#143| |bfVar#142| |z|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#142|)
                                   (PROGN (SETQ |z| (CAR |bfVar#142|)) NIL))
                               (RETURN (NREVERSE |bfVar#143|)))
                              (#1#
                               (SETQ |bfVar#143|
                                       (CONS (|asyTypeUnit| |z|)
                                             |bfVar#143|))))
                             (SETQ |bfVar#142| (CDR |bfVar#142|))))
                          NIL |s| NIL))
                        (#1# (LIST (|asyTypeUnit| |source|)))))
               (SETQ |t| (|asyTypeUnit| |t|))
               (SETQ |sig|
                       (COND ((NULL |t|) (LIST 'SIGNATURE |op| |s|))
                             (#1# (LIST 'SIGNATURE |op| (CONS |t| |s|)))))
               (SETQ |$opStack|
                       (CONS (CONS |sig| |$predlist|) |$opStack|)))))))
          (SETQ |bfVar#141| (CDR |bfVar#141|))))
       |items| NIL)))))

; asyTypeJoinStack r ==
;   al := [[[x while r is [[x, :q],:s] and p = q and (r := s; true)],:p]
;            while r is [[.,:p],:.]]
;   result := "append"/[fn for [y,:p] in al] where fn ==
;     p => [['IF,asyTypeMakePred p,:y]]
;     y
;   result

(DEFUN |asyTypeJoinStack| (|r|)
  (PROG (|ISTMP#1| |p| |x| |q| |s| |al| |y| |result|)
    (RETURN
     (PROGN
      (SETQ |al|
              ((LAMBDA (|bfVar#145|)
                 (LOOP
                  (COND
                   ((NOT
                     (AND (CONSP |r|)
                          (PROGN
                           (SETQ |ISTMP#1| (CAR |r|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN (SETQ |p| (CDR |ISTMP#1|)) #1='T)))))
                    (RETURN (NREVERSE |bfVar#145|)))
                   (#1#
                    (SETQ |bfVar#145|
                            (CONS
                             (CONS
                              ((LAMBDA (|bfVar#144|)
                                 (LOOP
                                  (COND
                                   ((NOT
                                     (AND (CONSP |r|)
                                          (PROGN
                                           (SETQ |ISTMP#1| (CAR |r|))
                                           (AND (CONSP |ISTMP#1|)
                                                (PROGN
                                                 (SETQ |x| (CAR |ISTMP#1|))
                                                 (SETQ |q| (CDR |ISTMP#1|))
                                                 #1#)))
                                          (PROGN (SETQ |s| (CDR |r|)) #1#)
                                          (EQUAL |p| |q|)
                                          (PROGN (SETQ |r| |s|) T)))
                                    (RETURN (NREVERSE |bfVar#144|)))
                                   (#1#
                                    (SETQ |bfVar#144|
                                            (CONS |x| |bfVar#144|))))))
                               NIL)
                              |p|)
                             |bfVar#145|))))))
               NIL))
      (SETQ |result|
              ((LAMBDA (|bfVar#148| |bfVar#147| |bfVar#146|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#147|)
                        (PROGN (SETQ |bfVar#146| (CAR |bfVar#147|)) NIL))
                    (RETURN |bfVar#148|))
                   (#1#
                    (AND (CONSP |bfVar#146|)
                         (PROGN
                          (SETQ |y| (CAR |bfVar#146|))
                          (SETQ |p| (CDR |bfVar#146|))
                          #1#)
                         (SETQ |bfVar#148|
                                 (APPEND |bfVar#148|
                                         (COND
                                          (|p|
                                           (LIST
                                            (CONS 'IF
                                                  (CONS (|asyTypeMakePred| |p|)
                                                        |y|))))
                                          (#1# |y|)))))))
                  (SETQ |bfVar#147| (CDR |bfVar#147|))))
               NIL |al| NIL))
      |result|))))

; asyTypeMakePred [p,:u] ==
;   while u is [q,:u] repeat p := quickAnd(q,p)
;   p

(DEFUN |asyTypeMakePred| (|bfVar#149|)
  (PROG (|p| |u| |q|)
    (RETURN
     (PROGN
      (SETQ |p| (CAR |bfVar#149|))
      (SETQ |u| (CDR |bfVar#149|))
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT
             (AND (CONSP |u|)
                  (PROGN (SETQ |q| (CAR |u|)) (SETQ |u| (CDR |u|)) #1='T)))
            (RETURN NIL))
           (#1# (SETQ |p| (|quickAnd| |q| |p|)))))))
      |p|))))
