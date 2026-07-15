Require Import Coq.Lists.List.
Require Import Coq.Bool.Bool.
Require Import Coq.Arith.PeanoNat.
Import ListNotations.

Module V66_OPTION_MAINTENANCE_044.
Definition v66_default_44 (o : option nat) : nat :=
  match o with Some n => n | None => 0 end.

Theorem v66_option_map_id_44 : forall (o : option nat),
  option_map (fun x => x) o = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem v66_option_default_map_44 : forall (o : option nat),
  v66_default_44 (option_map S o) =
  match o with Some n => S n | None => 0 end.
Proof.
  destruct o; reflexivity.
Qed.
End V66_OPTION_MAINTENANCE_044.

