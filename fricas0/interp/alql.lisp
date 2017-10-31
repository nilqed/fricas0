 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; getBrowseDatabase(kind) ==
;   $includeUnexposed? : local := true
;   not member(kind,'("o" "k" "c" "d" "p")) => nil
;   grepConstruct('"*",INTERN kind)
 
(DEFUN |getBrowseDatabase| (|kind|)
  (PROG (|$includeUnexposed?|)
    (DECLARE (SPECIAL |$includeUnexposed?|))
    (RETURN
     (PROGN
      (SETQ |$includeUnexposed?| T)
      (COND ((NULL (|member| |kind| '("o" "k" "c" "d" "p"))) NIL)
            ('T (|grepConstruct| "*" (INTERN |kind|))))))))
 
; stringMatches?(pattern,subject) ==
;   FIXP basicMatch?(pattern,subject) => true
;   false
 
(DEFUN |stringMatches?| (|pattern| |subject|)
  (PROG ()
    (RETURN (COND ((FIXP (|basicMatch?| |pattern| |subject|)) T) ('T NIL)))))
 
; alqlGetKindString(x) ==
;   x.0 = char 'a or x.0 = char 'o => SUBSTRING(dbPart(x,5,1),0,1)
;   SUBSTRING(x,0,1)
 
(DEFUN |alqlGetKindString| (|x|)
  (PROG ()
    (RETURN
     (COND
      ((OR (EQUAL (ELT |x| 0) (|char| '|a|)) (EQUAL (ELT |x| 0) (|char| '|o|)))
       (SUBSTRING (|dbPart| |x| 5 1) 0 1))
      ('T (SUBSTRING |x| 0 1))))))
 
; alqlGetOrigin(x) ==
;   field :=dbPart(x,5,1)
;   k := charPosition(char '_(,field,2)
;   SUBSTRING(field,1,k-1)
 
(DEFUN |alqlGetOrigin| (|x|)
  (PROG (|field| |k|)
    (RETURN
     (PROGN
      (SETQ |field| (|dbPart| |x| 5 1))
      (SETQ |k| (|charPosition| (|char| '|(|) |field| 2))
      (SUBSTRING |field| 1 (- |k| 1))))))
 
; alqlGetParams(x) ==
;   field :=dbPart(x,5,1)
;   k := charPosition(char '_(,field,2)
;   SUBSTRING(field,k,nil)
 
(DEFUN |alqlGetParams| (|x|)
  (PROG (|field| |k|)
    (RETURN
     (PROGN
      (SETQ |field| (|dbPart| |x| 5 1))
      (SETQ |k| (|charPosition| (|char| '|(|) |field| 2))
      (SUBSTRING |field| |k| NIL)))))
