signature Past_Temporal_LogicTheory =
sig
  type thm = Thm.thm
  
  (*  Definitions  *)
    val InitPoint : thm
    val PALWAYS : thm
    val PBEFORE : thm
    val PEVENTUAL : thm
    val PNEXT : thm
    val PSBEFORE : thm
    val PSNEXT : thm
    val PSUNTIL : thm
    val PSWHEN : thm
    val PUNTIL : thm
    val PWHEN : thm
  
  (*  Theorems  *)
    val BEFORE_EXPRESSIVE : thm
    val CONJUNCTIVE_NORMAL_FORM : thm
    val DISJUNCTIVE_NORMAL_FORM : thm
    val FIXPOINTS : thm
    val IMMEDIATE_EVENT : thm
    val INITIALISATION : thm
    val MORE_EVENT : thm
    val NEGATION_NORMAL_FORM : thm
    val NEXT_INWARDS_NORMAL_FORM : thm
    val NO_FUTURE_EVENT : thm
    val NO_PAST_EVENT : thm
    val PBEFORE_EXPRESSIVE : thm
    val PNEXT_INWARDS_NORMAL_FORM : thm
    val PRENEX_NEXT_NORMAL_FORM : thm
    val PSBEFORE_EXPRESSIVE : thm
    val PSUNTIL_EXPRESSIVE : thm
    val PSWHEN_EXPRESSIVE : thm
    val PUNTIL_EXPRESSIVE : thm
    val PWHEN_EXPRESSIVE : thm
    val RECURSION : thm
    val SBEFORE_EXPRESSIVE : thm
    val SEPARATE_BEFORE_THM : thm
    val SEPARATE_NEXT_THM : thm
    val SEPARATE_PNEXT_THM : thm
    val SEPARATE_PSUNTIL_THM : thm
    val SEPARATE_SUNTIL_THM : thm
    val SIMPLIFY : thm
    val SOME_FUTURE_EVENT : thm
    val SOME_PAST_EVENT : thm
    val SUNTIL_EXPRESSIVE : thm
    val SWHEN_EXPRESSIVE : thm
    val UNTIL_EXPRESSIVE : thm
    val WHEN_EXPRESSIVE : thm
  
  val Past_Temporal_Logic_grammars : type_grammar.grammar * term_grammar.grammar
  
  
