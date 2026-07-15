Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V70_OPTION_WRAPPER_071.
Definition v70_default_71 (o : option nat) : nat :=
  match o with Some n => n | None => 0 end.

Theorem v70_option_map_id_71 : forall o : option nat,
  option_map (fun x => x) o = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem v70_default_some_71 : forall n : nat,
  v70_default_71 (Some n) = n.
Proof.
  reflexivity.
Qed.
End V70_OPTION_WRAPPER_071.

