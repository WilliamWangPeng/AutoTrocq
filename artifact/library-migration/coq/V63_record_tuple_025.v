(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_025.
Record point_25 := mkPoint_25 { x_25 : nat; y_25 : nat }.

Definition to_pair_25 (p : point_25) : nat * nat := (x_25 p, y_25 p).
Definition from_pair_25 (q : nat * nat) : point_25 := mkPoint_25 (fst q) (snd q).
Definition weight_point_25 (p : point_25) : nat := x_25 p + y_25 p.
Definition weight_pair_25 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_25 : forall p : point_25, from_pair_25 (to_pair_25 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_25 : forall q : nat * nat, to_pair_25 (from_pair_25 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_25 : forall p : point_25, weight_pair_25 (to_pair_25 p) = weight_point_25 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_025.

