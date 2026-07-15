(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_064.
Record point_64 := mkPoint_64 { x_64 : nat; y_64 : nat }.

Definition to_pair_64 (p : point_64) : nat * nat := (x_64 p, y_64 p).
Definition from_pair_64 (q : nat * nat) : point_64 := mkPoint_64 (fst q) (snd q).
Definition weight_point_64 (p : point_64) : nat := x_64 p + y_64 p.
Definition weight_pair_64 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_64 : forall p : point_64, from_pair_64 (to_pair_64 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_64 : forall q : nat * nat, to_pair_64 (from_pair_64 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_64 : forall p : point_64, weight_pair_64 (to_pair_64 p) = weight_point_64 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_064.

