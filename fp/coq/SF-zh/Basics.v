Test Nested Proofs Allowed.
Set Nested Proofs Allowed.

Inductive day : Type :=
| monday
| tuesday
| wednesday
| thursday
| friday
| saturday
| sunday.

Definition next_weekday (d:day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
                
  end.

Compute (next_weekday friday).

Compute (next_weekday (next_weekday saturday)).

Example test_next_weekday:
  (next_weekday (next_weekday saturday)) = tuesday.
Proof. simpl. reflexivity. Qed.

Inductive bool : Type :=
  | true
  | false.

Definition negb (b:bool) : bool :=
  match b with
  | true => false
  | false=> true
  end.
Definition andb (b₁:bool) (b₂:bool) : bool :=
  match b₁ with
  | true => b₂
  | false => false
  end.
Definition orb (b₁:bool) (b₂:bool) : bool :=
  match b₁ with
  | true => true
  | false => b₂
  end.

Example test_orb1: (orb true false) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb2: (orb false false) = false.
Proof. simpl. reflexivity. Qed.
Example test_orb3: (orb false true) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb4: (orb true true) = true.
Proof. simpl. reflexivity. Qed.

Notation "x && y" := (andb x y).
Notation "x || y" := (orb x y).

Example test_orb5: false || false || true = true.
Proof. simpl. reflexivity. Qed.

Definition nandb (b₁: bool) (b₂: bool) : bool :=
  match b₁ with
  | true =>
    match b₂ with
    | false => true
    | true => false
    end
  | false => true
  end.

Example test_nandb1 : (nandb true false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb2 : (nandb false false) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb3 : (nandb false true) = true.
Proof. simpl. reflexivity. Qed.

Example test_nandb4 : (nandb true true) = false.
Proof. simpl. reflexivity. Qed.

Definition andb3 (b₁: bool) (b₂:bool) (b₃: bool) : bool :=
  match b₁ with
  | true => (andb b₂ b₃)
  | false => false
  end.

Example test_andb31: (andb3 true true true) = true.
Proof. simpl. reflexivity. Qed.

Example test_andb32: (andb3 false true true) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb33: (andb3 true false true) = false.
Proof. simpl. reflexivity. Qed.

Example test_andb34: (andb3 true true false) = false.
Proof. simpl. reflexivity. Qed.

Check true.

Check (negb true).

Check negb.

Inductive rgb : Type :=
| red
| green
| blue.

Inductive color : Type :=
| black
| white
| primary (p: rgb).

Definition monochrome (c: color) : bool :=
  match c with
  | black => true
  | white => true
  | primary p => false
  end.

Definition isred (c: color) : bool :=
  match c with
  | black => false
  | white => false
  | primary red => true
  | primary _ => false
  end.

Inductive bit : Type :=
| B₀
| B₁.

Inductive nybble : Type :=
| bits (b₀ b₁ b₂ b₃ : bit).

Check (bits B₁ B₀ B₁ B₀).

Definition all_zero (nb: nybble) : bool :=
  match nb with
  | (bits B₀ B₀ B₀ B₀) => true
  | (bits _ _ _ _) => false
  end.

Compute (all_zero (bits B₁ B₀ B₁ B₀)).

Compute (all_zero (bits B₀ B₀ B₀ B₀)).

Module NatPlayground.
  Inductive nat : Type :=
  | O
  | S (n: nat).

  Definition pred (n: nat): nat :=
    match n with
    | O => O
    | S n' => n'
    end.
  
End NatPlayground.

Check (S (S (S (S O)))).

Definition minustwo (n: nat) : nat :=
  match n with
  | O => O
  | S O => O
  | S ( S n' ) => n'
  end.

Compute (minustwo 4).

Check S.

Check pred.

Check minustwo.


Fixpoint evenb (n:nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n') => evenb n'
  end.

Definition oddb (n: nat) : bool :=
  negb (evenb n).


Example test_oddb1: oddb 1 = true.
Proof. simpl. reflexivity. Qed.
Example test_oddb2: oddb 4 = false.
Proof. simpl. reflexivity. Qed.

Module NatPlayground2.

  Fixpoint plus (n: nat) (m: nat) : nat :=
    match n with
    | O => m
    | S n' => S (plus n' m)
    end.

  Compute (plus 3 2).

  Fixpoint mult (n m : nat) : nat :=
    match n with
    | O => O
    | S n' => plus m (mult n' m)
    end.

  Example test_mult1: (mult 3 3) = 9.
  Proof. simpl. reflexivity. Qed.

  Fixpoint minus (n m: nat) : nat :=
    match n, m with
  | O , _ => O
  | S _ , O => n
  | S n', S m' => minus n' m'
    end.

End NatPlayground2.

Fixpoint exp (base power : nat) : nat :=
  match power with
  | O => S O
  | S p => mult base ( exp base p)
  end.

Example test_exp1 : (exp 3 4) = 81.
Proof. simpl. reflexivity. Qed.

Fixpoint factorial (n: nat): nat :=
  match n with
  | O => S O
  | S n' => mult n (factorial n')
  end.

Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.

Example test_facrorial2: (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.

Notation "x + y" := (plus x y)
                      (at level 50, left associativity)
                    : nat_scope.
Notation "x - y" := (minus x y)
                      (at level 50, left associativity)
                    : nat_scope.
Notation "x * y" := (mult x y)
                      (at level 40, left associativity)
                    : nat_scope.

Check ((0 + 1) + 1).

Fixpoint eqb (n m: nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => eqb n' m'
            end
  end.

Fixpoint leb (n m: nat) : bool :=
  match n with
  | O => true
  | S n' => match m with
            | O => false
            | S m' => leb n' m'
            end
  end.

Example test_leb1 : leb 2 2 = true.
Proof. simpl. reflexivity. Qed.

Example test_leb2 : leb 2 4 = true.
Proof. simpl. reflexivity. Qed.

Example test_leb3 : leb 4 2 = false.
Proof. simpl. reflexivity. Qed.

Notation "x =? y" := (eqb x y) (at level 70) :nat_scope.
Notation "x <=? y" := (leb x y) (at level 70) :nat_scope.

Example test_leb3': (4 <=? 2) = false.
Proof. simpl. reflexivity. Qed.

Definition ltb (n m : nat) : bool :=
  (andb (n <=? m) (negb (n =? m))).

Notation "x <? y" := (ltb x y) (at level 70) :nat_scope.

Example test_ltb1: (ltb 2 2) = false.
Proof. simpl. reflexivity. Qed.

Example test_ltb2: (ltb 2 4) = true.
Proof. simpl. reflexivity. Qed.

Example test_ltb3: (ltb 4 2) = false.
Proof. simpl. reflexivity. Qed.


Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof.
  intros n. simpl. reflexivity. Qed.

Theorem plus_O_n'' : forall n : nat,  0 + n = n.
Proof.
  intros n. reflexivity. Qed.

Theorem plus_1_1 : forall n: nat, 1 + n = S n.
Proof.
  intros n. reflexivity. Qed.

Theorem mult_0_1: forall n: nat, 0 * n = 0.
Proof.
  intros n. reflexivity. Qed.

Theorem plus_id_example : forall n m: nat,
    n = m ->
    n + n = m + m.

Proof.
  intros n m.
  intros H.
  rewrite -> H.
  reflexivity. Qed.


Theorem plus_id_exercise : forall n m o : nat,
    n = m -> m = o -> n + m =  m + o.
Proof.
  intros n m o.
  intros H G.
  rewrite -> H.
  rewrite <- G.
  reflexivity. Qed.


Theorem mult_n_0_m_0 : forall n m : nat,
    (n * 0) + (m * 0) = 0.
Proof.
  intros n m.
  rewrite <- mult_n_O.
  rewrite <- mult_n_O.
  reflexivity. Qed.

Check mult_n_O.
Check mult_n_Sm. 

Theorem mult_n_1 : forall n : nat,
    n * 1 = n.
Proof.
  intros n.
  rewrite <- mult_n_Sm.
  rewrite <- mult_n_O.
  reflexivity. Qed.

Theorem plus_1_neq_0 : forall n : nat, (n + 1) =? 0 = false.
Proof.
  intros n. destruct n as [| n'] eqn:E.
  - reflexivity.
  - reflexivity.
Qed.

Theorem negb_involutive: forall b : bool,
    negb (negb b) = b.
Proof.
  intros b. destruct b eqn:E.
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_commutative : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn: Eb.
  - destruct c eqn: Ec.
    + reflexivity.
    + reflexivity.
  - destruct c eqn: Ec.
    + reflexivity.
    + reflexivity.
Qed.

Theorem andb_commutative' : forall b c, andb b c = andb c b.
Proof.
  intros b c. destruct b eqn: Eb.
  { destruct c eqn: Ec.
    { reflexivity. }
    { reflexivity. }}
  { destruct c eqn: Ec.
    { reflexivity. }
    { reflexivity. }}
Qed.

Theorem andb3_exchange :
  forall b c d, andb (andb b c) d = andb (andb b d) c.
Proof.
  intros b c d. destruct b eqn: Eb.
  - destruct c eqn: Ec.
    { destruct d eqn: Ed.
      - reflexivity.
      - reflexivity. }
    { destruct d eqn: Ed.
      - reflexivity.
      - reflexivity. }
  - destruct c eqn: Ec.
    { destruct d eqn: Ed.
      - reflexivity.
      - reflexivity. }
    { destruct d eqn: Ed.
      - reflexivity.
      - reflexivity. }
Qed.


Theorem plus_1_neq_0': forall n : nat,
    (n + 1) =? 0 = false.
Proof.
 intros [|n].
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_commutative'' :
  forall b c, andb b c = andb c b.
Proof.
  intros [] [].
  - reflexivity.
  - reflexivity.
  - reflexivity.
  - reflexivity.
Qed.

Theorem andb_true_elim2: forall b c : bool,
    andb b c = true -> c = true.
Proof.
  intros b c H.
  destruct b eqn: Eb.
  - destruct c eqn: Ec.
    + reflexivity.
    + rewrite <- H. reflexivity.
  - destruct c eqn: Ec.
    + rewrite <- H. reflexivity.
    + rewrite <- H. reflexivity.
Qed.

Theorem zero_nbeq_plus_1: forall n : nat,
    0 =? (n + 1) = false.
Proof.
  destruct n eqn: En.
  - reflexivity.
  - reflexivity.
Qed.

(**
  Fixpoint minus'' (n:nat): nat :=
    match n with
    | O => S O
    | S n' => S (S n')
    end.
 *)

Theorem identity_fn_applied_twice :
  forall (f: bool -> bool),
    (forall (x: bool), f x = x) -> forall (b: bool), f (f b) = b.
Proof.
  intros f H b.
  rewrite -> H.
  rewrite -> H.
  reflexivity.
Qed.

Theorem negation_fn_applied_twice :
  forall (f: bool -> bool),
    (forall (x: bool), f x = negb x) -> forall (b: bool), f (f b) = b.
Proof.
  intros f H b.
  rewrite -> H.
  rewrite -> H.
  destruct b eqn: Eb.
  - reflexivity.
  - reflexivity.
Qed.
  
Theorem orb_always_true: forall c: bool, orb true c = true.
Proof. reflexivity. Qed.

Theorem andb_always_false: forall c: bool, andb false c = false.
Proof. reflexivity. Qed.
    
Theorem andb_eq_orb :
  forall (b c: bool),
    (andb b c = orb b c) -> b = c.
Proof.
  destruct b.
  - intros c H. rewrite <- orb_always_true with c. rewrite <- H. destruct c eqn: Ec.
    + reflexivity.
    + reflexivity.
  - intros c H. rewrite <- andb_always_false with c. rewrite -> H. destruct c eqn: Ec.
    + reflexivity.
    + reflexivity.
Qed.

Inductive bin: Type :=
| Z
| A (n: bin)
| B (n: bin).


Fixpoint incr (m:bin) : bin:=
  match m with
  | Z => B Z
  | A (m') => B (m')
  | B (m') => A (incr (m'))
  end.

Fixpoint bin_to_nat (m:bin) :nat:=
  match m with
  | Z => O
  | A (m') => plus (bin_to_nat m') (bin_to_nat m')
  | B (m') => S ( plus (bin_to_nat m') (bin_to_nat m'))
  end.

Example test_bin_incr1 : (incr (B Z)) = A (B Z).
Proof. simpl. reflexivity. Qed.
Example test_bin_incr2 : (incr (A (B Z))) = B (B Z).
Proof. simpl. reflexivity. Qed.
Example test_bin_incr3 : (incr (B (B Z))) = A (A (B Z)).
Proof. simpl. reflexivity. Qed.
Example test_bin_incr4 : bin_to_nat (A (B Z)) = 2.
Proof. simpl. reflexivity. Qed.
Example test_bin_incr5 :
        bin_to_nat (incr (B Z)) = 1 + bin_to_nat (B Z).
Proof. simpl. reflexivity. Qed.
Example test_bin_incr6 :
        bin_to_nat (incr (incr (B Z))) = 2 + bin_to_nat (B Z).
Proof. simpl. reflexivity. Qed.
