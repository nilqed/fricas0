
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $stripTypes := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$stripTypes| NIL))

; $pretendFlag := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$pretendFlag| NIL))

; $modemapArgs := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$modemapArgs| NIL))

; $augmentedArgs := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$augmentedArgs| NIL))

; $defaultFlag := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$defaultFlag| NIL))

; $baseForms := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$baseForms| NIL))

; $literals  := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$literals| NIL))

; $foreignTag := 'Foreign

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$foreignTag| '|Foreign|))

; setForeignStyle(tag) ==
;     $foreignTag := tag

(DEFUN |setForeignStyle| (|tag|) (PROG () (RETURN (SETQ |$foreignTag| |tag|))))

; $conditionalCast := true

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$conditionalCast| T))

; setConditionalCast(flg) ==
;     $conditionalCast := flg

(DEFUN |setConditionalCast| (|flg|)
  (PROG () (RETURN (SETQ |$conditionalCast| |flg|))))

; $extendedDomains := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$extendedDomains| NIL))

; setExtendedDomains(l) ==
;         $extendedDomains := l

(DEFUN |setExtendedDomains| (|l|)
  (PROG () (RETURN (SETQ |$extendedDomains| |l|))))

; makeAxExportForm(filename, constructors) ==
;   $defaultFlag : local := false
;   $literals := []
;   -- Note that Tuple, Exit, Type are language defined identifiers
;   -- in Aldor.
;   axForms :=
;      [modemapToAx(modemap) for cname in constructors |
;             (modemap := get_database(cname, 'CONSTRUCTORMODEMAP)) and
;               (not (cname in '(Tuple Exit Type))) and
;                 not isDefaultPackageName cname]
;   if $baseForms then
;      axForms := [:$baseForms, :axForms]
;   -- If the category has a default definition then $defaultFlag will be true.
;   -- That is used to give dummy definitions for functions inside the
;   -- default body.
;   if $defaultFlag then
;      axForms :=
;         [[$foreignTag, ['Declare, 'dummyDefault, 'Exit], 'Lisp], :axForms]
;   axForms := APPEND(axDoLiterals(), axForms)
;   axForm := ['Sequence, _
;                ['Import, [], 'FriCASLib], ['Import, [], 'Boolean], :axForms]
;   axForm

(DEFUN |makeAxExportForm| (|filename| |constructors|)
  (PROG (|$defaultFlag| |axForm| |axForms| |modemap|)
    (DECLARE (SPECIAL |$defaultFlag|))
    (RETURN
     (PROGN
      (SETQ |$defaultFlag| NIL)
      (SETQ |$literals| NIL)
      (SETQ |axForms|
              ((LAMBDA (|bfVar#2| |bfVar#1| |cname|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |cname| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   ('T
                    (AND
                     (SETQ |modemap|
                             (|get_database| |cname| 'CONSTRUCTORMODEMAP))
                     (NULL (|member| |cname| '(|Tuple| |Exit| |Type|)))
                     (NULL (|isDefaultPackageName| |cname|))
                     (SETQ |bfVar#2|
                             (CONS (|modemapToAx| |modemap|) |bfVar#2|)))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |constructors| NIL))
      (COND (|$baseForms| (SETQ |axForms| (APPEND |$baseForms| |axForms|))))
      (COND
       (|$defaultFlag|
        (SETQ |axForms|
                (CONS
                 (LIST |$foreignTag| (LIST '|Declare| '|dummyDefault| '|Exit|)
                       '|Lisp|)
                 |axForms|))))
      (SETQ |axForms| (APPEND (|axDoLiterals|) |axForms|))
      (SETQ |axForm|
              (CONS '|Sequence|
                    (CONS (LIST '|Import| NIL '|FriCASLib|)
                          (CONS (LIST '|Import| NIL '|Boolean|) |axForms|))))
      |axForm|))))

; stripType type ==
;   $stripTypes =>
;      categoryForm? type => 'Type
;      type
;   type

(DEFUN |stripType| (|type|)
  (PROG ()
    (RETURN
     (COND
      (|$stripTypes| (COND ((|categoryForm?| |type|) '|Type|) (#1='T |type|)))
      (#1# |type|)))))

; modemapToAx(modemap) ==
;   modemap is [[consform, target,:argtypes],.]
;   consform is [constructor,:args]
;
;   -- Category forms show |t#i| instead of |#i|. In atypes |t#i| is replaced
;   -- by |#i|.
;   atypes := if categoryForm? consform then
;       SUBLISLIS($FormalMapVariableList, $TriangleVariableList, argtypes)
;     else
;       argtypes
;   $modemapArgs : local := [cons(a,t) for a in args for t in atypes]
;
;   argdecls:=['Comma, : [axFormatDecl(a, stripType t, true) for a in args for t in argtypes]]
;   resultType :=  axFormatType stripType target
;   categoryForm? constructor =>
;       categoryInfo := get_database(constructor, 'CONSTRUCTORCATEGORY)
;       categoryInfo := SUBLISLIS($FormalMapVariableList, $TriangleVariableList,
;                        categoryInfo)
;       NULL args =>
;           ['Define,['Declare, constructor,'Category],
;                addDefaults(constructor, axFormatType categoryInfo)]
;       ['Define,
;           ['Declare, constructor, ['Apply, "->", optcomma argdecls, 'Category]],
;            ['Lambda, argdecls, 'Category,
;              ['Label, constructor,
;                addDefaults(constructor, axFormatType categoryInfo)]]]
;   constructor in $extendedDomains =>
;      NULL args =>
;         ['Extend, ['Define, ['Declare, constructor, resultType],
;             ['Add, ['PretendTo, ['Add, [], []], resultType], []]]]
;      conscat := INTERN(STRCONC(SYMBOL_-NAME(constructor), "ExtendCategory"),"BOOT")
;      rtype := ['Apply, conscat, :args]
;      consdef := ['Define,
;         ['Declare, conscat, ['Apply, "->", optcomma argdecls, 'Category]],
;           ['Lambda, argdecls, 'Category, ['Label, conscat, resultType]]]
;      ['Sequence, consdef,
;       ['Extend, ['Define,
;         ['Declare, constructor, ['Apply, "->", optcomma argdecls, rtype]],
;           ['Lambda, argdecls, rtype,
;             ['Label, constructor,
;                 ['Add, ['PretendTo, ['Add, [], []], rtype], []]]]]]]
;   NULL args =>
;      ['Export, ['Declare, constructor, resultType],[],[]]
;   ['Export, ['Declare, constructor, ['Apply, "->", optcomma argdecls, resultType]],[],[]]

(DEFUN |modemapToAx| (|modemap|)
  (PROG (|$modemapArgs| |consdef| |rtype| |conscat| |categoryInfo| |resultType|
         |argdecls| |atypes| |args| |constructor| |ISTMP#3| |argtypes| |target|
         |ISTMP#2| |consform| |ISTMP#1|)
    (DECLARE (SPECIAL |$modemapArgs|))
    (RETURN
     (PROGN
      (AND (CONSP |modemap|)
           (PROGN
            (SETQ |ISTMP#1| (CAR |modemap|))
            (AND (CONSP |ISTMP#1|)
                 (PROGN
                  (SETQ |consform| (CAR |ISTMP#1|))
                  (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                  (AND (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |target| (CAR |ISTMP#2|))
                        (SETQ |argtypes| (CDR |ISTMP#2|))
                        #1='T)))))
           (PROGN
            (SETQ |ISTMP#3| (CDR |modemap|))
            (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL))))
      (AND (CONSP |consform|)
           (PROGN
            (SETQ |constructor| (CAR |consform|))
            (SETQ |args| (CDR |consform|))
            #1#))
      (SETQ |atypes|
              (COND
               ((|categoryForm?| |consform|)
                (SUBLISLIS |$FormalMapVariableList| |$TriangleVariableList|
                 |argtypes|))
               (#1# |argtypes|)))
      (SETQ |$modemapArgs|
              ((LAMBDA (|bfVar#5| |bfVar#3| |a| |bfVar#4| |t|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#3|) (PROGN (SETQ |a| (CAR |bfVar#3|)) NIL)
                        (ATOM |bfVar#4|)
                        (PROGN (SETQ |t| (CAR |bfVar#4|)) NIL))
                    (RETURN (NREVERSE |bfVar#5|)))
                   (#1# (SETQ |bfVar#5| (CONS (CONS |a| |t|) |bfVar#5|))))
                  (SETQ |bfVar#3| (CDR |bfVar#3|))
                  (SETQ |bfVar#4| (CDR |bfVar#4|))))
               NIL |args| NIL |atypes| NIL))
      (SETQ |argdecls|
              (CONS '|Comma|
                    ((LAMBDA (|bfVar#8| |bfVar#6| |a| |bfVar#7| |t|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#6|)
                              (PROGN (SETQ |a| (CAR |bfVar#6|)) NIL)
                              (ATOM |bfVar#7|)
                              (PROGN (SETQ |t| (CAR |bfVar#7|)) NIL))
                          (RETURN (NREVERSE |bfVar#8|)))
                         (#1#
                          (SETQ |bfVar#8|
                                  (CONS
                                   (|axFormatDecl| |a| (|stripType| |t|) T)
                                   |bfVar#8|))))
                        (SETQ |bfVar#6| (CDR |bfVar#6|))
                        (SETQ |bfVar#7| (CDR |bfVar#7|))))
                     NIL |args| NIL |argtypes| NIL)))
      (SETQ |resultType| (|axFormatType| (|stripType| |target|)))
      (COND
       ((|categoryForm?| |constructor|)
        (PROGN
         (SETQ |categoryInfo|
                 (|get_database| |constructor| 'CONSTRUCTORCATEGORY))
         (SETQ |categoryInfo|
                 (SUBLISLIS |$FormalMapVariableList| |$TriangleVariableList|
                  |categoryInfo|))
         (COND
          ((NULL |args|)
           (LIST '|Define| (LIST '|Declare| |constructor| '|Category|)
                 (|addDefaults| |constructor|
                  (|axFormatType| |categoryInfo|))))
          (#1#
           (LIST '|Define|
                 (LIST '|Declare| |constructor|
                       (LIST '|Apply| '-> (|optcomma| |argdecls|) '|Category|))
                 (LIST '|Lambda| |argdecls| '|Category|
                       (LIST '|Label| |constructor|
                             (|addDefaults| |constructor|
                              (|axFormatType| |categoryInfo|)))))))))
       ((|member| |constructor| |$extendedDomains|)
        (COND
         ((NULL |args|)
          (LIST '|Extend|
                (LIST '|Define| (LIST '|Declare| |constructor| |resultType|)
                      (LIST '|Add|
                            (LIST '|PretendTo| (LIST '|Add| NIL NIL)
                                  |resultType|)
                            NIL))))
         (#1#
          (PROGN
           (SETQ |conscat|
                   (INTERN
                    (STRCONC (SYMBOL-NAME |constructor|) '|ExtendCategory|)
                    'BOOT))
           (SETQ |rtype| (CONS '|Apply| (CONS |conscat| |args|)))
           (SETQ |consdef|
                   (LIST '|Define|
                         (LIST '|Declare| |conscat|
                               (LIST '|Apply| '-> (|optcomma| |argdecls|)
                                     '|Category|))
                         (LIST '|Lambda| |argdecls| '|Category|
                               (LIST '|Label| |conscat| |resultType|))))
           (LIST '|Sequence| |consdef|
                 (LIST '|Extend|
                       (LIST '|Define|
                             (LIST '|Declare| |constructor|
                                   (LIST '|Apply| '-> (|optcomma| |argdecls|)
                                         |rtype|))
                             (LIST '|Lambda| |argdecls| |rtype|
                                   (LIST '|Label| |constructor|
                                         (LIST '|Add|
                                               (LIST '|PretendTo|
                                                     (LIST '|Add| NIL NIL)
                                                     |rtype|)
                                               NIL))))))))))
       ((NULL |args|)
        (LIST '|Export| (LIST '|Declare| |constructor| |resultType|) NIL NIL))
       (#1#
        (LIST '|Export|
              (LIST '|Declare| |constructor|
                    (LIST '|Apply| '-> (|optcomma| |argdecls|) |resultType|))
              NIL NIL)))))))

; optcomma [op,:args] ==
;    # args = 1 => first args
;    [op,:args]

(DEFUN |optcomma| (|bfVar#9|)
  (PROG (|op| |args|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#9|))
      (SETQ |args| (CDR |bfVar#9|))
      (COND ((EQL (LENGTH |args|) 1) (CAR |args|)) ('T (CONS |op| |args|)))))))

; axFormatDecl(sym, type, flg) ==
;    type is ['Join, :.] => ['Declare, sym, axFormatType type]
;    type is ['CATEGORY, :.] => ['Declare, sym, axFormatType type]
;    flg and containsSelf? type =>
;        ['Declare, sym, ['With, [], axFormatType type]]
;    ['Declare, sym, axFormatType type]

(DEFUN |axFormatDecl| (|sym| |type| |flg|)
  (PROG ()
    (RETURN
     (COND
      ((AND (CONSP |type|) (EQ (CAR |type|) '|Join|))
       (LIST '|Declare| |sym| (|axFormatType| |type|)))
      ((AND (CONSP |type|) (EQ (CAR |type|) 'CATEGORY))
       (LIST '|Declare| |sym| (|axFormatType| |type|)))
      ((AND |flg| (|containsSelf?| |type|))
       (LIST '|Declare| |sym| (LIST '|With| NIL (|axFormatType| |type|))))
      ('T (LIST '|Declare| |sym| (|axFormatType| |type|)))))))

; containsSelf? type ==
;     type is [op, :args] => or/[containsSelf? arg for arg in args]
;     type is '%

(DEFUN |containsSelf?| (|type|)
  (PROG (|op| |args|)
    (RETURN
     (COND
      ((AND (CONSP |type|)
            (PROGN (SETQ |op| (CAR |type|)) (SETQ |args| (CDR |type|)) #1='T))
       ((LAMBDA (|bfVar#11| |bfVar#10| |arg|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#10|) (PROGN (SETQ |arg| (CAR |bfVar#10|)) NIL))
             (RETURN |bfVar#11|))
            (#1#
             (PROGN
              (SETQ |bfVar#11| (|containsSelf?| |arg|))
              (COND (|bfVar#11| (RETURN |bfVar#11|))))))
           (SETQ |bfVar#10| (CDR |bfVar#10|))))
        NIL |args| NIL))
      (#1# (EQ |type| '%))))))

; makeTypeSequence l ==
;    ['Sequence,: delete('Type, l)]

(DEFUN |makeTypeSequence| (|l|)
  (PROG () (RETURN (CONS '|Sequence| (|delete| '|Type| |l|)))))

; axFormatAttrib(typeform) ==
;   atom typeform => typeform
;   axFormatType typeform

(DEFUN |axFormatAttrib| (|typeform|)
  (PROG ()
    (RETURN
     (COND ((ATOM |typeform|) |typeform|) ('T (|axFormatType| |typeform|))))))

; axFormatType(typeform) ==
;   atom typeform =>
;      typeform = '% => '%
;      STRINGP typeform =>
;         ['Apply,'Enumeration, INTERN typeform]
;      INTEGERP typeform =>
;         -- need to test for PositiveInteger vs Integer
;         typeform = 0 =>
;            axAddLiteral('integer, 'Integer, 'Literal)
;            ['RestrictTo, ['LitInteger, '"0"], 'Integer]
;         axAddLiteral('integer, 'PositiveInteger, 'Literal)
;         ['RestrictTo, ['LitInteger, STRINGIMAGE typeform ], 'PositiveInteger]
;      FLOATP typeform => ['LitFloat, STRINGIMAGE typeform]
;      MEMQ(typeform,$TriangleVariableList) =>
;         SUBLISLIS($FormalMapVariableList, $TriangleVariableList, typeform)
;      MEMQ(typeform, $FormalMapVariableList) => typeform
;      axAddLiteral('string, 'Symbol, 'Literal)
;      ['RestrictTo, ['LitString, PNAME typeform], 'Symbol]
;   typeform is ['construct,: args] =>
;       axAddLiteral('bracket, ['Apply, 'List, 'Symbol], [ 'Apply, 'Tuple, 'Symbol])
;       axAddLiteral('string, 'Symbol, 'Literal)
;       ['RestrictTo, ['Apply, 'bracket,
;                         :[axFormatType a for a in args]],
;                           ['Apply, 'List, 'Symbol] ]
;   typeform is [op] =>
;     op = 'Void => ['Comma]
;     op
;   typeform is ['local, val] => axFormatType val
;   typeform is ['QUOTE, val] => axFormatType val
;   typeform is ['Join,:cats,lastcat] =>
;       lastcat is ['CATEGORY,type,:ops] =>
;          ['With, [],
;             makeTypeSequence(
;                APPEND([axFormatType c for c in cats],
;                         [axFormatOp op for op in ops]))]
;       ['With, [], makeTypeSequence([axFormatType c for c in rest typeform])]
;   typeform is ['CATEGORY, type, :ops] =>
;       ['With, [],  axFormatOpList ops]
;   typeform is ['Mapping, target, :argtypes] =>
;       ['Apply, "->",
;                ['Comma, :[axFormatType t for t in argtypes]],
;                 axFormatType target]
;   typeform is ['_:, name, type] => axFormatDecl(name,type,false)
;   typeform is ['Union, :args] =>
;       first args is ['_:,.,.] =>
;          ['Apply, 'Union, :[axFormatType a for a in args]]
;       taglist := []
;       valueCount := 0
;       for x in args repeat
;           tag :=
;             STRINGP x => INTERN x
;             x is ['QUOTE,val] and STRINGP val => INTERN val
;             valueCount := valueCount + 1
;             INTERNL1("value", STRINGIMAGE(valueCount))
;           taglist := [tag ,: taglist]
;       ['Apply, 'Union, :[axFormatDecl(name,type,false) for name in reverse taglist
;                                 for type in args]]
;   typeform is ['Dictionary,['Record,:args]] =>
;       ['Apply, 'Dictionary,
;           ['PretendTo, axFormatType CADR typeform, 'SetCategory]]
;   typeform is ['FileCategory,xx,['Record,:args]] =>
;       ['Apply, 'FileCategory, axFormatType xx,
;           ['PretendTo, axFormatType CADDR typeform, 'SetCategory]]
;   typeform is [op,:args] =>
;       $conditionalCast and $pretendFlag and constructor? op and
;         get_database(op, 'CONSTRUCTORMODEMAP) is [[.,target,:argtypes],.] =>
;           ['Apply, op, :[pretendTo(a, t) for a in args for t in argtypes]]
;       -- $augmentedArgs is non-empty if we are inside a "if A has T then ..."
;       -- block. In this case we must augment the type of A by T.
;       -- In nearly all cases t is ignored, but is needed for %.
;       not(null $augmentedArgs) and constructor? op and
;         get_database(op, 'CONSTRUCTORMODEMAP) is [[.,target,:argtypes],.] =>
;           ['Apply, op, :[augmentTo(a, t) for a in args for t in argtypes]]
;       MEMQ(op, '(SquareMatrix SquareMatrixCategory DirectProduct
;          DirectProductCategory RadixExpansion)) and
;             get_database(op, 'CONSTRUCTORMODEMAP) is
;                        [[., target, arg1type, :restargs], .] =>
;                ['Apply, op,
;                   ['PretendTo, axFormatType first args, axFormatType arg1type],
;                      :[axFormatType a for a in rest args]]
;       ['Apply, op, :[axFormatType a for a in args]]
;   error '"unknown entry type"

(DEFUN |axFormatType| (|typeform|)
  (PROG (|args| |op| |ISTMP#1| |val| |ISTMP#2| |lastcat| |cats| |type| |ops|
         |target| |argtypes| |name| |ISTMP#3| |taglist| |valueCount| |tag| |xx|
         |ISTMP#4| |arg1type| |restargs| |ISTMP#5|)
    (RETURN
     (COND
      ((ATOM |typeform|)
       (COND ((EQ |typeform| '%) '%)
             ((STRINGP |typeform|)
              (LIST '|Apply| '|Enumeration| (INTERN |typeform|)))
             ((INTEGERP |typeform|)
              (COND
               ((EQL |typeform| 0)
                (PROGN
                 (|axAddLiteral| '|integer| '|Integer| '|Literal|)
                 (LIST '|RestrictTo| (LIST '|LitInteger| "0") '|Integer|)))
               (#1='T
                (PROGN
                 (|axAddLiteral| '|integer| '|PositiveInteger| '|Literal|)
                 (LIST '|RestrictTo|
                       (LIST '|LitInteger| (STRINGIMAGE |typeform|))
                       '|PositiveInteger|)))))
             ((FLOATP |typeform|) (LIST '|LitFloat| (STRINGIMAGE |typeform|)))
             ((MEMQ |typeform| |$TriangleVariableList|)
              (SUBLISLIS |$FormalMapVariableList| |$TriangleVariableList|
               |typeform|))
             ((MEMQ |typeform| |$FormalMapVariableList|) |typeform|)
             (#1#
              (PROGN
               (|axAddLiteral| '|string| '|Symbol| '|Literal|)
               (LIST '|RestrictTo| (LIST '|LitString| (PNAME |typeform|))
                     '|Symbol|)))))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|construct|)
            (PROGN (SETQ |args| (CDR |typeform|)) #1#))
       (PROGN
        (|axAddLiteral| '|bracket| (LIST '|Apply| '|List| '|Symbol|)
         (LIST '|Apply| '|Tuple| '|Symbol|))
        (|axAddLiteral| '|string| '|Symbol| '|Literal|)
        (LIST '|RestrictTo|
              (CONS '|Apply|
                    (CONS '|bracket|
                          ((LAMBDA (|bfVar#13| |bfVar#12| |a|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#12|)
                                    (PROGN (SETQ |a| (CAR |bfVar#12|)) NIL))
                                (RETURN (NREVERSE |bfVar#13|)))
                               (#1#
                                (SETQ |bfVar#13|
                                        (CONS (|axFormatType| |a|)
                                              |bfVar#13|))))
                              (SETQ |bfVar#12| (CDR |bfVar#12|))))
                           NIL |args| NIL)))
              (LIST '|Apply| '|List| '|Symbol|))))
      ((AND (CONSP |typeform|) (EQ (CDR |typeform|) NIL)
            (PROGN (SETQ |op| (CAR |typeform|)) #1#))
       (COND ((EQ |op| '|Void|) (LIST '|Comma|)) (#1# |op|)))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|local|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |val| (CAR |ISTMP#1|)) #1#))))
       (|axFormatType| |val|))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) 'QUOTE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |val| (CAR |ISTMP#1|)) #1#))))
       (|axFormatType| |val|))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|Join|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1#)
                  (CONSP |ISTMP#2|)
                  (PROGN
                   (SETQ |lastcat| (CAR |ISTMP#2|))
                   (SETQ |cats| (CDR |ISTMP#2|))
                   #1#)
                  (PROGN (SETQ |cats| (NREVERSE |cats|)) #1#))))
       (COND
        ((AND (CONSP |lastcat|) (EQ (CAR |lastcat|) 'CATEGORY)
              (PROGN
               (SETQ |ISTMP#1| (CDR |lastcat|))
               (AND (CONSP |ISTMP#1|)
                    (PROGN
                     (SETQ |type| (CAR |ISTMP#1|))
                     (SETQ |ops| (CDR |ISTMP#1|))
                     #1#))))
         (LIST '|With| NIL
               (|makeTypeSequence|
                (APPEND
                 ((LAMBDA (|bfVar#15| |bfVar#14| |c|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#14|)
                           (PROGN (SETQ |c| (CAR |bfVar#14|)) NIL))
                       (RETURN (NREVERSE |bfVar#15|)))
                      (#1#
                       (SETQ |bfVar#15|
                               (CONS (|axFormatType| |c|) |bfVar#15|))))
                     (SETQ |bfVar#14| (CDR |bfVar#14|))))
                  NIL |cats| NIL)
                 ((LAMBDA (|bfVar#17| |bfVar#16| |op|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#16|)
                           (PROGN (SETQ |op| (CAR |bfVar#16|)) NIL))
                       (RETURN (NREVERSE |bfVar#17|)))
                      (#1#
                       (SETQ |bfVar#17|
                               (CONS (|axFormatOp| |op|) |bfVar#17|))))
                     (SETQ |bfVar#16| (CDR |bfVar#16|))))
                  NIL |ops| NIL)))))
        (#1#
         (LIST '|With| NIL
               (|makeTypeSequence|
                ((LAMBDA (|bfVar#19| |bfVar#18| |c|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#18|)
                          (PROGN (SETQ |c| (CAR |bfVar#18|)) NIL))
                      (RETURN (NREVERSE |bfVar#19|)))
                     (#1#
                      (SETQ |bfVar#19|
                              (CONS (|axFormatType| |c|) |bfVar#19|))))
                    (SETQ |bfVar#18| (CDR |bfVar#18|))))
                 NIL (CDR |typeform|) NIL))))))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) 'CATEGORY)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |type| (CAR |ISTMP#1|))
                   (SETQ |ops| (CDR |ISTMP#1|))
                   #1#))))
       (LIST '|With| NIL (|axFormatOpList| |ops|)))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|Mapping|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |target| (CAR |ISTMP#1|))
                   (SETQ |argtypes| (CDR |ISTMP#1|))
                   #1#))))
       (LIST '|Apply| '->
             (CONS '|Comma|
                   ((LAMBDA (|bfVar#21| |bfVar#20| |t|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#20|)
                             (PROGN (SETQ |t| (CAR |bfVar#20|)) NIL))
                         (RETURN (NREVERSE |bfVar#21|)))
                        (#1#
                         (SETQ |bfVar#21|
                                 (CONS (|axFormatType| |t|) |bfVar#21|))))
                       (SETQ |bfVar#20| (CDR |bfVar#20|))))
                    NIL |argtypes| NIL))
             (|axFormatType| |target|)))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |name| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |type| (CAR |ISTMP#2|)) #1#))))))
       (|axFormatDecl| |name| |type| NIL))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|Union|)
            (PROGN (SETQ |args| (CDR |typeform|)) #1#))
       (COND
        ((PROGN
          (SETQ |ISTMP#1| (CAR |args|))
          (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
               (PROGN
                (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                (AND (CONSP |ISTMP#2|)
                     (PROGN
                      (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                      (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)))))))
         (CONS '|Apply|
               (CONS '|Union|
                     ((LAMBDA (|bfVar#23| |bfVar#22| |a|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#22|)
                               (PROGN (SETQ |a| (CAR |bfVar#22|)) NIL))
                           (RETURN (NREVERSE |bfVar#23|)))
                          (#1#
                           (SETQ |bfVar#23|
                                   (CONS (|axFormatType| |a|) |bfVar#23|))))
                         (SETQ |bfVar#22| (CDR |bfVar#22|))))
                      NIL |args| NIL))))
        (#1#
         (PROGN
          (SETQ |taglist| NIL)
          (SETQ |valueCount| 0)
          ((LAMBDA (|bfVar#24| |x|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#24|) (PROGN (SETQ |x| (CAR |bfVar#24|)) NIL))
                (RETURN NIL))
               (#1#
                (PROGN
                 (SETQ |tag|
                         (COND ((STRINGP |x|) (INTERN |x|))
                               ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |x|))
                                      (AND (CONSP |ISTMP#1|)
                                           (EQ (CDR |ISTMP#1|) NIL)
                                           (PROGN
                                            (SETQ |val| (CAR |ISTMP#1|))
                                            #1#)))
                                     (STRINGP |val|))
                                (INTERN |val|))
                               (#1#
                                (PROGN
                                 (SETQ |valueCount| (+ |valueCount| 1))
                                 (INTERNL1 '|value|
                                  (STRINGIMAGE |valueCount|))))))
                 (SETQ |taglist| (CONS |tag| |taglist|)))))
              (SETQ |bfVar#24| (CDR |bfVar#24|))))
           |args| NIL)
          (CONS '|Apply|
                (CONS '|Union|
                      ((LAMBDA (|bfVar#27| |bfVar#25| |name| |bfVar#26| |type|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#25|)
                                (PROGN (SETQ |name| (CAR |bfVar#25|)) NIL)
                                (ATOM |bfVar#26|)
                                (PROGN (SETQ |type| (CAR |bfVar#26|)) NIL))
                            (RETURN (NREVERSE |bfVar#27|)))
                           (#1#
                            (SETQ |bfVar#27|
                                    (CONS (|axFormatDecl| |name| |type| NIL)
                                          |bfVar#27|))))
                          (SETQ |bfVar#25| (CDR |bfVar#25|))
                          (SETQ |bfVar#26| (CDR |bfVar#26|))))
                       NIL (REVERSE |taglist|) NIL |args| NIL)))))))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|Dictionary|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN
                   (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Record|)
                        (PROGN (SETQ |args| (CDR |ISTMP#2|)) #1#))))))
       (LIST '|Apply| '|Dictionary|
             (LIST '|PretendTo| (|axFormatType| (CADR |typeform|))
                   '|SetCategory|)))
      ((AND (CONSP |typeform|) (EQ (CAR |typeform|) '|FileCategory|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typeform|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |xx| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN
                         (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '|Record|)
                              (PROGN (SETQ |args| (CDR |ISTMP#3|)) #1#))))))))
       (LIST '|Apply| '|FileCategory| (|axFormatType| |xx|)
             (LIST '|PretendTo| (|axFormatType| (CADDR |typeform|))
                   '|SetCategory|)))
      ((AND (CONSP |typeform|)
            (PROGN
             (SETQ |op| (CAR |typeform|))
             (SETQ |args| (CDR |typeform|))
             #1#))
       (COND
        ((AND |$conditionalCast| |$pretendFlag| (|constructor?| |op|)
              (PROGN
               (SETQ |ISTMP#1| (|get_database| |op| 'CONSTRUCTORMODEMAP))
               (AND (CONSP |ISTMP#1|)
                    (PROGN
                     (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|)
                          (PROGN
                           (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                           (AND (CONSP |ISTMP#3|)
                                (PROGN
                                 (SETQ |target| (CAR |ISTMP#3|))
                                 (SETQ |argtypes| (CDR |ISTMP#3|))
                                 #1#)))))
                    (PROGN
                     (SETQ |ISTMP#4| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL))))))
         (CONS '|Apply|
               (CONS |op|
                     ((LAMBDA (|bfVar#30| |bfVar#28| |a| |bfVar#29| |t|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#28|)
                               (PROGN (SETQ |a| (CAR |bfVar#28|)) NIL)
                               (ATOM |bfVar#29|)
                               (PROGN (SETQ |t| (CAR |bfVar#29|)) NIL))
                           (RETURN (NREVERSE |bfVar#30|)))
                          (#1#
                           (SETQ |bfVar#30|
                                   (CONS (|pretendTo| |a| |t|) |bfVar#30|))))
                         (SETQ |bfVar#28| (CDR |bfVar#28|))
                         (SETQ |bfVar#29| (CDR |bfVar#29|))))
                      NIL |args| NIL |argtypes| NIL))))
        ((AND (NULL (NULL |$augmentedArgs|)) (|constructor?| |op|)
              (PROGN
               (SETQ |ISTMP#1| (|get_database| |op| 'CONSTRUCTORMODEMAP))
               (AND (CONSP |ISTMP#1|)
                    (PROGN
                     (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|)
                          (PROGN
                           (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                           (AND (CONSP |ISTMP#3|)
                                (PROGN
                                 (SETQ |target| (CAR |ISTMP#3|))
                                 (SETQ |argtypes| (CDR |ISTMP#3|))
                                 #1#)))))
                    (PROGN
                     (SETQ |ISTMP#4| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL))))))
         (CONS '|Apply|
               (CONS |op|
                     ((LAMBDA (|bfVar#33| |bfVar#31| |a| |bfVar#32| |t|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#31|)
                               (PROGN (SETQ |a| (CAR |bfVar#31|)) NIL)
                               (ATOM |bfVar#32|)
                               (PROGN (SETQ |t| (CAR |bfVar#32|)) NIL))
                           (RETURN (NREVERSE |bfVar#33|)))
                          (#1#
                           (SETQ |bfVar#33|
                                   (CONS (|augmentTo| |a| |t|) |bfVar#33|))))
                         (SETQ |bfVar#31| (CDR |bfVar#31|))
                         (SETQ |bfVar#32| (CDR |bfVar#32|))))
                      NIL |args| NIL |argtypes| NIL))))
        ((AND
          (MEMQ |op|
                '(|SquareMatrix| |SquareMatrixCategory| |DirectProduct|
                  |DirectProductCategory| |RadixExpansion|))
          (PROGN
           (SETQ |ISTMP#1| (|get_database| |op| 'CONSTRUCTORMODEMAP))
           (AND (CONSP |ISTMP#1|)
                (PROGN
                 (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|)
                      (PROGN
                       (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                       (AND (CONSP |ISTMP#3|)
                            (PROGN
                             (SETQ |target| (CAR |ISTMP#3|))
                             (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                             (AND (CONSP |ISTMP#4|)
                                  (PROGN
                                   (SETQ |arg1type| (CAR |ISTMP#4|))
                                   (SETQ |restargs| (CDR |ISTMP#4|))
                                   #1#)))))))
                (PROGN
                 (SETQ |ISTMP#5| (CDR |ISTMP#1|))
                 (AND (CONSP |ISTMP#5|) (EQ (CDR |ISTMP#5|) NIL))))))
         (CONS '|Apply|
               (CONS |op|
                     (CONS
                      (LIST '|PretendTo| (|axFormatType| (CAR |args|))
                            (|axFormatType| |arg1type|))
                      ((LAMBDA (|bfVar#35| |bfVar#34| |a|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#34|)
                                (PROGN (SETQ |a| (CAR |bfVar#34|)) NIL))
                            (RETURN (NREVERSE |bfVar#35|)))
                           (#1#
                            (SETQ |bfVar#35|
                                    (CONS (|axFormatType| |a|) |bfVar#35|))))
                          (SETQ |bfVar#34| (CDR |bfVar#34|))))
                       NIL (CDR |args|) NIL)))))
        (#1#
         (CONS '|Apply|
               (CONS |op|
                     ((LAMBDA (|bfVar#37| |bfVar#36| |a|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#36|)
                               (PROGN (SETQ |a| (CAR |bfVar#36|)) NIL))
                           (RETURN (NREVERSE |bfVar#37|)))
                          (#1#
                           (SETQ |bfVar#37|
                                   (CONS (|axFormatType| |a|) |bfVar#37|))))
                         (SETQ |bfVar#36| (CDR |bfVar#36|))))
                      NIL |args| NIL))))))
      (#1# (|error| "unknown entry type"))))))

; pretendTo(a, t) == ['PretendTo, axFormatType a, axFormatType t]

(DEFUN |pretendTo| (|a| |t|)
  (PROG ()
    (RETURN (LIST '|PretendTo| (|axFormatType| |a|) (|axFormatType| |t|)))))

; augmentTo(a, t) ==
;   not $conditionalCast => axFormatType a
;   a = '% => pretendTo(a, t)
;   ax := axFormatType a -- a looks like |#i|
;   not(null(kv:=ASSOC(a,$augmentedArgs))) =>
;       ['PretendTo, ax, formatAugmentedType(rest kv, a, $augmentedArgs)]
;   not(null(kv := ASSOC(a, $modemapArgs))) =>
;       ['PretendTo, ax, axFormatType rest kv]
;   ax

(DEFUN |augmentTo| (|a| |t|)
  (PROG (|ax| |kv|)
    (RETURN
     (COND ((NULL |$conditionalCast|) (|axFormatType| |a|))
           ((EQ |a| '%) (|pretendTo| |a| |t|))
           (#1='T
            (PROGN
             (SETQ |ax| (|axFormatType| |a|))
             (COND
              ((NULL (NULL (SETQ |kv| (ASSOC |a| |$augmentedArgs|))))
               (LIST '|PretendTo| |ax|
                     (|formatAugmentedType| (CDR |kv|) |a| |$augmentedArgs|)))
              ((NULL (NULL (SETQ |kv| (ASSOC |a| |$modemapArgs|))))
               (LIST '|PretendTo| |ax| (|axFormatType| (CDR |kv|))))
              (#1# |ax|))))))))

; formatAugmentedType(v, a, augargs) ==
;   $augmentedArgs:local := deleteFirstPred(a, augargs)
;   axFormattedPred := axFormatPred first v
;   axFormattedPred is ['Test, ['Has, arg, augtype]]
;   c := cdr v
;   null cdr c => -- the last argument is 'ignore or a type from $modemapArgs
;     first c = 'ignore => augtype
;     ['With, ['Apply, 'Join, augtype, axFormatType first c], []]
;   ['With, ['Apply, 'Join, augtype, formatAugmentedType(c, a, $augmentedArgs)], []]

(DEFUN |formatAugmentedType| (|v| |a| |augargs|)
  (PROG (|$augmentedArgs| |c| |augtype| |ISTMP#4| |arg| |ISTMP#3| |ISTMP#2|
         |ISTMP#1| |axFormattedPred|)
    (DECLARE (SPECIAL |$augmentedArgs|))
    (RETURN
     (PROGN
      (SETQ |$augmentedArgs| (|deleteFirstPred| |a| |augargs|))
      (SETQ |axFormattedPred| (|axFormatPred| (CAR |v|)))
      (AND (CONSP |axFormattedPred|) (EQ (CAR |axFormattedPred|) '|Test|)
           (PROGN
            (SETQ |ISTMP#1| (CDR |axFormattedPred|))
            (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                 (PROGN
                  (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                  (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Has|)
                       (PROGN
                        (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                        (AND (CONSP |ISTMP#3|)
                             (PROGN
                              (SETQ |arg| (CAR |ISTMP#3|))
                              (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                              (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                                   (PROGN
                                    (SETQ |augtype| (CAR |ISTMP#4|))
                                    #1='T))))))))))
      (SETQ |c| (CDR |v|))
      (COND
       ((NULL (CDR |c|))
        (COND ((EQ (CAR |c|) '|ignore|) |augtype|)
              (#1#
               (LIST '|With|
                     (LIST '|Apply| '|Join| |augtype|
                           (|axFormatType| (CAR |c|)))
                     NIL))))
       (#1#
        (LIST '|With|
              (LIST '|Apply| '|Join| |augtype|
                    (|formatAugmentedType| |c| |a| |$augmentedArgs|))
              NIL)))))))

; axFormatOpList ops == ['Sequence,:[axFormatOp o for o in ops]]

(DEFUN |axFormatOpList| (|ops|)
  (PROG ()
    (RETURN
     (CONS '|Sequence|
           ((LAMBDA (|bfVar#39| |bfVar#38| |o|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#38|) (PROGN (SETQ |o| (CAR |bfVar#38|)) NIL))
                 (RETURN (NREVERSE |bfVar#39|)))
                ('T (SETQ |bfVar#39| (CONS (|axFormatOp| |o|) |bfVar#39|))))
               (SETQ |bfVar#38| (CDR |bfVar#38|))))
            NIL |ops| NIL)))))

; axOpTran(name) ==
;    ATOM name =>
;       name = 'elt => 'apply
;       name = "setelt!" => "set!"
;       name = 'SEGMENT => ".."
;       name = 1 => '_1
;       name = 0 => '_0
;       name
;    opOf name = 'Zero => '_0
;    opOf name = 'One => '_1
;    error '"bad op name"

(DEFUN |axOpTran| (|name|)
  (PROG ()
    (RETURN
     (COND
      ((ATOM |name|)
       (COND ((EQ |name| '|elt|) '|apply|) ((EQ |name| '|setelt!|) '|set!|)
             ((EQ |name| 'SEGMENT) '|..|) ((EQL |name| 1) '|1|)
             ((EQL |name| 0) '|0|) (#1='T |name|)))
      ((EQ (|opOf| |name|) '|Zero|) '|0|) ((EQ (|opOf| |name|) '|One|) '|1|)
      (#1# (|error| "bad op name"))))))

; axFormatOpSig(name, [result,:argtypes]) ==
;    ['Declare, axOpTran name,
;          ['Apply, "->", ['Comma, :[axFormatType t for t in argtypes]],
;                         axFormatType result]]

(DEFUN |axFormatOpSig| (|name| |bfVar#42|)
  (PROG (|result| |argtypes|)
    (RETURN
     (PROGN
      (SETQ |result| (CAR |bfVar#42|))
      (SETQ |argtypes| (CDR |bfVar#42|))
      (LIST '|Declare| (|axOpTran| |name|)
            (LIST '|Apply| '->
                  (CONS '|Comma|
                        ((LAMBDA (|bfVar#41| |bfVar#40| |t|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#40|)
                                  (PROGN (SETQ |t| (CAR |bfVar#40|)) NIL))
                              (RETURN (NREVERSE |bfVar#41|)))
                             ('T
                              (SETQ |bfVar#41|
                                      (CONS (|axFormatType| |t|) |bfVar#41|))))
                            (SETQ |bfVar#40| (CDR |bfVar#40|))))
                         NIL |argtypes| NIL))
                  (|axFormatType| |result|)))))))

; axFormatConstantOp(name, [result]) ==
;    ['Declare, axOpTran name, axFormatType result]

(DEFUN |axFormatConstantOp| (|name| |bfVar#43|)
  (PROG (|result|)
    (RETURN
     (PROGN
      (SETQ |result| (CAR |bfVar#43|))
      (LIST '|Declare| (|axOpTran| |name|) (|axFormatType| |result|))))))

; axFormatPred pred ==
;    atom pred => pred
;    [op,:args] := pred
;    op = 'IF => axFormatOp pred
;    op = 'has =>
;       [name,type] := args
;       name := axFormatOp(name)
;       ftype := axFormatOp type
;       if ftype is ['Declare,:.] then
;            ftype := ['With, [], ftype]
;       ['Test,['Has,name, ftype]]
;    axArglist := [axFormatPred arg for arg in args]
;    op = 'AND => ['And,:axArglist]
;    op = 'and => ['And,:axArglist]
;    op = 'OR  => ['Or,:axArglist]
;    op = 'or  => ['Or,:axArglist]
;    op = 'NOT => ['Not,:axArglist]
;    op = 'not => ['Not,:axArglist]
;    error LIST('"unknown predicate", pred)

(DEFUN |axFormatPred| (|pred|)
  (PROG (|op| |args| |name| |type| |ftype| |axArglist|)
    (RETURN
     (COND ((ATOM |pred|) |pred|)
           (#1='T
            (PROGN
             (SETQ |op| (CAR |pred|))
             (SETQ |args| (CDR |pred|))
             (COND ((EQ |op| 'IF) (|axFormatOp| |pred|))
                   ((EQ |op| '|has|)
                    (PROGN
                     (SETQ |name| (CAR |args|))
                     (SETQ |type| (CADR |args|))
                     (SETQ |name| (|axFormatOp| |name|))
                     (SETQ |ftype| (|axFormatOp| |type|))
                     (COND
                      ((AND (CONSP |ftype|) (EQ (CAR |ftype|) '|Declare|))
                       (SETQ |ftype| (LIST '|With| NIL |ftype|))))
                     (LIST '|Test| (LIST '|Has| |name| |ftype|))))
                   (#1#
                    (PROGN
                     (SETQ |axArglist|
                             ((LAMBDA (|bfVar#45| |bfVar#44| |arg|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#44|)
                                       (PROGN
                                        (SETQ |arg| (CAR |bfVar#44|))
                                        NIL))
                                   (RETURN (NREVERSE |bfVar#45|)))
                                  (#1#
                                   (SETQ |bfVar#45|
                                           (CONS (|axFormatPred| |arg|)
                                                 |bfVar#45|))))
                                 (SETQ |bfVar#44| (CDR |bfVar#44|))))
                              NIL |args| NIL))
                     (COND ((EQ |op| 'AND) (CONS '|And| |axArglist|))
                           ((EQ |op| '|and|) (CONS '|And| |axArglist|))
                           ((EQ |op| 'OR) (CONS '|Or| |axArglist|))
                           ((EQ |op| '|or|) (CONS '|Or| |axArglist|))
                           ((EQ |op| 'NOT) (CONS '|Not| |axArglist|))
                           ((EQ |op| '|not|) (CONS '|Not| |axArglist|))
                           (#1#
                            (|error|
                             (LIST "unknown predicate" |pred|)))))))))))))

; axFormatAugmentOp(op, axFormattedPred, pred, augargs) ==
;   if axFormattedPred is ['Test, ['Has, arg, augtype]] then
;       -- Find arg in augargs or in $modemapArgs.
;       -- If found we build up $augmentedArgs.
;       -- To each key a list of pred(s) is stored together with the
;       -- last type being a type from $modemapArgs or 'ignore.
;       kv := ASSOC(arg, augargs)
;       v := if null kv then
;                if arg = '% then
;                    ['ignore] -- want "categoryOf(%)" (will be ignored)
;                  else
;                    kv := ASSOC(arg, $modemapArgs)
;                    -- $modemapArgs stuff must be unformatted
;                    if null kv then
;                        nil
;                      else
;                        -- We don't want Join with category Type.
;                        if rest kv = ['Type] then ['ignore] else [rest kv]
;              else
;                  rest kv
;       -- note that v is a list of the form [pred_n, pred_n-1, ..., pred1, cat]
;       -- cat is only *one* item!!!
;       if not(null v) then
;           $augmentedArgs:local := [[arg, pred, :v], :delete(kv, augargs)]
;   -- Now $augmentedArgs is set correctly and we pass it to axFormatOp.
;   axFormatOp op

(DEFUN |axFormatAugmentOp| (|op| |axFormattedPred| |pred| |augargs|)
  (PROG (|$augmentedArgs| |v| |kv| |augtype| |ISTMP#4| |arg| |ISTMP#3|
         |ISTMP#2| |ISTMP#1|)
    (DECLARE (SPECIAL |$augmentedArgs|))
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |axFormattedPred|) (EQ (CAR |axFormattedPred|) '|Test|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |axFormattedPred|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN
                    (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|Has|)
                         (PROGN
                          (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|)
                               (PROGN
                                (SETQ |arg| (CAR |ISTMP#3|))
                                (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                                     (PROGN
                                      (SETQ |augtype| (CAR |ISTMP#4|))
                                      #1='T))))))))))
        (SETQ |kv| (ASSOC |arg| |augargs|))
        (SETQ |v|
                (COND
                 ((NULL |kv|)
                  (COND ((EQ |arg| '%) (LIST '|ignore|))
                        (#1# (SETQ |kv| (ASSOC |arg| |$modemapArgs|))
                         (COND ((NULL |kv|) NIL)
                               ((EQUAL (CDR |kv|) (LIST '|Type|))
                                (LIST '|ignore|))
                               (#1# (LIST (CDR |kv|)))))))
                 (#1# (CDR |kv|))))
        (COND
         ((NULL (NULL |v|))
          (SETQ |$augmentedArgs|
                  (CONS (CONS |arg| (CONS |pred| |v|))
                        (|delete| |kv| |augargs|)))))))
      (|axFormatOp| |op|)))))

; deleteFirstPred(key, assoclist) ==
;   null assoclist => assoclist
;   assoclist is [kv, :t]
;   kv is [k, pred, :v]
;   k = key =>
;       null v => t
;       null cdr v => t
;       [[k, :v], :t]
;   [kv, :deleteFirstPred(key, t)]

(DEFUN |deleteFirstPred| (|key| |assoclist|)
  (PROG (|kv| |t| |k| |ISTMP#1| |pred| |v|)
    (RETURN
     (COND ((NULL |assoclist|) |assoclist|)
           (#1='T
            (PROGN
             (AND (CONSP |assoclist|)
                  (PROGN
                   (SETQ |kv| (CAR |assoclist|))
                   (SETQ |t| (CDR |assoclist|))
                   #1#))
             (AND (CONSP |kv|)
                  (PROGN
                   (SETQ |k| (CAR |kv|))
                   (SETQ |ISTMP#1| (CDR |kv|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |pred| (CAR |ISTMP#1|))
                         (SETQ |v| (CDR |ISTMP#1|))
                         #1#))))
             (COND
              ((EQUAL |k| |key|)
               (COND ((NULL |v|) |t|) ((NULL (CDR |v|)) |t|)
                     (#1# (CONS (CONS |k| |v|) |t|))))
              (#1# (CONS |kv| (|deleteFirstPred| |key| |t|))))))))))

; axFormatOp op ==
;    op is ['IF, pred, trueops, falseops] =>
;       -- ops are either single op or ['PROGN, ops]
;       -- In case we meet "if A has T then X else Y", we augment the type of
;       -- A by T inside X. Inside Y nothing is augmented.
;       -- We only care about such A that are parameters in a surrounding
;       -- constructor, i.e. something looking like |#i|.
;       -- The form "if not(A has T) then ..." is not supported.
;       axFormattedPred := axFormatPred pred
;       NULL(trueops) or trueops='noBranch =>
;          ['If, ['Test,['Not, axFormattedPred]], axFormatOp falseops, []]
;       ['If, axFormattedPred,
;             axFormatAugmentOp(trueops, axFormattedPred, pred, $augmentedArgs),
;               axFormatOp falseops]
;    op is ['SIGNATURE, name, type] => axFormatOpSig(name,type)
;    op is ['SIGNATURE, name, type, 'constant] =>
;             axFormatConstantOp(name,type)
;    op is ['ATTRIBUTE, attributeOrCategory] =>
;        categoryForm? attributeOrCategory =>
;            axFormatType attributeOrCategory
;        ['RestrictTo, axFormatAttrib attributeOrCategory, 'Category]
;    op is ['PROGN, :ops] => axFormatOpList ops
;    op is 'noBranch => []
;    axFormatType op

(DEFUN |axFormatOp| (|op|)
  (PROG (|ISTMP#1| |pred| |ISTMP#2| |trueops| |ISTMP#3| |falseops|
         |axFormattedPred| |name| |type| |attributeOrCategory| |ops|)
    (RETURN
     (COND
      ((AND (CONSP |op|) (EQ (CAR |op|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |op|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |pred| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |trueops| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (PROGN
                               (SETQ |falseops| (CAR |ISTMP#3|))
                               #1='T))))))))
       (PROGN
        (SETQ |axFormattedPred| (|axFormatPred| |pred|))
        (COND
         ((OR (NULL |trueops|) (EQ |trueops| '|noBranch|))
          (LIST '|If| (LIST '|Test| (LIST '|Not| |axFormattedPred|))
                (|axFormatOp| |falseops|) NIL))
         (#1#
          (LIST '|If| |axFormattedPred|
                (|axFormatAugmentOp| |trueops| |axFormattedPred| |pred|
                 |$augmentedArgs|)
                (|axFormatOp| |falseops|))))))
      ((AND (CONSP |op|) (EQ (CAR |op|) 'SIGNATURE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |op|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |name| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |type| (CAR |ISTMP#2|)) #1#))))))
       (|axFormatOpSig| |name| |type|))
      ((AND (CONSP |op|) (EQ (CAR |op|) 'SIGNATURE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |op|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |name| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |type| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (EQ (CAR |ISTMP#3|) '|constant|))))))))
       (|axFormatConstantOp| |name| |type|))
      ((AND (CONSP |op|) (EQ (CAR |op|) 'ATTRIBUTE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |op|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |attributeOrCategory| (CAR |ISTMP#1|)) #1#))))
       (COND
        ((|categoryForm?| |attributeOrCategory|)
         (|axFormatType| |attributeOrCategory|))
        (#1#
         (LIST '|RestrictTo| (|axFormatAttrib| |attributeOrCategory|)
               '|Category|))))
      ((AND (CONSP |op|) (EQ (CAR |op|) 'PROGN)
            (PROGN (SETQ |ops| (CDR |op|)) #1#))
       (|axFormatOpList| |ops|))
      ((EQ |op| '|noBranch|) NIL) (#1# (|axFormatType| |op|))))))

; addDefaults(catname, withform) ==
;   withform isnt ['With, joins, ['Sequence,: oplist]] =>
;      error '"bad category body"
;   null(defaults := getDefaultingOps catname) => withform
;   defaultdefs := [decl for decl in defaults]
;   ['With, joins,
;      ['Sequence, :oplist, ['Default, ['Sequence,: defaultdefs]]]]

(DEFUN |addDefaults| (|catname| |withform|)
  (PROG (|ISTMP#1| |joins| |ISTMP#2| |ISTMP#3| |oplist| |defaults|
         |defaultdefs|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |withform|) (EQ (CAR |withform|) '|With|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |withform|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |joins| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN
                          (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|)
                               (EQ (CAR |ISTMP#3|) '|Sequence|)
                               (PROGN
                                (SETQ |oplist| (CDR |ISTMP#3|))
                                #1='T)))))))))
       (|error| "bad category body"))
      ((NULL (SETQ |defaults| (|getDefaultingOps| |catname|))) |withform|)
      (#1#
       (PROGN
        (SETQ |defaultdefs|
                ((LAMBDA (|bfVar#47| |bfVar#46| |decl|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#46|)
                          (PROGN (SETQ |decl| (CAR |bfVar#46|)) NIL))
                      (RETURN (NREVERSE |bfVar#47|)))
                     (#1# (SETQ |bfVar#47| (CONS |decl| |bfVar#47|))))
                    (SETQ |bfVar#46| (CDR |bfVar#46|))))
                 NIL |defaults| NIL))
        (LIST '|With| |joins|
              (CONS '|Sequence|
                    (APPEND |oplist|
                            (CONS
                             (LIST '|Default| (CONS '|Sequence| |defaultdefs|))
                             NIL))))))))))

; makeDefaultDef(decl) ==
;   decl isnt ['Declare, op, type] =>
;        error LIST('"bad default definition", decl)
;   $defaultFlag := true
;   type is ['Apply, "->", args, result] =>
;        ['Define, decl, ['Lambda, makeDefaultArgs args, result,
;                     ['Label, op, 'dummyDefault]]]
;   ['Define, ['Declare, op, type], 'dummyDefault]

(DEFUN |makeDefaultDef| (|decl|)
  (PROG (|ISTMP#1| |op| |ISTMP#2| |type| |args| |ISTMP#3| |result|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |decl|) (EQ (CAR |decl|) '|Declare|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |decl|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |op| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |type| (CAR |ISTMP#2|)) #1='T)))))))
       (|error| (LIST "bad default definition" |decl|)))
      (#1#
       (PROGN
        (SETQ |$defaultFlag| T)
        (COND
         ((AND (CONSP |type|) (EQ (CAR |type|) '|Apply|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |type|))
                (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '->)
                     (PROGN
                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                      (AND (CONSP |ISTMP#2|)
                           (PROGN
                            (SETQ |args| (CAR |ISTMP#2|))
                            (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                            (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                 (PROGN
                                  (SETQ |result| (CAR |ISTMP#3|))
                                  #1#))))))))
          (LIST '|Define| |decl|
                (LIST '|Lambda| (|makeDefaultArgs| |args|) |result|
                      (LIST '|Label| |op| '|dummyDefault|))))
         (#1#
          (LIST '|Define| (LIST '|Declare| |op| |type|) '|dummyDefault|)))))))))

; makeDefaultArgs args ==
;   args isnt ['Comma,:argl] => error '"bad default argument list"
;   ['Comma,: [['Declare,v,t] for v in $TriangleVariableList for t in argl]]

(DEFUN |makeDefaultArgs| (|args|)
  (PROG (|argl|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |args|) (EQ (CAR |args|) '|Comma|)
             (PROGN (SETQ |argl| (CDR |args|)) #1='T)))
       (|error| "bad default argument list"))
      (#1#
       (CONS '|Comma|
             ((LAMBDA (|bfVar#50| |bfVar#48| |v| |bfVar#49| |t|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#48|)
                       (PROGN (SETQ |v| (CAR |bfVar#48|)) NIL)
                       (ATOM |bfVar#49|)
                       (PROGN (SETQ |t| (CAR |bfVar#49|)) NIL))
                   (RETURN (NREVERSE |bfVar#50|)))
                  (#1#
                   (SETQ |bfVar#50|
                           (CONS (LIST '|Declare| |v| |t|) |bfVar#50|))))
                 (SETQ |bfVar#48| (CDR |bfVar#48|))
                 (SETQ |bfVar#49| (CDR |bfVar#49|))))
              NIL |$TriangleVariableList| NIL |argl| NIL)))))))

; getDefaultingOps catname ==
;   not(name:=hasDefaultPackage catname) => nil
;   infovec := getInfovec name
;   opTable := infovec.1
;   $opList:local  := nil
;   for i in 0..MAXINDEX opTable repeat
;     op := opTable.i
;     i := i + 1
;     startIndex := opTable.i
;     stopIndex :=
;       i + 1 > MAXINDEX opTable => MAXINDEX getCodeVector1(infovec)
;       opTable.(i + 2)
;     curIndex := startIndex
;     while curIndex < stopIndex repeat
;       curIndex := get1defaultOp(op, curIndex, infovec)
;   $pretendFlag : local := true
;   catops := get_database(catname, 'OPERATIONALIST)
;   catdefops := get_database(name, 'OPERATIONALIST)
;   [axFormatDefaultOpSig(op,sig,catops,catdefops) for opsig in $opList | opsig is [op,sig]]

(DEFUN |getDefaultingOps| (|catname|)
  (PROG (|$pretendFlag| |$opList| |sig| |ISTMP#1| |catdefops| |catops|
         |curIndex| |stopIndex| |startIndex| |op| |opTable| |infovec| |name|)
    (DECLARE (SPECIAL |$pretendFlag| |$opList|))
    (RETURN
     (COND ((NULL (SETQ |name| (|hasDefaultPackage| |catname|))) NIL)
           (#1='T
            (PROGN
             (SETQ |infovec| (|getInfovec| |name|))
             (SETQ |opTable| (ELT |infovec| 1))
             (SETQ |$opList| NIL)
             ((LAMBDA (|bfVar#51| |i|)
                (LOOP
                 (COND ((> |i| |bfVar#51|) (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |op| (ELT |opTable| |i|))
                         (SETQ |i| (+ |i| 1))
                         (SETQ |startIndex| (ELT |opTable| |i|))
                         (SETQ |stopIndex|
                                 (COND
                                  ((< (MAXINDEX |opTable|) (+ |i| 1))
                                   (MAXINDEX (|getCodeVector1| |infovec|)))
                                  (#1# (ELT |opTable| (+ |i| 2)))))
                         (SETQ |curIndex| |startIndex|)
                         ((LAMBDA ()
                            (LOOP
                             (COND
                              ((NOT (< |curIndex| |stopIndex|)) (RETURN NIL))
                              (#1#
                               (SETQ |curIndex|
                                       (|get1defaultOp| |op| |curIndex|
                                        |infovec|))))))))))
                 (SETQ |i| (+ |i| 1))))
              (MAXINDEX |opTable|) 0)
             (SETQ |$pretendFlag| T)
             (SETQ |catops| (|get_database| |catname| 'OPERATIONALIST))
             (SETQ |catdefops| (|get_database| |name| 'OPERATIONALIST))
             ((LAMBDA (|bfVar#53| |bfVar#52| |opsig|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#52|)
                       (PROGN (SETQ |opsig| (CAR |bfVar#52|)) NIL))
                   (RETURN (NREVERSE |bfVar#53|)))
                  (#1#
                   (AND (CONSP |opsig|)
                        (PROGN
                         (SETQ |op| (CAR |opsig|))
                         (SETQ |ISTMP#1| (CDR |opsig|))
                         (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                              (PROGN (SETQ |sig| (CAR |ISTMP#1|)) #1#)))
                        (SETQ |bfVar#53|
                                (CONS
                                 (|axFormatDefaultOpSig| |op| |sig| |catops|
                                  |catdefops|)
                                 |bfVar#53|)))))
                 (SETQ |bfVar#52| (CDR |bfVar#52|))))
              NIL |$opList| NIL)))))))

; axFormatDefaultOpSig(op, sig, catops,catdefops) ==
;   catsigs := LASSOC(op, catops)
;   nsig2 := axCatSignature(sig)
;   theOp := LASSOC(nsig2, catsigs)
;   cond := axFormatPred NTH(1, theOp)
;   if cond = "T" then
;       cond := nil -- cond of true is the same as unconditional
;   #sig > 1 => axFormatCond(cond, makeDefaultDef(axFormatOpSig(op,sig)))
;   catsigs and
;     (catsig := assoc(nsig2, catsigs)) and last(catsig) = 'CONST =>
;        axFormatCond(cond, makeDefaultDef(axFormatConstantOp(op, sig)))
;   axFormatCond(cond, makeDefaultDef(axFormatOpSig(op, sig)))

(DEFUN |axFormatDefaultOpSig| (|op| |sig| |catops| |catdefops|)
  (PROG (|catsigs| |nsig2| |theOp| |cond| |catsig|)
    (RETURN
     (PROGN
      (SETQ |catsigs| (LASSOC |op| |catops|))
      (SETQ |nsig2| (|axCatSignature| |sig|))
      (SETQ |theOp| (LASSOC |nsig2| |catsigs|))
      (SETQ |cond| (|axFormatPred| (NTH 1 |theOp|)))
      (COND ((EQ |cond| 'T) (SETQ |cond| NIL)))
      (COND
       ((< 1 (LENGTH |sig|))
        (|axFormatCond| |cond|
         (|makeDefaultDef| (|axFormatOpSig| |op| |sig|))))
       ((AND |catsigs| (SETQ |catsig| (|assoc| |nsig2| |catsigs|))
             (EQ (|last| |catsig|) 'CONST))
        (|axFormatCond| |cond|
         (|makeDefaultDef| (|axFormatConstantOp| |op| |sig|))))
       ('T
        (|axFormatCond| |cond|
         (|makeDefaultDef| (|axFormatOpSig| |op| |sig|)))))))))

; axCatSignature(sig) ==
;     ATOM sig => sig
;     sig = '(%) => '%
;     CAR(sig) = "local" => CADR(sig)
;     CAR(sig) = "QUOTE" => CADR(sig)
;     [axCatSignature elt for elt in sig]

(DEFUN |axCatSignature| (|sig|)
  (PROG ()
    (RETURN
     (COND ((ATOM |sig|) |sig|) ((EQUAL |sig| '(%)) '%)
           ((EQ (CAR |sig|) '|local|) (CADR |sig|))
           ((EQ (CAR |sig|) 'QUOTE) (CADR |sig|))
           (#1='T
            ((LAMBDA (|bfVar#55| |bfVar#54| |elt|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#54|)
                      (PROGN (SETQ |elt| (CAR |bfVar#54|)) NIL))
                  (RETURN (NREVERSE |bfVar#55|)))
                 (#1#
                  (SETQ |bfVar#55|
                          (CONS (|axCatSignature| |elt|) |bfVar#55|))))
                (SETQ |bfVar#54| (CDR |bfVar#54|))))
             NIL |sig| NIL))))))

; axFormatCond(cond, inner) ==
;   NOT cond => inner
;   ['If, cond, inner, []]

(DEFUN |axFormatCond| (|cond| |inner|)
  (PROG ()
    (RETURN
     (COND ((NULL |cond|) |inner|) ('T (LIST '|If| |cond| |inner| NIL))))))

; get1defaultOp(op,index, infovec) ==
;   numvec := getCodeVector1(infovec)
;   numOfArgs := numvec.index
;   index := index + 1
;   index := index + 1
;   signumList :=
;  -- following substitution fixes the problem that default packages
;  -- have $ added as a first arg, thus other arg counts are off by 1.
;     SUBLISLIS($FormalMapVariableList, rest $FormalMapVariableList,
;              dcSig1(numvec, index, numOfArgs, infovec))
;   index := index + numOfArgs + 1
;   if not([op,signumList] in $opList) then
;      $opList := [[op,signumList],:$opList]
;   index + 1

(DEFUN |get1defaultOp| (|op| |index| |infovec|)
  (PROG (|numvec| |numOfArgs| |signumList|)
    (RETURN
     (PROGN
      (SETQ |numvec| (|getCodeVector1| |infovec|))
      (SETQ |numOfArgs| (ELT |numvec| |index|))
      (SETQ |index| (+ |index| 1))
      (SETQ |index| (+ |index| 1))
      (SETQ |signumList|
              (SUBLISLIS |$FormalMapVariableList|
               (CDR |$FormalMapVariableList|)
               (|dcSig1| |numvec| |index| |numOfArgs| |infovec|)))
      (SETQ |index| (+ (+ |index| |numOfArgs|) 1))
      (COND
       ((NULL (|member| (LIST |op| |signumList|) |$opList|))
        (SETQ |$opList| (CONS (LIST |op| |signumList|) |$opList|))))
      (+ |index| 1)))))

; axAddLiteral(name, type, dom) ==
;   elt := [name, type, dom]
;   if not member( elt, $literals) then
;      $literals := [elt, :$literals]

(DEFUN |axAddLiteral| (|name| |type| |dom|)
  (PROG (|elt|)
    (RETURN
     (PROGN
      (SETQ |elt| (LIST |name| |type| |dom|))
      (COND
       ((NULL (|member| |elt| |$literals|))
        (SETQ |$literals| (CONS |elt| |$literals|))))))))

; axDoLiterals() ==
;   [ [ 'Import,
;           [ 'With, [],
;             ['Declare, name, [ 'Apply, '_-_> , dom , '_% ]]],
;                  type ] for [name, type, dom] in $literals]

(DEFUN |axDoLiterals| ()
  (PROG (|dom| |ISTMP#2| |type| |ISTMP#1| |name|)
    (RETURN
     ((LAMBDA (|bfVar#58| |bfVar#57| |bfVar#56|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#57|)
               (PROGN (SETQ |bfVar#56| (CAR |bfVar#57|)) NIL))
           (RETURN (NREVERSE |bfVar#58|)))
          (#1='T
           (AND (CONSP |bfVar#56|)
                (PROGN
                 (SETQ |name| (CAR |bfVar#56|))
                 (SETQ |ISTMP#1| (CDR |bfVar#56|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |type| (CAR |ISTMP#1|))
                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                       (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                            (PROGN (SETQ |dom| (CAR |ISTMP#2|)) #1#)))))
                (SETQ |bfVar#58|
                        (CONS
                         (LIST '|Import|
                               (LIST '|With| NIL
                                     (LIST '|Declare| |name|
                                           (LIST '|Apply| '-> |dom| '%)))
                               |type|)
                         |bfVar#58|)))))
         (SETQ |bfVar#57| (CDR |bfVar#57|))))
      NIL |$literals| NIL))))
