
; )package "BOOT"

(IN-PACKAGE "BOOT")

; any_to_string(u) == WRITE_-TO_-STRING(u)

(DEFUN |any_to_string| (|u|) (PROG () (RETURN (WRITE-TO-STRING |u|))))

; arg_to_OutputForm(arg, t, c) ==
;     c => constructor_to_OutputForm(arg)
;     isValidType(t) and PAIRP(t) and
;             (get_database(first(t), 'CONSTRUCTORKIND) = 'domain) =>
;         (val := coerceInteractive(objNewWrap(arg, t), $OutputForm)) =>
;             objValUnwrap(val)
;         -- Wrong, but we try to produce something
;         any_to_string(arg)
;     -- Wrong, but we try to produce something
;     any_to_string(arg)

(DEFUN |arg_to_OutputForm| (|arg| |t| |c|)
  (PROG (|val|)
    (RETURN
     (COND (|c| (|constructor_to_OutputForm| |arg|))
           ((AND (|isValidType| |t|) (CONSP |t|)
                 (EQ (|get_database| (CAR |t|) 'CONSTRUCTORKIND) '|domain|))
            (COND
             ((SETQ |val|
                      (|coerceInteractive| (|objNewWrap| |arg| |t|)
                       |$OutputForm|))
              (|objValUnwrap| |val|))
             (#1='T (|any_to_string| |arg|))))
           (#1# (|any_to_string| |arg|))))))

; prefix_to_string(con) ==
;     u := prefix2String(con)
;     atom(u) => u
;     concatenateStringList([object2String(x) for x in u])

(DEFUN |prefix_to_string| (|con|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|prefix2String| |con|))
      (COND ((ATOM |u|) |u|)
            (#1='T
             (|concatenateStringList|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1#
                    (SETQ |bfVar#2| (CONS (|object2String| |x|) |bfVar#2|))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |u| NIL))))))))

; mkCategory_to_OutputForm(argl) ==
;     throwMessage('"mkCategory_to_OutputForm called")

(DEFUN |mkCategory_to_OutputForm| (|argl|)
  (PROG () (RETURN (|throwMessage| "mkCategory_to_OutputForm called"))))

; Join_to_OutputForm(argl) ==
;     throwMessage('"Join_to_OutputForm called")

(DEFUN |Join_to_OutputForm| (|argl|)
  (PROG () (RETURN (|throwMessage| "Join_to_OutputForm called"))))

; Record_to_OutputForm(argl) ==
;     rres := []
;     for [":", name, type] in argl repeat
;         r1 := ['CONCAT, name, '":", constructor_to_OutputForm(type)]
;         rres := cons(r1, rres)
;     cons('Record, reverse(rres))

(DEFUN |Record_to_OutputForm| (|argl|)
  (PROG (|rres| |ISTMP#1| |name| |ISTMP#2| |type| |r1|)
    (RETURN
     (PROGN
      (SETQ |rres| NIL)
      ((LAMBDA (|bfVar#4| |bfVar#3|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#3|) (EQ (CAR |bfVar#3|) '|:|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bfVar#3|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |name| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |type| (CAR |ISTMP#2|)) #1#)))))
                 (PROGN
                  (SETQ |r1|
                          (LIST 'CONCAT |name| ":"
                                (|constructor_to_OutputForm| |type|)))
                  (SETQ |rres| (CONS |r1| |rres|))))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       |argl| NIL)
      (CONS '|Record| (REVERSE |rres|))))))

; Union_to_OutputForm(argl) ==
;     not(null(argl)) and (first(argl) is [":", name, type]) =>
;         -- new style Union
;         nargs := [['CONCAT, name, '":", constructor_to_OutputForm(type)]
;                   for [":", name, type] in argl]
;         ['Union, :nargs]
;     -- old style
;     nargs := [constructor_to_OutputForm(arg) for arg in argl]
;     ['Union, :nargs]

(DEFUN |Union_to_OutputForm| (|argl|)
  (PROG (|ISTMP#1| |ISTMP#2| |name| |ISTMP#3| |type| |nargs|)
    (RETURN
     (COND
      ((AND (NULL (NULL |argl|))
            (PROGN
             (SETQ |ISTMP#1| (CAR |argl|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |name| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (PROGN
                               (SETQ |type| (CAR |ISTMP#3|))
                               #1='T))))))))
       (PROGN
        (SETQ |nargs|
                ((LAMBDA (|bfVar#7| |bfVar#6| |bfVar#5|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#6|)
                          (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL))
                      (RETURN (NREVERSE |bfVar#7|)))
                     (#1#
                      (AND (CONSP |bfVar#5|) (EQ (CAR |bfVar#5|) '|:|)
                           (PROGN
                            (SETQ |ISTMP#1| (CDR |bfVar#5|))
                            (AND (CONSP |ISTMP#1|)
                                 (PROGN
                                  (SETQ |name| (CAR |ISTMP#1|))
                                  (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                  (AND (CONSP |ISTMP#2|)
                                       (EQ (CDR |ISTMP#2|) NIL)
                                       (PROGN
                                        (SETQ |type| (CAR |ISTMP#2|))
                                        #1#)))))
                           (SETQ |bfVar#7|
                                   (CONS
                                    (LIST 'CONCAT |name| ":"
                                          (|constructor_to_OutputForm| |type|))
                                    |bfVar#7|)))))
                    (SETQ |bfVar#6| (CDR |bfVar#6|))))
                 NIL |argl| NIL))
        (CONS '|Union| |nargs|)))
      (#1#
       (PROGN
        (SETQ |nargs|
                ((LAMBDA (|bfVar#9| |bfVar#8| |arg|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#8|)
                          (PROGN (SETQ |arg| (CAR |bfVar#8|)) NIL))
                      (RETURN (NREVERSE |bfVar#9|)))
                     (#1#
                      (SETQ |bfVar#9|
                              (CONS (|constructor_to_OutputForm| |arg|)
                                    |bfVar#9|))))
                    (SETQ |bfVar#8| (CDR |bfVar#8|))))
                 NIL |argl| NIL))
        (CONS '|Union| |nargs|)))))))

; Mapping_to_OutputForm(argl) ==
;     -- should we allow this ???
;     null(argl) => ['PAREN, ["->", '"()", '"()"]]
;     rt := constructor_to_OutputForm(first(argl))
;     nargs := [constructor_to_OutputForm(arg) for arg in rest(argl)]
;     if #nargs > 1 then
;         nargs := ['PAREN, ['AGGLST, :nargs]]
;     else if null(nargs) then
;         nargs := '"()"
;     else
;         nargs := first(nargs)
;     ['PAREN, ["->", nargs, rt]]

(DEFUN |Mapping_to_OutputForm| (|argl|)
  (PROG (|rt| |nargs|)
    (RETURN
     (COND ((NULL |argl|) (LIST 'PAREN (LIST '-> "()" "()")))
           (#1='T
            (PROGN
             (SETQ |rt| (|constructor_to_OutputForm| (CAR |argl|)))
             (SETQ |nargs|
                     ((LAMBDA (|bfVar#11| |bfVar#10| |arg|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#10|)
                               (PROGN (SETQ |arg| (CAR |bfVar#10|)) NIL))
                           (RETURN (NREVERSE |bfVar#11|)))
                          (#1#
                           (SETQ |bfVar#11|
                                   (CONS (|constructor_to_OutputForm| |arg|)
                                         |bfVar#11|))))
                         (SETQ |bfVar#10| (CDR |bfVar#10|))))
                      NIL (CDR |argl|) NIL))
             (COND
              ((< 1 (LENGTH |nargs|))
               (SETQ |nargs| (LIST 'PAREN (CONS 'AGGLST |nargs|))))
              ((NULL |nargs|) (SETQ |nargs| "()"))
              (#1# (SETQ |nargs| (CAR |nargs|))))
             (LIST 'PAREN (LIST '-> |nargs| |rt|))))))))

; constructor_to_OutputForm(con) ==
;     if VECTORP(con) then
;         con := devaluate(con)
;     STRINGP(con) => CONCAT("_"", con, "_"")
;     ATOM(con) =>
;         con = $EmptyMode => '"?"
;         -- Wrong, but we try to produce something printable
;         any_to_string(con)
;     op := first(con)
;     argl := rest(con)
;
;     op = 'Join => Join_to_OutputForm(argl)
;     op = 'mkCategory => mkCategory_to_OutputForm(argl)
;     op = 'Record => Record_to_OutputForm(argl)
;     op = 'Union => Union_to_OutputForm(argl)
;     op = 'Mapping => Mapping_to_OutputForm(argl)
;     (abb := constructor?(op)) =>
;         null(argl) => constructorName(op)
;         con_sig := getConstructorSignature(op)
;         cosig := get_database(op, 'COSIG)
;         null(con_sig) or null(cosig) =>
;             -- Wrong, but we try to produce something
;             prefix_to_string(con)
;         con_sig := rest(con_sig)
;         cosig := rest(cosig)
;         if not freeOfSharpVars(con_sig) then
;             con_sig := SUBLIS([[s_var, :val]
;                                for s_var in $FormalMapVariableList
;                                for val in argl], con_sig)
;         n_argl := [arg_to_OutputForm(arg, t, c) for arg in argl
;                    for t in con_sig for c in cosig]
;         [constructorName(op), :n_argl]
;     -- Wrong, but we try to produce something
;     prefix_to_string(con)

(DEFUN |constructor_to_OutputForm| (|con|)
  (PROG (|op| |argl| |abb| |con_sig| |cosig| |n_argl|)
    (RETURN
     (PROGN
      (COND ((VECTORP |con|) (SETQ |con| (|devaluate| |con|))))
      (COND ((STRINGP |con|) (CONCAT '|"| |con| '|"|))
            ((ATOM |con|)
             (COND ((EQUAL |con| |$EmptyMode|) "?")
                   (#1='T (|any_to_string| |con|))))
            (#1#
             (PROGN
              (SETQ |op| (CAR |con|))
              (SETQ |argl| (CDR |con|))
              (COND ((EQ |op| '|Join|) (|Join_to_OutputForm| |argl|))
                    ((EQ |op| '|mkCategory|)
                     (|mkCategory_to_OutputForm| |argl|))
                    ((EQ |op| '|Record|) (|Record_to_OutputForm| |argl|))
                    ((EQ |op| '|Union|) (|Union_to_OutputForm| |argl|))
                    ((EQ |op| '|Mapping|) (|Mapping_to_OutputForm| |argl|))
                    ((SETQ |abb| (|constructor?| |op|))
                     (COND ((NULL |argl|) (|constructorName| |op|))
                           (#1#
                            (PROGN
                             (SETQ |con_sig| (|getConstructorSignature| |op|))
                             (SETQ |cosig| (|get_database| |op| 'COSIG))
                             (COND
                              ((OR (NULL |con_sig|) (NULL |cosig|))
                               (|prefix_to_string| |con|))
                              (#1#
                               (PROGN
                                (SETQ |con_sig| (CDR |con_sig|))
                                (SETQ |cosig| (CDR |cosig|))
                                (COND
                                 ((NULL (|freeOfSharpVars| |con_sig|))
                                  (SETQ |con_sig|
                                          (SUBLIS
                                           ((LAMBDA
                                                (|bfVar#14| |bfVar#12| |s_var|
                                                 |bfVar#13| |val|)
                                              (LOOP
                                               (COND
                                                ((OR (ATOM |bfVar#12|)
                                                     (PROGN
                                                      (SETQ |s_var|
                                                              (CAR |bfVar#12|))
                                                      NIL)
                                                     (ATOM |bfVar#13|)
                                                     (PROGN
                                                      (SETQ |val|
                                                              (CAR |bfVar#13|))
                                                      NIL))
                                                 (RETURN
                                                  (NREVERSE |bfVar#14|)))
                                                (#1#
                                                 (SETQ |bfVar#14|
                                                         (CONS
                                                          (CONS |s_var| |val|)
                                                          |bfVar#14|))))
                                               (SETQ |bfVar#12|
                                                       (CDR |bfVar#12|))
                                               (SETQ |bfVar#13|
                                                       (CDR |bfVar#13|))))
                                            NIL |$FormalMapVariableList| NIL
                                            |argl| NIL)
                                           |con_sig|))))
                                (SETQ |n_argl|
                                        ((LAMBDA
                                             (|bfVar#18| |bfVar#15| |arg|
                                              |bfVar#16| |t| |bfVar#17| |c|)
                                           (LOOP
                                            (COND
                                             ((OR (ATOM |bfVar#15|)
                                                  (PROGN
                                                   (SETQ |arg|
                                                           (CAR |bfVar#15|))
                                                   NIL)
                                                  (ATOM |bfVar#16|)
                                                  (PROGN
                                                   (SETQ |t| (CAR |bfVar#16|))
                                                   NIL)
                                                  (ATOM |bfVar#17|)
                                                  (PROGN
                                                   (SETQ |c| (CAR |bfVar#17|))
                                                   NIL))
                                              (RETURN (NREVERSE |bfVar#18|)))
                                             (#1#
                                              (SETQ |bfVar#18|
                                                      (CONS
                                                       (|arg_to_OutputForm|
                                                        |arg| |t| |c|)
                                                       |bfVar#18|))))
                                            (SETQ |bfVar#15| (CDR |bfVar#15|))
                                            (SETQ |bfVar#16| (CDR |bfVar#16|))
                                            (SETQ |bfVar#17|
                                                    (CDR |bfVar#17|))))
                                         NIL |argl| NIL |con_sig| NIL |cosig|
                                         NIL))
                                (CONS (|constructorName| |op|) |n_argl|))))))))
                    (#1# (|prefix_to_string| |con|))))))))))
