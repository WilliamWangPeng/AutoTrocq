(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_042.
Record point_42 := mkPoint_42 { x_42 : nat; y_42 : nat }.

Definition to_pair_42 (p : point_42) : nat * nat := (x_42 p, y_42 p).
Definition from_pair_42 (q : nat * nat) : point_42 := mkPoint_42 (fst q) (snd q).
Definition weight_point_42 (p : point_42) : nat := x_42 p + y_42 p.
Definition weight_pair_42 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_42 : forall p : point_42, from_pair_42 (to_pair_42 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_42 : forall q : nat * nat, to_pair_42 (from_pair_42 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_42 : forall p : point_42, weight_pair_42 (to_pair_42 p) = weight_point_42 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_042.

