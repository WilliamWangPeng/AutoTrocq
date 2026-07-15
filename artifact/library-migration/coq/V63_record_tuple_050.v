(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_050.
Record point_50 := mkPoint_50 { x_50 : nat; y_50 : nat }.

Definition to_pair_50 (p : point_50) : nat * nat := (x_50 p, y_50 p).
Definition from_pair_50 (q : nat * nat) : point_50 := mkPoint_50 (fst q) (snd q).
Definition weight_point_50 (p : point_50) : nat := x_50 p + y_50 p.
Definition weight_pair_50 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_50 : forall p : point_50, from_pair_50 (to_pair_50 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_50 : forall q : nat * nat, to_pair_50 (from_pair_50 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_50 : forall p : point_50, weight_pair_50 (to_pair_50 p) = weight_point_50 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_050.

