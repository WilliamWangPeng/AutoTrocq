(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_031.
Record point_31 := mkPoint_31 { x_31 : nat; y_31 : nat }.

Definition to_pair_31 (p : point_31) : nat * nat := (x_31 p, y_31 p).
Definition from_pair_31 (q : nat * nat) : point_31 := mkPoint_31 (fst q) (snd q).
Definition weight_point_31 (p : point_31) : nat := x_31 p + y_31 p.
Definition weight_pair_31 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_31 : forall p : point_31, from_pair_31 (to_pair_31 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_31 : forall q : nat * nat, to_pair_31 (from_pair_31 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_31 : forall p : point_31, weight_pair_31 (to_pair_31 p) = weight_point_31 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_031.

