(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_020.
Record point_20 := mkPoint_20 { x_20 : nat; y_20 : nat }.

Definition to_pair_20 (p : point_20) : nat * nat := (x_20 p, y_20 p).
Definition from_pair_20 (q : nat * nat) : point_20 := mkPoint_20 (fst q) (snd q).
Definition weight_point_20 (p : point_20) : nat := x_20 p + y_20 p.
Definition weight_pair_20 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_20 : forall p : point_20, from_pair_20 (to_pair_20 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_20 : forall q : nat * nat, to_pair_20 (from_pair_20 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_20 : forall p : point_20, weight_pair_20 (to_pair_20 p) = weight_point_20 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_020.