(*
   [Temporal_Logic] Parent theory of "Past_Temporal_Logic"
   
   [InitPoint]  Definition
      
      |- InitPoint = (\t. t = 0)
   
   [PALWAYS]  Definition
      
      |- !a t0. PALWAYS a t0 <=> !t. t <= t0 ==> a t
   
   [PBEFORE]  Definition
      
      |- !a b t0.
           (a PBEFORE b) t0 <=>
           (!t. t <= t0 ==> ~b t) \/
           ?delta.
             delta <= t0 /\ a delta /\ !t. delta <= t /\ t <= t0 ==> ~b t
   
   [PEVENTUAL]  Definition
      
      |- !a t0. PEVENTUAL a t0 <=> ?t. t <= t0 /\ a t
   
   [PNEXT]  Definition
      
      |- !a t0. PNEXT a t0 <=> (t0 = 0) \/ a (PRE t0)
   
   [PSBEFORE]  Definition
      
      |- !a b t0.
           (a PSBEFORE b) t0 <=>
           ?delta.
             delta <= t0 /\ a delta /\ !t. delta <= t /\ t <= t0 ==> ~b t
   
   [PSNEXT]  Definition
      
      |- !a t0. PSNEXT a t0 <=> 0 < t0 /\ a (PRE t0)
   
   [PSUNTIL]  Definition
      
      |- !a b t0.
           (a PSUNTIL b) t0 <=>
           ?delta.
             delta <= t0 /\ b delta /\
             !t. delta < t /\ t <= t0 ==> a t /\ ~b t
   
   [PSWHEN]  Definition
      
      |- !a b t0.
           (a PSWHEN b) t0 <=>
           ?delta.
             delta <= t0 /\ a delta /\ b delta /\
             !t. delta < t /\ t <= t0 ==> ~b t
   
   [PUNTIL]  Definition
      
      |- !a b t0.
           (a PUNTIL b) t0 <=>
           (!t. t <= t0 ==> a t) \/
           ?delta.
             delta <= t0 /\ b delta /\
             !t. delta < t /\ t <= t0 ==> a t /\ ~b t
   
   [PWHEN]  Definition
      
      |- !a b t0.
           (a PWHEN b) t0 <=>
           (!t. t <= t0 ==> ~b t) \/
           ?delta.
             delta <= t0 /\ a delta /\ b delta /\
             !t. delta < t /\ t <= t0 ==> ~b t
   
   [BEFORE_EXPRESSIVE]  Theorem
      
      |- (ALWAYS a = (\t. ((\t. F) BEFORE (\t. ~a t)) t)) /\
         (EVENTUAL a = (\t. ~((\t. F) BEFORE a) t)) /\
         (a SUNTIL b = (\t. ~((\t. ~a t) BEFORE b) t)) /\
         (a UNTIL b = (\t. (b BEFORE (\t. ~a t /\ ~b t)) t)) /\
         (a SWHEN b = (\t. ~(b BEFORE (\t. a t /\ b t)) t)) /\
         (a WHEN b =
          (\t. ((\t. a t /\ b t) BEFORE (\t. ~a t /\ b t)) t)) /\
         (a SBEFORE b = (\t. ~(b BEFORE (\t. a t /\ ~b t)) t))
   
   [CONJUNCTIVE_NORMAL_FORM]  Theorem
      
      |- (NEXT (\t. a t /\ b t) = (\t. NEXT a t /\ NEXT b t)) /\
         (ALWAYS (\t. a t /\ b t) = (\t. ALWAYS a t /\ ALWAYS b t)) /\
         ((\t. a t /\ b t) WHEN c = (\t. (a WHEN c) t /\ (b WHEN c) t)) /\
         ((\t. a t /\ b t) SWHEN c =
          (\t. (a SWHEN c) t /\ (b SWHEN c) t)) /\
         ((\t. a t /\ b t) UNTIL c =
          (\t. (a UNTIL c) t /\ (b UNTIL c) t)) /\
         ((\t. a t /\ b t) SUNTIL c =
          (\t. (a SUNTIL c) t /\ (b SUNTIL c) t)) /\
         (c BEFORE (\t. a t \/ b t) =
          (\t. (c BEFORE a) t /\ (c BEFORE b) t)) /\
         (c SBEFORE (\t. a t \/ b t) =
          (\t. (c SBEFORE a) t /\ (c SBEFORE b) t)) /\
         (PNEXT (\t. a t /\ b t) = (\t. PNEXT a t /\ PNEXT b t)) /\
         (PSNEXT (\t. a t /\ b t) = (\t. PSNEXT a t /\ PSNEXT b t)) /\
         (PALWAYS (\t. a t /\ b t) = (\t. PALWAYS a t /\ PALWAYS b t)) /\
         ((\t. a t /\ b t) PWHEN c =
          (\t. (a PWHEN c) t /\ (b PWHEN c) t)) /\
         ((\t. a t /\ b t) PSWHEN c =
          (\t. (a PSWHEN c) t /\ (b PSWHEN c) t)) /\
         ((\t. a t /\ b t) PUNTIL c =
          (\t. (a PUNTIL c) t /\ (b PUNTIL c) t)) /\
         ((\t. a t /\ b t) PSUNTIL c =
          (\t. (a PSUNTIL c) t /\ (b PSUNTIL c) t)) /\
         (c PBEFORE (\t. a t \/ b t) =
          (\t. (c PBEFORE a) t /\ (c PBEFORE b) t)) /\
         (c PSBEFORE (\t. a t \/ b t) =
          (\t. (c PSBEFORE a) t /\ (c PSBEFORE b) t))
   
   [DISJUNCTIVE_NORMAL_FORM]  Theorem
      
      |- (NEXT (\t. a t \/ b t) = (\t. NEXT a t \/ NEXT b t)) /\
         (EVENTUAL (\t. a t \/ b t) =
          (\t. EVENTUAL a t \/ EVENTUAL b t)) /\
         ((\t. a t \/ b t) WHEN c = (\t. (a WHEN c) t \/ (b WHEN c) t)) /\
         ((\t. a t \/ b t) SWHEN c =
          (\t. (a SWHEN c) t \/ (b SWHEN c) t)) /\
         (a UNTIL (\t. b t \/ c t) =
          (\t. (a UNTIL b) t \/ (a UNTIL c) t)) /\
         (a SUNTIL (\t. b t \/ c t) =
          (\t. (a SUNTIL b) t \/ (a SUNTIL c) t)) /\
         ((\t. a t \/ b t) BEFORE c =
          (\t. (a BEFORE c) t \/ (b BEFORE c) t)) /\
         ((\t. a t \/ b t) SBEFORE c =
          (\t. (a SBEFORE c) t \/ (b SBEFORE c) t)) /\
         (PNEXT (\t. a t \/ b t) = (\t. PNEXT a t \/ PNEXT b t)) /\
         (PEVENTUAL (\t. a t \/ b t) =
          (\t. PEVENTUAL a t \/ PEVENTUAL b t)) /\
         ((\t. a t \/ b t) PWHEN c =
          (\t. (a PWHEN c) t \/ (b PWHEN c) t)) /\
         ((\t. a t \/ b t) PSWHEN c =
          (\t. (a PSWHEN c) t \/ (b PSWHEN c) t)) /\
         (a PUNTIL (\t. b t \/ c t) =
          (\t. (a PUNTIL b) t \/ (a PUNTIL c) t)) /\
         (a PSUNTIL (\t. b t \/ c t) =
          (\t. (a PSUNTIL b) t \/ (a PSUNTIL c) t)) /\
         ((\t. a t \/ b t) PBEFORE c =
          (\t. (a PBEFORE c) t \/ (b PBEFORE c) t)) /\
         ((\t. a t \/ b t) PSBEFORE c =
          (\t. (a PSBEFORE c) t \/ (b PSBEFORE c) t))
   
   [FIXPOINTS]  Theorem
      
      |- ((y = (\t. a t /\ NEXT y t)) <=>
          (y = ALWAYS a) \/ (y = (\t. F))) /\
         ((y = (\t. a t \/ NEXT y t)) <=>
          (y = EVENTUAL a) \/ (y = (\t. T))) /\
         ((y = (\t. ~b t ==> a t /\ NEXT y t)) <=>
          (y = a UNTIL b) \/ (y = a SUNTIL b)) /\
         ((y = (\t. if b t then a t else NEXT y t)) <=>
          (y = a WHEN b) \/ (y = a SWHEN b)) /\
         ((y = (\t. ~b t /\ (a t \/ NEXT y t))) <=>
          (y = a BEFORE b) \/ (y = a SBEFORE b)) /\
         ((y = (\t. a t /\ PNEXT y t)) <=> (y = PALWAYS a)) /\
         ((y = (\t. a t \/ PSNEXT y t)) <=> (y = PEVENTUAL a)) /\
         ((y = (\t. b t \/ a t /\ PSNEXT y t)) <=> (y = a PSUNTIL b)) /\
         ((y = (\t. a t /\ b t \/ ~b t /\ PSNEXT y t)) <=>
          (y = a PSWHEN b)) /\
         ((y = (\t. ~b t /\ (a t \/ PSNEXT y t))) <=>
          (y = a PSBEFORE b)) /\
         ((y = (\t. b t \/ a t /\ PNEXT y t)) <=> (y = a PUNTIL b)) /\
         ((y = (\t. a t /\ b t \/ ~b t /\ PNEXT y t)) <=>
          (y = a PWHEN b)) /\
         ((y = (\t. ~b t /\ (a t \/ PNEXT y t))) <=> (y = a PBEFORE b))
   
   [IMMEDIATE_EVENT]  Theorem
      
      |- b t ==>
         ((a WHEN b) t <=> a t) /\ ((a UNTIL b) t <=> T) /\
         ((a BEFORE b) t <=> F) /\ ((b BEFORE a) t <=> ~a t) /\
         ((a SWHEN b) t <=> a t) /\ ((a SUNTIL b) t <=> T) /\
         ((a SBEFORE b) t <=> F) /\ ((b SBEFORE a) t <=> ~a t) /\
         ((a PWHEN b) t <=> a t) /\ ((a PUNTIL b) t <=> T) /\
         ((a PBEFORE b) t <=> F) /\ ((b PBEFORE a) t <=> ~a t) /\
         ((a PSWHEN b) t <=> a t) /\ ((a PSUNTIL b) t <=> T) /\
         ((a PSBEFORE b) t <=> F) /\ ((b PSBEFORE a) t <=> ~a t)
   
   [INITIALISATION]  Theorem
      
      |- (PNEXT a 0 <=> T) /\ (PSNEXT a 0 <=> F) /\
         (PALWAYS a 0 <=> a 0) /\ (PEVENTUAL a 0 <=> a 0) /\
         ((a PSUNTIL b) 0 <=> b 0) /\ ((a PSWHEN b) 0 <=> a 0 /\ b 0) /\
         ((a PSBEFORE b) 0 <=> a 0 /\ ~b 0) /\
         ((a PUNTIL b) 0 <=> a 0 \/ b 0) /\
         ((a PWHEN b) 0 <=> a 0 \/ ~b 0) /\ ((a PBEFORE b) 0 <=> ~b 0)
   
   [MORE_EVENT]  Theorem
      
      |- (a WHEN b = (\t. a t /\ b t) WHEN b) /\
         (a UNTIL b = (\t. a t /\ ~b t) UNTIL b) /\
         (a BEFORE b = (\t. a t /\ ~b t) BEFORE b) /\
         (a SWHEN b = (\t. a t /\ b t) SWHEN b) /\
         (a SUNTIL b = (\t. a t /\ ~b t) SUNTIL b) /\
         (a SBEFORE b = (\t. a t /\ ~b t) SBEFORE b) /\
         (a PWHEN b = (\t. a t /\ b t) PWHEN b) /\
         (a PUNTIL b = (\t. a t /\ ~b t) PUNTIL b) /\
         (a PBEFORE b = (\t. a t /\ ~b t) PBEFORE b) /\
         (a PSWHEN b = (\t. a t /\ b t) PSWHEN b) /\
         (a PSUNTIL b = (\t. a t /\ ~b t) PSUNTIL b) /\
         (a PSBEFORE b = (\t. a t /\ ~b t) PSBEFORE b)
   
   [NEGATION_NORMAL_FORM]  Theorem
      
      |- (~NEXT a t <=> NEXT (\t. ~a t) t) /\
         (~ALWAYS a t <=> EVENTUAL (\t. ~a t) t) /\
         (~EVENTUAL a t <=> ALWAYS (\t. ~a t) t) /\
         (~(a WHEN b) t <=> ((\t. ~a t) SWHEN b) t) /\
         (~(a UNTIL b) t <=> ((\t. ~a t) SBEFORE b) t) /\
         (~(a BEFORE b) t <=> ((\t. ~a t) SUNTIL b) t) /\
         (~(a SWHEN b) t <=> ((\t. ~a t) WHEN b) t) /\
         (~(a SUNTIL b) t <=> ((\t. ~a t) BEFORE b) t) /\
         (~(a SBEFORE b) t <=> ((\t. ~a t) UNTIL b) t) /\
         (~PNEXT a t <=> PSNEXT (\t. ~a t) t) /\
         (~PSNEXT a t <=> PNEXT (\t. ~a t) t) /\
         (~PALWAYS a t <=> PEVENTUAL (\t. ~a t) t) /\
         (~PEVENTUAL a t <=> PALWAYS (\t. ~a t) t) /\
         (~(a PWHEN b) t <=> ((\t. ~a t) PSWHEN b) t) /\
         (~(a PUNTIL b) t <=> ((\t. ~a t) PSBEFORE b) t) /\
         (~(a PBEFORE b) t <=> ((\t. ~a t) PSUNTIL b) t) /\
         (~(a PSWHEN b) t <=> ((\t. ~a t) PWHEN b) t) /\
         (~(a PSUNTIL b) t <=> ((\t. ~a t) PBEFORE b) t) /\
         (~(a PSBEFORE b) t <=> ((\t. ~a t) PUNTIL b) t)
   
   [NEXT_INWARDS_NORMAL_FORM]  Theorem
      
      |- (NEXT (\t. ~a t) = (\t. ~NEXT a t)) /\
         (NEXT (\t. a t /\ b t) = (\t. NEXT a t /\ NEXT b t)) /\
         (NEXT (\t. a t \/ b t) = (\t. NEXT a t \/ NEXT b t)) /\
         (NEXT (ALWAYS a) = ALWAYS (NEXT a)) /\
         (NEXT (EVENTUAL a) = EVENTUAL (NEXT a)) /\
         (NEXT (a SUNTIL b) = NEXT a SUNTIL NEXT b) /\
         (NEXT (a SWHEN b) = NEXT a SWHEN NEXT b) /\
         (NEXT (a SBEFORE b) = NEXT a SBEFORE NEXT b) /\
         (NEXT (a UNTIL b) = NEXT a UNTIL NEXT b) /\
         (NEXT (a WHEN b) = NEXT a WHEN NEXT b) /\
         (NEXT (a BEFORE b) = NEXT a BEFORE NEXT b) /\
         (NEXT (PNEXT a) = a) /\ (NEXT (PSNEXT a) = a) /\
         (NEXT (PALWAYS a) = (\t. PALWAYS a t /\ NEXT a t)) /\
         (NEXT (PEVENTUAL a) = (\t. PEVENTUAL a t \/ NEXT a t)) /\
         (NEXT (a PSUNTIL b) =
          (\t. NEXT b t \/ NEXT a t /\ (a PSUNTIL b) t)) /\
         (NEXT (a PSWHEN b) =
          (\t. if NEXT b t then NEXT a t else (a PSWHEN b) t)) /\
         (NEXT (a PSBEFORE b) =
          (\t. ~NEXT b t /\ (NEXT a t \/ (a PSBEFORE b) t))) /\
         (NEXT (a PUNTIL b) =
          (\t. NEXT b t \/ NEXT a t /\ (a PUNTIL b) t)) /\
         (NEXT (a PWHEN b) =
          (\t. if NEXT b t then NEXT a t else (a PWHEN b) t)) /\
         (NEXT (a PBEFORE b) =
          (\t. ~NEXT b t /\ (NEXT a t \/ (a PBEFORE b) t)))
   
   [NO_FUTURE_EVENT]  Theorem
      
      |- ALWAYS (\t. ~b t) t0 ==>
         (!a. (a WHEN b) t0 <=> T) /\
         (!a. (a UNTIL b) t0 <=> ALWAYS a t0) /\
         (!a. (a BEFORE b) t0 <=> T) /\ (!a. (a SWHEN b) t0 <=> F) /\
         (!a. (a SUNTIL b) t0 <=> F) /\
         !a. (a SBEFORE b) t0 <=> EVENTUAL a t0
   
   [NO_PAST_EVENT]  Theorem
      
      |- PALWAYS (\t. ~b t) t ==>
         ((a PWHEN b) t <=> T) /\ ((a PUNTIL b) t <=> PALWAYS a t) /\
         ((a PBEFORE b) t <=> T) /\
         ((b PBEFORE a) t <=> PALWAYS (\t. ~a t) t) /\
         ((a PSWHEN b) t <=> F) /\ ((a PSUNTIL b) t <=> F) /\
         ((a PSBEFORE b) t <=> PEVENTUAL a t) /\ ((b PSBEFORE a) t <=> F)
   
   [PBEFORE_EXPRESSIVE]  Theorem
      
      |- (PALWAYS a = (\t. ((\t. F) PBEFORE (\t. ~a t)) t)) /\
         (PEVENTUAL a = (\t. ~((\t. F) PBEFORE a) t)) /\
         (a PSUNTIL b = (\t. ~((\t. ~a t) PBEFORE b) t)) /\
         (a PUNTIL b = (\t. (b PBEFORE (\t. ~a t /\ ~b t)) t)) /\
         (a PSWHEN b = (\t. ~(b PBEFORE (\t. a t /\ b t)) t)) /\
         (a PWHEN b =
          (\t. ((\t. a t /\ b t) PBEFORE (\t. ~a t /\ b t)) t)) /\
         (a PSBEFORE b = (\t. ~(b PBEFORE (\t. a t /\ ~b t)) t))
   
   [PNEXT_INWARDS_NORMAL_FORM]  Theorem
      
      |- (PNEXT (\t. ~a t) = (\t. ~PSNEXT a t)) /\
         (PNEXT (\t. a t /\ b t) = (\t. PNEXT a t /\ PNEXT b t)) /\
         (PNEXT (\t. a t \/ b t) = (\t. PNEXT a t \/ PNEXT b t)) /\
         (PNEXT (NEXT a) = (\t. InitPoint t \/ a t)) /\
         (PNEXT (ALWAYS a) = (\t. InitPoint t \/ ALWAYS (PNEXT a) t)) /\
         (PNEXT (EVENTUAL a) =
          (\t. InitPoint t \/ EVENTUAL (PNEXT a) t)) /\
         (PNEXT (a SUNTIL b) = PNEXT a SUNTIL PNEXT b) /\
         (PNEXT (a SWHEN b) = PNEXT a SWHEN PNEXT b) /\
         (PNEXT (a SBEFORE b) = PNEXT a SBEFORE PSNEXT b) /\
         (PNEXT (a UNTIL b) = PNEXT a UNTIL PNEXT b) /\
         (PNEXT (a WHEN b) = PNEXT a WHEN PNEXT b) /\
         (PNEXT (a BEFORE b) = PNEXT a BEFORE PSNEXT b) /\
         (PNEXT (PALWAYS a) = PALWAYS (PNEXT a)) /\
         (PNEXT (PEVENTUAL a) =
          (\t. InitPoint t \/ PEVENTUAL (PSNEXT a) t)) /\
         (PNEXT (a PSUNTIL b) =
          (\t. InitPoint t \/ (PNEXT a PSUNTIL PSNEXT b) t)) /\
         (PNEXT (a PSWHEN b) =
          (\t. InitPoint t \/ (PNEXT a PSWHEN PSNEXT b) t)) /\
         (PNEXT (a PSBEFORE b) =
          (\t. InitPoint t \/ (PSNEXT a PSBEFORE PNEXT b) t)) /\
         (PNEXT (a PUNTIL b) = PNEXT a PUNTIL PNEXT b) /\
         (PNEXT (a PWHEN b) = PNEXT a PWHEN PNEXT b) /\
         (PNEXT (a PBEFORE b) = PNEXT a PBEFORE PSNEXT b)
   
   [PRENEX_NEXT_NORMAL_FORM]  Theorem
      
      |- (~NEXT a t <=> NEXT (\t. ~a t) t) /\
         (a t /\ NEXT b t <=> NEXT (\t. PNEXT a t /\ b t) t) /\
         (a t \/ NEXT b t <=> NEXT (\t. PNEXT a t \/ b t) t) /\
         (ALWAYS (NEXT a) = NEXT (ALWAYS a)) /\
         (EVENTUAL (NEXT a) = NEXT (EVENTUAL a)) /\
         (a SUNTIL NEXT b = NEXT (PNEXT a SUNTIL b)) /\
         (a SWHEN NEXT b = NEXT (PNEXT a SWHEN b)) /\
         (a SBEFORE NEXT b = NEXT (PNEXT a SBEFORE b)) /\
         (a UNTIL NEXT b = NEXT (PNEXT a UNTIL b)) /\
         (a WHEN NEXT b = NEXT (PNEXT a WHEN b)) /\
         (a BEFORE NEXT b = NEXT (PNEXT a BEFORE b)) /\
         (NEXT a SUNTIL b = NEXT (a SUNTIL PNEXT b)) /\
         (NEXT a SWHEN b = NEXT (a SWHEN PNEXT b)) /\
         (NEXT a SBEFORE b = NEXT (a SBEFORE PNEXT b)) /\
         (NEXT a UNTIL b = NEXT (a UNTIL PNEXT b)) /\
         (NEXT a WHEN b = NEXT (a WHEN PNEXT b)) /\
         (NEXT a BEFORE b = NEXT (a BEFORE PNEXT b)) /\
         (PNEXT (NEXT a) = (\t. InitPoint t \/ a t)) /\
         (PSNEXT (NEXT a) = (\t. ~InitPoint t /\ a t)) /\
         (PALWAYS (NEXT a) = NEXT (PALWAYS (\t. InitPoint t \/ a t))) /\
         (PEVENTUAL (NEXT a) =
          NEXT (PEVENTUAL (\t. ~InitPoint t /\ a t))) /\
         (a PSUNTIL NEXT b =
          NEXT (PNEXT a PSUNTIL (\t. ~InitPoint t /\ b t))) /\
         (a PSWHEN NEXT b =
          NEXT (PNEXT a PSWHEN (\t. ~InitPoint t /\ b t))) /\
         (a PSBEFORE NEXT b = NEXT (PSNEXT a PSBEFORE b)) /\
         (a PUNTIL NEXT b = NEXT (PNEXT a PUNTIL b)) /\
         (a PWHEN NEXT b =
          NEXT (PNEXT a PWHEN (\t. ~InitPoint t /\ b t))) /\
         (a PBEFORE NEXT b =
          NEXT (PNEXT a PBEFORE (\t. ~InitPoint t /\ b t))) /\
         (NEXT a PSUNTIL b = NEXT (a PSUNTIL PSNEXT b)) /\
         (NEXT a PSWHEN b = NEXT (a PSWHEN PSNEXT b)) /\
         (NEXT a PSBEFORE b =
          NEXT ((\t. ~InitPoint t /\ a t) PSBEFORE PNEXT b)) /\
         (NEXT a PUNTIL b =
          NEXT ((\t. InitPoint t \/ a t) PUNTIL PNEXT b)) /\
         (NEXT a PWHEN b = NEXT (a PWHEN PSNEXT b)) /\
         (NEXT a PBEFORE b = NEXT (a PBEFORE PSNEXT b))
   
   [PSBEFORE_EXPRESSIVE]  Theorem
      
      |- (PALWAYS a = (\t. ~((\t. ~a t) PSBEFORE (\t. F)) t)) /\
         (PEVENTUAL a = (\t. (a PSBEFORE (\t. F)) t)) /\
         (a PSUNTIL b = (\t. (b PSBEFORE (\t. ~a t /\ ~b t)) t)) /\
         (a PUNTIL b = (\t. ~((\t. ~a t) PSBEFORE b) t)) /\
         (a PSWHEN b = (\t. (b PSBEFORE (\t. ~a t /\ b t)) t)) /\
         (a PWHEN b = (\t. ~(b PSBEFORE (\t. a t /\ b t)) t)) /\
         (a PBEFORE b = (\t. ~(b PSBEFORE (\t. a t /\ ~b t)) t))
   
   [PSUNTIL_EXPRESSIVE]  Theorem
      
      |- (PALWAYS a = (\t. ~((\t. T) PSUNTIL (\t. ~a t)) t)) /\
         (PEVENTUAL a = (\t. ((\t. T) PSUNTIL a) t)) /\
         (a PUNTIL b = (\t. ~((\t. ~b t) PSUNTIL (\t. ~a t /\ ~b t)) t)) /\
         (a PWHEN b =
          (\t. ~((\t. ~a t \/ ~b t) PSUNTIL (\t. ~a t /\ b t)) t)) /\
         (a PBEFORE b = (\t. ~((\t. ~a t) PSUNTIL b) t)) /\
         (a PSWHEN b = (\t. ((\t. ~b t) PSUNTIL (\t. a t /\ b t)) t)) /\
         (a PSBEFORE b = (\t. ((\t. ~b t) PSUNTIL (\t. a t /\ ~b t)) t))
   
   [PSWHEN_EXPRESSIVE]  Theorem
      
      |- (PALWAYS a = (\t. ~((\t. T) PSWHEN (\t. ~a t)) t)) /\
         (PEVENTUAL a = (\t. ((\t. T) PSWHEN a) t)) /\
         (a PSUNTIL b = (\t. (b PSWHEN (\t. a t ==> b t)) t)) /\
         (a PUNTIL b = (\t. ~((\t. ~b t) PSWHEN (\t. a t ==> b t)) t)) /\
         (a PWHEN b = (\t. ~((\t. ~a t) PSWHEN b) t)) /\
         (a PBEFORE b = (\t. ~(b PSWHEN (\t. a t \/ b t)) t)) /\
         (a PSBEFORE b = (\t. ((\t. ~b t) PSWHEN (\t. a t \/ b t)) t))
   
   [PUNTIL_EXPRESSIVE]  Theorem
      
      |- (PALWAYS a = (\t. (a PUNTIL (\t. F)) t)) /\
         (PEVENTUAL a = (\t. ~((\t. ~a t) PUNTIL (\t. F)) t)) /\
         (a PSUNTIL b = (\t. ~((\t. ~b t) PUNTIL (\t. ~a t /\ ~b t)) t)) /\
         (a PWHEN b = (\t. ((\t. ~b t) PUNTIL (\t. a t /\ b t)) t)) /\
         (a PSWHEN b =
          (\t. ~((\t. ~a t \/ ~b t) PUNTIL (\t. ~a t /\ b t)) t)) /\
         (a PBEFORE b = (\t. ((\t. ~b t) PUNTIL (\t. a t /\ ~b t)) t)) /\
         (a PSBEFORE b = (\t. ~((\t. ~a t) PUNTIL b) t))
   
   [PWHEN_EXPRESSIVE]  Theorem
      
      |- (PALWAYS a = (\t. ((\t. F) PWHEN (\t. ~a t)) t)) /\
         (PEVENTUAL a = (\t. ~((\t. F) PWHEN a) t)) /\
         (a PSUNTIL b = (\t. ~((\t. ~b t) PWHEN (\t. a t ==> b t)) t)) /\
         (a PUNTIL b = (\t. (b PWHEN (\t. a t ==> b t)) t)) /\
         (a PSWHEN b = (\t. ~((\t. ~a t) PWHEN b) t)) /\
         (a PBEFORE b = (\t. ((\t. ~b t) PWHEN (\t. a t \/ b t)) t)) /\
         (a PSBEFORE b = (\t. ~(b PWHEN (\t. a t \/ b t)) t))
   
   [RECURSION]  Theorem
      
      |- (ALWAYS a = (\t. a t /\ NEXT (ALWAYS a) t)) /\
         (EVENTUAL a = (\t. a t \/ NEXT (EVENTUAL a) t)) /\
         (a SUNTIL b = (\t. ~b t ==> a t /\ NEXT (a SUNTIL b) t)) /\
         (a SWHEN b = (\t. if b t then a t else NEXT (a SWHEN b) t)) /\
         (a SBEFORE b = (\t. ~b t /\ (a t \/ NEXT (a SBEFORE b) t))) /\
         (a UNTIL b = (\t. ~b t ==> a t /\ NEXT (a UNTIL b) t)) /\
         (a WHEN b = (\t. if b t then a t else NEXT (a WHEN b) t)) /\
         (a BEFORE b = (\t. ~b t /\ (a t \/ NEXT (a BEFORE b) t))) /\
         (PALWAYS a = (\t. a t /\ PNEXT (PALWAYS a) t)) /\
         (PEVENTUAL a = (\t. a t \/ PSNEXT (PEVENTUAL a) t)) /\
         (a PSUNTIL b = (\t. b t \/ a t /\ PSNEXT (a PSUNTIL b) t)) /\
         (a PSWHEN b =
          (\t. a t /\ b t \/ ~b t /\ PSNEXT (a PSWHEN b) t)) /\
         (a PSBEFORE b = (\t. ~b t /\ (a t \/ PSNEXT (a PSBEFORE b) t))) /\
         (a PUNTIL b = (\t. b t \/ a t /\ PNEXT (a PUNTIL b) t)) /\
         (a PWHEN b = (\t. a t /\ b t \/ ~b t /\ PNEXT (a PWHEN b) t)) /\
         (a PBEFORE b = (\t. ~b t /\ (a t \/ PNEXT (a PBEFORE b) t)))
   
   [SBEFORE_EXPRESSIVE]  Theorem
      
      |- (ALWAYS a = (\t. ~((\t. ~a t) SBEFORE (\t. F)) t)) /\
         (EVENTUAL a = (\t. (a SBEFORE (\t. F)) t)) /\
         (a SUNTIL b = (\t. (b SBEFORE (\t. ~a t /\ ~b t)) t)) /\
         (a UNTIL b = (\t. ~((\t. ~a t) SBEFORE b) t)) /\
         (a SWHEN b = (\t. (b SBEFORE (\t. ~a t /\ b t)) t)) /\
         (a WHEN b = (\t. ~(b SBEFORE (\t. a t /\ b t)) t)) /\
         (a BEFORE b = (\t. ~(b SBEFORE (\t. a t /\ ~b t)) t))
   
   [SEPARATE_BEFORE_THM]  Theorem
      
      |- (a BEFORE (\t. b t \/ c t) =
          (\t. (a BEFORE b) t /\ (a BEFORE c) t)) /\
         ((\t. a t \/ b t) BEFORE c =
          (\t. (a BEFORE c) t \/ (b BEFORE c) t)) /\
         (a BEFORE (\t. b t /\ PNEXT c t) =
          (\t.
             ~(b t /\ PNEXT c t) /\
             (a t \/ (NEXT a BEFORE (\t. c t /\ NEXT b t)) t))) /\
         (a BEFORE (\t. b t /\ PSNEXT c t) =
          (\t.
             ~(b t /\ PSNEXT c t) /\
             (a t \/ (NEXT a BEFORE (\t. c t /\ NEXT b t)) t))) /\
         (a BEFORE (\t. b t /\ (c PSUNTIL d) t) =
          (\t.
             (((\t. ~c t) PBEFORE d) t \/
              ((\t. a t \/ ~NEXT c t) BEFORE b) t) /\
             (a BEFORE (\t. d t /\ ((\t. ~a t /\ NEXT c t) SUNTIL b) t))
               t)) /\
         (a BEFORE (\t. b t /\ (c PBEFORE d) t) =
          (\t.
             (((\t. ~c t) PSUNTIL d) t \/
              ((\t. a t \/ NEXT d t) BEFORE b) t) /\
             (a BEFORE
              (\t. c t /\ ~d t /\ ((\t. ~a t /\ ~NEXT d t) SUNTIL b) t))
               t)) /\
         ((\t. a t /\ PNEXT b t) BEFORE c =
          (\t.
             ~c t /\ a t /\ PNEXT b t \/
             ~c t /\ ((\t. b t /\ NEXT a t) BEFORE NEXT c) t)) /\
         ((\t. a t /\ PSNEXT b t) BEFORE c =
          (\t.
             ~c t /\ a t /\ PSNEXT b t \/
             ~c t /\ ((\t. b t /\ NEXT a t) BEFORE NEXT c) t)) /\
         ((\t. a t /\ (b PBEFORE c) t) BEFORE d =
          (\t.
             (b PBEFORE c) t /\
             ((\t. ~d t /\ ~NEXT c t) SUNTIL (\t. a t /\ ~d t)) t \/
             ((\t.
                 b t /\ ~c t /\
                 ((\t. ~d t /\ ~NEXT c t) SUNTIL (\t. a t /\ ~d t))
                   t) BEFORE d) t)) /\
         ((\t. a t /\ (b PSUNTIL c) t) BEFORE d =
          (\t.
             (b PSUNTIL c) t /\
             ((\t. ~d t /\ NEXT b t) SUNTIL (\t. a t /\ ~d t)) t \/
             ((\t.
                 c t /\
                 ((\t. ~d t /\ NEXT b t) SUNTIL (\t. a t /\ ~d t))
                   t) BEFORE d) t))
   
   [SEPARATE_NEXT_THM]  Theorem
      
      |- (NEXT (\t. a t /\ PNEXT b t) = (\t. b t /\ NEXT a t)) /\
         (NEXT (\t. a t /\ PSNEXT b t) = (\t. b t /\ NEXT a t)) /\
         (NEXT (\t. a t /\ (b PSUNTIL c) t) =
          (\t.
             NEXT (\t. a t /\ c t) t \/
             (b PSUNTIL c) t /\ NEXT (\t. a t /\ b t) t)) /\
         (NEXT (\t. a t /\ (b PBEFORE c) t) =
          (\t.
             NEXT (\t. a t /\ b t /\ ~c t) t \/
             (b PBEFORE c) t /\ NEXT (\t. a t /\ ~c t) t)) /\
         (NEXT (\t. a t \/ PNEXT b t) = (\t. b t \/ NEXT a t)) /\
         (NEXT (\t. a t \/ PSNEXT b t) = (\t. b t \/ NEXT a t)) /\
         (NEXT (\t. a t \/ (b PSUNTIL c) t) =
          (\t. NEXT (\t. a t \/ c t) t \/ (b PSUNTIL c) t /\ NEXT b t)) /\
         (NEXT (\t. a t \/ (b PBEFORE c) t) =
          (\t.
             NEXT (\t. a t \/ ~c t) t /\
             ((b PBEFORE c) t \/ NEXT (\t. a t \/ b t) t)))
   
   [SEPARATE_PNEXT_THM]  Theorem
      
      |- (PNEXT (\t. a t /\ NEXT b t) =
          (\t. InitPoint t \/ b t /\ PNEXT a t)) /\
         (PNEXT (\t. a t /\ (b SUNTIL c) t) =
          (\t.
             PNEXT (\t. a t /\ c t) t \/
             (b SUNTIL c) t /\ PNEXT (\t. a t /\ b t) t)) /\
         (PNEXT (\t. a t /\ (b BEFORE c) t) =
          (\t.
             PNEXT (\t. a t /\ b t /\ ~c t) t \/
             (b BEFORE c) t /\ PNEXT (\t. a t /\ ~c t) t)) /\
         (PNEXT (\t. a t \/ NEXT b t) = (\t. b t \/ PNEXT a t)) /\
         (PNEXT (\t. a t \/ (b SUNTIL c) t) =
          (\t. PNEXT (\t. a t \/ c t) t \/ (b SUNTIL c) t /\ PNEXT b t)) /\
         (PNEXT (\t. a t \/ (b BEFORE c) t) =
          (\t.
             PNEXT (\t. a t \/ ~c t) t /\
             ((b BEFORE c) t \/ PNEXT (\t. a t \/ b t) t)))
   
   [SEPARATE_PSUNTIL_THM]  Theorem
      
      |- (a PSUNTIL (\t. b t \/ c t) =
          (\t. (a PSUNTIL b) t \/ (a PSUNTIL c) t)) /\
         (a PSUNTIL (\t. b t /\ NEXT c t) =
          (\t.
             b t /\ NEXT c t \/
             (a PSUNTIL (\t. a t /\ c t /\ PSNEXT b t)) t)) /\
         (a PSUNTIL (\t. b t /\ (c SUNTIL d) t) =
          (\t.
             (c SUNTIL d) t /\ ((\t. a t /\ PNEXT c t) PSUNTIL b) t \/
             (a PSUNTIL (\t. d t /\ ((\t. a t /\ PNEXT c t) PSUNTIL b) t))
               t)) /\
         (a PSUNTIL (\t. b t /\ (c BEFORE d) t) =
          (\t.
             (c BEFORE d) t /\ ((\t. a t /\ ~PNEXT d t) PSUNTIL b) t \/
             (a PSUNTIL
              (\t. c t /\ ~d t /\ ((\t. a t /\ ~PNEXT d t) PSUNTIL b) t))
               t)) /\
         ((\t. a t /\ b t) PSUNTIL c =
          (\t. (a PSUNTIL c) t /\ (b PSUNTIL c) t)) /\
         ((\t. a t \/ NEXT b t) PSUNTIL c =
          (\t.
             c t \/
             (a t \/ NEXT b t) /\
             ((\t. b t \/ PNEXT a t) PSUNTIL PSNEXT c) t)) /\
         ((\t. a t \/ (b SUNTIL c) t) PSUNTIL d =
          (\t.
             ((b SUNTIL c) t \/
              ((\t. d t \/ PNEXT c t) PBEFORE (\t. ~a t /\ ~d t)) t) /\
             ((\t.
                 b t \/ c t \/
                 ((\t. d t \/ PNEXT c t) PBEFORE (\t. ~a t /\ ~d t))
                   t) PSUNTIL d) t)) /\
         ((\t. a t \/ (b BEFORE c) t) PSUNTIL d =
          (\t.
             ((b BEFORE c) t \/
              ((\t. d t \/ PSNEXT b t) PBEFORE (\t. ~a t /\ ~d t)) t) /\
             ((\t.
                 ~c t \/
                 ((\t. d t \/ PSNEXT b t) PBEFORE (\t. ~a t /\ ~d t))
                   t) PSUNTIL d) t))
   
   [SEPARATE_SUNTIL_THM]  Theorem
      
      |- (a SUNTIL (\t. b t \/ c t) =
          (\t. (a SUNTIL b) t \/ (a SUNTIL c) t)) /\
         (a SUNTIL (\t. b t /\ PNEXT c t) =
          (\t.
             b t /\ PNEXT c t \/
             (a SUNTIL (\t. a t /\ c t /\ NEXT b t)) t)) /\
         (a SUNTIL (\t. b t /\ PSNEXT c t) =
          (\t.
             b t /\ PSNEXT c t \/
             (a SUNTIL (\t. a t /\ c t /\ NEXT b t)) t)) /\
         (a SUNTIL (\t. b t /\ (c PSUNTIL d) t) =
          (\t.
             (c PSUNTIL d) t /\ ((\t. a t /\ NEXT c t) SUNTIL b) t \/
             (a SUNTIL (\t. d t /\ ((\t. a t /\ NEXT c t) SUNTIL b) t))
               t)) /\
         (a SUNTIL (\t. b t /\ (c PBEFORE d) t) =
          (\t.
             (c PBEFORE d) t /\ ((\t. a t /\ ~NEXT d t) SUNTIL b) t \/
             (a SUNTIL
              (\t. c t /\ ~d t /\ ((\t. a t /\ ~NEXT d t) SUNTIL b) t))
               t)) /\
         ((\t. a t /\ b t) SUNTIL c =
          (\t. (a SUNTIL c) t /\ (b SUNTIL c) t)) /\
         ((\t. a t \/ PNEXT b t) SUNTIL c =
          (\t.
             c t \/
             (a t \/ PNEXT b t) /\
             ((\t. b t \/ NEXT a t) SUNTIL NEXT c) t)) /\
         ((\t. a t \/ PSNEXT b t) SUNTIL c =
          (\t.
             c t \/
             (a t \/ PSNEXT b t) /\
             ((\t. b t \/ NEXT a t) SUNTIL NEXT c) t)) /\
         ((\t. a t \/ (b PSUNTIL c) t) SUNTIL d =
          (\t.
             ((b PSUNTIL c) t \/
              ((\t. d t \/ NEXT c t) BEFORE (\t. ~a t /\ ~d t)) t) /\
             ((\t.
                 b t \/ c t \/
                 ((\t. d t \/ NEXT c t) BEFORE (\t. ~a t /\ ~d t))
                   t) SUNTIL d) t)) /\
         ((\t. a t \/ (b PBEFORE c) t) SUNTIL d =
          (\t.
             ((b PBEFORE c) t \/
              ((\t. d t \/ NEXT b t) BEFORE (\t. ~a t /\ ~d t)) t) /\
             ((\t.
                 ~c t \/
                 ((\t. d t \/ NEXT b t) BEFORE (\t. ~a t /\ ~d t))
                   t) SUNTIL d) t))
   
   [SIMPLIFY]  Theorem
      
      |- (NEXT (\t. F) = (\t. F)) /\ (NEXT (\t. T) = (\t. T)) /\
         (ALWAYS (\t. T) = (\t. T)) /\ (ALWAYS (\t. F) = (\t. F)) /\
         (EVENTUAL (\t. T) = (\t. T)) /\ (EVENTUAL (\t. F) = (\t. F)) /\
         ((\t. F) SUNTIL b = b) /\ ((\t. T) SUNTIL b = EVENTUAL b) /\
         (a SUNTIL (\t. F) = (\t. F)) /\ (a SUNTIL (\t. T) = (\t. T)) /\
         (a SUNTIL a = a) /\ ((\t. F) UNTIL b = b) /\
         ((\t. T) UNTIL b = (\t. T)) /\ (a UNTIL (\t. F) = ALWAYS a) /\
         (a UNTIL (\t. T) = (\t. T)) /\ (a UNTIL a = a) /\
         ((\t. F) SWHEN b = (\t. F)) /\ ((\t. T) SWHEN b = EVENTUAL b) /\
         (a SWHEN (\t. F) = (\t. F)) /\ (a SWHEN (\t. T) = a) /\
         (a SWHEN a = EVENTUAL a) /\
         ((\t. F) WHEN b = ALWAYS (\t. ~b t)) /\
         ((\t. T) WHEN b = (\t. T)) /\ (a WHEN (\t. F) = (\t. T)) /\
         (a WHEN (\t. T) = a) /\ (a WHEN a = (\t. T)) /\
         ((\t. F) SBEFORE b = (\t. F)) /\
         ((\t. T) SBEFORE b = (\t. ~b t)) /\
         (a SBEFORE (\t. F) = EVENTUAL a) /\
         (a SBEFORE (\t. T) = (\t. F)) /\ (a SBEFORE a = (\t. F)) /\
         ((\t. F) BEFORE b = ALWAYS (\t. ~b t)) /\
         ((\t. T) BEFORE b = (\t. ~b t)) /\ (a BEFORE (\t. F) = (\t. T)) /\
         (a BEFORE (\t. T) = (\t. F)) /\
         (a BEFORE a = ALWAYS (\t. ~a t)) /\ (PNEXT (\t. F) = InitPoint) /\
         (PNEXT (\t. T) = (\t. T)) /\ (PSNEXT (\t. F) = (\t. F)) /\
         (PSNEXT (\t. T) = (\t. ~InitPoint t)) /\
         (PALWAYS (\t. T) = (\t. T)) /\ (PALWAYS (\t. F) = (\t. F)) /\
         (PEVENTUAL (\t. T) = (\t. T)) /\ (PEVENTUAL (\t. F) = (\t. F)) /\
         ((\t. F) PSUNTIL b = b) /\ ((\t. T) PSUNTIL b = PEVENTUAL b) /\
         (a PSUNTIL (\t. F) = (\t. F)) /\ (a PSUNTIL (\t. T) = (\t. T)) /\
         (a PSUNTIL a = a) /\ ((\t. F) PUNTIL b = b) /\
         ((\t. T) PUNTIL b = (\t. T)) /\ (a PUNTIL (\t. F) = PALWAYS a) /\
         (a PUNTIL (\t. T) = (\t. T)) /\ (a PUNTIL a = a) /\
         ((\t. F) PSWHEN b = (\t. F)) /\
         ((\t. T) PSWHEN b = PEVENTUAL b) /\
         (a PSWHEN (\t. F) = (\t. F)) /\ (a PSWHEN (\t. T) = a) /\
         (a PSWHEN a = PEVENTUAL a) /\
         ((\t. F) PWHEN b = PALWAYS (\t. ~b t)) /\
         ((\t. T) PWHEN b = (\t. T)) /\ (a PWHEN (\t. F) = (\t. T)) /\
         (a PWHEN (\t. T) = a) /\ (a PWHEN a = (\t. T)) /\
         ((\t. F) PSBEFORE b = (\t. F)) /\
         ((\t. T) PSBEFORE b = (\t. ~b t)) /\
         (a PSBEFORE (\t. F) = PEVENTUAL a) /\
         (a PSBEFORE (\t. T) = (\t. F)) /\ (a PSBEFORE a = (\t. F)) /\
         ((\t. F) PBEFORE b = PALWAYS (\t. ~b t)) /\
         ((\t. T) PBEFORE b = (\t. ~b t)) /\
         (a PBEFORE (\t. F) = (\t. T)) /\ (a PBEFORE (\t. T) = (\t. F)) /\
         (a PBEFORE a = PALWAYS (\t. ~a t))
   
   [SOME_FUTURE_EVENT]  Theorem
      
      |- (EVENTUAL b t0 <=> !a. (a WHEN b) t0 <=> (a SWHEN b) t0) /\
         (EVENTUAL b t0 <=> !a. (a UNTIL b) t0 <=> (a SUNTIL b) t0) /\
         (EVENTUAL b t0 <=> !a. (a BEFORE b) t0 <=> (a SBEFORE b) t0)
   
   [SOME_PAST_EVENT]  Theorem
      
      |- PEVENTUAL b t ==>
         ((a PWHEN b) t <=> (a PSWHEN b) t) /\
         ((a PUNTIL b) t <=> (a PSUNTIL b) t) /\
         ((a PBEFORE b) t <=> (a PSBEFORE b) t) /\
         ((b PBEFORE a) t <=> (b PSBEFORE a) t)
   
   [SUNTIL_EXPRESSIVE]  Theorem
      
      |- (ALWAYS a = (\t. ~((\t. T) SUNTIL (\t. ~a t)) t)) /\
         (EVENTUAL a = (\t. ((\t. T) SUNTIL a) t)) /\
         (a UNTIL b = (\t. ~((\t. ~b t) SUNTIL (\t. ~a t /\ ~b t)) t)) /\
         (a WHEN b =
          (\t. ~((\t. ~a t \/ ~b t) SUNTIL (\t. ~a t /\ b t)) t)) /\
         (a BEFORE b = (\t. ~((\t. ~a t) SUNTIL b) t)) /\
         (a SWHEN b = (\t. ((\t. ~b t) SUNTIL (\t. a t /\ b t)) t)) /\
         (a SBEFORE b = (\t. ((\t. ~b t) SUNTIL (\t. a t /\ ~b t)) t))
   
   [SWHEN_EXPRESSIVE]  Theorem
      
      |- (ALWAYS a = (\t. ~((\t. T) SWHEN (\t. ~a t)) t)) /\
         (EVENTUAL a = (\t. ((\t. T) SWHEN a) t)) /\
         (a SUNTIL b = (\t. (b SWHEN (\t. a t ==> b t)) t)) /\
         (a UNTIL b = (\t. ~((\t. ~b t) SWHEN (\t. a t ==> b t)) t)) /\
         (a WHEN b = (\t. ~((\t. ~a t) SWHEN b) t)) /\
         (a BEFORE b = (\t. ~(b SWHEN (\t. a t \/ b t)) t)) /\
         (a SBEFORE b = (\t. ((\t. ~b t) SWHEN (\t. a t \/ b t)) t))
   
   [UNTIL_EXPRESSIVE]  Theorem
      
      |- (ALWAYS a = (\t. (a UNTIL (\t. F)) t)) /\
         (EVENTUAL a = (\t. ~((\t. ~a t) UNTIL (\t. F)) t)) /\
         (a SUNTIL b = (\t. ~((\t. ~b t) UNTIL (\t. ~a t /\ ~b t)) t)) /\
         (a WHEN b = (\t. ((\t. ~b t) UNTIL (\t. a t /\ b t)) t)) /\
         (a SWHEN b =
          (\t. ~((\t. ~a t \/ ~b t) UNTIL (\t. ~a t /\ b t)) t)) /\
         (a BEFORE b = (\t. ((\t. ~b t) UNTIL (\t. a t /\ ~b t)) t)) /\
         (a SBEFORE b = (\t. ~((\t. ~a t) UNTIL b) t))
   
   [WHEN_EXPRESSIVE]  Theorem
      
      |- (ALWAYS a = (\t. ((\t. F) WHEN (\t. ~a t)) t)) /\
         (EVENTUAL a = (\t. ~((\t. F) WHEN a) t)) /\
         (a SUNTIL b = (\t. ~((\t. ~b t) WHEN (\t. a t ==> b t)) t)) /\
         (a UNTIL b = (\t. (b WHEN (\t. a t ==> b t)) t)) /\
         (a SWHEN b = (\t. ~((\t. ~a t) WHEN b) t)) /\
         (a BEFORE b = (\t. ((\t. ~b t) WHEN (\t. a t \/ b t)) t)) /\
         (a SBEFORE b = (\t. ~(b WHEN (\t. a t \/ b t)) t))
   
   
*)
end