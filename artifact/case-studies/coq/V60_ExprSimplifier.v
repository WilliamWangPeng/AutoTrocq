(* V60 case-study module *)
(* PATTERN: expression rewrite *)
(* TRANSFER_SHAPE: semantic preservation *)

Module V60_ExprSimplifier.
Require Import Coq.Arith.PeanoNat.

Inductive expr :=
| Const : nat -> expr
| Plus : expr -> expr -> expr.

Fixpoint eval (e : expr) : nat :=
  match e with
  | Const n => n
  | Plus a b => eval a + eval b
  end.

Fixpoint simplify (e : expr) : expr :=
  match e with
  | Const n => Const n
  | Plus (Const 0) b => simplify b
  | Plus a (Const 0) => simplify a
  | Plus a b => Plus (simplify a) (simplify b)
  end.

Theorem simplify_sound : forall e, eval (simplify e) = eval e.
Proof.
  induction e as [n|a IHa b IHb]; simpl.
  - reflexivity.
  - destruct a as [na|aa ab]; destruct b as [nb|ba bb]; simpl in *.
    + destruct na; simpl.
      * reflexivity.
      * destruct nb; simpl; try rewrite Nat.add_0_r; reflexivity.
    + destruct na; simpl.
      * exact IHb.
      * now rewrite IHb.
    + destruct nb; simpl.
      * rewrite IHa. now rewrite Nat.add_0_r.
      * now rewrite IHa.
    + now rewrite IHa, IHb.
Qed.

Theorem simplify_const : forall n, simplify (Const n) = Const n.
Proof. reflexivity. Qed.

Theorem eval_plus_zero : forall e, eval (Plus (Const 0) e) = eval e.
Proof. reflexivity. Qed.
End V60_ExprSimplifier.

