(* V60 case-study module *)
(* PATTERN: wrapper refinement *)
(* TRANSFER_SHAPE: API preservation *)

Module V60_StackWrapper.
Require Import Coq.Lists.List.
Import ListNotations.

Definition stack := list nat.
Definition empty : stack := [].
Definition push (n : nat) (s : stack) : stack := n :: s.
Definition pop (s : stack) : option (nat * stack) :=
  match s with
  | [] => None
  | x :: xs => Some (x, xs)
  end.
Definition size (s : stack) : nat := length s.

Theorem size_empty : size empty = 0.
Proof. reflexivity. Qed.

Theorem size_push : forall n s, size (push n s) = S (size s).
Proof. reflexivity. Qed.

Theorem pop_push : forall n s, pop (push n s) = Some (n, s).
Proof. reflexivity. Qed.

Theorem pop_empty : pop empty = None.
Proof. reflexivity. Qed.
End V60_StackWrapper.

