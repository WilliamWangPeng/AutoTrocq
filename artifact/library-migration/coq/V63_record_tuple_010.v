(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_010.
Record point_10 := mkPoint_10 { x_10 : nat; y_10 : nat }.

Definition to_pair_10 (p : point_10) : nat * nat := (x_10 p, y_10 p).
Definition from_pair_10 (q : nat * nat) : point_10 := mkPoint_10 (fst q) (snd q).
Definition weight_point_10 (p : point_10) : nat := x_10 p + y_10 p.
Definition weight_pair_10 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_10 : forall p : point_10, from_pair_10 (to_pair_10 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_10 : forall q : nat * nat, to_pair_10 (from_pair_10 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_10 : forall p : point_10, weight_pair_10 (to_pair_10 p) = weight_point_10 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_010.

